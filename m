Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 824B47FEBE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:29 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id d73so2491161wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uKxFSGLVjkmAXEHpVLiQ2F+C1ykw/Kb65fP9T1R8ogA=;
	b=gHYb1WGdn7GTRKZy4jjiF1XBqIA5MLFA3upK1E8pjM41JcG/15eWRPW8QUPjZcQ5we
	CKDHIukoSxxnqdrhgmIkXH2/lGGEdZyVkO6WmZJi7EbYCkdc9Mwo5nVuZwAuACzcy421
	oiYD6TemIDU1X6cgvgsGorAeOnhmom/XqQFwgx0P/eZ/Z5fRrz102BIWzeMnaD/1rr91
	9DXCEKxZgHHTzuAsmtOd+Ft0KLZgASxiPz1z7mrD87yN4GTNzwF2SF81D9uRRWVHRNHa
	PECG/CwYt26K8UEfybOcE4uvGCix2+o+kx3hjOr552UkYW7/RSjVATCF7ajLvw/yd+kO
	d4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uKxFSGLVjkmAXEHpVLiQ2F+C1ykw/Kb65fP9T1R8ogA=;
	b=D1Shpc50o3aKFhO7E6bUe2qhtFoXSqm61odp43uNeiX39SRg0TQcOoCMGWjP4wSMoI
	Xo3utXwt+0TETKbYLOomfXbheJZ2rLCox6BHiP3yA884agKmkbfr6fs10RXlRE7s7308
	7fj6oVZKFJXCqb+rRx1Q5wzjwR3/YE5iQQJq383N33TtHTMAsTIyZ8SoCq+1IvtesDME
	ZnwVd6jZ6fdP203x4wMciGRgfv9MBNxhFkXGS/Jh/5QHupPnyFgonPQdp4sAsEt3l8XH
	yVocDtAiDfIX7d4e41N0iqpReXOkOuqcZX79NreMw78AKaHTinp6mvKgkDbAo8DT4oU2
	r69Q==
X-Gm-Message-State: APjAAAU04X9M4slG2rsUNPP42fp67dvyV83XHn2+4hphzxbUKOo73vGJ
	d/0XgtO74vyiXmaer1Avc1Devhb2HVU=
X-Google-Smtp-Source: APXvYqzMDnRGQNT7hh5n+yllc05Je8DOFd/urXYHf+zjVHGVtwv5d4/y1oKyyDzUSJdG/ScTVBRcog==
X-Received: by 2002:a7b:c949:: with SMTP id i9mr3900177wml.131.1578490110039; 
	Wed, 08 Jan 2020 05:28:30 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:54 +0100
Message-Id: <20200108132759.95603-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 23/28] gettext: additional ptest fixing
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:29 -0000

In previous testing some tests were skipped due to missing autotools;
when autotools are present on target, additional failures are exposed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch | 26 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.20.1.bb   |  5 ++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
new file mode 100644
index 00000000000..96e5bf380fa
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
@@ -0,0 +1,26 @@
+From 38b256e5aa7dfeb42acffd89565e53a2c0bab3e3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 7 Jan 2020 16:44:38 +0100
+Subject: [PATCH] tests/autopoint-3: unset MAKEFLAGS
+
+This is needed when running ptests, as the MAKEFLAGS value (set up by run-ptest)
+is messing up the test.
+
+Upstream-Status: Inapppropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gettext-tools/tests/autopoint-3 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gettext-tools/tests/autopoint-3 b/gettext-tools/tests/autopoint-3
+index e13552b..55188df 100755
+--- a/gettext-tools/tests/autopoint-3
++++ b/gettext-tools/tests/autopoint-3
+@@ -126,6 +126,7 @@ test $? = 0 || { cat autopoint.err; Exit 1; }
+ ${CONFIG_SHELL} ./configure >/dev/null 2>autpoint.err
+ test $? = 0 || { cat autopoint.err; Exit 1; }
+ 
++unset MAKEFLAGS
+ ${MAKE} >/dev/null 2>autopoint.err
+ test $? = 0 || { cat autopoint.err; Exit 1; }
+ 
diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.1.bb
index ca155fe8bf8..09628bc4a3b 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://run-ptest \
            file://serial-tests-config.patch \
            file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
+           file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            "
 
 SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
@@ -150,8 +151,12 @@ do_install_ptest() {
         mkdir -p                                        ${D}${PTEST_PATH}/misc
         mkdir -p                                        ${D}${PTEST_PATH}/its
         mkdir -p                                        ${D}${PTEST_PATH}/styles
+        mkdir -p                                        ${D}${PTEST_PATH}/gnulib-lib
+        mkdir -p                                        ${D}${PTEST_PATH}/examples
         cp -rf ${S}/gettext-tools/its/*                 ${D}${PTEST_PATH}/its
         cp -rf ${S}/gettext-tools/styles/*              ${D}${PTEST_PATH}/styles
+        cp -rf ${S}/gettext-tools/gnulib-lib/gettext.h  ${D}${PTEST_PATH}/gnulib-lib
+        cp -rf ${S}/gettext-tools/examples/hello-c      ${D}${PTEST_PATH}/examples
         cp -rf ${S}/gettext-tools/tests/*               ${D}${PTEST_PATH}/tests
         cp -rf ${B}/gettext-tools/tests/.libs/*         ${D}${PTEST_PATH}/tests
         cp -rf ${B}/gettext-runtime/intl/.libs/libgnuintl.so.8*         ${D}${libdir}/
-- 
2.17.1


