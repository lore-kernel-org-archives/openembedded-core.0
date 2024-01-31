Return-Path: <rahulchauhankitps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBB2C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 05:27:15 +0000 (UTC)
Subject: Re: How to enable libstdc++ Pretty Printers in GDB #poky
To: openembedded-core@lists.openembedded.org
From: "Rahul Chauhan" <rahulchauhankitps@gmail.com>
X-Originating-Location: Melbourne, Victoria, AU (155.190.53.4)
X-Originating-Platform: Windows Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 Jan 2024 21:27:13 -0800
References: <CAMKF1srDci3KN9GdeeXVoBr2R=Bgbo07zPFGSsk5VLYAfzSYLA@mail.gmail.com>
In-Reply-To: <CAMKF1srDci3KN9GdeeXVoBr2R=Bgbo07zPFGSsk5VLYAfzSYLA@mail.gmail.com>
Message-ID: <10032.1706678833265291851@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="aROuHELd972KrezvEAPM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 05:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194509

--aROuHELd972KrezvEAPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,

Thankyou very much for quick solution.

I backported patch and added below line in local.conf and its working fine.
IMAGE_INSTALL:append =3D " gcc-runtime-dbg"

but but when i am checking *info pretty-printer* i am not seeing libstdc++-=
v6 in the list
(gdb) info pretty-printer
global pretty-printers:
builtin
mpx_bound128

But I was expecting
(gdb) info pretty-printer
global pretty-printers:
builtin
mpx_bound128
libstdc++-v6

Can you please comment on this?

--aROuHELd972KrezvEAPM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,<br /><br />Thankyou very much for quick solution.<br /><br />I=
 backported patch and added below line in local.conf and its working fine.<=
br /><span style=3D"white-space-collapse: preserve;">IMAGE_INSTALL:append =
=3D " gcc-runtime-dbg" <br /><br />but but when i am checking </span><stron=
g><span style=3D"white-space-collapse: preserve;">info pretty-printer</span=
></strong><span style=3D"white-space-collapse: preserve;"> i am not seeing =
libstdc++-v6 in the list</span><span style=3D"white-space-collapse: preserv=
e;"><br /></span><span style=3D"white-space-collapse: preserve;">(gdb) info=
 pretty-printer</span><br style=3D"white-space-collapse: preserve;" /><span=
 style=3D"white-space-collapse: preserve;">global pretty-printers:</span><b=
r style=3D"white-space-collapse: preserve;" /><span style=3D"white-space-co=
llapse: preserve;"> builtin</span><br style=3D"white-space-collapse: preser=
ve;" /><span style=3D"white-space-collapse: preserve;"> mpx_bound128<br /><=
/span><span style=3D"white-space-collapse: preserve;"><br />But I was expec=
ting <br /></span><span style=3D"white-space-collapse: preserve;">(gdb) inf=
o pretty-printer</span><br style=3D"white-space-collapse: preserve;" /><spa=
n style=3D"white-space-collapse: preserve;">global pretty-printers:</span><=
br style=3D"white-space-collapse: preserve;" /><span style=3D"white-space-c=
ollapse: preserve;"> builtin</span><br style=3D"white-space-collapse: prese=
rve;" /><span style=3D"white-space-collapse: preserve;"> mpx_bound128<br />=
libstdc++-v6<br /><br /></span><span style=3D"white-space-collapse: preserv=
e;">Can you please comment on this?<br /><br /></span>

--aROuHELd972KrezvEAPM--

