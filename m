Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 431AD7860F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:42:18 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id g18so4188480plo.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 10:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jrqc6v2mvJyfSL1TouXwK+CPez5lJWnP+NFJPsNCeD0=;
	b=Szsf2FBhBTLJ/RybLnTbVbgTAxzA/I880tgVqUchBfc0vziejJnTRMXEdn5V3tZ1TV
	8VMzmiLjglY4Q5Ln2r9/ch686/jJLuZYNkgSbXUbXMQ5QBIOSXL6FrLajRqC1ZNTapRt
	6i88J+9rEIZBVwjefbrIfG2796tmyL6lfFESDOqHmuuQ30ASNAmLUsh+CFkLgujZkom0
	qjdTyhmIKFXKZAiY+7GjBgHl834rdwl94YLN0vnJxUT35Va5MqxqSCI9Rmg9kJa1Dy9A
	W/tQSuPXeZYWeNzavcZ6p0SxTXvnxpUwV/s/2HjUzEeAKmh1GUrrlFkgVnO4lBWFIAHX
	2XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jrqc6v2mvJyfSL1TouXwK+CPez5lJWnP+NFJPsNCeD0=;
	b=cnvDmqTnU59VHZnL2NarnieA9pm+aiiZzwcAIHwhgqAiAryiSXmx0/ppgM/XmJ42/E
	KbL51mN2+KmdasisSxhqBjWQ1Wzt2KAe7QMTsWbSPBbWpQtapnpgO0x03s6nXRxH2E5o
	2fYnNd6RYpY6Cm1MQ5f5sft9dJ0S+q1E55LVaWDun+cLUgzoDmvpDXJRhpseeIkFs6oG
	9kr3evGqv/bsA0x6b55bgi6CSiuacirhRJwezEdBW7vFJ8E2KACS7ZhdRALlGzopNgEd
	+hf1KOhfzh8vXhR93pyXpg7QisWuEHvGbp24R1PHOVe7uG7/6o7a4nl269Xwm79jEEnJ
	8yBg==
X-Gm-Message-State: AKwxytfgAlVAAh4pvZiVS9s45I4uaAVXZwN9a9943+g6Q4RbZ5fCKSEb
	iWb+aw+RctEJiqpskKTXeV9OZ/zncU1GjpTdG9w=
X-Google-Smtp-Source: AH8x225N/8I9vp4810NgWD9Bm+1zKgyBPzY0cgd3R2Ad478ZosMKIydAzB60gD/MpIcDo+Xhl3sgkYNh1eR1rudCW/Q=
X-Received: by 2002:a17:902:988b:: with SMTP id
	s11-v6mr31093017plp.99.1517510540225; 
	Thu, 01 Feb 2018 10:42:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Thu, 1 Feb 2018 10:41:49 -0800 (PST)
In-Reply-To: <1517494616-26067-1-git-send-email-trini@konsulko.com>
References: <1517420847-7592-1-git-send-email-trini@konsulko.com>
	<1517494616-26067-1-git-send-email-trini@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Feb 2018 10:41:49 -0800
Message-ID: <CAMKF1spExnF9tnMaFq0N8L_-rGGL-YwVCVij6BCQkfa-soen4A@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] security_flags.inc, xorg-driver-common.inc: Move SECURITY_X_LDFLAGS logic
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
X-List-Received-Date: Thu, 01 Feb 2018 18:42:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 1, 2018 at 6:16 AM, Tom Rini <trini@konsulko.com> wrote:
> We need to ensure that all xorg modules are linked with
> SECURITY_X_LDFLAGS to ensure that they will be able to resolve their run
> time dependencies.  The approach of listing each driver in
> security_flags.inc lets less frequently used drivers be run-time
> broken.  Move the flag logic into xorg-driver-common.inc so that all
> xorg modules from all layers will have the correct security flags used.
>
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Changes in v3:
> - After reviewing fixing the drivers in meta-openembedded/meta-oe if we
>   move this logic into the common xf86 drivers inc file that all
>   layers use to correctly make these drivers, all layers will get this
>   fix for free if we move to overriding there instead.  Add a comment to
>   security_flags.inc for future reference.

generally, we try to pin this in global inc file so they disappear
when someone is
not using this feature. but here I like this approach since it turns
into a no-op
if security_flags.inc is not included.

> Changes in v2:
> - Oops, can't use % globbing in security_flags.inc, grabs brown paper
>   bag
> ---
>  meta/conf/distro/include/security_flags.inc              | 8 ++------
>  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 ++
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 7ea1049edff8..49d2417a882f 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -59,12 +59,8 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
>  SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
> -SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
> -SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
> -SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
> -SECURITY_LDFLAGS_pn-xf86-video-omap = "${SECURITY_X_LDFLAGS}"
> -SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
> -SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
> +# All xorg module drivers need to be linked this way as well and are
> +# handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
>  SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
>
>  TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index fe42f11b6898..bca0aade6cb5 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -38,3 +38,5 @@ def _add_xorg_abi_depends(d, name):
>
>      pn = d.getVar("PN")
>      d.appendVar('RDEPENDS_' + pn, ' ' + abi)
> +
> +SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
> --
> 2.7.4
>

