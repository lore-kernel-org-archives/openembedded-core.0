Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7CrS-0006VU-FJ
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:32:58 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 22:24:07 +0100
Message-Id: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] Python related patches
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
X-List-Received-Date: Mon, 12 Mar 2012 21:32:58 -0000

This set of patches obsoletes all my pending
python-related patches. See the individual patches
for detailed descriptions.

All patches were runtime-tested on mips32el.

Andreas Oberritter (5):
  python, python-native: always set platform to linux2
  python: regenerate plat-linux2/*.py
  python: depend on bzip2
  python-native: distutils: don't use libdir, remove dead code path
  python, python-native: bump PR

 ...2-distutils-prefix-is-inside-staging-area.patch |    6 ++--
 .../sys_platform_is_now_always_linux2.patch        |   39 ++++++++++++++++++++
 .../recipes-devtools/python/python-native_2.7.2.bb |    1 +
 meta/recipes-devtools/python/python.inc            |    2 +-
 .../python/python/07-linux3-regen-fix.patch        |   18 ---------
 .../python/sys_platform_is_now_always_linux2.patch |   39 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |   15 +++++++-
 7 files changed, 96 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
 delete mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch

-- 
1.7.5.4



