Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R5mcP-00010E-7x
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 00:47:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 15:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="50063492"
Received: from scimitar.jf.intel.com ([10.7.199.86])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2011 15:41:46 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 15:41:42 -0700
Message-Id: <cover.1316471892.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [PATCH 0/3] Various hob fixes
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
X-List-Received-Date: Mon, 19 Sep 2011 22:47:17 -0000

This series contains 3 bug fixes.

The first has been submitted previously but hasn't been applied or commented
on so I've rolled it into this pull request.

Patch one and two contain bug fixes for reported issues, patch three is a
minor change but a noticable one should one stumble accross it.

Please review and consider for master and the Yocto 1.1 release.

Regards,
Joshua

The following changes since commit 3e7f8afeacf7c8c8de3e87778a3907e33d4a06b3:

  fetch2/git: fix subpath destination directory (2011-09-19 12:33:38 +0100)

are available in the git repository at:
  git://github.com/incandescant/bitbake hob
  https://github.com/incandescant/bitbake/tree/hob

Joshua Lock (3):
  ui/crumbs/hobprefs: re-enable reloading of data after prefs changes
  hob: fix build again when building packages only
  hob: enable package only builds even if an image has been built

 lib/bb/ui/crumbs/hobeventhandler.py |   13 +++++--------
 lib/bb/ui/crumbs/hobprefs.py        |    2 +-
 lib/bb/ui/hob.py                    |   12 ++++++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

-- 
1.7.6.2



