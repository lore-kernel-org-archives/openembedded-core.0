Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EA9C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 11:19:30 +0000 (UTC)
Subject: Re: [PATCH] python3-setuptools: drop python3-2to3 from RDEPENDS
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Reykjavik, Capital Region, IS (213.181.99.234)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Jun 2024 04:19:21 -0700
References: <B2D135A1-D55A-43D2-8830-3DA7393D44C5@arm.com>
In-Reply-To: <B2D135A1-D55A-43D2-8830-3DA7393D44C5@arm.com>
Message-ID: <6942.1718882361902473385@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4Ko8UuLIwl2NOKkJrv54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 11:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200945

--4Ko8UuLIwl2NOKkJrv54
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 09:57 AM, Ross Burton wrote:

>=20
> That does beg the question of why setuptools was part of a minimal image
> in the first place? Was that a requirement of yours, or is something
> pulling setuptools into all images?
>=20
> Ross

Hi Ross,

My minimal image requires gobject-introspection which for some reason is re=
quiring setuptools at runtime. This was not a requirement in Kirkstone, and=
 only appeared when I migrated my project to Scarthgap.

See: https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome=
/gobject-introspection/gobject-introspection_1.78.1.bb?h=3Dscarthgap#n192

I haven't looked into if this is correct or what part of gobject-introspect=
ion requires setuptools at runtime. On Kirkstone, my image ran fine without=
 both distutils and setuptools at runtime.

--4Ko8UuLIwl2NOKkJrv54
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 09:57 AM, Ross Burton wrote:<br />
<blockquote>That does beg the question of why setuptools was part of a mini=
mal image in the first place? Was that a requirement of yours, or is someth=
ing pulling setuptools into all images?<br /><br />Ross</blockquote>
Hi Ross,<br /><br />My minimal image requires gobject-introspection which f=
or some reason is requiring setuptools at runtime. This was not a requireme=
nt in Kirkstone, and only appeared when I migrated my project to Scarthgap.=
<br /><br />See: <a href=3D"https://git.openembedded.org/openembedded-core/=
tree/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.=
bb?h=3Dscarthgap#n192" target=3D"_blank" rel=3D"noopener">https://git.opene=
mbedded.org/openembedded-core/tree/meta/recipes-gnome/gobject-introspection=
/gobject-introspection_1.78.1.bb?h=3Dscarthgap#n192</a><br /><br />I haven'=
t looked into if this is correct or what part of gobject-introspection requ=
ires setuptools at runtime. On Kirkstone, my image ran fine without both di=
stutils and setuptools at runtime.

--4Ko8UuLIwl2NOKkJrv54--

