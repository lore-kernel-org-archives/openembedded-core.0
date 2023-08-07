Return-Path: <max.chichikalov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA1CC001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 15:30:43 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.37633.1691422240988721697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 08:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KSjEZtOc;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: max.chichikalov@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-403ea0a50f7so32796131cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691422240; x=1692027040;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP9QyKo9kXntgHHH1bzBKI02OqIKWJXjBUUK787qQ+A=;
        b=KSjEZtOcPrHYNX3BtsnN/6nc7ux4JQ+Nzi7vnmJUa4zGJzgwZXNvIplcwofxTa3Q4W
         p/Qo8aWBxh5m7pqsJznApiHJcCpr9+QGFxUdq4vLljINKlzmLHeTNKDVwbpmL48QUcfD
         nplZdfI2QiuogQiblBZvhJYbllFRQOZlf2kMvcYpgqz0Wlx30E5ZZHMuX4kEJFEfDsTz
         ZMaEvwSjOfHM+pE85MJP3+NeN6hu4DOqmjpjNj38ad//FcCHJMjGinpJ79LpUUszuxAa
         EIFtyAmv7vOmHXAGE5yQk30CrMIYqL7ckZJa/UeeXZTC4IUFIowckm+NKzPkpxYcvkzN
         fcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691422240; x=1692027040;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xP9QyKo9kXntgHHH1bzBKI02OqIKWJXjBUUK787qQ+A=;
        b=Ax4UfyshkYbVuGFvCZgArEaZBP5T45gBF3eQw8awH6/UnzqoWE8asvfqBUvgWoV45F
         TLpNYjIGxgECjmukHifdxfAo8Mo0RbWfa5Y6ZtijoEMJh9gJZv05X9pF8ZrzQ5pMuCN/
         plcBBv5bBJP45Z9JHMqusmC49doh1zqPdMsypnTLfwv4KYnB52k80nQj+GAxmQJHDCCn
         CRDWGkBESRgKDZjCAqfVAN/hGdwbgv7AmhdDd9rcRUP2tNqcxECgWqzvd8mH/TTFEIdv
         AIBBqKCqXzkskhSYNNgqwtHmD0blcjTDkCgeZTuENKI8Bz8cKYKdAfWnUtOp6LixaicB
         OmcQ==
X-Gm-Message-State: AOJu0Ywgw3AAZrXSyhF2FYcm0NpxXrzGoGt6pX8Lyhpm8PqH16RvWC6A
	4/FQIR9J6U0aAGoO8Sn8uJ4=
X-Google-Smtp-Source: AGHT+IGUirIkH7gA9stXDocqj0LsGoDuiudsIXdIFd9ooZCHaUcGDabv9HBRkm9h65Cl15TYtXoJug==
X-Received: by 2002:a05:622a:1011:b0:403:66f7:ae66 with SMTP id d17-20020a05622a101100b0040366f7ae66mr15107913qte.13.1691422239851;
        Mon, 07 Aug 2023 08:30:39 -0700 (PDT)
Received: from pc (bras-base-kntaon1618w-grc-10-184-145-9-208.dsl.bell.ca. [184.145.9.208])
        by smtp.gmail.com with ESMTPSA id f3-20020ac84703000000b00403ff38d855sm2714053qtp.4.2023.08.07.08.30.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 08:30:39 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:30:38 -0400
From: Maksim Chichikalov <max.chichikalov@gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
 <openembedded-core@lists.openembedded.org>
Message-ID: <5EB8DF9A-DDBD-4374-BCB1-7E2390204CA0@getmailspring.com>
In-Reply-To: <CAJdd5GaDEu2WPPH+87dQM1cu=xgM2H30o+Ep=tTCUMbz2pmmcA@mail.gmail.com>
References: <CAJdd5GaDEu2WPPH+87dQM1cu=xgM2H30o+Ep=tTCUMbz2pmmcA@mail.gmail.com>
Subject: Re: [OE-core] [OE] help with Equivalence Server
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="64d10e1e_11632f0b_80507"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 15:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185607

--64d10e1e_11632f0b_80507
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> On Mon, Aug 7, 2023 at 8:41=E2=80=AFAM Maksim Chichikalov
> <max.chichikalov=40gmail.com> wrote:
> >
> > On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purdie
> > <richard.purdie=40linuxfoundation.org> wrote:
> > >
> > > On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrote:
> > > > On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov
> > > > <max.chichikalov=40gmail.com> wrote:
> > > > > My name is Max; nice to e-meet you. I need your help with
> > > > > Equivalence Server :)
> > > > > I watched your presentation on Youtube - it 100% helped me to
> > > > > understand the logic better and debug the issue we are facing.
> > > > > Thank you for all your input into OE development.
> > > > >
> > > > > I found in OE repo that you introduced =22def OEOuthashBasic()=22=
, so I
> > > > > decided to write to you first before opening the topic on an em=
ail
> > > > > list.
> > > > >
> > > > > The problem:
> > > > >
> > > > > Input data are propagated to the output hash generation functio=
n,
> > > > > which generates a different out-hash.
> > > > >
> > > > > Description:
> > > > >
> > > > > All =22=5Fgit.bb=22 recipes have to append SRCPV to PV. As a re=
sult, PV
> > > > > is different on each commit.
> > > > >
> > > > > The OEOuthashBasic function includes SSTATE=5FPKGSPEC to genera=
te
> > > > > hash, which contains PV (PV contains git hash). As a result, th=
ere
> > > > > is no way to generate the same out-hash even if changes introdu=
ced
> > > > > within a commit were trivial.
> > > > >
> > > >
> > > > Right, this is sort of on purpose, because the hash equivalence i=
s
> > > > basically trying to say that an sstate object can be used in plac=
e of
> > > > another one, even when the task hashes aren't the same (but the
> > > > output hashes are). However, the sstate code itself will only loo=
k
> > > > for sstate object with a certain name (which include PV); hash
> > > > equivalency does have =5Fsome=5F control over the file name sstat=
e looks
> > > > for, since it will replace the taskhash portion of the name with =
the
> > > > unified hash, but it doesn't have complete control.
> > > >
> > > > >
> > > > > In our codebase, our components have API part, which is managed=
 by
> > > > > an independent recipe per component. The described above proble=
m
> > > > > caused the recompilation of all components dependent on API, ev=
en
> > > > > in cases when API was not changed. CI for pull requests recompi=
les
> > > > > mostly the entire code base, I need to do something with it.
> > > > > (sorry, quite hard for me to explain it in a nutshell, let me k=
now
> > > > > if you like to know slightly more details)
> > > > >
> > > >
> > > > Ya, sounds like a typical mono-repo design=3F
> > > >
> > > > >
> > > > > I see a couple of options for us:
> > > > > * Add a custom implementation of out-hash generated function an=
d
> > > > > overwrite SSTATE=5FHASHEQUIV=5FMETHOD.
> > > > > * Better understand why it's mandatory to append SRCPV to PV, a=
nd
> > > > > maybe it's flexible in our cases to do it.
> > > > >
> > > >
> > > > This might be the best option, at least for your recipes, but I'v=
e
> > > > CC'd the list for additional feedback
> > > >
> > > > > * Propose a patch to fix OEOuthashBasic().
> > > > >
> > > > > In my humble opinion, the commit's hash shouldn't be included i=
n
> > > > > out-hash generation, it doesn't make sense. Unless I'm missing
> > > > > something important - What are your thoughts=3F
> > > > >
> > > >
> > > > Yes and no. It's not intentional, but a side effect of hash
> > > > equivalency trying to make sure that the things it's marking as
> > > > equivalent can actually be found in sstate (basically, because ss=
tate
> > > > include the commit hash, hash equivalency kinda has to include it=
).
> > >
> > > This all sounds a bit unfortunate.
> > >
> > > sstate only works as long as the filenames are predictable. Some
> > > elements of the sstate filenames are essential to operation, e.g. t=
he
> > > package architecture since one input would result in multiple files=

> > > with the same hash in the filename of the output otherwise. The rec=
ipe
> > > name and version are there mainly for debugging to allow someone to=

> > > more easily know where an sstate object came from and what it
> > > represents. This is summarised by the comment in sstate.bbclass =22=
=46ields
> > > 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for informati=
on=22
> > > in generate=5Fsstatefn().
> > >
> > > When we added hash equivalence, we added the ability to equate the
> > > hashes but we'd not considered that the version string mismatch may=

> > > stop significant artefact reuse. I suspect at the time we reasoned =
that
> > > if the version changes, the output probably does too.
> > >
> > > Sadly fixing this isn't simple. Changing the hash algorithm isn't
> > > enough, we need to stop the SRCREV part of PV being used in the sst=
ate
> > > filename. If we stop that happening, the output hash algorithm may =
well
> > > =22just work=22 at that point, I'm not sure if it directly encodes =
PV or
> > > just the sstate filename, hopefully the latter.
> >
> > It's including SSTATE=5FPKGSPEC in the output hash calculation,
> > specifically so that a change in sstate filename changes the outhash
> > (that way, hash equivalence will never map two difference sstate file=
s
> > as equivalent).
> >
> > >
> > > The hard part is how to do this generically without adding a lot of=

> > > complex and potentially fragile code. The datastore context in that=

> > > function is the core configuration, not the recipe's datastore. The=

> > > options I can think of offhand:
> > >
> > > a) Live with the issue
> > >
> > > b) Put a hack into generate=5Fsstatefn() which changed the PV eleme=
nt if
> > > it matched a pattern but we'd have to do this for each SCM as neede=
d.
> > > Ugly but lowest overhead.
> > >
> > > c) Indirect PV to SSTATEPV (or similar) and then alter SSTATEPV to =
drop
> > > SRCPV to a fixed string. Nicer code in some ways but horrible
> > > parsing/performance overhead since every recipe, even non-SCM ones
> > > would be affected.
> > >
> > > d) A partial version of c) where recipes can set SSTATEPV to a func=
tion
> > > if they need it. Solves your specific case with overhead without
> > > affecting everyone else. Would not solve the issue generally withou=
t
> > > manual user intervention.
> > >
> > > I'm not sure which of these will end up making the most sense. Thes=
e
> > > assume the output hash code uses the sstate filename and not PV. If=
 it
> > > uses PV there would be more work needed.
> >
> > I'm not seeing where SRCPV or SRCREV are being explicitly added to
> > SSTATE=5FPKGSPEC; PV is added, but SRCPV or SRCREV would have to be
> > manually added to PV in the recipe itself for that to happen correct=3F=

> > Maybe it's as simple as not doing that in these particular recipes=3F=

> >
> >
> > What are pitfalls of not adding SRCPV to PV for packages with SRCREV:=
=24=7BPN=7D =3D =24=7BAUTOREV=7D=3F Is it recommended just for improving =
traceability and debugging=3F
> >
> > When I remove, bitbake is not happy - for example: if I remove explic=
it addition of SRCPV, the bitbake throws the following exception (need to=
 dig deeper tp figure out why it happens only for certain packages)
> >
> > raise bb.fetch2.=46etchError(=22Recipe uses a floating tag/branch wit=
hout a fixed SRCREV yet doesn't call bb.fetch2.get=5Fsrcrev() (use SRCPV =
in PV for OE).=22)
>
> Ah, I didn't realize you were using AUTOREV; I would recommend not
> doing that and instead manually specifying the SRCREV you want to
> build from instead; aside from giving a more reproducible history, I
> think it means you can remove SRCPV from PV and hash equivalency will
> work
>
> At my =24DAYJOB, we don't use AUTOREV. Instead, we have a (rather dumb)=

> script that makes a commit to update the SRCREV to match the current
> head revision of the BRANCH specified in a recipe. We run this every
> night for recipes where we want AUTOREV-like behavior. Upstream also
> has the Auto-Upgrade-Helper (AUH) that does something similar if you
> want to look at that too.
>

TY Joshua=21
AUTOREV is in use for pull request builds, when a package(s -> multi PR b=
uilds) should be built from the latest commit of the specific branch. I d=
on't think we can stop using it, unless we add some mechanism of setting =
SRCREV to hash of the latest commit on each build invocation.

Richard, what are your thoughts about:
What are pitfalls of not adding SRCPV to PV for packages with SRCREV:=24=7B=
PN=7D =3D =24=7BAUTOREV=7D=3F

Is it recommended just for improving traceability and debugging, or it ha=
s some bitabke/OE business logic implication=3F

BR,
Max Chichikalov

>
> BR,
> Max Chichikalov
>
> >
> > Cheers,
> >
> > Richard
>


--64d10e1e_11632f0b_80507
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<blockquote><div><div>On Mon, Aug 7, 2023 at 8:41=E2=80=AFAM Maksim Chich=
ikalov</div><div>&lt;max.chichikalov=40gmail.com&gt; wrote:</div><div>&gt=
;</div><div>&gt; On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purdie</d=
iv><div>&gt; &lt;richard.purdie=40linuxfoundation.org&gt; wrote:</div><di=
v>&gt; &gt;</div><div>&gt; &gt; On Sun, 2023-08-06 at 13:15 -0600, Joshua=
 Watt wrote:</div><div>&gt; &gt; &gt; On Sat, Aug 5, 2023 at 7:54=E2=80=AF=
PM Maksim Chichikalov</div><div>&gt; &gt; &gt; &lt;max.chichikalov=40gmai=
l.com&gt; wrote:</div><div>&gt; &gt; &gt; &gt; My name is Max; nice to e-=
meet you. I need your help with</div><div>&gt; &gt; &gt; &gt; Equivalence=
 Server :)</div><div>&gt; &gt; &gt; &gt; I watched your presentation on Y=
outube - it 100% helped me to</div><div>&gt; &gt; &gt; &gt; understand th=
e logic better and debug the issue we are facing.</div><div>&gt; &gt; &gt=
; &gt; Thank you for all your input into OE development.</div><div>&gt; &=
gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; I found in OE repo that you i=
ntroduced =22def OEOuthashBasic()=22, so I</div><div>&gt; &gt; &gt; &gt; =
decided to write to you first before opening the topic on an email</div><=
div>&gt; &gt; &gt; &gt; list.</div><div>&gt; &gt; &gt; &gt;</div><div>&gt=
; &gt; &gt; &gt; The problem:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt=
; &gt; &gt; &gt; Input data are propagated to the output hash generation =
function,</div><div>&gt; &gt; &gt; &gt; which generates a different out-h=
ash.</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; Descript=
ion:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; All =22=5F=
git.bb=22 recipes have to append SRCPV to PV. As a result, PV</div><div>&=
gt; &gt; &gt; &gt; is different on each commit.</div><div>&gt; &gt; &gt; =
&gt;</div><div>&gt; &gt; &gt; &gt; The OEOuthashBasic function includes S=
STATE=5FPKGSPEC to generate</div><div>&gt; &gt; &gt; &gt; hash, which con=
tains PV (PV contains git hash). As a result, there</div><div>&gt; &gt; &=
gt; &gt; is no way to generate the same out-hash even if changes introduc=
ed</div><div>&gt; &gt; &gt; &gt; within a commit were trivial.</div><div>=
&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; Rig=
ht, this is sort of on purpose, because the hash equivalence is</div><div=
>&gt; &gt; &gt; basically trying to say that an sstate object can be used=
 in place of</div><div>&gt; &gt; &gt; another one, even when the task has=
hes aren't the same (but the</div><div>&gt; &gt; &gt; output hashes are).=
 However, the sstate code itself will only look</div><div>&gt; &gt; &gt; =
for sstate object with a certain name (which include PV); hash</div><div>=
&gt; &gt; &gt; equivalency does have =5Fsome=5F control over the file nam=
e sstate looks</div><div>&gt; &gt; &gt; for, since it will replace the ta=
skhash portion of the name with the</div><div>&gt; &gt; &gt; unified hash=
, but it doesn't have complete control.</div><div>&gt; &gt; &gt;</div><di=
v>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; In our codebase, our =
components have API part, which is managed by</div><div>&gt; &gt; &gt; &g=
t; an independent recipe per component. The described above problem</div>=
<div>&gt; &gt; &gt; &gt; caused the recompilation of all components depen=
dent on API, even</div><div>&gt; &gt; &gt; &gt; in cases when API was not=
 changed. CI for pull requests recompiles</div><div>&gt; &gt; &gt; &gt; m=
ostly the entire code base, I need to do something with it.</div><div>&gt=
; &gt; &gt; &gt; (sorry, quite hard for me to explain it in a nutshell, l=
et me know</div><div>&gt; &gt; &gt; &gt; if you like to know slightly mor=
e details)</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt;</div><d=
iv>&gt; &gt; &gt; Ya, sounds like a typical mono-repo design=3F</div><div=
>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &g=
t; I see a couple of options for us:</div><div>&gt; &gt; &gt; &gt; * Add =
a custom implementation of out-hash generated function and</div><div>&gt;=
 &gt; &gt; &gt; overwrite SSTATE=5FHASHEQUIV=5FMETHOD.</div><div>&gt; &gt=
; &gt; &gt; * Better understand why it's mandatory to append SRCPV to PV,=
 and</div><div>&gt; &gt; &gt; &gt; maybe it's flexible in our cases to do=
 it.</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt;</div><div>&gt=
; &gt; &gt; This might be the best option, at least for your recipes, but=
 I've</div><div>&gt; &gt; &gt; CC'd the list for additional feedback</div=
><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; * Propose a patch to f=
ix OEOuthashBasic().</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &g=
t; &gt; In my humble opinion, the commit's hash shouldn't be included in<=
/div><div>&gt; &gt; &gt; &gt; out-hash generation, it doesn't make sense.=
 Unless I'm missing</div><div>&gt; &gt; &gt; &gt; something important - W=
hat are your thoughts=3F</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt=
; &gt;</div><div>&gt; &gt; &gt; Yes and no. It's not intentional, but a s=
ide effect of hash</div><div>&gt; &gt; &gt; equivalency trying to make su=
re that the things it's marking as</div><div>&gt; &gt; &gt; equivalent ca=
n actually be found in sstate (basically, because sstate</div><div>&gt; &=
gt; &gt; include the commit hash, hash equivalency kinda has to include i=
t).</div><div>&gt; &gt;</div><div>&gt; &gt; This all sounds a bit unfortu=
nate.</div><div>&gt; &gt;</div><div>&gt; &gt; sstate only works as long a=
s the filenames are predictable. Some</div><div>&gt; &gt; elements of the=
 sstate filenames are essential to operation, e.g. the</div><div>&gt; &gt=
; package architecture since one input would result in multiple files</di=
v><div>&gt; &gt; with the same hash in the filename of the output otherwi=
se. The recipe</div><div>&gt; &gt; name and version are there mainly for =
debugging to allow someone to</div><div>&gt; &gt; more easily know where =
an sstate object came from and what it</div><div>&gt; &gt; represents. Th=
is is summarised by the comment in sstate.bbclass =22=46ields</div><div>&=
gt; &gt; 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for inform=
ation=22</div><div>&gt; &gt; in generate=5Fsstatefn().</div><div>&gt; &gt=
;</div><div>&gt; &gt; When we added hash equivalence, we added the abilit=
y to equate the</div><div>&gt; &gt; hashes but we'd not considered that t=
he version string mismatch may</div><div>&gt; &gt; stop significant artef=
act reuse. I suspect at the time we reasoned that</div><div>&gt; &gt; if =
the version changes, the output probably does too.</div><div>&gt; &gt;</d=
iv><div>&gt; &gt; Sadly fixing this isn't simple. Changing the hash algor=
ithm isn't</div><div>&gt; &gt; enough, we need to stop the SRCREV part of=
 PV being used in the sstate</div><div>&gt; &gt; filename. If we stop tha=
t happening, the output hash algorithm may well</div><div>&gt; &gt; =22ju=
st work=22 at that point, I'm not sure if it directly encodes PV or</div>=
<div>&gt; &gt; just the sstate filename, hopefully the latter.</div><div>=
&gt;</div><div>&gt; It's including SSTATE=5FPKGSPEC in the output hash ca=
lculation,</div><div>&gt; specifically so that a change in sstate filenam=
e changes the outhash</div><div>&gt; (that way, hash equivalence will nev=
er map two difference sstate files</div><div>&gt; as equivalent).</div><d=
iv>&gt;</div><div>&gt; &gt;</div><div>&gt; &gt; The hard part is how to d=
o this generically without adding a lot of</div><div>&gt; &gt; complex an=
d potentially fragile code. The datastore context in that</div><div>&gt; =
&gt; function is the core configuration, not the recipe's datastore. The<=
/div><div>&gt; &gt; options I can think of offhand:</div><div>&gt; &gt;</=
div><div>&gt; &gt; a) Live with the issue</div><div>&gt; &gt;</div><div>&=
gt; &gt; b) Put a hack into generate=5Fsstatefn() which changed the PV el=
ement if</div><div>&gt; &gt; it matched a pattern but we'd have to do thi=
s for each SCM as needed.</div><div>&gt; &gt; Ugly but lowest overhead.</=
div><div>&gt; &gt;</div><div>&gt; &gt; c) Indirect PV to SSTATEPV (or sim=
ilar) and then alter SSTATEPV to drop</div><div>&gt; &gt; SRCPV to a fixe=
d string. Nicer code in some ways but horrible</div><div>&gt; &gt; parsin=
g/performance overhead since every recipe, even non-SCM ones</div><div>&g=
t; &gt; would be affected.</div><div>&gt; &gt;</div><div>&gt; &gt; d) A p=
artial version of c) where recipes can set SSTATEPV to a function</div><d=
iv>&gt; &gt; if they need it. Solves your specific case with overhead wit=
hout</div><div>&gt; &gt; affecting everyone else. Would not solve the iss=
ue generally without</div><div>&gt; &gt; manual user intervention.</div><=
div>&gt; &gt;</div><div>&gt; &gt; I'm not sure which of these will end up=
 making the most sense. These</div><div>&gt; &gt; assume the output hash =
code uses the sstate filename and not PV. If it</div><div>&gt; &gt; uses =
PV there would be more work needed.</div><div>&gt;</div><div>&gt; I'm not=
 seeing where SRCPV or SRCREV are being explicitly added to</div><div>&gt=
; SSTATE=5FPKGSPEC; PV is added, but SRCPV or SRCREV would have to be</di=
v><div>&gt; manually added to PV in the recipe itself for that to happen =
correct=3F</div><div>&gt; Maybe it's as simple as not doing that in these=
 particular recipes=3F</div><div>&gt;</div><div>&gt;</div><div>&gt; What =
are pitfalls of not adding SRCPV to PV for packages with SRCREV:=24=7BPN=7D=
 =3D =24=7BAUTOREV=7D=3F Is it recommended just for improving traceabilit=
y and debugging=3F</div><div>&gt;</div><div>&gt; When I remove, bitbake i=
s not happy - for example: if I remove explicit addition of SRCPV, the bi=
tbake throws the following exception (need to dig deeper tp figure out wh=
y it happens only for certain packages)</div><div>&gt;</div><div>&gt; rai=
se bb.fetch2.=46etchError(=22Recipe uses a floating tag/branch without a =
fixed SRCREV yet doesn't call bb.fetch2.get=5Fsrcrev() (use SRCPV in PV f=
or OE).=22)</div><br><div>Ah, I didn't realize you were using AUTOREV; I =
would recommend not</div><div>doing that and instead manually specifying =
the SRCREV you want to</div><div>build from instead; aside from giving a =
more reproducible history, I</div><div>think it means you can remove SRCP=
V from PV and hash equivalency will</div><div>work</div><br><div>At my =24=
DAYJOB, we don't use AUTOREV. Instead, we have a (rather dumb)</div><div>=
script that makes a commit to update the SRCREV to match the current</div=
><div>head revision of the BRANCH specified in a recipe. We run this ever=
y</div><div>night for recipes where we want AUTOREV-like behavior. Upstre=
am also</div><div>has the Auto-Upgrade-Helper (AUH) that does something s=
imilar if you</div><div>want to look at that too.</div></div></blockquote=
><div><br><div>TY Joshua=21</div><div>AUTOREV is in use for pull request =
builds, when a package(s -&gt; multi PR builds) should be built from the =
latest commit of the specific branch. I don't think we can stop using it,=
 unless we add some mechanism of setting SRCREV to hash of the latest com=
mit on each build invocation.</div><br><div>Richard, what are your though=
ts about:</div><ul><li><div>What are pitfalls of not adding SRCPV to PV f=
or packages with SRCREV:=24=7BPN=7D =3D =24=7BAUTOREV=7D=3F</div></li><li=
><div>Is it recommended just for improving traceability and debugging, or=
 it has some bitabke/OE business logic implication=3F</div></li></ul><div=
>BR,</div><div>Max Chichikalov</div><br><div>&gt;</div><div>&gt; BR,</div=
><div>&gt; Max Chichikalov</div><div>&gt;</div><div>&gt; &gt;</div><div>&=
gt; &gt; Cheers,</div><div>&gt; &gt;</div><div>&gt; &gt; Richard</div><di=
v>&gt;</div></div>
--64d10e1e_11632f0b_80507--


