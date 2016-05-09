Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9242C6FF60
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 07:09:59 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k142so200725983oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 00:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pu0+xxrIABm/5oHnDFfSnZXD8YazfOSRWWNlkjazYoA=;
	b=gxGbSRUlC4RpNdH/Nd8Dkwy/TfEy0TZKFVOgfPlLfjbpfl6KD0qcmIZLvQyhJlo5+p
	bAvAIzUkkeAL4hmp8g64qV4hPhh6ibRqbOyMQyBfGgPxNrnRn0DyIWu0eFi5fkLB0d7s
	wu6uLwXhGZzSQ6pkCsq4/iZXkeoYZjdUsLgbCKDv7LKXZfc6lFQhH+5qKWRKgOqteWM0
	vlKjL8DLX69gOVeP4luoeFkmrAEENfYGeiCGFlnC7/ooXpA6c/3kwqFkzgrxyTEVVsc8
	k3imjczjcyl0HIyl727aRq9hqnlPwOx6xPJ5yvrY+6ON3FzW/z4lJnrtZEDkmlHQbpZ/
	SR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pu0+xxrIABm/5oHnDFfSnZXD8YazfOSRWWNlkjazYoA=;
	b=IgHLyprwdaOt8Ki1tqum/KsfVH/e7PA9UZd689ON5r5Q0PVKD9+rHgvsozvnzfbMoy
	4mgVQeuXIXfSfZXCgwxbJAObbUftN20O91/t3m01BCwrAlj8SI6z/w9JQ6H3zM60QS3g
	mJGNDpczIQUc13ptK3Vwa7EH+kmM3Trq5SNhEj/xHolg049vyyLcOs/06Mx7oihqhfjg
	xyxUILRoV6NXV2D9b3xWFn03LBua1A7JW28QC2salbJx+TGSGKYaj+b7zBCb4eBUMOUw
	NTv/7DIh2xmt7g3cLN+8Or6TM/JCiNtCrQYUcW8IMAuaoyoBh2RR142t4MsM5PqhfUQl
	9ibg==
X-Gm-Message-State: AOPr4FWs2v28wXnOOYLYsg1PEc0NIsT5/try82VKmwVoE2Nt+TiBecGKiKNIIj1oLEtjHwM9r0/BtHQoyl58d4+T
X-Received: by 10.157.37.45 with SMTP id k42mr15132552otb.119.1462777799687;
	Mon, 09 May 2016 00:09:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Mon, 9 May 2016 00:09:30 -0700 (PDT)
In-Reply-To: <1462728798-10477-1-git-send-email-dv@pseudoterminal.org>
References: <1462728798-10477-1-git-send-email-dv@pseudoterminal.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 9 May 2016 10:09:30 +0300
Message-ID: <CAHiDW_HY7t66Ab-eSkaHNw0=PVXTJxMTKYNsg+FDzUsnGnYmeA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-player: Remove recipe: gstplayer is part of -bad package since 1.8
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
X-List-Received-Date: Mon, 09 May 2016 07:10:01 -0000
Content-Type: text/plain; charset=UTF-8

I assume -bad only contains the gst-player library? We also want the
"gtk-play" UI for testing purposes.

Also note that without patches gst-player requires GTK+3 -- it may
make sense to hold the 1.8 update until the GTK+3 transition is done
(which I'm hoping happens during May) so we don't end up with both
GTK+ versions on sato images.

 - Jussi

On 8 May 2016 at 20:33, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../recipes-multimedia/gstreamer/gst-player_git.bb | 39 ----------------------
>  1 file changed, 39 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player_git.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> deleted file mode 100644
> index 8129169..0000000
> --- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY = "GStreamer playback helper library and examples"
> -LICENSE = "LGPL-2.0+"
> -LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
> -
> -DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
> -
> -SRC_URI = "git://github.com/sdroege/gst-player.git \
> -           file://filechooser.patch \
> -           file://gtk2.patch \
> -           file://Fix-pause-play.patch \
> -           file://Add-error-signal-emission-for-missing-plugins.patch \
> -           file://gst-player.desktop"
> -
> -SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
> -
> -ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> -
> -do_configure_prepend() {
> -       touch ${S}/ChangeLog
> -}
> -
> -EXTRA_OECONF += "ac_cv_path_VALGRIND=no ac_cv_path_GDB=no"
> -
> -do_install_append() {
> -       install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
> -}
> -
> -FILES_${PN}-bin += "${datadir}/applications/*.desktop"
> -
> -RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
> -RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
> -                         gstreamer1.0-plugins-good-meta \
> -                         gstreamer1.0-plugins-bad-meta \
> -                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
> -                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

