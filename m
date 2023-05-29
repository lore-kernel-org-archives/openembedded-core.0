Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24576C77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 20:16:56 +0000 (UTC)
Subject: Re: [kirkstone][PATCH 1/5] recipetool: create: npm: Remove duplicate function to not have future conflicts
To: openembedded-core@lists.openembedded.org
From: belouargamohamed@gmail.com
X-Originating-Location: Cahors, Occitanie, FR (79.80.30.96)
X-Originating-Platform: Linux Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 May 2023 13:16:53 -0700
References: <CAOSpxdYft-9vk_Cb3VJY-pUoHJF2nyYBneiH=wXCueVdUqiLwA@mail.gmail.com>
In-Reply-To: <CAOSpxdYft-9vk_Cb3VJY-pUoHJF2nyYBneiH=wXCueVdUqiLwA@mail.gmail.com>
Message-ID: <1046.1685391413156535299@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fqnp6EebyYabivbe4iuw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 20:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181892

--fqnp6EebyYabivbe4iuw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yes, the same issues are present in master branch.

But this series of patches won't work on master, it needs some adaptation.

Because in kirkstone we have Nodejs 16.19.1 and in master we have Nodejs 18=
.16, and they generate shrinkwrap files that are slightly different.

For Mickledore, I didn't test yet but I think that it will work like in the=
 master branch.

Note: these changes work only if my patch for bitbake is accepted: https://=
lists.openembedded.org/g/bitbake-devel/topic/kirkstone_patch_fetch2/9916359=
8?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,99163598,previd%3D1685367=
798112436212,nextid%3D1683629533018906083&previd=3D1685367798112436212&next=
id=3D1683629533018906083

Best regards,
BELOUARGA Mohamed

--fqnp6EebyYabivbe4iuw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D":3ql" class=3D"Ar Au Ao" style=3D"display: block;">
<div id=3D":3qh" class=3D"Am Al editable LW-avf tS-tW tS-tY" style=3D"direc=
tion: ltr; min-height: 85px;" tabindex=3D"1" role=3D"textbox" contenteditab=
le=3D"true" spellcheck=3D"false" aria-label=3D"Corps du message" aria-multi=
line=3D"true" aria-owns=3D":3t9" aria-controls=3D":3t9">
<div dir=3D"ltr">
<div>Yes, the same issues are present in master branch.</div>
<div>&nbsp;</div>
<div>But this series of patches won't work on master, it needs some adaptat=
ion.</div>
<div>&nbsp;</div>
<div>Because in kirkstone we have Nodejs 16.19.1 and in master we have Node=
js 18.16, and they generate shrinkwrap files that are slightly different.</=
div>
<div>&nbsp;</div>
<div>For Mickledore, I didn't test yet but I think that it will work like i=
n the master branch.</div>
<div>&nbsp;</div>
<div>&nbsp;Note: these changes work only if my patch for bitbake is accepte=
d: https://lists.openembedded.org/g/bitbake-devel/topic/kirkstone_patch_fet=
ch2/99163598?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,99163598,previ=
d%3D1685367798112436212,nextid%3D1683629533018906083&amp;previd=3D168536779=
8112436212&amp;nextid=3D1683629533018906083</div>
<div>&nbsp;</div>
<div>Best regards,</div>
<div>BELOUARGA Mohamed</div>
</div>
</div>
</div>

--fqnp6EebyYabivbe4iuw--

