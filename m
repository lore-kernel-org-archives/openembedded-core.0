Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2A2C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 14:23:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.8668.1646144625388600277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TVzMdACp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so154701wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CAG0fmHrkyZva/l71pk6Q/X8Y5mRRQBasl8omTZEWSo=;
        b=TVzMdACp9V5XVqALqmxP2MjEpVXgoTz5gNShLaw234dMdR1HH/ymMiIo84JG9tb+UL
         TiclE8rHKdv1U0L811WXql29aKp6R6IffFgrRFl52HnPAf6e++xmfRMzbnOxvyHnPqij
         eAOrxkJI+aZZ86bvxynklZIx5e81nRuAIhVXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CAG0fmHrkyZva/l71pk6Q/X8Y5mRRQBasl8omTZEWSo=;
        b=gfdZf9TpgwzeKcSTYg2nT67tEzcBuuE3ge9mNN6KCJwh5yidEd1tto5f0X99Lks2Hf
         /HUxAHvknqwmB8qrQb7c8TBD7/4dRMw5mhVoexIdg/arIsNJoGVldY+tcFaahfUB9ikS
         /bocm+1zhOZUnt1aNnLJPYd71vQaTE4Ly1Em2wwaPj9wLEpTiZwZwqUkLae6k9pADeZ4
         oDFVWypg0U7W62Zok2P1AE6zUYv8iQGv8FEdtgjj65qe14Yzs22GJ0e3N1ve2qrdF17I
         NLoZdYJoCe4uCnmioBdlSp7Wj5lGX49xFCUaPVqIOLqSl1ikWOlvUV5jm8ValtOUnZNZ
         5eTg==
X-Gm-Message-State: AOAM530XWyxDI74c0WhiBmAW/6aqHQK7JxFlYy7f2aNXINqLRRvki1hV
	Vvy5kzkz2cLw6HSHdVHvxyzHWQ==
X-Google-Smtp-Source: 
 ABdhPJyStvbDvWDBDpkru5bYapVc5N5abhDqcmKlRwaPDc+7l8zXN5EZLoXVSCzgeGY4rNVCOjxfZA==
X-Received: by 2002:a05:600c:410d:b0:381:1fa9:7da0 with SMTP id
 j13-20020a05600c410d00b003811fa97da0mr17417174wmi.195.1646144623819;
        Tue, 01 Mar 2022 06:23:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f88:ec89:14b:c380?
 ([2001:8b0:aba:5f3c:5f88:ec89:14b:c380])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1c7404000000b0038140136ff6sm3532630wmc.5.2022.03.01.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 06:23:43 -0800 (PST)
Message-ID: 
 <12d5c909469e4ced0ab136d0ca5f00cbe45567c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libsndfile1: bump to version
 1.0.31
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandru Ardelean <ardeleanalex@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Mar 2022 14:23:42 +0000
In-Reply-To: 
 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
References: <20220224153034.5140-1-ardeleanalex@gmail.com>
	 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 14:23:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162557

On Mon, 2022-02-28 at 12:32 +0200, Alexandru Ardelean wrote:
> On Thu, Feb 24, 2022 at 5:30 PM Alexandru Ardelean
> <ardeleanalex@gmail.com> wrote:
> > 
> > It seems that the homepage has moved (for a while now) from
> >   http://www.mega-nerd.com/libsndfile/
> > to
> >   https://libsndfile.github.io/libsndfile/
> > 
> > On Github, the development group seems to include Erik de Castro Lopo (the
> > original author of libsndfile1).
> > Link: https://github.com/orgs/libsndfile/people
> > 
> > All backported CVE patches are in version 1.0.31 (I've checked).
> > 
> > The supported format page [1], mentions that Ogg/Opus is supported since
> > 1.0.29, however that isn't currently added in this patch. And it may
> > require libopus.
> > And mp3 is supported at around version 1.1.0, but that version is in beta.
> > 
> > This change focuses solely on updating to 1.0.31 and removing all
> > backported patches.
> > 
> > [1] https://libsndfile.github.io/libsndfile/formats.html
> 
> Bah...
> 
> No luck with V2 either.
> This would require some patch to allow build without libopus support.
> Since there is no libopus available, it will not include support for
> libvorbis, libflac.
> i.e. libsndfile will build, but will say:
> 
> configure: WARNING: *** One or more of the external libraries (ie
> libflac, libogg and
> configure: WARNING: *** libvorbis) is either missing (possibly only
> the development
> configure: WARNING: *** headers) or is of an unsupported version.
> configure: WARNING: ***
> configure: WARNING: *** Unfortunately, for ease of maintenance, the
> external libs
> configure: WARNING: *** are an all or nothing affair.
> 
> 
> Seems I forgot to check these extra configurations.
> 
> Please disregard the V2 and apologies for the noise.
> 
> I may try again with a V3, but let's see.


Unfortunately we merged this as it passed the automated testing and there was no
other review feedback.

https://git.yoctoproject.org/poky/commit/?id=fd2c86b06963345683ac5dc4f47f9da8e0c8c69d

It does make me worry about tests here and means we'll have to find some way to
fix this.

Cheers,

Richard


