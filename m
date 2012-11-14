Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlXy-0000G3-AG
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:09 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490549"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:20:53 -0800
Message-Id: <cover.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 00/10 v2] Updates and Fixes
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
X-List-Received-Date: Wed, 14 Nov 2012 22:35:11 -0000

Richard,

This is v2 of the patch set from yesterday, mostly the
same, but fixes the issues mentioned on the list.

sysstat
sqlite3
builder

Added libcheck after some testing.

Thanks
	Sau!


The following changes since commit f7a25dd72d1d463eb72d48c6f9dd968d376496c0:

  bash: fix mkbuiltins build failure (2012-11-14 15:57:13 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (10):
  pulse: fix Bashism in string test
  mx: Update to 1.4.7
  kconfig-frontends: Update to 3.6
  psmisc: Update to 22.20
  less: Update to 451
  sysstat: Update to 10.1.2
  libcheck: Update to 0.9.9
  sqlite3: Update to 3.7.14.1
  builder: Add password for user
  packagegroup-self-hosted: add sftp server

 .../packagegroups/packagegroup-self-hosted.bb      |    3 ++-
 ...g-frontends_3.5.bb => kconfig-frontends_3.6.bb} |    9 +++++----
 .../less/{less_444.bb => less_451.bb}              |    8 ++++----
 .../psmisc/{psmisc_22.19.bb => psmisc_22.20.bb}    |    4 ++--
 .../{sysstat_10.1.1.bb => sysstat_10.1.2.bb}       |    4 ++--
 meta/recipes-graphics/builder/builder_0.1.bb       |    7 +++++--
 .../mx/{mx_1.4.6.bb => mx_1.4.7.bb}                |   13 ++++++-------
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 .../{libcheck_0.9.8.bb => libcheck_0.9.9.bb}       |    7 ++++---
 meta/recipes-support/sqlite/sqlite3_3.7.13.bb      |   11 -----------
 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb    |   11 +++++++++++
 12 files changed, 43 insertions(+), 38 deletions(-)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.5.bb => kconfig-frontends_3.6.bb} (88%)
 rename meta/recipes-extended/less/{less_444.bb => less_451.bb} (82%)
 rename meta/recipes-extended/psmisc/{psmisc_22.19.bb => psmisc_22.20.bb} (46%)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.1.bb => sysstat_10.1.2.bb} (44%)
 rename meta/recipes-graphics/mx/{mx_1.4.6.bb => mx_1.4.7.bb} (66%)
 rename meta/recipes-support/libcheck/{libcheck_0.9.8.bb => libcheck_0.9.9.bb} (74%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.13.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb

-- 
1.7.7.6



