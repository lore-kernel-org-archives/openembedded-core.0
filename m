Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7C7C3ABC9
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 14:26:58 +0000 (UTC)
Subject: IMAGE_FEATURES  VS  PACKAGEGROUP
To: openembedded-core@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.222.201.120)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 10 May 2025 07:26:50 -0700
Message-ID: <PJWL.1746887210684093988.qpOD@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4ymHiL8Zl4hjvs6dpRtT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 14:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216272

--4ymHiL8Zl4hjvs6dpRtT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Members ,
I was unable to appreciate the exact difference and role to have these two =
entity separately.
Below is my understanding, hence though to check with members to get the cl=
earer picture

IMAGE_FEATURES=C2=A0 : Acts like top level wrapper to have set of packages =
added in image implicitly
- By implicitly i mean which packages will be added is controlled by Yocto =
layer rather than user

PACKAGEGROUP=C2=A0=C2=A0=C2=A0 : Acts like top level wrapper to have set of=
 packages added in image explicitly
- By explicitly i mean which packages will be added is controlled by user

So in my understanding i have mapped IMAGE_FEATURES as "predefined yocto PA=
CKAGEGROUP"

Can members please help to get the exact usage here

Thanks ,
Ashish

--4ymHiL8Zl4hjvs6dpRtT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Members , </div>
<div>I was unable to appreciate the exact difference and role to have these=
 two entity separately.</div>
<div>Below is my understanding, hence though to check with members to get t=
he clearer picture </div>
<div>&nbsp;</div>
<div>IMAGE_FEATURES&nbsp; : Acts like top level wrapper to have set of pack=
ages added in image implicitly</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; - By implicitly i mean which packages will be added is controlled =
by Yocto layer rather than user </div>
<div>&nbsp;</div>
<div>PACKAGEGROUP&nbsp;&nbsp;&nbsp; : Acts like top level wrapper to have s=
et of packages added in image explicitly&nbsp; </div>
<div>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; - By explicitly i mean which packages will be added is controlled by us=
er </div>
<div>&nbsp;</div>
<div>So in my understanding i have mapped IMAGE_FEATURES as "predefined yoc=
to PACKAGEGROUP"</div>
<div>&nbsp;</div>
<div>Can members please help to get the exact usage here </div>
<div>&nbsp;</div>
<div>Thanks ,</div>
<div>Ashish </div>
<div>&nbsp;</div>
<div>&nbsp;</div>

--4ymHiL8Zl4hjvs6dpRtT--

