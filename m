Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CA5F66B6C7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627788"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:33 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:03 +0200
Message-Id: <cover.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/8] Various comm and multimedia PUs
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
X-List-Received-Date: Fri, 03 Jan 2014 14:27:35 -0000

The following changes since commit 17aa50645015a149298e78a175bbd3cbf171df22:

  classes/package: set SUMMARY in do_split_packages() (2014-01-02 22:39:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (8):
  gstreamer1.0: upgrade to 1.2.2
  gstreamer1.0-plugins-base: upgrade to 1.2.2
  gstreamer1.0-plugins-good: upgrade to 1.2.2
  gstreamer1.0-plugins-bad: upgrade to 1.2.2
  gstreamer1.0-plugins-ugly: upgrade to 1.2.2
  gstreamer1.0-libav: upgrade to 1.2.2
  ofono: upgrade to 1.14
  bluez5: upgrade to 5.13

 meta/recipes-connectivity/bluez5/bluez5_5.12.bb    |  5 ----
 meta/recipes-connectivity/bluez5/bluez5_5.13.bb    |  5 ++++
 .../ofono/{ofono_1.13.bb => ofono_1.14.bb}         |  4 +--
 .../gstreamer/gstreamer1.0-libav.inc               |  3 --
 ...-libav_1.2.0.bb => gstreamer1.0-libav_1.2.2.bb} |  4 +--
 ...uez-fix-compilation-on-big-endian-systems.patch | 35 ----------------------
 ..._1.2.0.bb => gstreamer1.0-plugins-bad_1.2.2.bb} |  6 ++--
 ...1.2.0.bb => gstreamer1.0-plugins-base_1.2.2.bb} |  5 ++--
 ...1.2.0.bb => gstreamer1.0-plugins-good_1.2.2.bb} |  5 ++--
 ...1.2.0.bb => gstreamer1.0-plugins-ugly_1.2.2.bb} |  4 +--
 ...gstreamer1.0_1.2.0.bb => gstreamer1.0_1.2.2.bb} |  4 +--
 11 files changed, 19 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.12.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.13.bb
 rename meta/recipes-connectivity/ofono/{ofono_1.13.bb => ofono_1.14.bb} (52%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.0.bb => gstreamer1.0-libav_1.2.2.bb} (89%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/bluez-fix-compilation-on-big-endian-systems.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.0.bb => gstreamer1.0-plugins-bad_1.2.2.bb} (67%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.0.bb => gstreamer1.0-plugins-base_1.2.2.bb} (72%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.0.bb => gstreamer1.0-plugins-good_1.2.2.bb} (73%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.0.bb => gstreamer1.0-plugins-ugly_1.2.2.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.2.0.bb => gstreamer1.0_1.2.2.bb} (72%)

-- 
1.8.3.2


