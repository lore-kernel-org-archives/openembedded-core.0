Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29DA8601B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 11:13:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 01 Jul 2016 04:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,556,1459839600"; d="scan'208";a="131860632"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2016 04:13:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6497E2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 04:13:37 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:13:08 +0300
Message-Id: <1467371591-12270-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
References: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/6] default-distrovars.inc: remove directfb from GTK2DISTROFEATURES
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
X-List-Received-Date: Fri, 01 Jul 2016 11:13:42 -0000

remove directfb from GTK2DISTROFEATURES as part of moving directfb
from oe-core

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index fac4deb..f11fbad 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -44,5 +44,5 @@ DISTRO_VERSION ??= "nodistro.0"
 # Missing checksums should raise an error
 BB_STRICT_CHECKSUM = "1"
 
-GTK2DISTROFEATURES = "directfb x11"
+GTK2DISTROFEATURES = "x11"
 GTK3DISTROFEATURES = "x11 wayland"
-- 
2.4.0


