Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfBTG-0007M7-Sh
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:51:55 +0200
Received: by yxi19 with SMTP id 19so836660yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=5DeZeTlxVJQdNnPBN1OCiBQ/laLIAefFZaxm1ZBilN4=;
	b=bB1+8x3fs4CuViSax+Z7kGKsBkaWDL90/E+7SXFqMASFtl7e6iKAJpEkTV923ZOR6y
	NkBEZOJ1ROEn8xu9MAwVdUI5E3TZsyHVbDWZW/yZAxaCxVVTtp0pansqS+GLZpIuXyEh
	Alel3aDgxlHpkeEFIA9ueYSJpqBTS7fgww3zA=
Received: by 10.150.55.9 with SMTP id d9mr1977311yba.239.1310132880659;
	Fri, 08 Jul 2011 06:48:00 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id p50sm2650140yhj.0.2011.07.08.06.47.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 06:47:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 13:47:39 +0000
Message-Id: <cover.1310132765.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/8] Patches pending for merging from O.S. Systems tree
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
X-List-Received-Date: Fri, 08 Jul 2011 13:51:55 -0000

The following changes since commit f05b7ee7716d1e5cc1ba0bbab57e91c3a0569e9e:

  x-load: Update to 1.5.0 (2011-07-05 14:16:33 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Chris Larson (2):
  Rework how the devshell functions
  oe.terminal: improve how we spawn screen

Otavio Salvador (6):
  cmake.bbclass: use CPPFLAGS and CXXFLAGS
  cmake: refactor recipe
  libarchive: add 2.8.4 version
  cmake: add nativesdk and target versions
  cmake: update to 2.8.5-rc3
  fix SDK building due TARGET_ARCH use in installation path

 meta/classes/cmake.bbclass                         |    8 +-
 meta/classes/devshell.bbclass                      |   26 ++---
 meta/classes/populate_sdk.bbclass                  |    2 +-
 meta/classes/terminal.bbclass                      |   30 ++++++
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oe/classutils.py                          |    2 +
 meta/lib/oe/terminal.py                            |  107 ++++++++++++++++++++
 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    7 --
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb  |   12 ++
 meta/recipes-devtools/cmake/cmake.inc              |    6 +-
 .../cmake/cmake/dont-run-cross-binaries.patch      |   22 ++++
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   14 ++--
 meta/recipes-devtools/cmake/cmake_2.8.5.bb         |   50 +++++++++
 .../0001-Patch-from-upstream-revision-1990.patch   |   42 ++++++++
 .../0002-Patch-from-upstream-revision-1991.patch   |   31 ++++++
 .../0003-Patch-from-upstream-rev-2516.patch        |   63 ++++++++++++
 .../0004-Patch-from-upstream-rev-2514.patch        |   33 ++++++
 .../0005-Patch-from-upstream-rev-2520.patch        |   31 ++++++
 .../0006-Patch-from-upstream-rev-2521.patch        |   28 +++++
 ...YS-error-when-setting-up-xattrs.-Closes-5.patch |   31 ++++++
 .../libarchive/libarchive_2.8.4.bb                 |   25 +++++
 21 files changed, 534 insertions(+), 38 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/terminal.py
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake_2.8.5.bb
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive_2.8.4.bb

-- 
1.7.2.5



