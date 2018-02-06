Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 30A0E784E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 12:00:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 143so3229983wma.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 04:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Cb+FJ7bDsO7A8LlDM/MYMvGMrwsNP3MkuNxUElUaIpk=;
	b=Jh2sQTdfCNeUK0/BGZFB72rUsDzvInErssGl5tCL7ttWDCx00+KGZ9Coc3acmuhJvf
	8qfliBNoJ5+PztRW7/NUZXM8XChC9xGDHi78NKpbBprv0ZRjx1gUxgkTNFwm2hQ1kPPB
	X5WL/q3WdEUfTQ7X9tbNi0kK4KJUA6wcGqmHPY7e4qFV8rqVt6LDL86JKwKhsfo0mHCk
	HqG4v5MeL/MFK1xt7jgdKQ+QJHXXKPgvJMzBVzQ6+mT1JaX1BzXYY/eircrkBYB8nCvb
	NvDQRZnpp7lciFOOFpVXnUnE6fFEakuHZXwr7vYJjzrDCWIxj2e97HHCcKD/K0bIlL1b
	ObnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Cb+FJ7bDsO7A8LlDM/MYMvGMrwsNP3MkuNxUElUaIpk=;
	b=i8hl8+MjIJSyLoNB//PAsBU3kWnXwUzjnuj2nGcq1VTSh/yZdzf0pnU3uMWFmx1/8p
	5cfiEjrZ7KlPAz9tv05b0tKGnP00GvZmuNxmjzOlZEF9VMLD2oTvWfMemFEPmFG0iU9O
	oJoAlymVpFplcIa3Vn++CdkcS8MVTI3Lv4zwRX6bYUtEPQdP4zKKX0zGHVKXS7+aigcu
	nIk5DmCWtz3365EUBA1H3MdrSqQgwM1o6zHgM/Rf377jC7DIFbJa55tkNaQG8ckxDfPW
	3Mi2DEsYWEB4v0dlnQGabadg5NX1CCPVi4+JsxX9t6rZgZusAvYVcEkhqGe6EpHa2KN+
	AtWw==
X-Gm-Message-State: APf1xPDhPTZ3ayomwoKaUxwWb4NzX3lLkQqdARaFVRD0Nefp24pxN3XO
	T0aS1EvMv/eqG+sXpEXr8Fct39a0
X-Google-Smtp-Source: AH8x224OsIk/+ekoYehqoxY8cp1h2DXuap/v2QCKTS2KLPfd/4jVlQnvuwz0BGxsnVT9UpvisQmoOg==
X-Received: by 10.28.49.212 with SMTP id x203mr1616787wmx.28.1517918419387;
	Tue, 06 Feb 2018 04:00:19 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 7sm8327657wmq.42.2018.02.06.04.00.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Feb 2018 04:00:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 11:59:51 +0000
Message-Id: <20180206115954.1780-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] expat: merge bb and inc
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
X-List-Received-Date: Tue, 06 Feb 2018 12:00:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/expat/expat.inc      | 25 -------------------------
 meta/recipes-core/expat/expat_2.2.5.bb | 28 +++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat.inc

diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
deleted file mode 100644
index 0ee6c276d99..00000000000
--- a/meta/recipes-core/expat/expat.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A stream-oriented XML parser library"
-DESCRIPTION = "Expat is an XML parser library written in C. It is a stream-oriented parser in which an application registers handlers for things the parser might find in the XML document (like start tags)"
-HOMEPAGE = "http://expat.sourceforge.net/"
-SECTION = "libs"
-LICENSE = "MIT"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
-           file://autotools.patch \
-           file://libtool-tag.patch \
-	  "
-
-SRC_URI_append_class-native = " file://no_getrandom.patch"
-
-inherit autotools lib_package
-
-# This package uses an archive format known to have issue with some
-# versions of gzip
-DEPENDS += "pigz-native"
-do_unpack[depends] += "pigz-native:do_populate_sysroot"
-
-do_configure_prepend () {
-	rm -f ${S}/conftools/libtool.m4
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/expat/expat_2.2.5.bb b/meta/recipes-core/expat/expat_2.2.5.bb
index 337287b93bc..f7a5b36ac74 100644
--- a/meta/recipes-core/expat/expat_2.2.5.bb
+++ b/meta/recipes-core/expat/expat_2.2.5.bb
@@ -1,4 +1,30 @@
-require expat.inc
+SUMMARY = "A stream-oriented XML parser library"
+DESCRIPTION = "Expat is an XML parser library written in C. It is a stream-oriented parser in which an application registers handlers for things the parser might find in the XML document (like start tags)"
+HOMEPAGE = "http://expat.sourceforge.net/"
+SECTION = "libs"
+LICENSE = "MIT"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
+           file://autotools.patch \
+           file://libtool-tag.patch \
+	  "
+
+SRC_URI_append_class-native = " file://no_getrandom.patch"
+
 SRC_URI[md5sum] = "789e297f547980fc9ecc036f9a070d49"
 SRC_URI[sha256sum] = "d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6"
+
+inherit autotools lib_package
+
+# This package uses an archive format known to have issue with some
+# versions of gzip
+DEPENDS += "pigz-native"
+do_unpack[depends] += "pigz-native:do_populate_sysroot"
+
+do_configure_prepend () {
+	rm -f ${S}/conftools/libtool.m4
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


