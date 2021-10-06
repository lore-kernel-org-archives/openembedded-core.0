Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513A7C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:17:27 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.5193.1633479446472650811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ecK11YVp;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id z20so2898229edc.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9XarJurPXV3ZkZzaXilJz6sn1MQGu5XKXneBUThKdJI=;
        b=ecK11YVpXwfETCQPtycwT57mMjwFwzpfWmDgh6Q2qJJ6LJE2B/GmyrTPhbsFt6h8Gd
         BQxI9i1BenayP+qOxKWPCxqfFUNxFCNVJuIufcTaDAlXqADmwEiV8IU6VUbdYLvNDhOL
         uIW25LZN7aCoKGq1EsqRaW3AoqtQ2BnoNAyB9YQYdmAsu4safdVqgI+q290RGImVcBpf
         RT03/j+QXoub9sTWSyRDYyVtpyhmZ3eAxAzfcDurBNGXucdLgFZcuxymxlT8Vr5mp/KE
         azmTh3HoLorxzr/UnVKR7s/F9ngUWtVS4irDxt4M2fiBCVe+siEQZX7hJoCfTGFg2B+r
         G+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XarJurPXV3ZkZzaXilJz6sn1MQGu5XKXneBUThKdJI=;
        b=u00ATFPWAiQ4wiMJ+qPFH8do26/eKDSWb6ipnXPoijE6kuZqXsEAn20siUUVzxlEQp
         W0uydnQzH/s1yYv+2Bx2Zn/yL30+6F41BxSrl9sETdwsynxb59/Yqg1eCHiAXORIk7PM
         sPL0P/zaa6J2xjmFefMQdkM0wn2xUq+JNtBSvcuG2MbBOHXls0pJ3YiMAIJTYIfd5zQP
         y6uAEwrHXAGJ+IHoIiSzbvqdx5EKdmx0vrk77IvJiFpFS3nN5keOFkBh9htCWpr0URt2
         5+ddF4CHul08MkU2+QDXZEPJuqyw8DRZ4cKbDImlfoxSj9eZyTEsW2pp/Fq+dpA0LthD
         vTxQ==
X-Gm-Message-State: AOAM533m3VgXyiTrge9d8xQjB9o+THXmGWi3DqdVTBptRFhcKQ5aSQ9+
	J7GVgy/NwphTQPDBTQNbVeHOYkJFEfw1x5oZ6d4=
X-Google-Smtp-Source: 
 ABdhPJzenixNK1xPYIdLHpZf5ES/X+wBGU678d+fuRPVlD07ykni0TDveKl5ijB4BA4bHbxJjFSMMKNIkD1vdAnLiH8=
X-Received: by 2002:aa7:d3ce:: with SMTP id
 o14mr29638604edr.354.1633479445029;
 Tue, 05 Oct 2021 17:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
In-Reply-To: <20211005130411.2712850-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Oct 2021 21:17:14 -0300
Message-ID: 
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156670

On Tue, Oct 5, 2021 at 10:07 AM Ross Burton <ross@burtonini.com> wrote:
>
> 5.14 changed how the GCC plugins are built, which means they now
> depend on both GMP and MPC to be built. We already depend on gmp-native,
> so add libmpc-native aswell.

What's the symptom when the native dependency isn't around ? I'm just
wondering why none of my tests have picked this up. Is it only showing
on ARM hosts ? Something else ?

linux-yocto-dev can use this as well,  I can take care of that, if you
don't have the cycles.

I'm also factoring some of these things into kernel.bbclass, but this
makes sense in the recipe for now.

Bruce

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> index 0c6fbff75e..8c44c294bd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> @@ -46,7 +46,7 @@ LINUX_VERSION ?= "5.14.6"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>  DEPENDS += "openssl-native util-linux-native"
> -DEPENDS += "gmp-native"
> +DEPENDS += "gmp-native libmpc-native"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156645): https://lists.openembedded.org/g/openembedded-core/message/156645
> Mute This Topic: https://lists.openembedded.org/mt/86092630/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

