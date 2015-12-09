Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 473C06FFC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 20:50:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2015 12:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,405,1444719600"; d="scan'208";a="704002398"
Received: from bitbang.jf.intel.com ([10.7.199.175])
	by orsmga003.jf.intel.com with ESMTP; 09 Dec 2015 12:50:53 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 12:50:43 -0800
Message-Id: <cover.1449693306.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [jethro][master][PATCH 0/1] Fix for 32-bit uninative
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
X-List-Received-Date: Wed, 09 Dec 2015 20:50:56 -0000

The following changes since commit c093fd8bd2fbf070728f5401ce3e6cf951fa820d:

  linux-yocto/4.1: Fix kernel oops on qemuarm boot (2015-12-08 17:22:31 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/uninative-32bit-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/uninative-32bit-fix

Randy Witt (1):
  uninative.bbclass: Choose the correct loader based on BUILD_ARCH

 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.4.3


