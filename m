Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RtMhH-0003Kd-IM
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 18:13:15 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2012 09:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="103611942"
Received: from unknown (HELO localhost) ([10.255.14.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2012 09:05:16 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Fri,  3 Feb 2012 09:04:33 -0800
Message-Id: <cover.1328288631.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] bootimg: Use the same OS files for each boot method
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
X-List-Received-Date: Fri, 03 Feb 2012 17:13:15 -0000

The following changes since commit 41e92923a0b2fe047ecaa9f9ffb564d6069f784f:

  classes/patch: optionally return non-patch sources (2012-02-03 16:51:30 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/bug/1951
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/bug/1951

Darren Hart (1):
  bootimg: Use the same OS files for each boot method

 meta/classes/bootimg.bbclass  |   31 ++++++++++++++++++++++++-------
 meta/classes/grub-efi.bbclass |   28 +++++++++-------------------
 meta/classes/syslinux.bbclass |   34 +++++++++++++---------------------
 3 files changed, 46 insertions(+), 47 deletions(-)

-- 
1.7.6.5



