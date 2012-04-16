Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SJpAG-0001Gy-Ta
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 18:52:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Apr 2012 09:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131525083"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.96])
	by azsmga001.ch.intel.com with ESMTP; 16 Apr 2012 09:43:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 17:43:01 +0100
Message-Id: <cover.1334594354.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix perl re-execution issues
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
X-List-Received-Date: Mon, 16 Apr 2012 16:52:33 -0000

Fix re-execution issues within perl.

Note: I identified that some references to /usr/include are still not
being substituted before or after this patch - you can see these by
doing "grep -rI '/usr/include' *" in WORKDIR after do_configure(). I do
not know enough about how we build perl to know if these are an issue or
not, thus I left them alone.


The following change since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:

  bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/perl-reexec
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/perl-reexec

Paul Eggleton (1):
  perl: fix re-execution of patch/configure

 meta/recipes-devtools/perl/perl_5.14.2.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.5.4



