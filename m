Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0840FC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 16:41:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.78597.1674751258679378460
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 08:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fUpnVqDJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso1520530wms.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K06cFiOLrSEzPwZ3mQ/w9iQeyRbIrEJF0yL5JyHSwMc=;
        b=fUpnVqDJoCc3wgNQIePmULt6QcKESePo1oUNnBvA44vNDs+FEFHJkVtMo385AUfczH
         B5D6H39JPVgACCxRxOF0fN7nYFlLTtxA221mq+p1Gd5+ZvZ82/xgy0BQMhFHTZfKNaxA
         ugTigCO/t5wePW5SDwc3GON9eyu0x5jVT+Vyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K06cFiOLrSEzPwZ3mQ/w9iQeyRbIrEJF0yL5JyHSwMc=;
        b=o7HGy4NqYs5tTRHux3YkiZwkxjvdz83v3Uw6vkSChxiiIWd9gh7DatFiAxnslHTI4+
         FyecE38ynCDfESfI5wiFAe67dj1xLfAojmUhZYXNqE86JJVZ0TaEcITW8ifJxsvKndf3
         R1Sei34qXUGoWox5cceSHpqSIWfzTFqytrgnJnCHelM2qB3pc1S5A8FJ74nKujDd5Zgn
         O6k+mI92M69HaXnMHfqaQfHt80gVGMTGuP+e73Qgu4U83IX3RNOrGdfzJ8d0OSQWnlfc
         diIg4ObrUQuVVX1989BWbRd8E13y7xR1syoaOniCFyxjPsOedlDpxNoRIadvUA073qvc
         9YfQ==
X-Gm-Message-State: AFqh2kp+fK9z+Vq/rOLkb2SufG/CfAAsOvoAtZS+u9aZU23ou5a04mxA
	vk65/HxQDfOafepK3VSQ+oT7Qw==
X-Google-Smtp-Source: AMrXdXsq8/NDO0ralNqPKrabVU3PIPebLFNTP6tbDPxgWTIRU+oFBjIUosYx4ubYauOIX7Yi5ahyHQ==
X-Received: by 2002:a05:600c:1e1f:b0:3db:2063:425d with SMTP id ay31-20020a05600c1e1f00b003db2063425dmr28100710wmb.2.1674751257073;
        Thu, 26 Jan 2023 08:40:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm6196404wml.9.2023.01.26.08.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:40:56 -0800 (PST)
Message-ID: <c184c05861049967f118dff802adcc5c26b8cfeb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate-cache-cleaner.py: Add a script for
 sstate cache cleaning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	tomasz.dziendzielski@gmail.com, openembedded-core@lists.openembedded.org
Cc: Mikolaj Lasota <mikolaj.lasota@protonmail.com>
Date: Thu, 26 Jan 2023 16:40:56 +0000
In-Reply-To: <102181aa-b1c0-85d1-5cc7-cfa5f8f17e7a@windriver.com>
References: <20221121111102.5556-1-tomasz.dziendzielski@gmail.com>
	 <102181aa-b1c0-85d1-5cc7-cfa5f8f17e7a@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 16:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176408

On Thu, 2023-01-26 at 11:31 -0500, Randy MacLeod wrote:
> On 2022-11-21 06:11, Tomasz Dziendzielski via lists.openembedded.org wrot=
e:
> =C2=A0
>=20
>=20
>=20
> > From: Mikolaj Lasota <mikolaj.lasota@protonmail.com>
> >=20
> > Bash script used at the moment takes too much time to calculate obsolet=
e
> > sstate cache files. Let's try to rewrite necessary logic in python and
> > store intermediate data in memory rather than temporary files.
>=20
> This seems like a nice improvement that got missed.
> I'd test it and report on the speed-up but I have a million other
> =C2=A0things to do so I'm just replying instead. What sort of performance
> =C2=A0difference are you seeing?
> Should we keep the old scripts/sstate-cache-management.sh
> =C2=A0but make it a wrapper for this script or just remove it?

I've been asked about this a couple of times. I'm a lot happier with
this script in python so I like the idea. What worries me is this:

"""
This script is a python rewrite of poky based scripts/sstate-cache-
management.sh. It has a subset of original script features
"""

I really don't like having two of something, each with some set of
good/bad.

If the patch deletes the original script and suggests people add the
missing functionality, that improves things. It would be helpful to
know which functionality is missing too.

Cheers,

Richard


