Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 644486E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:33:58 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id o52so50571858qtc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=13jfdu2L+z2HEcHgpoVXwBVDZ5DqVZaYNF3qI/pcvfk=;
	b=QDxUbQ98ZZRjYkL1TqBocnPPRLMz732sHWZpHjmfQ0Lm+wyqC193Zar6M7kY7zX/PK
	1/LSXx27BOthlC3+JFm5oUwzdHEGNP0grA0EYUerkyqX3P/4r+7AaFNJtBCsK2JLNURh
	1ReDJ2p9tzmHKjmMElakNojEVY0lzwZJGB6ExxkB26fc3sKc0sPiE335pXQBMSCIGKnH
	Z3O7TX7LKtB2vFd2/5Vim//lLzTlTAOzQmO2mB5Kym6d0bHsM1AjiuZEgyNVcmQMaZYH
	DI9NAfAAprUOk8lLVRXkszFbQfKY24hd2aW2zB8/SS71FrKyRB9okPHhW3RuOtGT1eGB
	++rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=13jfdu2L+z2HEcHgpoVXwBVDZ5DqVZaYNF3qI/pcvfk=;
	b=KSMYDDakJ/SJIKUpDZt1MGSFpOBo1B0N36uxmzGr+o5T5IQ/gP0kaTqBoNnIjNpESa
	T61Yk5s2N7S2C5b6Dw+cXDAgYd0jY8f+xc94fQwemvnbNW8vtDqytaTe918WbG5U192+
	zgLj0qvzk6LU//+G6HYChWlU0HdpLBTNqS//YUdvqBFN980G3QXJAl7oKb4GEvp0b7NK
	qY9BP3rCTMXcuOFnin/qSvs0zqk0cR7/2mgRGZhOfvAMAsk+b+RvqoZcswRBkHSJZXsm
	5ZQIFG5j6BwZhHCEbANW88smUeXCD3QAZDFHUrCSpHRyUPzJUoyO9X8kTbievO+Q3yxS
	Uj4g==
X-Gm-Message-State: AMCzsaVyteku095TiCHR2gcwQDYFUJ3fHOdVCtgfxLsnfq4IS9+BJRPE
	O6u6El0pwBwB3OEc1F7ZDMXTuLtkE/DYjJEWU6+4BA==
X-Google-Smtp-Source: AOwi7QBAyRxAd4tFyP/gSgVNqfCLJOiQzl9hcW5n0X8yJe7hv6JKsqjkEvrB+G6zq4RRm1uOtTO89KpiiMwXsosJz4M=
X-Received: by 10.200.9.56 with SMTP id t53mr19284042qth.68.1507638840065;
	Tue, 10 Oct 2017 05:34:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Tue, 10 Oct 2017 05:33:59 -0700 (PDT)
In-Reply-To: <20171010072044.42902-1-zhe.he@windriver.com>
References: <20171010072044.42902-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Oct 2017 08:33:59 -0400
Message-ID: <CADkTA4OwCyRrHyUwUFP2aMO1cAqQygcX6paU2RRyGfO1V6zPcA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/4.12: integrate CGL features support
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
X-List-Received-Date: Tue, 10 Oct 2017 12:33:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 3:20 AM, He Zhe <zhe.he@windriver.com> wrote:
> The CGL features now have a 4.12 port, so we can integrate them into
> the reference kernel.

I already have SRCREV updates queued for the kernels, but I hold on all
these patches during the stabilization phase of the release in case I need
to send a fix (and exclude these features).

So there's no need to send SRCREV updates like this.

Anyone looking at this, please do not queue it.

Cheers,

Bruce

>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> index c49a934..faf82ed 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> @@ -12,7 +12,7 @@ python () {
>  }
>
>  SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> -SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
> +SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> index ba67af3..efad337 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> @@ -10,7 +10,7 @@ KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> -SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
> +SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> index a262409..c9449e2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> @@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
>  SRCREV_machine_qemux86-64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
>  SRCREV_machine_qemumips64 ?= "9d63d9c11c44ceabd452d7ee49cf55a88c39383f"
>  SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> -SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
> +SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

