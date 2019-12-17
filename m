Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4687F88E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 16:00:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so7687878wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=OfVxrxULfDrIS7YI8/1Zeo8CU3DxylDerbQG8Ga5AeNerD2xYwiv03bpvLxrag1kjE
	imZ4CRe6ZLy/KmVsQO2YeTH1A92By1ofJfyLmVAZviR/yyrCSOF7nBja7Ti/BTRzuqsP
	fKreAOmaWksPSsCvvjo4M3nw0RTze7bA6+R/daDpkooW86W3y0rBX6+gCIU+1vMrG3FD
	XATkF2gJqhiVcUoIWb9LilA5o2ZtowkYrGtfDJS+u6US7ZEeU0UOegesGd1pFWmoGbFK
	KqbnDvTvpibA0C37xiul1lRf2a7DgyUZ+cEQO9gJyl7CD0A0tI4JrvGvpenx/eR7SPXh
	7YRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=d5JAyXDdCvypWn6JtKuYz2knq9h2kMZPaqbXopARqkBhwNGOkoj6vWE8ATXMJ9BHAj
	bFLqrjCN2ImGMEOGO9Svc/er8e9eBlTnlu1D1GLJx0387BQyhRpDfDSHAJKVCz0OlwRx
	3SED/f2AuFmHHBpQiomawmn/cYnuf8bi8dAU+RQhyi25Tac7q9SkLdY1IV5ZCs8Ffmuc
	HFX6om46oz5cqeM5TKEdAoTT7jV+1nXVK3lhf4e3InpWomB4e8tucknSgx2b5e3MoT9d
	T7ihPvg7LIw1d7dJ6EdbuPa1NKp6dsk3cMCkiEC88g23TZsDKioXm3IYhxwz2apJZJYB
	MEDg==
X-Gm-Message-State: APjAAAXNfCzTwHaGIpkECSikAjQeDzQ6AQQKk06HeKnba+H7aTtH6FDn
	xsNWUXgN90TPgfzKwsb9OAJVRZDXAtQ=
X-Google-Smtp-Source: APXvYqy3Y51kv5g8yDeUTa69HwC2G8KrAr1jAqZixFjnAGbRW4nV+UkhbAIW2UH6EhTRolzA/doEGw==
X-Received: by 2002:adf:e74f:: with SMTP id c15mr39387819wrn.274.1576598422806;
	Tue, 17 Dec 2019 08:00:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v62sm3451864wmg.3.2019.12.17.08.00.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 08:00:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 17:00:11 +0100
Message-Id: <20191217160012.42152-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217160012.42152-1-alex.kanavin@gmail.com>
References: <20191217160012.42152-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] gettext: fix failing ptests
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
X-List-Received-Date: Tue, 17 Dec 2019 16:00:22 -0000

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


