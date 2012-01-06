Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RizxM-0004jr-CH
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 03:55:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2012 18:47:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109297086"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 18:47:31 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 18:47:30 -0800
Message-Id: <cover.1325817957.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] Fix for autoconf-nativesdk recipe
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
X-List-Received-Date: Fri, 06 Jan 2012 02:55:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes dependency issue of autoconf-nativesdk 

Thanks,
Nitin

The following changes since commit 6f9b1a5b050174156e663aa8d692e7f9ac7b9018:

  systemtap: remove not needed fix for automake 1.11.2 (2012-01-05 16:28:59 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (1):
  autoconf: fix nativesdk rdepends

 meta/recipes-devtools/autoconf/autoconf.inc     |    2 ++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.6.4



