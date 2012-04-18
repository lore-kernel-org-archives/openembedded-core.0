Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKRlc-00043H-Vg
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 12:05:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Apr 2012 02:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132312355"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.88])
	by azsmga001.ch.intel.com with ESMTP; 18 Apr 2012 02:56:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 10:56:08 +0100
Message-Id: <cover.1334742865.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] [1.2] Fix distro checks in sanity.bbclass
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
X-List-Received-Date: Wed, 18 Apr 2012 10:05:41 -0000

After actually testing the distro sanity check on current distro
versions on top of master, two issues were discovered; these
trivial patches fix those issues.


The following changes since commit 973351cf2e338f07c11395d494193e9c62857f2d:

  libproxy: remove dependency on gconf when x11 not in DISTRO_FEATURES (2012-04-18 00:31:24 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/sanity-distro-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanity-distro-fix

Paul Eggleton (2):
  classes/sanity: trim trailing newline when reading
    /etc/redhat-release
  classes/sanity: import regular expression module in SuSE distro check

 meta/classes/sanity.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.5.4



