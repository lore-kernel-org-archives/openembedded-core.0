Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXV03-000474-NF for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 12:10:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OA0LgQ022297
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:00:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21875-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:00:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OA0Dca022291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:00:15 +0100
Message-ID: <1337853612.8248.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 11:00:12 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] binutils: Drop old/stale/broken csl recipe
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
X-List-Received-Date: Thu, 24 May 2012 10:10:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The patches this recipe refers to don't exist so nobody can have
been using this so lets just remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb b/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
deleted file mode 100644
index 8ab1e7f..0000000
--- a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
+++ b/dev/null
@@ -1,3 +0,0 @@
-require binutils_csl-arm-2008q1.bb
-require binutils-cross.inc
-PR = "r1"
diff --git a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb b/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
deleted file mode 100644
index 182b01f..0000000
--- a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
+++ b/dev/null
@@ -1,25 +0,0 @@
-require binutils.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "\
-     http://www.codesourcery.com/gnu_toolchains/arm/portal/package2553/public/arm-none-eabi/arm-2008q1-126-arm-none-eabi.src.tar.bz2 \
-     file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
-     file://binutils-uclibc-100-uclibc-conf.patch \
-     file://110-arm-eabi-conf.patch \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
-     file://binutils-uclibc-300-006_better_file_error.patch \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
-     file://docs_hack2.patch \
-     "
-
-PV = "2.18+csl-arm-2008q1-126"
-
-S = "${WORKDIR}/binutils-stable"
-
-do_unpack2() {
-	cd ${WORKDIR}
-	tar -xvjf ./arm-2008q1-126-arm-none-eabi/binutils-2008q1-126.tar.bz2
-}
-
-addtask unpack2 after do_unpack before do_patch




