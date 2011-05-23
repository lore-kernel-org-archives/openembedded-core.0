Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QObRy-0003Dd-Mv
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 22:10:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2011 13:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,258,1304319600"; 
   d="scan'208";a="3461595"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.153])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2011 13:06:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Mon, 23 May 2011 13:06:16 -0700
Message-Id: <cover.1306180893.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] create-pull-request: generalize the repository URL parsing
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
X-List-Received-Date: Mon, 23 May 2011 20:10:03 -0000

I noticed the REMOTE_REPO was not being properly parsed by the
create-pull-request script in a pull recently sent from Khem. This should
address the issue with the added benefit of treating each of pokylinux,
yoctoproject, openembedded, and github with a single regex for determining
REMOTE_REPO and public'ifying the URL. Most other repositories are also likely
covered by the new regex for generating the public URL. Specific cases are still
obviously required for generating a browsable web URL.

The following changes since commit ed8646e257ad84b017e5295b892eeb44bcef0483:

  *pull-request: add copyright, license, and descriptions (2011-05-16 15:18:20 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/git-pull
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull

Darren Hart (1):
  create-pull-request: generalize the repository URL parsing

 scripts/create-pull-request |   29 ++++++++++++-----------------
 1 files changed, 12 insertions(+), 17 deletions(-)



