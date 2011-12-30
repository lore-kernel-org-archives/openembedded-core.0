Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RgRT2-0008KM-OS
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 02:41:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Dec 2011 17:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="51736794"
Received: from unknown (HELO localhost) ([10.255.15.202])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Dec 2011 17:33:52 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2011 19:29:01 -0600
Message-Id: <cover.1325208086.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] scripts/rpm2cpio.sh fix
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
X-List-Received-Date: Fri, 30 Dec 2011 01:41:09 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

When running rpm2cpio.sh on an xz-compressed rpm, it failed with the error:

tmp/sysroots/x86_64-linux/usr/bin/unlzma: (stdin): File format not recognized

This is due to the script demanding lowercase in tests that might produce
uppercase output, such as newer versions of 'file'.

Tom Zanussi (1):
  rpm2cpio.sh: make compression tests case-insensitive

 scripts/rpm2cpio.sh |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)



