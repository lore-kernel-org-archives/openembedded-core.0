Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8qUx-0007DT-L0
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 11:32:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2011 02:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,454,1312182000"; d="scan'208";a="71534338"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.175])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2011 02:26:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 10:26:07 +0100
Message-Id: <cover.1317201529.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Fix TMPDIR usage in scripts
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
X-List-Received-Date: Wed, 28 Sep 2011 09:32:16 -0000

Fix TMPDIR external environment variable usage within our scripts which
is a problem on OpenSUSE within an X session (see Yocto bug #1530) by
using OE_TMPDIR from the external environment instead.

Note that this will require changes to autobuilder scripts that use a
TMPDIR environment variable when calling these scripts - they should now
set OE_TMPDIR instead (if versions with and without this change need to
be run on the same system, then setting both variables will cause no
harm).


The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:

  libffi: really populate -dev package (2011-09-26 20:50:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/scripts-tmpdir
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/scripts-tmpdir

Paul Eggleton (2):
  scripts: use OE_TMPDIR instead of TMPDIR external variable
  scripts/oe-setup-rpmrepo: use setup_tmpdir from runqemu

 scripts/oe-setup-rpmrepo |   35 +++++++++++++++++++++--------------
 scripts/runqemu          |    7 ++++++-
 2 files changed, 27 insertions(+), 15 deletions(-)

-- 
1.7.4.1



