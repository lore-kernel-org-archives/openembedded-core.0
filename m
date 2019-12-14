Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 44DD67CBE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 06:15:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:19 -0800
X-IronPort-AV: E=Sophos;i="5.69,312,1571727600"; d="scan'208";a="204540198"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.64.187])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 14:14:55 +0800
Message-Id: <d6c59af0690a7017367214905bf997ecb2b817e7.1576303901.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576303901.git.anuj.mittal@intel.com>
References: <cover.1576303901.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 01/11] alsa-lib: Trim the text part used for the license file checksum
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
X-List-Received-Date: Sat, 14 Dec 2019 06:15:18 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids including irrelevant information when calculating the
license checksum.

License-Update: Trim the text part used for the license file checksum
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
index 2c63ee7522..ba7e978dbe 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
-                    file://src/socket.c;md5=dd1bc7f44872690224d89c1a9806e495;beginline=1;endline=26 \
+                    file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-- 
2.21.0


