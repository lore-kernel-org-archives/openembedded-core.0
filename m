Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 877EE75D22
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:01:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Nov 2015 08:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,243,1444719600"; d="scan'208";a="843033756"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2015 08:01:46 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 07:50:45 +0000
Message-Id: <cover.1446623061.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/3] Delete WORKDIR/installed_pkgs.txt after use
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
X-List-Received-Date: Wed, 04 Nov 2015 16:02:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These changes will delete the file installed_pkgs.txt once it used.
This file is used internally for complementary package installation
but it was left there after the use. This file was causing some
confusion and shouldn't be left there after the installation process

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8444
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8444

Mariano Lopez (3):
  runtime/_ptest.py: Delete WORKDIR/installed_pkgs.txt
  rootfs.py: Stop using installed_pkgs.txt
  package_manager.py: Delete installed_pkgs.txt file

 meta/lib/oe/package_manager.py  |  1 +
 meta/lib/oe/rootfs.py           | 24 +++++++++---------------
 meta/lib/oeqa/runtime/_ptest.py |  2 ++
 3 files changed, 12 insertions(+), 15 deletions(-)

-- 
1.8.4.5


