Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QgmNn-0008Qa-7R
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 01:28:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 16:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="26948405"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.215])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 16:24:52 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 16:24:42 -0700
Message-Id: <cover.1310511423.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] Hob integration patches
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
X-List-Received-Date: Tue, 12 Jul 2011 23:28:51 -0000

Hob is the BitBake GUI I've been working on, the following pair of patches
make it a little more nicely integrated into OE-Core.

The first adds a variable to image_types.bbclass that the GUI can use to
determine what image types are available.

The second adds a wrapper script to call the GUI with a postfile, if the UI
can find hob.local.conf any configuration settings made in the UI will be
written to that file, rather than local.conf, ensuring that configuration
changes made in the GUI don't affect CLI builds.

The following changes since commit a6e9edb7b4b5b0bdb067a59d691d33fba8948963:

  sato-sdk: add clutter for sato-sdk image (2011-07-12 15:23:35 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/hob
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/hob

Joshua Lock (2):
  classes/image_types: add a variable to list available IMAGE_FSTYPE's
  scripts/hob: wrapper script to run hob gui with a UI specific config
    file

 meta/classes/image_types.bbclass |    2 ++
 scripts/hob                      |   18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100755 scripts/hob

-- 
1.7.6



