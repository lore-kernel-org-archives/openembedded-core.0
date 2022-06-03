Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D27C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 21:45:15 +0000 (UTC)
Subject: Re: Forced password change in first login
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?utf-8?q?Fegyvernek=2C_J=C3=A1sz-Nagykun-Szolnok=2C?=
 =?utf-8?q?_HU_=28178=2E48=2E208=2E198=29?=
X-Originating-Platform: Windows Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 03 Jun 2022 14:45:12 -0700
References: <IkQF.1653391044347982572.4xC9@lists.openembedded.org>
In-Reply-To: <IkQF.1653391044347982572.4xC9@lists.openembedded.org>
Message-ID: <11484.1654292712146430411@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="98pSkTMgl8RAmr1761ZR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 21:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166530

--98pSkTMgl8RAmr1761ZR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Finaly, i found the problem and i could solve it. SHA-256 is too weak to ma=
ke a password hash, this is why on first login we need to change password a=
lways.

Please fix it in Yocto manual ( https://docs.yoctoproject.org/singleindex.h=
tml#term-EXTRA_USERS_PARAMS ). When i set it to generate=C2=A0sha512crypt h=
ash it works fine, there are no any change request on first login.

--98pSkTMgl8RAmr1761ZR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Finaly, i found the problem and i could solve it. SHA-256 is too weak to=
 make a password hash, this is why on first login we need to change passwor=
d always.</p>
<p>Please fix it in&nbsp;<a href=3D"https://docs.yoctoproject.org/singleind=
ex.html#term-EXTRA_USERS_PARAMS" target=3D"_blank" rel=3D"nofollow noopener=
">Yocto manual</a>. When i set it to generate&nbsp;sha512crypt hash it work=
s fine, there are no any change request on first login.</p>

--98pSkTMgl8RAmr1761ZR--

