Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC3687F284
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 14:20:48 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j5so116222265ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z8XYvyhoYOOREaCSuiF8fbFlUMlrnN4AhvRxnAKYzOU=;
	b=S1AyzhXwgdXC6w1ESnYaIsLJ34CYYL7+Okni1tgbB8CeiKwV7i1gQVAXlLTC+NHILj
	YS/xiz5E7qeDFU0N1tedNuZxSl/nseQRZC5yd1IiF9eN+IZcZ1knO8NhQDdLI5Q3uYrn
	MlTINO3ZGg2rPs/bdUf57dXOfRYQ0ffr6mpDEh1rV0PmbPy4CWXsKDuIrOe3yws+PkjU
	AmCssVJtR6ysKuX95I0j7kNEt7OvV2eMrnHl3HliSkV5SfjSpCv0t0EJ2z8m17El6mu8
	icLYoJp2xT3jaMqnSlzoSXZnbphIQO7xcz1XPud3EHsACd13/Qq1aoqA3FX4bv4yR3IK
	ZhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z8XYvyhoYOOREaCSuiF8fbFlUMlrnN4AhvRxnAKYzOU=;
	b=j3x4sSmj0MqKduT4xbV2Xhrw1ifuZPG1yGCBHjGPSzl9rHOB3FPQ0VdFnDpQFZX2Co
	q4YnAUPEXJabGogT1YT2E6pBMY9E1JdM8mn2KE9Gi42O4dB1E/mD4gBZb5CysxlmF1fR
	aP7snMo/a4/Kx/ShBijYlZSf4voki5sOJH2Yw9Js6fwwNKHcEZd4PoaMAU2jonSoZuiI
	4F193AhS87F0817gLotcPAkkWq72o7eauXf6XUFwmm3rmk22sEZH0/Cfx6/qPi51tN+v
	Tmd1GD/q13DxXlZ7W5I4MPtqVfQEN5u0BqE5Zq7WSFf+/CJGcn9sVgE49IaSl0zsWK8G
	JOxA==
X-Gm-Message-State: APjAAAXMpuEu50lVOUEpw9k0zt+nvA/7dTwAtsqHUCsKrf8nWMRDPGeX
	KYEAmQWXSsMSNl+TkE5R3NRxp9I536HmM3STurnnnQ==
X-Google-Smtp-Source: APXvYqw5NLH44gAPZE56Q7Br4NPymKSkftIE7f+bA3ceGNzcyNXC/f4J0eVM/qYHny3REQz/Wp3kJWziuoFHPYmNxSg=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr54915718jao.82.1564410049875; 
	Mon, 29 Jul 2019 07:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <1564282197-5044-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1564282197-5044-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2019 15:20:38 +0100
Message-ID: <CAJTo0LYKX_=UjE-6Kd+BvLH+i6Gub3ffqjOQcM4eEx2JDOwRVQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <ming.liu@toradex.com>, luka.pivk@toradex.com,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] weston: change to use meson build system
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
X-List-Received-Date: Mon, 29 Jul 2019 14:20:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jul 2019 at 03:50, <liu.ming50@gmail.com> wrote:
> The changes include:
> - Drop all autotools related patches.
> - Move weston-launch setuid-install to do_install task since it's not
>   supported yet by meson build.
> - Drop cairo-glesv2 package config, it's not supported by meson build,
>   the recommended value is hard-coded to cairo-image for now in weston
>   source.
> - Introduce remoting package config, to give this option a explicit
>   value, or else the build would run into gstreamer missing error since
>   it defaults to be true but gstreamer is not in depends list.

There's more undocumented changes:

packages/corei7-64-poky-linux/weston/weston-dbg: RRECOMMENDS: removed
"zlib-intel-dbg libxcb-shape-dbg"
packages/corei7-64-poky-linux/weston/weston-dev: FILELIST: removed
"/usr/include/libweston-6/compositor-headless.h
/usr/include/libweston-6/compositor-rdp.h"
packages/corei7-64-poky-linux/weston/weston-dev: RRECOMMENDS: removed
"zlib-intel-dev libxcb-shape-dev"
packages/corei7-64-poky-linux/weston/weston-src: FILELIST: added
"/usr/src/debug/weston/6.0.1-r0/weston-6.0.1/compositor/systemd-notify.c
/usr/src/debug/weston/6.0.1-r0/weston-6.0.1/compositor/screen-share.c"
packages/corei7-64-poky-linux/weston/weston-xwayland: RDEPENDS:
removed "glib-2.0 (['>= 2.60.5']) libxkbcommon (['>= 0.8.4'])
zlib-intel (['>= 1.2.11.1']) libxcb-shape (['>= 1.13.1']) libinput
(['>= 1.13.4'])"
packages/corei7-64-poky-linux/weston/weston: FILELIST: directory
renamed /usr/share/weston/protocols -> /usr/share/libweston/protocols,
added "/usr/lib/weston/systemd-notify.so
/usr/lib/weston/screen-share.so"

Some bits have been turned off, others turned on.

Ross

