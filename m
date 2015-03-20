Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 757A06013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 17:10:49 +0000 (UTC)
Received: by lbbrr9 with SMTP id rr9so15508176lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ICAJ3dM/h9c8cFontL2w0vBQeXqs0X1qc18MfQVH7m4=;
	b=LmVKFDoqegWKLxpSdeCCReI8h3IXRlCeK1EkrhbHI7SEDXrL8UKoVStZwgHwyfVGR+
	RAairTMlnB2UC6QmSVWX9vYpXoBjA4Ru35f/80LzFeEquueH/XCJ/aO9n2UuOaHoK0uJ
	aNjBPcPIHAagZ7mLbv4g6n6mB/T1GDJuTsDVJw4L2/+RLs48hYfYvHSuk+Erykz8Dp9z
	Q6u2b3tH54DQBgMk27ifpsbl1vqv0jwZOI0yeF2dS7MU/OadZIPEbev/55CXRGTfHPkE
	7o3GJS35jZDFoeIvYXiZ5miOoHarzkPQ0QcdB9ZAsUUqAx7lyWRNU9YL44KT66QpBbmP
	emtw==
MIME-Version: 1.0
X-Received: by 10.152.28.5 with SMTP id x5mr72556917lag.112.1426871448897;
	Fri, 20 Mar 2015 10:10:48 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Fri, 20 Mar 2015 10:10:48 -0700 (PDT)
In-Reply-To: <1426871101-25001-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1426871101-25001-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Fri, 20 Mar 2015 13:10:48 -0400
Message-ID: <CADkTA4PBY5M45CW8kNPBe3sVkkW3Gu=DvWksz0QCfamNqhKjkw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-tiny: Enable CONFIG_BINFMT_SCRIPT
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
X-List-Received-Date: Fri, 20 Mar 2015 17:10:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 20, 2015 at 1:05 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> This SRCREV update fixes the failure of running /init
> for poky-tiny image.
>

Hold on this. I have other meta changes that this doesn't address. I expected
this meta commit in the intel layers, I have no trouble (and need to do) the
updates in linux-yocto myself.

Bruce

> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> index f6b95a2..fd0fa26 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> @@ -10,7 +10,7 @@ KMETA = "meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
> -SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
> +SRCREV_meta ?= "4c54da246369a9da73f8b4571ea7c9e61faa4d69"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
> index d10449a..c05af4a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
> @@ -10,7 +10,7 @@ KMETA = "meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
> -SRCREV_meta ?= "f7a81274b461d0c748964d75c24bea8574d350fb"
> +SRCREV_meta ?= "76bc151242d7f97f7eebc7591f83801cf07dc9af"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

