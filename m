Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0895A615F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 14:39:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41EdRCS002459 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:39:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KEu1VittkVA9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 15:39:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41EdNPM002456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:39:25 +0100
Message-ID: <1398955157.30460.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 May 2014 15:39:17 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] tcmode-default.inc: Add default SDK PREFERRED_PROVIDERS
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
X-List-Received-Date: Thu, 01 May 2014 14:39:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We should be explicit about the providers for the SDK toolchain so
add entries to do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1afc94d..03742d8 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -9,6 +9,12 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
 PREFERRED_PROVIDER_gdb = "gdb"
 
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk = "binutils-crosssdk-${SDK_ARCH}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc-initial = "gcc-crosssdk-initial-${SDK_ARCH}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_ARCH}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_ARCH}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
+
 # Default libc config
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${TCLIBC}"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?= "nativesdk-${TCLIBC}"



