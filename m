Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 612947C5D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 17:28:34 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f196so2080906qke.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xAAcm0OAf7lIBz4EAkujREzcpzh2bvB5D4Ef8ewIHec=;
	b=axZU0L28r5n9zmHQ5JcfTAU5NQLdbc0r6dHZhmtJSE++GNqAFbSb+ub2qCtG5ySzwV
	Ei0rHiDZIkbBczDOUBMV0LdSx7Yog9V2XeDT3BsC8Z2bRbi+Pi9fXutg8Uxiwxg8HV5E
	5qDuZlBqrbWoQfb4ykcOtIJcJQyVP01cOJTyv2VA1fbSZaI3aqKXiOCPE8ClqFMub2DV
	0tgJ6oebsINndbt/DG/jmSzLTWwQMR+nqBWM8XxfQe0zNPQ/IfZ/OiVYZRk2ewsIAROA
	dUEeYMRxTA27P14W2yhr4JHP58dY2a1jy/o2vc2k/tfNFr+NF+HxXEsZZzDcwQ+gZJ9M
	P7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xAAcm0OAf7lIBz4EAkujREzcpzh2bvB5D4Ef8ewIHec=;
	b=Bj/f/jGtPIz4AovP8x+uUg1HZ1TO4xScpEuRginOKlBzXLAHYTB6EZUJpnesH6SLZi
	FVcb81n5kQlSGhFKS5zh2kVAEVKKAU85oeHXmO6c2BfR8Fu1DSzOwqOuCXEzoPnl5N9o
	rgid/jidNEsEdKTza+af7Te1PyGVLwIgjHmXIv4J/msyPR1X9Zh89CsuNCgjV5tbW8nI
	uIJvm43aPWd02QcoUuFfufj1GqS4ycekO20nkTnHbKek5VFBGZDh/cGPi5NuIEwApwvG
	NP0RraWXhYA3cjbPXuXNK71A6UrnbiEV6p+EnIeG7NfH155CtQlWY2gwmuCy50/sYOLU
	SLWg==
X-Gm-Message-State: AHQUAubuZ02bbuUkQOt1C8zlSacoTjT2KzoCYA+30pDcnXepy3hlnBPu
	8amqaZ/YN4KvmMaF6PlvVaAMoA4l81qm/LskNu4=
X-Google-Smtp-Source: AHgI3IYB40wWWm+BMkafawuaad48SM0w5rzO6+tf+/8yfAByI80Y6Jz+hFiqRrpgVXvULzo9yPS6LmqAlCZFm+HQ/F4=
X-Received: by 2002:ae9:c30b:: with SMTP id n11mr12259996qkg.102.1549646915067;
	Fri, 08 Feb 2019 09:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20190208153221.4335-1-abrodkin@synopsys.com>
In-Reply-To: <20190208153221.4335-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Feb 2019 09:28:09 -0800
Message-ID: <CAMKF1sqY_1h8j2KR322gF8swrvFapx1mJvicHn-U3bm0+m4-7g@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: Add dependency on libgcc for ARC
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
X-List-Received-Date: Fri, 08 Feb 2019 17:28:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 7:32 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> As of now in case of ARC there's no in-kernel implementation of basic libgcc
> functions used for millicode, multiplication, division etc instead we simply
> link with libgcc.a which provides everything used by the compiler.
>

this is something you would be fixing in kernel eventually?
we can carry this as a workaround until then but it really needs to be
fixed in kernel.

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 1ebfb606da..f191946f2a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
>  KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>  KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>
> +DEPENDS_append_arc = " libgcc"
> +KERNEL_CC_append_arc = " ${TOOLCHAIN_OPTIONS}"
> +KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
> +
>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>
>  KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> --
> 2.16.2
>

