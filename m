Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319F6CF0427
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 21:04:24 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.272.1728421459374263323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 14:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d+RAlu6/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d2ddb61c8so1082065f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 14:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728421457; x=1729026257; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=al6LhpI6SbP0vVDJpRQ0Jl5+lHPtoSz6cYd3F8fjN7M=;
        b=d+RAlu6/ByBcIViNkFkv2wfqs9a00OiYJokI7aSqmJtmOgdN14EQqHQSzqSHULA1A+
         yomlMpfuu8GeTBtuhyMWvR0QiQEvyBy9zZkoAWewXOMMNXL2B4ytHNs8QjxX4QXi7xSc
         cN58hgLu4P6KxMOozAXQt+r9n0FZI/EXrpDJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728421457; x=1729026257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=al6LhpI6SbP0vVDJpRQ0Jl5+lHPtoSz6cYd3F8fjN7M=;
        b=OTiGgkfrw9gIOg1z2EpFEGi2Cd8KBGF0FWiLEYYszuR6poooiCYtEJDOJL7itOjisS
         5O9mD4WEnPbq0dhFtqmzEpQz3/Ne3u54AxE8/K2FFRSzaUqb5b+uMFqYn/2pHv74juwH
         ov8XWlRgYWkekV7o1j1wu1iVZPqdYcj7mnss1wRgDpsbRGCLzjFt6nG0MP9PzTa7gIm8
         LGlSaCV43iHTYqYj1a0w/reMFd/8+zQ2ahkLsYXhFm9956d2SGVA239RhlvPEVLz9Drw
         Wv1WR3tXfsdSjRvb7yTAqdFuEsFcE6R20qZthUpXCArohkpHpbMRZnGvMvDTcw/m4571
         Yy7A==
X-Forwarded-Encrypted: i=1; AJvYcCWhY66BZBi3qdlEDorwLrK8nMH9MqJSt3UYlbbdL1KOB9R6ULopTTGlHqqWq3yg5Gwd2VGVQC0dOdpeynkPuhWveQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfB/NuzUNTN6o7smMgT/dVSmPzo9g2fYjC6OjBGKQtJAcEzskR
	Uo4WBMnrLRo/hjCx7hJyUMd3Zt1k7A9aAGrjXxOFJxU9szIrsVmpoASmp2umkn0=
X-Google-Smtp-Source: AGHT+IEB7l9vy/6qvpFl8XxHY+Fyn9xQytKJm/vaI2HmM3s+Mfb5yMJSFEVdih1JUSNpSkJhKm2x+w==
X-Received: by 2002:adf:e551:0:b0:37d:3705:84e7 with SMTP id ffacd0b85a97d-37d3aa40646mr118222f8f.17.1728421457510;
        Tue, 08 Oct 2024 14:04:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8294:f8ed:764d:9219? ([2001:8b0:aba:5f3c:8294:f8ed:764d:9219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a47esm8826983f8f.28.2024.10.08.14.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 14:04:16 -0700 (PDT)
Message-ID: <08381e35d278792747069cd8fae141af3dfd31f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography{-vectors}: upgrade
 42.0.8 -> 43.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Tue, 08 Oct 2024 22:04:16 +0100
In-Reply-To: <CANNYZj-rssV8xRfWvq7i7rZJHPfC7zDQRw-T_vMB8TekCJK8Lg@mail.gmail.com>
References: <20240813031628.1123492-1-tim.orling@konsulko.com>
	 <20240814225104ed116094@mail.local>
	 <CAOyo-85dM7t_uByZ12qPh9haZmOHiKFTRnyfhMmp2u9oCzYoHA@mail.gmail.com>
	 <a11cc259b50cbc7edb9daf959ae92e107f363144.camel@linuxfoundation.org>
	 <17F87AF6EAFDA641.14701@lists.openembedded.org>
	 <17F8C2E18D10AF69.31778@lists.openembedded.org>
	 <CANNYZj-rssV8xRfWvq7i7rZJHPfC7zDQRw-T_vMB8TekCJK8Lg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 21:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205311

On Tue, 2024-10-08 at 18:47 +0200, Alexander Kanavin wrote:
> On Thu, 26 Sept 2024 at 11:58, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > > > So the question is what is writing that file and is it doing it bas=
ed
> > > > on something like "ls" output which just lists the order on disk? I=
f
> > > > that is true you can thrown a sort in somewhere...
> > >=20
> > > Note that neither is sorted. I just built this with the in-progress
> > > python 3.13 update, and with that the entries do seem to be sorted, s=
o
> > > it seems the problem will disappear with that update.
> >=20
> > Sadly this was a premature celebration. This was the case in my local
> > build, but on the autobuilder (test python 3.13 build) it again fails
> > in the same non-sorted way:
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240925-w8=
kid2em/packages/diff-html/
>=20
> I have a fix for this now:
> https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/pyth=
on/python3-installer/0001-src-installer-utils.py-sort-entries-before-writin=
g-o.patch?h=3Dakanavin/package-version-updates
>=20
> Python 3.13 upgrade is still in progress, I need to go over these fails:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7361

I have patches queued for bitbake to address some of the python 3.13
issues in our own codebase. Python 3.13 also has issues working with
pseudo which have just been fixed. Those would affect python3-native
functionality.

Cheers,

Richard

