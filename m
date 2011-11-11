Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu4P-0005YU-Kt
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:35:14 +0100
Received: by bkbzs2 with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YOEd5odR5RKk/kTBuMt2Ry+Im2HIYNyxHYAFtXVsViQ=;
	b=wor9DHjhTBjLdUiwt8Rl8NspvGeLptXBP9rNrYt9/1VeSJ2n+Xx7TjF/NGX0HKeIEn
	u/TglEUoG7NqscpquM/Y7fwt+aI8OuK9ynmenQPqpJT+2diCvegkkxpmwUP3iLCc273o
	0Xmi4Zpx4Y9J3MCvheL0p36CSwAwnFsZ43oj4=
Received: by 10.204.147.215 with SMTP id m23mr8806175bkv.84.1321028935468;
	Fri, 11 Nov 2011 08:28:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm11737901bka.0.2011.11.11.08.28.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:28:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:46 +0100
Message-Id: <cover.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
Subject: [PATCH][oe-core 00/22] QT4, thumb, subversion, mesa, libsdl, time, util-linux, kbd changes
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
X-List-Received-Date: Fri, 11 Nov 2011 16:35:14 -0000

Hi,

please merge following changes or at least some of them :).

qt4: change is resent because nobody commented more after Simon explained why it's needed
thumb: changes have now improved commit messages and PR bumps
subversion: RP said that bitbake fetcher should be improved but having 1.7.0
  available now with negative D_P won't hurt anybody and will make testing of
  newer fetcher code easier
mesa: just as reminder
libsdl: resent with extra patch alsa-nativesdk
time, util-linux, kbd: added u-a calls, because of conflicts with default busybox config

The following changes since commit a8ed4fcd79f6283c1d45f347dce894d784183900:

  xinit: rdepends on util-linux-mcookie to avoid brining whole util-linux (2011-11-11 11:00:56 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (21):
  libatomics-ops: force ARM mode
  pulseaudio-0.9.23: force ARM mode
  aspell: force ARM mode
  webkit-gtk: force arm mode to work around binutils segfault
  subversion: add 1.7.0 with native support and negative D_P for now
  base.bbclass: add subversion-native to DEPENDS if there is svn:// in
    SRC_URI
  mesa: package gl/egl/osmesa to separate packages
  mesa-common: install internal GL headers to libgl-dev
  alsa-lib: add nativesdk BBCLASSEXTEND
  libsdl: drop unused files
  libsdl: rename files dir to libsdl-1.2.14 for faster lookup
  libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes
    from meta-oe
  libsdl: enable alsa/opengl based on PACKAGECONFIG and respect
    DISTRO_FEATURES
  libsdl: replace tabs with spaces
  time: rename files dir to time-1.7 for faster lookup
  time: drop default S and 2 useless comments
  time: use u-a for time, conflicts with busybox
  util-linux: use u-a for flock and blockdev, conflicts with busybox
  util-linux: add missing u-a calls for setsid chrt
  util-linux: bump PR after u-a changes
  kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with
    busybox

Simon Busch (1):
  qt4-x11-free: bring back pkg-config fixups

 meta/classes/base.bbclass                          |    8 +++-
 meta/recipes-core/kbd/kbd_1.15.2.bb                |   29 ++++++++++-
 meta/recipes-core/util-linux/util-linux.inc        |   14 ++++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../subversion/subversion-1.7.0/libtool2.patch     |   15 +++++
 .../subversion/subversion_1.7.0.bb                 |   37 +++++++++++++
 .../time/{files => time-1.7}/debian.patch          |    0
 meta/recipes-extended/time/time.inc                |   10 ++++
 meta/recipes-extended/time/time_1.7.bb             |    5 +-
 .../libsdl/files/directfb_obsolete_calls.patch     |   35 ------------
 .../recipes-graphics/libsdl/files/extra-keys.patch |   55 --------------------
 .../{files => libsdl-1.2.14}/configure_tweak.patch |    0
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb      |   28 +++++++---
 meta/recipes-graphics/mesa/mesa-common.inc         |   18 ++++++-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb  |    2 +-
 .../pulseaudio/libatomics-ops_1.2.bb               |    4 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |   16 +++++-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |   19 ++++++-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    3 +-
 20 files changed, 187 insertions(+), 116 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
 rename meta/recipes-extended/time/{files => time-1.7}/debian.patch (100%)
 delete mode 100644 meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
 delete mode 100644 meta/recipes-graphics/libsdl/files/extra-keys.patch
 rename meta/recipes-graphics/libsdl/{files => libsdl-1.2.14}/configure_tweak.patch (100%)

-- 
1.7.8.rc1



