Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3864260197
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569606"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:04 +0800
Message-Id: <20180525062014.22022-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 02/12] gstreamer1.0: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:30 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0_1.14.0.bb => gstreamer1.0_1.14.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.14.0.bb => gstreamer1.0_1.14.1.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.1.bb
index e842f30c5a..2710f25950 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.1.bb
@@ -27,8 +27,8 @@ SRC_URI = " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
-SRC_URI[sha256sum] = "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
+SRC_URI[md5sum] = "c46967bd2b7b6b73fa4f47de61610243"
+SRC_URI[sha256sum] = "28d82b0d261544a9bf85b429399929e4986eb00efcf1ce16cc71d269a4c3186c"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
-- 
2.17.0


