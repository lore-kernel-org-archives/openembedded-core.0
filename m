Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 91136772D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:43:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:43:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686650"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:57 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:51 +0200
Message-Id: <60ef507a46980b4523d3d9406d4f48afcb6a3a27.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/19] package_regex.inc: Add gtk-icon-utils-native
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
X-List-Received-Date: Fri, 13 Nov 2015 09:43:57 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/conf/distro/include/package_regex.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index d12999b..9bf9681 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -225,6 +225,7 @@ REGEX_pn-pango = "${GNOME_STABLE}"
 REGEX_pn-gtk+ = "${GNOME2_STABLE}"
 REGEX_pn-gtk+3 = "${GNOME_STABLE}"
 REGEX_pn-gtk-engines = "${GNOME2_STABLE}"
+REGEX_pn-gtk-icon-utils-native = "${GNOME2_STABLE}"
 REGEX_pn-glib-networking = "${GNOME_STABLE}"
 REGEX_pn-librsvg = "${GNOME_STABLE}"
 REGEX_pn-libsoup-2.4 = "${GNOME_STABLE}"
-- 
2.1.4


