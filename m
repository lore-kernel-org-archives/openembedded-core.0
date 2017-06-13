Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE40782F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:30:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 13 Jun 2017 07:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="112618163"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 13 Jun 2017 07:30:17 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9D36858010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:30:16 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 17:29:49 +0300
Message-Id: <1497364193-519-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1497364193-519-1-git-send-email-maxin.john@intel.com>
References: <1497364193-519-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/7] mesa-demos: switch from ftp to https
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
X-List-Received-Date: Tue, 13 Jun 2017 14:30:17 -0000

For the same reasons as Debian:
https://www.debian.org/News/2017/20170425

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
index e43b9ef..bae3b18 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://mesa.freedesktop.org/archive/demos/${PV}/${BPN}-${PV}.tar.bz2 \
            file://0001-mesa-demos-Add-missing-data-files.patch \
            file://0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch \
            file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
-- 
2.4.0


