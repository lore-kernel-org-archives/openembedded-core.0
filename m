Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AF6C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 20:04:06 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] OpenSSL: Security fix for CVE-2023-0464
To: openembedded-core@lists.openembedded.org
From: "Siddharth" <sdoshi@mvista.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (157.32.31.87)
X-Originating-Platform: Linux Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 24 Mar 2023 13:03:59 -0700
References: <CANx9H-CVKpnSASdzXm2BcK6xZnzAtMDdDEFUDxxBqxyLu1rjvQ@mail.gmail.com>
In-Reply-To: <CANx9H-CVKpnSASdzXm2BcK6xZnzAtMDdDEFUDxxBqxyLu1rjvQ@mail.gmail.com>
Message-ID: <14414.1679688239449177365@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kC4yjnYtkJlAAyhiqCBW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 20:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179078

--kC4yjnYtkJlAAyhiqCBW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

>=20
> Rather than backport, we should instead upgrade to 3.0.9
> https://www.cve.org/CVERecord?id=3DCVE-2023-0464
>=20

- Yes, upgrade is the ideal scenario we would be looking at. Even as per op=
enssl.org the issue is solved in 3.0.9, 1.1.1u and 3.1.1, but those version=
s of OpenSSL (3.0.9, 3.1.1, 1.1.1u) are still under development and not yet=
 released.
- I will definately be keeping an eye out for those versions to be released=
 and submit the version up patches as soon as its released after checking A=
PI compatability(which I feel wont be an issue).
- But, till the time those versions aren't released, this backport helps to=
 patch of a known CVE and hence submitted it.

Regards,
Siddharth

--kC4yjnYtkJlAAyhiqCBW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,<br />
<blockquote>Rather than backport, we should instead upgrade to 3.0.9
<div><a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2023-0464" target=3D=
"_blank" rel=3D"noopener">https://www.cve.org/CVERecord?id=3DCVE-2023-0464<=
/a></div>
</blockquote>
<div>- Yes, upgrade is the ideal scenario we would be looking at. Even as p=
er openssl.org the issue is solved in 3.0.9, 1.1.1u and 3.1.1, but those ve=
rsions of OpenSSL (3.0.9, 3.1.1, 1.1.1u) are still under development and no=
t yet released.<br />- I will definately be keeping an eye out for those ve=
rsions to be released and submit the version up patches as soon as its rele=
ased after checking API compatability(which I feel wont be an issue).<br />=
- But, till the time those versions aren't released, this backport helps to=
 patch of a known CVE and hence submitted it.<br /><br />Regards,<br />Sidd=
harth</div>

--kC4yjnYtkJlAAyhiqCBW--

