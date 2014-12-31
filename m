Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E7D9360097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 19:39:56 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so22285241wgg.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 11:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TOFfNYG7XCbchFNMj2Ezofu7Fw0dLw6qzn6SylCq0/Y=;
	b=V7ciU0cNemZOeGOAcV7VIQ5gTIu84VzNt1xZ+wSNzXNp4dUyJrv+z93YmSWfU+v6/T
	XolPrMNviBmS0J5GvYKjoyRCOpeuySn51HN7DGPGh6c9BCHzV8ZSdSaal8/vbsSRRMWE
	Q6h+5an9I/sXVL6pljW949/DqAIc9YYjTL2x+vb7dcqq7d/CQre+2wkrfwtKIwmCuYwA
	H7+s8E6xff2tXwvKrlytawAqoFt0EcoZVTz2c+0J+n089kRSd5cWQIn//ziPXcxqKulQ
	jMHT/3poNToHT4bs8v6r8M5IBG5zS2bsTYdE0CxV9IuVaVxmJOn4yINJRgA1pg/vdodp
	L1mw==
X-Gm-Message-State: ALoCoQmyd49YKrwuIT6OsVaqWQ7yi5NOoyRTuzBLoeWYKwqx9BDOcGOjmSkT3GVMhvOQeLGh4+EJ
X-Received: by 10.180.90.176 with SMTP id bx16mr119416680wib.0.1420054796888; 
	Wed, 31 Dec 2014 11:39:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id gl5sm51238551wib.0.2014.12.31.11.39.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Dec 2014 11:39:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Dec 2014 19:38:50 +0000
Message-Id: <cover.1420054671.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/15] Upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Dec 2014 19:40:07 -0000

Hi,

A series of upgrades.  Sending as a cover letter as one of the patches contains
an over-long line that git/SMTP isn't happy about.

Ross

The following changes since commit c563059078adb4e258aff698c2c43afb33c73741:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:23:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to e8f45e726fa6939721cedda51c108b9d83c7f0f8:

  rgb: upgrade to 1.0.6. (2014-12-31 19:35:38 +0000)

----------------------------------------------------------------
Ross Burton (15):
      gst-fluendo-mp3: upgrade to 0.10.31
      waffle: upgrade to 1.5.0
      json-glib: upgrade to 1.0.2
      hicolor-icon-theme: upgrade to 0.14
      librsvg: upgrade to 2.40.6
      libpng12: upgrade to 1.2.52
      xkeyboard-config: upgrade to 2.13.
      freetype: upgrade to 2.5.4.
      xf86-video-intel: upgrade to 2.99.917
      xf86-input-evdev: upgrade to 2.9.1
      xf86-input-synaptics: upgrade to 1.8.1
      xf86-video-modesetting: upgrade to 0.9.0
      xinit: upgrade to 1.3.4
      xkbcomp: upgrade to 1.3.0
      rgb: upgrade to 1.0.6.

 .../hicolor-icon-theme/files/index.theme           | 1731 --------------------
 .../hicolor-icon-theme/hicolor-icon-theme_0.13.bb  |   28 -
 .../hicolor-icon-theme/hicolor-icon-theme_0.14.bb  |   14 +
 .../{json-glib_1.0.0.bb => json-glib_1.0.2.bb}     |    4 +-
 meta/recipes-gnome/librsvg/librsvg/vapigen.m4      |   96 --
 .../{librsvg_2.40.2.bb => librsvg_2.40.6.bb}       |   16 +-
 .../{freetype_2.5.3.bb => freetype_2.5.4.bb}       |    4 +-
 .../waffle/{waffle_1.3.0.bb => waffle_1.5.0.bb}    |    6 +-
 .../xorg-app/{rgb_1.0.5.bb => rgb_1.0.6.bb}        |    5 +-
 .../xorg-app/{xinit_1.3.3.bb => xinit_1.3.4.bb}    |    4 +-
 .../{xkbcomp_1.2.4.bb => xkbcomp_1.3.0.bb}         |    4 +-
 ...ut-evdev_2.9.0.bb => xf86-input-evdev_2.9.1.bb} |    4 +-
 ...tics_1.8.0.bb => xf86-input-synaptics_1.8.1.bb} |    4 +-
 .../xf86-video-intel/configure-dri.patch           |  166 --
 ...el_2.99.912.bb => xf86-video-intel_2.99.917.bb} |    7 +-
 ...ng_0.8.1.bb => xf86-video-modesetting_0.9.0.bb} |    4 +-
 ...ard-config_2.12.bb => xkeyboard-config_2.13.bb} |    4 +-
 .../{libpng12_1.2.51.bb => libpng12_1.2.52.bb}     |    8 +-
 ...o-mp3_0.10.19.bb => gst-fluendo-mp3_0.10.31.bb} |    6 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    2 +-
 20 files changed, 49 insertions(+), 2068 deletions(-)
 delete mode 100644 meta/recipes-gnome/hicolor-icon-theme/files/index.theme
 delete mode 100644 meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
 create mode 100644 meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.14.bb
 rename meta/recipes-gnome/json-glib/{json-glib_1.0.0.bb => json-glib_1.0.2.bb} (79%)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/vapigen.m4
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.2.bb => librsvg_2.40.6.bb} (76%)
 rename meta/recipes-graphics/freetype/{freetype_2.5.3.bb => freetype_2.5.4.bb} (92%)
 rename meta/recipes-graphics/waffle/{waffle_1.3.0.bb => waffle_1.5.0.bb} (87%)
 rename meta/recipes-graphics/xorg-app/{rgb_1.0.5.bb => rgb_1.0.6.bb} (73%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.3.bb => xinit_1.3.4.bb} (79%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.4.bb => xkbcomp_1.3.0.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.0.bb => xf86-input-evdev_2.9.1.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.0.bb => xf86-input-synaptics_1.8.1.bb} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/configure-dri.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.99.912.bb => xf86-video-intel_2.99.917.bb} (86%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-modesetting_0.8.1.bb => xf86-video-modesetting_0.9.0.bb} (64%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.12.bb => xkeyboard-config_2.13.bb} (88%)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.51.bb => libpng12_1.2.52.bb} (70%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.19.bb => gst-fluendo-mp3_0.10.31.bb} (57%)

Ross Burton (15):
  gst-fluendo-mp3: upgrade to 0.10.31
  waffle: upgrade to 1.5.0
  json-glib: upgrade to 1.0.2
  hicolor-icon-theme: upgrade to 0.14
  librsvg: upgrade to 2.40.6
  libpng12: upgrade to 1.2.52
  xkeyboard-config: upgrade to 2.13.
  freetype: upgrade to 2.5.4.
  xf86-video-intel: upgrade to 2.99.917
  xf86-input-evdev: upgrade to 2.9.1
  xf86-input-synaptics: upgrade to 1.8.1
  xf86-video-modesetting: upgrade to 0.9.0
  xinit: upgrade to 1.3.4
  xkbcomp: upgrade to 1.3.0
  rgb: upgrade to 1.0.6.

 .../hicolor-icon-theme/files/index.theme           | 1731 --------------------
 ...on-theme_0.13.bb => hicolor-icon-theme_0.14.bb} |   22 +-
 .../{json-glib_1.0.0.bb => json-glib_1.0.2.bb}     |    4 +-
 meta/recipes-gnome/librsvg/librsvg/vapigen.m4      |   96 --
 .../{librsvg_2.40.2.bb => librsvg_2.40.6.bb}       |   16 +-
 .../{freetype_2.5.3.bb => freetype_2.5.4.bb}       |    4 +-
 .../waffle/{waffle_1.3.0.bb => waffle_1.5.0.bb}    |    6 +-
 .../xorg-app/{rgb_1.0.5.bb => rgb_1.0.6.bb}        |    5 +-
 .../xorg-app/{xinit_1.3.3.bb => xinit_1.3.4.bb}    |    4 +-
 .../{xkbcomp_1.2.4.bb => xkbcomp_1.3.0.bb}         |    4 +-
 ...ut-evdev_2.9.0.bb => xf86-input-evdev_2.9.1.bb} |    4 +-
 ...tics_1.8.0.bb => xf86-input-synaptics_1.8.1.bb} |    4 +-
 .../xf86-video-intel/configure-dri.patch           |  166 --
 ...el_2.99.912.bb => xf86-video-intel_2.99.917.bb} |    7 +-
 ...ng_0.8.1.bb => xf86-video-modesetting_0.9.0.bb} |    4 +-
 ...ard-config_2.12.bb => xkeyboard-config_2.13.bb} |    4 +-
 .../{libpng12_1.2.51.bb => libpng12_1.2.52.bb}     |    8 +-
 ...o-mp3_0.10.19.bb => gst-fluendo-mp3_0.10.31.bb} |    6 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    2 +-
 19 files changed, 39 insertions(+), 2058 deletions(-)
 delete mode 100644 meta/recipes-gnome/hicolor-icon-theme/files/index.theme
 rename meta/recipes-gnome/hicolor-icon-theme/{hicolor-icon-theme_0.13.bb => hicolor-icon-theme_0.14.bb} (46%)
 rename meta/recipes-gnome/json-glib/{json-glib_1.0.0.bb => json-glib_1.0.2.bb} (79%)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/vapigen.m4
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.2.bb => librsvg_2.40.6.bb} (76%)
 rename meta/recipes-graphics/freetype/{freetype_2.5.3.bb => freetype_2.5.4.bb} (92%)
 rename meta/recipes-graphics/waffle/{waffle_1.3.0.bb => waffle_1.5.0.bb} (87%)
 rename meta/recipes-graphics/xorg-app/{rgb_1.0.5.bb => rgb_1.0.6.bb} (73%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.3.bb => xinit_1.3.4.bb} (79%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.4.bb => xkbcomp_1.3.0.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.0.bb => xf86-input-evdev_2.9.1.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.0.bb => xf86-input-synaptics_1.8.1.bb} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/configure-dri.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.99.912.bb => xf86-video-intel_2.99.917.bb} (86%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-modesetting_0.8.1.bb => xf86-video-modesetting_0.9.0.bb} (64%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.12.bb => xkeyboard-config_2.13.bb} (88%)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.51.bb => libpng12_1.2.52.bb} (70%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.19.bb => gst-fluendo-mp3_0.10.31.bb} (57%)

-- 
1.7.10.4


