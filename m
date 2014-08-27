Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 96A5571165
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 18:10:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2014 11:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,412,1406617200"; d="scan'208";a="582500083"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2014 11:10:10 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 21:10:00 +0300
Message-Id: <cover.1409162830.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] Various comms and multimedia PUs
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
X-List-Received-Date: Wed, 27 Aug 2014 18:10:18 -0000

Various PUs for comms and multimedia

The below warnings are due to the original test source code present
in ofono test suite!

WARNING: Trailing white space detected at these locations
pull-25158/0004-ofono-upgrade-to-1.15.patch:138:+ 
pull-25158/0004-ofono-upgrade-to-1.15.patch:148:+ 
pull-25158/0004-ofono-upgrade-to-1.15.patch:150:+
.....

The following changes since commit c16795477ea7e2159b5d3808268912b572887e2d:

  qemu: add PACKAGECONFIG for numa (2014-08-27 12:13:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (4):
  connman: upgrade to 1.25
  harfbuzz: upgrade to 0.9.35
  bluez5: upgrade to 5.22
  ofono: upgrade to 1.15

 meta/recipes-connectivity/bluez5/bluez5_5.21.bb    |    3 -
 meta/recipes-connectivity/bluez5/bluez5_5.22.bb    |    3 +
 ...ild-libppp-plugin-without-versioning-info.patch |   32 -
 .../connman/{connman_1.24.bb => connman_1.25.bb}   |    5 +-
 .../ofono/Revert-test-Convert-to-Python-3.patch    | 1270 ++++++++++++++++++++
 .../ofono/{ofono_1.14.bb => ofono_1.15.bb}         |    7 +-
 .../{harfbuzz_0.9.29.bb => harfbuzz_0.9.35.bb}     |    4 +-
 7 files changed, 1280 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.21.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.22.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
 rename meta/recipes-connectivity/connman/{connman_1.24.bb => connman_1.25.bb} (59%)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/Revert-test-Convert-to-Python-3.patch
 rename meta/recipes-connectivity/ofono/{ofono_1.14.bb => ofono_1.15.bb} (45%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.29.bb => harfbuzz_0.9.35.bb} (88%)

-- 
1.9.1


