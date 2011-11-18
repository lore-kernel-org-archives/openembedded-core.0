Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RRRpB-0000FU-7f
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 18:02:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2011 08:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,533,1315206000"; d="scan'208";a="86888658"
Received: from unknown (HELO localhost) ([10.255.15.232])
	by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2011 08:55:33 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2011 10:59:04 -0600
Message-Id: <cover.1321634793.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] add ia32-base.inc
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
X-List-Received-Date: Fri, 18 Nov 2011 17:02:01 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset adds a 'base config' .inc for settings that most of the
meta-intel BSPs use and moves them int conf/machine/include for easy
access and reuse by those BSPs that can use them.

The following changes since commit 6aa658495b028cd1301b9892fdc19a1b67ff06ca:
  Kang Kai (1):
        mesa: fix calling host's commands

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/conf-cleanup-v0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/conf-cleanup-v0

Tom Zanussi (1):
  ia32-base.inc: new include file

 meta/conf/machine/include/ia32-base.inc |   58 +++++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/ia32-base.inc



