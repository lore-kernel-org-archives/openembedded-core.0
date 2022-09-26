Return-Path: <andriy.danylovskyy@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C075C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 12:48:17 +0000 (UTC)
Subject: Re: [PATCH] classes/patch: move QUILT_PC for patching consistency
To: openembedded-core@lists.openembedded.org
From: "Andriy Danylovskyy" <andriy.danylovskyy@streamunlimited.com>
X-Originating-Location: Vienna, AT (91.114.0.140)
X-Originating-Platform: Linux Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 Sep 2022 05:48:07 -0700
References: 
 <CA+chaQdhDrwCWHe3B=MQw+Zp4RTxd9AF1QLdORp_kVaAAvPj2Q@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdhDrwCWHe3B=MQw+Zp4RTxd9AF1QLdORp_kVaAAvPj2Q@mail.gmail.com>
Message-ID: <15447.1664196487680361283@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cwN9WjyvD407AxSAhDf2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 12:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171064

--cwN9WjyvD407AxSAhDf2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Martin. Yes, it does, just tried it on the latest master. When I cro=
ss-checked this before, I must have done it on an older project, with quilt=
 0.66 (and applying c9d36882044 there doesn't help, either).

On 26/09/2022 13:21, Martin Jansa wrote:

>=20
> > I am aware of the "force-unpack + patch" scenario, discussed in https:/=
/lists.yoctoproject.org/g/yocto/topic/89948013#56602
> , and this patch, sadly, doesn't fix that.
>=20
> Wasn't this scenario fixed by: c9d36882044b1c633d8611a77df54cd68c9bee25 ?
>=20
> It was for me.
>

--cwN9WjyvD407AxSAhDf2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Martin. Yes, it does, just tried it on the latest master. When I cro=
ss-checked this before, I must have done it on an older project, with quilt=
 0.66 (and applying c9d36882044 there doesn't help, either).<br /><br />
<div class=3D"moz-cite-prefix">On 26/09/2022 13:21, Martin Jansa wrote:</di=
v>
<blockquote cite=3D"mid:CA+chaQdhDrwCWHe3B=3DMQw+Zp4RTxd9AF1QLdORp_kVaAAvPj=
2Q@mail.gmail.com">
<div dir=3D"ltr">
<div>&gt; I am aware of the "force-unpack + patch" scenario, discussed in&n=
bsp;<a href=3D"https://lists.yoctoproject.org/g/yocto/topic/89948013#56602"=
 target=3D"_blank" rel=3D"noopener">https://lists.yoctoproject.org/g/yocto/=
topic/89948013#56602</a>, and this patch, sadly, doesn't fix that.</div>
<div>&nbsp;</div>
<div>Wasn't this scenario fixed by: c9d36882044b1c633d8611a77df54cd68c9bee2=
5 ?</div>
<div>&nbsp;</div>
<div>It was for me.</div>
</div>
</blockquote>

--cwN9WjyvD407AxSAhDf2--

