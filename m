Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE43C41513
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 15:39:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.37926.1691422768711672456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 08:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mfi+eY78;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so38398045e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691422767; x=1692027567;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zzWwTwrC8Pl2OKHtY7rWN+7EN+TatZBU3Bb84SbKB/0=;
        b=Mfi+eY78I6kLo8gkSBZN2IVUqP4VSxDiN8Gkb8iHi48Sdpfp1HkqvHwztuJyx7ysou
         ss/JXYgy+LLv+uBrfRarJycRw5aNf35tmVFgoDXP83bDWDabs5ySvORNoL8nNVjAvA6Z
         w/CkcaUi68ztxZbnDRB1doXL77bl+/pYrGELY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691422767; x=1692027567;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zzWwTwrC8Pl2OKHtY7rWN+7EN+TatZBU3Bb84SbKB/0=;
        b=XMcGz85FSBBMWsisqCeg+n3s7UZLGHsgEHYEiOBtrqpIpIZ+nDMC8Bs8GimXxnGqzU
         zVXp5KgmqCcC8QhQ4xWqet1B+v6OXUK5PAtqlbto2X3JkAzTfM6ATeJux8ujyeEtecrX
         ms+rTlDlt55ar1WkiLKqZFGzT4vPuAYoj0bb4jwBfY4k9vITyKzXajYLYUkWr9XgCN7I
         esUI/med/ll32wS7L2NTfGSVWDwj7hoNnkmj+j75+55S+vYEp9hp5no6x+U/02ALpBm2
         cQ4r7A8gdrQFKzZckmKIkbsceiJcZQbe3PtfyplKjMdr0tOq9GIXO/lxB5B625BLUKT7
         osLw==
X-Gm-Message-State: AOJu0YyjX/BLXZIALXPSuHxNpHfuPYVFEYuUY0/Nigox2ZKzbubtm2TS
	lLNrEcqP94SKKK/MEvLn9ye+Og==
X-Google-Smtp-Source: AGHT+IGZ91QNqftbktbc5VM+G48F+pRycAWHohCCeq4rqQevLYBPr6PXlNJWE5R9Jvev5o7aLV0GFw==
X-Received: by 2002:a7b:c409:0:b0:3fa:97b3:7ce0 with SMTP id k9-20020a7bc409000000b003fa97b37ce0mr7212085wmi.26.1691422767030;
        Mon, 07 Aug 2023 08:39:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5? ([2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5])
        by smtp.gmail.com with ESMTPSA id c9-20020a7bc849000000b003fe2f3a89d4sm11082079wml.7.2023.08.07.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 08:39:26 -0700 (PDT)
Message-ID: <36ea406443d78c9451096f9479df8a2317da45fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [OE] help with Equivalence Server
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Maksim Chichikalov <max.chichikalov@gmail.com>, Joshua Watt
	 <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Aug 2023 16:39:25 +0100
In-Reply-To: <5EB8DF9A-DDBD-4374-BCB1-7E2390204CA0@getmailspring.com>
References: 
	<CAJdd5GaDEu2WPPH+87dQM1cu=xgM2H30o+Ep=tTCUMbz2pmmcA@mail.gmail.com>
	 <5EB8DF9A-DDBD-4374-BCB1-7E2390204CA0@getmailspring.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 15:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185608

On Mon, 2023-08-07 at 11:30 -0400, Maksim Chichikalov wrote:
> > On Mon, Aug 7, 2023 at 8:41=E2=80=AFAM Maksim Chichikalov
> > <max.chichikalov@gmail.com> wrote:
> > >=20
> > > On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrote:
> > > > > On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov
> > > > > <max.chichikalov@gmail.com> wrote:
> > > > > > My name is Max; nice to e-meet you. I need your help with
> > > > > > Equivalence Server :)
> > > > > > I watched your presentation on Youtube - it 100% helped me
> > > > > > to
> > > > > > understand the logic better and debug the issue we are
> > > > > > facing.
> > > > > > Thank you for all your input into OE development.
> > > > > >=20
> > > > > > I found in OE repo that you introduced "def
> > > > > > OEOuthashBasic()", so I
> > > > > > decided to write to you first before opening the topic on
> > > > > > an email
> > > > > > list.
> > > > > >=20
> > > > > > The problem:
> > > > > >=20
> > > > > > Input data are propagated to the output hash generation
> > > > > > function,
> > > > > > which generates a different out-hash.
> > > > > >=20
> > > > > > Description:
> > > > > >=20
> > > > > > All "_git.bb" recipes have to append SRCPV to PV. As a
> > > > > > result, PV
> > > > > > is different on each commit.
> > > > > >=20
> > > > > > The OEOuthashBasic function includes SSTATE_PKGSPEC to
> > > > > > generate
> > > > > > hash, which contains PV (PV contains git hash). As a
> > > > > > result, there
> > > > > > is no way to generate the same out-hash even if changes
> > > > > > introduced
> > > > > > within a commit were trivial.
> > > > > >=20
> > > > >=20
> > > > > Right, this is sort of on purpose, because the hash
> > > > > equivalence is
> > > > > basically trying to say that an sstate object can be used in
> > > > > place of
> > > > > another one, even when the task hashes aren't the same (but
> > > > > the
> > > > > output hashes are). However, the sstate code itself will only
> > > > > look
> > > > > for sstate object with a certain name (which include PV);
> > > > > hash
> > > > > equivalency does have _some_ control over the file name
> > > > > sstate looks
> > > > > for, since it will replace the taskhash portion of the name
> > > > > with the
> > > > > unified hash, but it doesn't have complete control.
> > > > >=20
> > > > > >=20
> > > > > > In our codebase, our components have API part, which is
> > > > > > managed by
> > > > > > an independent recipe per component. The described above
> > > > > > problem
> > > > > > caused the recompilation of all components dependent on
> > > > > > API, even
> > > > > > in cases when API was not changed. CI for pull requests
> > > > > > recompiles
> > > > > > mostly the entire code base, I need to do something with
> > > > > > it.
> > > > > > (sorry, quite hard for me to explain it in a nutshell, let
> > > > > > me know
> > > > > > if you like to know slightly more details)
> > > > > >=20
> > > > >=20
> > > > > Ya, sounds like a typical mono-repo design?
> > > > >=20
> > > > > >=20
> > > > > > I see a couple of options for us:
> > > > > > * Add a custom implementation of out-hash generated
> > > > > > function and
> > > > > > overwrite SSTATE_HASHEQUIV_METHOD.
> > > > > > * Better understand why it's mandatory to append SRCPV to
> > > > > > PV, and
> > > > > > maybe it's flexible in our cases to do it.
> > > > > >=20
> > > > >=20
> > > > > This might be the best option, at least for your recipes, but
> > > > > I've
> > > > > CC'd the list for additional feedback
> > > > >=20
> > > > > > * Propose a patch to fix OEOuthashBasic().
> > > > > >=20
> > > > > > In my humble opinion, the commit's hash shouldn't be
> > > > > > included in
> > > > > > out-hash generation, it doesn't make sense. Unless I'm
> > > > > > missing
> > > > > > something important - What are your thoughts?
> > > > > >=20
> > > > >=20
> > > > > Yes and no. It's not intentional, but a side effect of hash
> > > > > equivalency trying to make sure that the things it's marking
> > > > > as
> > > > > equivalent can actually be found in sstate (basically,
> > > > > because sstate
> > > > > include the commit hash, hash equivalency kinda has to
> > > > > include it).
> > > >=20
> > > > This all sounds a bit unfortunate.
> > > >=20
> > > > sstate only works as long as the filenames are predictable.
> > > > Some
> > > > elements of the sstate filenames are essential to operation,
> > > > e.g. the
> > > > package architecture since one input would result in multiple
> > > > files
> > > > with the same hash in the filename of the output otherwise. The
> > > > recipe
> > > > name and version are there mainly for debugging to allow
> > > > someone to
> > > > more easily know where an sstate object came from and what it
> > > > represents. This is summarised by the comment in sstate.bbclass
> > > > "Fields
> > > > 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for
> > > > information"
> > > > in generate_sstatefn().
> > > >=20
> > > > When we added hash equivalence, we added the ability to equate
> > > > the
> > > > hashes but we'd not considered that the version string mismatch
> > > > may
> > > > stop significant artefact reuse. I suspect at the time we
> > > > reasoned that
> > > > if the version changes, the output probably does too.
> > > >=20
> > > > Sadly fixing this isn't simple. Changing the hash algorithm
> > > > isn't
> > > > enough, we need to stop the SRCREV part of PV being used in the
> > > > sstate
> > > > filename. If we stop that happening, the output hash algorithm
> > > > may well
> > > > "just work" at that point, I'm not sure if it directly encodes
> > > > PV or
> > > > just the sstate filename, hopefully the latter.
> > >=20
> > > It's including SSTATE_PKGSPEC in the output hash calculation,
> > > specifically so that a change in sstate filename changes the
> > > outhash
> > > (that way, hash equivalence will never map two difference sstate
> > > files
> > > as equivalent).
> > >=20
> > > >=20
> > > > The hard part is how to do this generically without adding a
> > > > lot of
> > > > complex and potentially fragile code. The datastore context in
> > > > that
> > > > function is the core configuration, not the recipe's datastore.
> > > > The
> > > > options I can think of offhand:
> > > >=20
> > > > a) Live with the issue
> > > >=20
> > > > b) Put a hack into generate_sstatefn() which changed the PV
> > > > element if
> > > > it matched a pattern but we'd have to do this for each SCM as
> > > > needed.
> > > > Ugly but lowest overhead.
> > > >=20
> > > > c) Indirect PV to SSTATEPV (or similar) and then alter SSTATEPV
> > > > to drop
> > > > SRCPV to a fixed string. Nicer code in some ways but horrible
> > > > parsing/performance overhead since every recipe, even non-SCM
> > > > ones
> > > > would be affected.
> > > >=20
> > > > d) A partial version of c) where recipes can set SSTATEPV to a
> > > > function
> > > > if they need it. Solves your specific case with overhead
> > > > without
> > > > affecting everyone else. Would not solve the issue generally
> > > > without
> > > > manual user intervention.
> > > >=20
> > > > I'm not sure which of these will end up making the most sense.
> > > > These
> > > > assume the output hash code uses the sstate filename and not
> > > > PV. If it
> > > > uses PV there would be more work needed.
> > >=20
> > > I'm not seeing where SRCPV or SRCREV are being explicitly added
> > > to
> > > SSTATE_PKGSPEC; PV is added, but SRCPV or SRCREV would have to be
> > > manually added to PV in the recipe itself for that to happen
> > > correct?
> > > Maybe it's as simple as not doing that in these particular
> > > recipes?
> > >=20
> > >=20
> > > What are pitfalls of not adding SRCPV to PV for packages with
> > > SRCREV:${PN} =3D ${AUTOREV}? Is it recommended just for improving
> > > traceability and debugging?
> > >=20
> > > When I remove, bitbake is not happy - for example: if I remove
> > > explicit addition of SRCPV, the bitbake throws the following
> > > exception (need to dig deeper tp figure out why it happens only
> > > for certain packages)
> > >=20
> > > raise bb.fetch2.FetchError("Recipe uses a floating tag/branch
> > > without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()
> > > (use SRCPV in PV for OE).")
> >=20
> > Ah, I didn't realize you were using AUTOREV; I would recommend not
> > doing that and instead manually specifying the SRCREV you want to
> > build from instead; aside from giving a more reproducible history,
> > I
> > think it means you can remove SRCPV from PV and hash equivalency
> > will
> > work
> >=20
> > At my $DAYJOB, we don't use AUTOREV. Instead, we have a (rather
> > dumb)
> > script that makes a commit to update the SRCREV to match the
> > current
> > head revision of the BRANCH specified in a recipe. We run this
> > every
> > night for recipes where we want AUTOREV-like behavior. Upstream
> > also
> > has the Auto-Upgrade-Helper (AUH) that does something similar if
> > you
> > want to look at that too.
>=20
> TY Joshua!
> AUTOREV is in use for pull request builds, when a package(s -> multi
> PR builds) should be built from the latest commit of the specific
> branch. I don't think we can stop using it, unless we add some
> mechanism of setting SRCREV to hash of the latest commit on each
> build invocation.
>=20
> Richard, what are your thoughts about:
> =C2=A0* What are pitfalls of not adding SRCPV to PV for packages with
> SRCREV:${PN} =3D ${AUTOREV}?

If you don't add SRCREV (via SRCPV) to PV, PV doesn't change when the
source control revision changes.

If the version doesn't change, how does bitbake know to rebuild? How do
packages get the right version in them so upgrades work?

I guess in modern times with hashes in task stamps, SRCREV can be
included directly into the task hashes so that part of this
functionality is partly obsolete. Reworking things to adapt to that
would be interesting but a fair amount of change/work.

> =C2=A0* Is it recommended just for improving traceability and debugging,
> or it has some bitabke/OE business logic implication?

As it stands today, it is relied upon to trigger rebuilds with a number
of follow on expectations.

I'm not against changing this as when I step back and think about it,
the reasoning for some of what we do is obsolete and we have better
mechanisms for it now. It will be a lot of work to change though.

Cheers,

Richard


