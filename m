Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 18B3C7782F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 17:30:35 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id z19so33278048qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=gBFblpI+KJDUGFrs0G27YYSHA4cIsMlj7WVP83j5I5I=;
	b=Gd/rcWkyzqjLgbLU+CHoCFS2s2NSrcOOEQm1gn9xkPZuvSjwpHkvPv8xuVft/rdHcK
	mRPnQaENmBIRANhD/EDWwPUl+3gPjh7SlyJJ1asoeT34euJLxn8JksbqZBc+3MiexA4J
	MYuyUzCvq8ydbo3cOpjsnPF4x1qlQ2RUdXj20Vf21VeIj6lYnYCwM/lgX31/rp2ykeo/
	7v9RVhUycynVdgLls49HeXBkgSNFTMudVlkdAaBNNVNA2uEZD7JuCLe0xeVwYM9wsvnb
	pjHQGzFUimMeP1spyBRTVIt4wyxYNGaB++dAlo6+HMo1t4ns0uEfYFnt8dv1f+ewSEKk
	I1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=gBFblpI+KJDUGFrs0G27YYSHA4cIsMlj7WVP83j5I5I=;
	b=OKAuMBRxeNTjhLZfqgI8kPTo45ULO2t0UMHtUUUsqMrE0F2cEA3jENm/vJ7MXfQZ+b
	bjgX46P1wtiMuqniqQrQ343EBYNVQQ6QnXRJMo/iOoI+07iQ7UdIGZwgbdIZUxy4CLfF
	tn1U4YHQ8HKDruchImBp1Yrrj7dZz9lms7466IFODobDqwXjKUOnO+0R/81gCPSHvJ2W
	FdFa/ZXa6gcdvDm0y76bKspWjopwfe2Xl+dNdc372nu9fjXp8mg8TaB6vuV38AffAbn/
	I2wt7eFFTC2nCSm6tncShsVZwVRvD+nS5nYVhPCmMH1Afa0bNkYmHs2jRBmspHADpWOh
	QS+A==
X-Gm-Message-State: AMCzsaUYU3qNdTv7bi8YIeBbB8TC1Xqj6SZOBEUOUhu+4oRa2ELJuyLV
	2BCn5l/BfGs4QXsqTjHyl6TvP9Eq
X-Received: by 10.13.233.70 with SMTP id s67mr899141ywe.381.1508175036562;
	Mon, 16 Oct 2017 10:30:36 -0700 (PDT)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42]) by smtp.gmail.com with ESMTPSA id
	k10sm4243669ywe.72.2017.10.16.10.30.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 10:30:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id h200so26346518oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:30:35 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TVN3DymMRp02u5S+nT6H4aacdwUCBIoLx53rRrpQev0mOdc2jVOVvwW8vXoYbe9jEqqDW/oLYmIa/g0eVhAQo=
X-Received: by 10.202.205.66 with SMTP id d63mr5677407oig.352.1508175034841;
	Mon, 16 Oct 2017 10:30:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 16 Oct 2017 10:30:34 -0700 (PDT)
In-Reply-To: <20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
References: <20171016172158.22773-1-fabien.lahoudere@collabora.co.uk>
	<20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
Date: Mon, 16 Oct 2017 15:30:34 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
Message-ID: <CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 3/3] weston: Bump version to 3.0.0
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
X-List-Received-Date: Mon, 16 Oct 2017 17:30:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 3:21 PM, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  .../wayland/weston/fix-missing-header.patch        | 18 +++++++
>  ...t-pitch-correctly-for-subsampled-textures.patch | 55 ++++++++++++++++++++++
>  .../wayland/{weston_2.0.0.bb => weston_3.0.0.bb}   | 17 +++----
>  3 files changed, 82 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston/fix-missing-header.patch
>  create mode 100644 meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
>  rename meta/recipes-graphics/wayland/{weston_2.0.0.bb => weston_3.0.0.bb} (89%)
>
> diff --git a/meta/recipes-graphics/wayland/weston/fix-missing-header.patch b/meta/recipes-graphics/wayland/weston/fix-missing-header.patch
> new file mode 100644
> index 0000000000..5db3a17393
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/fix-missing-header.patch
> @@ -0,0 +1,18 @@
> +Fix missing header
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> +
> +Index: weston-3.0.0/shared/timespec-util.h
> +===================================================================
> +--- weston-3.0.0.orig/shared/timespec-util.h
> ++++ weston-3.0.0/shared/timespec-util.h
> +@@ -28,6 +28,7 @@
> +
> + #include <stdint.h>
> + #include <assert.h>
> ++#include <time.h>
> +
> + #define NSEC_PER_SEC 1000000000
> +
> diff --git a/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> new file mode 100644
> index 0000000000..69284a9616
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> @@ -0,0 +1,55 @@
> +Multi-plane sub-sampled textures have partial width/height, e.g.
> +YUV420/I420 has a full-size Y plane, followed by a half-width/height U
> +plane, and a half-width/height V plane.
> +
> +zwp_linux_dmabuf_v1 allows clients to pass an explicit pitch for each
> +plane, but for wl_shm this must be inferred. gl-renderer was correctly
> +accounting for the width and height when subsampling, but the pitch was
> +being taken as the pitch for the first plane.
> +
> +This does not match the requirements for GStreamer's waylandsink, in
> +particular, as well as other clients. Fix the SHM upload path to
> +correctly set the pitch for each plane, according to subsampling.
> +
> +Tested with:
> +  $ gst-launch-1.0 videotestsrc ! waylandsink
> +
> +Upstream-status: Backport [https://patchwork.freedesktop.org/patch/180767/]
> +
> +Signed-off-by: Daniel Stone <daniels@collabora.com>
> +Fixes: fdeefe42418 ("gl-renderer: add support of WL_SHM_FORMAT_YUV420")
> +Reported-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> +Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=103063
> +
> +---
> + libweston/gl-renderer.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libweston/gl-renderer.c b/libweston/gl-renderer.c
> +index 244ce309..40bf0bb6 100644
> +--- a/libweston/gl-renderer.c
> ++++ b/libweston/gl-renderer.c
> +@@ -1445,14 +1445,13 @@ gl_renderer_flush_damage(struct weston_surface *surface)
> +               goto done;
> +       }
> +
> +-      glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch);
> +-
> +       if (gs->needs_full_upload) {
> +               glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
> +               glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
> +               wl_shm_buffer_begin_access(buffer->shm_buffer);
> +               for (j = 0; j < gs->num_textures; j++) {
> +                       glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
> ++                      glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
> +                       glTexImage2D(GL_TEXTURE_2D, 0,
> +                                    gs->gl_format[j],
> +                                    gs->pitch / gs->hsub[j],
> +@@ -1477,6 +1476,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
> +               glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, r.y1);
> +               for (j = 0; j < gs->num_textures; j++) {
> +                       glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
> ++                      glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
> +                       glTexSubImage2D(GL_TEXTURE_2D, 0,
> +                                       r.x1 / gs->hsub[j],
> +                                       r.y1 / gs->vsub[j],
> diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-graphics/wayland/weston_3.0.0.bb
> similarity index 89%
> rename from meta/recipes-graphics/wayland/weston_2.0.0.bb
> rename to meta/recipes-graphics/wayland/weston_3.0.0.bb
> index 8160f5556d..ad0cdc2b0f 100644
> --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_3.0.0.bb
> @@ -9,12 +9,13 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://weston.png \
>             file://weston.desktop \
>             file://0001-make-error-portable.patch \
> -           file://0001-configure.ac-Fix-wayland-protocols-path.patch \
>             file://xwayland.weston-start \
>             file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
> +          file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch \
> +          file://fix-missing-header.patch \

Those should be documented on commit log

>  "
> -SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
> -SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8"
> +SRC_URI[md5sum] = "9c42a4c51a1b9f35d040fa9d45ada36d"
> +SRC_URI[sha256sum] = "cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5"
>
>  inherit autotools pkgconfig useradd distro_features_check
>  # depends on virtual/egl
> @@ -76,7 +77,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
>
>  do_install_append() {
>         # Weston doesn't need the .la files to load modules, so wipe them
> -       rm -f ${D}/${libdir}/libweston-2/*.la
> +       rm -f ${D}/${libdir}/libweston-3/*.la
>
>         # If X11, ship a desktop file to launch it
>         if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
> @@ -93,16 +94,16 @@ do_install_append() {
>  }
>
>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
> -             libweston-2 ${PN}-examples"
> +             libweston-3 ${PN}-examples"
>
>  FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
>
> -FILES_libweston-2 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/*.so"
> -SUMMARY_libweston-2 = "Helper library for implementing 'wayland window managers'."
> +FILES_libweston-3 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/*.so"
> +SUMMARY_libweston-3 = "Helper library for implementing 'wayland window managers'."
>
>  FILES_${PN}-examples = "${bindir}/*"
>
> -FILES_${PN}-xwayland = "${libdir}/libweston-2/xwayland.so"
> +FILES_${PN}-xwayland = "${libdir}/libweston-3/xwayland.so"
>  RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
>
>  RDEPENDS_${PN} += "xkeyboard-config"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

