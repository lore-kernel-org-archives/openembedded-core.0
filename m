Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C467C6059A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 09:43:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2014 02:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,574,1400050800"; d="scan'208";a="565937155"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2014 02:43:48 -0700
From: Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2014 12:44:02 +0300
Message-Id: <cover.1404120809.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6467
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
X-List-Received-Date: Mon, 30 Jun 2014 09:43:53 -0000

The following changes since commit 6b5484d17df275b706a2b3c06bf7988da5818000:

  Revert "libusb: add missing build dependency on udev" (2014-06-29 10:00:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6467
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6467

Roxana (1):
  python3: fix builtins imports

 meta/recipes-devtools/python/python3/unixccompiler.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.1


