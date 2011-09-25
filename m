Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R7rDq-0002oW-7T
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 18:06:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3Rfe016327; Sun, 25 Sep 2011 17:03:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AInKpLr0Kuqa; Sun, 25 Sep 2011 17:03:27 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3MJu016305
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT);
	Sun, 25 Sep 2011 17:03:24 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>)
	id 1R7r4d-0005W7-M0; Sun, 25 Sep 2011 16:56:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 16:56:58 +0100
Message-Id: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/9] Various misc fixes/cleanups
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
X-List-Received-Date: Sun, 25 Sep 2011 16:06:33 -0000

I've placed various misc fixes/cleanups into the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/master

Richard Purdie (9):
  gnome-desktop: Ensure we're deterministic about startup-notification
    dependency
  gtk+: Explicitly disable xinerama since we don't have it as a DEPENDS
  cairo: Disable bfd symbol loopup since we don't list it in DEPENDS
  libsndfile1: Disable external codec librbaries since we don't list in
    DEPENDS
  neon: Add libproxy to DEPENDS to ensure determinstic builds
  libtool: Fix an issue where unnecessary rpaths were being injected
  autotools.bbclass: Set the dynamic linker search path for libtool
    correctly
  base.bbclass: Drop legacy code that is no longer useful/used
  sstate: No need to spew out a debug message per file, summarise
    instead

 meta/classes/autotools.bbclass                     |    2 +
 meta/classes/base.bbclass                          |   30 ---------
 meta/classes/native.bbclass                        |    3 +
 meta/classes/sstate.bbclass                        |    7 +-
 meta/recipes-devtools/libtool/libtool-cross_2.4.bb |    2 +-
 .../recipes-devtools/libtool/libtool-native_2.4.bb |    2 +-
 .../libtool/libtool-nativesdk_2.4.bb               |    2 +-
 meta/recipes-devtools/libtool/libtool.inc          |    3 +-
 meta/recipes-devtools/libtool/libtool/1            |   55 +++++++++++++++++
 .../libtool/libtool/fix-rpath.patch                |   63 ++++++++++++++++++++
 meta/recipes-devtools/libtool/libtool_2.4.bb       |    2 +-
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    4 +-
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb             |    4 +-
 meta/recipes-graphics/cairo/cairo.inc              |    3 +
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    2 +-
 .../libsndfile/libsndfile1_1.0.24.bb               |    4 +-
 meta/recipes-support/neon/neon_0.29.5.bb           |    4 +-
 17 files changed, 146 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/1
 create mode 100644 meta/recipes-devtools/libtool/libtool/fix-rpath.patch

-- 
1.7.5.4



