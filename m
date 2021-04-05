Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.5922.1617634471330306338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hrc1znbP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id l1so5769411plg.12
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=goXltlZs5IxfLWbnfJIPvAvLppoJCHPXueeTBKzU7Vk=;
        b=hrc1znbPibHXfgjU8gk2+ei/x+L45aqK8vOaOALPXluEr9utvJrBQaNvyjydwqPIye
         IhS3OTIDEUwplFkDCB13v8c9Iq+r2FY0liXw/MFaHKw7/1PPnfqdISS+BjKamnwiCXpY
         mbyGUQnwqhfmfnztajIm9OEL+1OijLcg115NpLBkFD1+bm+5advau7IIVbpNfLEOSZ9X
         JZX1UnO63c9AdbekBo6aTQxuyd1PQ9gW7z/QXyNKli6huA/leXyHVO5xESTfTAjXpaOd
         zF6QT5tLU8VHg9+0RW1A4OBqj1slfU6rSnqx21KWxRCwcT/lDbd4rns60YNFDF/M6lYo
         TqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=goXltlZs5IxfLWbnfJIPvAvLppoJCHPXueeTBKzU7Vk=;
        b=JEHbwkjhzXRQqpQHM0OmA10p6lsQAMDkLuZq1xa8UjH8AedWpuG5sZ5/YC9CJVvH0B
         ISbUHeTOh6+qRoQNpoo8jIZfjmGMRhPg+WjKHW+i4qwqM2EquuVmOkUwxgwOgEyf5RO6
         9T1HxXc/EeCy3DeShaaS965SoMDHrPw5UwSRlOOhZHVbk6WxluAb37zHEUHTP0hT3diK
         CwdbOLrccKTx1CJ5yAN95Tn023K8xgMGPrR1psO6WKosdqGBAphc8ZgHQhjYurAvxDLu
         rWWb4R91uWYT1TxGp93CzmHU0fiLNc+WKbluaEFAhzveYQyjiQMRJNfFHo2qG3YzOsfN
         cyfQ==
X-Gm-Message-State: AOAM533SO0X643ZNXRumeBKsYyYg3H3WASqPeKYdIYaQHfaOqwxbhKkA
	bAM2SgPNPS3co18dDkUl0V113RNXwlnrQKNRaiE=
X-Google-Smtp-Source: ABdhPJz160p8rlwCbCSIO5ZEiyR8OtH9Yy1E/y3ATCAZWRvW71r1+T/hgjD1tmnCVM9gfw47CvtWfw==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id lb12mr26968417pjb.133.1617634470490;
        Mon, 05 Apr 2021 07:54:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g3sm15427734pfk.186.2021.04.05.07.54.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] diffoscope: Upgrade 136 -> 168
Date: Mon,  5 Apr 2021 04:53:32 -1000
Message-Id: <e7ef1854677e7872f71c16cf6eeed4b0900a5be1.1617633691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617633691.git.steve@sakoman.com>
References: <cover.1617633691.git.steve@sakoman.com>
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

