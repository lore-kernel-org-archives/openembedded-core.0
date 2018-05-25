Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 793D17453F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569624"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:36 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:09 +0800
Message-Id: <20180525062014.22022-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 07/12] gstreamer1.0-vaapi: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:35 -0000

Bugfixes only. Please see:

https://gstreamer.freedesktop.org/releases/1.14/#1.14.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-vaapi_1.14.0.bb => gstreamer1.0-vaapi_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.14.0.bb => gstreamer1.0-vaapi_1.14.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
index 4f752a57b3..906dc6e6c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "248c3aafab59814e71eb4a6c334cb261"
-SRC_URI[sha256sum] = "e4e31f085ef289bf1049398f641345979d20a1b11a80285744bba98504991df2"
+SRC_URI[md5sum] = "38c5b2390797b7a0a269a5ab6c8cbe8f"
+SRC_URI[sha256sum] = "585c3ddb0c39220de0a33e5d0ed6196a108b8407ec3538d7c64617713b4434e8"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.17.0


