Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4D860116
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 23:15:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2017 15:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,322,1477983600"; d="scan'208";a="1079696745"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2017 15:15:48 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 15:15:42 -0800
Message-Id: <cover.1483658030.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Fix depends for conversion types in IMAGE_TYPEDEP_*
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
X-List-Received-Date: Thu, 05 Jan 2017 23:15:54 -0000

Fix conversion type dependencies missing when set in IMAGE_TYPEDEP_*. This
also adds a test.

The following changes since commit 9f6a1043f68580ed9604e750fd0f993f933bb66e:

  bitbake: prserv/serv: Tweak stdout manipulation to be stream safe (2017-01-05 13:54:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/image_typedep
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/image_typedep

Randy Witt (2):
  image_typedep.py: Add a test that ensures conversion type deps get
    added
  image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types

 meta/classes/image_types.bbclass        | 14 +++++++--
 meta/lib/oeqa/selftest/image_typedep.py | 51 +++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/image_typedep.py

-- 
2.7.4


