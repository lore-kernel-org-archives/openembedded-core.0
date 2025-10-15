Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33383CCD192
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 02:33:09 +0000 (UTC)
Subject: Re: [kirkstone 04/14] glibc: Remove partial BZ#25847 backport patches
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.217.145)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Oct 2025 19:33:02 -0700
References: <CAMKF1sohg3Bf3h2NBdcFdrCebPqOuVq-OUwku556Hfp6p--Gbg@mail.gmail.com>
In-Reply-To: <CAMKF1sohg3Bf3h2NBdcFdrCebPqOuVq-OUwku556Hfp6p--Gbg@mail.gmail.com>
Message-ID: <8400.1760495582957874981@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="HLExj8cfxctYW8ZcsFOS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 02:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224872

--HLExj8cfxctYW8ZcsFOS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 04:27 AM, Khem Raj wrote:

>=20
> are these backports being done in glibc 2.35 release as well ?

Hi Khem,

Yes, I=E2=80=99ve submitted the backported patches for this pthread issue t=
o glibc upstream for the following stable
branches: 2.38, 2.37, 2.36, and 2.35. You can find the submission here:
https://sourceware.org/pipermail/libc-stable/2025-July/thread.html

Carlos(Glibc maintainer) has already taken the patches into 2.38 and mentio=
ned that he will review the
others (including 2.35) as well. The long-term aim is to get these accepted=
 into glibc 2.35 upstream too, so that
we can eventually drop our local backports in Yocto through regular branch =
updates.

Thanks,
Sunil Dora

--HLExj8cfxctYW8ZcsFOS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Oct 15, 2025 at 04:27 AM, Khem Raj wrote:</div>
<div>
<blockquote>are these backports being done in glibc 2.35 release as well ?<=
/blockquote>
<p>Hi Khem,</p>
<p>Yes, I&rsquo;ve submitted the backported patches for this pthread issue =
to glibc upstream for the following stable <br />branches: 2.38, 2.37, 2.36=
, and 2.35. You can find the submission here:<br /><a title=3D"https://sour=
ceware.org/pipermail/libc-stable/2025-July/thread.html" href=3D"https://sou=
rceware.org/pipermail/libc-stable/2025-July/thread.html" target=3D"_blank" =
rel=3D"noreferrer noopener">https://sourceware.org/pipermail/libc-stable/20=
25-July/thread.html</a></p>
<p>Carlos(Glibc maintainer) has already taken the patches into 2.38 and men=
tioned that he will review the <br />others (including 2.35) as well. The l=
ong-term aim is to get these accepted into glibc 2.35 upstream too, so that=
 <br />we can eventually drop our local backports in Yocto through regular =
branch updates.</p>
<p><br />Thanks,<br />Sunil Dora</p>
</div>

--HLExj8cfxctYW8ZcsFOS--

