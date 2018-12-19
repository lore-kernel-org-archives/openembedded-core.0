Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8541460272
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 18:25:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y126so10208845pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S2vMdmkt004WQxMPh66wPfsIhwdNYukeIPJvxbMEFvQ=;
	b=aPudHS3wOF0d5CnxIHcgn5zQQfLzDY5GHS1+MW3S+7TUxEyfsUD40W70d2blNetj3j
	V/9CQly9HtdwVt5g7IlVxIHiSlRTROoWUT/rF0QR4OWK58now0nqe2kYXlrGPk4Bd6yQ
	08OQfmHOehpBTHqN2ghVWhC8d0402LgjE2DA4AEeNR6MjYfN6gaD0ALsUPYFOm5qm82l
	naVINiwIrcOSOOEXCZ/+6+a70L2MSRKlMr/gqhGJEZfBaMJscKGHVvOM5LfZDpzz7rJV
	UzoALaH4WMPs33ZhyyXERWQhN7tsu7dopz2KQ5ExBbEdSXEDQQ5tUVyq666k0JnOgJGm
	fYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S2vMdmkt004WQxMPh66wPfsIhwdNYukeIPJvxbMEFvQ=;
	b=fp2DGz5Ct+XlRH0SNX+ZRD6rgQAIo4ZN7gwgNJZvWrm46a9iHm+PZl2IgI1xSwNW7b
	uaZwVTlR4fMA7ychKIT5RFWv+TKBoDI+WxiYmWlnk3pa8RJVAON0uFWtaqwpkZH1j6H6
	+N7alxzYrqHra9ovq7uhYuOSm0pHjBe9RBpfM3AHa4Fl2/+QoaBt9Tg70RKPDj45+7UC
	OLFqgaJkw+mMCCDRK+chrZx8lRcHmqVLdq6iPJ39AVI+4cKu6B2JpyECBN7wufYZJP80
	2QW+o75Yx+CoTYUCZIY51lETACR0Nhicfwl5e39EHvWLChi2692EfRh3xlSE7gSYCtkW
	DzIw==
X-Gm-Message-State: AA+aEWbVHrFjfZw2c3N+NRC+PXDad80UJ91wS/1cIRteyAVOaoKob4OG
	FO+rVMQ6PqbTaJMT/3QiUA9sy743lbk=
X-Google-Smtp-Source: AFSGD/U+nDBCF1SIm8X4+myx5jgrpLIORgHhvFQQjs6zGMSukfRIaHGn5+/IS6LwxfKIXpZI0T/SIg==
X-Received: by 2002:a62:6e07:: with SMTP id j7mr22130849pfc.135.1545243909083; 
	Wed, 19 Dec 2018 10:25:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	r8sm23034004pgr.48.2018.12.19.10.25.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 10:25:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 10:25:01 -0800
Message-Id: <20181219182501.12917-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gcc-runtime: Drop building libmpx
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
X-List-Received-Date: Wed, 19 Dec 2018 18:25:08 -0000
Content-Transfer-Encoding: 8bit

libmpx is not supported any longer and infact has been removed
completely from gcc-9, see

https://github.com/gcc-mirror/gcc/commit/1e42d5c637e1b1f65dfddd0923dfb25676bb56e5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 29 -----------------------
 1 file changed, 29 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 95153da20c..50ecc815a5 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -29,9 +29,6 @@ RUNTIMELIBSSP_mingw32 ?= "libssp"
 RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
-RUNTIMETARGET_append_x86 = " libmpx"
-RUNTIMETARGET_append_x86-64 = " libmpx"
-RUNTIMETARGET_remove_libc-musl = "libmpx"
 
 # libiberty
 # libmudflap
@@ -160,18 +157,6 @@ PACKAGES = "\
     libitm-dev \
     libitm-staticdev \
 "
-PACKAGES_append_x86 = "\
-    libmpx \
-    libmpx-dev \
-    libmpx-staticdev \
-"
-
-PACKAGES_append_x86-64 = "\
-    libmpx \
-    libmpx-dev \
-    libmpx-staticdev \
-"
-
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
 
@@ -274,17 +259,3 @@ FILES_libitm-dev = "\
 SUMMARY_libitm-dev = "GNU transactional memory support library - development files"
 FILES_libitm-staticdev = "${libdir}/libitm.a"
 SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
-
-
-FILES_libmpx = "${libdir}/libmpx.so.* ${libdir}/libmpxwrappers.so.*"
-SUMMARY_libmpx = "Intel Memory Protection Extension library"
-FILES_libmpx-dev = "\
-    ${libdir}/libmpxwrappers.so \
-    ${libdir}/libmpxwrappers.la \
-    ${libdir}/libmpx.so \
-    ${libdir}/libmpx.la \
-    ${libdir}/libmpx.spec \
-"
-SUMMARY_libmpx-dev = "Intel Memory Protection Extension library - development files"
-FILES_libmpx-staticdev = "${libdir}/libmpx.a ${libdir}/libmpxwrappers.a"
-SUMMARY_libmpx-staticdev = "Intel Memory Protection Extension library - static development files"
-- 
2.20.1


