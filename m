Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA311C47077
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:54:34 +0000 (UTC)
Subject: Re: [PATCH] uboot-sign: support to load optee-os and TFA images
To: openembedded-core@lists.openembedded.org
From: "Jamin Lin" <jamin_lin@aspeedtech.com>
X-Originating-Location: Daan, Taipei City, TW (118.99.190.129)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Jan 2024 17:54:28 -0800
References: <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
In-Reply-To: <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
Message-ID: <17005.1705456468183527781@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QEdZmbMvr6GYoD5dNRlk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 01:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193881

--QEdZmbMvr6GYoD5dNRlk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Thanks for review.

I tested it in ASPEED AST2600 and AST2700 SOCs. Yoc can see our Github repo=
sitory here.

https://github.com/AspeedTech-BMC

You are right the latest version of u-boot(2024.01) support binman python t=
ool to create FIT image and support optee-os and trusted-firmware-a.

However, =E2=80=9Cthe old version of u-boot binman python tool=E2=80=9D did=
 not support to add optee-os and trusted-firmware-a in the FIT image.

For example, our AST2600 is production and its u-boot version was 2019.04 a=
nd binman python tools did not support optee-os image format.

That was why I changed ITS file creation scripts to support all u-boot vers=
ion.

Finally, users are able to use the =E2=80=9Cmakeimage=E2=80=9D tool to crat=
e FIT image with optee-os and trusted-firmware-a.

Thanks-Jamin

--QEdZmbMvr6GYoD5dNRlk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">H=
i Alexander,</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">=
=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">T=
hanks for review.</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">=
=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">I=
 tested it in ASPEED AST2600 and AST2700 SOCs. Yoc can see our Github repos=
itory here.</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US"><=
a href=3D"https://github.com/AspeedTech-BMC">https://github.com/AspeedTech-=
BMC</a></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">=
=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">Y=
ou are right the latest version of u-boot(2024.01) support binman python to=
ol to create FIT image and support optee-os and trusted-firmware-a.</span><=
/p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">H=
owever, =E2=80=9Cthe old version of u-boot binman python tool=E2=80=9D did =
not support to add optee-os and trusted-firmware-a in the FIT image.</span>=
</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">F=
or example, our AST2600 is production and its u-boot version was 2019.04 an=
d binman python tools did not support optee-os image format.</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">T=
hat was why I changed ITS file creation scripts to support all u-boot versi=
on.</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">F=
inally, users are able to use the =E2=80=9Cmakeimage=E2=80=9D tool to crate=
 FIT image with optee-os and trusted-firmware-a.</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">=
=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span lang=3D"EN-US">T=
hanks-Jamin</span></p>

--QEdZmbMvr6GYoD5dNRlk--

