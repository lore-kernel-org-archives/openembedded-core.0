Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDDA7858B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 22:56:00 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id d124so117204vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=bUkfp63qVs01ostudBmcuAe3n8nWeq3KnSNTXTPTYIY=;
	b=fGG731p6i0qwrLH8sE7spS1emt5ywwJ5FC5leuuwQ1d6EFp05wrmukFmuqYqqhdBU3
	WLCJgGfPZupRecXejto+npB1SoeIcbq0VXb8ihJ+pGUGZkRkwJnBFhZnjbcfJCblzNoB
	wA0/M8L2gzFumS12fBuTy1bOI29h6IvTTOIXT6dumBW2QCL+dtHVO0pXVceRTVc/p8s8
	Jf5SpaJZ12wNx3Uj1wp7m5Tzixs7orUFi2sj66auvGWW5j3Qlc9GsncjzFA/6RDjmU3o
	2F9V5JrHcRqQm766ekZxh6376Szacu+twwzIwVo9wmKKvmjqh9fHacyMVmVC7RczBD5x
	BICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=bUkfp63qVs01ostudBmcuAe3n8nWeq3KnSNTXTPTYIY=;
	b=Qu1wWrFnYeX0lsJParpCsiCJoCHRmBe2696XhRfMNJrLFM97GEO6Bfo3N9/adV//9c
	CK4umVVOjoBrwCd0YLzuwh0D3muIpS4LQ8U8jSqGZLCWtSzs3XKaq92UDuXR2tQwRi4K
	8sRubx0gM9gs1/JXN/uH6VeUXNquJAwjvXU9LKr3AJb2qQ/rUth5rDD/F400ow3lYGue
	rt4V9d/nu40kd0+B8QRDuECxGvBr7Cy8xlJhF+t6SgyLTUSC9jpdOV9hpBKAVM1B4Ugh
	Nc1moNzBQvXUNQfndik0ZW05YzR17vTmX6zCammGewscPJpXAttxKW/ZtlDWwbl8/qOL
	0QZw==
X-Gm-Message-State: AIVw111PpVKaUd/zKPj2Zmhy1zNslAKKs/+2goiCyg7ENwX4x+u3DUuu
	frOs+VyO75olc1MpCasE8Nn7bihVy1Ss
X-Received: by 10.31.69.8 with SMTP id s8mr5696549vka.102.1501282561721; Fri,
	28 Jul 2017 15:56:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.48.88 with HTTP; Fri, 28 Jul 2017 15:56:01 -0700 (PDT)
In-Reply-To: <20170721124740.11866-1-twoerner@gmail.com>
References: <20170721124740.11866-1-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 28 Jul 2017 18:56:01 -0400
Message-ID: <CAHUNapT99EGoHMkZLKV+5z-3CofznBWG+hr_seSmmfqc-+mi5A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/machine-overrides-extended.bbclass: add
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
X-List-Received-Date: Fri, 28 Jul 2017 22:56:01 -0000
Content-Type: text/plain; charset="UTF-8"

ping? comments?

On Fri, Jul 21, 2017 at 8:47 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Copy this class from meta-freescale so all BSPs can use it.
>
> This class makes it easy for a BSP to specify multiple sets of configurations
> for a given MACHINE. In some cases there are multiple choices for the user.
> For example: for the kernel, the user could choose either the vendor kernel or
> the upstream kernel. However, sometimes these decisions are "locked" together:
> i.e. if you want to use the vendor's binary blob for (say) graphics, then
> you have to use their vendor kernel as well. It's not possible for a user to
> choose, say, the graphics binary blob but want to use the upstream kernel too.
> Therefore the BSP ends up with "sets" of configurations which need to be taken
> collectively instead of piecemeal.
>
> In the example of meta-freescale, if the user does nothing special,
> they get the vendor options. If they add the following line to their
> configuration, they get the upstream pieces:
>
>         MACHINEOVERRIDES .= ":use-mainline-bsp"
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/machine-overrides-extender.bbclass | 48 +++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 meta/classes/machine-overrides-extender.bbclass
>
> diff --git a/meta/classes/machine-overrides-extender.bbclass b/meta/classes/machine-overrides-extender.bbclass
> new file mode 100644
> index 0000000000..f333a0fcb7
> --- /dev/null
> +++ b/meta/classes/machine-overrides-extender.bbclass
> @@ -0,0 +1,48 @@
> +# -*- python -*-
> +# Automatically set extend the MACHINEOVERRIDES
> +#
> +# This allow to grouping of different settings for similar platforms.
> +#
> +# To indicate that a SoC contains following set of overrides, you can use:
> +#
> +# MACHINEOVERRIDES_EXTENDER_soc = "group1:group2"
> +#
> +# However to indicate that an override replaces a set of other
> +# overrides, you can use:
> +#
> +# MACHINEOVERRIDES_EXTENDER_FILTER_OUT_override = "group1 group2"
> +#
> +# Copyright 2016-2017 (C) O.S. Systems Software LTDA.
> +
> +def machine_overrides_extender(d):
> +    machine_overrides = (d.getVar('MACHINEOVERRIDES', True) or '').split(':')
> +
> +    # Gather the list of overrides to filter out
> +    machine_overrides_filter_out = []
> +    for override in machine_overrides:
> +        machine_overrides_filter_out += (d.getVar('MACHINEOVERRIDES_EXTENDER_FILTER_OUT_%s' % override, True) or '').split()
> +
> +    # Drop any overrides of filter_out prior extending
> +    machine_overrides = [o for o in machine_overrides if o not in machine_overrides_filter_out]
> +
> +    for override in machine_overrides:
> +        extender = d.getVar('MACHINEOVERRIDES_EXTENDER_%s' % override, True)
> +
> +        if extender:
> +            extender = extender.split(':')
> +
> +            # Drop any extension if in filter_out
> +            extender = [e for e in extender if e not in machine_overrides_filter_out]
> +
> +            extender.reverse()
> +            if not set(extender).issubset(set(machine_overrides)):
> +                index = machine_overrides.index(override)
> +                for e in extender:
> +                    machine_overrides.insert(index, e)
> +    d.setVar('MACHINEOVERRIDES', ':'.join(machine_overrides))
> +
> +python machine_overrides_extender_handler() {
> +    machine_overrides_extender(e.data)
> +}
> +machine_overrides_extender_handler[eventmask] = "bb.event.ConfigParsed"
> +addhandler machine_overrides_extender_handler
> --
> 2.13.0
>

