Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rzs8t-00026M-5V
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 17:00:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Feb 2012 07:52:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108997276"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.60])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 07:52:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 15:52:13 +0000
Message-Id: <cover.1329837658.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/2] psplash improvements v2
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
X-List-Received-Date: Tue, 21 Feb 2012 16:00:39 -0000

Implements the psplash changes as discussed on the mailing list [1] and
by the TSC [2].

[1] http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg13800.html
[2] http://lists.linuxtogo.org/pipermail/tsc/2012-January/000330.html

Since v1 I've done away with the additional script and integrated .png
conversion into the recipe (optional) as well as used alternatives to
allow selecting the psplash at runtime. I also decided against renaming
the default header file as it would break existing bbappends.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 1da6a2dbd5e7aeea6cd45ca05590bdd50b67bf89:

  recipes: bump PR to rebuild .la files without libz.la (2012-02-21 15:00:24 +0000)

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



