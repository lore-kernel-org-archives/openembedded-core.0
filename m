Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6B15B6AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 18:31:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 23 Mar 2015 11:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,453,1422950400"; d="scan'208";a="684400063"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2015 11:31:44 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 20:31:37 +0200
Message-Id: <cover.1427135435.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for YOCTO #6931
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
X-List-Received-Date: Mon, 23 Mar 2015 18:31:51 -0000

The following changes since commit 4bd886fb0081954879aaa2f574f3c7f6ced745d5:

  systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:21 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB6931
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB6931

Cristian Iorga (1):
  webkit-gtk: disable JIT for armv5/armv6

 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.1.0


