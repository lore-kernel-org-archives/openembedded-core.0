Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA2AC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:11:17 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.88810.1749567387967914575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HyZUN1EN;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: mimoghosh9@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2cc82edcf49so1689697fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749567387; x=1750172187; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GkPVtK86EZWX/1mW1mnFm60IDuUUN2zFoliN+4NCjP8=;
        b=HyZUN1ENAyiChO3qfQZ/jHrg+paPbalmDg6OUFEe0t+KeHe9l3gw7Im6+LyU30ipFf
         tbGI5gw95Skg6wn8uHqKrNXF/FnHxJ5kI6qoum5vxOtTcipEn773xRBANhEuA5PijPje
         69FMCyvArW/sD5CvmKfWz+dho569BqN3dMhewzzicJhdtNRzcjKCFCsT9uBf7836VHPn
         KrDuEfPi9yyOMz5hC0uwLREvJbocXiooNYIAk5ANJFVIgf+/ULdSo6y1CMQeVt9jnVR/
         z4brAMnEy4lIPNn561C8rlxPv49V9rON3RfJHNusBjyEkaN4xqX/iXlS6gZMLQ68v7Re
         VcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749567387; x=1750172187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkPVtK86EZWX/1mW1mnFm60IDuUUN2zFoliN+4NCjP8=;
        b=d8JDst8park+f35W4NmFmGtXIVYTKiDTY0yPhke5qtlepBiBFx+N52dGJluMYv2asp
         M0VzMD4g21aWCjhuhhxZNpMCX1u7Mhn7gjqePze57dKbuTLb5kESPIUp3tZc4W8ONAMj
         2msKu+ZooRD8oMyq2chH7sPQuBfVlhsVSJEbMCH761a/KKRQGGy1TQHKGBdrQv5vWWAE
         lyVulDYtDFGr2P5AqXFWNropWV85WFwgQtowBbR+Lk4HiPIBScwrY+ThxztTOqBuqGsj
         YTcpcQY4KmrBgRu65rc+HiRymsHLRG+E0GWSXfOPfU4AGTqGL7b4ilnNMpEPHpOErWAe
         JRxw==
X-Forwarded-Encrypted: i=1; AJvYcCWNbwJLmvUam2gqVUDEFeXTzTZf4LzgPevd5E1dsxFH40OY6KOUExiR5jrZn9n8n678lVnZCcvCelly9RQYuQAd7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpKbpLvh7J5aztXhqPHWq1DvB2sp0eHpyt3yvk0UvYyqdNkwMq
	t0/n4Ne9TKrrCfY6tHX47sQ/sabcRkzwc+EWnjaN3yIo5UBh1vrewP+Nwmbv75m/GyvT8tIBhAF
	57+fMw7szMtuhrLkZ+yOs5znOZTHcefg=
X-Gm-Gg: ASbGncuXCRRJivJqWBfGCPE6YJRJczhjwv5v1w5Y03Na/Op//ujocifiPKdE3gQ4Qdx
	ZYRRmN9Z7RaQ/nh6t1OqGkiiajdl2pvuXoOd9rLvuq3q+8Qj6CjGraBbngggJlPemcwXzGDZnez
	KO4BYJkHYg6T+wYUZ9jOHKgvrWsrmpZz101MKPzsBZ0dKzAGzojGODwQ1X7Mj6A88dA23N9JEeM
	5PRfQ==
X-Google-Smtp-Source: AGHT+IF7ZayGgT1MEe9AvGDaOYZ6Y6LT5gMnw/nK86HAlibOkeu5tYrxs7EJ/V1doUEtCoOIRuCKSFWbTrbK0IXHVDA=
X-Received: by 2002:a05:6870:a78d:b0:2e9:1fae:4aef with SMTP id
 586e51a60fabf-2ea007c18abmr9466513fac.13.1749567386834; Tue, 10 Jun 2025
 07:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb-PRoA1biG6PA_hX_RndM9QqG7G_7ikYFUZE3goEaP-_Q@mail.gmail.com>
 <8ce48df3-b8a2-4b95-96df-bf0fc1ac1eaa@gmail.com>
In-Reply-To: <8ce48df3-b8a2-4b95-96df-bf0fc1ac1eaa@gmail.com>
From: Mimo Ghosh <mimoghosh9@gmail.com>
Date: Tue, 10 Jun 2025 20:26:13 +0530
X-Gm-Features: AX0GCFtzx2zVy5ZTuAcZSlb9oMZjf8bu79OH9OrfuHt04iaM0-eetxOBRJXQjxA
Message-ID: <CAOKCUoUsLb_u1KmP3sWOx5q_cOmj62W6sx+BJVp6TbGV4Mf1kA@mail.gmail.com>
Subject: Re: [yocto] Yocto Project Status 10 June. 2025 (WW23)
To: yocto@lists.yoctoproject.org, skandigraun@gmail.com
Cc: sjolley.yp.pm@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009a5d6e063738e67e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218358

--0000000000009a5d6e063738e67e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why am getting those mail not sure. Which is not related to my queries.
Unexpectedly getting those. I was registered to get help. But it is
diverting to another way... Fuck of those silly sitts thing..... looking
for unsubscribe....

On Tue, 10 Jun 2025, 20:16 Gyorgy Sarvari via lists.yoctoproject.org,
<skandigraun=3Dgmail.com@lists.yoctoproject.org> wrote:

> On 6/10/25 16:40, Stephen Jolley via lists.yoctoproject.org wrote:
> >
> > Current Dev Position: YP 5.3 M1
> >
> > Next Deadline: YP 5.3 M1 Build date 2025-06-09
> >
> >
> > Next Team Meetings:
> >
> >  *
> >
> >     Bug Triage meeting - Thursday June 12th 7:30 am PDT
> >     (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09
> >     <https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09=
>)
> >
> >  *
> >
> >     Weekly Project Engineering Sync  - Tuesday June 10th 8 am PDT
> >     (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
> >     <https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09=
>)
> >     <https://zoom.us/j/990892712>
> >
> >  *
> >
> >     Yocto Project Patch Review - Thursday June 12th 10am GMT and
> >     Monday June 16th 9am PDT
> >     (https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4E=
b.1
> >     <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb=
.1
> >)
> >
> >
> > Project data dashboard: https://dashboard.yoctoproject.org/
> > <https://dashboard.yoctoproject.org/>
> >
> >
> > Key Status/Updates:
> >
> >  *
> >
> >     YP 4.0.27 and YP 5.2.1 were released.
> >
> >  *
> >
> >     YP 5.0.10 is due to be released.
> >
> >  *
> >
> >     YP 5.3 M1 is now due to build
> >
> >  *
> >
> >     Patches continue to merge into master for upgrades and fixes.
> >
> >  *
> >
> >     The clang build time and size increases continue to cause
> >     significant concern.
> >
>
> Is there more info available on this somewhere? I'd be interested if
> there are any concrete recipes/configurations where this is showing
> prominently and could be used as a benchmark. Or is it more like an
> overall "lot of small things add up to a big one" issue?
>
> >  *
> >
> >     Patches for changing the workdir layout for unpack have been
> >     proposed with potentially significant impact for git based
> >     recipes. Feedback/review is welcome.
> >
> >  *
> >
> >     Network access outside of do_fetch now causes yocto-check-layer to
> >     fail which is a new change/requirement for Yocto Compatible v3. We
> >     need to work out how to handle this for go recipes in particular
> >     in meta-openembedded.
> >
> >  *
> >
> >     Patches were sent out for a proposed toolchain selection mechanism
> >     implementation, feedback/review is welcome.
> >
> >  *
> >
> >     Icecc.bbclass was removed.
> >
> >  *
> >
> >     lz4 was removed from HOSTTOOLS as it was unneeded.
> >
> >  *
> >
> >     Fitimage restructuring was merged, thanks Adrian.
> >
> >  *
> >
> >     The project has switched to a different CDN setup with a different
> >     URL. This is proving reliable on the autobuilder so far, huge
> >     thanks to Michael Halstead for working on this.
> >
> >
> > Ways to contribute:
> >
> >  *
> >
> >     As people are likely aware, the project has a number of components
> >     which are either unmaintained, or have people with little to no
> >     time trying to keep them alive. These components include: devtool,
> >     toaster, wic, oeqa, autobuilder, CROPs containers, pseudo and
> >     more. Many have open bugs. Help is welcome in trying to better
> >     look after these components!
> >
> >  *
> >
> >     There is an issue open upstream with the openssl project related
> >     to making path relocation of openssl easier (as used in our
> >     buildtools tarball and SDK). We=E2=80=99d love assistance in moving=
 this
> >     forward and getting some kind of upstream feature merged to make
> >     this easier: https://github.com/openssl/openssl/pull/19260
> >     <https://github.com/openssl/openssl/pull/19260>
> >
> >  *
> >
> >     There are bugs identified as possible for newcomers to the
> >     project:
> >     https://dashboard.yoctoproject.org/bugtriage/#newcomer-container
> >     <https://dashboard.yoctoproject.org/bugtriage/#newcomer-container>
> >
> >  *
> >
> >     There are bugs that are currently unassigned for YP 5.3. See:
> >
> https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.3_Unassigned_Enha=
ncements/Bugs
> >     <
> https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.3_Unassigned_Enha=
ncements/Bugs
> >
> >
> >  *
> >
> >     We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please=
 see
> >     the list at:
> >
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/m=
aintainers.inc
> >     <
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/m=
aintainers.inc
> >and
> >     discuss with the existing maintainer, or ask on the OE-Core
> >     mailing list. We will likely move a chunk of these to =E2=80=9CUnas=
signed=E2=80=9D
> >     soon to help facilitate this.
> >
> >  *
> >
> >     Help is very much welcome in trying to resolve our autobuilder
> >     intermittent issues. You can see the list of failures we=E2=80=99re
> >     continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag=
 in bugzilla:
> >     https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT
> >     <https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT=
>.
> >
> >  *
> >
> >     Help us resolve CVE issues: CVE metrics
> >     <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
> >
> >  *
> >
> >     We have a growing number of bugs in bugzilla, any help with them
> >     is appreciated.
> >
> >  *
> >
> >     Regarding bugs, even if you can=E2=80=99t fix a bug, submitting a f=
ailing
> >     test case that can reproduce the issue significantly improves the
> >     chances it might get fixed.
> >
> >  *
> >
> >     Further help on optimizing build disk usage would be most welcome.
> >
> >  *
> >
> >     Ongoing project development plans are being developed in this
> >     document:
> >
> https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4r=
jD830A/edit?usp=3Dsharing
> >     <
> https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4r=
jD830A/edit?usp=3Dsharing
> >
> >
> > We need to continue to develop this as it will allow us to potentially
> > find ways to fund specific work items.
> >
> >
> > Tracking Metrics:
> >
> >  *
> >
> >     WDD 2740 (last week 2778)
> >     (https://wiki.yoctoproject.org/charts/combo.html
> >     <https://wiki.yoctoproject.org/charts/combo.html>)
> >
> >  *
> >
> >     OE-Core/Poky Patch Metrics
> >
> >      o
> >
> >         Total patches found: 1089 (last week 1089)
> >
> >      o
> >
> >         Patches in the Pending State: 157 (14%) [last week 157 (14%)]
> >
> >      o
> >
> >         https://autobuilder.yocto.io/pub/non-release/patchmetrics/
> >         <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
> >
> >
> > YP 5.3 Milestone Dates:
> >
> >  *
> >
> >     YP 5.3 M1 Build Date 2025-06-09
> >
> >  *
> >
> >     YP 5.3 M1 Release Date 2025-06-20
> >
> >  *
> >
> >     YP 5.3 M2 Build Date 2025-07-21
> >
> >  *
> >
> >     YP 5.3 M2 Release Date 2025-08-01
> >
> >  *
> >
> >     YP 5.3 M3 Build Date 2025-09-01
> >
> >  *
> >
> >     YP 5.3 M3 Release Date 2025-09-12
> >
> >  *
> >
> >     YP 5.3 M4 Build Date 2025-10-06
> >
> >  *
> >
> >     YP 5.3 M4 Release Date 2025-10-31
> >
> >
> > Upcoming dot releases:.
> >
> >  *
> >
> >     YP 4.0.27 was released.
> >
> >  *
> >
> >     YP 5.2.1 was released.
> >
> >  *
> >
> >     YP 5.0.10  is ready for release.
> >
> >  *
> >
> >     YP 4.0.28 Build Date 2025-06-30
> >
> >  *
> >
> >     YP 4.0.28 Release Date 2025-07-11
> >
> >  *
> >
> >     YP 5.2.2 Build Date 2025-07-07
> >
> >  *
> >
> >     YP 5.2.2 Release Date 2025-07-18
> >
> >  *
> >
> >     YP 5.0.11 Build Date 2025-07-14
> >
> >  *
> >
> >     YP 5.0.11 Release Date 2025-07-25
> >
> >  *
> >
> >     YP 4.0.29 Build Date 2025-08-11
> >
> >  *
> >
> >     YP 4.0.29 Release Date 2025-08-25
> >
> >  *
> >
> >     YP 5.2.3 Build Date 2025-08-18
> >
> >  *
> >
> >     YP 5.2.3 Release Date 2025-08-29
> >
> >  *
> >
> >     YP 5.0.12 Build Date 2025-08-25
> >
> >  *
> >
> >     YP 5.0.12 Release Date 2025-09-05
> >
> >  *
> >
> >     YP 4.0.30 Build Date 2025-09-22
> >
> >  *
> >
> >     YP 4.0.30 Release Date 2025-10-03
> >
> >  *
> >
> >     YP 5.2.4 Build Date 2025-09-29
> >
> >  *
> >
> >     YP 5.2.4 Release Date 2025-10-10
> >
> >  *
> >
> >     YP 5.0.13 Build Date 2025-10-13
> >
> >  *
> >
> >     YP 5.0.13 Release Date 2025-10-24
> >
> >  *
> >
> >     YP 4.0.31 Build Date 2025-11-03
> >
> >  *
> >
> >     YP 4.031 Release Date 2025-11-14
> >
> >  *
> >
> >     YP 5.0.14 Build Date 2025-11-17
> >
> >  *
> >
> >     YP 5.0.14 Release Date 2025-11-28
> >
> >  *
> >
> >     YP 4.0.32 Build Date 2025-12-15
> >
> >  *
> >
> >     YP 4.0.32 Release Date 2025-12-24
> >
> >  *
> >
> >     YP 5.0.15 Build Date 2026-01-05
> >
> >  *
> >
> >     YP 5.0.15 Release Date 2026-01-16
> >
> >
> > The Yocto Project=E2=80=99s technical governance is through its Technic=
al
> > Steering Committee, more information is available at:
> >
> > https://wiki.yoctoproject.org/wiki/TSC
> > <https://wiki.yoctoproject.org/wiki/TSC>
> >
> >
> > The Status reports are now stored on the wiki at:
> > https://wiki.yoctoproject.org/wiki/Weekly_Status
> > <https://wiki.yoctoproject.org/wiki/Weekly_Status>
> >
> >
> > [If anyone has suggestions for other information you=E2=80=99d like to =
see on
> > this weekly status update, let us know!]
> >
> >
> > Thanks,
> >
> >
> >
> > */Stephen K. Jolley/*
> >
> > *Yocto Project Program Manager*
> >
> > (    *Cell*:                (208) 244-4460
> >
> > * *Email*:                 _s
> > <mailto:stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com_
> >
> >
> >
> >
>
>
>=20
>
>

--0000000000009a5d6e063738e67e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why am getting those mail not sure. Which is not related =
to my queries.=C2=A0<div dir=3D"auto">Unexpectedly getting those. I was reg=
istered to get help. But it is diverting to another way... Fuck of those si=
lly sitts thing..... looking for unsubscribe....</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, 10 Jun 2025, 20:16 Gyorgy Sarvari via <a href=3D"http://lists.yoc=
toproject.org">lists.yoctoproject.org</a>, &lt;skandigraun=3D<a href=3D"mai=
lto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 6/10/25 16:40, Stephe=
n Jolley via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer no=
referrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt;<br>
&gt; Current Dev Position: YP 5.3 M1<br>
&gt;<br>
&gt; Next Deadline: YP 5.3 M1 Build date 2025-06-09<br>
&gt;<br>
&gt;<br>
&gt; Next Team Meetings:<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug Triage meeting - Thursday June 12th 7:30 am PDT=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa=
2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://zoom.us/j/454367603?pwd=3DZG=
xoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</a>=
&gt;)<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Weekly Project Engineering Sync=C2=A0 - Tuesday Jun=
e 10th 8 am PDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1M=
jhoM2x6ck81bkcrYjRrcmJsUT09" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://zoom.us/j/990892712?pwd=3DcH=
U1MjhoM2x6ck81bkcrYjRrcmJsUT09" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</a>=
&gt;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://zoom.us/j/990892712" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://zoom.us/j/990892712</a>&gt=
;<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Yocto Project Patch Review - Thursday June 12th 10a=
m GMT and<br>
&gt;=C2=A0 =C2=A0 =C2=A0Monday June 16th 9am PDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://zoom.us/j/97762397148?pwd=3D1xk=
0iC9hp9SjEonaTaONwTb6iWry4Eb.1" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://zoom.us/j/97762397148?pwd=3D=
1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1=
</a>&gt;)<br>
&gt;<br>
&gt;<br>
&gt; Project data dashboard: <a href=3D"https://dashboard.yoctoproject.org/=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://dashboard.yoctopr=
oject.org/</a><br>
&gt; &lt;<a href=3D"https://dashboard.yoctoproject.org/" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://dashboard.yoctoproject.org/</a>&gt;=
=C2=A0<br>
&gt;<br>
&gt;<br>
&gt; Key Status/Updates:<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.27 and YP 5.2.1 were released.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.10 is due to be released.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M1 is now due to build<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Patches continue to merge into master for upgrades =
and fixes.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The clang build time and size increases continue to=
 cause<br>
&gt;=C2=A0 =C2=A0 =C2=A0significant concern.<br>
&gt;<br>
<br>
Is there more info available on this somewhere? I&#39;d be interested if<br=
>
there are any concrete recipes/configurations where this is showing<br>
prominently and could be used as a benchmark. Or is it more like an<br>
overall &quot;lot of small things add up to a big one&quot; issue?<br>
<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Patches for changing the workdir layout for unpack =
have been<br>
&gt;=C2=A0 =C2=A0 =C2=A0proposed with potentially significant impact for gi=
t based<br>
&gt;=C2=A0 =C2=A0 =C2=A0recipes. Feedback/review is welcome.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Network access outside of do_fetch now causes yocto=
-check-layer to<br>
&gt;=C2=A0 =C2=A0 =C2=A0fail which is a new change/requirement for Yocto Co=
mpatible v3. We<br>
&gt;=C2=A0 =C2=A0 =C2=A0need to work out how to handle this for go recipes =
in particular<br>
&gt;=C2=A0 =C2=A0 =C2=A0in meta-openembedded.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Patches were sent out for a proposed toolchain sele=
ction mechanism<br>
&gt;=C2=A0 =C2=A0 =C2=A0implementation, feedback/review is welcome.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Icecc.bbclass was removed.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0lz4 was removed from HOSTTOOLS as it was unneeded.<=
br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Fitimage restructuring was merged, thanks Adrian.<b=
r>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The project has switched to a different CDN setup w=
ith a different<br>
&gt;=C2=A0 =C2=A0 =C2=A0URL. This is proving reliable on the autobuilder so=
 far, huge<br>
&gt;=C2=A0 =C2=A0 =C2=A0thanks to Michael Halstead for working on this.<br>
&gt;<br>
&gt;<br>
&gt; Ways to contribute:<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0As people are likely aware, the project has a numbe=
r of components<br>
&gt;=C2=A0 =C2=A0 =C2=A0which are either unmaintained, or have people with =
little to no<br>
&gt;=C2=A0 =C2=A0 =C2=A0time trying to keep them alive. These components in=
clude: devtool,<br>
&gt;=C2=A0 =C2=A0 =C2=A0toaster, wic, oeqa, autobuilder, CROPs containers, =
pseudo and<br>
&gt;=C2=A0 =C2=A0 =C2=A0more. Many have open bugs. Help is welcome in tryin=
g to better<br>
&gt;=C2=A0 =C2=A0 =C2=A0look after these components!<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0There is an issue open upstream with the openssl pr=
oject related<br>
&gt;=C2=A0 =C2=A0 =C2=A0to making path relocation of openssl easier (as use=
d in our<br>
&gt;=C2=A0 =C2=A0 =C2=A0buildtools tarball and SDK). We=E2=80=99d love assi=
stance in moving this<br>
&gt;=C2=A0 =C2=A0 =C2=A0forward and getting some kind of upstream feature m=
erged to make<br>
&gt;=C2=A0 =C2=A0 =C2=A0this easier: <a href=3D"https://github.com/openssl/=
openssl/pull/19260" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/openssl/openssl/pull/19260</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/openssl/openssl/p=
ull/19260" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/openssl/openssl/pull/19260</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0There are bugs identified as possible for newcomers=
 to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0project:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://dashboard.yoctoproject.org/bugtr=
iage/#newcomer-container" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://dashboard.yoctoproject.org/bugtriage/#newcomer-container</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://dashboard.yoctoproject.org/b=
ugtriage/#newcomer-container" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://dashboard.yoctoproject.org/bugtriage/#newcomer-container</a>&gt;=
<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0There are bugs that are currently unassigned for YP=
 5.3. See:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://wiki.yoctoproject.org/wiki/Bug_T=
riage#Medium+_5.3_Unassigned_Enhancements/Bugs" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_=
5.3_Unassigned_Enhancements/Bugs</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.yoctoproject.org/wiki/B=
ug_Triage#Medium+_5.3_Unassigned_Enhancements/Bugs" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medi=
um+_5.3_Unassigned_Enhancements/Bugs</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0We=E2=80=99d welcome new maintainers for recipes in=
 OE-Core. Please see<br>
&gt;=C2=A0 =C2=A0 =C2=A0the list at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/pok=
y/tree/meta/conf/distro/include/maintainers.inc" rel=3D"noreferrer noreferr=
er" target=3D"_blank">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/c=
onf/distro/include/maintainers.inc</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://git.yoctoproject.org/cgit.cgi=
/poky/tree/meta/conf/distro/include/maintainers.inc" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">http://git.yoctoproject.org/cgit.cgi/poky/tree/me=
ta/conf/distro/include/maintainers.inc</a>&gt;and<br>
&gt;=C2=A0 =C2=A0 =C2=A0discuss with the existing maintainer, or ask on the=
 OE-Core<br>
&gt;=C2=A0 =C2=A0 =C2=A0mailing list. We will likely move a chunk of these =
to =E2=80=9CUnassigned=E2=80=9D<br>
&gt;=C2=A0 =C2=A0 =C2=A0soon to help facilitate this.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Help is very much welcome in trying to resolve our =
autobuilder<br>
&gt;=C2=A0 =C2=A0 =C2=A0intermittent issues. You can see the list of failur=
es we=E2=80=99re<br>
&gt;=C2=A0 =C2=A0 =C2=A0continuing to see by searching for the =E2=80=9CAB-=
INT=E2=80=9D tag in bugzilla:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://bugzilla.yoctoproject.org/buglis=
t.cgi?quicksearch=3DAB-INT" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugzilla.yoctoproject.org/bu=
glist.cgi?quicksearch=3DAB-INT" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT</a>=
&gt;.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Help us resolve CVE issues: CVE metrics<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://autobuilder.yocto.io/pub/non=
-release/patchmetrics/" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/non-release/patchmetrics/</a>&gt;=C2=A0<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0We have a growing number of bugs in bugzilla, any h=
elp with them<br>
&gt;=C2=A0 =C2=A0 =C2=A0is appreciated.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Regarding bugs, even if you can=E2=80=99t fix a bug=
, submitting a failing<br>
&gt;=C2=A0 =C2=A0 =C2=A0test case that can reproduce the issue significantl=
y improves the<br>
&gt;=C2=A0 =C2=A0 =C2=A0chances it might get fixed.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Further help on optimizing build disk usage would b=
e most welcome.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Ongoing project development plans are being develop=
ed in this<br>
&gt;=C2=A0 =C2=A0 =C2=A0document:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.google.com/document/d/1xsnN=
_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://docs.google.com/document/d/1xsnN_H=
caMhqg6Dn1P_19AnumDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://docs.google.com/document/d/1=
xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://docs.google.com/document/d/1xs=
nN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing</a>&gt;<br>
&gt;<br>
&gt; We need to continue to develop this as it will allow us to potentially=
<br>
&gt; find ways to fund specific work items.<br>
&gt;<br>
&gt;<br>
&gt; Tracking Metrics:<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0WDD 2740 (last week 2778)<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://wiki.yoctoproject.org/charts/co=
mbo.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.yoct=
oproject.org/charts/combo.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.yoctoproject.org/charts=
/combo.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.y=
octoproject.org/charts/combo.html</a>&gt;)<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0OE-Core/Poky Patch Metrics<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 o<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Total patches found: 1089 (last week =
1089)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 o<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Patches in the Pending State: 157 (14=
%) [last week 157 (14%)]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 o<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://autobuilder.yocto.=
io/pub/non-release/patchmetrics/" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://autobuilder.yocto.io/pub/non-release/patchmetrics/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://autobuilder.yo=
cto.io/pub/non-release/patchmetrics/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://autobuilder.yocto.io/pub/non-release/patchmetrics/</a>&=
gt;<br>
&gt;<br>
&gt;<br>
&gt; YP 5.3 Milestone Dates:<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M1 Build Date 2025-06-09<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M1 Release Date 2025-06-20<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M2 Build Date 2025-07-21<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M2 Release Date 2025-08-01<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M3 Build Date 2025-09-01<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M3 Release Date 2025-09-12<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M4 Build Date 2025-10-06<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.3 M4 Release Date 2025-10-31<br>
&gt;<br>
&gt;<br>
&gt; Upcoming dot releases:.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.27 was released.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.2.1 was released.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.10=C2=A0 is ready for release.<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.28 Build Date 2025-06-30<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.28 Release Date 2025-07-11<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.2.2 Build Date 2025-07-07<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.2.2 Release Date 2025-07-18<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.11 Build Date 2025-07-14<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.11 Release Date 2025-07-25<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.29 Build Date 2025-08-11<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.29 Release Date 2025-08-25<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.2.3 Build Date 2025-08-18<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.2.3 Release Date 2025-08-29<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.12 Build Date 2025-08-25<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.12 Release Date 2025-09-05<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.30 Build Date 2025-09-22<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.30 Release Date 2025-10-03<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.2.4 Build Date 2025-09-29<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.2.4 Release Date 2025-10-10<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.13 Build Date 2025-10-13<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.13 Release Date 2025-10-24<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.31 Build Date 2025-11-03<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.031 Release Date 2025-11-14<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.14 Build Date 2025-11-17<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.14 Release Date 2025-11-28<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.32 Build Date 2025-12-15<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 4.0.32 Release Date 2025-12-24<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.15 Build Date 2026-01-05<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP 5.0.15 Release Date 2026-01-16<br>
&gt;<br>
&gt;<br>
&gt; The Yocto Project=E2=80=99s technical governance is through its Techni=
cal<br>
&gt; Steering Committee, more information is available at:<br>
&gt;<br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/TSC" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/TSC</a><br>
&gt; &lt;<a href=3D"https://wiki.yoctoproject.org/wiki/TSC" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/TSC</a>=
&gt;<br>
&gt;<br>
&gt;<br>
&gt; The Status reports are now stored on the wiki at:<br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/W=
eekly_Status</a><br>
&gt; &lt;<a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/=
wiki/Weekly_Status</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; [If anyone has suggestions for other information you=E2=80=99d like to=
 see on<br>
&gt; this weekly status update, let us know!]<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; =C2=A0<br>
&gt;<br>
&gt; */Stephen K. Jolley/*<br>
&gt;<br>
&gt; *Yocto Project Program Manager*<br>
&gt;<br>
&gt; (=C2=A0=C2=A0=C2=A0=C2=A0*Cell*:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (208) 244-4460<br>
&gt;<br>
&gt; *=C2=A0*Email*:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0_s<br>
&gt; &lt;mailto:<a href=3D"mailto:stephen.k.jolley@intel.com" target=3D"_bl=
ank" rel=3D"noreferrer">stephen.k.jolley@intel.com</a>&gt;jolley.yp.pm@gmai=
l.com_<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009a5d6e063738e67e--

