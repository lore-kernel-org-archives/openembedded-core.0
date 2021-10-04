Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B52C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.10158.1633357265761268183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=I6UoxxKI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so115389pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7flBLORNRN3Q/6E1coGzZC5YxvcttmJq10aPiHwTlCc=;
        b=I6UoxxKIMHEAyAshdrgwrnQKvVwdOQt/X6M7DXmP62bz84xMbIFO1hNavj5A+kn/A1
         i6FWwmpCctyBaS8kDOPv1xuXrr9KqJcjW8qz5auvTKc/RiSY7MeEkdHDmIfIj/QoT9id
         lU9NlXz8g8NWJVU7/icVqjn/Zf/Vi5/+uuRsgAb2JK5RbhWN7ajNH8cIT4oeSeQQiN6s
         qCgwvJTaRUkdc5sgKoRJcdOl+rJ1cThzS43xCqeuWkQtIxZdsm1qZP6YdnlUSpnshrEj
         yOQqkbtZWELWXtdRCu2o4m+dz8sOt5k0fv3jAe8GZcDFzA0bpTYVXctg+zpNrOKH7G3+
         3XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7flBLORNRN3Q/6E1coGzZC5YxvcttmJq10aPiHwTlCc=;
        b=sGfna47xlj7O65DcEdhl3oetMpcrIVNdqqiCI4xJ7bBkVdMXapY+hHfTnSTvVddAb0
         o+ZMJmz/tpcgBOQKj8wrclhdRYZtdAP8CcuEK6B8SQ2BUbVwsrHH4CLu1PwU/iMjKmwE
         ztKrzNhyxysRdwzb3lEMtbjBWVHclqIRB68uSn8mmF0gmhJhjGoYyHC8FEEeHtiaD6j5
         ru9/s9P8iLoGnzFI2TmOd/OOfo69U285Yx63ddAdwUk02AqeFCDulSWlt6kbgNW0uV/5
         WAdq3YTemYMwfiXC3rvMjAlEKitdPkZrIvMImQJ87XGcZ35FRtZvFLtdepLnvltPxMPU
         F0Lg==
X-Gm-Message-State: AOAM530fz3fhKvNigafkN3gJ6TZiBAWHXlUmz+wG7ikvDGW0s8KVhePC
	4W4wiSaY1SflXzoxtJErt/RS42ZO4hjUNV/wOn0=
X-Google-Smtp-Source: 
 ABdhPJxSqNJZbjg8VUfltvZYVs4IY1wiuSRAg3cdqEvKUvwNl/JjvH3XCYSOaCtSDcfSlR/uAyVTcQ==
X-Received: by 2002:a17:90a:4a04:: with SMTP id
 e4mr30454429pjh.51.1633357264668;
        Mon, 04 Oct 2021 07:21:04 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/15] mtd-utils: upgrade 2.1.1 -> 2.1.2
Date: Mon,  4 Oct 2021 04:18:31 -1000
Message-Id: 
 <721a0e475d4ce5054a74e2a7408d49470264bd29.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156596

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Drop backported patch.

(cherry picked from commit e38fd1ac331d824b2db94a7ae46026b111257e83)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-utils-Fix-return-value-of-ubiformat.patch | 62 -------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  7 +--
 2 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
deleted file mode 100644
index d43f7e1a7a..0000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4d19bffcfd66e25d3ee74536ae2d2da7ad52e8e2 Mon Sep 17 00:00:00 2001
-From: Barry Grussling <barry@grussling.com>
-Date: Sun, 12 Jan 2020 12:33:32 -0800
-Subject: [PATCH] mtd-utils: Fix return value of ubiformat
-Organization: O.S. Systems Software LTDA.
-
-This changeset fixes a feature regression in ubiformat.  Older versions of
-ubiformat, when invoked with a flash-image, would return 0 in the case no error
-was encountered.  Upon upgrading to latest, it was discovered that ubiformat
-returned 255 even without encountering an error condition.
-
-This changeset corrects the above issue and causes ubiformat, when given an
-image file, to return 0 when no errors are detected.
-
-Tested by running through my loading scripts and verifying ubiformat returned
-0.
-
-Upstream-Status: Backport [2.1.2]
-
-Signed-off-by: Barry Grussling <barry@grussling.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- ubi-utils/ubiformat.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
-index a90627c..5377b12 100644
---- a/ubi-utils/ubiformat.c
-+++ b/ubi-utils/ubiformat.c
-@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	struct ubi_vtbl_record *vtbl;
- 	int eb1 = -1, eb2 = -1;
- 	long long ec1 = -1, ec2 = -1;
-+	int ret = -1;
- 
- 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
- 	write_size /= mtd->subpage_size;
-@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	if (!args.quiet && !args.verbose)
- 		printf("\n");
- 
--	if (novtbl)
-+	if (novtbl) {
-+		ret = 0;
- 		goto out_free;
-+	}
- 
- 	if (eb1 == -1 || eb2 == -1) {
- 		errmsg("no eraseblocks for volume table");
-@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 
- out_free:
- 	free(hdr);
--	return -1;
-+	return ret;
- }
- 
- int main(int argc, char * const argv[])
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 9c05dc03dc..55f05dc8f9 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,13 +11,12 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
-PV = "2.1.1"
+PV = "2.1.2"
 
-SRCREV = "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
+SRCREV = "7b986779342021bda87c04da3bf729718736d8ab"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-           file://0001-mtd-utils-Fix-return-value-of-ubiformat.patch \
-"
+           "
 
 S = "${WORKDIR}/git/"
 
-- 
2.25.1


