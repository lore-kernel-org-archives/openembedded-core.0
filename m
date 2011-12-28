Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rfz2S-0005if-CM
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 20:19:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2011 11:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90309402"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.80])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2011 11:12:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 11:12:21 -0800
Message-Id: <cover.1325099430.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/6] Misc Fixes and Updates
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
X-List-Received-Date: Wed, 28 Dec 2011 19:19:48 -0000

Richard,

Some fixes for issues that have popped up and a couple of recipe updates.

Sau!

The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (6):
  libiconv: Update to 1.14
  dropbear: fix CRYPTLIB patch
  python: add md5module support
  boost: Cleanup multiple BJAM_OPTS
  util-linux: Update to 2.20.1
  distro_tracking: Update Manual Check Dates

 .../conf/distro/include/distro_tracking_fields.inc |   42 ++++++------
 .../dropbear-0.53.1-static_build_fix.patch         |   67 ++++++++++++++------
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    2 +-
 .../MCONFIG                                        |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../swapargs.h                                     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 .../{util-linux_2.19.1.bb => util-linux_2.20.1.bb} |   11 ++--
 .../recipes-devtools/python/python-native_2.7.2.bb |    6 +-
 .../python/python/add-md5module-support.patch      |   13 ++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 meta/recipes-support/boost/boost.inc               |   11 +++-
 meta/recipes-support/boost/boost_1.47.0.bb         |   17 -----
 .../autoconf.patch                                 |    0
 .../{libiconv_1.13.1.bb => libiconv_1.14.bb}       |    4 +-
 22 files changed, 108 insertions(+), 74 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.19.1.bb => util-linux_2.20.1.bb} (84%)
 create mode 100644 meta/recipes-devtools/python/python/add-md5module-support.patch
 rename meta/recipes-support/libiconv/{libiconv-1.13.1 => libiconv-1.14}/autoconf.patch (100%)
 rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb => libiconv_1.14.bb} (88%)

-- 
1.7.6.4



