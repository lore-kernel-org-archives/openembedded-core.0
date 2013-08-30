Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BB3386BD5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:48:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Aug 2013 06:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,990,1367996400"; d="scan'208";a="388846831"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2013 06:48:54 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 16:47:34 +0300
Message-Id: <cover.1377434794.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] YB3506: Include web browser in Build Appliance
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
X-List-Received-Date: Fri, 30 Aug 2013 13:48:57 -0000

Integrate Midori web browser in Build Appliance. This will allow the users
to get help and file a bug from Hob in Build Appliance.

[YOCTO #3506]
[YOCTO #5034]

The following changes since commit 4fd453ef7cd2e7e2b1d72284440dac574603ed27:

  midori: add version 0.5.5 from meta-gnome (2013-08-28 00:51:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/b3506
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihaip/b3506

Mihai Prica (2):
  packagegroup-self-hosted: integrate midori
  builder: register html links and files with Midori

 .../packagegroups/packagegroup-self-hosted.bb      |    1 +
 .../builder/files/builder_hob_start.sh             |    8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
1.7.9.5


