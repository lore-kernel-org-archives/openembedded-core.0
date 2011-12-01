Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWGUw-0007bT-MR
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 00:57:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 15:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81299142"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 15:50:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 15:50:12 -0800
Message-Id: <cover.1322783370.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/6] More Updates
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
X-List-Received-Date: Thu, 01 Dec 2011 23:57:02 -0000

The following changes since commit aa0cb889a4ef883235dc3f3e1d76ee4a556ae03a:

  libtool: Upgrade from 2.4 -> 2.4.2 (2011-12-01 20:39:11 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (6):
  resolvconf: Update to 1.62
  psmisc: Update to 22.14
  sysstat: Update to 10.0.3
  sqlite3: Update to 3.7.9
  less: Update to 444
  distro tracking updates

 .../conf/distro/include/distro_tracking_fields.inc |  100 ++++++++++---------
 .../{resolvconf_1.61.bb => resolvconf_1.62.bb}     |    6 +-
 .../less/{less_443.bb => less_444.bb}              |    5 +-
 .../psmisc/files/libintl-link.patch                |   22 +++--
 meta/recipes-extended/psmisc/psmisc.inc            |    8 +-
 .../psmisc/{psmisc_22.13.bb => psmisc_22.14.bb}    |    6 +-
 .../{sysstat_10.0.2.bb => sysstat_10.0.3.bb}       |    6 +-
 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb     |   10 --
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb       |   11 ++
 9 files changed, 92 insertions(+), 82 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.61.bb => resolvconf_1.62.bb} (78%)
 rename meta/recipes-extended/less/{less_443.bb => less_444.bb} (87%)
 rename meta/recipes-extended/psmisc/{psmisc_22.13.bb => psmisc_22.14.bb} (42%)
 rename meta/recipes-extended/sysstat/{sysstat_10.0.2.bb => sysstat_10.0.3.bb} (42%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.9.bb

-- 
1.7.6.4



