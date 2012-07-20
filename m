Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5rQ-000698-RP
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 07:34:45 +0200
Received: by pbbrq2 with SMTP id rq2so4958454pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WTNMZEHWUW0UGKI8iiYQsF+4auwibzRVxMRTjyU6UYs=;
	b=sdSQ2cKnXgOwM/piuMa5PVxFt48BY/+4oWIJO5bftotIxRlnFKt2rDxaYiZ/Lqbear
	Nn6qfP8MD3BWCizCRHl5THn+gNeoGjH2MIrIEZioFKQfPWJUVsR33jWxO2FklBejC+vQ
	3ropLaTImG7o9e7v1+paPtq7llwekoP/K5f7CmGW4fSTXihNvM91z4Il4pLHBiBbCb2O
	sgv2eQcbWsihx5JEmTUplnr+X/t/SNXYurrxhJXlhMWpAQOzWVKRSbb8RjZZ1zAcgQzk
	sNyNb5L41Za4bVPS8iQg7WO898sQxgrLhnq1OMD2nSSLVHJjV8G3Vmsku4qLcEAM3Xzk
	QTTw==
Received: by 10.68.236.129 with SMTP id uu1mr10833215pbc.77.1342761801491;
	Thu, 19 Jul 2012 22:23:21 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ny4sm3215080pbb.57.2012.07.19.22.23.20
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:23:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:22:58 -0700
Message-Id: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Khem Raj <kraj@juniper.net>
Subject: [PATCH 1/3] cmake-native: Fix build on ubuntu
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
X-List-Received-Date: Fri, 20 Jul 2012 05:34:45 -0000

From: Khem Raj <kraj@juniper.net>

Fixes errors like

/yocto/poky/build/tmp/work/x86_64-linux/cmake-native-2.8.5-r2.1/cmake-2.8.5/Utilities/cmlibarchive/libarchive/archive_entry.c:56:55:
fatal error: ext2fs/ext2_fs.h: No such file or directory

Signed-off-by: Khem Raj <kraj@juniper.net>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
index 3fe0c2e..98ae300 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
@@ -1,7 +1,9 @@
 require cmake.inc
 inherit native
 
-PR = "${INC_PR}.1"
+DEPENDS += "e2fsprogs-native"
+
+PR = "${INC_PR}.2"
 
 SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
 SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
-- 
1.7.9.5



