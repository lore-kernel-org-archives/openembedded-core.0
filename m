Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 37D11607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:27:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2015 07:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,440,1432623600"; d="scan'208";a="603039251"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga003.jf.intel.com with ESMTP; 09 Jul 2015 07:27:53 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 17:28:09 +0300
Message-Id: <cover.1436452048.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/2] BlueZ upgrades
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
X-List-Received-Date: Thu, 09 Jul 2015 14:27:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0aaa67a790ab211b35eed58173efa115ceb6e243:

  oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-08 13:09:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (2):
  bluez5: upgrade to 5.32
  libical: upgrade to 1.0.1

 .../bluez5/{bluez5_5.31.bb => bluez5_5.32.bb}                    | 4 ++--
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb}               | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.31.bb => bluez5_5.32.bb} (88%)
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (67%)

-- 
2.1.4


