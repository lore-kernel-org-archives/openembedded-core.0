Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DE95C78BFF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087754"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:14 +0800
Message-Id: <20180808071515.25581-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 10/11] gstreamer1.0-python: upgrade 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:32 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-python_1.14.1.bb => gstreamer1.0-python_1.14.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.14.1.bb => gstreamer1.0-python_1.14.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.2.bb
index b0f1c25..78c0046 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.2.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2ae86f1bb2fd8399a942fd94bb17d264"
-SRC_URI[sha256sum] = "1bc6704955e343f78d2d935487f26d2db4c131c9a6dad38eb331c7e3639147d3"
+SRC_URI[md5sum] = "5b0af1bd490d79a7d435b2be47568f8e"
+SRC_URI[sha256sum] = "dc40be5ab4f1a433ff3f0af2b3d2d79a363009020c41ec10f9747ba64200cb22"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.7.4


