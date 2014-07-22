Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4E69D70791
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:03:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2014 12:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,711,1400050800"; d="scan'208";a="573794708"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 12:02:39 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 14:02:36 -0500
Message-Id: <cover.1406054327.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [for-daisy][PATCH 0/2] wic: A couple minor fixes
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
X-List-Received-Date: Tue, 22 Jul 2014 19:03:35 -0000

Just a couple minor fixes things noticed while testing.

The following changes since commit d8155f1f95a041fa6b7f4c7881f52a0989446ba5:

  documentation: Updated manual history tables to support 1.6.2 (2014-07-22 15:05:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes-daisy
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-fixes-daisy

Tom Zanussi (2):
  wic: Fix bad directory name in bootimg-efi
  wic: Remove fstype from mkefidisk canned wks

 scripts/lib/image/canned-wks/mkefidisk.wks    | 2 +-
 scripts/lib/mic/plugins/source/bootimg-efi.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.3.1


