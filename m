Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SHN7Z-0003c5-AG
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 00:31:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2012 15:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127020593"
Received: from unknown (HELO localhost) ([10.7.199.62])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2012 15:22:19 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Mon,  9 Apr 2012 15:21:40 -0700
Message-Id: <cover.1334010033.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] hello-mod: Move hello-mod from meta to meta-skeleton
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
X-List-Received-Date: Mon, 09 Apr 2012 22:31:37 -0000

V2: Do this all in oe-core as meta-skeleton is part of oe-core (duh!)

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core hello-mod
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=hello-mod

Darren Hart (1):
  hello-mod: Move hello-mod from meta to meta-skeleton

 .../recipes-kernel/hello-mod/files/COPYING         |    0
 .../recipes-kernel/hello-mod/files/Makefile        |    0
 .../recipes-kernel/hello-mod/files/hello.c         |    0
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/COPYING (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/Makefile (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/hello.c (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/hello-mod_0.1.bb (100%)

-- 
1.7.6.5



