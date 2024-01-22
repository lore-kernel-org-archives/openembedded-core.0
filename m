Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B67EC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:40:22 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.79252.1705941614737699374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=rcpFhWNZ;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EE6B5240027
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 17:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705941613; bh=HftbyHcegppWtZVTByyxqDsOqXPu3UR3mHDwu/Rrvgc=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=rcpFhWNZRgZvEd8+711hi7qBMEplaemOt1cuJvgEAZrEJlmwCjSGyC52ZI5fS2BJN
	 W2Q3L87aHIe9wnL6f4JnSudjXOhAWktrcsC6wdzQqWhIH702s9xM3id3Me843WfnwW
	 vBeTamWYiOjO5kmxlnXzgJGxmmbwLX3lkkST3Aa3TM2Znp+Ln1JvfiWF3jzMjXb2UT
	 iBjxM5GLm3U929t/DeVNoqVs2Nr8+JGXDISiGySV0DoSOkv/RKn0eEiPurF6p7iIAn
	 kxo1jkLVApBBCcca6BpZGogNXFBSG5MCPmTqcXUeMuTnxvw+4RsRt8WeSjm7SfzjgD
	 WNRgDxOcl3Y4g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TJbYS30hgz9rxK
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 17:40:11 +0100 (CET)
Message-ID: <f3fd7963b7c46fb183d2b03e9f5220f74f0102e8.camel@posteo.net>
Subject: Re: [OE-core] [PATCH v2] gcc: Upgidate status of CVE-2023-4039
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2024 16:40:11 +0000
In-Reply-To: <20240122161842.8557-1-simone.p.weiss@posteo.com>
References: <20240122161842.8557-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 16:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194184

On Mon, 2024-01-22 at 16:18 +0000, Simone Wei=C3=9F wrote:
> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>=20
> This is fixed via a patch added in gcc-13.2.inc already, but still
> reported e.g. for libgcc as it is not defining an own source but use
> the
> shared gcc-source.
>=20
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/libgcc-initial_13.2.bb | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
> b/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
> index a259082b47..fd66692185 100644
> --- a/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
> +++ b/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
> @@ -3,3 +3,5 @@ require libgcc-initial.inc
> =C2=A0
> =C2=A0# Building with thumb enabled on armv6t fails
> =C2=A0ARM_INSTRUCTION_SET:armv6 =3D "arm"
> +
> +CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023-
> 4039.patch in gcc-13-2.inc which is added via require here"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194182):
> https://lists.openembedded.org/g/openembedded-core/message/194182
> Mute This Topic: https://lists.openembedded.org/mt/103889417/8071792
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> simone.weiss@posteo.net]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


Please ignore this. I made a rebase error. I will send a corrected
version.

Sorry
Simone

