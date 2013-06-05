Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1AE6A4D2
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 02:30:16 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2013 19:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,811,1363158000"; d="scan'208";a="312963397"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2013 19:30:12 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 19:28:20 +0000
Message-Id: <cover.1370460463.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] a bugfix for lsb image builds
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
X-List-Received-Date: Thu, 06 Jun 2013 02:30:16 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes a bug which affects any lsb (or non-X) image which 
includes the tools-testapp package group.

Thanks,
Nitin
The following changes since commit a62aed41f2d8f874f7ae24d0e5be5dbc66ea2199:

  lrzsz: check locale.h in configure (2013-06-04 15:55:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  tools-testapps: add xserver in dependency

 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.1.4


