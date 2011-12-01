Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVuw7-0006b0-3A
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 01:55:39 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2011 16:48:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,274,1320652800"; d="scan'208";a="90830185"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2011 16:48:57 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 16:48:56 -0800
Message-Id: <cover.1322700459.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] trace-cmd: Update to version 1.2
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
X-List-Received-Date: Thu, 01 Dec 2011 00:55:39 -0000

The following changes since commit f4efaa0f472b4bf0ba0a0297cc9ecc8b5a671f72:

  squashfs-tools: fix PR, those should start with 'r' (2011-11-30 23:37:40 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core updates
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=updates

Darren Hart (1):
  trace-cmd: Update to 1.2 (includes kernelshark)

 .../{kernelshark_git.bb => kernelshark_1.2.bb}     |    9 +++--
 .../trace-cmd/trace-cmd/addldflags.patch           |   28 ++++++++++-----
 .../trace-cmd/trace-cmd/make-docs-optional.patch   |   36 ++++++++++++++++++++
 .../{trace-cmd_git.bb => trace-cmd_1.2.bb}         |    9 +++--
 4 files changed, 64 insertions(+), 18 deletions(-)
 rename meta/recipes-kernel/trace-cmd/{kernelshark_git.bb => kernelshark_1.2.bb} (81%)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
 rename meta/recipes-kernel/trace-cmd/{trace-cmd_git.bb => trace-cmd_1.2.bb} (76%)

-- 
1.7.6.4



