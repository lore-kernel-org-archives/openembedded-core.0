Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5E88560746
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1ENa7rN006085 for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:36:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tjo52r7Fh1b3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:36:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1ENa5gH006082
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:36:06 GMT
Message-ID: <1455492965.16142.415.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Feb 2016 23:36:05 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] gdb-cross-canadian: Add missing virtual/* DEPENDS
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
X-List-Received-Date: Sun, 14 Feb 2016 23:36:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

cross-canadian does INHIBIT_DEFAULT_DEPS so we need to add the various virtual/*
toolchain pieces we rely on manually.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 4fd60a6..ae97759 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -5,7 +5,9 @@ SUMMARY = "GNU debugger (cross-canadian gdb for ${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-readline nativesdk-python"
+DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-readline nativesdk-python \
+           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc"
+
 RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-re \
                    nativesdk-python-codecs nativesdk-python-netclient"
 



