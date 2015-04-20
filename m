Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6E4973D0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89OEo014555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:24 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:18 -0700
Message-ID: <a4b757fd335a7790dd926c193536fbe9a048ece2.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] ccache: 3.1.9 -> 3.1.11
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:23 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ccache/{ccache_3.1.9.bb => ccache_3.1.11.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.9.bb => ccache_3.1.11.bb} (45%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.1.9.bb b/meta/recipes-devtools/ccache/ccache_3.1.11.bb
similarity index 45%
rename from meta/recipes-devtools/ccache/ccache_3.1.9.bb
rename to meta/recipes-devtools/ccache/ccache_3.1.11.bb
index 1679171..7696003 100644
--- a/meta/recipes-devtools/ccache/ccache_3.1.9.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.1.11.bb
@@ -3,5 +3,5 @@ require ccache.inc
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
 
-SRC_URI[md5sum] = "522a6016bda56892653612bbdefff3e0"
-SRC_URI[sha256sum] = "4981fdf3ad851de400d94083a0d03f115ce9ce8062c3fd7a291630294b0006c4"
+SRC_URI[md5sum] = "0f6df80c8941d9020a1fd5df5ad57dd7"
+SRC_URI[sha256sum] = "60e9f3f1e60f528cfce910f3224bcc698029320f6ab77ec09a7b46bda2bc678e"
-- 
1.7.9.5


