Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7210477DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 14:25:00 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id r30so166433831qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i3YBF9saz5KT+FSqJCb4XwrblS5cShT7RPm1VyQpcJA=;
	b=kvhyXMEGGHzzNAj/l7Y3CbNr1jJRpa1nuesBBFwtZUFQG9G1YCMGYMD2l4fhXtEP9X
	QEPtHA8t8AcwqKkbDqJkC2IUQPye/1TlTzkE3f+FzvH/ALTREygHqewfOzPntHBoXKO0
	W6poL5RzCBcIEW3p8aPTaljahAkDflllufNvHyaimeT9r4LLdq0fjvABuDs9tTBOMLTL
	6unvTafNznLwGnIt/MGCl0ktXp1WhipO3pBhGSeETG06OKzdUd8hM8IyJqqqUcdZt/ly
	qsSHcxmd4p7Q6dDJbJaJFif5aE1GGozSAl7gfBhBnSkBAXHTuBotSrtZlFrxVY9sfvSW
	PLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i3YBF9saz5KT+FSqJCb4XwrblS5cShT7RPm1VyQpcJA=;
	b=FE/kvyYt9Nwi32HGiRJkSrxzvN0wVciDzTvTDbI/+H4rElSAqkZDtMX8jJi1K/LIJ0
	BkZKyBrjOXdb4wn0p79Hiz0RWdyd3468wuEiAUVuUs7YbMIOSx6Rl1dGGarWeqJbFsDK
	6+VruRQb8RH+0/1J23xKHwwv+il+CKY/cbVfTRxR9f9KkvzCK7vnszQytvc8aMdnP9PS
	eGgqGR+GZplqkCxJ/WUsZEMOtsCYkarlUNXKQl/guRHhwzN/mqbyw0a4QemmQYxXFzxj
	IvAFoWBDP3BDdDMnkTofeW30wgPHfRMGEXHhrv9e3Brlw6RyV/qLY+0QqTK+6hdblOML
	owlg==
X-Gm-Message-State: AKS2vOyi8+cVrrxS52FAwJZ/IVPzY56wy9eFqJ2owhktc/G0GTi5Gucg
	fuj31EpKhGFTaI0aOwefF6UfMnUoA4RA
X-Received: by 10.237.42.129 with SMTP id t1mr46143963qtd.93.1499178302193;
	Tue, 04 Jul 2017 07:25:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 4 Jul 2017 07:24:41 -0700 (PDT)
In-Reply-To: <1499174980-28223-2-git-send-email-maxin.john@intel.com>
References: <1499174980-28223-1-git-send-email-maxin.john@intel.com>
	<1499174980-28223-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Jul 2017 15:24:41 +0100
Message-ID: <CAJTo0LYYxTT_rJT1YxG34ROfuemMRaLkRqBhSDLQ9ifRfSmyXA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] libva: upgrade to 1.8.3
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
X-List-Received-Date: Tue, 04 Jul 2017 14:25:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ac1a28571d05537ea6c3"

--94eb2c05ac1a28571d05537ea6c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

packages/corei7-64-poky-linux/libva/libva: FILELIST: removed
"/usr/lib/libva-drm.so.1.3904.0 /usr/bin/mpeg2vldemo /usr/bin/putsurface
/usr/bin/vainfo /usr/bin/mpeg2vaenc /usr/bin/h264encode /usr/bin/loadjpeg
/usr/bin/jpegenc /usr/lib/libva.so.1.3904.0 /usr/bin/putsurface_wayland
/usr/bin/avcenc", added "/usr/lib/libva-drm.so.1.4000.0
/usr/lib/libva.so.1.4000.0"

libva-drm should never have been in that package, and all the binaries have
disappeared.

(Maybe using dynamic splitting would be more reliable)

Ross

On 4 July 2017 at 14:29, Maxin B. John <maxin.john@intel.com> wrote:

> 1.7.3 -> 1.8.3
>
> Remove upstreamed patch:
>         0001-wayland-Don-t-commit-and-ship-generated-files.patch
>
> Replace following patch by setting ac_cv_prog in EXTRA_OECONF:
>         0001-configure.ac-Use-wayland-scanner-in-PATH.patch
>
> The dummy driver was removed in 1.8.3 release.
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  ...-configure.ac-Use-wayland-scanner-in-PATH.patch |  37 ---
>  ...and-Don-t-commit-and-ship-generated-files.patch | 339
> ---------------------
>  .../libva/{libva_1.7.3.bb =3D> libva_1.8.3.bb}       |   8 +-
>  3 files changed, 3 insertions(+), 381 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libva/
> files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
>  delete mode 100644 meta/recipes-graphics/libva/files/0001-wayland-Don-t-
> commit-and-ship-generated-files.patch
>  rename meta/recipes-graphics/libva/{libva_1.7.3.bb =3D> libva_1.8.3.bb}
> (88%)
>
> diff --git a/meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayl=
and-scanner-in-PATH.patch
> b/meta/recipes-graphics/libva/files/0001-configure.ac-Use-
> wayland-scanner-in-PATH.patch
> deleted file mode 100644
> index a99c225..0000000
> --- a/meta/recipes-graphics/libva/files/0001-configure.ac-Use-
> wayland-scanner-in-PATH.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 0af30602502035155929dd2a14482b82a9747cf8 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Thu, 23 Feb 2017 15:23:15 +0200
> -Subject: [PATCH] configure.ac: Use wayland-scanner in PATH
> -
> -pkg-config will give us the wrong wayland-scanner location.
> -Use the one in path instead: it will be from native sysroot.
> -
> -This is a workaround and should be fixed upstream: preferably
> -with the same fix as all the other wayland-scanner users
> -(see YOCTO #11100).
> -
> -Upstream-Status: Inappropriate [workaround]
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - configure.ac | 5 +----
> - 1 file changed, 1 insertion(+), 4 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 64eddf2..5536f35 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -273,10 +273,7 @@ if test "$enable_wayland" =3D "yes"; then
> -     PKG_CHECK_MODULES([WAYLAND], [wayland-client >=3D wayland_api_versi=
on],
> -         [USE_WAYLAND=3D"yes"], [:])
> -     if test "$USE_WAYLAND" =3D "yes"; then
> --
> --        WAYLAND_PREFIX=3D`$PKG_CONFIG --variable=3Dprefix wayland-clien=
t`
> --        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner],,
> --                     [${WAYLAND_PREFIX}/bin$PATH_SEPARATOR$PATH])
> -+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> -
> -         AC_DEFINE([HAVE_VA_WAYLAND], [1],
> -                   [Defined to 1 if VA/Wayland API is built])
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-graphics/libva/files/0001-wayland-Don-t-
> commit-and-ship-generated-files.patch b/meta/recipes-graphics/libva/
> files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
> deleted file mode 100644
> index bd97e22..0000000
> --- a/meta/recipes-graphics/libva/files/0001-wayland-Don-t-
> commit-and-ship-generated-files.patch
> +++ /dev/null
> @@ -1,339 +0,0 @@
> -From 5993a7710cc8fd9a392d5015be5109987a42b498 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Thu, 23 Feb 2017 16:10:09 +0200
> -Subject: [PATCH] wayland: Don't commit and ship generated files
> -
> -I believe shipping wayland-drm-client-protocol.h is wrong: The header
> -should always be generated by the wayland-scanner that matches the
> -runtime wayland version. Currently when someone clones the repo and
> -builds, the shipped version is used.
> -
> -Upstream-Status: Submitted [https://github.com/01org/libva/pull/33]
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - va/wayland/Makefile.am                   |   5 +-
> - va/wayland/wayland-drm-client-protocol.h | 290
> -------------------------------
> - 2 files changed, 4 insertions(+), 291 deletions(-)
> - delete mode 100644 va/wayland/wayland-drm-client-protocol.h
> -
> -diff --git a/va/wayland/Makefile.am b/va/wayland/Makefile.am
> -index 4f8262c..4ab8d07 100644
> ---- a/va/wayland/Makefile.am
> -+++ b/va/wayland/Makefile.am
> -@@ -53,7 +53,7 @@ protocol_source_h =3D \
> - noinst_LTLIBRARIES            =3D libva_wayland.la
> - libva_waylandincludedir               =3D ${includedir}/va
> - libva_waylandinclude_HEADERS  =3D $(source_h)
> --libva_wayland_la_SOURCES      =3D $(source_c) $(protocol_source_h)
> -+libva_wayland_la_SOURCES      =3D $(source_c)
> - noinst_HEADERS                        =3D $(source_h_priv)
> -
> - # Wayland protocol
> -@@ -65,5 +65,8 @@ EXTRA_DIST =3D \
> -       wayland-drm.xml         \
> -       $(NULL)
> -
> -+BUILT_SOURCES =3D $(protocol_source_h)
> -+CLEANFILES =3D $(BUILT_SOURCES)
> -+
> - # Extra clean files so that maintainer-clean removes *everything*
> - MAINTAINERCLEANFILES =3D Makefile.in
> -diff --git a/va/wayland/wayland-drm-client-protocol.h
> b/va/wayland/wayland-drm-client-protocol.h
> -deleted file mode 100644
> -index da267e8..0000000
> ---- a/va/wayland/wayland-drm-client-protocol.h
> -+++ /dev/null
> -@@ -1,290 +0,0 @@
> --/* Generated by wayland-scanner 1.11.90 */
> --
> --#ifndef DRM_CLIENT_PROTOCOL_H
> --#define DRM_CLIENT_PROTOCOL_H
> --
> --#include <stdint.h>
> --#include <stddef.h>
> --#include "wayland-client.h"
> --
> --#ifdef  __cplusplus
> --extern "C" {
> --#endif
> --
> --/**
> -- * @page page_drm The drm protocol
> -- * @section page_ifaces_drm Interfaces
> -- * - @subpage page_iface_wl_drm -
> -- * @section page_copyright_drm Copyright
> -- * <pre>
> -- *
> -- * Copyright =C2=A9 2008-2011 Kristian H=C3=B8gsberg
> -- * Copyright =C2=A9 2010-2011 Intel Corporation
> -- *
> -- * Permission to use, copy, modify, distribute, and sell this
> -- * software and its documentation for any purpose is hereby granted
> -- * without fee, provided that\n the above copyright notice appear in
> -- * all copies and that both that copyright notice and this permission
> -- * notice appear in supporting documentation, and that the name of
> -- * the copyright holders not be used in advertising or publicity
> -- * pertaining to distribution of the software without specific,
> -- * written prior permission.  The copyright holders make no
> -- * representations about the suitability of this software for any
> -- * purpose.  It is provided "as is" without express or implied
> -- * warranty.
> -- *
> -- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
> -- * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
> -- * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
> -- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> -- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
> -- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
> -- * ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
> -- * THIS SOFTWARE.
> -- * </pre>
> -- */
> --struct wl_buffer;
> --struct wl_drm;
> --
> --/**
> -- * @page page_iface_wl_drm wl_drm
> -- * @section page_iface_wl_drm_api API
> -- * See @ref iface_wl_drm.
> -- */
> --/**
> -- * @defgroup iface_wl_drm The wl_drm interface
> -- */
> --extern const struct wl_interface wl_drm_interface;
> --
> --#ifndef WL_DRM_ERROR_ENUM
> --#define WL_DRM_ERROR_ENUM
> --enum wl_drm_error {
> --      WL_DRM_ERROR_AUTHENTICATE_FAIL =3D 0,
> --      WL_DRM_ERROR_INVALID_FORMAT =3D 1,
> --      WL_DRM_ERROR_INVALID_NAME =3D 2,
> --};
> --#endif /* WL_DRM_ERROR_ENUM */
> --
> --#ifndef WL_DRM_FORMAT_ENUM
> --#define WL_DRM_FORMAT_ENUM
> --enum wl_drm_format {
> --      WL_DRM_FORMAT_C8 =3D 0x20203843,
> --      WL_DRM_FORMAT_RGB332 =3D 0x38424752,
> --      WL_DRM_FORMAT_BGR233 =3D 0x38524742,
> --      WL_DRM_FORMAT_XRGB4444 =3D 0x32315258,
> --      WL_DRM_FORMAT_XBGR4444 =3D 0x32314258,
> --      WL_DRM_FORMAT_RGBX4444 =3D 0x32315852,
> --      WL_DRM_FORMAT_BGRX4444 =3D 0x32315842,
> --      WL_DRM_FORMAT_ARGB4444 =3D 0x32315241,
> --      WL_DRM_FORMAT_ABGR4444 =3D 0x32314241,
> --      WL_DRM_FORMAT_RGBA4444 =3D 0x32314152,
> --      WL_DRM_FORMAT_BGRA4444 =3D 0x32314142,
> --      WL_DRM_FORMAT_XRGB1555 =3D 0x35315258,
> --      WL_DRM_FORMAT_XBGR1555 =3D 0x35314258,
> --      WL_DRM_FORMAT_RGBX5551 =3D 0x35315852,
> --      WL_DRM_FORMAT_BGRX5551 =3D 0x35315842,
> --      WL_DRM_FORMAT_ARGB1555 =3D 0x35315241,
> --      WL_DRM_FORMAT_ABGR1555 =3D 0x35314241,
> --      WL_DRM_FORMAT_RGBA5551 =3D 0x35314152,
> --      WL_DRM_FORMAT_BGRA5551 =3D 0x35314142,
> --      WL_DRM_FORMAT_RGB565 =3D 0x36314752,
> --      WL_DRM_FORMAT_BGR565 =3D 0x36314742,
> --      WL_DRM_FORMAT_RGB888 =3D 0x34324752,
> --      WL_DRM_FORMAT_BGR888 =3D 0x34324742,
> --      WL_DRM_FORMAT_XRGB8888 =3D 0x34325258,
> --      WL_DRM_FORMAT_XBGR8888 =3D 0x34324258,
> --      WL_DRM_FORMAT_RGBX8888 =3D 0x34325852,
> --      WL_DRM_FORMAT_BGRX8888 =3D 0x34325842,
> --      WL_DRM_FORMAT_ARGB8888 =3D 0x34325241,
> --      WL_DRM_FORMAT_ABGR8888 =3D 0x34324241,
> --      WL_DRM_FORMAT_RGBA8888 =3D 0x34324152,
> --      WL_DRM_FORMAT_BGRA8888 =3D 0x34324142,
> --      WL_DRM_FORMAT_XRGB2101010 =3D 0x30335258,
> --      WL_DRM_FORMAT_XBGR2101010 =3D 0x30334258,
> --      WL_DRM_FORMAT_RGBX1010102 =3D 0x30335852,
> --      WL_DRM_FORMAT_BGRX1010102 =3D 0x30335842,
> --      WL_DRM_FORMAT_ARGB2101010 =3D 0x30335241,
> --      WL_DRM_FORMAT_ABGR2101010 =3D 0x30334241,
> --      WL_DRM_FORMAT_RGBA1010102 =3D 0x30334152,
> --      WL_DRM_FORMAT_BGRA1010102 =3D 0x30334142,
> --      WL_DRM_FORMAT_YUYV =3D 0x56595559,
> --      WL_DRM_FORMAT_YVYU =3D 0x55595659,
> --      WL_DRM_FORMAT_UYVY =3D 0x59565955,
> --      WL_DRM_FORMAT_VYUY =3D 0x59555956,
> --      WL_DRM_FORMAT_AYUV =3D 0x56555941,
> --      WL_DRM_FORMAT_NV12 =3D 0x3231564e,
> --      WL_DRM_FORMAT_NV21 =3D 0x3132564e,
> --      WL_DRM_FORMAT_NV16 =3D 0x3631564e,
> --      WL_DRM_FORMAT_NV61 =3D 0x3136564e,
> --      WL_DRM_FORMAT_YUV410 =3D 0x39565559,
> --      WL_DRM_FORMAT_YVU410 =3D 0x39555659,
> --      WL_DRM_FORMAT_YUV411 =3D 0x31315559,
> --      WL_DRM_FORMAT_YVU411 =3D 0x31315659,
> --      WL_DRM_FORMAT_YUV420 =3D 0x32315559,
> --      WL_DRM_FORMAT_YVU420 =3D 0x32315659,
> --      WL_DRM_FORMAT_YUV422 =3D 0x36315559,
> --      WL_DRM_FORMAT_YVU422 =3D 0x36315659,
> --      WL_DRM_FORMAT_YUV444 =3D 0x34325559,
> --      WL_DRM_FORMAT_YVU444 =3D 0x34325659,
> --};
> --#endif /* WL_DRM_FORMAT_ENUM */
> --
> --#ifndef WL_DRM_CAPABILITY_ENUM
> --#define WL_DRM_CAPABILITY_ENUM
> --/**
> -- * @ingroup iface_wl_drm
> -- * wl_drm capability bitmask
> -- *
> -- * Bitmask of capabilities.
> -- */
> --enum wl_drm_capability {
> --      /**
> --       * wl_drm prime available
> --       */
> --      WL_DRM_CAPABILITY_PRIME =3D 1,
> --};
> --#endif /* WL_DRM_CAPABILITY_ENUM */
> --
> --/**
> -- * @ingroup iface_wl_drm
> -- * @struct wl_drm_listener
> -- */
> --struct wl_drm_listener {
> --      /**
> --       */
> --      void (*device)(void *data,
> --                     struct wl_drm *wl_drm,
> --                     const char *name);
> --      /**
> --       */
> --      void (*format)(void *data,
> --                     struct wl_drm *wl_drm,
> --                     uint32_t format);
> --      /**
> --       */
> --      void (*authenticated)(void *data,
> --                            struct wl_drm *wl_drm);
> --      /**
> --       */
> --      void (*capabilities)(void *data,
> --                           struct wl_drm *wl_drm,
> --                           uint32_t value);
> --};
> --
> --/**
> -- * @ingroup wl_drm_iface
> -- */
> --static inline int
> --wl_drm_add_listener(struct wl_drm *wl_drm,
> --                  const struct wl_drm_listener *listener, void *data)
> --{
> --      return wl_proxy_add_listener((struct wl_proxy *) wl_drm,
> --                                   (void (**)(void)) listener, data);
> --}
> --
> --#define WL_DRM_AUTHENTICATE 0
> --#define WL_DRM_CREATE_BUFFER 1
> --#define WL_DRM_CREATE_PLANAR_BUFFER 2
> --#define WL_DRM_CREATE_PRIME_BUFFER 3
> --
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --#define WL_DRM_AUTHENTICATE_SINCE_VERSION 1
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --#define WL_DRM_CREATE_BUFFER_SINCE_VERSION 1
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --#define WL_DRM_CREATE_PLANAR_BUFFER_SINCE_VERSION 1
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --#define WL_DRM_CREATE_PRIME_BUFFER_SINCE_VERSION 2
> --
> --/** @ingroup iface_wl_drm */
> --static inline void
> --wl_drm_set_user_data(struct wl_drm *wl_drm, void *user_data)
> --{
> --      wl_proxy_set_user_data((struct wl_proxy *) wl_drm, user_data);
> --}
> --
> --/** @ingroup iface_wl_drm */
> --static inline void *
> --wl_drm_get_user_data(struct wl_drm *wl_drm)
> --{
> --      return wl_proxy_get_user_data((struct wl_proxy *) wl_drm);
> --}
> --
> --static inline uint32_t
> --wl_drm_get_version(struct wl_drm *wl_drm)
> --{
> --      return wl_proxy_get_version((struct wl_proxy *) wl_drm);
> --}
> --
> --/** @ingroup iface_wl_drm */
> --static inline void
> --wl_drm_destroy(struct wl_drm *wl_drm)
> --{
> --      wl_proxy_destroy((struct wl_proxy *) wl_drm);
> --}
> --
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --static inline void
> --wl_drm_authenticate(struct wl_drm *wl_drm, uint32_t id)
> --{
> --      wl_proxy_marshal((struct wl_proxy *) wl_drm,
> --                       WL_DRM_AUTHENTICATE, id);
> --}
> --
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --static inline struct wl_buffer *
> --wl_drm_create_buffer(struct wl_drm *wl_drm, uint32_t name, int32_t
> width, int32_t height, uint32_t stride, uint32_t format)
> --{
> --      struct wl_proxy *id;
> --
> --      id =3D wl_proxy_marshal_constructor((struct wl_proxy *) wl_drm,
> --                       WL_DRM_CREATE_BUFFER, &wl_buffer_interface, NULL=
,
> name, width, height, stride, format);
> --
> --      return (struct wl_buffer *) id;
> --}
> --
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --static inline struct wl_buffer *
> --wl_drm_create_planar_buffer(struct wl_drm *wl_drm, uint32_t name,
> int32_t width, int32_t height, uint32_t format, int32_t offset0, int32_t
> stride0, int32_t offset1, int32_t stride1, int32_t offset2, int32_t strid=
e2)
> --{
> --      struct wl_proxy *id;
> --
> --      id =3D wl_proxy_marshal_constructor((struct wl_proxy *) wl_drm,
> --                       WL_DRM_CREATE_PLANAR_BUFFER,
> &wl_buffer_interface, NULL, name, width, height, format, offset0, stride0=
,
> offset1, stride1, offset2, stride2);
> --
> --      return (struct wl_buffer *) id;
> --}
> --
> --/**
> -- * @ingroup iface_wl_drm
> -- */
> --static inline struct wl_buffer *
> --wl_drm_create_prime_buffer(struct wl_drm *wl_drm, int32_t name, int32_t
> width, int32_t height, uint32_t format, int32_t offset0, int32_t stride0,
> int32_t offset1, int32_t stride1, int32_t offset2, int32_t stride2)
> --{
> --      struct wl_proxy *id;
> --
> --      id =3D wl_proxy_marshal_constructor((struct wl_proxy *) wl_drm,
> --                       WL_DRM_CREATE_PRIME_BUFFER, &wl_buffer_interface=
,
> NULL, name, width, height, format, offset0, stride0, offset1, stride1,
> offset2, stride2);
> --
> --      return (struct wl_buffer *) id;
> --}
> --
> --#ifdef  __cplusplus
> --}
> --#endif
> --
> --#endif
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-graphics/libva/libva_1.7.3.bb
> b/meta/recipes-graphics/libva/libva_1.8.3.bb
> similarity index 88%
> rename from meta/recipes-graphics/libva/libva_1.7.3.bb
> rename to meta/recipes-graphics/libva/libva_1.8.3.bb
> index 6c0b90f..bb5f829 100644
> --- a/meta/recipes-graphics/libva/libva_1.7.3.bb
> +++ b/meta/recipes-graphics/libva/libva_1.8.3.bb
> @@ -17,10 +17,8 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035378=
00f"
>
> -SRC_URI =3D "git://github.com/01org/libva.git;protocol=3Dhttp;branch=3Dv=
1.7-
> branch \
> -           file://0001-configure.ac-Use-wayland-scanner-in-PATH.patch \
> -           file://0001-wayland-Don-t-commit-and-ship-generated-
> files.patch"
> -SRCREV =3D "dbf9f7e33349c3cee8d131e93a6a4f91255635cb"
> +SRC_URI =3D "git://github.com/01org/libva.git;protocol=3Dhttp;branch=3Dv=
1.8-
> branch "
> +SRCREV =3D "457470987cc9df5976ce8c72ffd4bfbd9baaf0f9"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "libva-(?P<pver>(\d+(\.\d+)+))"
>
>  S =3D "${WORKDIR}/git"
> @@ -31,7 +29,7 @@ inherit autotools pkgconfig distro_features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
>
> -EXTRA_OECONF =3D "--disable-dummy-driver"
> +EXTRA_OECONF =3D "ac_cv_prog_WAYLAND_SCANNER=3Dwayland-scanner"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
,
> d)}"
>  PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11 libxex=
t
> libxfixes"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05ac1a28571d05537ea6c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">packages/corei7-64-poky-linux/libva/libva: FILELIST: remov=
ed &quot;/usr/lib/libva-drm.so.1.3904.0 /usr/bin/mpeg2vldemo /usr/bin/putsu=
rface /usr/bin/vainfo /usr/bin/mpeg2vaenc /usr/bin/h264encode /usr/bin/load=
jpeg /usr/bin/jpegenc /usr/lib/libva.so.1.3904.0 /usr/bin/putsurface_waylan=
d /usr/bin/avcenc&quot;, added &quot;/usr/lib/libva-drm.so.1.4000.0 /usr/li=
b/libva.so.1.4000.0&quot;<br><div><br></div><div>libva-drm should never hav=
e been in that package, and all the binaries have disappeared.</div><div><b=
r></div><div>(Maybe using dynamic splitting would be more reliable)</div><d=
iv><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 4 July 2017 at 14:29, Maxin B. John <span dir=3D"ltr">&=
lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1.7.3 -&gt; =
1.8.3<br>
<br>
Remove upstreamed patch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-wayland-Don-t-commit-and-<wbr>ship-generat=
ed-files.patch<br>
<br>
Replace following patch by setting ac_cv_prog in EXTRA_OECONF:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-configure.ac-Use-wayland-<wbr>scanner-in-P=
ATH.patch<br>
<br>
The dummy driver was removed in 1.8.3 release.<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0...-configure.ac-Use-wayland-<wbr>scanner-in-PATH.patch |=C2=A0 37 --=
-<br>
=C2=A0...and-Don-t-commit-and-ship-<wbr>generated-files.patch | 339 -------=
--------------<br>
=C2=A0.../libva/{<a href=3D"http://libva_1.7.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libva_1.7.3.bb</a> =3D&gt; <a href=3D"http://libva_1.8.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libva_1.8.3.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A03 files changed, 3 insertions(+), 381 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/libva/<wbr>files/0001-config=
ure.ac-Use-<wbr>wayland-scanner-in-PATH.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/libva/<wbr>files/0001-waylan=
d-Don-t-<wbr>commit-and-ship-generated-<wbr>files.patch<br>
=C2=A0rename meta/recipes-graphics/libva/{<a href=3D"http://libva_1.7.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">l<wbr>ibva_1.7.3.bb</a> =3D&gt; <a hr=
ef=3D"http://libva_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">libva_1.8=
.3.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-graphics/libva/<wbr>files/0001-configure.ac-Use-<=
wbr>wayland-scanner-in-PATH.patch b/meta/recipes-graphics/libva/<wbr>files/=
0001-configure.ac-Use-<wbr>wayland-scanner-in-PATH.patch<br>
deleted file mode 100644<br>
index a99c225..0000000<br>
--- a/meta/recipes-graphics/libva/<wbr>files/0001-configure.ac-Use-<wbr>way=
land-scanner-in-PATH.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From 0af30602502035155929dd2a14482b<wbr>82a9747cf8 Mon Sep 17 00:00:00 200=
1<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
-Date: Thu, 23 Feb 2017 15:23:15 +0200<br>
-Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: Use wayland-scanner in PATH<br>
-<br>
-pkg-config will give us the wrong wayland-scanner location.<br>
-Use the one in path instead: it will be from native sysroot.<br>
-<br>
-This is a workaround and should be fixed upstream: preferably<br>
-with the same fix as all the other wayland-scanner users<br>
-(see YOCTO #11100).<br>
-<br>
-Upstream-Status: Inappropriate [workaround]<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 5 +----<br>
- 1 file changed, 1 insertion(+), 4 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 64eddf2..5536f35 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -273,10 +273,7 @@ if test &quot;$enable_wayland&quot; =3D &quot;yes&quo=
t;; then<br>
-=C2=A0 =C2=A0 =C2=A0PKG_CHECK_MODULES([WAYLAND], [wayland-client &gt;=3D w=
ayland_api_version],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[USE_WAYLAND=3D&quot;yes&quot;], [:])<br=
>
-=C2=A0 =C2=A0 =C2=A0if test &quot;$USE_WAYLAND&quot; =3D &quot;yes&quot;; =
then<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PREFIX=3D`$PKG_CONFIG --variable=3Dpr=
efix wayland-client`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_PROG([WAYLAND_SCANNER]<wbr>, [wayland=
-scanner],,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0[${WAYLAND_PREFIX}/bin$PATH_<wbr>SEPARATOR$PATH])<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_PROG([WAYLAND_SCANNER]<wbr>, [wayland=
-scanner])<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([HAVE_VA_WAYLAND], [1],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Defi=
ned to 1 if VA/Wayland API is built])<br>
---<br>
-2.1.4<br>
-<br>
diff --git a/meta/recipes-graphics/libva/<wbr>files/0001-wayland-Don-t-<wbr=
>commit-and-ship-generated-<wbr>files.patch b/meta/recipes-graphics/libva/<=
wbr>files/0001-wayland-Don-t-<wbr>commit-and-ship-generated-<wbr>files.patc=
h<br>
deleted file mode 100644<br>
index bd97e22..0000000<br>
--- a/meta/recipes-graphics/libva/<wbr>files/0001-wayland-Don-t-<wbr>commit=
-and-ship-generated-<wbr>files.patch<br>
+++ /dev/null<br>
@@ -1,339 +0,0 @@<br>
-From 5993a7710cc8fd9a392d5015be5109<wbr>987a42b498 Mon Sep 17 00:00:00 200=
1<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
-Date: Thu, 23 Feb 2017 16:10:09 +0200<br>
-Subject: [PATCH] wayland: Don&#39;t commit and ship generated files<br>
-<br>
-I believe shipping wayland-drm-client-protocol.h is wrong: The header<br>
-should always be generated by the wayland-scanner that matches the<br>
-runtime wayland version. Currently when someone clones the repo and<br>
-builds, the shipped version is used.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/01org/libva/pull=
/33" rel=3D"noreferrer" target=3D"_blank">https://github.com/01org/<wbr>lib=
va/pull/33</a>]<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
----<br>
- va/wayland/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
- va/wayland/wayland-drm-client-<wbr>protocol.h | 290 ---------------------=
---------<wbr>-<br>
- 2 files changed, 4 insertions(+), 291 deletions(-)<br>
- delete mode 100644 va/wayland/wayland-drm-client-<wbr>protocol.h<br>
-<br>
-diff --git a/va/wayland/Makefile.am b/va/wayland/Makefile.am<br>
-index 4f8262c..4ab8d07 100644<br>
---- a/va/wayland/Makefile.am<br>
-+++ b/va/wayland/Makefile.am<br>
-@@ -53,7 +53,7 @@ protocol_source_h =3D \<br>
- noinst_LTLIBRARIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D <a href=
=3D"http://libva_wayland.la" rel=3D"noreferrer" target=3D"_blank">libva_way=
land.la</a><br>
- libva_waylandincludedir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D ${includedir}/va<br>
- libva_waylandinclude_HEADERS=C2=A0 =3D $(source_h)<br>
--libva_wayland_la_SOURCES=C2=A0 =C2=A0 =C2=A0 =3D $(source_c) $(protocol_s=
ource_h)<br>
-+libva_wayland_la_SOURCES=C2=A0 =C2=A0 =C2=A0 =3D $(source_c)<br>
- noinst_HEADERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D $(source_h_priv)<br>
-<br>
- # Wayland protocol<br>
-@@ -65,5 +65,8 @@ EXTRA_DIST =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wayland-drm.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
-<br>
-+BUILT_SOURCES =3D $(protocol_source_h)<br>
-+CLEANFILES =3D $(BUILT_SOURCES)<br>
-+<br>
- # Extra clean files so that maintainer-clean removes *everything*<br>
- MAINTAINERCLEANFILES =3D Makefile.in<br>
-diff --git a/va/wayland/wayland-drm-<wbr>client-protocol.h b/va/wayland/wa=
yland-drm-<wbr>client-protocol.h<br>
-deleted file mode 100644<br>
-index da267e8..0000000<br>
---- a/va/wayland/wayland-drm-<wbr>client-protocol.h<br>
-+++ /dev/null<br>
-@@ -1,290 +0,0 @@<br>
--/* Generated by wayland-scanner 1.11.90 */<br>
--<br>
--#ifndef DRM_CLIENT_PROTOCOL_H<br>
--#define DRM_CLIENT_PROTOCOL_H<br>
--<br>
--#include &lt;stdint.h&gt;<br>
--#include &lt;stddef.h&gt;<br>
--#include &quot;wayland-client.h&quot;<br>
--<br>
--#ifdef=C2=A0 __cplusplus<br>
--extern &quot;C&quot; {<br>
--#endif<br>
--<br>
--/**<br>
-- * @page page_drm The drm protocol<br>
-- * @section page_ifaces_drm Interfaces<br>
-- * - @subpage page_iface_wl_drm -<br>
-- * @section page_copyright_drm Copyright<br>
-- * &lt;pre&gt;<br>
-- *<br>
-- * Copyright =C2=A9 2008-2011 Kristian H=C3=B8gsberg<br>
-- * Copyright =C2=A9 2010-2011 Intel Corporation<br>
-- *<br>
-- * Permission to use, copy, modify, distribute, and sell this<br>
-- * software and its documentation for any purpose is hereby granted<br>
-- * without fee, provided that\n the above copyright notice appear in<br>
-- * all copies and that both that copyright notice and this permission<br>
-- * notice appear in supporting documentation, and that the name of<br>
-- * the copyright holders not be used in advertising or publicity<br>
-- * pertaining to distribution of the software without specific,<br>
-- * written prior permission.=C2=A0 The copyright holders make no<br>
-- * representations about the suitability of this software for any<br>
-- * purpose.=C2=A0 It is provided &quot;as is&quot; without express or imp=
lied<br>
-- * warranty.<br>
-- *<br>
-- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS<br>
-- * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND<br>
-- * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY<br>
-- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES<br>
-- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN<br>
-- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,<br>
-- * ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF<br>
-- * THIS SOFTWARE.<br>
-- * &lt;/pre&gt;<br>
-- */<br>
--struct wl_buffer;<br>
--struct wl_drm;<br>
--<br>
--/**<br>
-- * @page page_iface_wl_drm wl_drm<br>
-- * @section page_iface_wl_drm_api API<br>
-- * See @ref iface_wl_drm.<br>
-- */<br>
--/**<br>
-- * @defgroup iface_wl_drm The wl_drm interface<br>
-- */<br>
--extern const struct wl_interface wl_drm_interface;<br>
--<br>
--#ifndef WL_DRM_ERROR_ENUM<br>
--#define WL_DRM_ERROR_ENUM<br>
--enum wl_drm_error {<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_ERROR_AUTHENTICATE_FAIL =3D 0,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_ERROR_INVALID_FORMAT =3D 1,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_ERROR_INVALID_NAME =3D 2,<br>
--};<br>
--#endif /* WL_DRM_ERROR_ENUM */<br>
--<br>
--#ifndef WL_DRM_FORMAT_ENUM<br>
--#define WL_DRM_FORMAT_ENUM<br>
--enum wl_drm_format {<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_C8 =3D 0x20203843,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGB332 =3D 0x38424752,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGR233 =3D 0x38524742,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XRGB4444 =3D 0x32315258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XBGR4444 =3D 0x32314258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBX4444 =3D 0x32315852,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRX4444 =3D 0x32315842,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ARGB4444 =3D 0x32315241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ABGR4444 =3D 0x32314241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBA4444 =3D 0x32314152,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRA4444 =3D 0x32314142,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XRGB1555 =3D 0x35315258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XBGR1555 =3D 0x35314258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBX5551 =3D 0x35315852,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRX5551 =3D 0x35315842,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ARGB1555 =3D 0x35315241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ABGR1555 =3D 0x35314241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBA5551 =3D 0x35314152,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRA5551 =3D 0x35314142,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGB565 =3D 0x36314752,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGR565 =3D 0x36314742,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGB888 =3D 0x34324752,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGR888 =3D 0x34324742,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XRGB8888 =3D 0x34325258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XBGR8888 =3D 0x34324258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBX8888 =3D 0x34325852,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRX8888 =3D 0x34325842,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ARGB8888 =3D 0x34325241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ABGR8888 =3D 0x34324241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBA8888 =3D 0x34324152,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRA8888 =3D 0x34324142,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XRGB2101010 =3D 0x30335258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_XBGR2101010 =3D 0x30334258,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBX1010102 =3D 0x30335852,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRX1010102 =3D 0x30335842,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ARGB2101010 =3D 0x30335241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_ABGR2101010 =3D 0x30334241,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_RGBA1010102 =3D 0x30334152,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_BGRA1010102 =3D 0x30334142,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YUYV =3D 0x56595559,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YVYU =3D 0x55595659,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_UYVY =3D 0x59565955,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_VYUY =3D 0x59555956,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_AYUV =3D 0x56555941,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_NV12 =3D 0x3231564e,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_NV21 =3D 0x3132564e,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_NV16 =3D 0x3631564e,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_NV61 =3D 0x3136564e,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YUV410 =3D 0x39565559,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YVU410 =3D 0x39555659,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YUV411 =3D 0x31315559,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YVU411 =3D 0x31315659,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YUV420 =3D 0x32315559,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YVU420 =3D 0x32315659,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YUV422 =3D 0x36315559,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YVU422 =3D 0x36315659,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YUV444 =3D 0x34325559,<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_FORMAT_YVU444 =3D 0x34325659,<br>
--};<br>
--#endif /* WL_DRM_FORMAT_ENUM */<br>
--<br>
--#ifndef WL_DRM_CAPABILITY_ENUM<br>
--#define WL_DRM_CAPABILITY_ENUM<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- * wl_drm capability bitmask<br>
-- *<br>
-- * Bitmask of capabilities.<br>
-- */<br>
--enum wl_drm_capability {<br>
--=C2=A0 =C2=A0 =C2=A0 /**<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0* wl_drm prime available<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 WL_DRM_CAPABILITY_PRIME =3D 1,<br>
--};<br>
--#endif /* WL_DRM_CAPABILITY_ENUM */<br>
--<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- * @struct wl_drm_listener<br>
-- */<br>
--struct wl_drm_listener {<br>
--=C2=A0 =C2=A0 =C2=A0 /**<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 void (*device)(void *data,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct wl_drm *wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const char *name);<br>
--=C2=A0 =C2=A0 =C2=A0 /**<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 void (*format)(void *data,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct wl_drm *wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uint32_t format);<br>
--=C2=A0 =C2=A0 =C2=A0 /**<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 void (*authenticated)(void *data,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct wl_drm *wl_drm);<br>
--=C2=A0 =C2=A0 =C2=A0 /**<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 void (*capabilities)(void *data,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct wl_drm *wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t value);<br>
--};<br>
--<br>
--/**<br>
-- * @ingroup wl_drm_iface<br>
-- */<br>
--static inline int<br>
--wl_drm_add_listener(struct wl_drm *wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const stru=
ct wl_drm_listener *listener, void *data)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 return wl_proxy_add_listener((struct wl_proxy *) wl_=
drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void (**)(void)) liste=
ner, data);<br>
--}<br>
--<br>
--#define WL_DRM_AUTHENTICATE 0<br>
--#define WL_DRM_CREATE_BUFFER 1<br>
--#define WL_DRM_CREATE_PLANAR_BUFFER 2<br>
--#define WL_DRM_CREATE_PRIME_BUFFER 3<br>
--<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--#define WL_DRM_AUTHENTICATE_SINCE_<wbr>VERSION 1<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--#define WL_DRM_CREATE_BUFFER_SINCE_<wbr>VERSION 1<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--#define WL_DRM_CREATE_PLANAR_BUFFER_<wbr>SINCE_VERSION 1<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--#define WL_DRM_CREATE_PRIME_BUFFER_<wbr>SINCE_VERSION 2<br>
--<br>
--/** @ingroup iface_wl_drm */<br>
--static inline void<br>
--wl_drm_set_user_data(struct wl_drm *wl_drm, void *user_data)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 wl_proxy_set_user_data((struct wl_proxy *) wl_drm, u=
ser_data);<br>
--}<br>
--<br>
--/** @ingroup iface_wl_drm */<br>
--static inline void *<br>
--wl_drm_get_user_data(struct wl_drm *wl_drm)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 return wl_proxy_get_user_data((struct wl_proxy *) wl=
_drm);<br>
--}<br>
--<br>
--static inline uint32_t<br>
--wl_drm_get_version(struct wl_drm *wl_drm)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 return wl_proxy_get_version((struct wl_proxy *) wl_d=
rm);<br>
--}<br>
--<br>
--/** @ingroup iface_wl_drm */<br>
--static inline void<br>
--wl_drm_destroy(struct wl_drm *wl_drm)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 wl_proxy_destroy((struct wl_proxy *) wl_drm);<br>
--}<br>
--<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--static inline void<br>
--wl_drm_authenticate(struct wl_drm *wl_drm, uint32_t id)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 wl_proxy_marshal((struct wl_proxy *) wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WL_DRM_AUTHENTICATE, id);<br>
--}<br>
--<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--static inline struct wl_buffer *<br>
--wl_drm_create_buffer(struct wl_drm *wl_drm, uint32_t name, int32_t width,=
 int32_t height, uint32_t stride, uint32_t format)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 struct wl_proxy *id;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 id =3D wl_proxy_marshal_constructor((<wbr>struct wl_=
proxy *) wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WL_DRM_CREATE_BUFFER, &amp;wl_buffer_interface, NULL, name, width=
, height, stride, format);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 return (struct wl_buffer *) id;<br>
--}<br>
--<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--static inline struct wl_buffer *<br>
--wl_drm_create_planar_buffer(<wbr>struct wl_drm *wl_drm, uint32_t name, in=
t32_t width, int32_t height, uint32_t format, int32_t offset0, int32_t stri=
de0, int32_t offset1, int32_t stride1, int32_t offset2, int32_t stride2)<br=
>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 struct wl_proxy *id;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 id =3D wl_proxy_marshal_constructor((<wbr>struct wl_=
proxy *) wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WL_DRM_CREATE_PLANAR_BUFFER, &amp;wl_buffer_interface, NULL, name=
, width, height, format, offset0, stride0, offset1, stride1, offset2, strid=
e2);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 return (struct wl_buffer *) id;<br>
--}<br>
--<br>
--/**<br>
-- * @ingroup iface_wl_drm<br>
-- */<br>
--static inline struct wl_buffer *<br>
--wl_drm_create_prime_buffer(<wbr>struct wl_drm *wl_drm, int32_t name, int3=
2_t width, int32_t height, uint32_t format, int32_t offset0, int32_t stride=
0, int32_t offset1, int32_t stride1, int32_t offset2, int32_t stride2)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 struct wl_proxy *id;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 id =3D wl_proxy_marshal_constructor((<wbr>struct wl_=
proxy *) wl_drm,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WL_DRM_CREATE_PRIME_BUFFER, &amp;wl_buffer_interface, NULL, name,=
 width, height, format, offset0, stride0, offset1, stride1, offset2, stride=
2);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 return (struct wl_buffer *) id;<br>
--}<br>
--<br>
--#ifdef=C2=A0 __cplusplus<br>
--}<br>
--#endif<br>
--<br>
--#endif<br>
---<br>
-2.1.4<br>
-<br>
diff --git a/meta/recipes-graphics/libva/<a href=3D"http://libva_1.7.3.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>libva_1.7.3.bb</a> b/meta/recipes=
-graphics/libva/<a href=3D"http://libva_1.8.3.bb" rel=3D"noreferrer" target=
=3D"_blank"><wbr>libva_1.8.3.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-graphics/libva/<a href=3D"http://libva_1.7.3.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>bva_1.7.3.bb</a><br>
rename to meta/recipes-graphics/libva/<a href=3D"http://libva_1.8.3.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>bva_1.8.3.bb</a><br>
index 6c0b90f..bb5f829 100644<br>
--- a/meta/recipes-graphics/libva/<a href=3D"http://libva_1.7.3.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>libva_1.7.3.bb</a><br>
+++ b/meta/recipes-graphics/libva/<a href=3D"http://libva_1.8.3.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>libva_1.8.3.bb</a><br>
@@ -17,10 +17,8 @@ SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>2e48940f94acb0af=
582e5ef0353780<wbr>0f&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/01org/libva.git;proto=
col=3Dhttp;branch=3Dv1.7-branch" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/01org/libva.<wbr>git;protocol=3Dhttp;branch=3Dv1.7-<wbr>branch</a> \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Use-<wbr=
>wayland-scanner-in-PATH.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-wayland-Don-t-<wbr>co=
mmit-and-ship-generated-<wbr>files.patch&quot;<br>
-SRCREV =3D &quot;<wbr>dbf9f7e33349c3cee8d131e93a6a4f<wbr>91255635cb&quot;<=
br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/01org/libva.git;proto=
col=3Dhttp;branch=3Dv1.8-branch" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/01org/libva.<wbr>git;protocol=3Dhttp;branch=3Dv1.8-<wbr>branch</a> &q=
uot;<br>
+SRCREV =3D &quot;<wbr>457470987cc9df5976ce8c72ffd4bf<wbr>bd9baaf0f9&quot;<=
br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;libva-(?P&lt;pver&gt;(\d+(\.\d+)=
+))<wbr>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -31,7 +29,7 @@ inherit autotools pkgconfig distro_features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
-EXTRA_OECONF =3D &quot;--disable-dummy-driver&quot;<br>
+EXTRA_OECONF =3D &quot;ac_cv_prog_WAYLAND_SCANNER=3D<wbr>wayland-scanner&q=
uot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURE=
S&#39;, &#39;wayland x11&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-x11,--disable-x11,<wbr>virtual/=
libx11 libxext libxfixes&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c05ac1a28571d05537ea6c3--
