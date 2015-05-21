Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id A10FC65D19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 21:55:40 +0000 (UTC)
Received: by obfe9 with SMTP id e9so605672obf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 14:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XXSbJ7US/RdqXREzQ7eZnq5ldH0TNOO0Brh2mL6Q7vc=;
	b=uBP6zY9NIb2dFvzVK3XL7PVx+P/C3gegOXHUnxjYhVwFREmyMnwdD49XYiiYRDNFGg
	plvrr5loBZ+nTBUXv8RbIKhuCD1DyLbQPvXsp8LLddnxet007699UeDoYQaUdIZbMuvK
	6/I5DR9moW9SLHdsPdkhkJvc01jOSm9e52lHsyM125LpnlCOO3T3RhpciJFzFi3cjaB3
	3eKOkOThv976D3VUjJao1ltnLVvzQuaaYmlnJyiSj8DRGUZYUtHW5DYvsNwFn2HDQuo/
	EvXS6tHh6lylEpA7qxZRK4Nxu2VUxhANHt2tZTMu0z8hRcsrxSH41tbPC6R87wlZvXOF
	kqpg==
MIME-Version: 1.0
X-Received: by 10.202.81.201 with SMTP id f192mr3888961oib.29.1432245341202;
	Thu, 21 May 2015 14:55:41 -0700 (PDT)
Received: by 10.202.44.196 with HTTP; Thu, 21 May 2015 14:55:41 -0700 (PDT)
In-Reply-To: <8d68ee8847de2535cb31b5941da95adf4862e977.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
	<8d68ee8847de2535cb31b5941da95adf4862e977.1432235097.git.bruce.ashfield@windriver.com>
Date: Thu, 21 May 2015 14:55:41 -0700
Message-ID: <CAJ86T=X9o3vCfuDx6V1_TJOMhObHVPX-NkpdcGgqijuvT8f7Uw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] linux-yocto-custom: clarify bbappend versus copy in comments
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
X-List-Received-Date: Thu, 21 May 2015 21:55:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 21, 2015 at 12:08 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> The kernel development manual recommends making a copy of
> linux-yocto-custom, while the comments in the recipe talk about
> bbappends.
>
> To synchronize the two, we remove the bbappend references from the
> recipe and instead indicate that a copy should be updated.
>
> [YOCTO: #6925]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index 05463c026304..e38af19f827b 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -11,8 +11,8 @@
>  #
>  #   You must also provide a Linux kernel configuration. The most direct
>  #   method is to copy your .config to files/defconfig in your layer,
> -#   in the same directory as the bbappend and add file://defconfig to
> -#   your SRC_URI.
> +#   in the same directory as the copy (and rename) of this recipe and
> +#   add file://defconfig to your SRC_URI.
>  #
>  #   To use the yocto kernel tooling to generate a BSP configuration
>  #   using modular configuration fragments, see the yocto-bsp and
> @@ -52,14 +52,14 @@
>  inherit kernel
>  require recipes-kernel/linux/linux-yocto.inc
>
> -# Override SRC_URI in a bbappend file to point at a different source
> +# Override SRC_URI in a copy of this recipe to point at a different source
>  # tree if you do not want to build from Linus' tree.

Would "Update SRC_URI in your copy of this recipe..." make more sense here?

>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
>
>  LINUX_VERSION ?= "3.4"
>  LINUX_VERSION_EXTENSION ?= "-custom"
>
> -# Override SRCREV to point to a different commit in a bbappend file to
> +# Override SRCREV to point to a different commit in a copy of this recipe
>  # build a different release of the Linux kernel.
>  # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc

Same comment, "Override" -> "Update" and "a copy" -> "your copy".

Also, the word "to" seems to have gone missing from the end of the line.

>  SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
> @@ -67,6 +67,6 @@ SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>  PR = "r1"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> -# Override COMPATIBLE_MACHINE to include your machine in a bbappend
> +# Override COMPATIBLE_MACHINE to include your machine in a copy of this recipe
>  # file. Leaving it empty here ensures an early explicit build failure.
>  COMPATIBLE_MACHINE = "(^$)"
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

