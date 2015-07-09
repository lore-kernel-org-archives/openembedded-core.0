Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0418760557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 05:10:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2015 22:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,437,1432623600"; d="scan'208";a="521188779"
Received: from weiteeng-ilbpg1.png.intel.com ([10.88.227.45])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2015 22:10:13 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 13:10:18 +0800
Message-Id: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: wei.tee.ng@intel.com
Subject: [PATCH 0/2] [master][dizzy] Enable Marvel 8897 Wifi feature
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
X-List-Received-Date: Thu, 09 Jul 2015 05:10:17 -0000

From: Ng Wei Tee <wei.tee.ng@intel.com>

Hi all,

I would like to add hostapd and iw configuration for enabling
Marvell 8897 Wifi feature. Hostapd and iw configuration were
created in the recipes-connectivity layer to enable Marvell 8897
module function in AP mode and STA mode.

Please review and provide feedback if any.

This patch is target to merge in openembedded-core master and dizzy
branch. Thanks.

Regards,
Wei Tee

Ng Shui Lei (2):
  recipes-connectivity: Add hostapd configuration for enabling Marvell
    8897 WiFi feature
  recipes-connectivity: Add iw configuration for enabling Marvell 8897
    WiFi feature

 .../hostapd/hostapd-2.2/defconfig                  |  145 ++++++++++++++++++++
 .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
 meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
 meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
 ....sh-don-t-use-git-describe-for-versioning.patch |   40 ++++++
 meta/recipes-connectivity/iw/iw_3.8.bb             |   27 ++++
 6 files changed, 329 insertions(+)
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb
 create mode 100644 meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 create mode 100644 meta/recipes-connectivity/iw/iw_3.8.bb

-- 
1.7.9.5


