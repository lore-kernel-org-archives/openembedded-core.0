Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 52AC777B95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 19:36:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 12:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,391,1496127600"; d="scan'208";a="1198081018"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.28])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2017 12:36:18 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 12:39:42 -0700
Message-Id: <cover.1500665624.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] remove qemu kernel version overrides and superfluous version settings
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
X-List-Received-Date: Fri, 21 Jul 2017 19:36:45 -0000

Hi,

This removes the extra settings for the default kernel version so that you
can specify PREFERRED_VERSION_linux-yocto="X%" in your local.conf and it will
work for all the default MACHINES poky suports: qemu and hw boards both.

Without this patch, the hardware boards would have used version X but the qemu
machines would have used the default since they had machine specific overrides
in the poky distro conf.

-brian


The following changes since commit b38e8165330f76b422f4ad15aabcf93dd9458360:

  bison: reduce local pending patches (2017-07-21 11:12:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/mv_linux-yocto_into_machineconf
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/mv_linux-yocto_into_machineconf

brian avery (2):
  meta-yocto-bsp: Remove superfluous kernel set
  poky: Remove machine specific kernel overrides

 meta-poky/conf/distro/poky.conf                | 10 ++--------
 meta-yocto-bsp/conf/machine/genericx86-64.conf |  2 --
 meta-yocto-bsp/conf/machine/genericx86.conf    |  2 --
 3 files changed, 2 insertions(+), 12 deletions(-)

--
1.9.1

