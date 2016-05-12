Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEFF7016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:58:04 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id v145so107311807oie.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 00:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ad6Zonitj/D0JaPfvMQIeJenlOznlwMDYG9Np5k2kj8=;
	b=SSz9YIOElPlm1EM5EqSpZrEQvHJOdnwnulLVgdcAYA2Tmd2kLtleS6vON/d6KwXKuJ
	UnF3lRdv7a/JaVdpN3iX9SM4mPx1t0aYc1gzyGfKA0KDuHaS2dsSXEua7KvmD4vqeHZY
	xc/yYXqDQVBrySoTmoXWP2C94pGsmyA+8VX0QYRzuCkGxIdiXHqXo/O+P70fTHRWyQNZ
	3NmEAERSo2CpZeWZZA+GWtxK6YIpDHyZrGE9rRoOpOkVlGJ8LnT9lI7NPt7s42fDh0Zb
	iNJrDpxDZuPYXyPglk+VNnRh/yMtmG3oXMtGPsKiR90pLnXYqUFwNgFxSC/bWoi0olhj
	+0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ad6Zonitj/D0JaPfvMQIeJenlOznlwMDYG9Np5k2kj8=;
	b=laDKFZqpCG56PkBx3EMk6XLohK/eP4PW5taa8NYueJVKLqLGpgcEfjwm+GimRsMs6K
	LrhLLWsvyr5XxvQv/0im/WyqWsL5O1jy+Q1QJEvAYOE1rslRNudw/Jf0cJQeP5nKNGdT
	FYq1/D1dQQYRLcaDNcviGFP2jB0nEsUcvRnOjzFpI0163x4hgTzXCUTyvsdra4rp/0oq
	zAl65u4NAlLDsRx1XKIHb8Dpsjal185kIg+XKc68jjAkKOYzVpIKAxkrMJ5/m1S0ALx3
	oNpayRJqpiYlptNHQdnA8CAYzMpOIGhTj+echx3zmJxifVozzRmum4wSUJ/oq4bRN7if
	L5lg==
X-Gm-Message-State: AOPr4FV9IfrkYf7KAiZZo1tDSrB3eS8gCM6CxK7R1X3l3EdnUb58s9wvzF7agc/8Zq1sGsvxmOohLMJFdhXkrUFi
X-Received: by 10.202.175.71 with SMTP id y68mr4002781oie.154.1463039885155;
	Thu, 12 May 2016 00:58:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Thu, 12 May 2016 00:57:35 -0700 (PDT)
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 12 May 2016 10:57:35 +0300
Message-ID: <CAHiDW_Fh9RNmxvpsv6t+EnnGng=hkcN-TYmBicAmYjjt8ZFbig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/13] Upgrades around graphics stack
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
X-List-Received-Date: Thu, 12 May 2016 07:58:07 -0000
Content-Type: text/plain; charset=UTF-8

It seems I wasn't working on top of current master HEAD, apologies:
The xorg upgrade was already done by Andreas, other changes are still
valid.

I'll do a quick smoketest and push the rebased branch with same name,
dropping xserver-xorg patch. I'm not resending the patches as they are
otherwise identical.

 - Jussi

On 12 May 2016 at 10:20, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> Upgrades around X, Wayland and Mesa. Mostly point upgrades but the
> Wayland upgrade is a fairly major one: their next release is also
> around the corner so if there are problems you can drop wayland-
> related bits and I can fix things in time for 1.11.
>
> These have been sanity tested with sato and weston images. piglit
> results are in line with previous mesa releases (~98% pass rate for
> non-skipped tests on a NUC with Intel HD 5000).
>
> Please take a look at the wayland-protocols patch: the recipe produces
> a -dev package only, I wasn't sure if that's a thing I can/should do?
>
> Thanks,
>   Jussi
>
> The following changes since commit 7ca60ec8bff7656b4e52f5a4d238913e851da089:
>
>   test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:48:06 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib jku/gfx-upgrades
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gfx-upgrades
>
> Jussi Kukkonen (13):
>   xserver-xorg: Upgrade 1.18.0 -> 1.18.3
>   xrandr: Upgrade to 1.5.0
>   xkeyboard-config: Upgrade to 2.17
>   libinput: Upgrade 1.1.4 -> 1.3.0
>   xf86-input-evdev: Upgrade 2.10.1 -> 2.10.2
>   videoproto: Upgrade 2.3.2 -> 2.3.3
>   libxkbcommon: Upgrade 0.5.0 -> 0.6.1
>   libdrm: Upgrade 2.4.67 -> 2.4.68
>   mesa: Upgrade 11.1.1 -> 11.2.2
>   pixman: Upgrade 0.32.8 -> 0.34.0
>   wayland: Upgrade 1.9.0 -> 1.10.0
>   wayland-protocols: Add recipe
>   weston: Upgrade 1.9.0 -> 1.10.0
>
>  .../drm/{libdrm_2.4.67.bb => libdrm_2.4.68.bb}     |  4 +-
>  .../mesa/{mesa-gl_11.1.1.bb => mesa-gl_11.2.2.bb}  |  0
>  .../mesa/{mesa_11.1.1.bb => mesa_11.2.2.bb}        |  4 +-
>  .../{libinput_1.1.4.bb => libinput_1.3.0.bb}       |  5 +-
>  .../wayland-protocols/dont-use-AC_CANONICAL.patch  | 29 +++++++++
>  .../wayland/wayland-protocols_1.3.bb               | 19 ++++++
>  .../{wayland_1.9.0.bb => wayland_1.10.0.bb}        |  6 +-
>  ...c-Use-PKG_CONFIG_SYSROOT_DIR-for-protocol.patch | 30 ++++++++++
>  .../weston/explicit-enable-disable-systemd.patch   | 70 ----------------------
>  .../wayland/weston/libsystemd.patch                | 53 ----------------
>  .../weston/make-lcms-explicitly-configurable.patch | 43 -------------
>  .../wayland/{weston_1.9.0.bb => weston_1.10.0.bb}  | 10 ++--
>  .../xorg-app/{xrandr_1.4.3.bb => xrandr_1.5.0.bb}  |  4 +-
>  ...-evdev_2.10.1.bb => xf86-input-evdev_2.10.2.bb} |  4 +-
>  ...libxkbcommon_0.5.0.bb => libxkbcommon_0.6.1.bb} |  6 +-
>  ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch | 65 --------------------
>  .../xorg-lib/pixman/mips-export-revert.patch       | 22 -------
>  .../{pixman_0.32.8.bb => pixman_0.34.0.bb}         |  6 +-
>  ...ard-config_2.16.bb => xkeyboard-config_2.17.bb} |  4 +-
>  .../{videoproto_2.3.2.bb => videoproto_2.3.3.bb}   |  4 +-
>  ....ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch | 50 ----------------
>  .../modesetting_libdrm_requirements.patch          | 30 ----------
>  ...erver-xorg_1.18.0.bb => xserver-xorg_1.18.3.bb} |  8 +--
>  23 files changed, 108 insertions(+), 368 deletions(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.67.bb => libdrm_2.4.68.bb} (92%)
>  rename meta/recipes-graphics/mesa/{mesa-gl_11.1.1.bb => mesa-gl_11.2.2.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_11.1.1.bb => mesa_11.2.2.bb} (80%)
>  rename meta/recipes-graphics/wayland/{libinput_1.1.4.bb => libinput_1.3.0.bb} (75%)
>  create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
>  create mode 100644 meta/recipes-graphics/wayland/wayland-protocols_1.3.bb
>  rename meta/recipes-graphics/wayland/{wayland_1.9.0.bb => wayland_1.10.0.bb} (89%)
>  create mode 100644 meta/recipes-graphics/wayland/weston/0001-configure.ac-Use-PKG_CONFIG_SYSROOT_DIR-for-protocol.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
>  rename meta/recipes-graphics/wayland/{weston_1.9.0.bb => weston_1.10.0.bb} (92%)
>  rename meta/recipes-graphics/xorg-app/{xrandr_1.4.3.bb => xrandr_1.5.0.bb} (72%)
>  rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.1.bb => xf86-input-evdev_2.10.2.bb} (83%)
>  rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.5.0.bb => libxkbcommon_0.6.1.bb} (75%)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
>  delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
>  rename meta/recipes-graphics/xorg-lib/{pixman_0.32.8.bb => pixman_0.34.0.bb} (85%)
>  rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.16.bb => xkeyboard-config_2.17.bb} (88%)
>  rename meta/recipes-graphics/xorg-proto/{videoproto_2.3.2.bb => videoproto_2.3.3.bb} (69%)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.0.bb => xserver-xorg_1.18.3.bb} (72%)
>
> --
> 2.1.4
>

