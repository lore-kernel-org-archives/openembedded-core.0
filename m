Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.162.1617899529728785775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=la1QmnaD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id s16-20020a0568301490b02901b83efc84a0so2844846otq.10
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=goXltlZs5IxfLWbnfJIPvAvLppoJCHPXueeTBKzU7Vk=;
        b=la1QmnaD1Uetc2Ys1a8mKUSSUedFnudY9/dsanDVr1uu5PoboWifc/vP3kA94CyCqZ
         hjIUHnulLtAQ/Jzdpn/e+eKuEAmpbAg4GPLbNAQhavektL0PWLpOoP2lVDeylxk8L14A
         kNHr7PwM3ubN75fPAJJ3KZnCVbDU7BX7BNXNpGcKJYCyEpf/urPmRMIvzWsi7dqsPqJX
         bmWgxp/5OTyzYLpS/nj6h/JYT5ujY7f3vD2Qi/o7uA90l9WKHpNzBqxar8r51rPBu/ds
         f7zBVDDDrhlu9GzZ+KR6hfobgl5bL/j2u8hmzkgZjhLbb4ujOXKUipitlL8eBubS1mnk
         oTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=goXltlZs5IxfLWbnfJIPvAvLppoJCHPXueeTBKzU7Vk=;
        b=KnrjwesO9/RwkQTzEd/CGrYZH6hTojxW+qjoTchsjfyglOFz0Q+8f3lOuABS8zOwNP
         /KnQIdfYuRtFh6wXdXMfzm/Xtp5q1LF1VJAo7ANd1XUYb4UN1Z25EzsEcsz6dfxs68dX
         DQ35At8191KPdlVNVy3oY99W3Yb3d5FCnHNmY48ozxjgBUKuK2C18Pm0PPXM2ufu0UuL
         VjUccd/JpEYOHf5QCcV/m66200GRvdgx7afgYzULcxkOgRYQ1GkVAQaVuVf9Cw+HiYw4
         BdvDhrxR22Z+7uQ4FUplrUN374TZlCUnOrVXQKtdyTa+QZvQ4KiOgzn9PvOljTWs6kFX
         1yPg==
X-Gm-Message-State: AOAM533BCMkCOMxnzb9/iMhOxXo6Y9VOg2SifnKrrrbgcmSfD6jYB0/b
	jvbumPd7ZUvL7TxKARZQYIm6tmz4WLlUxqEzGkE=
X-Google-Smtp-Source: ABdhPJx1yVxqdF8XLhtd5ujB6MNAPMDUJVefOZsCJlheoK04yxn97OB2GuHv8wftu3DtLfcUX0CO9w==
X-Received: by 2002:a9d:6c2:: with SMTP id 60mr8550623otx.89.1617899528656;
        Thu, 08 Apr 2021 09:32:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.32.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:32:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] diffoscope: Upgrade 136 -> 168
Date: Thu,  8 Apr 2021 06:31:06 -1000
Message-Id: <e7ef1854677e7872f71c16cf6eeed4b0900a5be1.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Needed to support reproducible build testing on autobuilder

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{diffoscope_136.bb => diffoscope_168.bb}      | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_136.bb => diffoscope_168.bb} (46%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_136.bb b/meta/recipes-support/diffoscope/diffoscope_168.bb
similarity index 46%
rename from meta/recipes-support/diffoscope/diffoscope_136.bb
rename to meta/recipes-support/diffoscope/diffoscope_168.bb
index e699d15e90..00a8195c84 100644
--- a/meta/recipes-support/diffoscope/diffoscope_136.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_168.bb
@@ -1,10 +1,5 @@
 SUMMARY = "in-depth comparison of files, archives, and directories"
-DESCRIPTION = "Tries to get to the bottom of what makes files or directories \
-different. It will recursively unpack archives of many kinds and transform \
-various binary formats into more human-readable form to compare them. \
-It can compare two tarballs, ISO images, or PDF just as easily."
 HOMEPAGE = "https://diffoscope.org/"
-BUGTRACKER = "https://salsa.debian.org/reproducible-builds/diffoscope/-/issues"
 LICENSE = "GPL-3.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -12,12 +7,18 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "c84d8d308a40176ba2f5dc4abdbf6f73"
-SRC_URI[sha256sum] = "0d6486d6eb6e0445ba21fee2e8bdd3a366ce786bfac98e00e5a95038b7815f15"
+SRC_URI[sha256sum] = "c6f1dc3e75b7e2e5ceac4f857fbd2ee0ddb3f0169c2b39ea9187af34208e98de"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
 # Dependencies don't build for musl
 COMPATIBLE_HOST_libc-musl = 'null'
 
+do_install_append_class-native() {
+	create_wrapper ${D}${bindir}/diffoscope \
+		MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+		RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+		RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE}
+}
+
 BBCLASSEXTEND = "native"
-- 
2.25.1

