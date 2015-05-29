Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D6239607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 13:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4TDH2ii014232 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 14:17:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PgaZ_zDaPqj8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 14:17:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4TDGoPv014214
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 14:17:01 +0100
Message-ID: <1432905410.404.136.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 May 2015 14:16:50 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] security_flags: Add comment about what it does and who uses it
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
X-List-Received-Date: Fri, 29 May 2015 13:17:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It was pointed out that people couldn't easily see who used this or
why so add some comments about that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 0ee3814..9608c7f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,3 +1,10 @@
+# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These 
+# don't work universally, there are recipes which can't use one, the other
+# or both so a blacklist is maintained here. The idea would be over
+# time to reduce this list to nothing.
+# From a Yocto Project perspective, this file is included and tested
+# in the DISTRO="poky-lsb" configuration.
+
 SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all -D_FORTIFY_SOURCE=2"
 SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"



