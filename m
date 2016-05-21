Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0564F65CBB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 10:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LArDLq002972 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:53:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PSYErxxvVXgn
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:53:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LAr8Bj002969
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:53:10 +0100
Message-ID: <1463827988.4578.164.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2016 11:53:08 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] glibc-locale: Enable binary locale generation for nativesdk-glibc
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
X-List-Received-Date: Sat, 21 May 2016 10:53:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

python3 has much stricter locale requirements than previous versions.
If a locale isn't present, python3 reverts to ascii mode under which
bit
bake can't operate.

We therefore need working binary locales in things like uninative-tarball and buildtools-tarball. This patch enables binary locales for nativesdk-glibc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index e868e38..0a7adfc 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -19,7 +19,7 @@ do_package[depends] += "${BINUTILSDEP}"
 
 # default to disabled 
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
-ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "0"
+ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "1"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions




