Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAif4-0004mF-R3
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:28 +0200
Received: by mail-gy0-f175.google.com with SMTP id 8so3335061gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3Sw5sVTyVYp0ZiY/QkxcFg4rh1taIgaN63R3kv8Z1ys=;
	b=NYhU89wc9VZz0ga3C5Opu11o0Uvw0KxjpNGqQ6Xrc+3K+OVnAfOh9LthILPc4/BRip
	PFLdpp5HRsSSZ860TBW2YyPW7TvV0bUniOV3i1RN5BhjsSbmAwrp0uYeTUm2ZA0Y84EH
	QIv3S6UBDqSIoM5T4iRHmIQSLQVP2gDUvXcmU=
Received: by 10.223.8.2 with SMTP id f2mr7652444faf.23.1317648536015;
	Mon, 03 Oct 2011 06:28:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x22sm21295936faa.5.2011.10.03.06.28.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:28:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:47 +0200
Message-Id: <cover.1317648040.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <20111003103855.GN7364@jama.jama.net>
References: <20111003103855.GN7364@jama.jama.net>
Subject: [PATCHv2 00/30] Xorg related changes
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:28 -0000

Hi,

this patchset brings meta-oe and oe-core xorg stuff together and most of
xorg recipes will be removed from meta-oe (sending another pull request now).

This step is needed to be able to separate common x11 to meta-x11 or whatever later.

The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead13d9:

  base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/x11
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/x11

Martin Jansa (29):
  libxft, libxrender, renderproto: add native BBCLASSEXTEND
  xorg-app-common: merge some changes from meta-oe
  xorg-driver: rename .inc files and merge some changes from meta-oe
  xf86-video-omapfb: bump SRCREV and add patch from meta-oe
  libdrm: improve packaging
  rgb: import from meta-oe layer
  xserver-xf86-dri-lite: remove old git recipe
  xserver-xf86: improve packaging and move shared definitions to .inc
    files
  xserver-xf86: add new version 1.11.1
  xserver-xf86: remove old 1.10.1 version
  xserver-xf86-dri-lite: remove COMPATIBLE_HOST
  xserver-xf86: drop unused files
  xserver-xf86: move patches to xserver-xf86-dri-lite-1.11.1 and use
    same directory from xserver-xf86-lite recipe
  xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
  xserver-kdrive: drop unused files (same files are in
    xserver-kdrive-1.7.99.2 directory
  xorg-driver-common: bump INC_PR to rebuild drivers agains new
    xserver-xorg ABI
  libx11: package xcb, merge few changes from meta-oe
  libx11: add new version 1.4.4
  libx11: remove older 1.3.4
  libx11: drop old 1.2.2 git version
  libx11-trim: move files for libx11-trim from libx11-1.3.4 to
    libx11-trim-1.3.4
  libx11-diet: move old patches used only by libx11-diet-1.3 to
    separate directory
  libx11-diet: add SRC_URI checksums
  xserver-nodm-init: merge some changes from meta-oe
  glx-use-tls: add from meta-oe layer
  mesa: add mesa-dri.inc and mesa-xlib.inc with shared options, move
    uclibc.patch
  mesa-dri-glsl-native: drop recipe which wasn't usefull since 7.8.2
    was removed
  mesa: add new version 7.11
  mesa: drop older 7.10.2 and 7.7+git recipes

Richard Purdie (1):
  xserver/mesa: Bump PR after libdrm packaging changes

 meta/classes/glx-use-tls.bbclass                   |    7 +
 meta/conf/distro/include/default-providers.inc     |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |   20 +-
 meta/conf/machine/qemux86-64.conf                  |    6 +-
 meta/conf/machine/qemux86.conf                     |    6 +-
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-graphics/drm/libdrm.inc               |    7 +-
 meta/recipes-graphics/drm/libdrm_2.4.26.bb         |    2 +-
 meta/recipes-graphics/drm/libdrm_git.bb            |    2 +-
 meta/recipes-graphics/mesa/mesa-7.11.inc           |   15 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   36 ++-
 .../mesa/mesa-dri-glsl-native_7.11.bb              |   28 +
 .../mesa/mesa-dri-glsl-native_7.8.2.bb             |   27 -
 meta/recipes-graphics/mesa/mesa-dri.inc            |   22 +
 meta/recipes-graphics/mesa/mesa-dri/cross2.patch   |   46 --
 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch |   18 -
 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h |  162 ------
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |   40 --
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 +
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |   57 --
 meta/recipes-graphics/mesa/mesa-xlib.inc           |    1 +
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |   22 -
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    4 +
 .../mesa/{mesa-dri => mesa}/uclibc.patch           |    0
 .../x11-common/xserver-nodm-init/xserver-nodm      |   30 +-
 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb        |   10 +
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |   10 +-
 .../xorg-driver/xf86-input-evdev_2.6.0.bb          |    4 +-
 .../xorg-driver/xf86-input-keyboard_1.6.0.bb       |    4 +-
 .../xorg-driver/xf86-input-keyboard_git.bb         |    3 +-
 .../xorg-driver/xf86-input-mouse_1.7.0.bb          |    4 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |    4 +-
 .../xorg-driver/xf86-input-synaptics_1.4.0.bb      |    4 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        |    3 +-
 .../xorg-driver/xf86-input-vmmouse_12.7.0.bb       |    4 +-
 .../xorg-driver/xf86-video-intel_2.15.0.bb         |    4 +-
 .../xorg-driver/xf86-video-intel_git.bb            |    4 +-
 .../0004-Attempt-to-fix-VRFB.patch                 |  325 +++++++++++
 .../xorg-driver/xf86-video-omapfb_git.bb           |   20 +-
 .../xorg-driver/xf86-video-vesa_2.3.0.bb           |    4 +-
 .../xorg-driver/xf86-video-vmware_11.0.3.bb        |    4 +-
 ...86-driver-common.inc => xorg-driver-common.inc} |   14 +-
 ...xf86-input-common.inc => xorg-driver-input.inc} |    3 +-
 ...xf86-video-common.inc => xorg-driver-video.inc} |    2 +-
 .../xorg-lib/libx11-1.4.4/keysymdef_include.patch  |   23 +
 .../libx11-1.4.4/x11_disable_makekeys.patch        |   29 +
 .../{libx11 => libx11-diet-1.3}/X18NCMSstubs.diff  |    0
 .../fix-disable-xlocale.diff                       |    0
 .../fix-utf8-wrong-define.patch                    |    0
 .../include_fix.patch                              |    0
 .../{libx11-git => libx11-diet-1.3}/nodolt.patch   |    0
 .../x11_disable_makekeys.patch                     |    0
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |    6 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |   17 -
 .../xorg-lib/libx11-git/X18NCMSstubs.diff          |  570 --------------------
 .../xorg-lib/libx11-git/x11_disable_makekeys.patch |   30 -
 .../include_fix.patch                              |    0
 .../makekeys_crosscompile.patch                    |    0
 .../nodolt.patch                                   |    0
 .../x11_disable_makekeys.patch                     |    0
 .../xorg-lib/libx11-trim/include_fix.patch         |   25 -
 .../xorg-lib/libx11-trim/nodolt.patch              |   14 -
 .../recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb |   10 +-
 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb  |   13 -
 meta/recipes-graphics/xorg-lib/libx11.inc          |   25 +-
 .../xorg-lib/libx11/fix-disable-xlocale.diff       |   16 -
 .../xorg-lib/libx11/fix-utf8-wrong-define.patch    |   17 -
 .../xorg-lib/libx11/include_fix.patch              |   25 -
 meta/recipes-graphics/xorg-lib/libx11/nodolt.patch |   14 -
 .../xorg-lib/libx11/x11_disable_makekeys.patch     |   31 --
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |   35 --
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |   18 +
 meta/recipes-graphics/xorg-lib/libx11_git.bb       |   14 -
 meta/recipes-graphics/xorg-lib/libx11_git.inc      |   11 -
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    2 +
 meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb |    2 +-
 .../xorg-proto/renderproto_0.11.1.bb               |    2 +-
 .../xorg-xserver/files/macro_tweak.patch           |   20 -
 .../xorg-xserver/xserver-kdrive/disable-apm.patch  |   24 -
 .../xserver-kdrive/disable-xf86-dga-xorgcfg.patch  |   43 --
 .../xorg-xserver/xserver-kdrive/extra-kmodes.patch |   87 ---
 .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |   63 ---
 .../xserver-kdrive/no-serial-probing.patch         |   17 -
 .../xorg-xserver/xserver-xf86-common.inc           |   37 --
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |   37 --
 .../cache-xkbcomp-output-for-fast-start-up.patch   |  360 ------------
 .../xserver-xf86-dri-lite/fix_macros1.patch        |   24 -
 .../fix_open_max_preprocessor_error.patch          |   15 -
 .../xserver-xf86-dri-lite/macro_tweak.patch        |   30 -
 .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 -
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |   25 -
 .../xorg-xserver/xserver-xf86-lite.inc             |   34 --
 .../xserver-xf86-lite/crosscompile.patch           |   22 -
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 -
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    7 +
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    7 +-
 .../xorg-xserver/xserver-xorg-common.inc           |  126 +++++
 .../xorg-xserver/xserver-xorg-lite.inc             |    6 +
 .../xorg-xserver/xserver-xorg-lite_1.11.1.bb       |    4 +
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   13 +
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    4 +
 103 files changed, 792 insertions(+), 2192 deletions(-)
 create mode 100644 meta/classes/glx-use-tls.bbclass
 create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/cross2.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_git.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/uclibc.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-Attempt-to-fix-VRFB.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-driver-common.inc => xorg-driver-common.inc} (66%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-common.inc => xorg-driver-input.inc} (81%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-common.inc => xorg-driver-video.inc} (65%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/X18NCMSstubs.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/fix-disable-xlocale.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/fix-utf8-wrong-define.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/include_fix.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/nodolt.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim => libx11-diet-1.3}/x11_disable_makekeys.patch (100%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/include_fix.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/nodolt.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/x11_disable_makekeys.patch (100%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_git.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/no-serial-probing.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xorg-1.11.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xorg-1.11.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xorg-1.11.1}/macro_tweak.patch (74%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb

-- 
1.7.7



