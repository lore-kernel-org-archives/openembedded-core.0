Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYVoK-0003N6-Ph
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 06:46:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2012 21:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,248,1352102400"; d="scan'208";a="246693775"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2012 21:32:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 21:32:42 -0800
Message-Id: <cover.1352871028.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/9] Fixes and Updates
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
X-List-Received-Date: Wed, 14 Nov 2012 05:46:54 -0000

Richard,

This is a batch of changes that I have had pending in my
queue for the last couple of weeks, got around to final
testing.  

The self-hosted and builder changes are for enabling the
Build Appliance with Windows and Eclipse

The pulseaudio change should also be marked for Danny to
address a meta-guacamayo issue.

Thanks
	Sau!


The following changes since commit fa7fb44d1ca2b8a57509806bde19672c68ef157d:

  mesa-demos: fix --with-glut check (2012-11-12 22:31:41 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (9):
  packagegroup-self-hosted: add sftp server
  builder: Add password for user
  less: Update to 451
  psmisc: Update to 22.20
  kconfig-frontends: Update to 3.6
  sysstat: Update to 10.1.2
  mx: Update to 1.4.7
  sqlite3: Update to 3.7.14.1
  pulse: fix Bashism in string test

 .../packagegroups/packagegroup-self-hosted.bb      |    3 ++-
 ...g-frontends_3.5.bb => kconfig-frontends_3.6.bb} |    9 +++++----
 .../less/{less_444.bb => less_451.bb}              |    8 ++++----
 .../psmisc/{psmisc_22.19.bb => psmisc_22.20.bb}    |    4 ++--
 .../{sysstat_10.1.1.bb => sysstat_10.1.2.bb}       |    5 +++--
 meta/recipes-graphics/builder/builder_0.1.bb       |    5 +++--
 .../mx/{mx_1.4.6.bb => mx_1.4.7.bb}                |   13 ++++++-------
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 .../{sqlite3_3.7.13.bb => sqlite3_3.7.14.1.bb}     |    5 +----
 10 files changed, 28 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.5.bb => kconfig-frontends_3.6.bb} (88%)
 rename meta/recipes-extended/less/{less_444.bb => less_451.bb} (82%)
 rename meta/recipes-extended/psmisc/{psmisc_22.19.bb => psmisc_22.20.bb} (46%)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.1.bb => sysstat_10.1.2.bb} (44%)
 rename meta/recipes-graphics/mx/{mx_1.4.6.bb => mx_1.4.7.bb} (66%)
 rename meta/recipes-support/sqlite/{sqlite3_3.7.13.bb => sqlite3_3.7.14.1.bb} (58%)

-- 
1.7.7.6



