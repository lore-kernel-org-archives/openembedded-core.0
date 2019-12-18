Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E85897FED6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:06 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u2so2158839wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=Z8GJKP62Y9VKGSbsL30Kj7zzRPtPCG+LIOdDSduZR+To5ZvOojoQGAjJbwbAAG5xF2
	QLOTS2ESyPi8hvpXX+lT3xbfCM2q/99QM0GRAtQhH0jYWRDGIqO9b1zy9vwJfau7swTd
	YsEIjClsNOxa9Ts9+Nb+WyYNRzam5bQKMlLb7M0TZdeFPd+jwv3yVosFhNTXm2F21yst
	i7FW7X8dv8YHoV/EEha3V1RUN18CHumJueubi5DotMFddT5jmNPxt9VKTxyQe4urbYKH
	xHdT7LCcT4ExCncRCbrSem9t1trqLMW3f6tyZdFyrpBQRRXiGPiCBG2ULu22ov69o1iS
	hsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=t537Illit09ZSNKXUYNGswBpC6cREhR2PVf7hasphzJz2xzWnwyPTp45BWl9hzf1Wp
	MdlNT+DLmrU8ycSGBcHkpLjPXC85b44q2HdAsBWuUYmBT8J+HGL75r8o2VputaCq29nP
	zwROGUkhEx8oQjyy64fVTTQMLu3gd/dTiNEc+rzrv+9PyuIJWpXcR4uR30WLPGraAE8z
	iXYTO1a/4hHusFVfv18ISNj8mOGlkPCRvRIkWIduRVzLEOuSTxOPmdFTEPV3ZQw/yjQh
	JTyHahia2pqkyprFRyzfMbE72AA6TRkNpltjHadjedCwuus/v9Z6xrAeiY9lR2mxDkDx
	iAaw==
X-Gm-Message-State: APjAAAV280Ho47TpdYdsRakhaLjQbYg6J1NEtLIRWIDNOnuU5yQWfalF
	3nINeVFy66BvkXX6mK+P+jFnRqi8f68=
X-Google-Smtp-Source: APXvYqwCrUBBayFcq+kYjhwdVJR7ZSHyCiyeFqnHw6cMhdzGoRO1PVW6tizxutRIhJFFji/ByKYnfQ==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr3601562wmc.168.1576679887378; 
	Wed, 18 Dec 2019 06:38:07 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:37 +0100
Message-Id: <20191218143758.129308-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/25] gettext: fix failing ptests
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:07 -0000

Results:

pass 400
fail 0
skip 32

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.20.1.bb | 23 +++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.1.bb
index fc05ef2e0a3..a6fc2195685 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
@@ -44,6 +44,10 @@ EXTRA_OECONF += "--without-lispdir \
                 "
 EXTRA_OECONF_append_class-target = " \
                  --with-bisonlocaledir=${datadir}/locale \
+                 gt_cv_locale_fr_utf8=fr_FR \
+                 gt_cv_locale_fr=fr_FR.ISO-8859-1 \
+                 gt_cv_locale_de_utf8=de_DE \
+                 gt_cv_locale_de=de_DE.ISO-8859-1 \
 "
 
 PACKAGECONFIG ??= "croco glib libxml"
@@ -143,13 +147,17 @@ do_install_ptest() {
         mkdir -p                                        ${D}${PTEST_PATH}/src
         mkdir -p                                        ${D}${PTEST_PATH}/po
         mkdir -p                                        ${D}${PTEST_PATH}/misc
+        mkdir -p                                        ${D}${PTEST_PATH}/its
+        mkdir -p                                        ${D}${PTEST_PATH}/styles
+        cp -rf ${S}/gettext-tools/its/*                 ${D}${PTEST_PATH}/its
+        cp -rf ${S}/gettext-tools/styles/*              ${D}${PTEST_PATH}/styles
         cp -rf ${S}/gettext-tools/tests/*               ${D}${PTEST_PATH}/tests
         cp -rf ${B}/gettext-tools/tests/.libs/*         ${D}${PTEST_PATH}/tests
         cp -rf ${B}/gettext-runtime/intl/.libs/libgnuintl.so.8*         ${D}${libdir}/
         cp -rf ${B}/gettext-tools/tests/Makefile        ${D}${PTEST_PATH}/tests
+        cp -rf ${B}/gettext-tools/tests/init-env        ${D}${PTEST_PATH}/tests
         sed -i '/^Makefile:/c Makefile:'                ${D}${PTEST_PATH}/tests/Makefile
-        sed -i -e 's:CONFIG_SHELL=.*:& LOCALE_FR='fr_FR.iso88591' LOCALE_FR_UTF8='fr_FR.utf8' LOCALE_JA='ja_JP.eucjp':g' \
-            -e 's:lang-c lang-c++:lang-c++:g' ${D}${PTEST_PATH}/tests/Makefile
+        sed -i -e 's:lang-c lang-c++:lang-c++:g'        ${D}${PTEST_PATH}/tests/Makefile
         install ${S}/gettext-tools/src/msgunfmt.tcl     ${D}${PTEST_PATH}/src
         install ${S}/gettext-tools/src/project-id       ${D}${PTEST_PATH}/src
         install ${B}/gettext-runtime/src/gettext.sh     ${D}${PTEST_PATH}/src
@@ -177,8 +185,19 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
     glibc-gconv-koi8-r \
     glibc-gconv-iso8859-2 \
     glibc-charmap-iso-8859-2 \
+    glibc-gconv-iso8859-1 \
+    glibc-charmap-iso-8859-1 \
     glibc-gconv-euc-kr \
     glibc-charmap-euc-kr \
+    glibc-gconv-euc-jp \
+    glibc-charmap-euc-jp \
+    locale-base-de-de \
+    locale-base-fr-fr \
+"
+
+RRECOMMENDS_${PN}-ptest_append_libc-glibc = "\
+    locale-base-de-de.iso-8859-1 \
+    locale-base-fr-fr.iso-8859-1 \
 "
 
 INSANE_SKIP_${PN}-ptest += "ldflags"
-- 
2.17.1


