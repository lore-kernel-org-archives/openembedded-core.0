Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fe0-00011u-0y
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cY4t004525; Tue, 13 Mar 2012 00:38:34 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kHuRB9r8kUz9; Tue, 13 Mar 2012 00:38:34 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cTrx004516
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT);
	Tue, 13 Mar 2012 00:38:31 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>)
	id 1S7FVN-0002dK-S3; Tue, 13 Mar 2012 00:22:21 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:20 +0000
Message-Id: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 00/17] Various warning fixes
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:16 -0000

The following changes since commit f47ada62a3da879006e7cb27479dc9b72c56e923:

  cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH (2012-03-12 17:46:16 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib rpurdie/t7
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rpurdie/t7

and fix various warning messages.

Richard Purdie (17):
  leafpad: Package currently unpackaged files.
  xf86-input-vmmouse: Package unpackaged files
  sato-screenshot: Remove unneeded .la file
  librsvg: Fix unpackaged directory warnings
  matchbox-session: Clarify LICENSE as GPLv2
  wireless-tools: Clarify LICENSE field to avoid warnings
  gtk-doc: Clarify license as GPLv2
  gnome-doc-utils: Clarify license as GPLv2 and LGPLv2.1
  boost: Correct license name BSL-1 -> BSL-1.0
  shadow: Correct license Artistic -> Artistic-1.0
  perl: Clarify LICENSE with versions. Yes, its really GPLv1
  license.bbclass: Add mapping for LGPLv2.0, pango uses it
  qemu-config: Clarify license as GPLv2
  bluez4: Ensure the plugins directory is packaged to avoid warnings
  rpm: Add rpmdeps-oecore to appropriate package
  python-pycairo: Fix incorrect versions in license field
  xserver-xorg: Remove unneeded empty directory, fixing QA warning

 meta/classes/license.bbclass                       |    1 +
 meta/recipes-bsp/qemu-config/qemu-config.bb        |    4 ++--
 meta/recipes-connectivity/bluez/bluez4_4.98.bb     |    2 +-
 .../wireless-tools/wireless-tools_29.bb            |    4 ++--
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    4 ++--
 .../python/python-pycairo_1.10.0.bb                |    4 ++--
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 ++-
 .../shadow/shadow-native_4.1.4.3.bb                |    4 ++--
 .../shadow/shadow-sysroot_4.1.4.3.bb               |    4 ++--
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    4 ++--
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc.bb              |    2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    7 ++++++-
 .../matchbox-session/matchbox-session_0.1.bb       |    4 +++-
 .../xorg-driver/xf86-input-vmmouse_12.7.0.bb       |   10 +++++++++-
 .../xorg-xserver/xserver-xorg-common.inc           |    4 ++++
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    6 ++++--
 .../sato-screenshot/sato-screenshot_git.bb         |    6 +++++-
 meta/recipes-support/boost/boost.inc               |    4 ++--
 20 files changed, 54 insertions(+), 27 deletions(-)

-- 
1.7.5.4



