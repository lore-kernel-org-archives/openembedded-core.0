Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB2372C83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:16:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7GhcK018152
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:16:43 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:16:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:16:35 -0800
Message-ID: <d864749009a67f49ff482e2ab20607890fff114f.1421651689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651689.git.liezhi.yang@windriver.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] autogen-native: upgrade to 5.18.4
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
X-List-Received-Date: Mon, 19 Jan 2015 07:16:47 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...n-native_5.18.3.bb => autogen-native_5.18.4.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.3.bb => autogen-native_5.18.4.bb} (90%)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
similarity index 90%
rename from meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
index abc0a42..302ba79 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
@@ -13,8 +13,8 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://increase-timeout-limit.patch \
            file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch"
 
-SRC_URI[md5sum] = "0fb6b003423e004d94e0119c2390078f"
-SRC_URI[sha256sum] = "73d05a689105eb9b8be54f32498c99ddbd360776fc61cf45be6a2a4eb4a40039"
+SRC_URI[md5sum] = "6f48029cc839303d28496e1609868938"
+SRC_URI[sha256sum] = "3cd9f81a8ae7c6865bb9bbbe16c4307a243a1373d0b315a83571cbba1fff725d"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 
-- 
1.7.9.5


