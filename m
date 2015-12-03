Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B77BA6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 13:54:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Dec 2015 05:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="853118341"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2015 05:54:26 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 15:54:23 +0200
Message-Id: <1449150865-7496-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] devtool: kernel config fixes
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
X-List-Received-Date: Thu, 03 Dec 2015 13:54:42 -0000

Two patches changing the kernel config handling (of kernel packages). Now the
srctree is expected to have .config which will be used as the initial kernel
config when building.


The following changes since commit 687e5ef86361a16d6c411386939d4ba96a5909ea:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:31:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/kernel

for you to fetch changes up to 0ccea2b62e4d28f3989a72f773e0cbf023739721:

  devtool: extract: update SRCTREECOVEREDTASKS for kernel (2015-12-03 15:35:42 +0200)


Markus Lehtonen (2):
  devtool: extract: copy kernel config to srctree
  devtool: extract: update SRCTREECOVEREDTASKS for kernel

 scripts/lib/devtool/standard.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.1.4


