Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A07E470617
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQTjQ011065; Wed, 16 Jul 2014 17:26:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r_k4998I0omq; Wed, 16 Jul 2014 17:26:30 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQQUp011036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:28 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S29-0004N8-TC; Wed, 16 Jul 2014 17:26:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:02 +0100
Message-Id: <53386c9bab6af2fd79b9816e82566b220a1e99ae.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/19] python-scons: Upgrade 2.3.0 -> 2.3.2
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:17 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python-scons-native_2.3.0.bb => python-scons-native_2.3.2.bb}  | 0
 .../python/{python-scons_2.3.0.bb => python-scons_2.3.2.bb}         | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.3.0.bb => python-scons-native_2.3.2.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.3.0.bb => python-scons_2.3.2.bb} (52%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.3.0.bb b/meta/recipes-devtools/python/python-scons-native_2.3.2.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.3.0.bb
rename to meta/recipes-devtools/python/python-scons-native_2.3.2.bb
diff --git a/meta/recipes-devtools/python/python-scons_2.3.0.bb b/meta/recipes-devtools/python/python-scons_2.3.2.bb
similarity index 52%
rename from meta/recipes-devtools/python/python-scons_2.3.0.bb
rename to meta/recipes-devtools/python/python-scons_2.3.2.bb
index eb2735d..fc5b302 100644
--- a/meta/recipes-devtools/python/python-scons_2.3.0.bb
+++ b/meta/recipes-devtools/python/python-scons_2.3.2.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=98e9a1e6029e715255c52032a1eba637"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ad8a74a10870caa5e08a3e45d719e2"
 SRCNAME = "scons"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "083ce5624d6adcbdaf2526623f456ca9"
-SRC_URI[sha256sum] = "9442069999cf4b2caa94a5886ab4c2c71de1718ed5e9176c18e2b6dbca463b4b"
+SRC_URI[md5sum] = "bbd428da35ec176575a2b0be1f8d7162"
+SRC_URI[sha256sum] = "f993320c5e9515e6567fcce73df0a7a8808414bf1223c69123d3dcf339a449d4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.2


