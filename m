Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB143C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 12:44:21 +0000 (UTC)
Subject: Re: [PATCH] classes-recipe/sbom-cve-check: fix sstate cache mismatch in sbom path
To: openembedded-core@lists.openembedded.org
From: "Anna-Lena Marx" <anna-lena.marx@inovex.de>
X-Originating-Location: DE (185.113.124.99)
X-Originating-Platform: Linux Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 01 Jul 2026 05:44:13 -0700
References: <20260701100045.3903557-1-anna-lena.marx@inovex.de> <CAMSfU+6RkR=8Ze0DMg-376Pw=_pE+kC75osYiwMtHmTCbdp5Bw@mail.gmail.com> <AS8PR10MB50732D19DC22A9F050502AEFFDF62@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50732D19DC22A9F050502AEFFDF62@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <148656.1782909853265533546@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YN8Fr11mczyuIL1f4u5s"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 12:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239981

--YN8Fr11mczyuIL1f4u5s
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

I'm a bit confused about your patch, not that I would not believe it solves=
 the issue, but IMAGE_LINK_NAME is defined as

`IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"`

and IMAGE_NAME as

`IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"`

means, if I'm not completely confused, if IMAGE_LINK_NAME would be empty fo=
r some reason, IMAGE_NAME, would only consist of the IMAGE_VERSION_SUFFIX.
This does not read correct to me as well, and thus I'm not completely enthu=
siastic about your version.

But I'm completely with you in terms of the main issue and would rather lik=
e to fix it on this level than patching symptoms.

Anna

--YN8Fr11mczyuIL1f4u5s
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Peter,</div>
<div>&nbsp;</div>
<div>I'm a bit confused about your patch, not that I would not believe it s=
olves the issue, but IMAGE_LINK_NAME is defined as&nbsp;<br /><br />`IMAGE_=
LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"`<br /><br />and I=
MAGE_NAME as<br /><br />`IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION=
_SUFFIX}"`<br /><br />means, if I'm not completely confused, if IMAGE_LINK_=
NAME would be empty for some reason, IMAGE_NAME, would only consist of the =
IMAGE_VERSION_SUFFIX.<br />This does not read correct to me as well, and th=
us I'm not completely enthusiastic about your version.<br /><br />But I'm c=
ompletely with you in terms of the main issue and would rather like to fix =
it on this level than patching symptoms.<br /><br /></div>
<div>Anna</div>

--YN8Fr11mczyuIL1f4u5s--

