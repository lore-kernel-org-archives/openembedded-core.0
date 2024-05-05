Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7175FC4345F
	for <webhook@archiver.kernel.org>; Sun,  5 May 2024 11:41:14 +0000 (UTC)
Subject: Re: [PATCH] python3-manifest: prune python3-core
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 May 2024 04:41:10 -0700
References: <2135.1714611001880482361@lists.openembedded.org>
In-Reply-To: <2135.1714611001880482361@lists.openembedded.org>
Message-ID: <1416.1714909270765233010@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bjz77BGfUbiK7n49E6oS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 11:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199019

--bjz77BGfUbiK7n49E6oS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi again Tim, update from me regarding the scripts. TLDR: The manifest is o=
ut of date, and the python scripts are working as they should.

----

I've convinced myself the python scripts used to generate the manifest *are=
 correct*. However, for anyone reading this, I can confirm the manifest is =
out of date. It would be nice to run the script on the next Python upgrade =
since it will remove a lot of dead file entries.

I couldn't see where I went wrong in my statement in the previous email I s=
ent. I suspect two things 1) I wasn't looking at the correct "new" json out=
put from the task 2) part to blame is I didn't fully enable all PACKAGECONF=
IGS, but this seems to mainly affect the tkinter and turtle packages.

On the bright side of things I did learn a few things so this wasn't a tota=
l waste of time for me :) Just makes things even more fun.

Best regards,
Gudni

--bjz77BGfUbiK7n49E6oS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi again Tim, update from me regarding the scripts. TLDR: The manifest is o=
ut of date, and the python scripts are working as they should.<br /><br />-=
---<br /><br />I've convinced myself the python scripts used to generate th=
e manifest <strong>are correct</strong>. However, for anyone reading this, =
I can confirm the manifest is out of date. It would be nice to run the scri=
pt on the next Python upgrade since it will remove a lot of dead file entri=
es.<br /><br />I couldn't see where I went wrong in my statement in the pre=
vious email I sent. I suspect two things 1) I wasn't looking at the correct=
 "new" json output from the task 2) part to blame is I didn't fully enable =
all PACKAGECONFIGS, but this seems to mainly affect the tkinter and turtle =
packages.<br /><br />On the bright side of things I did learn a few things =
so this wasn't a total waste of time for me :) Just makes things even more =
fun.<br /><br />Best regards,<br />Gudni

--bjz77BGfUbiK7n49E6oS--

