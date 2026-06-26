Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBE0C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 17:20:39 +0000 (UTC)
Subject: Re: [meta][PATCH v3 1/2] go-vendor.bbclass: Unpack into BP for destsuffix
To: openembedded-core@lists.openembedded.org
From: "John Ripple" <john.ripple@keysight.com>
X-Originating-Location: Colorado Springs, Colorado, US (192.25.7.194)
X-Originating-Platform: Windows Firefox 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 26 Jun 2026 10:20:33 -0700
References: <20260622230331.3754496-1-john.ripple@keysight.com> <63E7937C-180C-4D86-AB9F-628D62ED2148@arm.com>
In-Reply-To: <63E7937C-180C-4D86-AB9F-628D62ED2148@arm.com>
Message-ID: <79924.1782494433753879942@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hhnZpKScN16T2VuV38ax"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 17:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239655

--hhnZpKScN16T2VuV38ax
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

>=20
>=20
>> On 23 Jun 2026, at 00:03, John Ripple via lists.openembedded.org
>> <john.ripple=3Dkeysight.com@...> wrote:
>>=20
>> The go-vendor class has a hardcoded destsuffix variable used to unpack
>> sources fetched with the go_src_uri function. This was causing a conflic=
t
>> with insane.bbclass which prohibts setting S =3D "${UNPACKDIR}/git" whic=
h
>> was needed to find the vendored sources in the hardcoded location.
>> Changing this unpack location to use the standard base package name (BP)
>> fixes the previous issue and no longer requires manually setting S in th=
e
>> recipes that use go-vendor.
>=20
> Thanks for these patches. Sadly we don=E2=80=99t have a test case for the
> go-vendor class, as you clearly use it would you be able to write a small
> test case to verify that a recipe using the go-vendor class works? We can
> host little test repositories on git.yoctoproject.org if needed (for
> example, https://git.yoctoproject.org/recipetool-go-test/ ).
>=20

Is there anything the test should do in particular or is there a general gu=
ides for what should be tested for a bbclass? I'm not very familiar with th=
e Yocto self test framework so any tips or documentation would be appreciat=
ed. I'll try to follow what the gotoolchain.py test does if nothing else.

John

--hhnZpKScN16T2VuV38ax
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Ross,</div>
<blockquote>
<div>
<blockquote>On 23 Jun 2026, at 00:03, John Ripple via lists.openembedded.or=
g &lt;john.ripple=3Dkeysight.com@...&gt; wrote:<br /><br />The go-vendor cl=
ass has a hardcoded destsuffix variable used to unpack<br />sources fetched=
 with the go_src_uri function. This was causing a conflict<br />with insane=
.bbclass which prohibts setting S =3D "${UNPACKDIR}/git" which<br />was nee=
ded to find the vendored sources in the hardcoded location.<br />Changing t=
his unpack location to use the standard base package name (BP)<br />fixes t=
he previous issue and no longer requires manually setting S in the<br />rec=
ipes that use go-vendor.</blockquote>
Thanks for these patches. Sadly we don&rsquo;t have a test case for the go-=
vendor class, as you clearly use it would you be able to write a small test=
 case to verify that a recipe using the go-vendor class works? We can host =
little test repositories on git.yoctoproject.org if needed (for example, <a=
 href=3D"https://git.yoctoproject.org/recipetool-go-test/" target=3D"_blank=
" rel=3D"noopener">https://git.yoctoproject.org/recipetool-go-test/</a>).</=
div>
</blockquote>
<div>Is there anything the test should do in particular or is there a gener=
al guides for what should be tested for a bbclass? I'm not very familiar wi=
th the Yocto self test framework so any tips or documentation would be appr=
eciated. I'll try to follow what the gotoolchain.py test does if nothing el=
se.</div>
<div>&nbsp;</div>
<div>John</div>

--hhnZpKScN16T2VuV38ax--

