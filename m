Return-Path: <oleg.zhurakivskyy@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 122D5606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:01:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2015 05:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,565,1418112000"; d="scan'208";a="665383317"
Received: from ozhuraki.fi.intel.com ([10.237.67.31])
	by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2015 05:01:38 -0800
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2015 15:01:35 +0200
Message-Id: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] Add libedit, neardal recipes
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
X-List-Received-Date: Thu, 12 Feb 2015 13:01:40 -0000

Hello,

Please find changes that contain 2 new recipes:

- libedit: BSD licensed command line editor library.
- neardal: neard abstraction library.

Regards,
Oleg

Oleg Zhurakivskyy (2):
  libedit: Add recipe
  neardal: Add recipe

 meta/recipes-connectivity/neardal/neardal.inc      | 22 +++++++++++++++++++
 .../recipes-connectivity/neardal/neardal/ncl.patch | 25 ++++++++++++++++++++++
 meta/recipes-connectivity/neardal/neardal_0.14.bb  |  6 ++++++
 meta/recipes-core/libedit/libedit_0.52.bb          | 22 +++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/neardal/neardal.inc
 create mode 100644 meta/recipes-connectivity/neardal/neardal/ncl.patch
 create mode 100644 meta/recipes-connectivity/neardal/neardal_0.14.bb
 create mode 100644 meta/recipes-core/libedit/libedit_0.52.bb

-- 
2.1.0


