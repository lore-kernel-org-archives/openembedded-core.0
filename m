Return-Path: <rahulchauhankitps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B55C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 13:13:16 +0000 (UTC)
Subject: How to enable libstdc++ Pretty Printers in GDB #poky
To: openembedded-core@lists.openembedded.org
From: "Rahul Chauhan" <rahulchauhankitps@gmail.com>
X-Originating-Location: Melbourne, Victoria, AU (155.190.53.5)
X-Originating-Platform: Windows Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Jan 2024 05:13:10 -0800
Message-ID: <3AaT.1706533990818666053.jduk@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Rp0URDilc8uvWMm6DcCr"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 13:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194460

--Rp0URDilc8uvWMm6DcCr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Can any one please help me=C2=A0 to enable=C2=A0libstdc++=C2=A0Pretty Print=
ers in GDB .

As of now i am only seeing below pretty printer enable.
(gdb) info pretty-printer
global pretty-printers:
builtin
mpx_bound128

I tried
IMAGE_INSTALL:append =3D " libstdc++" but unfortunately no luck.

Thanks
Rahul Chauhan

--Rp0URDilc8uvWMm6DcCr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,<br /><br />Can any one please help me&nbsp; to enable&nbsp;libstdc=
++&nbsp;Pretty Printers in GDB .<br /><br />As of now i am only seeing belo=
w pretty printer enable.<br />
<div>(gdb) info pretty-printer</div>
<div>global pretty-printers:</div>
<div>&nbsp; builtin</div>
<div>&nbsp; &nbsp; mpx_bound128</div>
<br />I tried&nbsp;<br />
<pre style=3D"font-family: monospace, Courier; color: #000000; background-c=
olor: #f9f9f9; border-color: #dddddd; padding: 1em; text-wrap: wrap; line-h=
eight: 1.1em; font-size: 12.7px;">IMAGE_INSTALL:append =3D " libstdc++"</pr=
e>
but unfortunately no luck.<br />&nbsp;<br />Thanks&nbsp;<br />Rahul Chauhan

--Rp0URDilc8uvWMm6DcCr--

