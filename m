Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 054BA71633
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 19:20:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 24 Feb 2015 11:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,640,1418112000"; d="scan'208";a="682796879"
Received: from yocto-hm1.jf.intel.com ([10.23.232.131])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2015 11:20:48 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com
Date: Tue, 24 Feb 2015 11:19:28 -0800
Message-Id: <cover.1424805430.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] Fix a runtime issue with the create-pull-request script
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
X-List-Received-Date: Tue, 24 Feb 2015 19:20:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit fixes the create-pull-request script failure with certain versions of the git.

Thanks,
Nitin


The following changes since commit 4d83a90bfb5a41deb81ca8878363a89fccf95d89:

  gst-plugins-package.inc: Avoid dependency on ${PN} from ${PN}-<plugin> (2015-02-24 17:41:44 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  create-pull-request: fix failure with git version 1.8.1.4

 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.4


