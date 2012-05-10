Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSbJ1-0003GW-O4
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:53:51 +0200
Received: by lags15 with SMTP id s15so1496610lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=f5bnACfcreTxFrjjvmwqH5qouDTsYOvMmzJiWnao+qM=;
	b=JO26o2aruMJmLWMTUwb3dPPVp+R0XsbYiHTK7M9F1mY4mfa6e4gtN5WqCtsAsCSc+z
	LZkTDTZCm8DvO/yzVUP/knJWzsohMc0FHDJI/yiRvZX/C6xcgxzWU4vsfNJs6wHHUW6k
	nqHDTcR0uQp0E53Hp97CgS8bMSdVVz8pwNLIOjA9FR/1DNR5ct3xbcnkKibjNbQ853yo
	zt/TwkbwJ0NhFT37vhI0NCR5jP+h4kRpRJY/7Ah5lqLjOSFzG5mmGzCjlN0f0Fw8dWon
	ImUeZ6G/LbcOOKleONW0WvzzS8OxEPptsNI7zaxMcNZHx+dEUMRs7qemjo+ihO1xqQul
	A+WA==
Received: by 10.152.146.163 with SMTP id td3mr5913979lab.25.1336686236996;
	Thu, 10 May 2012 14:43:56 -0700 (PDT)
Received: from alpha.cazfi.net (a91-153-5-101.elisa-laajakaista.fi.
	[91.153.5.101])
	by mx.google.com with ESMTPS id mg19sm7243611lab.8.2012.05.10.14.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 14:43:56 -0700 (PDT)
Received: from cazfi by alpha.cazfi.net with local (Exim 4.77)
	(envelope-from <cazfi74@gmail.com>)
	id 1SSb9N-0005bB-Q3; Fri, 11 May 2012 00:43:54 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 00:43:51 +0300
Message-Id: <1336686231-28111-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <CAMKF1srWO69M=MOa4_ar8oO55fkaofzSHj_UAsRaVL+-dzEXNw@mail.gmail.com>
References: <CAMKF1srWO69M=MOa4_ar8oO55fkaofzSHj_UAsRaVL+-dzEXNw@mail.gmail.com>
Subject: [PATCH] expat: update to upstream version 2.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 21:53:51 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../expat/{expat-2.0.1 => expat-2.1.0}/autotools.patch    |   13 ++++++++-----
 meta/recipes-core/expat/expat_2.0.1.bb                    |    6 ------
 meta/recipes-core/expat/expat_2.1.0.bb                    |    6 ++++++
 3 files changed, 14 insertions(+), 11 deletions(-)
 rename meta/recipes-core/expat/{expat-2.0.1 => expat-2.1.0}/autotools.patch (53%)
 delete mode 100644 meta/recipes-core/expat/expat_2.0.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.1.0.bb

diff --git a/meta/recipes-core/expat/expat-2.0.1/autotools.patch b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
similarity index 53%
rename from meta/recipes-core/expat/expat-2.0.1/autotools.patch
rename to meta/recipes-core/expat/expat-2.1.0/autotools.patch
index c0ac10b..0e59969 100644
--- a/meta/recipes-core/expat/expat-2.0.1/autotools.patch
+++ b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
@@ -6,14 +6,17 @@ Workaround specific to our build system.
 Signed-off-by: Kevin Tian <kevin.tian@intel.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-diff -bur expat-2.0.0~orig/configure.in expat-2.0.0/configure.in
---- expat-2.0.0~orig/configure.in	2006-01-10 19:10:46.000000000 -0600
-+++ expat-2.0.0/configure.in	2006-02-10 19:12:24.000000000 -0600
-@@ -50,9 +50,6 @@
+Updated to apply over expat 2.1.0
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
+--- expat-2.1.0/configure.in	2012-03-04 01:45:53.000000000 +0200
++++ expat-2.1.0/configure.in	2012-05-10 21:04:44.000000000 +0300
+@@ -51,8 +51,6 @@
  
  AC_CONFIG_HEADER(expat_config.h)
  
--sinclude(conftools/libtool.m4)
 -sinclude(conftools/ac_c_bigendian_cross.m4)
 -
  AC_LIBTOOL_WIN32_DLL
diff --git a/meta/recipes-core/expat/expat_2.0.1.bb b/meta/recipes-core/expat/expat_2.0.1.bb
deleted file mode 100644
index 30b5684..0000000
--- a/meta/recipes-core/expat/expat_2.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
-PR = "r1"
-
-SRC_URI[md5sum] = "ee8b492592568805593f81f8cdf2a04c"
-SRC_URI[sha256sum] = "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e765e3e983a2e5e93"
diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/expat/expat_2.1.0.bb
new file mode 100644
index 0000000..1ce1844
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.1.0.bb
@@ -0,0 +1,6 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
+PR = "r0"
+
+SRC_URI[md5sum] = "dd7dab7a5fea97d2a6a43f511449b7cd"
+SRC_URI[sha256sum] = "823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86"
-- 
1.7.10



