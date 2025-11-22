Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95743CFC53D
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 16:01:41 +0000 (UTC)
Subject: Re: [PATCH] udev-extraconf: Split automount and autonet into seperate packages
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (163.116.214.34)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 08:01:31 -0800
References: <20251121061252.2644203-1-vpuar@qti.qualcomm.com> <CANPvuRkC16oj=twxLvfbx76P+yqvZOKE63Q=U=6LTAgwuGmM5A@mail.gmail.com>
In-Reply-To: <CANPvuRkC16oj=twxLvfbx76P+yqvZOKE63Q=U=6LTAgwuGmM5A@mail.gmail.com>
Message-ID: <636460.1763827291695331135@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="2R1jMgv0WVCloXmIOnJN"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 16:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226695

--2R1jMgv0WVCloXmIOnJN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 09:49 PM, Jose Quaresma wrote:

>=20
>=20
> Can you also all these new packages in the runtime depends so the
> behaviour=C2=A0is like before?
>=20
> RDEPENDS:${PN} =3D "${PN}-automount ${PN}-autonet"
>=20
> Thanks=C2=A0for the patch.
>=20
> Jose
>=20
>=20

Sure will update.

Regards,
Vivek

--2R1jMgv0WVCloXmIOnJN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Nov 21, 2025 at 09:49 PM, Jose Quaresma wrote:</div>
<div>
<blockquote>
<div>&nbsp;</div>
<div>Can you also all these new packages in the runtime depends so the beha=
viour&nbsp;is like before?</div>
<div>&nbsp;<br />RDEPENDS:${PN} =3D "${PN}-automount ${PN}-autonet"<br /><b=
r />Thanks&nbsp;for the patch.<br /><br />Jose</div>
<div>&nbsp;</div>
</blockquote>
<div>Sure will update.</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Vivek</div>
</div>

--2R1jMgv0WVCloXmIOnJN--

