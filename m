Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 389426C102
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:13:37 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id g17so14008287ita.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jds4vQ65FQH/z3I2fM1p+PERNRtiYsPTJu3BVCeaAs8=;
	b=H+iubUNut1lSPFBT9Fiw12Q6Ey3S7cGJHAllpe6UBu1XY2m0pS5uWAq9Mw4rFC/exF
	ffOBX3D+XDzWbIG8FeCSFC7wbSNMiK+E7faVpEccV/4/8wt4cdYeXBrGYS6Z49NkOVYZ
	teTfcI6EYYTVoMQNmnuyawHPKIdTJmc6E35+nZJUYflNLolEgrXYQon9Nryf4ohU/iWp
	qm03rw8DP5lYYU0kW/t6VkAzMLZLWIKU4JF+6e9AdEq1DNB+zlewL3ldETSCJTHdnFWA
	AVLUx8j1R21SZW3gZVQCPRqukdOjzJ198ylwgLCVzE0V6emaKW6f6UAlRDs6vE80wpgw
	6Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jds4vQ65FQH/z3I2fM1p+PERNRtiYsPTJu3BVCeaAs8=;
	b=UwtMwnhx915HZjv38f3h6PrQP7t8DOfKoTi2S4kFp5LdyN0cvTCWy4BiSYo1wzbod4
	SW88wenUbYopiCvto+GUQ/PafC6e2/A8r4d+nOFDL102pq/95XtXqeGo1SzNE6ox99bz
	uyprYAXuVrlw2OytYAMnlgU6q7WmVvoDlIWk5UcPxIZvil2fbkrojzmQaLgOrGaedQ+Y
	+iRSCtvyEqod/d//c7l2kFugAAQJyZvcqNsYPBqQ9Qq3txUzDNMLAjmcl6JwVgXl7QIo
	lDymoUlcvXOR8HodpNYMzS30UKUfBF3ICKap5Y3TEndpUa2jSz80jA8YNHujkXv5/wVA
	amYg==
X-Gm-Message-State: APjAAAUiaLlIa0pOl36dt+3bXH1p79PhH9dvGkdoEy3RIy2kKntmLBMf
	4RMWWFKcqHYLZmj2z8Hzc6xFir9eJNJBqfmjCZzIPQ==
X-Google-Smtp-Source: APXvYqyh0c9FlUvTahU+WPi9YvnCoKfq1GxNAMRew5F8lNFIv4HRtp6URI5+1i6nAtUphizmRls7+grGCqTJJZZX6YM=
X-Received: by 2002:a02:5bc2:: with SMTP id g185mr17704397jab.31.1554117218185;
	Mon, 01 Apr 2019 04:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <1553904350-30074-1-git-send-email-denis@denix.org>
In-Reply-To: <1553904350-30074-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 11:13:27 +0000
Message-ID: <CAJTo0LZZ0S0JoTTMFHQeT3CPK26_NY_JLDaHZQ_DJFpiTAF74w@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: upgrade 5.0.0 -> 6.0.0
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
X-List-Received-Date: Mon, 01 Apr 2019 11:13:37 -0000
Content-Type: text/plain; charset="UTF-8"

WARNING: weston-6.0.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-make-error-portable.patch
patching file configure.ac
Hunk #1 succeeded at 126 with fuzz 2 (offset 17 lines).
patching file libweston/weston-error.h
patching file libweston/weston-launch.c

Now at patch 0001-make-error-portable.patch

Ross

On Sat, 30 Mar 2019 at 00:06, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Note:
> 6.0.0 is the last one to support autotools (needs explicit configure option),
> newer versions will only support meson.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-graphics/wayland/{weston_5.0.0.bb => weston_6.0.0.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/wayland/{weston_5.0.0.bb => weston_6.0.0.bb} (96%)
>
> diff --git a/meta/recipes-graphics/wayland/weston_5.0.0.bb b/meta/recipes-graphics/wayland/weston_6.0.0.bb
> similarity index 96%
> rename from meta/recipes-graphics/wayland/weston_5.0.0.bb
> rename to meta/recipes-graphics/wayland/weston_6.0.0.bb
> index e517109..fa08dac 100644
> --- a/meta/recipes-graphics/wayland/weston_5.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_6.0.0.bb
> @@ -12,8 +12,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://xwayland.weston-start \
>             file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
>  "
> -SRC_URI[md5sum] = "752a04ce3c65af4884cfac4e57231bdb"
> -SRC_URI[sha256sum] = "15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf"
> +SRC_URI[md5sum] = "7c634e262f8a464a076c97fd50ad36b3"
> +SRC_URI[sha256sum] = "546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612"
>
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>
> @@ -28,6 +28,7 @@ WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
>
>  EXTRA_OECONF = "--enable-setuid-install \
>                  --disable-rdp-compositor \
> +                --enable-autotools \
>                  "
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

