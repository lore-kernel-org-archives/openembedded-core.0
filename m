Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAB-0001pu-Cy
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:43 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:03 -0700
Received: by wibhm11 with SMTP id hm11so3229024wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pstDSKGOyzaYgTBvgZZTw7mlEzsxoRJ1HjVmZbp1J0I=;
	b=hE7MZeoi1AUIVjVu2MxyIe7d1uiVtuiHGVyewozFgZqIJjvPJldEq8IHa/d6q97Cbx
	+147HOc0aQOCcgo7dEf5qGDxiqAwznCDhIHPSUYkxTocxLEvjYJIhzFRUZZD/Nubtxzr
	hDqi4fZqN9HTorLf2q/RbAU5bFzhHLoFANM+maj+WFGiI8NYP2pPYYFPHYVy5znvzL80
	ZPfs5jH7eu5zA+za9Fy3ScIxGivC7V3dW+5hCDVcQ0iXySpUZ57suVZ3xiNolp6uogpG
	RQcFywkAAtdU+Z71WD8lIj1/ua869BP/ISyUEHT+fWdPx7w+xsvbTVVJAoyhtGOndoPT
	r3Zg==
Received: by 10.216.134.216 with SMTP id s66mr8465062wei.26.1343835422277;
	Wed, 01 Aug 2012 08:37:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:27 +0100
Message-Id: <cover.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnwF60JOEBt2SauQb2ve2y+/tO90aa5BTVxHBMaO3jHEOMEAh4ob6b4/B6r8qL90mceYX2G
Subject: [PATCH 00/11] Mesa upgrade/improvements V2
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:44 -0000

Split out the meta-yocto changes, used PACKAGECONFIG (please review this
bit), dropped the gles feature, enabled glesv1.

Even if there is some debate over the latter GLES/EGL patches, it would be
good to see the earlier patches land.

The following changes since commit 3309cf42d314f0a26079a11836c6b9b9bb5f253e:

  package_rpm.bbclass: Accomodate dash when using arrays (2012-07-31 12:22:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to ad0d7de863e412bb757f13e2d250fcab4e19dadb:

  mesa-demos: fix GLES2 build (2012-08-01 16:32:51 +0100)

----------------------------------------------------------------
Damien Lespiau (2):
      mesa: Update to 8.0.4 (latest stable version)
      mesa: Use 'require' instead of 'include'

Ross Burton (9):
      mesa: format the packages list nicely
      mesa: move glu.pc to libglu-dev
      mesa: add --enable-shared-glapi, and package it in libglapi
      mesa: enable the Graphic Buffer Manager library
      mesa: enable GLES v1 and v2
      mesa: enable EGL, with DRM and X11 platforms
      mesa: respect x11 DISTRO_FEATURE
      mesa: no need to depend on python-native, the class does that
      mesa-demos: fix GLES2 build

 .../mesa/{mesa-7.11.inc => mesa-8.0.4.inc}         |   14 +++---
 meta/recipes-graphics/mesa/mesa-common.inc         |   46 ++++++++++++-----
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
 18 files changed, 210 insertions(+), 122 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-7.11.inc => mesa-8.0.4.inc} (60%)
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
  mesa: format the packages list nicely
  mesa: move glu.pc to libglu-dev
  mesa: add --enable-shared-glapi, and package it in libglapi
  mesa: enable the Graphic Buffer Manager library
  mesa: enable GLES v1 and v2
  mesa: enable EGL, with DRM and X11 platforms
  mesa: respect x11 DISTRO_FEATURE
  mesa: no need to depend on python-native, the class does that
  mesa-demos: fix GLES2 build

 .../mesa/{mesa-7.11.inc => mesa-8.0.4.inc}         |   14 +++---
 meta/recipes-graphics/mesa/mesa-common.inc         |   46 ++++++++++++-----
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
 18 files changed, 210 insertions(+), 122 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-7.11.inc => mesa-8.0.4.inc} (60%)
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



