Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95830C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 16:08:29 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web09.11516.1651853300393898186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 09:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=na6DUiIc;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-2ec42eae76bso86390357b3.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PLAqu5ia41STj2IAayWuPjl1C8UzT8Ece5Qqoj5+Zsw=;
        b=na6DUiIc/iiqsz3MfKZ76KCnKg3PMZj5wHqyyi+mHFYyOwgtKwBe6Fi56xdcf2Bfs1
         Tu9dsYDFGfCVlGTMJ5n/nGJC4VEm4WtLbxdG9LM5UAoFwKsx9qgTnxSEwH1JKBfFOg7o
         2vnSp18TWDUiZf7WQFrxvkOUClNW9xALC9M5JkahPT32n50iI1CIvf3AtoMJkP8uH1MF
         rIXsVetQDpQqcZO+IcomhPhPKPG3Awr5zojUOwKNctBPar085/b4tDwft2f1bHEuem3l
         aprO98TQoMAjJQABShFLVf+m569m+yIfdR/4MxskII76pNgOTVgOckz0XxxNdEi/WMfm
         rXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PLAqu5ia41STj2IAayWuPjl1C8UzT8Ece5Qqoj5+Zsw=;
        b=A36pN9nJAbRHNmPXmFyW83sOBiUK3+DGVP+4ANvZIk8MAgCkkGh1mc8ekwgAhClZh8
         FgX1g15muc253wW27sr+cjbvEsmgE5HR933TKFEUstbjQY8cn6NjLZ+VD2FoD7t2AkxF
         YfIyxv4R0s4FS5S0Jn5f0aO0lGy7oYFgm3pWxZrUw5KSI8Yz6XQ7cub2uZCIq2GbAjbF
         CRj+l3ESS1EUraRoq8AdsqobtoqQgcomVQ/xePjcgd1uxhPGEp+7YEdnY5Pc/GYSY9jc
         c1O1qr/x98JEZ6QS8oC8qXwfbk+rulc9XJtLYT81Iwv3Aqw7tPCXNryBT5iuw5ybzylV
         Y0RA==
X-Gm-Message-State: AOAM530l30vKsvkmMcr9kleCvqIBwLSEcSMI9wHBhSbO+hINKWrBZZGq
	b4gm5JQVAvBqt46oD+HLFgEDx7fhUmbwvM6LOSI=
X-Google-Smtp-Source: 
 ABdhPJwfIUlruRp6eMQCzt9DlyHaXWMeXkmqTynJelgArUneVRR98Uu1imvSdtxmDQZseZgpYx40V/tJ4dd//lqmr4s=
X-Received: by 2002:a05:690c:3:b0:2e0:a28a:f0eb with SMTP id
 bc3-20020a05690c000300b002e0a28af0ebmr3452458ywb.179.1651853299590; Fri, 06
 May 2022 09:08:19 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
 <CAMKF1srnfLwbEnD=h8MNSa4WXBf8RDJ+x=uqxBfHVb14ARktvg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srnfLwbEnD=h8MNSa4WXBf8RDJ+x=uqxBfHVb14ARktvg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 May 2022 12:08:08 -0400
Message-ID: 
 <CADkTA4PLxeGwEau+DC7c=hQdw4Ro4bTz08xtK_YNHk_jO2N_hA@mail.gmail.com>
Subject: Re: gcc12 testing results
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 16:08:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165349

On Fri, May 6, 2022 at 11:41 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> yeah meta-virt is seemingly a new addition. Adding Bruce also about
> the failures.

The Xen guys will hopefully get around to it shortly, but we are still
going through significant work to get kirkstone stabilized and
released for meta-virt, so there's unlikely to be anything specific
done on it for a bit yet.

I'm sure Xen upstream has already addressed it, but our Xen upgrades
are in place for the release (Which is where the stabilization effort
is happening), so we can peek for incremental fixes as appropriate.

Cheers,

Bruce


>
> On Fri, May 6, 2022 at 8:14 AM <richard.purdie@linuxfoundation.org> wrote:
> >
> > I reran the gcc 12 testing. We still have an issue with linux-yocto
> > 5.10 and edgerouter:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
> >
> > and meta-virtualization has a couple of issues:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
> >
> > Build is still going.
> >
> > Cheers,
> >
> > Richard



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

