Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D2C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:35:30 +0000 (UTC)
Subject: Re: [PATCH] package: disable renamed dependency error if allarch is overridden
To: openembedded-core@lists.openembedded.org
From: "Oleksandr Hnatiuk" <ohnatiuk@cisco.com>
X-Originating-Location: London, England, GB (64.103.40.18)
X-Originating-Platform: Linux Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 May 2025 08:35:30 -0700
References: <CANNYZj-g5MYbo7Nv5OzTjW=W2ECFCzNLi8s91RjtmDjrSO7_Wg@mail.gmail.com>
In-Reply-To: <CANNYZj-g5MYbo7Nv5OzTjW=W2ECFCzNLi8s91RjtmDjrSO7_Wg@mail.gmail.com>
Message-ID: <1013.1747236930335189561@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OXTPX8zSh0oSk8KC3RsC"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216501

--OXTPX8zSh0oSk8KC3RsC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

You have the same approach in openembedded-core layer.
See meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb

>=20
> SUMMARY =3D "Host packages for the standalone SDK or external toolchain"
> inherit packagegroup
> inherit_defer nativesdk
>

--OXTPX8zSh0oSk8KC3RsC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>You have the same approach in openembedded-core layer.</div>
<div>See meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb=
</div>
<blockquote>
<div>
<div>SUMMARY =3D "Host packages for the standalone SDK or external toolchai=
n"</div>
<div>inherit packagegroup<br />inherit_defer nativesdk</div>
</div>
</blockquote>

--OXTPX8zSh0oSk8KC3RsC--

