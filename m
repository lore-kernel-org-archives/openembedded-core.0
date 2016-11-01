Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE9A71BE5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876205"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:14 +0200
Message-Id: <6b15afe06a52c40d7314c1039e1f3a135b13ef32.1478013702.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/13] epiphany: remove unnecessary libwnck3 dependency
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:55 -0000

libwnck3 dependency was removed upstream

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.22.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
index 57784ae..673eb95 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
@@ -2,12 +2,10 @@ SUMMARY = "WebKit based web browser for GNOME"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
+DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr \
 	   gsettings-desktop-schemas gnome-desktop3 libxml2-native intltool-native"
 
 inherit gnomebase gsettings distro_features_check upstream-version-is-even
-# libwnck3 is x11 only
-REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
 SRC_URI[archive.md5sum] = "9b9b73601a32f5b11c02411952cec27a"
-- 
2.10.1


