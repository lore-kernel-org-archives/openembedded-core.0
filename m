Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RW9Vn-0004j2-62
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:29:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2011 08:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81800391"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2011 08:22:44 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  1 Dec 2011 08:22:26 -0800
Message-Id: <cover.1322756466.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] trace-cmd: Fix build failure due to blktrace_api change
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
X-List-Received-Date: Thu, 01 Dec 2011 16:29:28 -0000

From: Darren Hart <dvhart@linux.intel.com>

The following changes since commit 2ebfb9d9ed7554180c3c077b14291a1853f8e2ef:

  puzzles: Ensure to link against libm for math functions (2011-12-01 14:30:49 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core trace-cmd
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=trace-cmd

Darren Hart (1):
  trace-cmd: Add blktrace_api compatibility for TC_BARRIER

 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    3 +-
 .../trace-cmd/blktrace-api-compatibility.patch     |   29 ++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    3 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch

-- 
1.7.6.4



