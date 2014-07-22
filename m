Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5390C70733
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:01:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2014 12:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,711,1400050800"; d="scan'208";a="573793252"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 12:01:09 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 13:47:01 -0500
Message-Id: <cover.1406052643.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/3] wic: A few minor fixes
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
X-List-Received-Date: Tue, 22 Jul 2014 19:01:44 -0000

Just a few minor fixes for the recently added help text and a couple
fixes noticed while testing related things.

The following changes since commit 8b7116d25ed6255a03895d835e5a0560858ab496:

  bitbake: Updated the the example 'bitbake -h' output to match the actual output, which has been recently patched to fix the '-S SIGNATURE_HANDLER, --dump-signatures=SIGNATURE_HANDLER' option. (2014-07-22 08:33:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-fixes

Tom Zanussi (3):
  wic: Fix bad directory name in bootimg-efi
  wic: Add help entry for wic kickstart
  wic: Remove fstype from mkefidisk canned wks

 scripts/lib/image/canned-wks/mkefidisk.wks    | 2 +-
 scripts/lib/image/help.py                     | 1 +
 scripts/lib/mic/plugins/source/bootimg-efi.py | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.8.3.1


