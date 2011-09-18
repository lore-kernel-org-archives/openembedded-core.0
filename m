Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5QTU-00028g-3n
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 01:08:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2011 16:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,402,1312182000"; d="scan'208";a="52989586"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.150])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2011 16:03:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 16:03:14 -0700
Message-Id: <cover.1316386910.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RC3 FIXES 0/4] Some fixes for RC3
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
X-List-Received-Date: Sun, 18 Sep 2011 23:08:36 -0000

This has a host contamination fix for texinfo and a non-gplv3 build
fix, some konsole fixes from Paul.

These should go in before RC3.

Thanks
	Sau!


The following changes since commit 31cb3974eeaf2a808e8da3864e70986578c58cb9:

  sanity: disable mirrors for connectivity check (2011-09-16 18:07:19 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Joshua Lock (1):
  texinfo: several changes to build without zlib and ncurses headers on
    host

Paul Eggleton (2):
  lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
  sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD

Saul Wold (1):
  base.bbclass: add crosssdk items to INCOMPATIBLE_LICENSE exclude list

 meta/classes/base.bbclass                          |    2 +-
 meta/classes/sanity.bbclass                        |    6 +++
 meta/lib/oe/terminal.py                            |   27 ++++++++++++
 .../texinfo-4.13a/disable-native-tools.patch       |   43 ++++++++++++++++++++
 .../texinfo/texinfo-4.13a/gettext-macros.patch     |   34 +++++++++++++++
 .../texinfo/texinfo-4.13a/link-zip.patch           |   16 +++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   24 +++++-----
 7 files changed, 139 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch

-- 
1.7.6



