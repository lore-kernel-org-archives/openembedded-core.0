Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymO-0006Nv-Nc
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:46 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:49:52 -0700
Received: by wibhr14 with SMTP id hr14so4182449wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=BXr/MyraHDZaVque4B+vkFG5AXxcVHlnjEYZ0tOwF30=;
	b=FjKZ5FEZGDgfhwCEzd4unDcxiMM+MeemdSvKJWfk1KEVcQb9+09nWyvw2+6lDHxqHR
	9jf3bj9/5JFxT3w5K2/pzPcU5iNxlkDlTbhE152T7ucvIOf6NL6NEDaTqZ5RcNaHpKjz
	gTPbWwT4L5U4B+g5JDLpvUgXPyDENFE39e8IheG4QczJjZz+Q2bmWkLCK7rIzVoI0mbc
	cLr8/6r7uR57uTioOj/HeQ78mVzfb+C4uZxNC+yheENHEG+H5/uml5u4Rrk2ES7KBMa3
	hOqtJ2OasxISM37SFJYDivkMZ9t9U+zasVU9w52uAJYGdgH71dVqNiEvRYIH8/VVOqps
	libw==
Received: by 10.216.138.73 with SMTP id z51mr10706369wei.39.1343926189877;
	Thu, 02 Aug 2012 09:49:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:48:54 +0100
Message-Id: <cover.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQntVDpxzk5otcZuYUYaxdxF1yn2MVkjAeCKBrEVjyXsXUWvrEatTWSqc8r5XWibP2TwuqHF
Subject: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:47 -0000

Re-arranged and fixed up some problems.

The following changes since commit 62d42fe3cfa575cb97b484ccf7b2e9a25cc50770:

  tiny-init: Setup /dev/ptmx in init (2012-08-01 23:11:18 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to 5de29e150a720ccb8749362cfe5fb56f234fb385:

  mesa: enable EGL, with DRM and X11 platforms (2012-08-02 17:43:18 +0100)

----------------------------------------------------------------
Damien Lespiau (2):
      mesa: Update to 8.0.4 (latest stable version)
      mesa: Use 'require' instead of 'include'

Ross Burton (9):
      mesa: no need to depend on python-native, the class does that
      mesa: format the packages list nicely
      mesa: move glu.pc to libglu-dev
      mesa: add --enable-shared-glapi, and package it in libglapi
      mesa: enable the Graphic Buffer Manager library
      mesa: enable GLES v1 and v2
      mesa-demos: fix GLES2 build
      mesa: respect x11 DISTRO_FEATURE
      mesa: enable EGL, with DRM and X11 platforms

 .../mesa/{mesa-7.11.inc => mesa-8.0.4.inc}         |   14 +++---
 meta/recipes-graphics/mesa/mesa-common.inc         |   43 +++++++++++-----
 .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
 ...ative_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} |    4 +-
 meta/recipes-graphics/mesa/mesa-dri.inc            |   12 ++++-
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
 meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
 meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
 .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++++++++
 ...ossfix-mklib.patch => 0002-cross-compile.patch} |   39 ++++++++++++---
 ...sa_fix_for_x32.patch => 0003-fix-for-x32.patch} |   30 +++++++----
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
 meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
 meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 ----------------
 19 files changed, 222 insertions(+), 122 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-7.11.inc => mesa-8.0.4.inc} (60%)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} (84%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch => 0002-cross-compile.patch} (68%)
 rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch => 0003-fix-for-x32.patch} (59%)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch

Damien Lespiau (2):
  mesa: Update to 8.0.4 (latest stable version)
  mesa: Use 'require' instead of 'include'

Ross Burton (9):
  mesa: no need to depend on python-native, the class does that
  mesa: format the packages list nicely
  mesa: move glu.pc to libglu-dev
  mesa: add --enable-shared-glapi, and package it in libglapi
  mesa: enable the Graphic Buffer Manager library
  mesa: enable GLES v1 and v2
  mesa-demos: fix GLES2 build
  mesa: respect x11 DISTRO_FEATURE
  mesa: enable EGL, with DRM and X11 platforms

 .../mesa/{mesa-7.11.inc => mesa-8.0.4.inc}         |   14 +++---
 meta/recipes-graphics/mesa/mesa-common.inc         |   43 +++++++++++-----
 .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
 ...ative_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} |    4 +-
 meta/recipes-graphics/mesa/mesa-dri.inc            |   12 ++++-
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
 meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
 meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
 .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++++++++
 ...ossfix-mklib.patch => 0002-cross-compile.patch} |   39 ++++++++++++---
 ...sa_fix_for_x32.patch => 0003-fix-for-x32.patch} |   30 +++++++----
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
 meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
 meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 ----------------
 19 files changed, 222 insertions(+), 122 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-7.11.inc => mesa-8.0.4.inc} (60%)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} (84%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch => 0002-cross-compile.patch} (68%)
 rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch => 0003-fix-for-x32.patch} (59%)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch

-- 
1.7.10



