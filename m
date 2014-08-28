Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3854765E94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7S7LKDp005204; Thu, 28 Aug 2014 08:21:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mMZkhcrdX4ic; Thu, 28 Aug 2014 08:21:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7S7LEt0005201
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 28 Aug 2014 08:21:15 +0100
Message-ID: <1409210476.29296.132.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Thu, 28 Aug 2014 08:21:16 +0100
In-Reply-To: <1409170493-18242-1-git-send-email-dv@pseudoterminal.org>
References: <1409170493-18242-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: add packageconfigs for x11, directfb, opengl
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
X-List-Received-Date: Thu, 28 Aug 2014 07:21:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-08-27 at 22:14 +0200, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index e544b60..b0ae299 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -12,10 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>  
>  PROVIDES = "virtual/libsdl"
>  
> -DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
> -           tslib"
> +DEPENDS = "tslib"
>  DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
>  
>  PR = "r3"
> @@ -42,16 +39,19 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
>                  --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
>                  --disable-xbios --disable-gem --disable-video-dummy \
>                  --enable-input-events --enable-input-tslib --enable-pthreads \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
>                  --disable-video-svga \
>                  --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
>                  --disable-rpath \
>                  --disable-pulseaudio"
>  
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> -PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[directfb] = "--enable-video-directfb,--disable-video-directfb,directfb"
> +PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl libglu"
> +PACKAGECONFIG[x11] = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"


Unfortunately his blew up on the autobuilder:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/12/steps/BuildImages/logs/stdio


ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libgl' (but
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/nativesdk-libsdl
  virtual/nativesdk-libc
  virtual/nativesdk-libintl
ERROR: Nothing PROVIDES 'nativesdk-libglu' (but
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb DEPENDS on or otherwise requires it). Close matches:
  nativesdk-libxau
  nativesdk-libusb
  nativesdk-libsdl
ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/nativesdk-libx11
  virtual/nativesdk-libc
  virtual/nativesdk-db

Cheers,

Richard


