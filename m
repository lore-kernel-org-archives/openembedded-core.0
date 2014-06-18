Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF096FDE6
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 06:01:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2014 22:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,499,1400050800"; d="scan'208";a="559359389"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 17 Jun 2014 23:01:42 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org,
	Openembedded-core@lists.openembedded.org
Date: Tue, 17 Jun 2014 23:04:47 -0700
Message-Id: <cover.1403071319.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A fix for kernel-module-split.bbclass
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
X-List-Received-Date: Wed, 18 Jun 2014 06:01:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here is a build fix for the build breakage of a meta-intel BSP.

Thanks,
Nitin

The following changes since commit f3394914fd209ac186ef6806794dcbd915ef4fed:

  linux-yocto/3.10: update to v3.10.43 (2014-06-17 17:56:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  kernel-module-split.bbclass: fix a typo in var name

 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.4


