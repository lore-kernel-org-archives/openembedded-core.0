Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4FC72D14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 19:05:15 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id l89so7511044qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 11:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gE66/RQlYOe2Y5pQ5dFWYdwAqbDcgegJ/Husjdr0abg=;
	b=tT9Hom4/lUgsZgeldryNhuFOCpDUzLgmYSWvXbBZEPBaOLqs0q4dxtmYiR9HZcXoEE
	ERiqfDooDzOvrZX0x9TfXAaXptYWu/I1Tk4osy8e9RxnerKvIyOpBlHENwCYSIuqUMf4
	GsGHSVh3OWzsSY31NwpGsBwWa6c+5PlCNCQJHgvqohIX1blXFZW3NXWFvd+GvebvGqEp
	e+wx6qyrnXQIfZNKV8p1P2pzsHxvQSNe/V/aqLhdaYv7eWkqHQMt9R6/LN5htOyTLgwV
	86nW/J/8zNDQTz9/NoP7CGoKMBq0qpDsFrSDeN1p40WIYJjQJF1xUnsmRZ7luU6dnYX8
	fQeA==
MIME-Version: 1.0
X-Received: by 10.140.41.113 with SMTP id y104mr15961049qgy.51.1422039915527; 
	Fri, 23 Jan 2015 11:05:15 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Fri, 23 Jan 2015 11:05:15 -0800 (PST)
Date: Fri, 23 Jan 2015 13:05:15 -0600
Message-ID: <CACS+7ZTOs5rFPB66YbJS1jNBd-hfd=jWQgkX0yGOYUDvVMGehg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] gcc-sanitizers: fix licensing
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
X-List-Received-Date: Fri, 23 Jan 2015 19:05:21 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

The sanitizer runtime library is dual-licensed under the NCSA
and MIT licenses.

Also make nativesdk-gcc-sanitizers use SDKGCCVERSION by default
instead of GCCVERSION

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/conf/distro/include/tcmode-default.inc  | 2 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc
b/meta/conf/distro/include/tcmode-default.inc
index ae6aaf3..7428aa9 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -39,7 +39,7 @@ PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-source ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${GCCVERSION}"
+PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 892dfe0..35c9247 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -1,5 +1,11 @@
 require gcc-configure-common.inc

+LICENSE = "NCSA | MIT"
+
+LIC_FILES_CHKSUM = "\
+    file://libsanitizer/LICENSE.TXT;md5=0249c37748936faf5b1efd5789587909 \
+"
+
 EXTRA_OECONF_PATHS = "\
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
-- 
2.1.0

