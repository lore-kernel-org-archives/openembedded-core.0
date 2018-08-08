Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CFC4578C1E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087703"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:10 +0800
Message-Id: <20180808071515.25581-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 06/11] gstreamer1.0-vaapi: upgrade 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:27 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-vaapi_1.14.1.bb => gstreamer1.0-vaapi_1.14.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.14.1.bb => gstreamer1.0-vaapi_1.14.2.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
index 6329032..34f2be9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
           "
 
-SRC_URI[md5sum] = "38c5b2390797b7a0a269a5ab6c8cbe8f"
-SRC_URI[sha256sum] = "585c3ddb0c39220de0a33e5d0ed6196a108b8407ec3538d7c64617713b4434e8"
+SRC_URI[md5sum] = "12ee9c16dfa0bb1808c76683e1c9a328"
+SRC_URI[sha256sum] = "7f1064e27f5abd3a42ef66b425f1a2b9dbae7748c81bd9d090ce52a1aaf30d8a"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.7.4


