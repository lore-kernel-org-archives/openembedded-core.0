Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
	[209.85.219.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4598E7C1AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:32 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id i6so2454088ybo.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TNNNtTQYjG8ywRipRcOlQh77f7CO0qUblHNL/q9iozI=;
	b=XxznHJS+m42mrb6PvAnOaUG0YSCB25R/D0WRaEf5kZIszl+n28RnWlUJrXuSMwDhXn
	b9+uZkrv6ifDnpIg7jrAUT1wlxwBVYsTFbGeHB8ycbcvzqHzIqm73eVKYfTBZDw6dapw
	L1VodhZI32iodv7OJdrO9bXHOjSQQI0H3Vcx1141BM27Yxkhaj3sVqqJ5ZYa2Tf5eZfR
	/1je5DAwrjJl0lnnE9A4W8nqIjgggttu8MxHbcdrHvu9l6OatMHL1D1mUGmX2gvH3Z3d
	XQdq3OkzPccmOrUEaXA6xb/PtmQr3Cn5y+x5swdMT6D0P6p6KOmaiX4owgPQsGCxI9X9
	J+CA==
X-Gm-Message-State: AJcUukc+OgH1ykpp0dj+hhCzuplc/UUI2oKdK+JooTlSjjecjRFz/UB3
	HGMmYv1r44eLpnbnMIvRkwajQ9GO
X-Google-Smtp-Source: ALg8bN5i8cwwMl45Bkg5zDR2WT8TM4A4unKbj0VrBkniXKcMg5I0vwFqtOn0k9pFE3e+lHap8IRMiQ==
X-Received: by 2002:a25:c651:: with SMTP id k78mr7445100ybf.16.1547643093122; 
	Wed, 16 Jan 2019 04:51:33 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:32 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:13 +0000
Message-Id: <20190116125124.20177-5-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 04/15] util-linux: be more explicit about what files go into packages
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:32 -0000
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


