Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB45C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 18:34:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.952.1638383672870290150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 10:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V5sE/3Kr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so457817wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 10:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cTrwseXNZsS1TakkLHQtfZxOUy3ltJZGfo+tG3g9Lcc=;
        b=V5sE/3KrXmYcZaGa8BIlLtztDsqtBR8UrziTExcINiOvsaVbyypsHS1oXqQduIJHY8
         VWtgRKIDFdz/DJigWroD90+JfI3bKSotrLnRkLMF6jDQKqObA9brXoqNWW94JOvj2jSr
         Mjxv9WfauHujkC0fV+SWfI/9XKy7+2qRUx6r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cTrwseXNZsS1TakkLHQtfZxOUy3ltJZGfo+tG3g9Lcc=;
        b=pWdUPRyUBzNe6zn/YGWiE173rKhCwDbzuiCvtD8ijkpSv1JCdtAZI+HP1w6YslcRxF
         cgATVdUYdaJGlkw91AOFukBRj22qQ9xXuaf2oXgpA9FMPM9X85LfoKtO5/rG92UTJd9u
         TatrASt7eetGRlnc4X2diFyWGVqVHbrJJvvib82ob1ZhUA5jdTrSm1Gsg+zr9XBkRE3K
         AZIIAO5/tRY8waWo3caW8EIqbLf7058uelzft/vKpEDt/EuapglIpa0HeEUVjbnD3Q60
         Y+2np1BagQJAOrDDQ1QB1wNvKbe7yWY5MrXcKA+UkFaNa9tOakWHMXW4NEzzId1u4Xzn
         Ad7Q==
X-Gm-Message-State: AOAM5320PjFdMKok16Kf8bXGkJpG7DRJyaqYLT+N8FEPrQk/piPOpVRU
	ds7iF5jwOUTeqLYtbGIZHLAG0A==
X-Google-Smtp-Source: 
 ABdhPJy0nU1g4PBx85h4aJrcTHMB6DXWSWIZznkQFv8aAbmwtljDshEWmCRjXxC4kBCfSf2La0VI0g==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr9520037wmk.50.1638383671253;
        Wed, 01 Dec 2021 10:34:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da3:f730:82c6:e76e?
 ([2001:8b0:aba:5f3c:da3:f730:82c6:e76e])
        by smtp.gmail.com with ESMTPSA id g16sm92786wmq.20.2021.12.01.10.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:34:30 -0800 (PST)
Message-ID: 
 <1df29954a2c551f0b220c4fc0e5206e9c645dd33.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ptest-packagelists: Add missing
 python3-webcolors entry
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Quentin Schulz
	 <foss+yocto@0leil.net>
Date: Wed, 01 Dec 2021 18:34:28 +0000
In-Reply-To: 
 <CADkTA4MDSHzEyTWeVksHGqSnwPPyOqTfX=nd7YEq3_iqefVVoA@mail.gmail.com>
References: <20211201162800.3128628-1-quentin.schulz@theobroma-systems.com>
	 <CADkTA4MDSHzEyTWeVksHGqSnwPPyOqTfX=nd7YEq3_iqefVVoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 18:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159056

On Wed, 2021-12-01 at 11:58 -0500, Bruce Ashfield wrote:
> On Wed, Dec 1, 2021 at 11:28 AM Quentin Schulz
> <quentin.schulz@theobroma-systems.com> wrote:
> > 
> > Resolves:
> > 
> > WARNING: python3-webcolors-1.11.1-r0 do_package_qa: QA Issue: supports ptests but is not included in oe-core's ptest-packagelists.inc [missing-ptest]
> > 
> 
> I haven't seen the warning for this either, and I didn't even know
> this packgelist existed :)
> 
> So thanks for the fix, looks good to me.

I fixed one of these on the autobuilder with your series, I'm just not sure why
the other didn't show up...

Cheers,

Richard


