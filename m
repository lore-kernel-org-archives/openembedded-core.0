Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C6C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 15:28:55 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.12985.1656516525952439436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y1Kn8/8+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id q9so23032758wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Lbuw41KOXEQlhSHKuilSTYGOljFBryoXntDePKdbfGA=;
        b=Y1Kn8/8+tD8wWz74w8Bho2a5b0geIDmFWB0YNdSJfttL+j/c0PI38oGQQ5zLOC+FPx
         KQObYGU2ZuI9iJmJNuRAyryD66R4aeZVyZ9YdO1Docga7yN7Mt40F84fG6x8vuEv5JpT
         YDM3c3/mb3p/ktp2RnYbqHHmVZ7qSAuVkDGY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Lbuw41KOXEQlhSHKuilSTYGOljFBryoXntDePKdbfGA=;
        b=FxhLQdMQ6QKZhfUHWskKZV+49iqR88Zzoo42xK5RxXL8BUEbird61KMvB3kxQgjqvf
         4RkaSd5WdXyqwJb23kqTbS64UO7a3D6LdyE+2YDyXKBh2IJbnbnUiVgtf5RgoPOOm4kP
         EFvUX7y3A4WcSKv0/chOhW4G1FPR9/b53Jt04OuK5wsZqcxGMM6B3kTefn1CKOphQgYd
         TfrgivVJALZNH4rcElEk9q/Tr/AYOLzpQpbGEz+jSxcoCPjcGv5/jFo/KYb2PvzcLYqM
         NXcMVQ0Cy3JdJ9kYeFSLbDLlVy4x1qUN86hqbRoFpatkxcHreISJaRh4BhRgVKrViAQU
         kfVw==
X-Gm-Message-State: AJIora/zDRQzI1xHXLgb68JMGynCMOk+d8l7X8IDUPM0YP66DSEaGfRe
	hbHACWLZIjnIyAILyIC4jrVEcw==
X-Google-Smtp-Source: 
 AGRyM1uJzvBcIJPdQKDPbHTuqgK9Jdt7OYoGhbo9XUvHRh85wmStB/37iEyj5MaWImjOdUxFSrCUvg==
X-Received: by 2002:a05:6000:1b86:b0:21d:21d2:3e12 with SMTP id
 r6-20020a0560001b8600b0021d21d23e12mr3761076wru.515.1656516524414;
        Wed, 29 Jun 2022 08:28:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7688:b75a:a909:895d?
 ([2001:8b0:aba:5f3c:7688:b75a:a909:895d])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a7bc848000000b0039c457cea21sm3455695wml.34.2022.06.29.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 08:28:43 -0700 (PDT)
Message-ID: 
 <a7bcaad1c212f0feb70e0e26fef8e8e30e51c703.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: 8.2.5083 -> 9.0.0005
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2022 16:28:42 +0100
In-Reply-To: 
 <CANNYZj_3+OxpbVNriWFm6KGuMTr0n9E7uBwRTEwLsEP=XSEEOg@mail.gmail.com>
References: <20220629132621.581615-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj8mU1djPZBVQHFa_=FBL1tUw6OXH0AJ8VDKPX+bEmqbYg@mail.gmail.com>
	 <a5da318795d11aeff646b1e5c1f357c00bee1e2c.camel@linuxfoundation.org>
	 <CANNYZj_3+OxpbVNriWFm6KGuMTr0n9E7uBwRTEwLsEP=XSEEOg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 15:28:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167385

On Wed, 2022-06-29 at 17:15 +0200, Alexander Kanavin wrote:
> On Wed, 29 Jun 2022 at 16:10, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I'm not sure it makes a lot of difference. The 5 changes after 9.0 look
> > relatively harmless, some of them are translation fixes. This change
> > addresses 4 CVEs and I suspect there will be more to follow so we'll
> > have to update past 9.0 soon anyway. I was torn but going for the
> > latest seemed to make the most sense.
>=20
> Right, that's fine. I wish we could have a tidy list of things that
> need to be updated, but some components like vim don;t make it
> possible.

Me too!

I'm a bit frustrated with vim but resigned to updating it regularly to
keep on top of the seemingly never ending list of CVEs :/.

Cheers,

Richard

