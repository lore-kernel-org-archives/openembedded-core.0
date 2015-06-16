Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 733F973C63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:22:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2015 07:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="744450016"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 07:22:39 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 17:22:57 +0300
Message-Id: <f695a9f8ea4c35b040d98d2793153fba91771ec5.1434464336.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
References: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
Subject: [PATCH v3 5/6] sato-icon-theme: Inherit Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Tue, 16 Jun 2015 14:22:47 -0000

Adwaita is the current GNOME icon theme.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
index fa595dc..2c176ee 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
@@ -22,7 +22,7 @@ index c4b03a7..688fbbf 100644
  [Icon Theme]
  Name=Sato
  Comment=Sato icon theme
-+Inherits=gnome
++Inherits=Adwaita
  
  Directories=16x16/apps,16x16/status,16x16/stock,16x16/places,16x16/mimetypes,16x16/devices,16x16/actions,22x22/apps,22x22/status,22x22/stock,22x22/places,22x22/mimetypes,22x22/devices,22x22/actions,32x32/apps,32x32/status,32x32/stock,32x32/places,32x32/mimetypes,32x32/devices,32x32/actions,48x48/apps,48x48/status,48x48/stock,48x48/places,48x48/mimetypes,48x48/devices,48x48/actions,64x64/apps,64x64/status,64x64/stock,64x64/places,64x64/mimetypes,64x64/devices,64x64/actions,
  
-- 
2.1.4


