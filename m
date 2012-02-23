Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0eVF-0003ea-Cp
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 20:38:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 11:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120643502"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2012 11:30:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 19:30:30 +0000
Message-Id: <cover.1330025248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] psplash improvements v2
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
X-List-Received-Date: Thu, 23 Feb 2012 19:38:57 -0000

Implements the psplash changes as discussed on the mailing list [1] and
by the TSC [2].

[1] http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg13800.html
[2] http://lists.linuxtogo.org/pipermail/tsc/2012-January/000330.html

Since v1 I've done away with the additional script and integrated .png
conversion into the recipe (optional) as well as used alternatives to
allow selecting the psplash at runtime. I also decided against renaming
the default header file as it would break existing bbappends.

Note for meta-yocto there is a corresponding change that should be
applied at the same time which I will send out shortly.

(No changes since the RFC except for rebasing on top of current master.)


The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:

  texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/oe-psplash
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-psplash

Paul Eggleton (2):
  psplash: use OpenEmbedded logo
  psplash: allow building multiple splash executables

 meta/recipes-core/psplash/files/psplash-poky-img.h | 1959 +++++++++++---------
 meta/recipes-core/psplash/psplash_git.bb           |   93 +-
 2 files changed, 1143 insertions(+), 909 deletions(-)

-- 
1.7.5.4



