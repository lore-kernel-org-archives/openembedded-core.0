Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF89601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 20:20:17 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z8so20392247ige.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=p34O/UrsZp+CzrXqv2RNT6X1mDy7trRLWmA+BZxpG9g=;
	b=UOkbZpyuTuMB0w3dsSmOKGQgP0xs8iOm0xvWtg/bxRH0g6XlCQp5WUIKYntid6uxCA
	brtAoJg20uep7SCKkjtjv2m2vq9WfXRoG831SUP7UF9Hbn8Q3KJnyiDd892kA3IdSU0s
	2Sw9pKKpbkuqjxy4krqrgHkCgunZ7+Kn3BSJViPv77C7Kjn3F/rNw5SO1u2c5vghx3tt
	waynK/J+UCZ1PilGH/AR4O7s6nR07he9xrnA31rof1Aqo4F4Xyt4p99W38/WS7laVSkF
	1THBuusYDvYMHPjfkkjhO5WQjd4QC4FHv0m/ynKeEUB7eA2m0fRTQL/sclJk32cHSM5x
	NQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=p34O/UrsZp+CzrXqv2RNT6X1mDy7trRLWmA+BZxpG9g=;
	b=nNvyirZkkQxfUKz5cDsbffxAw3W/+mTlCoUrDAAO16r926bSBrDMpDu0pbOxfFZGpJ
	h8xXqIHyu/Ug8AmFjk7JtLuLAHun9VmCniORZWOhMFtewiEpsAlEKvQox7qnaKZ+33kw
	ssxLJjt7g06Xw0gUcbKC52T1/+ZLbxaL852tl5wCOrWwHgew6RYVEvRMAMcw3gE5nUra
	lUzPXHbEfLCGUxhxMT7PHNCFWxRtXkHmrf57Cbv9xr8hQWWNDAW7jrgIlLz16nBvowXv
	pd2I3snoa8MyNrjUwvROKVkyqu/woWYglP18ubcgy56ppRiDfPwWOlewJHMHPpSLEeY6
	Tn0A==
X-Gm-Message-State: AD7BkJJvroSsR9X6xFEYySRtmQdHM59ZnnI7zbx4Edikw8YITynC9yn5JL+SSQFh9ZTcJQ==
X-Received: by 10.50.70.9 with SMTP id i9mr5988736igu.6.1457727618125;
	Fri, 11 Mar 2016 12:20:18 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	ie9sm1412292igb.10.2016.03.11.12.20.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 12:20:17 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E32888.2000301@gmail.com>
Date: Fri, 11 Mar 2016 15:20:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456761746-419-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Fri, 11 Mar 2016 20:20:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This patch causes my jethro build to now fail with:

ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but 
virtual:nativesdk:/z/dragon410c-repo/dragon410c-tw-jethro/layers/openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb 
DEPENDS on or otherwise requires it). Close matches:
   virtual/nativesdk-libx11
   virtual/nativesdk-libc
   virtual/nativesdk-db



On 02/29/16 11:02, Ross Burton wrote:
> Use PACKAGECONFIG instead of using logic in DEPENDS and EXTRA_OECONF, adding new
> options for PulseAudio, tslib, DirectFB, OpenGL and X11.  Pass
> --disable-x11-shared so that it links to the X libraries instead of using
> dlopen().
>
> Disable tslib by default as the kernel event input subsystem is generally used.
>
> SDL's OpenGL support requires X11 so check for both x11 and opengl, and merge
> the dependencies.
>
> Finally enable native builds, with a minimal PACKAGECONFIG that will build from
> oe-core for native and nativesdk.
>
> (From OE-Core rev: 3d6c31c3a4ff34376e17005a981bb55fc6f7a38f)
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 35 ++++++++++++++-------------
>   1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index c0d5c6a..1cf3c39 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -12,13 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>   
>   PROVIDES = "virtual/libsdl"
>   
> -DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu', '', d)} \
> -           tslib"
> -DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
> -
>   PR = "r3"
>   
>   SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
> @@ -38,21 +31,29 @@ inherit autotools lib_package binconfig-disabled pkgconfig
>   
>   EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers \
>                   --enable-file --disable-oss --disable-esd --disable-arts \
> -                --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
> +                --disable-diskaudio --disable-nas \
>                   --disable-mintaudio --disable-nasm --disable-video-dga \
>                   --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
>                   --disable-xbios --disable-gem --disable-video-dummy \
> -                --enable-input-events --enable-input-tslib --enable-pthreads \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
> +                --enable-input-events --enable-pthreads \
>                   --disable-video-svga \
>                   --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
> -                --disable-rpath \
> -                --disable-pulseaudio"
> +                --disable-rpath"
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG_class-native = "x11"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>   
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> -PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
> +PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
> +PACKAGECONFIG[tslib] = "--enable-input-tslib, --disable-input-tslib, tslib"
> +PACKAGECONFIG[directfb] = "--enable-video-directfb, --disable-video-directfb, directfb"
> +PACKAGECONFIG[opengl] = "--enable-video-opengl, --disable-video-opengl, virtual/libgl libglu"
> +PACKAGECONFIG[x11] = "--enable-video-x11 --disable-x11-shared, --disable-video-x11, virtual/libx11 libxext libxrandr libxrender"
>   
>   EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
>   
> @@ -65,4 +66,4 @@ do_configure_prepend() {
>           export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>   }
>   
> -BBCLASSEXTEND = "nativesdk"
> +BBCLASSEXTEND = "native nativesdk"


