Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 727CC6AFB5
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2013 12:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,914,1367996400"; d="scan'208";a="388634157"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2013 12:22:01 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2013 19:22:17 +0000
Message-Id: <cover.1376939912.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] a sanity check fix for a better error
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
X-List-Received-Date: Mon, 19 Aug 2013 19:22:13 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here is a commit to give a better error regarding missing required
distro features.

Thanks,
Nitin

The following changes since commit 6382979cca1d1c57467f983ba9611f91555b20a9:

  cronie: fix out of tree build (2013-08-19 11:25:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  sanity.bbclass: a new check for required distro features

 meta/classes/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
1.8.1.4


