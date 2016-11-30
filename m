Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DC08471AB3;
	Wed, 30 Nov 2016 13:38:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so29587662wme.1;
	Wed, 30 Nov 2016 05:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=s3mkyejwf9DrqZbCrmOpYZCW356WkIZ8S3dcKKxeAt8=;
	b=ca+Zc7BxsQuVXn7mHG0+hc2mxIj75+uV1fyaNvCsKgle4KZnvuhRcL1YdkVD1Jvuhv
	GXBLBb7tgo/07V1vd85MOs6P2ZbKMlgSTgeh2XV+UmDv9OADqoZqPIsPiqeCxfDpxmkO
	BnvL4+BqoM57hN3JKT+ga5Ja4gPd9G49Cj/lzfl0pGqnswBn0XESL7sRnWWIZNCoRfVX
	1gWnNyAtgzqXWnWa6Gn+0Mj5TY6GGqympkdNsrRqf0JGNs818DctWQew3Od6lWH/Z43b
	cdGGFrokY1EMQJVMyEtszXZj+WfBco6arFDZiERuUkWGaIedRJ+4npQyA385JogC26KA
	7d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=s3mkyejwf9DrqZbCrmOpYZCW356WkIZ8S3dcKKxeAt8=;
	b=LE2/ACuOimzcL9g/CpkXQv/6jrEJ5akLgSmg5Ts8R2V0YrLdc2rVqRHTXM6W4D+xFh
	BalvnVQ43dRSjdHMhHktpITjBIxnyGSGroZOTk54uEaZ3jjwA/qY6KfFJh3aTnJsb2Zn
	8lmV/PppCEXqLtORso9FwcikyrvC3O/mJkijgopMX8CyMiHFC2S/aqv48oBErbeQSLgp
	9nX7E26gS8fsFYIwQnDkUl9YcVCoDsFue4+t5jB8q2Fz5UNk027DT3crWwDuf3FphTAP
	7LPContrWr3mFdgiRm7so8K2NlsZ7BtqiovlUq2dTivsl6k5nqME4Tsw0TgMQAnzFPit
	Tr6g==
X-Gm-Message-State: AKaTC03RYHEovyadR1X31qCC8TUC2oMSp0QnoJ+F7vwfkVl1lo+d3HMjei/yPHlUKHmDuw==
X-Received: by 10.28.23.16 with SMTP id 16mr30291848wmx.134.1480513133764;
	Wed, 30 Nov 2016 05:38:53 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id f3sm8083184wmf.10.2016.11.30.05.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Nov 2016 05:38:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Nov 2016 14:38:53 +0100
To: openembedded-core@lists.openembedded.org,
	Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20161130133853.GB3245@jama>
References: <20161031142354.32708.25736@opal.openembedded.org>
	<20161031142355.AA7B3501AD@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20161031142355.AA7B3501AD@opal.openembedded.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/22: libsdl2: update to 2.0.5
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
X-List-Received-Date: Wed, 30 Nov 2016 13:38:53 -0000
X-Groupsio-MsgNum: 90068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 02:23:55PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>=20
> commit 97fff54efe6b03798ad1c5e39155eaeab0a33300
> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> AuthorDate: Thu Oct 27 22:07:19 2016 +0200
>=20
>     libsdl2: update to 2.0.5
>    =20
>     * 0001-src-video-make-it-compatible-with-wayland-1.10.patch is remove=
d because
>       the problem has been resolved upstream
>     * Add 0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
>       so that WAYLAND_PROTOCOLS_SYSROOT_DIR is substituted in a way simil=
ar to gtk3
>    =20
>     Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...-sysroot-path-so-that-make-finds-our-wayl.patch | 32 ++++++++++++
>  ...ideo-make-it-compatible-with-wayland-1.10.patch | 57 ----------------=
------
>  .../libsdl2/{libsdl2_2.0.4.bb =3D> libsdl2_2.0.5.bb} | 14 +++---
>  3 files changed, 40 insertions(+), 63 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysro=
ot-path-so-that-make-finds-our-wayl.patch b/meta/recipes-graphics/libsdl2/l=
ibsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
> new file mode 100644
> index 0000000..d042430
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path=
-so-that-make-finds-our-wayl.patch
> @@ -0,0 +1,32 @@
> +From b44808e43130dcd13b43e5b978b9b24aeb4c134c Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Thu, 20 Oct 2016 14:57:51 +0200
> +Subject: [PATCH] prepend our sysroot path so that make finds our
> + wayland-protocol files
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + configure.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 726ded3..3376600 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], =
[QtWayland server support for
> +                 WAYLAND_LIBS=3D`$PKG_CONFIG --libs wayland-client wayla=
nd-egl wayland-cursor xkbcommon`
> +                 WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_sca=
nner wayland-scanner`
> +                 WAYLAND_CORE_PROTOCOL_DIR=3D`$PKG_CONFIG --variable=3Dp=
kgdatadir wayland-client`
> +-                WAYLAND_PROTOCOLS_DIR=3D`$PKG_CONFIG --variable=3Dpkgda=
tadir wayland-protocols`
> ++                WAYLAND_PROTOCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR=
}`$PKG_CONFIG --variable=3Dpkgdatadir wayland-protocols`
> +                 video_wayland=3Dyes
> +             fi
> +         fi
> +--=20
> +2.5.5
> +
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it=
-compatible-with-wayland-1.10.patch b/meta/recipes-graphics/libsdl2/libsdl2=
/0001-src-video-make-it-compatible-with-wayland-1.10.patch
> deleted file mode 100644
> index 44e6d4d..0000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compat=
ible-with-wayland-1.10.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From b1ed3533433501ec52c8289a5b3a294e57e7f798 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Thu, 26 May 2016 11:31:52 +0000
> -Subject: [PATCH] src/video: make it compatible with wayland 1.10
> -
> -| build/.libs/SDL_waylandevents.o: In function `wl_registry_bind':
> -| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl=
_proxy_marshal_constructor_versioned'
> -| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl=
_proxy_marshal_constructor_versioned'
> -| build/.libs/SDL_waylandkeyboard.o: In function `wl_registry_bind':
> -| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl=
_proxy_marshal_constructor_versioned'
> -| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl=
_proxy_marshal_constructor_versioned'
> -| build/.libs/SDL_waylandvideo.o: In function `wl_registry_bind':
> -| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl=
_proxy_marshal_constructor_versioned'
> -| collect2: error: ld returned 1 exit status
> -| make: *** [build/libSDL2.la] Error 1
> -| ERROR: oe_runmake failed
> -
> -Upstream-Status: Pending
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> ----
> - src/video/wayland/SDL_waylanddyn.h | 1 +
> - src/video/wayland/SDL_waylandsym.h | 4 ++++
> - src/video/webos/SDL_waylanddyn.h   | 1 +
> - src/video/webos/SDL_waylandsym.h   | 4 ++++
> - 4 files changed, 10 insertions(+)
> -
> -diff --git a/src/video/wayland/SDL_waylanddyn.h b/src/video/wayland/SDL_=
waylanddyn.h
> -index 8d9313a..c7b0157 100644
> ---- a/src/video/wayland/SDL_waylanddyn.h
> -+++ b/src/video/wayland/SDL_waylanddyn.h
> -@@ -79,6 +79,7 @@ void SDL_WAYLAND_UnloadSymbols(void);
> - #define wl_proxy_get_user_data (*WAYLAND_wl_proxy_get_user_data)
> - #define wl_proxy_add_listener (*WAYLAND_wl_proxy_add_listener)
> - #define wl_proxy_marshal_constructor (*WAYLAND_wl_proxy_marshal_constru=
ctor)
> -+#define wl_proxy_marshal_constructor_versioned (*WAYLAND_wl_proxy_marsh=
al_constructor_versioned)
> -=20
> - #define wl_seat_interface (*WAYLAND_wl_seat_interface)
> - #define wl_surface_interface (*WAYLAND_wl_surface_interface)
> -diff --git a/src/video/wayland/SDL_waylandsym.h b/src/video/wayland/SDL_=
waylandsym.h
> -index c3b4fa5..b9a0d97 100644
> ---- a/src/video/wayland/SDL_waylandsym.h
> -+++ b/src/video/wayland/SDL_waylandsym.h
> -@@ -55,6 +55,10 @@ SDL_WAYLAND_SYM(void, wl_list_insert_list, (struct wl=
_list *, struct wl_list *))
> - SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_4)
> - SDL_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor, (struc=
t wl_proxy *, uint32_t opcode, const struct wl_interface *interface, ...))
> -=20
> -+/* These functions are available in Wayland >=3D 1.10 */
> -+SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_10)
> -+SDL_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor_version=
ed, (struct wl_proxy *proxy, uint32_t opcode, const struct wl_interface *in=
terface, uint32_t version, ...))
> -+
> - SDL_WAYLAND_INTERFACE(wl_seat_interface)
> - SDL_WAYLAND_INTERFACE(wl_surface_interface)
> - SDL_WAYLAND_INTERFACE(wl_shm_pool_interface)
> ---=20
> -1.9.1
> -
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb b/meta/recipe=
s-graphics/libsdl2/libsdl2_2.0.5.bb
> similarity index 86%
> rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
> rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> index 844ff33..ac7312b 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> @@ -14,15 +14,16 @@ PROVIDES =3D "virtual/libsdl2"
> =20
>  DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x1=
1', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nati=
vesdk-libxext', '', d)}"
> =20
> -SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> -           file://linkage.patch \
> -           file://0001-src-video-make-it-compatible-with-wayland-1.10.pa=
tch \
> +SRC_URI =3D " \
> +    http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> +    file://linkage.patch \
> +    file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.pat=
ch \
>  "
> =20
>  S =3D "${WORKDIR}/SDL2-${PV}"
> =20
> -SRC_URI[md5sum] =3D "44fc4a023349933e7f5d7a582f7b886e"
> -SRC_URI[sha256sum] =3D "da55e540bf6331824153805d58b590a29c39d2d506c6d02f=
a409aedeab21174b"
> +SRC_URI[md5sum] =3D "d4055424d556b4a908aa76fad63abd3c"
> +SRC_URI[sha256sum] =3D "442038cf55965969f2ff06d976031813de643af9c9edc9e3=
31bd761c242e8785"
> =20
>  inherit autotools lib_package binconfig pkgconfig
> =20
> @@ -31,7 +32,8 @@ EXTRA_OECONF =3D "--disable-oss --disable-esd --disable=
-arts \
>                  --disable-video-dummy \
>                  --enable-pthreads \
>                  --enable-sdl-dlopen \
> -                --disable-rpath"
> +                --disable-rpath \
> +                WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${STAGING_DIR}/${MACHINE=
}"

This makes libsdl2 (and everything which depends on libsdl2) effectively
MACHINE_ARCH because of MACHINE variable dependency here :/

Causing following errors in sstate-diff-machines.sh:

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: libsdl2 different signature for task do_configure.sigdata between qe=
mux86copy and qemux86
basehash changed from ae22843ed7e59c7323c53451def0a83f to e223ad424c562edfe=
b8f41d378160fee
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: libsdl2-image different signature for task do_configure.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'gccgcc-cross_6.2.bb.do_populate_sysroot', 'gccgcc-runtime_6.2.bb.do_popu=
late_sysroot', 'glibcglibc_2.24.bb.do_populate_sysroot', 'gnu-configgnu-con=
fig_git.bb.do_populate_sysroot:virtual:native', 'jpeglibjpeg-turbo_1.5.1.bb=
=2Edo_populate_sysroot', 'libpnglibpng_1.6.26.bb.do_populate_sysroot', 'lib=
sdl-imagelibsdl2-image_2.0.1.bb.do_patch', 'libsdl2libsdl2_2.0.5.bb.do_popu=
late_sysroot', 'libtifftiff_4.0.6.bb.do_populate_sysroot', 'libtoollibtool-=
cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_pop=
ulate_sysroot', 'pkgconfigpkgconfig_git.bb.do_populate_sysroot:virtual:nati=
ve', 'webplibwebp_0.5.1.bb.do_populate_sysroot', 'zlibzlib_1.2.8.bb.do_popu=
late_sysroot'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:na=
tive', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'gccg=
cc-cross_6.2.bb.do_populate_sysroot', 'gccgcc-runtime_6.2.bb.do_populate_sy=
sroot', 'glibcglibc_2.24.bb.do_populate_sysroot', 'gnu-configgnu-config_git=
=2Ebb.do_populate_sysroot:virtual:native', 'jpeglibjpeg-turbo_1.5.1.bb.do_p=
opulate_sysroot', 'libpnglibpng_1.6.26.bb.do_populate_sysroot', 'libsdl-ima=
gelibsdl2-image_2.0.1.bb.do_patch', 'libsdl2libsdl2_2.0.5.bb.do_populate_sy=
sroot', 'libtifftiff_4.0.6.bb.do_populate_sysroot', 'libtoollibtool-cross_2=
=2E4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate=
_sysroot', 'pkgconfigpkgconfig_git.bb.do_populate_sysroot:virtual:native', =
'webplibwebp_0.5.1.bb.do_populate_sysroot', 'zlibzlib_1.2.8.bb.do_populate_=
sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_populate_sysroot with hash 1d06351fd7d8b49b409bd04=
d1da33a4e
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_populate_sysroot with hash 48c1a2c250f06b79314bb38=
ac797489d
Hash for dependent task libsdl2libsdl2_2.0.5.bb.do_populate_sysroot changed=
 from 1d06351fd7d8b49b409bd04d1da33a4e to 48c1a2c250f06b79314bb38ac797489d

ERROR: libsdl2-mixer different signature for task do_configure.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'flacflac_1.3.1.bb.do_populate_sysroot', 'gccgcc-cross_6.2.bb.do_populate=
_sysroot', 'gccgcc-runtime_6.2.bb.do_populate_sysroot', 'glibcglibc_2.24.bb=
=2Edo_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:v=
irtual:native', 'libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_patch', 'libsdl2libs=
dl2_2.0.5.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_popula=
te_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'libvorb=
islibvorbis_1.3.5.bb.do_populate_sysroot', 'mikmodlibmikmod_3.3.6.bb.do_pop=
ulate_sysroot'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:n=
ative', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'fla=
cflac_1.3.1.bb.do_populate_sysroot', 'gccgcc-cross_6.2.bb.do_populate_sysro=
ot', 'gccgcc-runtime_6.2.bb.do_populate_sysroot', 'glibcglibc_2.24.bb.do_po=
pulate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:n=
ative', 'libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_patch', 'libsdl2libsdl2_2.0.=
5.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysro=
ot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'libvorbislibvor=
bis_1.3.5.bb.do_populate_sysroot', 'mikmodlibmikmod_3.3.6.bb.do_populate_sy=
sroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_populate_sysroot with hash 1d06351fd7d8b49b409bd04=
d1da33a4e
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_populate_sysroot with hash 48c1a2c250f06b79314bb38=
ac797489d
Hash for dependent task libsdl2libsdl2_2.0.5.bb.do_populate_sysroot changed=
 from 1d06351fd7d8b49b409bd04d1da33a4e to 48c1a2c250f06b79314bb38ac797489d

ERROR: libsdl2-ttf different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'freetypefreetype_2.7.bb.do_populate_sysroot', 'gccgcc-cross_6.2.bb.do_po=
pulate_sysroot', 'gccgcc-runtime_6.2.bb.do_populate_sysroot', 'glibcglibc_2=
=2E24.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sys=
root:virtual:native', 'libsdl-ttflibsdl2-ttf_2.0.14.bb.do_patch', 'libsdl2l=
ibsdl2_2.0.5.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_pop=
ulate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot'] to ['=
autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeauto=
make_1.15.bb.do_populate_sysroot:virtual:native', 'freetypefreetype_2.7.bb.=
do_populate_sysroot', 'gccgcc-cross_6.2.bb.do_populate_sysroot', 'gccgcc-ru=
ntime_6.2.bb.do_populate_sysroot', 'glibcglibc_2.24.bb.do_populate_sysroot'=
, 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'libsdl=
-ttflibsdl2-ttf_2.0.14.bb.do_patch', 'libsdl2libsdl2_2.0.5.bb.do_populate_s=
ysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibto=
ol-native_2.4.6.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_populate_sysroot with hash 1d06351fd7d8b49b409bd04=
d1da33a4e
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_populate_sysroot with hash 48c1a2c250f06b79314bb38=
ac797489d
Hash for dependent task libsdl2libsdl2_2.0.5.bb.do_populate_sysroot changed=
 from 1d06351fd7d8b49b409bd04d1da33a4e to 48c1a2c250f06b79314bb38ac797489d

ERROR: 4 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1480468604/signatures.qemux86.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D
ERROR: libsdl2 different signature for task do_populate_sysroot.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['libsdl2libsdl2_2.0.5.bb.do_install'] to ['libsdl=
2libsdl2_2.0.5.bb.do_install']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_install with hash 90e8395dfac628621ea1f98df4bca17c
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_install with hash e081c57a1fd9f27e84386bbebbdd9e20
Hash for dependent task libsdl2libsdl2_2.0.5.bb.do_install changed from 90e=
8395dfac628621ea1f98df4bca17c to e081c57a1fd9f27e84386bbebbdd9e20

ERROR: libsdl2-image different signature for task do_populate_sysroot.sigda=
ta between qemux86copy and qemux86
runtaskdeps changed from ['libsdl-imagelibsdl2-image_2.0.1.bb.do_install'] =
to ['libsdl-imagelibsdl2-image_2.0.1.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-image/libsdl2-image_2.0.1.bb.do_install with hash 3f8719a5261e78e9=
ea7f9b4237db0584
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-image/libsdl2-image_2.0.1.bb.do_install with hash 191379773af72224=
225a3c7cc3a14ca9
Hash for dependent task libsdl-imagelibsdl2-image_2.0.1.bb.do_install chang=
ed from 3f8719a5261e78e9ea7f9b4237db0584 to 191379773af72224225a3c7cc3a14ca9

ERROR: libsdl2-mixer different signature for task do_populate_sysroot.sigda=
ta between qemux86copy and qemux86
runtaskdeps changed from ['libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_install'] =
to ['libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-mixer/libsdl2-mixer_2.0.1.bb.do_install with hash 16c251552600d8da=
e3b4f72abd5a53ff
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-mixer/libsdl2-mixer_2.0.1.bb.do_install with hash abcc9d98c9f2fc08=
43a7c042591552f6
Hash for dependent task libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_install chang=
ed from 16c251552600d8dae3b4f72abd5a53ff to abcc9d98c9f2fc0843a7c042591552f6

ERROR: libsdl2-ttf different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['libsdl-ttflibsdl2-ttf_2.0.14.bb.do_install'] to =
['libsdl-ttflibsdl2-ttf_2.0.14.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
ibsdl-ttf/libsdl2-ttf_2.0.14.bb.do_install with hash 456957de750f96360f66cd=
18cd9890d7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
ibsdl-ttf/libsdl2-ttf_2.0.14.bb.do_install with hash 05b5f818e53714e27c83c9=
04317fd652
Hash for dependent task libsdl-ttflibsdl2-ttf_2.0.14.bb.do_install changed =
=66rom 456957de750f96360f66cd18cd9890d7 to 05b5f818e53714e27c83c904317fd652

ERROR: 4 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1480468604/signatures.qemux86.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: libsdl2 different signature for task do_package_write_ipk.sigdata be=
tween qemux86copy and qemux86
runtaskdeps changed from ['libsdl2libsdl2_2.0.5.bb.do_package', 'libsdl2lib=
sdl2_2.0.5.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sys=
root:virtual:native', 'pseudopseudo_1.8.1.bb.do_populate_sysroot:virtual:na=
tive'] to ['libsdl2libsdl2_2.0.5.bb.do_package', 'libsdl2libsdl2_2.0.5.bb.d=
o_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:na=
tive', 'pseudopseudo_1.8.1.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_package with hash eb6ccb082bc5413d85bdbf14fe88858c
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_package with hash 0c2b956baa0042b411ad34b470a28032
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_packagedata with hash 2943b532f9b6eff573f2f6c8612a=
8718
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/lib=
sdl2/libsdl2_2.0.5.bb.do_packagedata with hash ec4269cc0c02d7a589aff791522f=
7803
Hash for dependent task libsdl2libsdl2_2.0.5.bb.do_packagedata changed from=
 2943b532f9b6eff573f2f6c8612a8718 to ec4269cc0c02d7a589aff791522f7803
Hash for dependent task libsdl2libsdl2_2.0.5.bb.do_package changed from eb6=
ccb082bc5413d85bdbf14fe88858c to 0c2b956baa0042b411ad34b470a28032

ERROR: libsdl2-image different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
runtaskdeps changed from ['libsdl-imagelibsdl2-image_2.0.1.bb.do_package', =
'libsdl-imagelibsdl2-image_2.0.1.bb.do_packagedata', 'opkg-utilsopkg-utils_=
git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.8.1.bb.do_popul=
ate_sysroot:virtual:native'] to ['libsdl-imagelibsdl2-image_2.0.1.bb.do_pac=
kage', 'libsdl-imagelibsdl2-image_2.0.1.bb.do_packagedata', 'opkg-utilsopkg=
-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.8.1.bb.d=
o_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-image/libsdl2-image_2.0.1.bb.do_package with hash 55a54e811424e9b3=
8ca6e29a2e549c13
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-image/libsdl2-image_2.0.1.bb.do_package with hash f2b732ca24f53434=
db6204272ce0247d
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-image/libsdl2-image_2.0.1.bb.do_packagedata with hash 58fb2e9fcdd4=
82303dade154e2d35246
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-image/libsdl2-image_2.0.1.bb.do_packagedata with hash 08f393d5d367=
1bbb9fb843e6cfed1c8a
Hash for dependent task libsdl-imagelibsdl2-image_2.0.1.bb.do_packagedata c=
hanged from 58fb2e9fcdd482303dade154e2d35246 to 08f393d5d3671bbb9fb843e6cfe=
d1c8a
Hash for dependent task libsdl-imagelibsdl2-image_2.0.1.bb.do_package chang=
ed from 55a54e811424e9b38ca6e29a2e549c13 to f2b732ca24f53434db6204272ce0247d

ERROR: libsdl2-mixer different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
runtaskdeps changed from ['libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_package', =
'libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_packagedata', 'opkg-utilsopkg-utils_=
git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.8.1.bb.do_popul=
ate_sysroot:virtual:native'] to ['libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_pac=
kage', 'libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_packagedata', 'opkg-utilsopkg=
-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.8.1.bb.d=
o_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-mixer/libsdl2-mixer_2.0.1.bb.do_package with hash def8b4574c0f2cf9=
f3b36b1236de17c2
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-mixer/libsdl2-mixer_2.0.1.bb.do_package with hash de207cd8f60bf671=
8fb2b62281cac734
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-mixer/libsdl2-mixer_2.0.1.bb.do_packagedata with hash 10f1a98e9e08=
0e50750dec9ad48e8102
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedi=
a/libsdl-mixer/libsdl2-mixer_2.0.1.bb.do_packagedata with hash fd269e63c155=
a2f10a09374b9e598f0e
Hash for dependent task libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_packagedata c=
hanged from 10f1a98e9e080e50750dec9ad48e8102 to fd269e63c155a2f10a09374b9e5=
98f0e
Hash for dependent task libsdl-mixerlibsdl2-mixer_2.0.1.bb.do_package chang=
ed from def8b4574c0f2cf9f3b36b1236de17c2 to de207cd8f60bf6718fb2b62281cac734

ERROR: libsdl2-ttf different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
runtaskdeps changed from ['libsdl-ttflibsdl2-ttf_2.0.14.bb.do_package', 'li=
bsdl-ttflibsdl2-ttf_2.0.14.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb=
=2Edo_populate_sysroot:virtual:native', 'pseudopseudo_1.8.1.bb.do_populate_=
sysroot:virtual:native'] to ['libsdl-ttflibsdl2-ttf_2.0.14.bb.do_package', =
'libsdl-ttflibsdl2-ttf_2.0.14.bb.do_packagedata', 'opkg-utilsopkg-utils_git=
=2Ebb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.8.1.bb.do_popula=
te_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
ibsdl-ttf/libsdl2-ttf_2.0.14.bb.do_package with hash 46bba6e61e7df0c5b37f76=
a315116a7b
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
ibsdl-ttf/libsdl2-ttf_2.0.14.bb.do_package with hash e011c608a72fa9f5abe52a=
e9fec79ed4
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
ibsdl-ttf/libsdl2-ttf_2.0.14.bb.do_packagedata with hash 693d461c00a8244716=
97be5b12f9aa90
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
ibsdl-ttf/libsdl2-ttf_2.0.14.bb.do_packagedata with hash e3c76bfb20e841d73b=
e46a02220b971f
Hash for dependent task libsdl-ttflibsdl2-ttf_2.0.14.bb.do_packagedata chan=
ged from 693d461c00a824471697be5b12f9aa90 to e3c76bfb20e841d73be46a02220b97=
1f
Hash for dependent task libsdl-ttflibsdl2-ttf_2.0.14.bb.do_package changed =
=66rom 46bba6e61e7df0c5b37f76a315116a7b to e011c608a72fa9f5abe52ae9fec79ed4

ERROR: 4 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1480468604/signatures.qemux86.do_package_write_ipk.sigdata.log


> =20
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWD7WbAAKCRA3VSO3ZXaA
HBAaAJ4hOZ0PW2qeh3GhDZ83h7PNZ8nxDwCgosaXxQV1LeVRemqXq2pesjXZb00=
=uf9b
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
