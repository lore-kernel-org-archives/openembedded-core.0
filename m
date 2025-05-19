Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D670DC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:13:02 +0000 (UTC)
Subject: Re: [PATCH] package: disable renamed dependency error if allarch is overridden
To: openembedded-core@lists.openembedded.org
From: "Oleksandr Hnatiuk" <ohnatiuk@cisco.com>
X-Originating-Location: London, England, GB (64.103.40.20)
X-Originating-Platform: Linux Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 May 2025 03:13:00 -0700
References: <CANNYZj_MGGaG_GnZB=OtEHqd9xzmq7+2JQePc1szNJxxFNU2hw@mail.gmail.com>
In-Reply-To: <CANNYZj_MGGaG_GnZB=OtEHqd9xzmq7+2JQePc1szNJxxFNU2hw@mail.gmail.com>
Message-ID: <23322.1747649580665167105@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dtWdesCdwCIm8OdHE6BY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 10:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216830

--dtWdesCdwCIm8OdHE6BY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

How would building packages for SDK work without inheriting nativesdk?

All other packagegroups in this variable use $MACHINE to parametrize themse=
lves, so they are not plain packagegroups either.
Furthermore, they inherit cross-canadian which sets PACKAGE_ARCH in the sam=
e way nativesdk.bbclass does.

I cannot know every single detail and history behind why oe-core works the =
way that it does.
What I do know is that I cannot add certain packages to SDK packagegroup be=
cause an unrelated error check is producing a false positive because the po=
ssibility of an allarch override is not being accounted for.

--dtWdesCdwCIm8OdHE6BY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>How would building packages for SDK work without inheriting nativesdk?=
</div>
<div>&nbsp;</div>
<div>All other packagegroups in this variable use $MACHINE to parametrize t=
hemselves, so they are not plain packagegroups either.</div>
<div>Furthermore, they inherit cross-canadian which sets PACKAGE_ARCH in th=
e same way nativesdk.bbclass does.</div>
<div>&nbsp;</div>
<div>I cannot know every single detail and history behind why oe-core works=
 the way that it does.</div>
<div>What I do know is that I cannot add certain packages to SDK packagegro=
up because an unrelated error check is producing a false positive because t=
he possibility of an allarch override is not being accounted for.</div>

--dtWdesCdwCIm8OdHE6BY--

