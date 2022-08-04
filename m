Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFFEC00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 04:18:42 +0000 (UTC)
Subject: Re: [kirkstone] glibc : stable 2.35 branch updates
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.146.216)
X-Originating-Platform: Windows Chrome 103
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 03 Aug 2022 21:18:41 -0700
References: <20220804041121.5672-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220804041121.5672-1-sundeep.kokkonda@gmail.com>
Message-ID: <12767.1659586721751863165@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="IEeJMjP6wMN3K9IX2x3q"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 04:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168836

--IEeJMjP6wMN3K9IX2x3q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Regression tests are performed. Below is the test summary.

>=20
> Summary of test results *before update* of glibc:
> 146 FAIL
> 4395 PASS
> 2 UNRESOLVED
> 41 UNSUPPORTED
> 12 XFAIL
> 6 XPASS
>=20
> Summary of test results *after update* of glibc:
> 150 FAIL
> 4393 PASS
> 41 UNSUPPORTED
> 12 XFAIL
> 6 XPASS
>=20

There are new 11 failures after glibc update which all are from ' localedat=
a ' sub-module. I am looking into the failed cases, suspecting that these f=
ailures are because of test procedure issue.

Thanks,
Sundeep K.

--IEeJMjP6wMN3K9IX2x3q
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />Regression tests are performed. Below is the test summary=
.<br /><br />
<blockquote>
<div><span style=3D"text-decoration: underline;">Summary of test results <s=
trong>before update</strong> of glibc:</span></div>
<div>&nbsp; &nbsp; 146 FAIL</div>
<div>&nbsp; &nbsp;4395 PASS</div>
<div>&nbsp; &nbsp; &nbsp; 2 UNRESOLVED</div>
<div>&nbsp; &nbsp; &nbsp;41 UNSUPPORTED</div>
<div>&nbsp; &nbsp; &nbsp;12 XFAIL</div>
<div>&nbsp; &nbsp; &nbsp; 6 XPASS</div>
<div>&nbsp;</div>
<div><span style=3D"text-decoration: underline;">Summary of test results <s=
trong>after update</strong> of glibc:</span></div>
<div>&nbsp; &nbsp; 150 FAIL</div>
<div>&nbsp; &nbsp;4393 PASS</div>
<div>&nbsp; &nbsp; &nbsp;41 UNSUPPORTED</div>
<div>&nbsp; &nbsp; &nbsp;12 XFAIL</div>
<div>&nbsp; &nbsp; &nbsp; 6 XPASS</div>
</blockquote>
<div>There are new 11 failures after glibc update which all are from '<em>l=
ocaledata</em>' sub-module. I am looking into the failed cases, suspecting =
that these failures are because of test procedure issue.<br /><br /><br /><=
br />Thanks,<br />Sundeep K.</div>

--IEeJMjP6wMN3K9IX2x3q--

