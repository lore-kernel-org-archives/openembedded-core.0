Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EAF6F60030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCWVFr004476 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:32:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d-Va7AodWeQK
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:32:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCWQX1004473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:32:27 +0100
Message-ID: <1408451546.1669.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 13:32:26 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf/debian.bbclass: Move AUTO_LIBNAME_PKGS definition to class file
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
X-List-Received-Date: Tue, 19 Aug 2014 12:32:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Might as well move this default to the class which uses it allowing
for easier reading/understanding of the class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 1ddb56f..47d3ed8 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -9,6 +9,8 @@
 # Better expressed as ensure all RDEPENDS package before we package
 # This means we can't have circular RDEPENDS/RRECOMMENDS
 
+AUTO_LIBNAME_PKGS = "${PACKAGES}"
+
 inherit package
 
 DEBIANRDEP = "do_packagedata"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fff13d1..ef30cb6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -628,9 +628,6 @@ export PKG_CONFIG_LIBDIR = "${PKG_CONFIG_DIR}"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 
-# library package naming
-AUTO_LIBNAME_PKGS = "${PACKAGES}"
-
 ###
 ### Config file processing
 ###



