Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 27B53702ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:39 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IffkG020176 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:41 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414096-622912 ;
	Mon, 4 Aug 2014 13:41:40 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:40:52 -0500
Message-Id: <cover.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:40 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize complete at 08/04/2014 01:41:41 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 00/20] udev-cache related changes
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
X-List-Received-Date: Mon, 04 Aug 2014 18:41:42 -0000

This patchset contains changes to the udev-cache scripts to reduce size on
disk, to improve error reporting, and to fix bugs, and a few fixes and tweaks
to udev overall.

The following changes since commit 5a09acef73b5cfc59bbcd3e93603c99a8c078bd8:

  local.conf.sample.extended: fix example for EXTRA_USERS_PARAMS (2014-08-04 17:38:17 +0100)

are available in the git repository at:

  git://github.com/ni/openembedded-core dev/bshelton/udev_cache
  https://github.com/ni/openembedded-core/tree/dev/bshelton/udev_cache

Ben Shelton (2):
  busybox: tar: enable CONFIG_FEATURE_TAR_LONG_OPTIONS
  udev-cache: fix udev-cache changes to work with busybox tar

Richard Tollerton (18):
  udev-cache: Compress the cache
  udev-cache: choose a more descriptive cache filename
  udev-cache: Honor VERBOSE for bootup message
  udev-cache: Don't ignore errors from cache extract
  udev-cache: Remove superfluous subshell on extract
  udev-cache: Update cache tarball atomically
  udev-cache: Create cache asynchronously
  udev-cache.default: documentation update
  udev-cache: parametrize sysconf file paths
  udev-cache: parametrize tar options
  udev-cache: fix timestamp errors on systems lacking an RTC
  udev-cache: Avoid caching udev.cache or non-devfs filesystems
  udev-cache: refactor; improve verbosity and error handling
  udev-cache: don't attempt to extract cache if it doesn't exist
  udev-cache: invalidate on rules.d changes
  udev: Make build MACHINE-specific
  udev: Disable keymap support on machines lacking keyboard support
  udev: don't halt if devtmpfs can't be mounted

 meta/recipes-core/busybox/busybox/defconfig    |  2 +-
 meta/recipes-core/udev/udev.inc                |  7 ++++++
 meta/recipes-core/udev/udev/init               | 30 +++++++++++++++-----------
 meta/recipes-core/udev/udev/udev-cache         | 21 ++++++++++++++----
 meta/recipes-core/udev/udev/udev-cache.default | 18 ++++++++++++++--
 5 files changed, 58 insertions(+), 20 deletions(-)

-- 
2.0.4


