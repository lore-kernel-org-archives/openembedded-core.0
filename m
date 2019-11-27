Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 720667FC5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w9so27523468wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=kF73ImIkVDi8iTLDOeKeG12AkLIbgTV9N8XEi2RJls9ooBpmpEaz/l1aZ/davEQtG/
	8HOOE1c5GtOz03CxAChKl98JIZk4+7ph+ZN3UUi/WmP0ki39CIIArrPo506kemPBn0Q3
	ORzuDNCd3ccYedFs5BFbuz2VUOcGe9RcxtQb4ADXuN3mBii90jRQw8hekCs7oVGh7OEL
	Cj0choWHbnNysihnrl+XBPZOscREkMPDQvpFDsxfZvXPnrUSBEHfgA08s9BOsQy1hKfO
	jIHHc2wjIVeA2oGxA/Dhn613gSB8XpmHnZqDb0g4am0yoe99CSRSh8NNTwTEQJzrlEP+
	XwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=ARLsh1LAE+d8QttXq97ITcQ7QPLheMDAIa1a+iHoBOJ+ZlTiUfUYMiyIpgbh64KJhn
	NkQlZIZ5ronMuuV5MW3Qabou0yHJ438GOZlKwCRvJ79vcvVgbFvyRI4quT0xaNjpKxLK
	fhCjA/ifkz80gxxnhKX+BZZ2fpM0PgXencV4+c0+058zCB/b2o12dYraUzfj7vt/jfeN
	Db8NIE5+O5nugu0AVgs1pEUTYtwxwJHEWYwaoaI3FEItHCC4XLV9rCrqMl4oW4OybINc
	J6eUexGdToP1u3negtt3vGIg2HCO6ub7Ctpw9cm27+EsRuepCG4yVaf+ZGadqB6pw2bX
	XXgw==
X-Gm-Message-State: APjAAAXf3xeixDqQ5YhFE71aJbwTrb6s3zz8Q1Jw8S6icXWOAZGDkRww
	/wOoeqpd/lQrZNKyHT7Vp+mMZTMq
X-Google-Smtp-Source: APXvYqyaaNHRIg3nvDOlKbKe/dIFlDM+wJm7BGtjx1XFQkPzG7KHvtTOE/gaQDKEnchE6VoX9I9gzw==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr44891384wro.392.1574872822121;
	Wed, 27 Nov 2019 08:40:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:40:03 +0100
Message-Id: <20191127164003.115980-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/14] gettext: fix failing ptests
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:22 -0000

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


