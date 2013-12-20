Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6963E60D67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 14:55:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 20 Dec 2013 06:55:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,521,1384329600"; d="scan'208";a="447624101"
Received: from dsgunati-mobl.gar.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2013 06:55:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 14:55:08 +0000
Message-Id: <cover.1387551254.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] Misc bugfixes
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
X-List-Received-Date: Fri, 20 Dec 2013 14:55:25 -0000

The following changes since commit cd94dd3d9bba32c3fd55959586128b236d1d4e34:

  security_flags: more relocation issues (2013-12-18 17:23:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes4

Paul Eggleton (2):
  libav: add libpostproc to PROVIDES (for 0.8.x version only)
  classes/insane: restore printing LIC_FILES_CHKSUM checksum if not
    specified

 meta/classes/insane.bbclass                  | 27 ++++++++++++++-------------
 meta/recipes-multimedia/libav/libav_0.8.9.bb |  2 ++
 2 files changed, 16 insertions(+), 13 deletions(-)

-- 
1.8.1.2


