Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 669E27F9BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d73so3423988wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=AQw85h5mQz3N1EgbqI1Wex1QVG4TRTFLuumQnpSDHOUi2OuyK4M6+Idc23PDmXRxZO
	/qWLgTbtCNT3VAN7rcj1plBC/nUhOFzwwTBetwdXG/efWwh8y/AhAz+XKhcfKYA1yTgO
	3cdT+1SxwnG7motNS1iQ0XXLDpO7Po5CLYYc62PBUds5GBsoKdBJYUV1OKdvnsxfnOc/
	thPfoc/9zLYDhmAhL8/sByhBI2rvaFQAAwUgAhcWAkKbXHtFWBa1RjpQjk+RVX+A6wWm
	scxJBGgTPhScERCzohf2Nbd8DUV/IoU41JghtToZ5eqauZK90f3FGc/iVyHuG0hz62ky
	7XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=KpkVst34CNe7VYVyBGB5B7ld+CoJBErfkeZyafpOhR5eohvED1R1L9BYuVcserIAne
	My8TdaJSI43/IKyEoTPL/o4KuyEpNPq1W7bEut74iVSWZ/+alGqptRLJ4WCbz8Jvzf0d
	pSbVR1+DfwaM1/boP9R0OUswezS23PFHIsqAYKO+LYlZHmeH1PW47MAR50geBr40cDKF
	pzL2KVDcgL2MQ2JGtIwroN8ZbUQBt8JyZYof0dMigJoZv2Qy8S3w4FJ6Q7rl9K22nFO8
	f726xcQpha4QFhFr6PxKiou2JXX1/FWYxbkC/MGC5FjXcc7Ksw9My5cnHsP41w91GRSJ
	DRpg==
X-Gm-Message-State: APjAAAVT9rpzH3qx2LOm0MRDQF9kC+ycbgt68+7Uw+Ht246KquTfYGS1
	EdiPh4EnkS752TCRIYNKRRQ4iLhi
X-Google-Smtp-Source: APXvYqzHu2MpXKoMcm24UQj8BZKM3MXim56gBduRN2wcAwdvdPtSTmU0hPcYFqnwPjhencdQ3m4GbQ==
X-Received: by 2002:a05:600c:24b:: with SMTP id
	11mr8134930wmj.19.1576174488662; 
	Thu, 12 Dec 2019 10:14:48 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:11 +0100
Message-Id: <20191212181436.1322-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/30] gettext: fix failing ptests
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:48 -0000

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


