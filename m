Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA327C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 14:54:23 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.36535.1691420060027289025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 07:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mZ1M/TUz;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so74631001fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691420058; x=1692024858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKVV7En6fIa4Pz9K3naxv8l/TRvNQe6k68yNK+9pB40=;
        b=mZ1M/TUzIbjpX4CAwtYqcVTwf8dW776Gvgl0ti3Yt+m9of5BCaFU1iIy3rFZCwCaPr
         je4/0RS7zn/R1ncDd3c/+5xdGPVugMOQpv8QuAAVkixVGtS1pBK3TVOqD/FrwoVmJONx
         xyrst+fom9LDrkIp+lSZ8lsah89nzbFFhnWDXArYD7V+0NiBFKn+PKcTUJ7B5ISPwSlR
         RiiF5w+g9yZw56mNaTrwFymDHT/IbLDD9dx8HJRiUIVQEHTZSV1CIgEipZ//Lnx6cOqR
         O2H/nw3TqjJ+Ga145SAlaVEyKpIgThWDpspXJDTKq/Xbh2OMJwIrnoncIkQ7KAGHBWnw
         x82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691420058; x=1692024858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKVV7En6fIa4Pz9K3naxv8l/TRvNQe6k68yNK+9pB40=;
        b=f+5a41ghRg2vbJV2BxkJrMG9GhFSv84knZCrHGSaVC6+xrzrcAZrLw4t/L2kNwpc+S
         Dp2Z3MOR+kZwywFRa3gfWdS7DJgrb6JceJk60voqhLPtr6H519+rTMdzUX5xhijp9H7x
         ViVnypW2sc2k94Ye6WHOtZFc0CZeq6T5sa2iCuRPZN8h2pSPyAIVE1Qfll6DlnPfGZ2u
         OFu4axZ6NNy931mLbChzirQUsmtG6jRse5eTokKRY6BrMeceVO8rV5ZyqA9CckZAdjtY
         ONCEHSBrRAz6k6oTrkHxN9PhmdOV3uj4omBYksE7/M29dEtr9YTofeaRLYl0aovvoFbg
         E2kg==
X-Gm-Message-State: AOJu0Yye3q7qMbwBIdgzKpI7Pqj0xohkY4/+unhKl6ypoBrq2FNs4Bvr
	YPIxmtbHPcjlgKoVF7ZJQ/wARIsTpleLZcXGQMs=
X-Google-Smtp-Source: AGHT+IEPwE4HzGy3NfdfaEuBzVp3zKi/PPSZKShfVn5mcEcgzLl00d+U342P6r2jOcjlnq70E8t97FMId+brp/OObak=
X-Received: by 2002:a2e:a312:0:b0:2b9:e831:f15f with SMTP id
 l18-20020a2ea312000000b002b9e831f15fmr6805040lje.32.1691420057906; Mon, 07
 Aug 2023 07:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJdd5GZAuucvChGKA1VyRwh6bWLmi1O0RB_LA3x+kq4M5s0o-g@mail.gmail.com>
 <C4B694B2-1129-492D-AE08-56FBF0A211D1@getmailspring.com>
In-Reply-To: <C4B694B2-1129-492D-AE08-56FBF0A211D1@getmailspring.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 7 Aug 2023 08:54:06 -0600
Message-ID: <CAJdd5GaDEu2WPPH+87dQM1cu=xgM2H30o+Ep=tTCUMbz2pmmcA@mail.gmail.com>
Subject: Re: [OE-core] [OE] help with Equivalence Server
To: Maksim Chichikalov <max.chichikalov@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 14:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185606

On Mon, Aug 7, 2023 at 8:41=E2=80=AFAM Maksim Chichikalov
<max.chichikalov@gmail.com> wrote:
>
> On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrote:
> > > On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov
> > > <max.chichikalov@gmail.com> wrote:
> > > > My name is Max; nice to e-meet you. I need your help with
> > > > Equivalence Server :)
> > > > I watched your presentation on Youtube - it 100% helped me to
> > > > understand the logic better and debug the issue we are facing.
> > > > Thank you for all your input into OE development.
> > > >
> > > > I found in OE repo that you introduced "def OEOuthashBasic()", so I
> > > > decided to write to you first before opening the topic on an email
> > > > list.
> > > >
> > > > The problem:
> > > >
> > > > Input data are propagated to the output hash generation function,
> > > > which generates a different out-hash.
> > > >
> > > > Description:
> > > >
> > > > All "_git.bb" recipes have to append SRCPV to PV. As a result, PV
> > > > is different on each commit.
> > > >
> > > > The OEOuthashBasic function includes SSTATE_PKGSPEC to generate
> > > > hash, which contains PV (PV contains git hash). As a result, there
> > > > is no way to generate the same out-hash even if changes introduced
> > > > within a commit were trivial.
> > > >
> > >
> > > Right, this is sort of on purpose, because the hash equivalence is
> > > basically trying to say that an sstate object can be used in place of
> > > another one, even when the task hashes aren't the same (but the
> > > output hashes are). However, the sstate code itself will only look
> > > for sstate object with a certain name (which include PV); hash
> > > equivalency does have _some_ control over the file name sstate looks
> > > for, since it will replace the taskhash portion of the name with the
> > > unified hash, but it doesn't have complete control.
> > >
> > > >
> > > > In our codebase, our components have API part, which is managed by
> > > > an independent recipe per component. The described above problem
> > > > caused the recompilation of all components dependent on API, even
> > > > in cases when API was not changed. CI for pull requests recompiles
> > > > mostly the entire code base, I need to do something with it.
> > > > (sorry, quite hard for me to explain it in a nutshell, let me know
> > > > if you like to know slightly more details)
> > > >
> > >
> > > Ya, sounds like a typical mono-repo design?
> > >
> > > >
> > > > I see a couple of options for us:
> > > > * Add a custom implementation of out-hash generated function and
> > > > overwrite SSTATE_HASHEQUIV_METHOD.
> > > > * Better understand why it's mandatory to append SRCPV to PV, and
> > > > maybe it's flexible in our cases to do it.
> > > >
> > >
> > > This might be the best option, at least for your recipes, but I've
> > > CC'd the list for additional feedback
> > >
> > > > * Propose a patch to fix OEOuthashBasic().
> > > >
> > > > In my humble opinion, the commit's hash shouldn't be included in
> > > > out-hash generation, it doesn't make sense. Unless I'm missing
> > > > something important - What are your thoughts?
> > > >
> > >
> > > Yes and no. It's not intentional, but a side effect of hash
> > > equivalency trying to make sure that the things it's marking as
> > > equivalent can actually be found in sstate (basically, because sstate
> > > include the commit hash, hash equivalency kinda has to include it).
> >
> > This all sounds a bit unfortunate.
> >
> > sstate only works as long as the filenames are predictable. Some
> > elements of the sstate filenames are essential to operation, e.g. the
> > package architecture since one input would result in multiple files
> > with the same hash in the filename of the output otherwise. The recipe
> > name and version are there mainly for debugging to allow someone to
> > more easily know where an sstate object came from and what it
> > represents. This is summarised by the comment in sstate.bbclass "Fields
> > 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information"
> > in generate_sstatefn().
> >
> > When we added hash equivalence, we added the ability to equate the
> > hashes but we'd not considered that the version string mismatch may
> > stop significant artefact reuse. I suspect at the time we reasoned that
> > if the version changes, the output probably does too.
> >
> > Sadly fixing this isn't simple. Changing the hash algorithm isn't
> > enough, we need to stop the SRCREV part of PV being used in the sstate
> > filename. If we stop that happening, the output hash algorithm may well
> > "just work" at that point, I'm not sure if it directly encodes PV or
> > just the sstate filename, hopefully the latter.
>
> It's including SSTATE_PKGSPEC in the output hash calculation,
> specifically so that a change in sstate filename changes the outhash
> (that way, hash equivalence will never map two difference sstate files
> as equivalent).
>
> >
> > The hard part is how to do this generically without adding a lot of
> > complex and potentially fragile code. The datastore context in that
> > function is the core configuration, not the recipe's datastore. The
> > options I can think of offhand:
> >
> > a) Live with the issue
> >
> > b) Put a hack into generate_sstatefn() which changed the PV element if
> > it matched a pattern but we'd have to do this for each SCM as needed.
> > Ugly but lowest overhead.
> >
> > c) Indirect PV to SSTATEPV (or similar) and then alter SSTATEPV to drop
> > SRCPV to a fixed string. Nicer code in some ways but horrible
> > parsing/performance overhead since every recipe, even non-SCM ones
> > would be affected.
> >
> > d) A partial version of c) where recipes can set SSTATEPV to a function
> > if they need it. Solves your specific case with overhead without
> > affecting everyone else. Would not solve the issue generally without
> > manual user intervention.
> >
> > I'm not sure which of these will end up making the most sense. These
> > assume the output hash code uses the sstate filename and not PV. If it
> > uses PV there would be more work needed.
>
> I'm not seeing where SRCPV or SRCREV are being explicitly added to
> SSTATE_PKGSPEC; PV is added, but SRCPV or SRCREV would have to be
> manually added to PV in the recipe itself for that to happen correct?
> Maybe it's as simple as not doing that in these particular recipes?
>
>
> What are pitfalls of not adding SRCPV to PV for packages with SRCREV:${PN=
} =3D ${AUTOREV}? Is it recommended just for improving traceability and deb=
ugging?
>
> When I remove, bitbake is not happy - for example: if I remove explicit a=
ddition of SRCPV, the bitbake throws the following exception (need to dig d=
eeper tp figure out why it happens only for certain packages)
>
> raise bb.fetch2.FetchError("Recipe uses a floating tag/branch without a f=
ixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE=
).")

Ah, I didn't realize you were using AUTOREV; I would recommend not
doing that and instead manually specifying the SRCREV you want to
build from instead; aside from giving a more reproducible history, I
think it means you can remove SRCPV from PV and hash equivalency will
work

At my $DAYJOB, we don't use AUTOREV. Instead, we have a (rather dumb)
script that makes a commit to update the SRCREV to match the current
head revision of the BRANCH specified in a recipe. We run this every
night for recipes where we want AUTOREV-like behavior. Upstream also
has the Auto-Upgrade-Helper (AUH) that does something similar if you
want to look at that too.

>
> BR,
> Max Chichikalov
>
> >
> > Cheers,
> >
> > Richard
>

