Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2537774EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440193"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:20 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:48 +0300
Message-Id: <0f721adf1035e13c9a00128d481b56553e9cc8da.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/25] cantarell-fonts: update to 0.0.24
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index 5183628..e3e4cde 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -10,9 +10,9 @@ SECTION = "fonts"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
 
-PV = "0.0.21"
+PV = "0.0.24"
 
-SRCREV = "611c169df5287c059d63b0c8f0570647c75c9189"
+SRCREV = "07b6ea2cbbebfc360aa4668612a376be5e214eaa"
 SRC_URI = "git://git.gnome.org/cantarell-fonts;protocol=git;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
-- 
2.8.1


