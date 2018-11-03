Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 193F479F6B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:21 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 01E8CFF804;
	Sat,  3 Nov 2018 16:45:20 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:19 -0700
Message-Id: <20181103164427.16125-18-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 17/25] openssl_1.0: drop unmaintained darwin support
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:22 -0000

From: Andre McCurdy <armccurdy@gmail.com>

The fact that the darwin support only appears to consider x86 (and
not x86_64) suggests that it's not maintained or tested. In general
oe-core doesn't support building on darwin.

(From OE-Core rev: 9c7f37bb1345c38211acd137c00b9d07f92601a7)

(From OE-Core rev: ebe53ed0e34b88c7d7fef22e1a5ad4959517fdab)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 0c0f015fa7..e2f6603ec4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -89,10 +89,6 @@ CFLAG += "-Wa,--noexecstack"
 
 CFLAG_append_class-native = " -fPIC"
 
-do_configure_prepend_darwin () {
-	sed -i -e '/version-script=openssl\.ld/d' Configure
-}
-
 do_configure () {
 	# The crypto_use_bigint patch means that perl's bignum module needs to be
 	# installed, but some distributions (for example Fedora 23) don't ship it by
@@ -184,9 +180,6 @@ do_configure () {
 	linux-sparc)
 		target=linux-sparcv8
 		;;
-	darwin-i386)
-		target=darwin-i386-cc
-		;;
 	esac
 
 	# inject machine-specific flags
-- 
2.18.1


