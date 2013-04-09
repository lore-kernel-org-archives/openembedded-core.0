Received: from mail-we0-f180.google.com ([74.125.82.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UPZfH-0003qe-16
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:36:55 +0200
Received: by mail-we0-f180.google.com with SMTP id r5so5328949wey.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=2/nMMuF8cpbf6De3sWzHPhGREBHOgQN+y0gph0eboLU=;
	b=bkqspP8OmTuThR9ruPDEK8VjMmU519HQiQH/ldQHVK4+2yJDiPV5LUQ1XvthZdh5n5
	KdnrZMMyGERR1w1m97P59IdvwmffbyHEwijGNeRD5WAVMIXF00/72g2XMjPomebhGS9P
	wgriKjnTC7JewR3H4IzSfwimCvkdf8rPFmA5DpcRq05s7io7aymphETfm2tpMYE7hpVs
	acMDtrvJKxf1WodpQjL8lYFnO7Pb6Wi5L4eRNoMe6MhlWFMiP2kdhSKnOsxwotHQw1vm
	ask78RoVRUx3Jr/18w0+XEJDBdluRkky36grndorgeIgmAoqKcFExI+sQz9zTxi6uHEZ
	mHzw==
X-Received: by 10.180.85.103 with SMTP id g7mr20100530wiz.23.1365517171125;
	Tue, 09 Apr 2013 07:19:31 -0700 (PDT)
Received: from quad.modzo.koansoftware.com
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id q13sm32961788wie.0.2013.04.09.07.19.29
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 07:19:30 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 16:22:10 +0200
Message-Id: <1365517330-31050-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.8.2.1
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [oe][meta-oe][PATCH 4/4] xmlto: added version 0.0.25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 14:36:57 -0000

 * Recipe from oe-classic
 * Required by xinput-calibrator

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 .../xmlto/xmlto-0.0.25/obsolete_automake_macros.patch  | 12 ++++++++++++
 meta/recipes-support/xmlto/xmlto_0.0.25.bb             | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/xmlto/xmlto_0.0.25.bb

diff --git a/meta/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch b/meta/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
new file mode 100644
index 0000000..faa8acc
--- /dev/null
+++ b/meta/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
@@ -0,0 +1,12 @@
+diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
+--- xmlto-0.0.25/configure.in	2011-12-01 17:49:00.000000000 +0200
++++ xmlto-0.0.25/configure.in	2013-01-07 05:24:16.169953519 +0200
+@@ -1,7 +1,7 @@
+ AC_INIT(xmlto, 0.0.25)
+ AC_CONFIG_SRCDIR(xmlto.spec.in)
+ AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_PROG_CC
+ AM_PROG_CC_C_O
diff --git a/meta/recipes-support/xmlto/xmlto_0.0.25.bb b/meta/recipes-support/xmlto/xmlto_0.0.25.bb
new file mode 100644
index 0000000..447c791
--- /dev/null
+++ b/meta/recipes-support/xmlto/xmlto_0.0.25.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "A shell-script tool for converting XML files to various formats" 
+HOMEPAGE = "https://fedorahosted.org/xmlto/" 
+SECTION = "docs/xmlto" 
+LICENSE = "GPLv2" 
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+PR = "r1"
+
+SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
+           file://obsolete_automake_macros.patch \
+"
+SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
+SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
+
+inherit autotools  
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.2.1



