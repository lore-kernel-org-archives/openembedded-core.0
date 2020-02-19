Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2260161579
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:36:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2020 18:37:00 -0800
X-IronPort-AV: E=Sophos;i="5.70,458,1574150400"; d="scan'208";a="228955951"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.22.68])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2020 18:36:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 10:36:41 +0800
Message-Id: <20200219023641.3308-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH v2] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Wed, 19 Feb 2020 02:36:59 -0000
Content-Transfer-Encoding: 8bit

Use the correct variable so options actually get used and use the
correct qt option name to prevent errors.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.16.1.bb             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
index a6eb9986dd..07a0bf5085 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
@@ -55,7 +55,7 @@ PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 # This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
 # in a gstreamer1.0-plugins-good bbappend).
 
-EXTRA_OECONF += " \
+EXTRA_OEMESON += " \
     -Daalib=disabled \
     -Ddirectsound=disabled \
     -Ddv=disabled \
@@ -64,7 +64,7 @@ EXTRA_OECONF += " \
     -Doss4=disabled \
     -Dosxaudio=disabled \
     -Dosxvideo=disabled \
-    -Dqt=disabled \
+    -Dqt5=disabled \
     -Dshout2=disabled \
     -Dtwolame=disabled \
     -Dwaveform=disabled \
-- 
2.24.1


