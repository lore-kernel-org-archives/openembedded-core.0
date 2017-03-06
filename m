Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBA26AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 22:37:58 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 72so23936068uaf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 14:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b2xQYs11+WleAnN6q5DsSVyuUZH9Uutr1O7FwEDE828=;
	b=a0KsohRjt4juzM+BNaiF8n04K4ksFGME7lrcXAXjYEpDDuiDrXuOD8Zyc4M57WqYx7
	JyORkvv/K2vmWuG1Pgdf1Spk/N+sZ3k2VkoCWKYkiOB4QkziiQMsZA6EO0LuDnNvgy8S
	Af5Q+4pWvhqAs2RdiWPxVlGbHmKXtZRMSiNR9bHM8EE5Xc5jCyeWg1wqLoEmOmzuZHz1
	ZdlZhNjHJOY+ZD56RwnEgzZ/hl+De71veZT8zOXZ4SNrBz+11uEFU/QB+GluocBHtnqw
	d7WowjQlH3U+zti60ud5A4WQacQeqRzS5tVHSKqxrJ8o/Vgqq/RhoqpcK6ynD5mBut2H
	WJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b2xQYs11+WleAnN6q5DsSVyuUZH9Uutr1O7FwEDE828=;
	b=rSQ90ldN2WssC6YeMi3/4k38UcofqVKPmbjGC5CxgzNPl5stPm255ae+ie94mvZBTc
	N0fKrK4dFgOFzAe5lswwbQtrNmmBNpKxjpbnNQgwXKGPoRlvAZ6iz3pX3wNLfYQjjS3i
	jpRW/uYXTb/jomQZZqrP7J5V+GukacgzvAe/jOxuxxl1y1it51JNo7a/fI1XQzlJ2zj9
	BNTRed3G/3yzpdf2LupVpWZH5X48ehY8Q7mOemaYCbzGhFX+Un4idzAs58HS1K2sQ5o8
	HLtGoU7lJshFItoImvxnKryFdRl2qWj2kPgKNX97pjyC3BRGvvQtQsfR+PTvFX696qK+
	Azcg==
X-Gm-Message-State: AMke39noaE22kk3rmf7sB3DZaoA3WtUOqtvgVyjrPx95u/fl0aHfy7DFuTK+XJ/qVW2dMLASkdZ2YXEdD2iKIQ==
X-Received: by 10.31.142.208 with SMTP id q199mr3933498vkd.93.1488839879564;
	Mon, 06 Mar 2017 14:37:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Mon, 6 Mar 2017 14:37:29 -0800 (PST)
In-Reply-To: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
References: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Mar 2017 14:37:29 -0800
Message-ID: <CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Mon, 06 Mar 2017 22:37:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Defaulting to softfp probably isn't the best choice anymore,
> especially as there are now ARM BSP layers which leave DEFAULTTUNE
> entirely up to the distro:
>
>   https://lists.yoctoproject.org/pipermail/yocto/2017-February/034637.html
>

I like this patch and want to clarify that it changes the default ISA to thumb2
which we should use anyway due to size reasons and other distros use it as
default too.

I am not sure of we should change it for armv6 though. since some armv6
has t1 and some has t2 so lets leave that as it is.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
>  meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
>  meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
>  meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
>  meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
>  meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
>  meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
>  meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
>  meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
>  meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
> index 91f0f07..5e1f973 100644
> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv6"
> +DEFAULTTUNE ?= "armv6thf"
>
>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
>  TUNECONFLICTS[armv6] = "armv4 armv5"
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> index 5446048..bad1c27 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a"
> +DEFAULTTUNE ?= "armv7athf"
>
>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
> index 42d8d04..4d9260f 100644
> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7ve"
> +DEFAULTTUNE ?= "armv7vethf"
>
>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
> index 53994ef..2cadbee 100644
> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv6"
> +DEFAULTTUNE ?= "armv6thf"
>
>  require conf/machine/include/arm/arch-armv6.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
> index 03de602..25e99f9 100644
> --- a/meta/conf/machine/include/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7ve-neon"
> +DEFAULTTUNE ?= "armv7vethf-neon"
>
>  require conf/machine/include/arm/arch-armv7ve.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
> index f659a62..40392f9 100644
> --- a/meta/conf/machine/include/tune-cortexa17.inc
> +++ b/meta/conf/machine/include/tune-cortexa17.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7ve-neon"
> +DEFAULTTUNE ?= "armv7vethf-neon"
>
>  require conf/machine/include/arm/arch-armv7ve.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
> index 93f9ca4..1f0cda6 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7athf-neon"
>
>  require conf/machine/include/arm/arch-armv7a.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
> index 52e06b8..52415d9 100644
> --- a/meta/conf/machine/include/tune-cortexa7.inc
> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7ve-neon"
> +DEFAULTTUNE ?= "armv7vethf-neon"
>
>  require conf/machine/include/arm/arch-armv7ve.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> index a831bd5..8ee8de9 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7athf-neon"
>
>  require conf/machine/include/arm/arch-armv7a.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
> index 8b84e60..0cf323c 100644
> --- a/meta/conf/machine/include/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7athf-neon"
>
>  require conf/machine/include/arm/arch-armv7a.inc
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

