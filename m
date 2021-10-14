Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62F8C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:20:24 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.8580.1634214024025816253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pbt/5g5w;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r18so23346347edv.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kCS8vmh9LWP9cro52Ora4ZZaxFJtGlbcpZ3fPVCZ80=;
        b=pbt/5g5wow5/doh16FCDNfCx96a56jK/1d5wffOVDYUeRCH6jbrwCDbrOfxuEJH+b/
         ONsgg5OsyO82e4Htp8ikfOk86PcRU2THFv4eDszrzmf6v7jZIpvHkA7Loz5POcWOC9/F
         jBriUh+CNWlZPSFkn6aG9vz8BsDgiBDYZtcwc0sPxVWope+Y7qeq9aEnd8S/FueVgaNk
         javIIerGlVp5xzDBILYcLMYMi2Nbr0GXy4ty736uViiUyNK2NDQ/mcz+IFRRggKwmzMB
         QuM9UQxFBDROxhyR6kRf2R2OnjEeCXhDhCxMyNUutzLNAybfRg8+e5sAN/DzEQtotG3q
         SGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kCS8vmh9LWP9cro52Ora4ZZaxFJtGlbcpZ3fPVCZ80=;
        b=b/sFIvrwDWko2piTIAe9RDbAptDk7cXS4HnTZH6cGFgTelo5/YI8DsAplogNGz5U3y
         4PmwoJX+E8WhVKjIcf2jO3TvYKTguprpUpoVHXm18nbD6VI9OeHL9t/ICfqzHM0HdlKd
         iuOW2dx/jMf/j9uklHkraT3xRIg7nIIV9ewhQzt1XRWPVOnxKqK+dYLxaxSgULaGoOLm
         3sSR63XrMfnuxA4ZX0+3eGDL2vROmVsICrH6CMU9mgkxNJWqXoxC2PtsABbkc0syK0rs
         hUdqvkQjlwIjr/FRitVz0E98Hhg7+e7uNn3PJk9UokvpiqG78LXS9PbxhW71RbZ1IlJr
         OG2w==
X-Gm-Message-State: AOAM533+fd5PMhhiFKBto4vXz/Q6qS7XYFGaBvOHT9DXo4vLiAeIuLZk
	bEq6KxoVGlfCfLR646QSSpvIuDRqfp8Z3y7niMw=
X-Google-Smtp-Source: 
 ABdhPJze5KgxCpsyvquB27dsb3uonEmickNATh4OpoAx0h2SVyLc2D/oOSIIDswlRh+ClzaUf+AyIT5rjZ+y/sS85SM=
X-Received: by 2002:a05:6402:cb2:: with SMTP id
 cn18mr5799035edb.249.1634214022351;
 Thu, 14 Oct 2021 05:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211014102204.2904559-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211014102204.2904559-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Oct 2021 08:20:11 -0400
Message-ID: 
 <CADkTA4PxFFZvvu9jjstmJ6JxzVaDA_=dMRonNSLUMd6KBqHHyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto-dev: Ensure DEPENDS matches recent
 5.14 kernel changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:20:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156945

I already have this in my queue to send, but I guess this will do :D

Bruce

On Thu, Oct 14, 2021 at 6:22 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> DEPENDS here should match what 5.14 is using.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index f58b5ab0b86..005b6887789 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -38,6 +38,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>  DEPENDS += "openssl-native util-linux-native"
> +DEPENDS += "gmp-native libmpc-native"
>
>  COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156932): https://lists.openembedded.org/g/openembedded-core/message/156932
> Mute This Topic: https://lists.openembedded.org/mt/86308914/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

