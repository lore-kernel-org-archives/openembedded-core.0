Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A7B2177C39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:34:00 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c198so391485pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=WyyocE47lu5Zw/xvv3ea3tLsMIbGFOIeMIXTFRy8Ihk=;
	b=Qh+ntq/bVeupc8mD5ctHx6uFhS+vmPZobA0w7IqVQMsuR3H6dAfykOLyvLLhADED6h
	Vcpq1o9okJeP/zHW6rJ8FSg/4tC4R9sZYs5wnljWvpBTl9efpcMDzOovxQJ/NSDcvItU
	+CNRuAIgqFLKIHVlql1nMFBQZeRPI/U/KuEC2QykUzyktGL1yWEEwl7hbaP89yMHIXPj
	0AfJWN43mTxhfGqCYMa4hCwDC+NZ/+38UTyrk86hlhV7noyoNe/V4qkfxs52hjoskyYX
	Y620LFFjTxOONxNVAans7PeuyvF69oAlTUZgdb6AqV6aE3+GyvzlhfD9Jd7VXAQm/VVS
	4sTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WyyocE47lu5Zw/xvv3ea3tLsMIbGFOIeMIXTFRy8Ihk=;
	b=T4Y7Tlr/sSjGTnihuaDKhdUG0KvfEG2gi+q38xto3k2oX1f0DjUli1LSgd0o8SjHSS
	B8VLXVb7gIukE9G8b5hbmJrukHmAJ/aPt8YkX+7WXH+mot6Ga9z2Fpyri9tZ2boXj++D
	ItL4z8seBcx09GXJRnZTrBwi+nYHHkkJmVtdX8ilGG/HOyWhfqWu0WhWfU39mZ/4O0aW
	Z5243h14j1hFDOc2EUHsOExhvC0SgOkBYKax6yeTeX73m+XKK+421VzIbshPzd65W/Mk
	gSxRAXh0/MttxDVDcdsCTtZ578VxmflysM6z+r6Yw7bbL1Xfax1ObY1y2yZBTg8witku
	hzgA==
X-Gm-Message-State: AN3rC/7jmK4v4t5WzQGHcfK+feb6xcgkZX1yWyrLCugvVhukaVtb7wepz6Fk8hNF6crMfw==
X-Received: by 10.98.217.80 with SMTP id s77mr13511198pfg.26.1491928441793;
	Tue, 11 Apr 2017 09:34:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	y184sm31596978pgd.41.2017.04.11.09.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 09:34:01 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1491508529-2862-1-git-send-email-martin@xevo.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <becb96f0-bc8a-3a91-0649-cab9be51d6dd@gmail.com>
Date: Tue, 11 Apr 2017 09:34:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491508529-2862-1-git-send-email-martin@xevo.com>
Cc: Martin Kelly <martin@xevo.com>
Subject: Re: [PATCH] libsdl: enable X11 for nativesdk
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
X-List-Received-Date: Tue, 11 Apr 2017 16:34:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/06/2017 12:55 PM, Martin Kelly wrote:
> From: Martin Kelly <mkelly@xevo.com>
>
> Currently, the following situation fails:
>
> - Build an SDK and image. Make the image support graphics but not X11.
> - Extract SDK and copy image somewhere outside of the Yocto workspace. Do
>    runqemu on the image.
>
> This results in the error:
> "Could not initialize SDL(No available video device) - exiting"
This seems to have fixed an issue I was seeing on FedoraCore 25 with 
Morty with the same error.  Did I miss comments regarding these changes?

- armin
>
> This error occurs because libSDL attempts to load libX11 for video devices. When
> it fails, qemu also fails.
>
> Note that the same runqemu command will work fine from within the Yocto
> workspace environment because it will use the native libSDL -- which supports
> X11 -- rather than the nativesdk libSDL. In addition, the command will work fine
> as long as DISTRO_FEATURES includes x11, because then the nativesdk libSDL will
> be compiled with X11 support.
>
> Although the example above may seem a bit silly, this is actually a pretty bad
> error because it breaks the ability to build an SDK and image on one machine and
> run it on a different machine.
>
> Fix the issue by building nativesdk-libsdl with X11 support -- even when
> DISTRO_FEATURES does not include X11 -- as we already do for libsdl-native.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      | 3 ++-
>   meta/recipes-graphics/xorg-lib/libxcb_1.12.bb      | 1 +
>   meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 1 +
>   3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index c802a6f..89d84ab 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -43,8 +43,9 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
>   
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
> +# Without X11 support, qemu will fail because SDL cannot find video devices.
>   PACKAGECONFIG_class-native = "x11"
> -PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG_class-nativesdk = "x11"
>   
>   PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
>   PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
> diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
> index a38bdea..6d7e675 100644
> --- a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
> @@ -31,6 +31,7 @@ inherit autotools pkgconfig distro_features_check
>   # The libxau and others requires x11 in DISTRO_FEATURES
>   REQUIRED_DISTRO_FEATURES = "x11"
>   REQUIRED_DISTRO_FEATURES_class-native = ""
> +REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
>   
>   export PYTHON = "python3"
>   
> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> index 6f4e444..b397923 100644
> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> @@ -25,3 +25,4 @@ UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0ret
>   
>   REQUIRED_DISTRO_FEATURES ?= "x11"
>   REQUIRED_DISTRO_FEATURES_class-native = ""
> +REQUIRED_DISTRO_FEATURES_class-nativesdk = ""


