Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603A9CD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 08:32:55 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] kernel.bbclass: check, if directory exists before removing empty module directory
To: openembedded-core@lists.openembedded.org
From: "Heiko" <heiko.thole@entwicklung.eq-3.de>
X-Originating-Location: Papenburg, Lower Saxony, DE (91.248.110.165)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 11 Apr 2024 01:32:46 -0700
References: <c87416af-73fa-4ced-b04d-5c18936b9a1e@theobroma-systems.com>
In-Reply-To: <c87416af-73fa-4ced-b04d-5c18936b9a1e@theobroma-systems.com>
Message-ID: <28425.1712824366188020968@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="V4pY4uHL6rD9EjCBGMIb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 08:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198120

--V4pY4uHL6rD9EjCBGMIb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Thu, Apr 11, 2024 at 10:16 AM, Quentin Schulz wrote:

>=20
> rm --dir --force
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
>=20
> instead?
>=20
> -f, --force
> ignore nonexistent files and arguments, never prompt
>=20
> -d, --dir
> remove empty directories
>=20
> Cheers,
> Quentin

rm --dir --force does not work if the directory exists:

rm: cannot remove '/yocto/source/build-cm4/tmp/work/raspberrypi4_64-poky-li=
nux/linux-yocto/6.6.25+git-r0/image/lib/modules/6.6.25-hcu/kernel': Directo=
ry not empty

Best regards
Heiko

--V4pY4uHL6rD9EjCBGMIb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,<br /><br />On Thu, Apr 11, 2024 at 10:16 AM, Quentin Schulz wro=
te:<br />
<blockquote>rm --dir --force <br />"${D}${nonarch_base_libdir}/modules/${KE=
RNEL_VERSION}/kernel"<br /><br />instead?<br /><br />-f, --force<br />ignor=
e nonexistent files and arguments, never prompt<br /><br />-d, --dir<br />r=
emove empty directories<br /><br />Cheers,<br />Quentin</blockquote>
<p>rm --dir --force does not work if the directory exists:</p>
<p>rm: cannot remove '/yocto/source/build-cm4/tmp/work/raspberrypi4_64-poky=
-linux/linux-yocto/6.6.25+git-r0/image/lib/modules/6.6.25-hcu/kernel': Dire=
ctory not empty<br /><br />Best regards<br />Heiko</p>

--V4pY4uHL6rD9EjCBGMIb--

