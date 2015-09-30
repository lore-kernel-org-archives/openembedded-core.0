Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7D776F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDpHj2007399 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:51:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TORO4Y0gLBU4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:51:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDpPnN007464
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:51:36 +0100
Message-ID: <1443621085.5162.89.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:51:25 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] layer.conf: Improve siggen exclusion to handle virtual/libc
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
X-List-Received-Date: Wed, 30 Sep 2015 13:51:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now the system supports virtual/xxx in SIGGEN_ variables, convert
this one to use virtual/libc instead of the hardcoded expansion which
is error prone.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 9e80018..1a2f4d5 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -41,9 +41,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-  gcc-cross-${TARGET_ARCH}->glibc \
-  gcc-cross-${TARGET_ARCH}->musl \
-  gcc-cross-${TARGET_ARCH}->uclibc \
+  gcc-cross-${TARGET_ARCH}->virtual/libc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
   ppp-dialin->ppp \
   resolvconf->bash \



