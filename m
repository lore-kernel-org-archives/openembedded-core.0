Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOfsG-00085Q-H1
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 02:53:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2011 17:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="208502"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 23 May 2011 17:50:26 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 17:50:17 -0700
Message-Id: <cover.1306198151.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
Subject: [UPGRADES 0/5] upgrade of some of the toolchain recipes
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
X-List-Received-Date: Tue, 24 May 2011 00:53:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 3504c3a9b1af5a3405e0a03a5ade50b82535b6dd:

  documentation/yocto-project-qs/yocto-project-qs.xml: fixed build env script (2011-05-23 15:53:29 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib.git nitin/upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Nitin A Kamble (5):
  git: upgrade from 1.7.4.3 to 1.7.5.1
  libpcre: upgrade from 8.10 to 8.12
  byacc: upgrade from 20101127 to 20101229
  python-pygpbject: upgrade from 2.27 to 2.27.91
  distro-tracking: update toolchain recipe fields

 .../conf/distro/include/distro_tracking_fields.inc |    3 +++
 meta/recipes-devtools/git/files/autotools.patch    |   16 ----------------
 meta/recipes-devtools/git/git.inc                  |    3 +--
 .../git/{git_1.7.4.3.bb => git_1.7.5.1.bb}         |    6 +++---
 ...bject_2.27.0.bb => python-pygobject_2.27.91.bb} |    6 +++---
 meta/recipes-extended/byacc/byacc_20101127.bb      |    7 -------
 meta/recipes-extended/byacc/byacc_20101229.bb      |    7 +++++++
 .../libpcre/{libpcre_8.10.bb => libpcre_8.12.bb}   |    6 +++---
 8 files changed, 20 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/files/autotools.patch
 rename meta/recipes-devtools/git/{git_1.7.4.3.bb => git_1.7.5.1.bb} (56%)
 rename meta/recipes-devtools/python/{python-pygobject_2.27.0.bb => python-pygobject_2.27.91.bb} (87%)
 delete mode 100644 meta/recipes-extended/byacc/byacc_20101127.bb
 create mode 100644 meta/recipes-extended/byacc/byacc_20101229.bb
 rename meta/recipes-support/libpcre/{libpcre_8.10.bb => libpcre_8.12.bb} (94%)

-- 
1.7.3.5



