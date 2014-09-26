Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7F46170EBE
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 02:00:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 25 Sep 2014 18:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="391807269"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2014 18:54:12 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	Openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	tom.zanussi@intel.com, dvhart@linux.intel.com
Date: Thu, 25 Sep 2014 19:00:43 -0700
Message-Id: <cover.1411695722.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A fix for the lttng-modules
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
X-List-Received-Date: Fri, 26 Sep 2014 02:00:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The lttng-modules recipe was failing with meta-intel BSPs with the
v3.17 kernel. The qemu machines from the poky layers did not get
hit by this issue. The accompanying commit fixes the issue observed in
the lttng-modules recipe. The fix is made in a way to not break on older
kernel versions.
  This is tested with v3.10 and v3.17 kernels with meta-intel BSPs. I
understand that the oecore/poky layer has stopped taking commits for the
upcoming v1.7 release. Let me know, if this commit can not go in the 
oecore/poky layer. In that case, this fix will instead be pushed to the
meta-intel layer.

Thanks,
Nitin


The following changes since commit 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:

  build-appliance-image: Update to dizzy head revision (2014-09-23 22:10:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  lttng-modules: fix build issues with the v3.17 kernel

 .../fix_build_with_v3.17_kernel.patch              | 111 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch

-- 
1.8.1.4


