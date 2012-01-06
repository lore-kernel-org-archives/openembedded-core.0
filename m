Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1RjGhx-0003ZW-LQ
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 21:48:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2012 12:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93763944"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2012 12:39:43 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 12:40:32 -0800
Message-Id: <cover.1325882211.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Add --sysroot settings into env file for build dir toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 20:48:13 -0000

The following changes since commit 05409821ea58915c38a0962fb4dd14f8a49806e6:
  Scott Garman (1):
        insane.bbclass: use bb.process.Popen instead of subprocess.check_output

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/sysroot
  http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/sysroot

Jessica Zhang (1):
  add sysroot support for meta-ide-support which is the toolchain
    within build env case

 meta/classes/toolchain-scripts.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)



