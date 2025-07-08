Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16050C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 13:13:14 +0000 (UTC)
Subject: Re: [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: openembedded-core@lists.openembedded.org
From: "Alper Ak" <alperyasinak1@gmail.com>
X-Originating-Location: Istanbul, TR (176.33.70.141)
X-Originating-Platform: Linux Firefox 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 08 Jul 2025 06:13:11 -0700
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
Message-ID: <8340.1751980391085408362@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8OaSm3wPvsyMHYXrwZcP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 13:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220030

--8OaSm3wPvsyMHYXrwZcP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> I'm happy to support here. I'd agree to what Alper said though: Some way
> of
> coordinating this effort seems to be required. Given the number of
> affected
> recipes it'd also be good to have a temporary branch / fork to prepare th=
e
>=20
> patches on. Are there some pointers we can follow from previous changes
> of the same kind?
>=20
>=20
> One idea I had to possibly speed the process up a bit: For starters, we
> could
> try building the "broken" recipes with
>=20
>=20
> -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5
>=20
>=20
> added to
>=20
>=20
> EXTRA_OECMAKE
>=20
>=20
> possibly via a temporary 'cmake-4-enforce-policy-compat' bbclass or some
> similar
> mechanism. That would be faster then checking upstream for CMake-related
> patches
> and adding them to the tree / recipes.
>=20

I also considered the idea of temporarily using -DCMAKE_POLICY_VERSION_MINI=
MUM=3D3.5 to quickly work around the CMake 4 issues across multiple recipes=
. Then, I thought that directly upgrading recipes where the upstream versio=
n could be updated was more sustainable solution. I believed this would res=
olve many compatibility issues by relying on upstream fixes and encourage t=
he community to use the latest versions.

However, in cases where upgrading is not possible or incompatibilities pers=
ist, adding a small patch (for example, allow-build-with-cmake-4.patch) tha=
t sets the minimum required CMake version to 3.5 can provide a sustainable =
workaround.

On the other hand, applying similar patches across many recipes may require=
 manual cleanup in the future if the issue is eventually resolved upstream.=
 Therefore, it is essential to keep track of synchronization with upstream =
over the long term.

Before our conversation I made a few things and sent them to meta-openembed=
ded and Khem accepted them to master-next, but I still had the feeling that=
 maybe something better could be done.

https://patchwork.yoctoproject.org/project/oe/list/?submitter=3D938

As I said, I have the feeling that it can be done better, so I will wait fo=
r your answers before I do anything.

--8OaSm3wPvsyMHYXrwZcP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div>I'm happy to support here. I'd agree to what Alper said though: Some w=
ay of<br />coordinating this effort seems to be required. Given the number =
of affected<br />recipes it'd also be good to have a temporary branch / for=
k to prepare the<br />patches on. Are there some pointers we can follow fro=
m previous changes<br />of the same kind?<br /><br /></div>
<div>One idea I had to possibly speed the process up a bit: For starters, w=
e could<br />try building the "broken" recipes with<br /><br /></div>
<div>-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5<br /><br /></div>
<div>added to<br /><br /></div>
<div>EXTRA_OECMAKE<br /><br /></div>
<div>possibly via a temporary 'cmake-4-enforce-policy-compat' bbclass or so=
me similar<br />mechanism. That would be faster then checking upstream for =
CMake-related patches<br />and adding them to the tree / recipes.</div>
</blockquote>
<div>
<div>I also considered the idea of temporarily using -DCMAKE_POLICY_VERSION=
_MINIMUM=3D3.5 to quickly work around the CMake 4 issues across multiple re=
cipes. Then, I thought that directly upgrading recipes where the upstream v=
ersion could be updated was more sustainable solution. I believed this woul=
d resolve many compatibility issues by relying on upstream fixes and encour=
age the community to use the latest versions.<br /><br /></div>
<div>However, in cases where upgrading is not possible or incompatibilities=
 persist, adding a small patch (for example, allow-build-with-cmake-4.patch=
) that sets the minimum required CMake version to 3.5 can provide a sustain=
able workaround.<br /><br /></div>
<div>On the other hand, applying similar patches across many recipes may re=
quire manual cleanup in the future if the issue is eventually resolved upst=
ream. Therefore, it is essential to keep track of synchronization with upst=
ream over the long term.<br /><br /></div>
<div>Before our conversation I made a few things and sent them to meta-open=
embedded and Khem accepted them to master-next, but I still had the feeling=
 that maybe something better could be done.<br /><br /></div>
<div><a href=3D"https://patchwork.yoctoproject.org/project/oe/list/?submitt=
er=3D938" target=3D"_blank" rel=3D"noopener">https://patchwork.yoctoproject=
.org/project/oe/list/?submitter=3D938</a><br /><br /></div>
<div>As I said, I have the feeling that it can be done better, so I will wa=
it for your answers before I do anything.</div>
</div>

--8OaSm3wPvsyMHYXrwZcP--

