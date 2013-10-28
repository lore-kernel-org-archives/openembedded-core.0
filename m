Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5FEDA6D2B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:12:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2013 10:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418613112"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 10:12:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:11:53 +0000
Message-Id: <cover.1382980153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/6] oe-pkgdata-util improvements
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
X-List-Received-Date: Mon, 28 Oct 2013 17:12:13 -0000

Some improvements for the oe-pkgdata-util script making it a little more
useful outside of its usage within do_rootfs.


The following changes since commit 8081dcb03f54efd551d1c8fe8a0484f8270053e0:

  pigz: bump to 2.3.1 (2013-10-26 16:08:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-pkgdata-util
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-pkgdata-util

Paul Eggleton (6):
  scripts/oe-pkgdata-util: remove remnants of former pkgdata structure
  scripts/oe-pkgdata-util: improve help text and command line parsing
  scripts/oe-pkgdata-util: check path arguments to ensure they exist
  scripts/oe-pkgdata-util: add ability to search for a target path
  scripts/oe-pkgdata-util: add ability to look up runtime package names
  scripts/oe-pkgdata-util: add ability to find a recipe from a target
    package

 scripts/oe-pkgdata-util | 209 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 165 insertions(+), 44 deletions(-)

-- 
1.8.1.2


