Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD03CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 14:45:27 +0000 (UTC)
Subject: Re: [PATCH] qemu: add ppc64le support to COMPATIBLE_HOST
To: openembedded-core@lists.openembedded.org
From: "Andrew Geissler" <geissonator@gmail.com>
X-Originating-Location: Manchester, New Hampshire, US (76.118.171.147)
X-Originating-Platform: Windows Firefox 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 07:45:23 -0700
References: <20260616205030.50367-1-geissonator@yahoo.com> <BC47F2B7-4B25-4187-8CE7-8459941C3DB0@arm.com>
In-Reply-To: <BC47F2B7-4B25-4187-8CE7-8459941C3DB0@arm.com>
Message-ID: <1024.1782139523808867535@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7yPw9WYB7fesCRs30srv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239304

--7yPw9WYB7fesCRs30srv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 07:00 AM, Ross Burton wrote:

>=20
> Hi Andrew, Mingli,
>=20
>=20
>> On 16 Jun 2026, at 21:50, Andrew Geissler via lists.openembedded.org
>> <geissonator=3Dgmail.com@lists.openembedded.org> wrote:
>>=20
>> The move to qemu 11 and the enforcement of 64 bit machines broke ppc64le
>> machines. Add ppc64le wherever there is a ppc64 machine.
>=20
> Interestingly this patch from Andrew conflicts with a patch from Mingli Y=
u
> which changes ppc64 to powerpc64[1].
>=20
> Without triple-checking I=E2=80=99m more liable to believe your patch as =
I expect
> that you=E2=80=99re actually running PPC64LE servers (and also touches mo=
re places
> where COMPATIBLE_HOST is set), but I=E2=80=99m also wondering what Mingli=
=E2=80=99s patch
> is doing because it must have been sent for a reason.
>=20
> Can you both compare each-others patches so we can understand what
> happened?
>=20
> Cheers,
> Ross
>=20
> [1] "qemu: Correct the ppc64 setting in COMPATIBLE_HOST=E2=80=9D, https:/=
/lists.openembedded.org/g/openembedded-core/message/238884
>=20

Yep I tested my patch on our POWER9 ppc64le based machine and verified it a=
llowed me to build the latest OpenBMC distro. I submitted this patch becaus=
e our CI process that utilizes a ppc64le stopped working when we picked up =
the latest oe-core in OpenBMC.

I poked around a bit and when I look at a POWER server that not running in =
little endian mode, I don't actually see ppc64 or powerpc64 from Mingli pat=
ch. As far as I can tell it's just powerpc (uname -p). So I don't have a lo=
t vested in the non-ppc64le portion. If Mingli can confirm it tested fine f=
or their config then I'm good if we just merge both patches, otherwise plea=
se merge mine at least :)

Andrew

--7yPw9WYB7fesCRs30srv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Jun 18, 2026 at 07:00 AM, Ross Burton wrote:</div>
<div>
<blockquote>Hi Andrew, Mingli,<br /><br />
<blockquote>On 16 Jun 2026, at 21:50, Andrew Geissler via lists.openembedde=
d.org &lt;geissonator=3Dgmail.com@lists.openembedded.org&gt; wrote:<br /><b=
r />The move to qemu 11 and the enforcement of 64 bit machines broke ppc64l=
e<br />machines. Add ppc64le wherever there is a ppc64 machine.</blockquote=
>
Interestingly this patch from Andrew conflicts with a patch from Mingli Yu =
which changes ppc64 to powerpc64[1].<br /><br />Without triple-checking I&r=
squo;m more liable to believe your patch as I expect that you&rsquo;re actu=
ally running PPC64LE servers (and also touches more places where COMPATIBLE=
_HOST is set), but I&rsquo;m also wondering what Mingli&rsquo;s patch is do=
ing because it must have been sent for a reason.<br /><br />Can you both co=
mpare each-others patches so we can understand what happened?<br /><br />Ch=
eers,<br />Ross<br /><br />[1] "qemu: Correct the ppc64 setting in COMPATIB=
LE_HOST&rdquo;, <a href=3D"https://lists.openembedded.org/g/openembedded-co=
re/message/238884" target=3D"_blank" rel=3D"noopener">https://lists.openemb=
edded.org/g/openembedded-core/message/238884</a></blockquote>
</div>
<div>Yep I tested my patch on our POWER9 ppc64le based machine and verified=
 it allowed me to build the latest OpenBMC distro. I submitted this patch b=
ecause our CI process that utilizes a ppc64le stopped working when we picke=
d up the latest oe-core in OpenBMC.</div>
<div>&nbsp;</div>
<div>I poked around a bit and when I look at a POWER server that not runnin=
g in little endian mode, I don't actually see ppc64 or powerpc64 from Mingl=
i patch. As far as I can tell it's just powerpc (uname -p). So I don't have=
 a lot vested in the non-ppc64le portion. If Mingli can confirm it tested f=
ine for their config then I'm good if we just merge both patches, otherwise=
 please merge mine at least :)</div>
<div>&nbsp;</div>
<div>Andrew</div>

--7yPw9WYB7fesCRs30srv--

