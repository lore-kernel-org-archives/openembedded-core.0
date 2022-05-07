Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66CDC433EF
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 04:47:33 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.6831.1651898843793500352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 21:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SR36Udd4;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id a76so7298077qkg.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 21:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=onR3YCo5gVxIGaAlEWwREVMDDL4JwrGPDunX2bvYnoo=;
        b=SR36Udd4T8c7xobIo8az1lOTSrRLNeGZsXooc15wvPdOB5Udqu2uhBrISDAnAYh8CU
         Ycm8xDODzydbWXR0suKCdLzvG0kChCelk7synAQeuD6Uj9mtwnJ5HQsQKxPpHK2IrBAg
         lNq4y9WmgW2tDsEgO0rqDWkZ4cEkUuxSQPup9cGFM7uTH7BjaoYPIjx7wfbjdg+Cl4Z+
         fLRgtHkZOycHOv7yvCO0Jsfwo4omPtXU/0yRS27MgXTAw5kljvsa70govEbGM2aI05D3
         JsQiOnJMeS5m0DTmVpqpSP/FhqWrYo6lGdY4JDkdh4c0tQt7um0YrMC2yW50+9l0DVUq
         ofPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=onR3YCo5gVxIGaAlEWwREVMDDL4JwrGPDunX2bvYnoo=;
        b=SaCJl1JizVvwtZF14WvOUKZnOUhVnSS0PVLKUzVjL96x8LYL22IquOFj39UeHNPO4k
         qzK88uzHaun6w39bjQODbk1L5Ok2gzKEDBqfgIY/wwdj0MgVvCjFOePmjWBt6oLsL2LH
         PkZXLkSUlACC7ggtey0N/ZdJkYK/7GYha317zvJTGiXsfzyW4jAI/UeJ4y/yjRu5gK3R
         wyfMa5lm8wiYeuh3FGzTGBXfEGERIvIcyRyPsQ75bJR5bW9hn6SGy0mmY3C3uZ4TTFJZ
         ulqWRYufyCpE8/5fee3ue0NgEAQ1zoLKoRd6FOuPKwoNOJZ7JYlZ37wteNPHGT/MwMVn
         aWbQ==
X-Gm-Message-State: AOAM531tApoWDiKu8pceTOsvCOqc8uN0WbiJWYtwZKWXmZM/riGxApyJ
	uhAEYhZJCsqQsoLsBXTIJF3u9RWd5YXMOzwq4t4=
X-Google-Smtp-Source: 
 ABdhPJyBxKI5wofPExcG+Lpn8XcofGxeEtbRm7TpHOrcIZq5ziIcaq7kCEh7hhk2Y/EI6tOh497uXhNwRaIwjiPM4Ns=
X-Received: by 2002:a05:620a:44d0:b0:6a0:3f5a:d810 with SMTP id
 y16-20020a05620a44d000b006a03f5ad810mr4875982qkp.72.1651898842931; Fri, 06
 May 2022 21:47:22 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
 <CAMKF1srnfLwbEnD=h8MNSa4WXBf8RDJ+x=uqxBfHVb14ARktvg@mail.gmail.com>
 <CADkTA4PLxeGwEau+DC7c=hQdw4Ro4bTz08xtK_YNHk_jO2N_hA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PLxeGwEau+DC7c=hQdw4Ro4bTz08xtK_YNHk_jO2N_hA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 May 2022 21:46:57 -0700
Message-ID: 
 <CAMKF1soxhqTEHJfg0gfq_3x+KufzNDA6F=-Tjwg=R8Lp_ABNpQ@mail.gmail.com>
Subject: Re: gcc12 testing results
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 04:47:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165352

On Fri, May 6, 2022 at 9:08 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, May 6, 2022 at 11:41 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > yeah meta-virt is seemingly a new addition. Adding Bruce also about
> > the failures.
>
> The Xen guys will hopefully get around to it shortly, but we are still
> going through significant work to get kirkstone stabilized and
> released for meta-virt, so there's unlikely to be anything specific
> done on it for a bit yet.

since its now added to AB, I am hoping this does not become a holding
block for fundamental changes
like compiler upgrades. perhaps it should be made optional for master
if thats not where CI efforts are.

>
> I'm sure Xen upstream has already addressed it, but our Xen upgrades
> are in place for the release (Which is where the stabilization effort
> is happening), so we can peek for incremental fixes as appropriate.
>
> Cheers,
>
> Bruce
>
>
> >
> > On Fri, May 6, 2022 at 8:14 AM <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > I reran the gcc 12 testing. We still have an issue with linux-yocto
> > > 5.10 and edgerouter:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
> > >
> > > and meta-virtualization has a couple of issues:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
> > >
> > > Build is still going.
> > >
> > > Cheers,
> > >
> > > Richard
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

