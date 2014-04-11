Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0419E65DE3
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 17:00:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2014 09:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="491450308"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2014 09:59:43 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	darren.hart@intel.com, richard.purdie@linuxfoundation.org
Date: Fri, 11 Apr 2014 10:05:01 -0700
Message-Id: <cover.1397235602.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A kernel recipe fix for meta-skeleton layer
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
X-List-Received-Date: Fri, 11 Apr 2014 17:00:29 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The kernel variables in kernel bbappend recipes such as LINUX_VERSION should
always use machine overrides to unintentionally influencing kernel variables
in other layers. Adding missing overrides to the kernel recipe in the
meta-skeleton layer, so people who use it to make their own recipes, start
the right way.

Thanks,
Nitin

The following changes since commit 863cc7483f5ee43189537940de8ee5c0964d24cc:

  poky.conf: Post release version bump (2014-04-10 18:03:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  meta-skeleton: linux-yocto-custom.bb: use machine overrides

 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.1.4


