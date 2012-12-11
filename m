Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TiTtS-0000xK-6t
	for Openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 18:45:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Dec 2012 09:28:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,260,1355126400"; d="scan'208";a="179492571"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Dec 2012 09:28:45 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, daniel@fooishbar.org,
	martin.jansa@gmail.com, richard.purdie@linuxfoundation.org
Date: Tue, 11 Dec 2012 09:27:47 -0800
Message-Id: <cover.1355246231.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [Patch v2 0/1] a commit for detecting trailing whitespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 17:45:22 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This v2 commit makes the egrep's output colorful with the --color option, and
output is made silent when the patches are clean wrt trailing white space.

    Detecting of the mixed white space was discussed on the mailing list, but
the discussion did not reach to a final agreement, so this commit is not adding
that detection yet.

Thanks,
Nitin

The following changes since commit c607095894cab60493ddfc4b967b0325e1c313b4:

  bitbake: Revert "BBHandler: Ensure parser state engine is correctly reset for new parsing" (2012-12-07 18:09:01 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  create-pull-request: detect trailing white space

 scripts/create-pull-request |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

-- 
1.7.3.4



