Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA64C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 15:37:48 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.40963.1741621063534821515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 08:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kQoFaPqF;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2feb91a25bdso6765043a91.1;
        Mon, 10 Mar 2025 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741621063; x=1742225863; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZDG+4EAGIszKcjfLHIq2QL1kpyYYq0ZSgS44ychl4w=;
        b=kQoFaPqFiNzegnwP+YFjbzGZh9bzMejzu+od5bwyhJDlTbDWRVOqwAA+f/YFFPd12t
         /0D9YEBEXlKVhkv5BGUA0ZTdYMwRhleCUIeabwYhi+GzlKUgmEcKNwmPGKr76HijHoIh
         Seo0t/Un8IAMFw5F1Ca++UyJvNajk1VsdQDca0WG0f8U9KvQVInS96a2IaIfNHw3gZLX
         Y6rvJY4A5edsFEKxLx7k5o5igw2zb4pdYl2EvsDFXc6d3UjYxlXpgpFl/KRUUf9wPC9W
         n/5JWIc4K3MHkL1NMAu61VpXL7hzcIzyqz8SDIUHYPKxtMmqV7jKu9PnmjNWMwC4Ushp
         XbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741621063; x=1742225863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZDG+4EAGIszKcjfLHIq2QL1kpyYYq0ZSgS44ychl4w=;
        b=ZMjc28a5wDWr42bYjcF964DWX4ZMEufIFpQZxlBBAzpnWUaW+OGAdzugbnjuWAuQYW
         M8Yi9ytHyU3faPrLs2HdoptAis7SSGVGF/V3iqWKYTaWDa12gKwOQcdbOrIuLWLGwK1Y
         06EqGi6O0lQE9QTrYJ4hmc609iBklMefRBEEwHkUycMqhf0e8SYm596K9FSb7x7XLHZg
         C86l913ps9w/CqE539XEAAK+jkAUqWyFGSFwflqqmy1EOIIjhnfOdW7vfYeLFwNW1rpA
         Ynok+gmWeVDFn2SKjwOyCCyf4nk45LQUuZjRIFmKlqKcheTFTnMedCdW0Oxjv7BorLI1
         qRJA==
X-Forwarded-Encrypted: i=1; AJvYcCUc235sq8rpY4sLzrrVxq0Z2GKgQhaE1QZPSXM7DXXT/WR+k5of5V+Tdke7CGXtLJ/bolR0eRZb+KZ1mNs6P2/5fOnW4X07rtxQ@lists.openembedded.org
X-Gm-Message-State: AOJu0YywFQCF6SZcpqbhwd4wOKTUBuPA4KHGjP9MYXcWEZ8GBffjQXPE
	By3bIHSsvzYYjXhblXq7x1ZHIW359B95JtRG5xXCc13q4ESDwH/KQHKgxcFMU47bsyvdAMNKh+e
	K6Uie+OSEpS3VVjRVmraDuHmQfXxn05Me
X-Gm-Gg: ASbGncuuVEBafnPgrXO0NyZVCitOOpu7MCq67q+MVVnTfzXkbhCDUX6Uelb3MWi/5Wf
	z9A/2VjoivmPAkA6SaRLcCGs7jptPprprspnGl8AZEJit2i2+IC/NwysYmG5RgIkpVBDg1rdMUK
	W0ZTK+dx2OLWnVUdxyy5Ru1kOj4w==
X-Google-Smtp-Source: AGHT+IHasLz7YIpkm0jR+rYAW2TGjpzu4S2by72AoXdlYC26168OfsBdtLgufRW9A9Nh2JP2A+HZeqJI8qNHq8kU3as=
X-Received: by 2002:a17:90b:3c04:b0:2fa:228d:5af2 with SMTP id
 98e67ed59e1d1-300ff10075fmr465207a91.15.1741621062792; Mon, 10 Mar 2025
 08:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <7D6E419E-A7AE-4324-966C-3552C586E452@arm.com>
In-Reply-To: <7D6E419E-A7AE-4324-966C-3552C586E452@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 10 Mar 2025 16:37:31 +0100
X-Gm-Features: AQ5f1Jr9rK78_ySjwJibyCsEDz9-USEV4oxwze1q7iaZNqZH4XhbmQYl83xmjIQ
Message-ID: <CAApg2=RREOt_+L3a2zaQsi4d7KaDo460ERdRmBbginf64PpCMA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Future of CVE scanning in Yocto
To: ross.burton@arm.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c80325062ffec073"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 15:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212531

--000000000000c80325062ffec073
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 3:36=E2=80=AFPM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Hi,
>
> [ this turned into a wall of text, I clearly need to go and buy The Art o=
f
> Explanation.  Feel free to skim down to tl;dr ]
>

Well.. the answer will be also a wall of text...

>
> This isn=E2=80=99t going to be a surprise to anyone who has been keeping =
up with
> the CVE situation, but there=E2=80=99s been problems and changes at NIST =
related to
> the National Vulnerability Database (NVD).  For example, The Register[1]
> had an article last year discussing the almost complete stall of processi=
ng
> new issues, and the NVD news site[2] talks about how they are attempting =
to
> deal with the backlog, but also admits that they=E2=80=99re struggling wi=
th API
> stability and integrating data at an acceptable speed.
>
> Unfortunately, our cve-check class uses the NVD database because at the
> time it was by far the best open solution: it was easily downloaded, the
> data had machine-readable metadata identifying what software was affected
> (called CPEs), and the CPEs were easily updated if they were incorrect by
> just sending an email.  The =E2=80=9Cupstream=E2=80=9D CVE project (cve.o=
rg, ran by
> MITRE) at the time didn=E2=80=99t have a convenient way to batch-download=
 the
> database and didn=E2=80=99t include any CPE information so it wasn=E2=80=
=99t really an
> option.
>
> The end result is that the security reports generated by our cve-check
> class may look reasonable, but they=E2=80=99re missing large numbers of i=
ssues as
> the CPEs are missing for the scanner to work.  Randomly picked example is
> https://nvd.nist.gov/vuln/detail/CVE-2024-53589: the human-readable
> summary says this is an issue in objdump 2.43 but there=E2=80=99s no CPE,=
 so
> cve-check cannot process it.
>
> This is a problem we need to mitigate: the reports _look_ good but the
> reality is unknown.
>

To add more context: it was NVD that was adding CPE data to CVE entries,
and also creating CPE information for projects that didn't have one.
cve-check runs under an assumption that there's CPE identifying the product
for each CVE. The reality is that it isn't the case any longer. The NVD
backlog is more than 20k entries right now, and growing. That is
frustrating: the CVE exists, but if you have one from the backlog,
cve-check won't show it.


>
> The good news is that the CVE Project has been quietly catching up.  The
> database is available in a git repository on GitHub[3] and there=E2=80=99=
s an
> =E2=80=9Cvulnrichment=E2=80=9D program to add more metadata to all future=
 CVEs and
> backfilling it as needed.  This means we=E2=80=99re now in a situation wh=
ere newer
> CVEs often have no CPE in the NVD[4] but have a CPE in the CVE database[5=
],
> as they=E2=80=99re pulling more information from the provider (GitHub in =
the case
> of this specific issue).
>

There are two fields to look into. One is the product/vendor field that is
mandatory (some vendors unfortunately put "n/a" in there) and quite
recently they have added a possibility to add a CPE. With the effort the
CVE programme is putting into this, we can reasonably assume that the
situation is going to improve in the future, at least for new entries.
According to the CVE programme rules, modification of an existing record is
a little more complicated that it was with NVD (it has to be either the
issuer of the entry, or an "ADP" of which there is only one today - CISA).


>
> So there=E2=80=99s an argument to be made that the cve-check class should=
 be
> ported to use the CVE database.  However, the cve-check class itself is
> quite limited because it only runs at build time: there=E2=80=99s no way =
to take
> the output of a build and re-run the security scanner a year later withou=
t
> involving bitbake again.
>
> I believe that, like many things, SPDX3 can help us here.  SPDX3 can
> contain vulnerability information to the extent that it=E2=80=99s simple =
to extract
> it as OpenVEX if that=E2=80=99s the sort of thing you want[6].  Our SPDX =
contains
> for every recipe:
> - All known CPEs
> - Details of issues that are mitigated with CVE_STATUS
> - Details of issues that are mitigated with patches[7]
>

> This means we have a single file that can act as both the image manifest
> and vulnerability list, so with some suitable tooling (using the CVE
> database) that can be used standalone or directly post-build we can have
> security reports at build time or periodically after the build.  This wou=
ld
> then obsolete both the cve-check and vex classes, and associated recipes.
>

From the security person point of view, I think that the ideal solution
would have to have an SBOM with the list of packages and all other
immutable data and the vulnerability information (VEX) separately. The main
reason is that the VEX file will change every day, while the list of
packages won't. There are more and more cases when people ask for signed
SBOMs. Re-signing a modified file is clearly problematic. Also, SPDX (as
all SBOM standards) support a separate VEX file. I also expect people to
have a need to modify the VEX files to take into account specifics of their
board and configuration, for example marking some CVEs are not exploitable
because of the compiler options, configuration options of the package,
kernel hardening etc.

Also, the metadata we need like CVE_STATUS et al, currently do not always
have an existing representation in VEX. VEX standards have been written for
final security analysts who analyze the complete product. They do not cover
certain cases that need to be transitional for the "cve-check" to work
(database error, for example). At least I do not know how to do it. I've
talked with multiple people about this problem and the current solution
they propose is to use custom extensions. This is unfortunate in the case
of composition, but there seems to be no better way.

However, I would really like to have a discussion about the complete view
of usage of SPDX and VEX. If everyone wants only to "cve-check", fine for
me. I see other use cases showing up too. Like a compositional analysis
when it is only a component of a bigger solution and needs to be aggregated
in a bigger "cve-check".


>
> tl;dr:  I propose:
> - For the upcoming (April 2025) release we should add to the release note=
s
> that we=E2=80=99re aware that NVD is struggling, this is what our CVE too=
ling is
> based on, and we=E2=80=99re working on a solution for the October 2025 re=
lease.
>

And swap the source to a different fetcher, like the FKIE. And tell them we
are doing the switch. I've been wondering for months how big a load we
cause to NVD servers.


> - The future of CVE tooling should revolve around SPDX3 SBOMs. If there=
=E2=80=99s
> any missing metadata that isn=E2=80=99t in the SPDX already, we should ad=
d it.
>
We also need to fix the cases when there was no appropriate SPDX generation
when we wrote yocto-vex-check. The most notable case for SPDX2 was the
world build. The dependency graph is also something to look into -
"cve-check" allows rapid generation of CVE data for a world build, as it
doesn't need to do a build. This wasn't the case with SPDX2. A world build
that contains a complete build is well...long. And not necessary to perform
a CVE scan for a set of layers or a distribution.


> - We should ideally find, or alternatively write, a tool that can do
> automated CVE detection sweeps like cve-check does using the CVE Database
> and SPDX3. This tool should be able to be run at both build time inside a
> Yocto build, or on a separate system with just the SPDX as an input.
>

I think that in the time frame of October, the tool will need to merge NVD
and CVE records (or scan runs). The CVE data is improving but it is far
from ideal (see below). To have a reasonably working tool, someone will
have to invest into fixing CVE records, at a way faster pace than NVD is
doing now.


> - Automated tooling is just a piece of the puzzle, but it=E2=80=99s a use=
ful
> piece.  More on that later...
>

I have my opinion on the topic too :)

Kind regards,
Marta

PS. Here's the yocto-vex-check result for the master branch as of this
night. There are a few false positives and I'm looking at the Linux kernel
entries (which usually parse way better).

Issues for package graphene (version 1.10.8):

Unpatched: CVE-2024-1984

Count: 1

Issues for package linux-yocto (version 6.12.13):

Unpatched: CVE-2021-46978 CVE-2021-47089 CVE-2021-47137 CVE-2024-26666
CVE-2024-34027 CVE-2024-35919

Count: 6

Issues for package go-runtime (version 1.24.0):

Unpatched: CVE-2024-24786

Count: 1

Issues for package libsndfile1 (version 1.2.2):

Unpatched: CVE-2024-50613

Count: 1

Issues for package libsoup-2.4 (version 2.74.3):

Unpatched: CVE-2024-52530 CVE-2024-52531 CVE-2024-52532

Count: 3

Issues for package ghostscript (version 10.04.0):

Unpatched: CVE-2024-46951 CVE-2024-46952 CVE-2024-46953 CVE-2024-46954
CVE-2024-46955 CVE-2024-46956

Count: 6

Global issue count: 18

--000000000000c80325062ffec073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 7, =
2025 at 3:36=E2=80=AFPM Ross Burton via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.c=
om@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
[ this turned into a wall of text, I clearly need to go and buy The Art of =
Explanation.=C2=A0 Feel free to skim down to tl;dr ]<br></blockquote><div><=
br></div><div>Well.. the answer will be also a wall of text... <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This isn=E2=80=99t going to be a surprise to anyone who has been keeping up=
 with the CVE situation, but there=E2=80=99s been problems and changes at N=
IST related to the National Vulnerability Database (NVD).=C2=A0 For example=
, The Register[1] had an article last year discussing the almost complete s=
tall of processing new issues, and the NVD news site[2] talks about how the=
y are attempting to deal with the backlog, but also admits that they=E2=80=
=99re struggling with API stability and integrating data at an acceptable s=
peed.<br>
<br>
Unfortunately, our cve-check class uses the NVD database because at the tim=
e it was by far the best open solution: it was easily downloaded, the data =
had machine-readable metadata identifying what software was affected (calle=
d CPEs), and the CPEs were easily updated if they were incorrect by just se=
nding an email.=C2=A0 The =E2=80=9Cupstream=E2=80=9D CVE project (<a href=
=3D"http://cve.org" rel=3D"noreferrer" target=3D"_blank">cve.org</a>, ran b=
y MITRE) at the time didn=E2=80=99t have a convenient way to batch-download=
 the database and didn=E2=80=99t include any CPE information so it wasn=E2=
=80=99t really an option.<br>
<br>
The end result is that the security reports generated by our cve-check clas=
s may look reasonable, but they=E2=80=99re missing large numbers of issues =
as the CPEs are missing for the scanner to work.=C2=A0 Randomly picked exam=
ple is <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-53589" rel=3D"n=
oreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024-5358=
9</a>: the human-readable summary says this is an issue in objdump 2.43 but=
 there=E2=80=99s no CPE, so cve-check cannot process it.<br>
<br>
This is a problem we need to mitigate: the reports _look_ good but the real=
ity is unknown.<br></blockquote><div><br></div><div>To add more context: it=
 was NVD that was adding CPE data to CVE entries, and also creating CPE inf=
ormation for projects that didn&#39;t have one.</div><div>cve-check runs un=
der an assumption that there&#39;s CPE identifying the product for each CVE=
. The reality is that it isn&#39;t the case any longer. The NVD backlog is =
more than 20k entries right now, and growing. That is frustrating: the CVE =
exists, but if you have one from the backlog, cve-check won&#39;t show it.<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
The good news is that the CVE Project has been quietly catching up.=C2=A0 T=
he database is available in a git repository on GitHub[3] and there=E2=80=
=99s an =E2=80=9Cvulnrichment=E2=80=9D program to add more metadata to all =
future CVEs and backfilling it as needed.=C2=A0 This means we=E2=80=99re no=
w in a situation where newer CVEs often have no CPE in the NVD[4] but have =
a CPE in the CVE database[5], as they=E2=80=99re pulling more information f=
rom the provider (GitHub in the case of this specific issue).<br></blockquo=
te><div><br></div><div>There are two fields to look into. One is the produc=
t/vendor field that is mandatory (some vendors unfortunately put &quot;n/a&=
quot; in there) and quite recently they have added a possibility to add a C=
PE. With the effort the CVE programme is putting into this, we can reasonab=
ly assume that the situation is going to improve in the future, at least fo=
r new entries. According to the CVE programme rules, modification of an exi=
sting record is a little more complicated that it was with NVD (it has to b=
e either the issuer of the entry, or an &quot;ADP&quot; of which there is o=
nly one today - CISA).<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
So there=E2=80=99s an argument to be made that the cve-check class should b=
e ported to use the CVE database.=C2=A0 However, the cve-check class itself=
 is quite limited because it only runs at build time: there=E2=80=99s no wa=
y to take the output of a build and re-run the security scanner a year late=
r without involving bitbake again.<br>
<br>
I believe that, like many things, SPDX3 can help us here.=C2=A0 SPDX3 can c=
ontain vulnerability information to the extent that it=E2=80=99s simple to =
extract it as OpenVEX if that=E2=80=99s the sort of thing you want[6].=C2=
=A0 Our SPDX contains for every recipe:<br>
- All known CPEs<br>
- Details of issues that are mitigated with CVE_STATUS<br>
- Details of issues that are mitigated with patches[7] <br></blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This means we have a single file that can act as both the image manifest an=
d vulnerability list, so with some suitable tooling (using the CVE database=
) that can be used standalone or directly post-build we can have security r=
eports at build time or periodically after the build.=C2=A0 This would then=
 obsolete both the cve-check and vex classes, and associated recipes.<br></=
blockquote><div><br></div><div>From the security person point of view, I th=
ink that the ideal solution=20
would have to have an SBOM with the list of packages and all other=20
immutable data and the vulnerability information (VEX) separately. The=20
main reason is that the VEX file will change every day, while the list=20
of packages won&#39;t. There are more and more cases when people ask for=20
signed SBOMs. Re-signing a modified file is clearly problematic. Also,=20
SPDX (as all SBOM standards) support a separate VEX file. I also expect peo=
ple to have a need to modify the VEX files to take into account specifics o=
f their board and configuration, for example marking some CVEs are not expl=
oitable because of the compiler options, configuration options of the packa=
ge, kernel hardening etc.</div><div><br></div><div>Also, the metadata we ne=
ed like CVE_STATUS et al, currently do not always have an existing represen=
tation in VEX. VEX standards have been written for final security analysts =
who analyze the complete product. They do not cover certain cases that need=
 to be transitional for the &quot;cve-check&quot; to work (database error, =
for example). At least I do not know how to do it. I&#39;ve talked with mul=
tiple people about this problem and the current solution they propose is to=
 use custom extensions. This is unfortunate in the case of composition, but=
 there seems to be no better way.<br></div><div><br></div><div>However, I w=
ould really like to have a discussion about the complete view of usage of S=
PDX and VEX. If everyone wants only to &quot;cve-check&quot;, fine for me. =
I see other use cases showing up too. Like a compositional analysis when it=
 is only a component of a bigger solution and needs to be aggregated in a b=
igger &quot;cve-check&quot;.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
tl;dr:=C2=A0 I propose:<br>
- For the upcoming (April 2025) release we should add to the release notes =
that we=E2=80=99re aware that NVD is struggling, this is what our CVE tooli=
ng is based on, and we=E2=80=99re working on a solution for the October 202=
5 release.<br></blockquote><div><br></div><div>And swap the source to a dif=
ferent fetcher, like the FKIE. And tell them we are doing the switch. I&#39=
;ve been wondering for months how big a load we cause to NVD servers.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- The future of CVE tooling should revolve around SPDX3 SBOMs. If there=E2=
=80=99s any missing metadata that isn=E2=80=99t in the SPDX already, we sho=
uld add it.<br></blockquote><div>We also need to fix the cases when there w=
as no appropriate SPDX generation when we wrote yocto-vex-check. The most n=
otable case for SPDX2 was the world build. The dependency graph is also som=
ething to look into - &quot;cve-check&quot; allows rapid generation of CVE =
data for a world build, as it doesn&#39;t need to do a build. This wasn&#39=
;t the case with SPDX2. A world build that contains a complete build is wel=
l...long. And not necessary to perform a CVE scan for a set of layers or a =
distribution.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
- We should ideally find, or alternatively write, a tool that can do automa=
ted CVE detection sweeps like cve-check does using the CVE Database and SPD=
X3. This tool should be able to be run at both build time inside a Yocto bu=
ild, or on a separate system with just the SPDX as an input.<br></blockquot=
e><div><br></div><div>I think that in the time frame of October, the tool w=
ill need to merge NVD and CVE records (or scan runs). The CVE data is impro=
ving but it is far from ideal (see below). To have a reasonably working too=
l, someone will have to invest into fixing CVE records, at a way faster pac=
e than NVD is doing now.<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
- Automated tooling is just a piece of the puzzle, but it=E2=80=99s a usefu=
l piece.=C2=A0 More on that later...<br></blockquote><div><br></div><div>I =
have my opinion on the topic too :)</div><div><br></div><div>Kind regards,<=
/div><div>Marta <br></div><div><br></div><div>PS. Here&#39;s the yocto-vex-=
check result for the master branch as of this night. There are a few false =
positives and I&#39;m looking at the Linux kernel entries (which usually pa=
rse way better).<br></div><div><br></div><div><p>Issues for package graphen=
e (version 1.10.8):</p><p>Unpatched: CVE-2024-1984</p><p>Count: 1</p><p>Iss=
ues for package linux-yocto (version 6.12.13):</p><p>Unpatched: CVE-2021-46=
978 CVE-2021-47089 CVE-2021-47137 CVE-2024-26666 CVE-2024-34027 CVE-2024-35=
919</p><p>Count: 6</p><p>Issues for package go-runtime (version 1.24.0):</p=
><p>Unpatched: CVE-2024-24786</p><p>Count: 1</p><p>Issues for package libsn=
dfile1 (version 1.2.2):</p><p>Unpatched: CVE-2024-50613</p><p>Count: 1</p><=
p>Issues for package libsoup-2.4 (version 2.74.3):</p><p>Unpatched: CVE-202=
4-52530 CVE-2024-52531 CVE-2024-52532</p><p>Count: 3</p><p>Issues for packa=
ge ghostscript (version 10.04.0):</p><p>Unpatched: CVE-2024-46951 CVE-2024-=
46952 CVE-2024-46953 CVE-2024-46954 CVE-2024-46955 CVE-2024-46956</p><p>Cou=
nt: 6</p><p>Global issue count: 18</p></div></div></div>

--000000000000c80325062ffec073--

