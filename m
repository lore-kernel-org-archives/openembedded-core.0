Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C7A5E6012A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 12:03:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2015 04:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853594624"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2015 04:03:15 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 14:06:13 +0200
Message-Id: <cover.1447847724.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Improve weston image experience
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
X-List-Received-Date: Wed, 18 Nov 2015 12:03:18 -0000

Currently core-image-weston doesn't work nicely out-of-the-box
on hardware or on qemu. Sending a couple of small changes for that.

The runqemu-internal patch was sent by Khem a few months back but
never made it to jethro. I believe it is correct: "-usbdevice tablet"
is what the qemu documentation suggests as well.

Thanks,
 Jussi

The following changes since commit d9aabf9639510fdb3e2ccc21ba5ae4aa9f6e4a57:

  gcc: Drop 4.8 (2015-11-16 14:59:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/weston
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/weston

Jussi Kukkonen (1):
  mesa: Make gl libraries RRECOMMEND mesa-megadriver

Khem Raj (1):
  runqemu-internal: Replace wacom-tablet with tablet for usbdevice

 meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb | 3 +++
 meta/recipes-graphics/mesa/mesa.inc          | 5 ++++-
 scripts/runqemu-internal                     | 4 ++--
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.1.4


