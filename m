Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SHIvn-00017r-Ii
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 20:03:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2012 10:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130373022"
Received: from unknown (HELO localhost) ([10.7.199.62])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2012 10:53:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2012 10:53:13 -0700
Message-Id: <cover.1333993801.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] hello-mod: Remove hello-mod example external kernel module recipe
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
X-List-Received-Date: Mon, 09 Apr 2012 18:03:11 -0000

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core hello-mod
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=hello-mod

Darren Hart (1):
  hello-mod: Remove hello-mod example external kernel module recipe

 meta/recipes-kernel/hello-mod/files/COPYING    |  340 ------------------------
 meta/recipes-kernel/hello-mod/files/Makefile   |   14 -
 meta/recipes-kernel/hello-mod/files/hello.c    |   33 ---
 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb |   15 -
 4 files changed, 0 insertions(+), 402 deletions(-)
 delete mode 100644 meta/recipes-kernel/hello-mod/files/COPYING
 delete mode 100644 meta/recipes-kernel/hello-mod/files/Makefile
 delete mode 100644 meta/recipes-kernel/hello-mod/files/hello.c
 delete mode 100644 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb

-- 
1.7.6.5



