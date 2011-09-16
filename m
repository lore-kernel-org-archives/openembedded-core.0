Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R4hEh-00010W-4J
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 00:50:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Sep 2011 15:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,395,1312182000"; d="scan'208";a="17959839"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.15.15])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Sep 2011 15:45:04 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:44:56 -0700
Message-Id: <cover.1316212888.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] texinfo - various fixes
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
X-List-Received-Date: Fri, 16 Sep 2011 22:50:19 -0000

The patch header has the long story, short story is that texinfo builds some
native tools required to bootstrap itself when cross-compiling - however this
adds some development requirements for the host.

Since we require texinfo on the host to build this patch removes the build
bootstrapping, and therefore the development package requirements.

Testing of this patch would be greatly appreciated.

Regards,
Joshua

The following changes since commit 31cb3974eeaf2a808e8da3864e70986578c58cb9:

  sanity: disable mirrors for connectivity check (2011-09-16 18:07:19 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (1):
  texinfo: several changes to build without zlib and ncurses headers on
    host

 .../texinfo/texinfo-4.13a/Makefile.in.in           |  444 ++++++++++++++++++++
 .../texinfo-4.13a/disable-native-tools.patch       |   43 ++
 .../texinfo/texinfo-4.13a/link-zip.patch           |   16 +
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   26 +-
 4 files changed, 519 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/Makefile.in.in
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch

-- 
1.7.6



