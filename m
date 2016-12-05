Return-Path: <bill.randle@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 56AC76E630
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 15:45:43 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id he10so25718134wjc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6acp7N+GdI3LGZ2fFpcmvhevynhObpvVJygmrk2aH4c=;
	b=MiEIVxhhKuSxyrfWFQurQ6+u/LwArkM8sxanP61hcK4InTFXTW5Yjbhafl9xGlRj98
	1YczqTQZSI8zQbaHmtSShokIAqvbw91sFCMZL9feCc+aG/9C8W+467z0lmbKjlhZNYwG
	dIoNwj7xp3buMWVqPbcSW2G2p+8OQDOHrjhMwSml8ASqhtRQA17xRWCFePHcr7RJm6ra
	IRGzXDkM6jdsIs4XdzDA5GMLk8sVIxG1/VoUuwzZZGO0qcQx5E/vv0LdTHBedPhog2MV
	cvp3x8zfxgA7ycVp9BO2gJPBRT0tXfEFkEk36VUXF0q2S5b4tLL7l8naZYX9rgXQCVMD
	47vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6acp7N+GdI3LGZ2fFpcmvhevynhObpvVJygmrk2aH4c=;
	b=d5FCK/RjA/ur4slvdQc0mjkPTZ467iM55Xtuw9w6E4FklFU1/dpKHCwMrnuKXn9VD1
	0eUxsXcbCSiqcBTUrdGyN7Z0+dxtRrwqe7q7v7c6M4Aw5vdUQ493T0eFod+e3rIGynMh
	UFOtB4BvZ+gCaaRKpJP/INaEVPoT5K3DS2dYWOdTFveAttkEb6wPA1hbswY+0i6WGuSL
	kLpjoTnMZ9hpsEfYoqnmLuXUNf3tff9WzpZESWVQABipbMNJDCg8nVYSAUKH3kvL7Y/A
	9Bj5mDNU5wdxRUQgJXX/qEWN32U5TR1rx/kIXEaanE91E8RxMt0/cMarpJ8cAPMC7sDy
	N2bQ==
X-Gm-Message-State: AKaTC03EEh+HXLslvs7ufsyZwnAW0XgrQ1Y6trgNu36apAKCQjr7GuavND5iVlRBAGmYIgdUbxFs6TP+ucPU5w==
X-Received: by 10.194.71.228 with SMTP id y4mr57846761wju.136.1480952744159;
	Mon, 05 Dec 2016 07:45:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.13.68 with HTTP; Mon, 5 Dec 2016 07:45:43 -0800 (PST)
In-Reply-To: <20161118192955.17284-1-marex@denx.de>
References: <20161118192955.17284-1-marex@denx.de>
From: Bill Randle <bill.randle@gmail.com>
Date: Mon, 5 Dec 2016 07:45:43 -0800
Message-ID: <CA+n--H82VdwJ0MBP5mkRRroEfF5kie+n0ZdSd6P2yz2X+pqbPQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to v2016.11 release
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
X-List-Received-Date: Mon, 05 Dec 2016 15:45:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 18, 2016 at 11:29 AM, Marek Vasut <marex@denx.de> wrote:
> Upgrade U-Boot to the latest version.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  .../{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc}       | 4 ++--
>  .../{u-boot-fw-utils_2016.09.01.bb => u-boot-fw-utils_2016.11.bb}     | 0
>  .../{u-boot-mkimage_2016.09.01.bb => u-boot-mkimage_2016.11.bb}       | 0
>  meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb}   | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc} (71%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.09.01.bb => u-boot-fw-utils_2016.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.09.01.bb => u-boot-mkimage_2016.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb} (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> similarity index 71%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> index f706a6b..84adc1c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> @@ -7,8 +7,8 @@ PE = "1"
>
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
> +SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
>
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
> +SRC_URI = "git://git.denx.de/u-boot.git"
>
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2016.11.bb
> --

Ross, any chance of getting this staged soon? I'm using it in a
project and I checked poky/master-next and poky-contrib/ross/mut but
don't see it there yet.

    -Bill

