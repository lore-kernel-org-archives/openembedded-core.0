Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAA5C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 05:10:12 +0000 (UTC)
Subject: Re: [PATCH] scripts/oe-find-native-sysroot: fix get sysroot failed
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.252.42)
X-Originating-Platform: Linux Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Jun 2025 22:10:09 -0700
References: <CANNYZj_t5L-tXaWW0uq8q5J=Eq=jegqs6Enyu7KTd0_DSiDHbw@mail.gmail.com>
In-Reply-To: <CANNYZj_t5L-tXaWW0uq8q5J=Eq=jegqs6Enyu7KTd0_DSiDHbw@mail.gmail.com>
Message-ID: <19279.1749705009402198014@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="t8j1JgQmEl5n2NUMLA0A"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 05:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218478

--t8j1JgQmEl5n2NUMLA0A
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 06:14 AM, Alexander Kanavin wrote:

>=20
>=20
>> BTW: bitbake-getvar --quiet (Silence bitbake server logging) could not
>> skip above "NOTE: Reconnecting to bitbake server..." message from bitbak=
e
>=20
> But it should, and it's better to fix that. Otherwise we have to
> plaster similar workarounds everywhere where bitbake-getvar is used in
> scripts.

Sure, submitted patch to bitbake to skip noisy output for bitbake-getvar

https://lists.openembedded.org/g/bitbake-devel/message/17694?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C113601893%2Cd%253D3&d=3D3

Please ignore this patch

//Hongxu

>=20
> I see e.g. 'bitbake-getvar --value BBLAYERS | tail -1' is used
> elsewhere, presumably for similar reasons.
>=20
> Alex

--t8j1JgQmEl5n2NUMLA0A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Jun 11, 2025 at 06:14 AM, Alexander Kanavin wrote:</div>
<div>
<blockquote>
<blockquote>BTW: bitbake-getvar --quiet (Silence bitbake server logging) co=
uld not<br />skip above "NOTE: Reconnecting to bitbake server..." message f=
rom bitbake</blockquote>
But it should, and it's better to fix that. Otherwise we have to<br />plast=
er similar workarounds everywhere where bitbake-getvar is used in<br />scri=
pts.</blockquote>
</div>
<div>Sure, submitted patch to bitbake to <span style=3D"font-size: 18px;">s=
kip noisy output for bitbake-getvar</span></div>
<div>&nbsp;</div>
<div>https://lists.openembedded.org/g/bitbake-devel/message/17694?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C113601893%2Cd%253D3&am=
p;d=3D3</div>
<div>&nbsp;</div>
<div>Please ignore this patch</div>
<div>&nbsp;</div>
<div>//Hongxu</div>
<div><br />
<blockquote>I see e.g. 'bitbake-getvar --value BBLAYERS | tail -1' is used<=
br />elsewhere, presumably for similar reasons.<br /><br />Alex</blockquote=
>
</div>

--t8j1JgQmEl5n2NUMLA0A--

