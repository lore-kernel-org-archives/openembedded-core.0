Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50733D2F325
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:13:13 +0000 (UTC)
Subject: Re: [PATCH 5/6] wic: extra-partitions: Make extra-files optional
To: openembedded-core@lists.openembedded.org
From: "Pierre-loup GOSSE" <pierre-loup.gosse@smile.fr>
X-Originating-Location: =?UTF-8?B?UGFyaXMsIMOObGUtZGUtRnJhbmNlLCBGUg==?= (147.161.184.208)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 07:13:06 -0800
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com> <20260113144314.3563680-5-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260113144314.3563680-5-adam.duskett@amarulasolutions.com>
Message-ID: <575011.1768317186376112526@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pF3aO34gOBKqjyXGlwDz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 15:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229273

--pF3aO34gOBKqjyXGlwDz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

Thanks for your contribution to the plugin.

>=20
> There are many use cases where a user may need a blank partition of a
> given
> size and format with no extra files added. Such as an empty data
> partition.
>=20

A blank partition can already be created without the extra-partition plugin=
.

Personally, I use the following example line in my WKS file:

part --fstype=3Dext4 --label data --fixed-size 500M

This command creates a blank 500MB partition with an ext4 filesystem.

In my opinion, the extra plugin should always requires files, similar to th=
e bootimg partition plugin (on which the extra partition plugin is based).

Pierre-Loup,

--pF3aO34gOBKqjyXGlwDz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Adam,</div>
<div>&nbsp;</div>
<div>Thanks for your contribution to the plugin.</div>
<div>&nbsp;</div>
<blockquote>
<div>There are many use cases where a user may need a blank partition of a =
given<br />size and format with no extra files added. Such as an empty data=
 partition.</div>
</blockquote>
<div>&nbsp;</div>
<div>A blank partition can already be created without the extra-partition p=
lugin.</div>
<div>&nbsp;</div>
<div>Personally, I use the following example line in my WKS file:</div>
<div>&nbsp;</div>
<div><span style=3D"font-family: 'courier new', courier;">&nbsp; part --fst=
ype=3Dext4 --label data --fixed-size 500M</span></div>
<div>&nbsp;</div>
<div>This command creates a blank 500MB partition with an ext4 filesystem.<=
/div>
<div>&nbsp;</div>
<div>In my opinion, the extra plugin should always requires files, similar =
to the bootimg partition plugin (on which the extra partition plugin is bas=
ed).</div>
<div>&nbsp;</div>
<div>Pierre-Loup,</div>
<div>&nbsp;</div>

--pF3aO34gOBKqjyXGlwDz--

