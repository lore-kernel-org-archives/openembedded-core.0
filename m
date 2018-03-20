Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47C4E78200
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 11:24:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 04:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,335,1517904000"; d="scan'208";a="40534135"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2018 04:24:02 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 51AB7580713
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:24:01 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 13:27:39 +0200
Message-Id: <1521545259-29121-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] maintainers: remove obsolete entries
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
X-List-Received-Date: Tue, 20 Mar 2018 11:24:01 -0000

Delete entries of removed packages.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 60397f3..c103c87 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -345,7 +345,6 @@ RECIPE_MAINTAINER_pn-libgcc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libgcc-initial = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libgcrypt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgfortran = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-libglade = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libglu = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgudev = "Maxin B. John <maxin.john@intel.com>"
@@ -584,11 +583,9 @@ RECIPE_MAINTAINER_pn-pixz = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-pkgconf = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-pkgconfig = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-pm-utils = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-pointercal = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-pointercal-xinput = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-pong-clock = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-popt = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-portmap = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-powertop = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ppp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-ppp-dialin = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -707,8 +704,6 @@ RECIPE_MAINTAINER_pn-tiff = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-time = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-tiny-init = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-trace-cmd = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-tremor = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-tslib = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-ttf-bitstream-vera = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-tzcode-native = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-tzdata = "Armin Kuster <akuster@mvista.com>"
@@ -801,7 +796,6 @@ RECIPE_MAINTAINER_pn-xserver-xf86-config = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xserver-xorg = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xset = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xtrans = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xtscal = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xvideo-tests = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster@mvista.com>"
-- 
2.4.0


