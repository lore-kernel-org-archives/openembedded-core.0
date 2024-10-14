Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E3AD1625F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:52:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.54249.1728910336020185162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PLEtuR58;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-430576ff251so37121105e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728910334; x=1729515134; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PkNdB/7jX+EGbUel3Gi5VNSq5dTF6cx+uIrUHlhh1x0=;
        b=PLEtuR58cV/5xOwZ2k0ZeqwjKZsSoFNH6lDu0+Y8hgCEcG+U3Ko5NzE1S13x0r7/YG
         AOh+PgNwzdDi933W2fIx+ve8eqQVgs+EnlxUSSMwqzCzg2aQsa0HZxaNt659MxfbCaUn
         7n9gBzcd39NxQObI6RcYPXEC//ea8c+L2/FBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910334; x=1729515134;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkNdB/7jX+EGbUel3Gi5VNSq5dTF6cx+uIrUHlhh1x0=;
        b=qpidXkyRYHkIU1fgl0XjtKNoSZpLWX1KPXvHIfSl+M67Ikf0aWwRZmG5XTWfNFU9p9
         eqDUvybUQ2YWRQo7wQTkOHOLn/QBP+Ddg8E7MhQvicnBZMuqCEA1vSLQTraqefq4j9vy
         jhcfM1YQ/6FM17tgSO5ajJpX0nDntIep4/87lsy88vs9BTbBb0vOtRLHM0UQioQ2/AHS
         /QyR8BJJgegFzgUpgXraww1pBvXBXPv0q/wzu+z2QejWJFlsWdpIE3U2sd7d6eecHcXa
         QuwG38YxR1PuH1ssgt4BFXGl2K5ViQT+/ixJg47r8ld9eyY5R/N3E9bGFTZLameALUEx
         hEig==
X-Forwarded-Encrypted: i=1; AJvYcCXuHx+5MGEa2cuH4qExy8IXxkqn/m54aGgTw2dd/vJYCMqxC9TL0Sj1CGyTjIui5cGK0PT9ylKiGHjsvFuQVcC0KQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMNoYnJsV2YjL8pRWUaF3ZHldLA6K+IgC6GuLKRSLredVFAfSc
	2I2e0Iq5+FMGK7WmMYyybsVBZLQ1KwuXotiEflsJz8gQis/8FeDbrPna/M+DugY=
X-Google-Smtp-Source: AGHT+IFnbdsRIJQkIfPrzPRA2ktRVLl10WzG+0viKV1hmur9oR8Tyu2crVdADXpoxigtYloB60r5XQ==
X-Received: by 2002:a05:600c:1c29:b0:42f:75e0:7829 with SMTP id 5b1f17b1804b1-4311df56494mr94835635e9.30.1728910334222;
        Mon, 14 Oct 2024 05:52:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7a05b3sm11397913f8f.76.2024.10.14.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:52:13 -0700 (PDT)
Message-ID: <d90e529a8aaf0f3db3ca9ea233a5f942cdfbb9d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Mikko Rapeli
	 <mikko.rapeli@linaro.org>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Oct 2024 13:52:13 +0100
In-Reply-To: <5F96FA44-761F-4C3A-9892-266B9FDD0366@arm.com>
References: <20241014102817.40298-1-mikko.rapeli@linaro.org>
	 <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
	 <047b9ddb6f1aa89eab94c5d36262a8dfb081525e.camel@linuxfoundation.org>
	 <5F96FA44-761F-4C3A-9892-266B9FDD0366@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205769

On Mon, 2024-10-14 at 12:34 +0000, Ross Burton via
lists.openembedded.org wrote:
> On 14 Oct 2024, at 13:01, Richard Purdie via lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > On Mon, 2024-10-14 at 13:05 +0200, Alexander Kanavin via
> > lists.openembedded.org wrote:
> > > This doesn't quite make sense. Why is the problem specific to
> > > .pyc
> > > files and not other files ovmf installs?
> >=20
> > If it helps, I do roughly understand what is happening here and I
> > believe this is the right fix.
>=20
> So my understanding is that this is a general problem: if a native
> recipe ships a .py but not .pyc then when that script is used python
> will write a .pyc _into the sysroot_. If we then upgrade that recipe
> and it now ships a .pyc then you get this error, as the sysroot
> construction call wants to create a file that already exists.
>=20
> I think for scripts that are ran with python3-native then we should
> be shipping the .pyc files, even in native recipes, because then
> they=E2=80=99re pregenerated and will be used by python.=C2=A0 The fun is=
 when the
> script is ran by the host python, which is of indeterminate version.

For fun, there are things which could be called by either the host
python or python3-native from the sysroot depending on whether that was
added to PATH for other reasons. That complicates things somewhat.

> I wonder if python has a way to control where the files get written,
> so we could put freshly generated files into a separate directory
> that isn=E2=80=99t part of the sysroot?=C2=A0 We could also make the sysr=
oot read-
> only outside of the sysroot manipulation, which would force python to
> do something different too (though I believe this is just =E2=80=9Cdon=E2=
=80=99t
> write pyc?).
>=20
> Note that this problem impacts plenty of other recipes that for
> historical reasons can't ship bytecode into the sysroot (see eg
> python3-setuptools), so I do think we need a general solution and not
> just a creeping and irreversible trend of deleting .pyc from the
> sysroot.

I'm torn. It is a complex problem causing issues for patches which are
otherwise ok and requires a great deal of thought to fix differently.

The performance impact of python generating those files at first run
probably is negligible, compared even to the overhead of extracting
files from sstate.

Is this an issue we want to focus effort on? Are there gains here to be
had?

Cheers,

Richard



