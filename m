Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5D99161FE4
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 21:35:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2014 14:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,807,1400050800"; d="scan'208";a="583883598"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2014 14:35:48 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	darren.hart@intel.com, Openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:39:50 -0700
Message-Id: <cover.1407274547.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/2] INITRD commit feedback changes
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
X-List-Received-Date: Tue, 05 Aug 2014 21:35:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here are couple of commits which enhances the code and documentation referring
the recently changed INITRD variable. It is based on the feedback received from
Darren Hart.

Thanks,
Nitin

The following changes since commit 870bb8d35547b8313b3a487d7e8b914ab9470e64:

  local.conf.sample.extended: fix example for EXTRA_USERS_PARAMS (2014-08-04 17:38:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (2):
  INITRD var: documentation changes
  code cleanup for INITRD variable handing

 documentation/ref-manual/ref-classes.xml   | 4 ++--
 documentation/ref-manual/ref-variables.xml | 2 +-
 meta/classes/boot-directdisk.bbclass       | 4 +++-
 meta/classes/bootimg.bbclass               | 2 ++
 meta/conf/documentation.conf               | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

-- 
1.8.1.4


