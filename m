Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC34D71B9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:35:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3P3Ziq7011544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:35:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 20:35:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Apr 2017 20:35:42 -0700
Message-ID: <c9098bff2a960a58a56c51d91e3ca5813cb3b852.1493091283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1493091283.git.liezhi.yang@windriver.com>
References: <cover.1493091283.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe-find-native-sysroot: don't clear OECORE_NATIVE_SYSROOT
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
X-List-Received-Date: Tue, 25 Apr 2017 03:35:46 -0000
Content-Type: text/plain

The OECORE_NATIVE_SYSROOT may come from environment vars, so don't clear
it, otherwise it broke runqemu-extract-sdk on sdk.

[YOCTO #11409]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-find-native-sysroot | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 5c8681e..235a67c 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -47,7 +47,6 @@ fi
 
 # Global vars
 BITBAKE_E=""
-OECORE_NATIVE_SYSROOT=""
 set_oe_native_sysroot(){
     echo "Running bitbake -e $1"
     BITBAKE_E="`bitbake -e $1`"
-- 
2.10.2


