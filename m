Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E08A861EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 14:41:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41EfsVP002577 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:41:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xngjKcrguebK
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 15:41:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41Efo0B002573
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:41:52 +0100
Message-ID: <1398955304.30460.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 May 2014 15:41:44 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-cross: Drop TARGET_CC_ARCH
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
X-List-Received-Date: Thu, 01 May 2014 14:41:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since we no longer build target libs within gcc-cross, we can drop the
TARGET_CC_ARCH flags and hence make it independent of tune.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index ef88d3f..0bf29e3 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -37,7 +37,7 @@ do_compile () {
 	export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
 	export LD_FOR_TARGET="${TARGET_SYS}-ld"
 	export NM_FOR_TARGET="${TARGET_SYS}-nm"
-	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
+	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc"
 	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"



