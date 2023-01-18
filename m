Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576EEC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 08:08:42 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.10503.1674029319553281405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 00:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BSWw7xub;
 spf=pass (domain: linaro.org, ip: 209.85.218.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f45.google.com with SMTP id vw16so18088809ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 00:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z9Jr2WzWKD8JJYqnA5uf3Ao6QM8WM3TlmEZZmMVDzfE=;
        b=BSWw7xubyCbQdPJkOvMDVStkVFls9GP8kFGvFXNb/TdwFD99T0mTeevq+QG1X/dQp8
         z3pv90Q47SoERf/28AGVPrhO95Q8rltusnYybHcEY+hhjbDDhWOyAYftflM6n7sCunWr
         5Gy149qf4YQpBB+AR9FTjaRXNC1n+KOt2KTp2bbaPNOxudAfUCq3xdSMSRJ7Rtvg62IE
         3tPg0+WGpRzCeCxzp0a7QOSJ/gGFIY7kT1H6mo3qDwbetxE8XJwEWp40gY78yPPDNute
         7/zIcpKPAh5nd03OU7wZ53neW5P6jBnatgyMI9AkrMfAV8HNwwYMPA+dodDyKQmftcFm
         UJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Jr2WzWKD8JJYqnA5uf3Ao6QM8WM3TlmEZZmMVDzfE=;
        b=WsBjQX7PUqL1DZM4VJTlunmJilix5FPp9ur5sUjddSOzLJ7WXIhHqPm0YOMmTu+uhV
         fIKSY31/eFiorurk0niFITvjg2V2MBPs2SoYlKQ/UX6i2Mdcgjtuve9VfEssUQ45ZanL
         MHhDTf9ZuIXpUTk60A7QhDrdHFeldUZSyMUzC0xEHvwjwnDvmZtJ3xTI60bnd9vaKLNL
         wsGYZIMcde0/WIPAKpuoH1T3YCoJFOEpbx4kPcGOirYYYeXQZTZVWWYP7B6cluBbJ43x
         x27qLbeTX9kz4g4mzd/B1URfayLDgyKLfZFffi+qS2+g2SPI0ttum28eCnvHSA5Obglx
         K4/g==
X-Gm-Message-State: AFqh2kqtgNf1sQAndYQ9/50GrPi1yQuWDAO2SAdJJeg+uFlrOKomlcjh
	bg/336pTWprxzHEtnNpa64igBg==
X-Google-Smtp-Source: AMrXdXsgxoEeh0mrYlIg7hhNsH9ncZxVvY1PM6geFAvLeGX/UJ/TkdQze0LE/neDj8A/zlE0JIgK9A==
X-Received: by 2002:a17:907:c30c:b0:86c:cbfd:936 with SMTP id tl12-20020a170907c30c00b0086ccbfd0936mr7402846ejc.11.1674029317893;
        Wed, 18 Jan 2023 00:08:37 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906495100b0086dd8f20a6asm5026588ejt.77.2023.01.18.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:08:37 -0800 (PST)
Date: Wed, 18 Jan 2023 10:08:35 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	sundeep.kokkonda@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
Message-ID: <Y8epA6iPn+do73vB@nuoska>
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org>
 <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
 <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com>
 <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
 <CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com>
 <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
 <CANNYZj8-Y62NRXg9Z+Lbju8ZVcpamE8408B6veYDKG_r-YK3Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8-Y62NRXg9Z+Lbju8ZVcpamE8408B6veYDKG_r-YK3Gw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 08:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176077

Hi,

On Wed, Jan 18, 2023 at 08:45:56AM +0100, Alexander Kanavin wrote:
> On Wed, 18 Jan 2023 at 03:08, Randy MacLeod <randy.macleod@windriver.com> wrote:
> > So far, there haven't been many Rust/Cargo CVEs so maybe we're making
> > too big a deal out of this. I certainly don't miss the deluge of memory management CVEs that
> > C/C++ applications suffer from!
> 
> For what it's worth I'm with you here, and I actually have an even
> more radical view (that may offend some - apologies). I think this
> whole 'CVE backporting' business is both enormously wasteful and never
> complete (or even close to it). Backporting CVEs and the stable
> release policy is basically a cover-up for bad (or altogether absent)
> CI at the project users side. If you upgrade a component, and it
> causes trouble, the trouble should be caught by pipeline, and not in
> the end product when the update has shipped.

It's usually not lack of CI, continuous integration, but lack of testing
coverage which is visible as risk management where any changes are
avoided and someties FUD replaces hard facts. A CI run may not show that
SW compatibility or some use cases are broken. In the worst case this is
detected by customers after SW has been deployed in the field.

> The saner policy would have been 'a Yocto stable release contains
> component versions all within their support windows by respective
> upstreams'. If the only supported version is the latest one, then so
> be it.

When mainting yocto SW stack for a long time, I made the distinction
between development tools and target SW. Basically all -native and
nativesdk- recipes and those target recipes which are not in the product
by default are development tools.

Development tools can be updated to new versions to fix severe bugs and
CVEs. For target SW, this can be done if ABI compatibility is preserved,
or in case of severe issues where ABI is part of the problem or
backporting the fix is more risky than an update, but this requires a
managed transition with the product platform where all users of the SW
are checked. ABI compatibility is important because frequently real
products often need to integrate binaries where source code is not available
to the bitbake build.

With this approach, I've updated tools and compiler versions. I would
not mind similar policy in upstream. Maintaining multiple rust/cargo
versions well is not likely going to happen so I'd accept this and
accept same updates in all branches.

If the same tool version works well and is tested in another yocto
branch and there are no major issues porting the same changes to another
LTS branch, this gives confidence that the update is ok.

Cheers,

-Mikko

