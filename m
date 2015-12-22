Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 903317319A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 12:21:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 22 Dec 2015 04:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="712766059"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 22 Dec 2015 04:21:47 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C14AE6A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:09:46 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:22:55 +0200
Message-Id: <1450786978-19993-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
References: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/7] gstreamer1.0-plugins-bad: upgrade to version 1.6.2
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
X-List-Received-Date: Tue, 22 Dec 2015 12:21:45 -0000

1.6.1 -> 1.6.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...amer1.0-plugins-bad_1.6.1.bb => gstreamer1.0-plugins-bad_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.6.1.bb => gstreamer1.0-plugins-bad_1.6.2.bb} (78%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index eeb4771..284e1f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
 
-SRC_URI[md5sum] = "c92d7d32de68e7293712bf9b6c99dc77"
-SRC_URI[sha256sum] = "e176a9af125f6874b3d6724aa7566a198fa225d3ece0a7ac2f2b51c57e525466"
+SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
+SRC_URI[sha256sum] = "650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.4.0


