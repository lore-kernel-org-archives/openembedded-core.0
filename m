Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D4AC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 21:42:25 +0000 (UTC)
Subject: Re: [PATCH 1/1] extrausers: Add ability to force password change on
 first login
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?utf-8?q?Fegyvernek=2C_J=C3=A1sz-Nagykun-Szolnok=2C?=
 =?utf-8?q?_HU_=28178=2E48=2E208=2E198=29?=
X-Originating-Platform: Windows Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 03 Jun 2022 14:42:22 -0700
References: <10389.1653424622995356371@lists.openembedded.org>
In-Reply-To: <10389.1653424622995356371@lists.openembedded.org>
Message-ID: <24337.1654292542607389609@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LICo01xDKT5hNMOeLykc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 21:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166529

--LICo01xDKT5hNMOeLykc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Finaly, i found the problem and i could solve it. SHA-256 is too weak to ma=
ke a password hash, this is why on first login we need to change password a=
lways.

Please fix it in Yocto manual ( https://docs.yoctoproject.org/singleindex.h=
tml#term-EXTRA_USERS_PARAMS ). When i set it to generate=C2=A0sha512crypt h=
ash it works fine, there are no any change request on first login.

--LICo01xDKT5hNMOeLykc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Finaly, i found the problem and i could solve it. SHA-256 is too weak to=
 make a password hash, this is why on first login we need to change passwor=
d always.</p>
<p>Please fix it in <a href=3D"https://docs.yoctoproject.org/singleindex.ht=
ml#term-EXTRA_USERS_PARAMS" target=3D"_blank" rel=3D"noopener">Yocto manual=
</a>. When i set it to generate&nbsp;sha512crypt hash it works fine, there =
are no any change request on first login.</p>

--LICo01xDKT5hNMOeLykc--

