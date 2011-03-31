Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q5IEQ-0003pt-Th
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 15:48:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2011 06:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,275,1299484800"; d="scan'208";a="673728730"
Received: from unknown (HELO helios) ([10.255.12.217])
	by fmsmga002.fm.intel.com with SMTP; 31 Mar 2011 06:46:12 -0700
Received: by helios (sSMTP sendmail emulation); Thu, 31 Mar 2011 14:46:11 +0100
Message-Id: <cover.1301578942.git.paul.eggleton@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 14:42:22 +0100
Date: Thu, 31 Mar 2011 14:46:11 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/1] remove u-boot flashing instructions for mpc8315e-rdb
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
X-List-Received-Date: Thu, 31 Mar 2011 13:48:15 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Upgrading u-boot is apparently not necessary with current board revisions,
and these instructions may not work properly anyway (our toolchain seems not
to be able to compile u-boot in the way described), and given that they are
potentially risky they should be removed.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: paule/readme-hardware-fix3
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/readme-hardware-fix3

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Paul Eggleton (1):
  README.hardware: remove u-boot flashing instructions for mpc8315e-rdb

 README.hardware |   29 +++--------------------------
 1 files changed, 3 insertions(+), 26 deletions(-)



