Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlFgo-0001mf-9U
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:34:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 00:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,259,1309762800"; d="scan'208";a="31038657"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 00:30:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 00:30:36 -0700
Message-Id: <cover.1311578785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED 25 July PULL 0/7]
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
X-List-Received-Date: Mon, 25 Jul 2011 07:34:59 -0000

Richard,

Here is a small collection of pull requests that upgrade and fix
some bugs.

Note: I did not include TomR or your pull request, although I did 
do some testing with both pull sets included and they passed build 
testing.

Thanks
	Sau!

The following changes since commit b4c23fce3eadaff8fc621d38759d493cd03cc131:

  consolekit 0.4.5: fix PAM installation dir (2011-07-22 11:56:42 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dexuan Cui (2):
  tcf-agent: upgrade to the latest stable revision 0.0+svnr1855
  distro_tracking_fields.inc: update the info for tcf-agent

Kumar Gala (1):
  gcc-4.6: Fix packaging of native toolchains

Saul Wold (3):
  openjade-native: Add SYSROOT_PREPROCESS_FUNC
  docbook-sgml-dtd-native: Add SYSROOT_PREPROCESS_FUNC
  docbook-dsssl-stylesheets-native: Add SYSROOT_PREPROCESS_FUNC

Scott Garman (1):
  runqemu: report error if TMPDIR cannot be determined

 .../conf/distro/include/distro_tracking_fields.inc |   12 +-
 .../docbook-dsssl-stylesheets-native_1.79.bb       |   12 +-
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc   |   11 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    1 +
 .../openjade/openjade-native_1.3.2.bb              |   12 +-
 .../tcf-agent/tcf-agent/fix_ranlib.patch           |   14 +
 .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |   14 +-
 .../tcf-agent/tcf-agent/terminals_agent.patch      | 1027 --------------------
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |   32 +-
 scripts/runqemu                                    |   27 +-
 11 files changed, 97 insertions(+), 1067 deletions(-)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
 delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/terminals_agent.patch

-- 
1.7.3.4



