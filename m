Return-Path: <jan.kircher@leica-microsystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B847C36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:55:37 +0000 (UTC)
Subject: Re: Proposal: skip debug builds of native packages
To: openembedded-core@lists.openembedded.org
From: "Jan Kircher" <jan.kircher@leica-microsystems.com>
X-Originating-Location: Frankfurt am Main, Hesse, DE (147.161.136.195)
X-Originating-Platform: Windows Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 00:52:03 -0700
References: <DB5PR02MB102139C9D2A02EE8499251479EFBD2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102139C9D2A02EE8499251479EFBD2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Message-ID: <8641.1745826723338154901@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215584

On Wed, Apr 16, 2025 at 03:01 PM, Peter Kjellerstedt wrote:

> If you are setting DEBUG_BUILD globally rather than per recipe, then the=
=20
> solution for you to avoid enabling it for native recipes would be to=20
> instead use:
>=20
> DEBUG_BUILD:class-target =3D "1"
>=20
> //Peter
>=20

That is a way better solution. I didn't know this is possible. Thank you!

