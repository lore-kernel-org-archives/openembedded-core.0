Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AC5C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 10:37:24 +0000 (UTC)
Subject: Re: [poky][master][kirkstone][PATCH] cve-check.bbclass: Add anonymous
 function to get patched CVEs from recipe
To: openembedded-core@lists.openembedded.org
From: "akash hadke" <akash.hadke@kpit.com>
X-Originating-Location: =?utf-8?q?Dornstadt=2C_Baden-W=C3=BCrttemberg=2C_DE_?=
 =?utf-8?q?=28212=2E118=2E206=2E70=29?=
X-Originating-Platform: Linux Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 21 Jul 2022 03:37:19 -0700
References: <44426023-FCC1-48A2-BCB4-596DE17AE586@arm.com>
In-Reply-To: <44426023-FCC1-48A2-BCB4-596DE17AE586@arm.com>
Message-ID: <27704.1658399839145141718@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="rj3CxBu9VwWQRozJHpQo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 10:37:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168385

--rj3CxBu9VwWQRozJHpQo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 05:11 PM, Ross Burton wrote:

>=20
>=20
>> On 19 Jul 2022, at 08:54, akash hadke via lists.openembedded.org
>> <akash.hadke=3Dkpit.com@lists.openembedded.org> wrote:
>>=20
>> Actually, I wanted to get all patched CVE numbers from a recipe in one
>> variable, and the value of that variable will be used in other tasks. An=
d
>> for this purpose, I used the anonymous function because without it I wil=
l
>> not be able to get the value of CVE_PATCHED in other tasks.
>=20
> I=E2=80=99ll be blunt: we=E2=80=99re not adding a scan of every file to e=
very recipe in
> every build to this class.
>=20
> Why not generate this data on-demand in the task you=E2=80=99re writing t=
o use it?

Hello Ross,

I am trying to add this data in buildhistory. And getting required data in =
variables will help me like other variables but I don't know another way to=
 set the value.

--rj3CxBu9VwWQRozJHpQo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 05:11 PM, Ross Burton wrote:<br />
<blockquote>
<blockquote>On 19 Jul 2022, at 08:54, akash hadke via lists.openembedded.or=
g &lt;akash.hadke=3Dkpit.com@lists.openembedded.org&gt; wrote:<br /><br />A=
ctually, I wanted to get all patched CVE numbers from a recipe in one varia=
ble, and the value of that variable will be used in other tasks. And for th=
is purpose, I used the anonymous function because without it I will not be =
able to get the value of CVE_PATCHED in other tasks.</blockquote>
I&rsquo;ll be blunt: we&rsquo;re not adding a scan of every file to every r=
ecipe in every build to this class.<br /><br />Why not generate this data o=
n-demand in the task you&rsquo;re writing to use it?</blockquote>
Hello Ross,<br /><br />I am trying to add this data in buildhistory. And ge=
tting required data in variables will help me like other variables but I do=
n't know another way to set the value.

--rj3CxBu9VwWQRozJHpQo--

