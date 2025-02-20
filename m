Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457CCC021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 19:22:08 +0000 (UTC)
Subject: Re: [RFC] uboot-sign: Fix u-boot dtb signatures
To: openembedded-core@lists.openembedded.org
From: "Rogerio Guerra Borin" <rogerio.borin@toradex.com>
X-Originating-Location: =?UTF-8?B?U8OjbyBQYXVsbywgU2FvIFBhdWxvLCBCUg==?= (189.33.122.79)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Feb 2025 11:22:04 -0800
References: <20250220144012.27057-1-l.anderweit@phytec.de>
In-Reply-To: <20250220144012.27057-1-l.anderweit@phytec.de>
Message-ID: <16618.1740079324041661447@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ju5MTSar19gndDRBbDaS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 19:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211775

--ju5MTSar19gndDRBbDaS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Leonard,

I've tested your patch and I wanted to let you know it worked fine for me b=
oth when FIT_SIGN_INDIVIDUAL=3D"1" or "0". I've checked the contents of the=
 u-boot dtb (for the presence of the required pubkeys) and the fitImage (fo=
r the signatures) and the results match what we had before commit d7bd9c627=
66 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and =
UBOOT_ENV enabled").

As for the patch, since the understanding is that when FIT_SIGN_INDIVIDUAL=
=3D"1" the individual images will be signed besides the signing of the conf=
igurations then I'd say that sentence in the comment "Signing individual im=
ages is not recommended as that makes fitImage susceptible to mix-and-match=
 attack" seems unnecessary/misleading to me since it gives the impression t=
hat one would get either images or configurations signed.

As for the check performed at build time by the "fit_check_sign" tool, the =
fact that now the check is done only on the configuration doesn't seem like=
 a big loss to me. Though I imagine the ideal solution would be to have tha=
t check on the final fitImage rather than on a temporary one (unused.itb) i=
n order to provide stronger guarantees that the image is correctly signed. =
However, this would likely complicate things which may make it not worth th=
e effort...

Regards

--ju5MTSar19gndDRBbDaS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Leonard,</div>
<div>&nbsp;</div>
<div>I've tested your patch and I wanted to let you know it worked fine for=
 me both when FIT_SIGN_INDIVIDUAL=3D"1" or "0". I've checked the contents o=
f the u-boot dtb (for the presence of the required pubkeys) and the fitImag=
e (for the signatures) and the results match what we had before commit d7bd=
9c62766 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE=
 and UBOOT_ENV enabled").</div>
<div>&nbsp;</div>
<div>As for the patch, since the understanding is that when FIT_SIGN_INDIVI=
DUAL=3D"1" the individual images will be signed besides the signing of the =
configurations then I'd say that sentence in the comment "Signing individua=
l images is not recommended as that makes fitImage susceptible to mix-and-m=
atch attack" seems unnecessary/misleading to me since it gives the impressi=
on that one would get either images or configurations signed.</div>
<div>&nbsp;</div>
<div>As for the check performed at build time by the "fit_check_sign" tool,=
 the fact that now the check is done only on the configuration doesn't seem=
 like a big loss to me. Though I imagine the ideal solution would be to hav=
e that check on the final fitImage rather than on a temporary one (unused.i=
tb) in order to provide stronger guarantees that the image is correctly sig=
ned. However, this would likely complicate things which may make it not wor=
th the effort...</div>
<div>&nbsp;</div>
<div>Regards</div>

--ju5MTSar19gndDRBbDaS--

