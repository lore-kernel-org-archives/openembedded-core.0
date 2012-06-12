Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY0F-0002Tp-Gl
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:51 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7F8652FD1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:13 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:43 -0700
Message-Id: <4d2ff0a69692f54313ffa9dc83d0e4a2ddba47c3.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7F8652FD1D.24FC0
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 12/16] beecrypt: disable java
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:51 -0000

From: Jesse Zhang <sen.zhang@windriver.com>

If java is installed on host, beecrypt will attempt to use it.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 2913b46..2b2b348 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
 
 DEPENDS = "icu"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools multilib_header
 acpaths=""
@@ -26,7 +26,7 @@ do_install_append() {
 	oe_multilib_header beecrypt/gnu.h
 }
 
-EXTRA_OECONF="--without-python --enable-shared --enable-static --disable-openmp"
+EXTRA_OECONF="--without-python --enable-shared --enable-static --disable-openmp --with-java=no"
 
 FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
 FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la"
-- 
1.7.9.5



