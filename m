Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1CEEB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 10:01:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.30673.1691402499086796223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 03:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Af2J0pun;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so35031935e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691402497; x=1692007297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sSo/8+WkxGVuRbM0lmenamKEDqXmaE+5Dz1dxkqZj1g=;
        b=Af2J0punK7Tixc/M090i/O+qnXiROg3MAuoIlQu7k4ePs7KB+GgIREtDw5Z4283V0C
         951mEJRY2WBaLAFHAAyiA9yOIACjVeXXAsMNZIhuZWAsZn69BP8oFP0EVXYuBCYP9uMC
         43SMHO9xejajMEJ+iY8fx8SMXPd6wWWdM81L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691402497; x=1692007297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSo/8+WkxGVuRbM0lmenamKEDqXmaE+5Dz1dxkqZj1g=;
        b=R10Jll0kx4wHsUaB3UE7ndsX2a9taoPsXIZxsYDX3+XIoeDHpUuMK27hawCJG489sL
         37PuAVALIlAnnvgGCePCnKETT3UKWm0zeAUVm8wch7gmb1yN7iZfs0AgJWBcrEycFEHF
         huw/pRQIMKwGte5O2EkzM4Mns8OlohRzfL9G92duSw9PMOIbxBi0w0VLoIVSoxILBQWQ
         +wZmFCpBfgLLL7N9Wbn4+OSFU/35P3uJ5S3bOQto2aM8Dd0jTMRQaK8/tsL6ANuqeAQ4
         /RW/bG5oamPknF734W9TdRV/cds9KlVhgozqes3M3Lo0WTwTPPXFojGfy+cmLlgG0L+7
         sAug==
X-Gm-Message-State: AOJu0Yz0A5WMeS6bwB8hhSHaPdNKs6WUsQsuCUkWKV7icX0l/5pGwY9W
	LPPH6ydU36GhlWow4sVjkaewvg==
X-Google-Smtp-Source: AGHT+IF0wLjvHoyKtK9U52iSgyxj05WEgVt4rTMLlZNn9r5dQC6HbHYMKLVxPtp5ZC2Ns6Io5+233g==
X-Received: by 2002:a1c:7709:0:b0:3fe:1f2c:df1a with SMTP id t9-20020a1c7709000000b003fe1f2cdf1amr6651634wmi.24.1691402497302;
        Mon, 07 Aug 2023 03:01:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5? ([2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5])
        by smtp.gmail.com with ESMTPSA id q7-20020a1cf307000000b003fa98908014sm14562376wmq.8.2023.08.07.03.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 03:01:36 -0700 (PDT)
Message-ID: <964e59cb4a5f2497955511aa7e1734b98b90d3b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [OE] help with Equivalence Server
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, Maksim Chichikalov
	 <max.chichikalov@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Aug 2023 11:01:36 +0100
In-Reply-To: <CAJdd5GayZMQscBprpoqXW8JgixQKpVkAhNRJVPDD0Pffqj6Tvw@mail.gmail.com>
References: <88B62901-053C-4E95-9896-868EE16A4467@getmailspring.com>
	 <CAJdd5GayZMQscBprpoqXW8JgixQKpVkAhNRJVPDD0Pffqj6Tvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 10:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185591

On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrote:
> On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov
> <max.chichikalov@gmail.com> wrote:
> > My name is Max; nice to e-meet you. I need your help with
> > Equivalence Server :)
> > I watched your presentation on Youtube - it 100% helped me to
> > understand the logic better and debug the issue we are facing.
> > Thank you for all your input into OE development.
> >=20
> > I found in OE repo that you introduced "def OEOuthashBasic()", so I
> > decided to write to you first before opening the topic on an email
> > list.
> >=20
> > The problem:
> >=20
> > Input data are propagated to the output hash generation function,
> > which generates a different out-hash.
> >=20
> > Description:
> >=20
> > All "_git.bb" recipes have to append SRCPV to PV. As a result, PV
> > is different on each commit.
> >=20
> > The OEOuthashBasic function includes SSTATE_PKGSPEC to generate
> > hash, which contains PV (PV contains git hash). As a result, there
> > is no way to generate the same out-hash even if changes introduced
> > within a commit were trivial.
> >=20
>=20
> Right, this is sort of on purpose, because the hash equivalence is
> basically trying to say that an sstate object can be used in place of
> another one, even when the task hashes aren't the same (but the
> output hashes are). However, the sstate code itself will only look
> for sstate object with a certain name (which include PV); hash
> equivalency does have _some_ control over the file name sstate looks
> for, since it will replace the taskhash portion of the name with the
> unified hash, but it doesn't have complete control.
> =C2=A0
> >=20
> > In our codebase, our components have API part, which is managed by
> > an independent recipe per component. The described above problem
> > caused the recompilation of all components dependent on API, even
> > in cases when API was not changed. CI for pull requests recompiles
> > mostly the entire code base, I need to do something with it.=C2=A0
> > (sorry, quite hard for me to explain it in a nutshell, let me know
> > if you like to know slightly more details)=C2=A0
> >=20
>=20
> Ya, sounds like a typical mono-repo design?
> =C2=A0
> >=20
> > I see a couple of options for us:
> > =C2=A0* Add a custom implementation of out-hash generated function and
> > overwrite SSTATE_HASHEQUIV_METHOD.
> > =C2=A0* Better understand why it's mandatory to append SRCPV to PV, and
> > maybe it's flexible in our cases to do it.
> >=20
>=20
> This might be the best option, at least for your recipes, but I've
> CC'd the list for additional feedback
> =C2=A0
> > =C2=A0* Propose a patch to fix OEOuthashBasic().
> >=20
> > In my humble opinion, the commit's hash shouldn't be included in
> > out-hash generation, it doesn't make sense. Unless I'm missing
> > something important - What are your thoughts?
> >=20
>=20
> Yes and no. It's not intentional, but a side effect of hash
> equivalency trying to make sure that the things it's marking as
> equivalent can actually be found in sstate (basically, because sstate
> include the commit hash, hash equivalency kinda has to include it).

This all sounds a bit unfortunate.

sstate only works as long as the filenames are predictable. Some
elements of the sstate filenames are essential to operation, e.g. the
package architecture since one input would result in multiple files
with the same hash in the filename of the output otherwise. The recipe
name and version are there mainly for debugging to allow someone to
more easily know where an sstate object came from and what it
represents. This is summarised by the comment in sstate.bbclass "Fields
0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information"
in generate_sstatefn().

When we added hash equivalence, we added the ability to equate the
hashes but we'd not considered that the version string mismatch may
stop significant artefact reuse. I suspect at the time we reasoned that
if the version changes, the output probably does too.

Sadly fixing this isn't simple. Changing the hash algorithm isn't
enough, we need to stop the SRCREV part of PV being used in the sstate
filename. If we stop that happening, the output hash algorithm may well
"just work" at that point, I'm not sure if it directly encodes PV or
just the sstate filename, hopefully the latter.

The hard part is how to do this generically without adding a lot of
complex and potentially fragile code. The datastore context in that
function is the core configuration, not the recipe's datastore. The
options I can think of offhand:

a)=C2=A0Live with the issue

b) Put a hack into generate_sstatefn() which changed the PV element if
it matched a pattern but we'd have to do this for each SCM as needed.
Ugly but lowest overhead.

c) Indirect PV to SSTATEPV (or similar) and then alter SSTATEPV to drop
SRCPV to a fixed string. Nicer code in some ways but horrible
parsing/performance overhead since every recipe, even non-SCM ones
would be affected.

d) A partial version of c) where recipes can set SSTATEPV to a function
if they need it. Solves your specific case with overhead without
affecting everyone else. Would not solve the issue generally without
manual user intervention.

I'm not sure which of these will end up making the most sense. These
assume the output hash code uses the sstate filename and not PV. If it
uses PV there would be more work needed.

Cheers,

Richard

