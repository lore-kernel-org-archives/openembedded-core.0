Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDFA6C812
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 09:43:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8B9vEKw026313 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:57:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i5lkxEu5M5ZK
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:57:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8B9vAlU026296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:57:11 +0100
Message-ID: <1378892603.3484.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 10:43:23 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] uclibc: Add missing DEPENDS on kern-tools-native
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
X-List-Received-Date: Wed, 11 Sep 2013 09:43:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is needed for the kconfig handling and the merge-config.sh script.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
index 9e3edbd..3a1140e 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
@@ -2,7 +2,7 @@ SECTION = "base"
 require uclibc.inc
 require uclibc-git.inc
 
-DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
+DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial kern-tools-native"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
 PACKAGES = ""
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index a66656d..b4f5d9c 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -10,7 +10,8 @@ PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-initial \
            virtual/${TARGET_PREFIX}libc-initial \
-           linux-libc-headers ncurses-native"
+           linux-libc-headers ncurses-native \
+           kern-tools-native"
 
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"



