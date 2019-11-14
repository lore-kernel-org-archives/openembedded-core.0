Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 059827F838
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 02:52:56 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o3so5129702qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 18:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TBsYy5u3ZLVYHGCXXxtz0XE0i+0dUrJ1vgXo+GKFpc8=;
	b=I5EL+bEf8IHc1Fi4Y/ZZ5CFy1e2+OAT63kYA42eqwSruZzDzAM26nbUKsPa4e7PWiA
	p0Rsi9fQmolL8+OwSLVCG19YnkbrMqGvsgmN/UisiOKz5yqFzHVyGMN+cbf1cBN2Vhqk
	w+c6rddpElb9pfLhgK9mH3Oi5JeOIAzmuVl06n2GYKNATqfeR6OMuS0VmZcRlZrnTpFW
	NtVVGxoIhg6PrTJYGMcZCg9Gl98lA/SyJpES/EjrAQ16hh7ksO4XQPrAGGxewOU0taiu
	Hp/af7heGcWfx0yW8lcFtgW2TvhrM3G+am1Lp18rd4fLH/UXFvipFs96+s32iUUOcN1+
	uylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TBsYy5u3ZLVYHGCXXxtz0XE0i+0dUrJ1vgXo+GKFpc8=;
	b=U7baQIcBBAnpZtLCCKA5eSK9/Qx20zWfW8w9RM5MMZiKuJ9BkkXpF2wiTfJH+2gZkx
	Xbz5mKD50Y6Rvhphobl8PNsw2i0sdp5FIOlAWmP//yuClrEtARLoqo9EcLNks+smM+wg
	SG219XOprSX8yX6lfXOGKGRhvjCyTUqM2Ck23zhCyVuqGfdD0qIyYiWTM6mqMF7x26eX
	9gI6vujBSSqaTAaakz0y9iJlF2irQBl6t0dGA6N/RV1/Kxq8K+tfu83SG+JsnijtJfMy
	hjFWAptZJGGQiX45hiTTAE/oxTKs4T0E16CQXk4AxwXw2QQMS3Gz2u0D/lsC0J5DxIYh
	7Evw==
X-Gm-Message-State: APjAAAXq9KLNmCsMFT8yePU8Kwk3mp1euMCAAuQI566KoqrrdV6s/Bcb
	l131fF29QHdrz+h6mY6TOh0ZCmY298DsEYFmJ5U=
X-Google-Smtp-Source: APXvYqzX8+RTb1O+1IluFFzczcjZI5xDV89igZLCYmCQuR9GHu1woc/6A4ir4jv1w4auLoopCux7iYU5YJzz3J5Rzv0=
X-Received: by 2002:ac8:66d7:: with SMTP id m23mr6174505qtp.53.1573699975562; 
	Wed, 13 Nov 2019 18:52:55 -0800 (PST)
MIME-Version: 1.0
References: <1573695020-30645-1-git-send-email-denis@denix.org>
In-Reply-To: <1573695020-30645-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Nov 2019 18:52:28 -0800
Message-ID: <CAMKF1srfwiPmxhh1wmYg6qYBs8nhhhJb0QA9q_QS-RiRj2tviw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distro_features_check: expand with MACHINE_FEATURES and COMBINED_FEATURES, rename
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
X-List-Received-Date: Thu, 14 Nov 2019 02:52:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 13, 2019 at 5:30 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Besides checking DISTRO_FEATURES for required or conflicting features,
> being able to check MACHINE_FEATURES and/or COMBINED_FEATURES may also
> be useful at times.

changing the class name will be disruptive can we either keep an alias
for old name?
otherwise, it will be preferable to keep using the old name even
though I understand
a new name might be more appropriate.

>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...atures_check.bbclass => features_check.bbclass} | 65 ++++++++++++++++++++--
>  meta/conf/documentation.conf                       |  4 +-
>  meta/recipes-bsp/usbutils/usbutils_012.bb          |  2 +-
>  meta/recipes-connectivity/avahi/avahi-ui_0.7.bb    |  2 +-
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  2 +-
>  .../connman/connman-gnome_0.7.bb                   |  2 +-
>  meta/recipes-core/glib-2.0/glib.inc                |  2 +-
>  meta/recipes-core/glibc/glibc.inc                  |  2 +-
>  meta/recipes-core/libxml/libxml2_2.9.9.bb          |  2 +-
>  .../packagegroups/packagegroup-self-hosted.bb      |  2 +-
>  meta/recipes-core/systemd/systemd-compat-units.bb  |  2 +-
>  meta/recipes-core/systemd/systemd-serialgetty.bb   |  2 +-
>  meta/recipes-core/systemd/systemd_243.bb           |  2 +-
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |  2 +-
>  meta/recipes-core/udev/eudev_3.2.8.bb              |  2 +-
>  meta/recipes-core/volatile-binds/volatile-binds.bb |  2 +-
>  meta/recipes-devtools/mtools/mtools_4.0.23.bb      |  2 +-
>  .../systemd-bootchart/systemd-bootchart_233.bb     |  2 +-
>  meta/recipes-extended/pam/libpam_1.3.1.bb          |  2 +-
>  meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb |  2 +-
>  meta/recipes-gnome/epiphany/epiphany_3.34.1.bb     |  2 +-
>  meta/recipes-gnome/gcr/gcr_3.34.0.bb               |  2 +-
>  meta/recipes-gnome/gtk+/gtk+3.inc                  |  2 +-
>  meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb   |  2 +-
>  meta/recipes-gnome/libnotify/libnotify_0.7.8.bb    |  2 +-
>  meta/recipes-graphics/clutter/clutter-1.0.inc      |  2 +-
>  meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |  2 +-
>  meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |  2 +-
>  meta/recipes-graphics/cogl/cogl-1.0.inc            |  2 +-
>  meta/recipes-graphics/glew/glew_2.1.0.bb           |  2 +-
>  meta/recipes-graphics/images/core-image-weston.bb  |  2 +-
>  meta/recipes-graphics/images/core-image-x11.bb     |  2 +-
>  meta/recipes-graphics/kmscube/kmscube_git.bb       |  2 +-
>  meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb   |  2 +-
>  meta/recipes-graphics/libfakekey/libfakekey_git.bb |  2 +-
>  .../libmatchbox/libmatchbox_1.12.bb                |  2 +-
>  meta/recipes-graphics/libva/libva-utils_2.5.0.bb   |  2 +-
>  meta/recipes-graphics/libva/libva_2.5.0.bb         |  2 +-
>  .../matchbox-wm/matchbox-wm_1.2.2.bb               |  2 +-
>  meta/recipes-graphics/mesa/libglu_9.0.1.bb         |  2 +-
>  meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb     |  2 +-
>  meta/recipes-graphics/mesa/mesa.inc                |  2 +-
>  meta/recipes-graphics/mx/mx.inc                    |  2 +-
>  .../packagegroups/packagegroup-core-clutter.bb     |  2 +-
>  .../packagegroups/packagegroup-core-x11-base.bb    |  2 +-
>  .../packagegroups/packagegroup-core-x11-xserver.bb |  2 +-
>  .../packagegroups/packagegroup-core-x11.bb         |  2 +-
>  meta/recipes-graphics/piglit/piglit_git.bb         |  2 +-
>  meta/recipes-graphics/pong-clock/pong-clock_1.0.bb |  2 +-
>  .../startup-notification_0.12.bb                   |  2 +-
>  .../virglrenderer/virglrenderer_0.8.0.bb           |  2 +-
>  meta/recipes-graphics/vulkan/vulkan-demos_git.bb   |  2 +-
>  .../vulkan/vulkan-loader_1.1.108.bb                |  2 +-
>  .../vulkan/vulkan-tools_1.1.108.bb                 |  2 +-
>  meta/recipes-graphics/waffle/waffle_1.6.0.bb       |  2 +-
>  meta/recipes-graphics/wayland/weston-init.bb       |  2 +-
>  meta/recipes-graphics/wayland/weston_7.0.0.bb      |  2 +-
>  .../x11-common/xserver-nodm-init_3.0.bb            |  2 +-
>  .../xinput-calibrator/xinput-calibrator_git.bb     |  2 +-
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc |  2 +-
>  .../xorg-driver/xorg-driver-common.inc             |  2 +-
>  .../xorg-font/xorg-font-common.inc                 |  2 +-
>  .../xorg-font/xorg-minimal-fonts.bb                |  2 +-
>  meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb    |  2 +-
>  meta/recipes-graphics/xorg-lib/xcb-util.inc        |  2 +-
>  meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |  2 +-
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  2 +-
>  meta/recipes-graphics/xrestop/xrestop_0.4.bb       |  2 +-
>  .../gstreamer/gst-examples_1.16.0.bb               |  2 +-
>  .../gstreamer/gstreamer1.0-python_1.16.1.bb        |  2 +-
>  .../gstreamer/gstreamer1.0-vaapi_1.16.1.bb         |  2 +-
>  meta/recipes-sato/l3afpad/l3afpad_git.bb           |  2 +-
>  .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb |  2 +-
>  .../matchbox-desktop/matchbox-desktop_2.2.bb       |  2 +-
>  .../matchbox-keyboard/matchbox-keyboard_0.1.1.bb   |  2 +-
>  .../matchbox-panel-2/matchbox-panel-2_2.11.bb      |  2 +-
>  .../matchbox-sato/matchbox-session-sato_0.1.bb     |  2 +-
>  .../matchbox-terminal/matchbox-terminal_0.2.bb     |  2 +-
>  .../matchbox-theme-sato/matchbox-theme-sato.inc    |  2 +-
>  .../packagegroups/packagegroup-core-x11-sato.bb    |  2 +-
>  meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb         |  2 +-
>  meta/recipes-sato/puzzles/puzzles_git.bb           |  2 +-
>  .../sato-screenshot/sato-screenshot_0.3.bb         |  2 +-
>  .../settings-daemon/settings-daemon_0.0.2.bb       |  2 +-
>  meta/recipes-sato/webkit/webkitgtk_2.26.2.bb       |  2 +-
>  meta/recipes-support/atk/at-spi2-atk_2.32.0.bb     |  2 +-
>  .../recipes-support/consolekit/consolekit_0.4.6.bb |  2 +-
>  meta/recipes-support/libfm/libfm_1.3.1.bb          |  2 +-
>  .../nss-myhostname/nss-myhostname_0.3.bb           |  2 +-
>  meta/recipes-support/vte/vte_0.58.2.bb             |  2 +-
>  90 files changed, 149 insertions(+), 96 deletions(-)
>  rename meta/classes/{distro_features_check.bbclass => features_check.bbclass} (26%)
>
> diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/features_check.bbclass
> similarity index 26%
> rename from meta/classes/distro_features_check.bbclass
> rename to meta/classes/features_check.bbclass
> index eeaa3b4..391fbe1 100644
> --- a/meta/classes/distro_features_check.bbclass
> +++ b/meta/classes/features_check.bbclass
> @@ -1,12 +1,25 @@
>  # Allow checking of required and conflicting DISTRO_FEATURES
>  #
> -# ANY_OF_DISTRO_FEATURES:   ensure at least one item on this list is included
> -#                           in DISTRO_FEATURES.
> -# REQUIRED_DISTRO_FEATURES: ensure every item on this list is included
> -#                           in DISTRO_FEATURES.
> -# CONFLICT_DISTRO_FEATURES: ensure no item in this list is included in
> -#                           DISTRO_FEATURES.
> +# ANY_OF_DISTRO_FEATURES:     ensure at least one item on this list is included
> +#                             in DISTRO_FEATURES.
> +# REQUIRED_DISTRO_FEATURES:   ensure every item on this list is included
> +#                             in DISTRO_FEATURES.
> +# CONFLICT_DISTRO_FEATURES:   ensure no item in this list is included in
> +#                             DISTRO_FEATURES.
> +# ANY_OF_MACHINE_FEATURES:    ensure at least one item on this list is included
> +#                             in MACHINE_FEATURES.
> +# REQUIRED_MACHINE_FEATURES:  ensure every item on this list is included
> +#                             in MACHINE_FEATURES.
> +# CONFLICT_MACHINE_FEATURES:  ensure no item in this list is included in
> +#                             MACHINE_FEATURES.
> +# ANY_OF_COMBINED_FEATURES:   ensure at least one item on this list is included
> +#                             in COMBINED_FEATURES.
> +# REQUIRED_COMBINED_FEATURES: ensure every item on this list is included
> +#                             in COMBINED_FEATURES.
> +# CONFLICT_COMBINED_FEATURES: ensure no item in this list is included in
> +#                             COMBINED_FEATURES.
>  #
> +# Copyright 2019 (C) Texas Instruments Inc.
>  # Copyright 2013 (C) O.S. Systems Software LTDA.
>
>  python () {
> @@ -29,4 +42,44 @@ python () {
>          conflicts = set.intersection(conflict_distro_features, distro_features)
>          if conflicts:
>              raise bb.parse.SkipRecipe("conflicting distro feature%s '%s' (in DISTRO_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
> +
> +    # Assume at least one var is set.
> +    machine_features = set((d.getVar('MACHINE_FEATURES') or '').split())
> +
> +    any_of_machine_features = set((d.getVar('ANY_OF_MACHINE_FEATURES') or '').split())
> +    if any_of_machine_features:
> +        if set.isdisjoint(any_of_machine_features, machine_features):
> +            raise bb.parse.SkipRecipe("one of '%s' needs to be in MACHINE_FEATURES" % ' '.join(any_of_machine_features))
> +
> +    required_machine_features = set((d.getVar('REQUIRED_MACHINE_FEATURES') or '').split())
> +    if required_machine_features:
> +        missing = set.difference(required_machine_features, machine_features)
> +        if missing:
> +            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in MACHINE_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
> +
> +    conflict_machine_features = set((d.getVar('CONFLICT_MACHINE_FEATURES') or '').split())
> +    if conflict_machine_features:
> +        conflicts = set.intersection(conflict_machine_features, machine_features)
> +        if conflicts:
> +            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in MACHINE_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
> +
> +    # Assume at least one var is set.
> +    combined_features = set((d.getVar('COMBINED_FEATURES') or '').split())
> +
> +    any_of_combined_features = set((d.getVar('ANY_OF_COMBINED_FEATURES') or '').split())
> +    if any_of_combined_features:
> +        if set.isdisjoint(any_of_combined_features, combined_features):
> +            raise bb.parse.SkipRecipe("one of '%s' needs to be in COMBINED_FEATURES" % ' '.join(any_of_combined_features))
> +
> +    required_combined_features = set((d.getVar('REQUIRED_COMBINED_FEATURES') or '').split())
> +    if required_combined_features:
> +        missing = set.difference(required_combined_features, combined_features)
> +        if missing:
> +            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in COMBINED_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
> +
> +    conflict_combined_features = set((d.getVar('CONFLICT_COMBINED_FEATURES') or '').split())
> +    if conflict_combined_features:
> +        conflicts = set.intersection(conflict_combined_features, combined_features)
> +        if conflicts:
> +            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in COMBINED_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
>  }
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 550df20..fca36f3 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -113,7 +113,7 @@ COMPATIBLE_MACHINE[doc] = "A regular expression that resolves to one or more tar
>  COMPLEMENTARY_GLOB[doc] = "Defines wildcards to match when installing a list of complementary packages for all the packages installed in an image."
>  CONFFILES[doc] = "Identifies editable or configurable files that are part of a package."
>  CONFIG_SITE[doc] = "A list of files that contains autoconf test results relevant to the current build. This variable is used by the Autotools utilities when running configure."
> -CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the distro_features_check class, this variable identifies distribution features that would be in conflict should the recipe be built."
> +CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distribution features that would be in conflict should the recipe be built."
>  CORE_IMAGE_EXTRA_INSTALL[doc] = "Specifies the list of packages to be added to the image. You should only set this variable in the conf/local.conf file in the Build Directory."
>  COREBASE[doc] = "Specifies the parent directory of the OpenEmbedded Core Metadata layer (i.e. meta)."
>  CONF_VERSION[doc] = "Tracks the version of local.conf.  Increased each time build/conf/ changes incompatibly."
> @@ -346,7 +346,7 @@ QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for u
>
>  RCONFLICTS[doc] = "The list of packages that conflict with another package. Note that the package will not be installed if the conflicting packages are not first removed."
>  RDEPENDS[doc] = "Lists a package's runtime dependencies (i.e. other packages) that must be installed for the package to be built. They must be the names of other packages as listed in the PACKAGES variable, not recipe names (PN)."
> -REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the distro_features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
> +REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
>  RM_WORK_EXCLUDE[doc] = "With rm_work enabled, this variable specifies a list of packages whose work directories should not be removed."
>  ROOTFS[doc] = "Indicates a filesystem image to include as the root filesystem."
>  ROOTFS_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the root filesystem."
> diff --git a/meta/recipes-bsp/usbutils/usbutils_012.bb b/meta/recipes-bsp/usbutils/usbutils_012.bb
> index 0213e7a..b670fa4 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_012.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_012.bb
> @@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
>  SRC_URI[md5sum] = "7484445cbcf04b3eacac892fe58f8d9f"
>  SRC_URI[sha256sum] = "ae2e10aad530d95839b6f4d46cd41715eae6f0f1789310d793e9be21b3e7ae20"
>
> -inherit autotools pkgconfig distro_features_check update-alternatives
> +inherit autotools pkgconfig features_check update-alternatives
>
>  ALTERNATIVE_${PN} = "lsusb"
>  ALTERNATIVE_PRIORITY = "100"
> diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> index 1c6e46a..1510a0e 100644
> --- a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> +++ b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> @@ -1,6 +1,6 @@
>  require avahi.inc
>
> -inherit distro_features_check
> +inherit features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  DEPENDS += "avahi"
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 1702323..4845093 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -64,7 +64,7 @@ S = "${WORKDIR}/bluez-${PV}"
>
>  CVE_PRODUCT = "bluez"
>
> -inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest gobject-introspection-data
> +inherit autotools pkgconfig systemd update-rc.d features_check ptest gobject-introspection-data
>
>  EXTRA_OECONF = "\
>    --enable-test \
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> index a56bd37..778bf50 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -20,7 +20,7 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git \
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
> +inherit autotools-brokensep gtk-icon-cache pkgconfig features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  RDEPENDS_${PN} = "connman"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 8b95f21..e811b42 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -28,7 +28,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
>
>  LEAD_SONAME = "libglib-2.0.*"
>
> -inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
> +inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages features_check
>
>  GTKDOC_MESON_OPTION = "gtk_doc"
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 252fd56..ea9a04a 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -6,7 +6,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
>
>  PROVIDES = "virtual/libc"
>  PROVIDES += "virtual/libintl virtual/libiconv"
> -inherit autotools texinfo distro_features_check systemd
> +inherit autotools texinfo features_check systemd
>
>  LEAD_SONAME = "libc.so"
>
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
> index c38f883..5a7e098 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
> @@ -35,7 +35,7 @@ PACKAGECONFIG ??= "python \
>  PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>
> -inherit autotools pkgconfig binconfig-disabled ptest distro_features_check
> +inherit autotools pkgconfig binconfig-disabled ptest features_check
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index ee9d063..0aab23e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -8,7 +8,7 @@ PR = "r13"
>
>  PACKAGE_ARCH = "${TUNE_PKGARCH}"
>
> -inherit packagegroup  distro_features_check
> +inherit packagegroup  features_check
>  # rdepends on libx11-dev
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
> index d228a51..faa428b 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -8,7 +8,7 @@ PACKAGE_WRITE_DEPS += "systemd-systemctl-native"
>
>  S = "${WORKDIR}"
>
> -inherit distro_features_check
> +inherit features_check
>
>  ALLOW_EMPTY_${PN} = "1"
>
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
> index 65a931f..044c6c5 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -12,7 +12,7 @@ SRC_URI = "file://serial-getty@.service"
>  S = "${WORKDIR}"
>
>  # As this package is tied to systemd, only build it when we're also building systemd.
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
>  do_install() {
> diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
> index 54fcc6a..7da96f4 100644
> --- a/meta/recipes-core/systemd/systemd_243.bb
> +++ b/meta/recipes-core/systemd/systemd_243.bb
> @@ -8,7 +8,7 @@ DEPENDS = "intltool-native gperf-native libcap util-linux"
>
>  SECTION = "base/shell"
>
> -inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages distro_features_check
> +inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
>
>  # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
>  # that we don't build both udev and systemd in world builds.
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index bfc1283..8fd6df9 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5
>  S = "${WORKDIR}/sysvinit-${PV}"
>  B = "${S}/src"
>
> -inherit update-alternatives distro_features_check
> +inherit update-alternatives features_check
>  DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
>
>  REQUIRED_DISTRO_FEATURES = "sysvinit"
> diff --git a/meta/recipes-core/udev/eudev_3.2.8.bb b/meta/recipes-core/udev/eudev_3.2.8.bb
> index eecf64e..08729e1 100644
> --- a/meta/recipes-core/udev/eudev_3.2.8.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.8.bb
> @@ -23,7 +23,7 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
>  SRC_URI[md5sum] = "ce166b3fdd910c2a4a840378f48fedaf"
>  SRC_URI[sha256sum] = "61e4948e9e51271c3cce2bb5311a30b206dd03ef011062e6c627fb007e43f6b8"
>
> -inherit autotools update-rc.d qemu pkgconfig distro_features_check
> +inherit autotools update-rc.d qemu pkgconfig features_check
>
>  CONFLICT_DISTRO_FEATURES = "systemd"
>
> diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
> index d861a71..b273293 100644
> --- a/meta/recipes-core/volatile-binds/volatile-binds.bb
> +++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
> @@ -11,7 +11,7 @@ SRC_URI = "\
>
>  S = "${WORKDIR}"
>
> -inherit allarch systemd distro_features_check
> +inherit allarch systemd features_check
>
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.23.bb b/meta/recipes-devtools/mtools/mtools_4.0.23.bb
> index 2ae6979..2093d80 100644
> --- a/meta/recipes-devtools/mtools/mtools_4.0.23.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.23.bb
> @@ -35,7 +35,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
>
>  SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
>
> -inherit autotools texinfo distro_features_check
> +inherit autotools texinfo features_check
>
>  EXTRA_OECONF = "--without-x"
>
> diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
> index b0433e0..aef8839 100644
> --- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
> +++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
> @@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
>
>  DEPENDS = "systemd libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
>
> -inherit pkgconfig autotools systemd distro_features_check
> +inherit pkgconfig autotools systemd features_check
>
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
> diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
> index a2aa1ec..1194933 100644
> --- a/meta/recipes-extended/pam/libpam_1.3.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
> @@ -150,7 +150,7 @@ do_install() {
>         fi
>  }
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  BBCLASSEXTEND = "nativesdk native"
> diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
> index 8e46638..7788b5f 100644
> --- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
> +++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
> @@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "d798b08af8a8e2063ddde6c9fa3398ca81484f27dec642c5627ffcaa0d
>  UPSTREAM_CHECK_REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
>
>  # Needs brokensep as this doesn't use automake
> -inherit autotools-brokensep distro_features_check
> +inherit autotools-brokensep features_check
>
>  # The xprop requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
> index d1cb515..cebd55d 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
> @@ -8,7 +8,7 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
>            glib-2.0 glib-2.0-native json-glib libdazzle"
>
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
> +inherit gnomebase gsettings features_check upstream-version-is-even gettext
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
>  SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
> diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
> index 616b0e5..e3e8999 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>  DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
>             ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
>
> -inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection gettext
> +inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext
>  # depends on gtk+3, but also x11 through gtk+-x11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index dc6768c..e1f1e0d 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
>
>  LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
>
> -inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check gobject-introspection
> +inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings features_check gobject-introspection
>
>  BBCLASSEXTEND = "native nativesdk"
>
> diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
> index e297390..1c8b2c8 100644
> --- a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
> +++ b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
> @@ -8,7 +8,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libdazzle/issues"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
>
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase upstream-version-is-even vala distro_features_check gobject-introspection
> +inherit gnomebase upstream-version-is-even vala features_check gobject-introspection
>
>  DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
>
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> index f4cda7b..0306b04 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>
>  DEPENDS = "dbus gtk+3 glib-2.0"
>
> -inherit gnomebase gtk-doc distro_features_check gobject-introspection
> +inherit gnomebase gtk-doc features_check gobject-introspection
>  # depends on gtk+3
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
> diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
> index 9ecdfd0..5dc45eb 100644
> --- a/meta/recipes-graphics/clutter/clutter-1.0.inc
> +++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
> @@ -5,7 +5,7 @@ box UIs, presentations, kiosk style applications and so on."
>  HOMEPAGE = "http://www.clutter-project.org/"
>  LICENSE = "LGPLv2.1+"
>
> -inherit clutter ptest-gnome distro_features_check upstream-version-is-even gobject-introspection
> +inherit clutter ptest-gnome features_check upstream-version-is-even gobject-introspection
>  # depends on cogl-1.0 which needs opengl
>  REQUIRED_DISTRO_FEATURES ?= "opengl"
>
> diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> index 4c87798..fc3eade 100644
> --- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> +++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> @@ -2,7 +2,7 @@ SUMMARY = "GStreamer integration library for Clutter"
>  HOMEPAGE = "http://www.clutter-project.org/"
>  LICENSE = "LGPLv2+"
>
> -inherit clutter distro_features_check upstream-version-is-even gobject-introspection
> +inherit clutter features_check upstream-version-is-even gobject-introspection
>  # depends on clutter-1.0 which depends on cogl-1.0
>  REQUIRED_DISTRO_FEATURES ?= "opengl"
>
> diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
> index 11826a6..7bf2278 100644
> --- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
> +++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.clutter-project.org/"
>  LICENSE = "LGPLv2+"
>
>  CLUTTERBASEBUILDCLASS = "meson"
> -inherit clutter distro_features_check upstream-version-is-even gobject-introspection gtk-doc
> +inherit clutter features_check upstream-version-is-even gobject-introspection gtk-doc
>
>  # depends on clutter-1.0 which depends on cogl-1.0
>  REQUIRED_DISTRO_FEATURES ?= "opengl"
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
> index 23661d9..d8d0665 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0.inc
> +++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
> @@ -6,7 +6,7 @@ can render without stepping on each others toes."
>  HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
>  LICENSE = "MIT"
>
> -inherit clutter distro_features_check upstream-version-is-even gobject-introspection
> +inherit clutter features_check upstream-version-is-even gobject-introspection
>  # cogl-1.0 needs opengl to build
>  REQUIRED_DISTRO_FEATURES ?= "opengl"
>
> diff --git a/meta/recipes-graphics/glew/glew_2.1.0.bb b/meta/recipes-graphics/glew/glew_2.1.0.bb
> index 18e6909..f6f4340 100644
> --- a/meta/recipes-graphics/glew/glew_2.1.0.bb
> +++ b/meta/recipes-graphics/glew/glew_2.1.0.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a
>  UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
>  UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
>
> -inherit lib_package pkgconfig distro_features_check
> +inherit lib_package pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
> index e36655f..f5102e1 100644
> --- a/meta/recipes-graphics/images/core-image-weston.bb
> +++ b/meta/recipes-graphics/images/core-image-weston.bb
> @@ -4,7 +4,7 @@ IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"
>
>  LICENSE = "MIT"
>
> -inherit core-image distro_features_check
> +inherit core-image features_check
>
>  REQUIRED_DISTRO_FEATURES = "wayland"
>
> diff --git a/meta/recipes-graphics/images/core-image-x11.bb b/meta/recipes-graphics/images/core-image-x11.bb
> index cd53749..5240775 100644
> --- a/meta/recipes-graphics/images/core-image-x11.bb
> +++ b/meta/recipes-graphics/images/core-image-x11.bb
> @@ -4,7 +4,7 @@ IMAGE_FEATURES += "splash package-management x11-base"
>
>  LICENSE = "MIT"
>
> -inherit core-image distro_features_check
> +inherit core-image features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
> index 2b6837f..8272004 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -13,7 +13,7 @@ UPSTREAM_CHECK_COMMITS = "1"
>
>  S = "${WORKDIR}/git"
>
> -inherit meson pkgconfig distro_features_check
> +inherit meson pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> index 834d815..71a2c91 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> @@ -15,7 +15,7 @@ SRC_URI[md5sum] = "e2845de8d2782b2d31c01ae8d7cd4cbb"
>  SRC_URI[sha256sum] = "002958c5528321edd53440235d3c44e71b5b1e09b9177e8daf677450b6c4433d"
>  UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>
> -inherit meson pkgconfig distro_features_check
> +inherit meson pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
>  REQUIRED_DISTRO_FEATURES_class-native = ""
> diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> index 4b803db..ab6f5ac 100644
> --- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> +++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> @@ -17,7 +17,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig gettext distro_features_check
> +inherit autotools pkgconfig gettext features_check
>
>  # The libxtst requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
> index cca2d48..1a31677 100644
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
> +++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
> @@ -21,7 +21,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb b/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
> index fc013d7..f68d0cf 100644
> --- a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
> +++ b/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
> @@ -25,7 +25,7 @@ UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
>
>  DEPENDS = "libva"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # depends on libva which requires opengl
>  REQUIRED_DISTRO_FEATURES = "opengl"
> diff --git a/meta/recipes-graphics/libva/libva_2.5.0.bb b/meta/recipes-graphics/libva/libva_2.5.0.bb
> index e75648b..73e2e01 100644
> --- a/meta/recipes-graphics/libva/libva_2.5.0.bb
> +++ b/meta/recipes-graphics/libva/libva_2.5.0.bb
> @@ -26,7 +26,7 @@ UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
>
>  DEPENDS = "libdrm virtual/mesa"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
> index 815a75f..b9961c3 100644
> --- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
> +++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
> @@ -17,7 +17,7 @@ SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/mesa/libglu_9.0.1.bb b/meta/recipes-graphics/mesa/libglu_9.0.1.bb
> index 068fb19..703f131 100644
> --- a/meta/recipes-graphics/mesa/libglu_9.0.1.bb
> +++ b/meta/recipes-graphics/mesa/libglu_9.0.1.bb
> @@ -21,7 +21,7 @@ S = "${WORKDIR}/glu-${PV}"
>
>  DEPENDS = "virtual/libgl"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # Requires libGL.so which is provided by mesa when x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
> index 129a47d..38bdbde 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
> @@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/demos/${BPN}-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "6b65a02622765522176d00f553086fa3"
>  SRC_URI[sha256sum] = "01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/egl, virtual/libgl ...
>  REQUIRED_DISTRO_FEATURES = "opengl x11"
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 9e5808e..bf1492b 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -24,7 +24,7 @@ PROVIDES = " \
>      virtual/mesa \
>      "
>
> -inherit meson pkgconfig python3native gettext distro_features_check
> +inherit meson pkgconfig python3native gettext features_check
>
>  # Unset these to stop python trying to report the target Python setup
>  _PYTHON_SYSCONFIGDATA_NAME[unexport] = "1"
> diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
> index d304837..714a06f 100644
> --- a/meta/recipes-graphics/mx/mx.inc
> +++ b/meta/recipes-graphics/mx/mx.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "Clutter based UI widget library"
>  LICENSE = "LGPLv2.1"
>
> -inherit clutter autotools distro_features_check gobject-introspection gtk-doc
> +inherit clutter autotools features_check gobject-introspection gtk-doc
>  # depends on clutter-1.0 which depends on cogl-1.0
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
> index 87c700e..2e7b47d 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
> @@ -6,7 +6,7 @@ SUMMARY = "Clutter package groups"
>
>  PR = "r6"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>  # rdepends on clutter-*
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> index 7ea72d5..9ca2705 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Basic X11 session"
>  DESCRIPTION = "Packages required to set up a basic working X11 session"
>  PR = "r1"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>  # rdepends on matchbox-wm
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> index 97dcac5..a0b944a 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> @@ -7,7 +7,7 @@ PR = "r40"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>  # rdepends on XSERVER
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> index 001db9e..cddf193 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> @@ -4,7 +4,7 @@
>
>  PR = "r40"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  PACKAGES = "${PN} ${PN}-utils"
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index 28a52cf..696d438 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -21,7 +21,7 @@ X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)
>
>  DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl"
>
> -inherit cmake pkgconfig python3native distro_features_check bash-completion
> +inherit cmake pkgconfig python3native features_check bash-completion
>
>  # depends on virtual/libgl
>  REQUIRED_DISTRO_FEATURES += "opengl"
> diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> index cdfe38a..c3c237e 100644
> --- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> +++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> @@ -2,7 +2,7 @@ SUMMARY = "A clock combined with a game of pong"
>  LICENSE = "GPLv2+"
>  DEPENDS = "virtual/libx11 xdmcp xau"
>
> -inherit distro_features_check pkgconfig
> +inherit features_check pkgconfig
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
> index 6c1b93c..a26ab44 100644
> --- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
> +++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
> @@ -17,7 +17,7 @@ SECTION = "libs"
>
>  DEPENDS = "virtual/libx11 libsm xcb-util"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
> index 4ac4412..4420d84 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
> @@ -16,7 +16,7 @@ SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  BBCLASSEXTEND = "native nativesdk"
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
> index d2041d7..74dc2ad 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
> @@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
>
>  REQUIRED_DISTRO_FEATURES = 'vulkan'
>
> -inherit cmake distro_features_check
> +inherit cmake features_check
>  DEPENDS = "vulkan-loader assimp"
>
>  do_install_append () {
> diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb
> index 2fd6c44..a539c5a 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb
> @@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
>
>  REQUIRED_DISTRO_FEATURES = "vulkan"
>
> -inherit cmake distro_features_check
> +inherit cmake features_check
>  ANY_OF_DISTRO_FEATURES = "x11 wayland"
>
>  DEPENDS += "vulkan-headers"
> diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
> index 26cdee3..4ac1baf 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
> @@ -10,7 +10,7 @@ SRCREV = "3ccd7f6ebae3e1919adf837718c04feb6c2acc61"
>
>  S = "${WORKDIR}/git"
>
> -inherit cmake distro_features_check
> +inherit cmake features_check
>  ANY_OF_DISTRO_FEATURES = "x11 wayland"
>  REQUIRED_DISTRO_FEATURES = "vulkan"
>
> diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
> index 8a1d574..52cb1df 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
> @@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "d9c899f710c50cfdd00f5f4cdfeaef0687d8497362239bdde93bed6c90
>
>  UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
>
> -inherit meson distro_features_check lib_package bash-completion
> +inherit meson features_check lib_package bash-completion
>
>  # This should be overridden per-machine to reflect the capabilities of the GL
>  # stack.
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index 8b66897..e3e739e 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -30,7 +30,7 @@ do_install() {
>         sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
>  }
>
> -inherit update-rc.d distro_features_check systemd
> +inherit update-rc.d features_check systemd
>
>  # rdepends on weston which depends on virtual/egl
>  REQUIRED_DISTRO_FEATURES = "opengl"
> diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> index d212754..e6548d3 100644
> --- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> @@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "a00a6d207b6a45f95f4401c604772a307c3767e5e2beecf3d879110c43
>
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>
> -inherit meson pkgconfig useradd distro_features_check
> +inherit meson pkgconfig useradd features_check
>  # depends on virtual/egl
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> index a77c564..385fea5 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> @@ -17,7 +17,7 @@ S = "${WORKDIR}"
>  # Since we refer to ROOTLESS_X which is normally enabled per-machine
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -inherit update-rc.d systemd distro_features_check
> +inherit update-rc.d systemd features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> index 9873d3f..4f83193 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxi libxrandr"
>  PV = "0.7.5+git${SRCPV}"
>  PR = "r6"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> index 3529cb2..101b3df 100644
> --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> @@ -12,6 +12,6 @@ INC_PR = "r8"
>
>  SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index e657c65..54f04b1 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -13,7 +13,7 @@ SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
>
>  FILES_${PN} += " ${libdir}/xorg/modules/drivers/*.so"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/xserver
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> index cdbebcf..f18c8ae 100644
> --- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> +++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> @@ -14,7 +14,7 @@ INC_PR = "r2"
>  SRC_URI = "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.bz2"
>  S = "${WORKDIR}/${XORG_PN}-${PV}"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # The mkfontscale-native requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> index 9bcd1b2..1ea08a6 100644
> --- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> +++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> @@ -13,7 +13,7 @@ SRC_URI = "file://misc"
>  PE = "1"
>  PR = "r2"
>
> -inherit allarch distro_features_check
> +inherit allarch features_check
>
>  # The font-alias requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
> index b0afc01..9befc51 100644
> --- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
> @@ -25,7 +25,7 @@ PACKAGES_DYNAMIC = "^libxcb-.*"
>
>  FILES_${PN} = "${libdir}/libxcb.so.*"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # The libxau and others requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-graphics/xorg-lib/xcb-util.inc b/meta/recipes-graphics/xorg-lib/xcb-util.inc
> index 99d04f9..0e5ab70 100644
> --- a/meta/recipes-graphics/xorg-lib/xcb-util.inc
> +++ b/meta/recipes-graphics/xorg-lib/xcb-util.inc
> @@ -18,6 +18,6 @@ DEPENDS += "gperf-native"
>
>  SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> index 09df010..a566eaa 100644
> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> @@ -11,7 +11,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
>
>  S = "${WORKDIR}/${XORG_PN}-${PV}"
>
> -inherit autotools distro_features_check pkgconfig
> +inherit autotools features_check pkgconfig
>
>  EXTRA_OECONF = "--disable-specs --without-groff --without-ps2pdf --without-fop"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 44315f5..a0ae65c 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -24,7 +24,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>
>  inherit autotools pkgconfig
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
> diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
> index ce5df03..c7b8716 100644
> --- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
> +++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
> @@ -19,6 +19,6 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.
>  SRC_URI[md5sum] = "d8a54596cbaf037e62b80c4585a3ca9b"
>  SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
> index e83ea8c..cc7a7e7 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
> @@ -13,7 +13,7 @@ SRCREV = "d953c127c1146b50d5676618299933950685dcd7"
>
>  S = "${WORKDIR}/git"
>
> -inherit meson pkgconfig distro_features_check
> +inherit meson pkgconfig features_check
>
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> index 5a950f1..c722f02 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> @@ -20,7 +20,7 @@ S = "${WORKDIR}/${PNREAL}-${PV}"
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>  UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
>
> -inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection distro_features_check
> +inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
>
>  EXTRA_OECONF += "--with-libpython-dir=${libdir}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
> index 61cf705..b8c2126 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
> @@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b62380b9b5ab
>  S = "${WORKDIR}/${REALPN}-${PV}"
>  DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
>
> -inherit autotools pkgconfig gtk-doc distro_features_check upstream-version-is-even
> +inherit autotools pkgconfig gtk-doc features_check upstream-version-is-even
>
>  REQUIRED_DISTRO_FEATURES ?= "opengl"
>
> diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
> index ccfda26..8906c74 100644
> --- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
> +++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
> @@ -17,7 +17,7 @@ SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
> diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> index b993a94..547e851 100644
> --- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> +++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> @@ -17,7 +17,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # The settings-daemon requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
> index b0cdfa2..5c23e85 100644
> --- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
> +++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
> @@ -20,7 +20,7 @@ EXTRA_OECONF = "--enable-startup-notification --with-dbus"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # The startup-notification requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
> index 465f134..dfc7fba 100644
> --- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
> +++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
> @@ -18,7 +18,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig gettext gtk-immodules-cache distro_features_check
> +inherit autotools pkgconfig gettext gtk-immodules-cache features_check
>
>  # The libxft, libfakekey and matchbox-panel-2 requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
> index 421740f..2e6f5b7 100644
> --- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
> +++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
> @@ -37,4 +37,4 @@ FILES_${PN} += "${libdir}/matchbox-panel/*.so \
>                  ${datadir}/icons/"
>  FILES_${PN}-dev += "${libdir}/matchbox-panel/*.la"
>
> -inherit autotools pkgconfig distro_features_check gettext
> +inherit autotools pkgconfig features_check gettext
> diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> index 8230e95..966c5b5 100644
> --- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> +++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> @@ -13,7 +13,7 @@ PR = "r30"
>  # based on the machine architecture.
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -inherit distro_features_check
> +inherit features_check
>
>  # The matchbox-theme-sato requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> index 7f5eda3..9f00281 100644
> --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> @@ -16,6 +16,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
> index d947e1a..ce683e9 100644
> --- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
> +++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aae86bb34b0a83716ca09f4e783d6ba4"
>  DEPENDS = "matchbox-wm"
>  SECTION = "x11/wm"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  FILES_${PN} += "${datadir}/themes"
>
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index 7e14ece..ed3f1a6 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -7,7 +7,7 @@ PR = "r33"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
> diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
> index a5e3a1a..c88e1ed 100644
> --- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
> +++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
> @@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "6804043b3ee3a703edde41c724946174b505fe958703eadbd7e0876ece
>
>  UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # The startup-notification requires x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
> index 59b9525..5ee9164 100644
> --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -24,7 +24,7 @@ PV = "0.0+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools distro_features_check pkgconfig
> +inherit autotools features_check pkgconfig
>
>  PACKAGECONFIG ??= "gtk3"
>  PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
> diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
> index f3305ae..f6dac2c 100644
> --- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
> +++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
> @@ -16,7 +16,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  FILES_${PN} += "${libdir}/matchbox-panel/*.so"
>
> diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
> index bb6b69b..227fd54 100644
> --- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
> +++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
> @@ -17,7 +17,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig gconf distro_features_check
> +inherit autotools pkgconfig gconf features_check
>
>  FILES_${PN} =  "${bindir}/* ${sysconfdir}"
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
> index c3560e8..299d14a 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
> @@ -24,7 +24,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>  SRC_URI[md5sum] = "65e06fe73ee166447894aaea95038e3b"
>  SRC_URI[sha256sum] = "6b80f0637a80818559ac8fd50db3b394f41cb61904fb9b3ed65fa51635806512"
>
> -inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
> +inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
>
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
> diff --git a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
> index bcf1c9c..d3a9de1 100644
> --- a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
> +++ b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
> @@ -9,7 +9,7 @@ SRC_URI[archive.sha256sum] = "0b51e6d339fa2bcca3a3e3159ccea574c67b107f1ac8b00047
>  DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
>
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase distro_features_check upstream-version-is-even
> +inherit gnomebase features_check upstream-version-is-even
>
>  PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
>
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> index a17f739..89f2d77 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>  DEPENDS = "glib-2.0 glib-2.0-native dbus dbus-glib virtual/libx11"
>  RDEPENDS_${PN} += "base-files"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta/recipes-support/libfm/libfm_1.3.1.bb b/meta/recipes-support/libfm/libfm_1.3.1.bb
> index 65a6f8e..918fe3e 100644
> --- a/meta/recipes-support/libfm/libfm_1.3.1.bb
> +++ b/meta/recipes-support/libfm/libfm_1.3.1.bb
> @@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
>  SRC_URI[md5sum] = "c15ecd2c9317e2c385cd3f046d0b61ba"
>  SRC_URI[sha256sum] = "96b1244bde41ca0eef0332cfb5c67bb16725dfd102128f3e6f74fadc13a1cfe4"
>
> -inherit autotools pkgconfig gtk-doc gettext distro_features_check
> +inherit autotools pkgconfig gtk-doc gettext features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  EXTRA_OECONF = "--with-gtk=3"
> diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> index 244d9e2..074f713 100644
> --- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> +++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> @@ -12,7 +12,7 @@ SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${P
>  SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
>  SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
>
> -inherit autotools distro_features_check
> +inherit autotools features_check
>
>  COMPATIBLE_HOST_libc-musl = 'null'
>
> diff --git a/meta/recipes-support/vte/vte_0.58.2.bb b/meta/recipes-support/vte/vte_0.58.2.bb
> index 9e27f69..0ed382a 100644
> --- a/meta/recipes-support/vte/vte_0.58.2.bb
> +++ b/meta/recipes-support/vte/vte_0.58.2.bb
> @@ -14,7 +14,7 @@ DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native"
>  GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_OPTION = 'gir'
>
> -inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
> +inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
>
>  # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
>  SRC_URI += "file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

