Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 673427666C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 09:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7196U8u018794; Sat, 1 Aug 2015 10:06:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NewCF2YvFPAV; Sat,  1 Aug 2015 10:06:30 +0100 (BST)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7196PR2018781
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 1 Aug 2015 10:06:26 +0100
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1ZLSkF-0000tp-Tj; Sat, 01 Aug 2015 10:06:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Aug 2015 10:06:13 +0100
Message-Id: <1438419973-3394-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438419973-3394-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1438419973-3394-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] python-scons: 2.3.4 -> 2.3.6
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
X-List-Received-Date: Sat, 01 Aug 2015 09:06:33 -0000

License copyright year changed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python-scons-native_2.3.4.bb => python-scons-native_2.3.6.bb}  | 0
 .../python/{python-scons_2.3.4.bb => python-scons_2.3.6.bb}         | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.3.4.bb => python-scons-native_2.3.6.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.3.4.bb => python-scons_2.3.6.bb} (52%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.3.4.bb b/meta/recipes-devtools/python/python-scons-native_2.3.6.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.3.4.bb
rename to meta/recipes-devtools/python/python-scons-native_2.3.6.bb
diff --git a/meta/recipes-devtools/python/python-scons_2.3.4.bb b/meta/recipes-devtools/python/python-scons_2.3.6.bb
similarity index 52%
rename from meta/recipes-devtools/python/python-scons_2.3.4.bb
rename to meta/recipes-devtools/python/python-scons_2.3.6.bb
index 9b828fa..c4ad7d3 100644
--- a/meta/recipes-devtools/python/python-scons_2.3.4.bb
+++ b/meta/recipes-devtools/python/python-scons_2.3.6.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ad8a74a10870caa5e08a3e45d719e2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=23bc1530c55e9f0d1b709056bcea237d"
 SRCNAME = "scons"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "91fbbb67c2c65b03c746601baac4a6a5"
-SRC_URI[sha256sum] = "4b57d72066fed3b6ff65a7dd9f73633c9b1c09f87520e9b3aae84b3e4864b441"
+SRC_URI[md5sum] = "9c6a1c3c716cbe5f16515f163c91d928"
+SRC_URI[sha256sum] = "98adaa351d8f4e4068a5bf1894bdd7f85b390c8c3f80d437cf8bb266012404df"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


