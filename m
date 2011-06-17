Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXaSK-0004YJ-2f
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 16:55:32 +0200
Received: by yxe1 with SMTP id 1so1412892yxe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=/Mp7T36zVZ50yx13vlNk/+eCr9LBz+UZ42amZ4oBDo8=;
	b=Vdeb896fym373D1mpOkljmjYxrCdPet8PUR1HF8K3/awsC/dUiMHassSORSWg+G9JZ
	F4rqGPNjmAB1VLnypbvO3gKX/u1Tgg5CTxo/Z8L0ldouAm6+w8M05rkB3DMy/HXauAZX
	m7UVyZZrSclf+Y8QO1LUlJhlFfnj6FZ1Mn15I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=QmbR/lkOiMw0tKCuxYI43DDyhszUWIqWiRh/1maTGIphHeq4tBfsDvA2Q8QtVgvYe2
	FzvrXNiaODpVwrkiKy3AOMjy9GtpQWksVFnOCloveimoREj9MLmx6FNmT8fRDcSSBWDO
	xA+lQXa9nuZdU0yBSdFKsBmMpixlRZrQBtsrg=
Received: by 10.236.190.232 with SMTP id e68mr3680761yhn.193.1308322318033;
	Fri, 17 Jun 2011 07:51:58 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k10sm1754092yhj.50.2011.06.17.07.51.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:51:56 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 14:51:34 +0000
Message-Id: <cover.1308322247.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/9] Patches pending on O.S. Systems tree
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
X-List-Received-Date: Fri, 17 Jun 2011 14:55:32 -0000

The following changes since commit 835d817f1ba7b99167743fdb86ba80f3a07bd82d:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:12:40 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Chris Larson (3):
  oe.classutils: add module
  Rework how the devshell functions
  oe.terminal: improve how we spawn screen

Otavio Salvador (6):
  cmake.bbclass: use CPPFLAGS and CXXFLAGS
  cmake: refactor recipe
  lib_package.bbclass: move static libraries to ${PN}-staticdev
  libxml: extend nativesdk class
  libarchive: add 2.8.4 version
  cmake: add nativesdk and target versions

 meta/classes/cmake.bbclass                         |    8 +-
 meta/classes/devshell.bbclass                      |   26 ++---
 meta/classes/lib_package.bbclass                   |    2 +-
 meta/classes/terminal.bbclass                      |   30 ++++++
 meta/lib/oe/classutils.py                          |   45 ++++++++
 meta/lib/oe/terminal.py                            |  107 ++++++++++++++++++++
 meta/recipes-core/libxml/libxml2.inc               |    3 +-
 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    4 +-
 meta/recipes-devtools/cmake/cmake.inc              |    6 +-
 .../cmake/cmake/dont-run-cross-binaries.patch      |   22 ++++
 meta/recipes-devtools/cmake/cmake_2.8.3.bb         |   48 +++++++++
 .../0001-Patch-from-upstream-revision-1990.patch   |   42 ++++++++
 .../0002-Patch-from-upstream-revision-1991.patch   |   31 ++++++
 .../0003-Patch-from-upstream-rev-2516.patch        |   63 ++++++++++++
 .../0004-Patch-from-upstream-rev-2514.patch        |   33 ++++++
 .../0005-Patch-from-upstream-rev-2520.patch        |   31 ++++++
 .../0006-Patch-from-upstream-rev-2521.patch        |   28 +++++
 ...YS-error-when-setting-up-xattrs.-Closes-5.patch |   31 ++++++
 .../libarchive/libarchive_2.8.4.bb                 |   25 +++++
 19 files changed, 559 insertions(+), 26 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/classutils.py
 create mode 100644 meta/lib/oe/terminal.py
 create mode 100644 meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake_2.8.3.bb
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



