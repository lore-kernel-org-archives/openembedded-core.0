Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B35C6FAEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 12:50:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2014 05:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,486,1400050800"; d="scan'208";a="556190334"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2014 05:50:31 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2014 15:54:09 +0300
Message-Id: <cover.1402923181.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Comms PUs
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
X-List-Received-Date: Mon, 16 Jun 2014 12:50:40 -0000

The following changes since commit 3a88df915831f2fd5e46ed71b21190398d1de0f1:

  alsa-tools: Add missing pkgconfg dependency (2014-06-14 08:46:02 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  connman: upgrade to 1.24
  wpa-supplicant: upgrade to 2.2

 .../recipes-connectivity/connman/{connman_1.23.bb => connman_1.24.bb} | 4 ++--
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc           | 4 ++--
 .../wpa-supplicant/{wpa-supplicant_2.1.bb => wpa-supplicant_2.2.bb}   | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.23.bb => connman_1.24.bb} (68%)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.1.bb => wpa-supplicant_2.2.bb} (100%)

-- 
1.9.1


