Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AA6C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 09:02:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.7811.1738746173663077125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 01:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gz/q+rlf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f796586so75661075e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 01:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738746172; x=1739350972; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E6zn08kkfiwJMV5obBbjY6kQY0jkmBpZ9Xq8scQ49L4=;
        b=Gz/q+rlfOQ+28Q3/JGY2jz+NcLRtXeOu2twc3YUbHLYDAXSFwDBi57OiPiH30CPzTx
         W1croKMONuUOaHb4h2PhOoTaKWZGrU4J3W4bvamfwQSSiJOteuMm0/3Lxl6OpMCUg1TN
         bqxse2mdYvMDpiFwy6tfLG8JNfqte/g/eAyk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738746172; x=1739350972;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6zn08kkfiwJMV5obBbjY6kQY0jkmBpZ9Xq8scQ49L4=;
        b=Tc8sx/cCSQ4kWD+MzQ+LvRe5PCec08sNNwunluRUWN1sW/IvhshuqkAq7bzDLSYgM5
         l3+cKDHjUoa20Kc787WXid2t+iD1f6qkNq4D+Ft4FScdZ3Ely9gxff67U5vmB0uKqFSs
         JRlN38OvgUIr9hSjJZ2x8yb25Z31c7NbiDVbWYz95o3FOAI+YGrCqhmyPVvD4ijsyH+r
         O0z9+DzfB99byYJSy+HiA3bxjb/54Dt5vAS3L4vZC4dOeeICi9A2JscAdN4/5C8MSmtK
         8BC1LxBq/j3J7XPn0L6EZBs/p/twT05gllI44lfl4sDU7sCYzpu1efndRho4WS7VLtgT
         IUng==
X-Forwarded-Encrypted: i=1; AJvYcCUO0FrlQdgo3hSwtM6/ysQAZiPn9CJKFlU184YenVPa5HuIhA+3wtPOivUt0DNa4P2CPe13kghg/S6yIXqq+26Uyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzcau3e5Q2EpQEheWqvKBD1fA6tKW9OwOHVrMrHjsjQEpLIPdyk
	rzobU0Xr9fDEC0Zu1/jbCucOkKPKZi5NoumUmFISE/VrqkSK4ynghrcdKj60WF0=
X-Gm-Gg: ASbGnctnYM0LFLWPpSz5K+xr4pFtY9CV+cImmgealCtr8mBYShb1i3lUU2fsWPdEpPd
	DhcPe99sKCVnkmCuzT4l9h6HrhAybaJML8vJlH4LyfeP1PlKFyvE6dTF5gOou0ZUz6sRY60ItX9
	cQ84d9aSq+EngCR9gTKhIS5Nt1bpzhlgKQ/PWwzgmhQhalRu6ADAeys8PUsQRNCuKnjsX9w1FPA
	/2HpqZ7WA0dSYmEfTUTW4QMNedMZqcoo6XmLsDx7jOvY7k0VCY6e63ZKeJI3L8m9Vb2El+cWUMp
	xGax8zuMxPq2D8qUOD1p0FB44+rBU7+i3l1jnGe80MzxqAowG/yIOZSKEO3kTU0fW8UJ3aJN0fk
	OGQv+
X-Google-Smtp-Source: AGHT+IGJbxlY1cCbIqZfzg46UWOS4qpKqxWbmc10MA82rSN12M3Bj7dtSoB7NjgYSUIY8cCGqdDgKA==
X-Received: by 2002:a5d:524f:0:b0:38b:ec2d:c0cf with SMTP id ffacd0b85a97d-38db491062cmr1404943f8f.44.1738746171943;
        Wed, 05 Feb 2025 01:02:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:be8c:5293:84c1:352a? ([2001:8b0:aba:5f3c:be8c:5293:84c1:352a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5a03sm18015932f8f.71.2025.02.05.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 01:02:51 -0800 (PST)
Message-ID: <f7ca0ce2a482d4b52d55f026bea16ff8475e0b2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Esben Haabendal <esben@geanix.com>, "Richard Purdie via
 lists.openembedded.org"
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Cc: sean@geanix.com, Ross Burton <Ross.Burton@arm.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Feb 2025 09:02:50 +0000
In-Reply-To: <87frksg5i5.fsf@geanix.com>
References: <20250117130851.4055166-1-sean@geanix.com>
		<C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
		<3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
		<ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
		<38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
	 <87frksg5i5.fsf@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 09:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210834

On Wed, 2025-02-05 at 09:28 +0100, Esben Haabendal wrote:
> "Richard Purdie via lists.openembedded.org"
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> writes:
> > > Is anything holding this back?
> >=20
> > Yes, there is.
> >=20
> > You're using the SDK in a way which it wasn't really intended for and
> > we're seeing "feature creep" where systemd's requirements being pushed
> > into places they don't really belong.
>=20
> Applying "usrmerge" to SDK is not a systemd feature as such. In my
> opinion, not splitting binaries in multiple bin dirs in general makes
> sense for an SDK. And throwing in a simple symlink for making stuff
> work, is super innocent in my opinion (for whatever that is worth).
>=20
> What is so fundamentally wrong or bad in allowing people to create SDK
> with usrmerge?
>=20
> > If systemd was truly "cross", you wouldn't need to force the target
> > layout into the SDK.
>=20
> There is no pushing of target layout into the SDK. The need or desire
> for having usrmerge in SDK is independent of target layout as such.
> Of-course, if you are having any kind of systemd tools in SDK, chances
> are that you are including some systemd features in target rootfs as
> well. But in theory, it is really independent.
>=20
> It is totally possible to for example want to include systemd-repart
> command in SDK and not have anything systemd in target rootfs.
>=20
> > The SDK layout should be independent of the target
> > system and this breaks that understanding.
>=20
> I agree on the former, and disagree on the latter. What Sean is pushing
> here allows people to build SDK with a usrmerge style layout. If they
> want to use usrmerge layout in rootfs layout or not is a different
> story.

Play out this scenario. Firstly, we would now officially have to
support two different SDK layouts. The alternative is we don't test one
of them, which would imply one of them is broken some of the time.

As soon as someone wants to include systemd-repart or libudev or one of
these other tools, we'd effectively force the selection of usrmerge in
the SDK since it won't build/work otherwise. We'd at least need to make
sure there were clear errors about why the configuration wouldn't work.

These two factors combined effectively forces everyone to that layout
whether they want to use it or not.

I really don't like imposing design choices like that by stealth.

To be honest I'd probably agree about only needing one bindir but what
I object to is doing it via usrmerge and doing it because systemd
requires it. If we did it, we should do it properly and for example
skip the symlinks since we control all the code. That would probably
break systemd too though since that wouldn't match it's world view
either.

I've been reluctant to go down the single bindir path before because I
know who will get all the bug reports to fix. I worry that will be the
case for usrmerge in the SDK too since people like to apply a bandaid
to make their specific use case work, then move on. I totally
understand why but it does make me reluctant to take such changes. I'd
also mention, how often do I actually say "no" to changes? I can think
of only two in the current development cycle, both complicating the
SDK.

Cheers,

Richard





