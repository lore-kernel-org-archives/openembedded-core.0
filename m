Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SDT8a-0006yp-1r
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 06:08:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Mar 2012 20:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147718316"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2012 20:58:22 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 11:43:09 +0800
Message-Id: <cover.1333078789.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix GL failure on qemuarm/mips/ppc, V2, Mar32, 2012
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
X-List-Received-Date: Fri, 30 Mar 2012 04:08:32 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This is the V2 version after Martin and RP's comments: no COMPATIBLE_MACHINE,
and no change for global default preferred virtual/libgl.

Pls. review.

Thanks,
Edwin


The following changes since commit 265903bdffb10c95ceaf7a892151a50b67939c71:

  procps: don't print error message with kernel 3.0+ (2012-03-28 10:16:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2

Zhai Edwin (1):
  virtual/libgl: use mesa-xlib for qemuarm/qemumips/qemuppc

 meta/conf/machine/include/qemu.inc |    1 +
 meta/conf/machine/qemux86-64.conf  |    1 +
 meta/conf/machine/qemux86.conf     |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.5.4



