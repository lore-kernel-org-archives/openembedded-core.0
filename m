Return-Path: <logan.grosz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525ADCA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 15:44:02 +0000 (UTC)
Subject: Port package-group-meta-filesystems fix to Kirkstone #kirkstone
To: openembedded-core@lists.openembedded.org
From: "Logan Grosz" <logan.grosz@gmail.com>
X-Originating-Location: Rapid City, South Dakota, US (208.117.101.126)
X-Originating-Platform: Windows Firefox 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 29 Aug 2025 08:43:58 -0700
Message-ID: <Q8cx.1756482238242443264.LmeF@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CfnUeMRx4qU18vKBrKiM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 15:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222618

--CfnUeMRx4qU18vKBrKiM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, I was wondering if this patch ported to Kirkstone? I believe there is n=
o workaround for this issue since `PACKAGE_ARCH` needs to be set _before_ i=
nheriting `packagegroup.bbclass`.

>=20
> From c67eab376bc4f5277f0f30356c11411b2f1272dc Mon Sep 17 00:00:00 2001
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> Date: Sun, 22 May 2022 20:23:18 +0200
> Subject: [PATCH] packagegroup-meta-filesystems: fix build issue
> The packagegroup has to be arch dependent to address build failure:
> ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An
> allarch packagegroup shouldn't depend on packages which are dynamically
> renamed (fuse to libfuse2)
> ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An
> allarch packagegroup shouldn't depend on packages which are dynamically
> renamed (fuse-dev to libfuse-dev)
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../packageconfigs/packagegroup-meta-filesystems.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +
> 1 file changed, 1 insertion(+)
> diff --git
> a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-f=
ilesystems.bb
> b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-f=
ilesystems.bb
>=20
> index 75591c31fa..1954b5979c 100644
> ---
> a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-f=
ilesystems.bb
>=20
> +++
> b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-f=
ilesystems.bb
>=20
> @@ -1,5 +1,6 @@
> SUMMARY =3D "Meta-filesystem packagegroups"
>=20
> +PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
> inherit packagegroup
>=20
> PROVIDES =3D "${PACKAGES}"
> --
> 2.48.1
>=20

Thanks!
Logan

--CfnUeMRx4qU18vKBrKiM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, I was wondering if this patch ported to Kirkstone? I believe there=
 is no workaround for this issue since `PACKAGE_ARCH` needs to be set _befo=
re_ inheriting `packagegroup.bbclass`.</div>
<div>&nbsp;</div>
<div>
<blockquote>
<div>From c67eab376bc4f5277f0f30356c11411b2f1272dc Mon Sep 17 00:00:00 2001=
<br />From: Vyacheslav Yurkov &lt;Vyacheslav.Yurkov@bruker.com&gt;<br />Dat=
e: Sun, 22 May 2022 20:23:18 +0200<br />Subject: [PATCH] packagegroup-meta-=
filesystems: fix build issue</div>
<div>The packagegroup has to be arch dependent to address build failure:<br=
 />ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An all=
arch packagegroup shouldn't depend on packages which are dynamically rename=
d (fuse to libfuse2)<br />ERROR: packagegroup-meta-filesystems-1.0-r0 do_pa=
ckage_write_rpm: An allarch packagegroup shouldn't depend on packages which=
 are dynamically renamed (fuse-dev to libfuse-dev)</div>
<div>Signed-off-by: Vyacheslav Yurkov &lt;Vyacheslav.Yurkov@bruker.com&gt;<=
br />Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br />---<br />&nbsp=
;.../packageconfigs/packagegroup-meta-filesystems.bb &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| 1 +<br />&nbsp;1 file changed, 1 insertion(+)</=
div>
<div>diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packa=
gegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packagec=
onfigs/packagegroup-meta-filesystems.bb<br />index 75591c31fa..1954b5979c 1=
00644<br />--- a/meta-filesystems/recipes-filesystems/packageconfigs/packag=
egroup-meta-filesystems.bb<br />+++ b/meta-filesystems/recipes-filesystems/=
packageconfigs/packagegroup-meta-filesystems.bb<br />@@ -1,5 +1,6 @@<br />&=
nbsp;SUMMARY =3D "Meta-filesystem packagegroups"<br />&nbsp;<br />+PACKAGE_=
ARCH =3D "${TUNE_PKGARCH}"<br />&nbsp;inherit packagegroup<br />&nbsp;<br /=
>&nbsp;PROVIDES =3D "${PACKAGES}"<br />--&nbsp;<br />2.48.1</div>
</blockquote>
<div>&nbsp;</div>
<div>Thanks!</div>
<div>Logan</div>
</div>

--CfnUeMRx4qU18vKBrKiM--

