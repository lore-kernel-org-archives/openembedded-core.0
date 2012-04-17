Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKHod-0003Ns-Mn
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 01:28:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Apr 2012 16:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132134357"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.85])
	by azsmga001.ch.intel.com with ESMTP; 17 Apr 2012 16:18:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 00:18:34 +0100
Message-Id: <cover.1334704605.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] [1.2] Allow building libzypp without x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 17 Apr 2012 23:28:08 -0000

The following changes since commit 70541d5e82ee05289eb0095bed4b121d12a00729:

  self-hosted-image: remove BB_NO_NETWORK and update Poky SRCREV (2012-04-17 23:16:07 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/libproxy-nox
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/libproxy-nox

Paul Eggleton (1):
  libproxy: remove dependency on gconf when x11 not in DISTRO_FEATURES

 meta/recipes-support/libproxy/libproxy_0.4.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



