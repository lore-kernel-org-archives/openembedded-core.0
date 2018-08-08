Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E564078C0B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087745"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:13 +0800
Message-Id: <20180808071515.25581-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 09/11] gstreamer1.0-omx: upgrade 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:31 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-omx_1.14.1.bb => gstreamer1.0-omx_1.14.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.14.1.bb => gstreamer1.0-omx_1.14.2.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.2.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.2.bb
index 065e0f0..3f7bc8f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bec524f2a415af865a895fe12bcf0462"
-SRC_URI[sha256sum] = "7cb6c39301dfa3960abce195305c7cf431736bf6b47bde1fd4412c81c3e75cd8"
+SRC_URI[md5sum] = "d4fc97e3516befe04be3d1665a6f7bbe"
+SRC_URI[sha256sum] = "316dbb13693795383cad6ec4dbebd94a869cd1f9d59a393686cad0b77bf9b5a9"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.7.4


