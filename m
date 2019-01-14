Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f49.google.com (mail-yw1-f49.google.com
	[209.85.161.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1EA7BFEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:44 +0000 (UTC)
Received: by mail-yw1-f49.google.com with SMTP id n21so8528334ywd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wkIuKG78jP5h3aDcGSthIVez0njExsSowRotBV7g1iI=;
	b=OEBeCpmbfcJksZOfzGeD3LpKXHt+Df51POLQLlA0KRjrXjal4MvfWz4IGs1PNC8pXW
	k0U49yZN+mCNIk5nyyp3LU2AwJXzKqkU6yv4UKSX0rAfTYR7RTvoisgLB+T4beah/DEL
	Y7TmYqlb1w83UlehDv1/ecsyO2jqxeOI0W+LWYRClmbotWMJILdiwTYTRzwy8HXazipw
	eh0eHCpfljWnHNbY4xay+e6I3Le+52vB/jqpaHJhgLhJMJrhy4LCoVYswy2Mim5fE1Qv
	C6WIibyvW49AXsKIyY1B7uVG7ZU769vgZ37z2s/2KoFhMf7ltuvrU4G2U2mspLgp84SY
	orQA==
X-Gm-Message-State: AJcUukeYu6N8ozoMTc9ctig338DMIT4Yd4vYknmPAmX6I5WZFcRC6FoT
	JgJHYqy3l6/MQPO/cQi5FTzFRGrm
X-Google-Smtp-Source: ALg8bN6q9qUtH0MDFF8zcOzCJ0zRZwqVxzKGH3v27Ae62aFce6HeLb8iHlY5vu2au1f0JX0c6Ar6zQ==
X-Received: by 2002:a81:6d57:: with SMTP id i84mr23932511ywc.292.1547470605097;
	Mon, 14 Jan 2019 04:56:45 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:44 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:24 +0000
Message-Id: <20190114125632.4780-5-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 04/12] util-linux: be more explicit about what files go into packages
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:44 -0000
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
index 8c8cbde8c2..79ab302e6a 100644
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


