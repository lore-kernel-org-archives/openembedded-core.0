Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id B5E9B7BFFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g22so1656095edr.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TNNNtTQYjG8ywRipRcOlQh77f7CO0qUblHNL/q9iozI=;
	b=Rqx+MYcyg24EbXy3rLy4ml/IZlxxZcJh3uvC4EsMVQ//TmELquILarxwR6UqSaQNjm
	fUGCQRkag/to73lGGd4PB0fx9nvn0q2EfGM7ZL4sZexf7vMFGtVOOjWM0LdUKKM/rk9E
	JibmdxSHaE2n+cX5HRQ7UMAqhUZxkql8orpYZdwjbKRJ3hTz8zpaSbaDiVYP+w0lidxW
	wyJitonnvSM9xiHEjbmI8C0jAklg7y7hUWvlLpZOGJXyXknN5jiE1cS2nFtgsqkDtcug
	9KSzhrwyrBgNelFFaRzIgHsG9VennJ27I1bQJB2OYXdP2V3nbnLHPsgyflYSH1cGJMnR
	PJpA==
X-Gm-Message-State: AHQUAuZ6lwde0Ho0hpW40mwnOilJU+ozBPUlp3wbSW3EPFCQwqf6+fJQ
	+MVsxew+8AABgnipflMlJb9HEP/V
X-Google-Smtp-Source: AHgI3Ia0oTwD+vZ/rfZoEZGp7VFPiJt8/x60akVD/KdaPAjlC64y+v8WDUuzJ15GZ+57LmO8SQITuQ==
X-Received: by 2002:a17:906:e96:: with SMTP id
	p22mr1677303ejf.109.1549333967177; 
	Mon, 04 Feb 2019 18:32:47 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:46 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:30 +0000
Message-Id: <20190205023241.29707-3-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 02/13] util-linux: be more explicit about what files go into packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2019 02:32:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Just using a wildcard leaves the reader wondering
what is meant here.

By being explicit we can describe exactly what is
intended, i.e. the file name as resulting from
the ALTERNATIVE and ALTERNATIVE_LINK_NAME mechanism.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 406af58502..e479fc24e1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -88,7 +88,7 @@ FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
 FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
-FILES_util-linux-rfkill = "${sbindir}/rfkill*"
+FILES_util-linux-rfkill = "${sbindir}/rfkill.${BPN}"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
@@ -105,20 +105,20 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
 FILES_util-linux-lsblk = "${bindir}/lsblk"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-fsck = "${base_sbindir}/fsck*"
+FILES_util-linux-fsck = "${base_sbindir}/fsck.${BPN}"
 FILES_util-linux-mkfs = "${sbindir}/mkfs"
 
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
-FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
+FILES_util-linux-sulogin = "${base_sbindir}/sulogin.${BPN}"
 FILES_util-linux-mountpoint = "${base_bindir}/mountpoint.${BPN}"
 
 FILES_util-linux-switch-root = "${base_sbindir}/switch_root.${BPN}"
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
-FILES_util-linux-blkid = "${base_sbindir}/blkid*"
+FILES_util-linux-blkid = "${base_sbindir}/blkid.${BPN}"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-- 
2.20.1


