Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5D384771F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:29:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2016 02:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="746760855"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2016 02:29:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 64BF36A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:29:18 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:30:21 +0300
Message-Id: <1470821429-6094-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/10] x11-common: replace xtscal with xinput-calibrator
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
X-List-Received-Date: Wed, 10 Aug 2016 09:29:37 -0000

Replace xtscal with xinput-calibrator as part of removing xtscal.

[YOCTO #9365]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/x11-common/x11-common_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 6d7c347..2bc0d33 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -26,5 +26,5 @@ do_install() {
 	chmod -R 755 ${D}${sysconfdir}
 }
 
-RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"
+RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xinput-calibrator xinit formfactor"
 
-- 
2.4.0


