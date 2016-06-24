Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 625556FEF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 14:01:23 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r136so2199332qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MnIx4kXDYlIyMmRoN3Zc9QPHC/FB4oQW/NZpT4mm8WA=;
	b=CcOE8TWAT9apawZPwwhgF4CRE5iNH94TWZMwmCKUYjSk1hS1b9xOThHpwZQPi3+rbM
	/3oSeiPVTDxtr5NNWaWf7ka93v193b/L7pYEEWtyanJf6bGuvZZ5tb96tTQZZyifuoQ0
	k1noWDJVkiCrBuVPLNubhvlHyQt5ZAMPWj5CMww0XleOc+Bicrg4CTnYp4mndJk3KU+i
	uwv1wy4BIQgm6Uq8srzQ5JDikymtlKDm7JSZ2sdqjLAyQprvZpyi+WzgpDrcD6vaSf0J
	ck+pXo/vApH95SCxBXx1m7UGe2qAZ+HD6FfpFDDGncnQLGsq4Om/cRFhWXvP/YAf1zHL
	ADiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MnIx4kXDYlIyMmRoN3Zc9QPHC/FB4oQW/NZpT4mm8WA=;
	b=I9SF19Chx6BKoXAukY8/QJwvEmm9nUf0K74RqVMBSv5zFfMOSi1BtivJ4LnB2mDwQF
	GyKyzylqULNA0Y0obpNIvq+GUUE5F3MbdkG7NGL4QfL+BgK/Z5ldEQybZT/Gi29ohmD/
	D3mqE47SsKuL9yYV0ww2GHlD8uhrugYH8ifHQKXkTE5UNZRYveLPBCqWX6Tvl2H5aeEp
	TmdeEqNL8IEBuje/oXjWgX/5vLDl3Q2m6p0bopzJ56IHJLg827ll9uIaezAsTGBlifqS
	XfiaZ1LsP7CC4W0UAPA8LWqedmX682Jik3QGeRjvMmmxNnb0HrGCEpYX6jHl74DhIomE
	Yz0g==
X-Gm-Message-State: ALyK8tLmbAjBfhehq52pd/RQyuddG/o1wqMv6Gpt/+XJOKE4swboiZCuw0AurTvT/jzdy12OI12SYaDXn0vlpw==
X-Received: by 10.55.97.5 with SMTP id v5mr5239758qkb.41.1466776883717; Fri,
	24 Jun 2016 07:01:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 07:00:54 -0700 (PDT)
In-Reply-To: <1466770370-6412-1-git-send-email-ross.burton@intel.com>
References: <1466770370-6412-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jun 2016 07:00:54 -0700
Message-ID: <CAMKF1srRrjUd4r=e2BoDhC0MWhiaK4Wox2zWmhZVBiSrooqZYw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-player: upgrade to latest HEAD
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
X-List-Received-Date: Fri, 24 Jun 2016 14:01:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 24, 2016 at 5:12 AM, Ross Burton <ross.burton@intel.com> wrote:
> Update to the latest revision now that we have gst-plugins-bad 1.8.x which has
> integrated the GstPlayer object.  This upstream is now just the user interface,
> so remove all redundant items from the packaging and package the binaries in PN
> instead of PN-bin.

thanks Ross, I had a half cooked fix for this but this is better.

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../recipes-multimedia/gstreamer/gst-player_git.bb | 31 ++++++++++------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> index 6d39c2d..b09244b 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> @@ -1,20 +1,20 @@
>  SUMMARY = "GStreamer playback helper library and examples"
>  LICENSE = "LGPL-2.0+"
> -LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
> +LIC_FILES_CHKSUM = "file://gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
>
> -DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+3"
> +DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3"
>
>  SRC_URI = "git://github.com/sdroege/gst-player.git \
> -           file://filechooser.patch \
> -           file://Fix-pause-play.patch \
> -           file://Add-error-signal-emission-for-missing-plugins.patch \
> +           file://filechooser.patch;apply=0 \
> +           file://Fix-pause-play.patch;apply=0 \
> +           file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
>             file://gst-player.desktop"
>
> -SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
> +SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
> +inherit autotools pkgconfig distro_features_check
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
> @@ -22,17 +22,14 @@ do_configure_prepend() {
>         touch ${S}/ChangeLog
>  }
>
> -EXTRA_OECONF += "ac_cv_path_VALGRIND=no ac_cv_path_GDB=no"
> -
>  do_install_append() {
>         install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
>  }
>
> -FILES_${PN}-bin += "${datadir}/applications/*.desktop"
> -
> -RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
> -RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
> -                         gstreamer1.0-plugins-good-meta \
> -                         gstreamer1.0-plugins-bad-meta \
> -                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
> -                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
> +RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback"
> +RRECOMMENDS_${PN} = "gstreamer1.0-plugins-base-meta \
> +                     gstreamer1.0-plugins-good-meta \
> +                     gstreamer1.0-plugins-bad-meta \
> +                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
> +                     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
> +RPROVIDES_${PN} += "${PN}-bin"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

