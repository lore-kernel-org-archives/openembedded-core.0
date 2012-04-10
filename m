Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SHk4H-0004Bt-Fv
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 01:01:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 15:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127507198"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.34])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 15:52:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 23:52:22 +0100
Message-Id: <cover.1334098277.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix deb rootfs generation
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
X-List-Received-Date: Tue, 10 Apr 2012 23:01:47 -0000

The following change since commit bde1744018afd4616e114b20ffdc21b9abddcedc:

  hello-mod: Move hello-mod from meta to meta-skeleton (2012-04-10 13:16:00 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/apt
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/apt

Paul Eggleton (1):
  classes/package_deb: create .gz index instead of .bz2

 meta/classes/package_deb.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



