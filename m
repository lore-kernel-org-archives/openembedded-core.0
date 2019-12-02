Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 87E237F2BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g206so240357wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=drdo183yuF5nzVqWSXjtFs8IUbEcDcXbUWHneVyobpozenoZ1CYVbFfuHQ57kjF0pE
	JS7FYFXGNFSrsz01lajUVRK/vEOnsgLka+EQ3A0OJKf99qyMDHu692NCiv1ZYgp8xxgb
	TU5thiVOgJTETXJ8PUK6mSCCulnPQewFH1BAdOfnaxA9Lx8zKKm5kvSqYuvwxf60KoqZ
	NSzKjbLxAVLMxTAoOsy0ArnFPe4BrMKnJzVp0Pt4KTND6lQWen3QzFFGzJeKJDmsEh3A
	i+bvyMX3oIM2CShCgYrKMppEuHfwa8eZOFqhlM6rfd7AkH74J5oZljp9KPyFnZg5aTik
	g0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S7y3a4neEKCcOHCjGyZ0EQLQ2Tk5YpxAA4vZl5FVsTQ=;
	b=m7QZpQJOR1XnG+6XGvPJdGZJI3wKyFBr57Q7TKPFuCCusNokiGDA/1xW91uoQ/8jaD
	NiRtm9ie2qfm9JLji+sZXDf4cAhAQ9cggI4MfJ1dxUaMi2veHjD8FAJf0Km0qIvZMTv3
	b55o9X4Scpn17b+FnH1XhC2acrDEkgWRe1nX3dmHpJd7CzYPswEukvBgNVy32vsw0Kb3
	3zijN+uVwKYGevZBYU1oMY19EN7llmiCGbbyVlJs5AjR/gaWbJKrB07be2Wg2pthKQ1W
	IKzxDii790p3HjP3kBjmuYNirt7hHOyuA5oOBQKoRobJZDPbSbhZSqAA+iW6uoCbmMq8
	Q0hw==
X-Gm-Message-State: APjAAAUQ90y23JOGAcLTwJu5Mcl7VPqeNRa7F4WxRoxOoKaWT546wi5S
	R62RoLn5drxbHaOMkEmysw4Xt87i
X-Google-Smtp-Source: APXvYqybepFnf9VJAnOT+YCxDhy/RfqTrNS1u/JpoNfYRQ8C6MCnL2UayDtAEdH1P6iPI1y4+P5yWg==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr29018598wmi.69.1575309314274; 
	Mon, 02 Dec 2019 09:55:14 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:51 +0100
Message-Id: <20191202175459.112655-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/18] gettext: fix failing ptests
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:14 -0000

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


