Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11E7C3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 11:15:09 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.133791.1672053304804252220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 03:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=alwII1t7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so7362052wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcUPjc8UKYYc0HYMAAtjAyRIh26G4C3m6Opy772UkLs=;
        b=alwII1t7crSNCZjQgBuWoQwNQ2RFIrAgWgIA9FKxsJeh/IEUP8Tr7UGp57ArHrwCHU
         PAjRAydbLaY8WhzDaynnV+ebfK8iyME7+4o0fx6A0vGxOSWV4eLwDZofQ3aSb9btOjyU
         v0AyTeBb1v9T+snZIAGHB52uc8ACB0KZc91tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rcUPjc8UKYYc0HYMAAtjAyRIh26G4C3m6Opy772UkLs=;
        b=OOMK20rOZ/AlyNUmY0RqzNxZmAXQlQyFSFUZHVsQtD81HnfzxmDTIA2YxYkhBXBplw
         1rLf0h1pnMYaSFodRpuaHOd5i6bwGf90gAEmtlZx3LNrfqoQSTXNeBwWKwzH7UMEtqp6
         JVW/LVbqx78u9fgescnM/ZWrxBbJO6aheZqvpEPFqb8IqksPxsWnZbIGqL+mV04ZISDy
         aLP8vg/f51frf/8S0qhuvd/jhthxGwkGMUd3itixjQaJrdFEjLccd8p2vqL5UQyYJYGI
         521NrBAkzpROGmL61f2XLvF08mMQILQDi3d5NypQURptM9HNLiOdm6bwXjkcLmjc1p+2
         b44g==
X-Gm-Message-State: AFqh2kqJKMNH1JTAbJ7ARbJ06boyFT8K/q41UNABvk/OSCaja4/RPCTc
	pQCXnjQVfiurZnrEIaQhncr8+Q==
X-Google-Smtp-Source: AMrXdXujRsefTRo3kerO7xU5GfX7REKPuHSTlpKjpBZsAgNERCfgiRSI1FvsBP+zHx1CiSxafRGtpQ==
X-Received: by 2002:a1c:4c12:0:b0:3c6:e63e:89a6 with SMTP id z18-20020a1c4c12000000b003c6e63e89a6mr12656743wmf.2.1672053302741;
        Mon, 26 Dec 2022 03:15:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee94:6910:509:b9e2? ([2001:8b0:aba:5f3c:ee94:6910:509:b9e2])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d558d000000b00241e5b917d0sm11889375wrv.36.2022.12.26.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 03:15:02 -0800 (PST)
Message-ID: <16eb0b99c129d79cc491206891647155d4356c39.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2022 11:15:01 +0000
In-Reply-To: <17345100F004118F.27785@lists.openembedded.org>
References: <17342835AC830076.27785@lists.openembedded.org>
	 <CAO5Uq5SqpQyL8PQHsFYDn8B7rios5EvpCni_5-JmzksAKWP0tw@mail.gmail.com>
	 <17345100F004118F.27785@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 11:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175020

On Mon, 2022-12-26 at 10:27 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2022-12-26 at 09:41 +0000, Alex Kiernan wrote:
> > There's something odd happened here. Three of the patches in the
> > previous version I posted look to have been merged in poky, but not
> > oe-core? I thought the flow was from oe-core into poky.
>=20
> I'd attempted to take three of them into master-next to try and move
> things along a little with testing. It looks like I've messed something
> up. I'll try and reconcile things, thanks for pointing it out. Not sure
> how I managed this!

I can only think I ran some commands in the wrong terminal window. The
simplest thing for me to do was to bring the branches into sync which
I've done, which means some of the series did merge. I don't think that
should be a problem and we can build incrementally on it.

Cheers,

Richard

