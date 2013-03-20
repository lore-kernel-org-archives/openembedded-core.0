Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UIMxx-0000hs-8S
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 18:38:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Mar 2013 10:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,880,1355126400"; d="scan'208";a="217011159"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.175])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Mar 2013 10:21:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:21:25 -0700
Message-Id: <1363800087-29768-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 0/2] Fixes for 1.4 Milestone 5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 17:38:34 -0000

Richard,

Here are a couple of fixes to address build and critical issues
with Milestone 5.  

Thanks
	Sau!


Alexandru DAMIAN (1):
  grep: Always use locale.h

Saul Wold (1):
  alsa-tools: add patch for mips since it does not have io.h

 .../grep/grep-2.5.1a/fix64-int-to-pointer.patch         | 17 +++++++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb               |  1 +
 .../alsa/alsa-tools/mips_has_no_io_h.patch              | 13 +++++++++++++
 meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb     |  1 +
 4 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/fix64-int-to-pointer.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch

-- 
1.8.0.2



