Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680DEC4707B
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 00:13:44 +0000 (UTC)
Subject: Re: [PATCH 1/2] packagegroup-core-x11-xserver: use RRECOMMENDS for mesa-driver-swrast
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Detroit, Michigan, US (68.55.8.61)
X-Originating-Platform: Linux Firefox 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 13 Jan 2024 16:13:35 -0800
References: <CANNYZj9nM2eKQoxi+=ecJ3K4LmL0rPaduayjFKHv+NsD44uaCg@mail.gmail.com>
In-Reply-To: <CANNYZj9nM2eKQoxi+=ecJ3K4LmL0rPaduayjFKHv+NsD44uaCg@mail.gmail.com>
Message-ID: <21695.1705191215886244560@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="MxOmBAPlK4pawwqnlPIK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 00:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193609

--MxOmBAPlK4pawwqnlPIK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey just updating,

Best to mark this one as a non issue.

Everything I tried when I use poky resulted in a complete build.

Oddly enough however in my setup if you run

*MACHINE=3D"qemux86-64" bitbake core-image-base*

this results in a complete build.

While running the above using my *build.sh* wrapper script results in

* Solver encountered 1 problem(s):
* Problem 1/1:
*=C2=A0=C2=A0 - package packagegroup-core-x11-1.0-r0.all requires packagegr=
oup-core-x11-xserver, but none of the providers can be installed
*=C2=A0=C2=A0 - conflicting requests
*=C2=A0=C2=A0 - nothing provides mesa-driver-swrast needed by packagegroup-=
core-x11-xserver-1.0-r0.qemux86_64
*
* Solution 1:
*=C2=A0=C2=A0 - do not ask to install a package providing packagegroup-core=
-x11

Probably something I'm doing inside *build.sh*. Still not clear, but I don'=
t think this is an OE issue.

--MxOmBAPlK4pawwqnlPIK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hey just updating,<br /><br /></p>
<p>Best to mark this one as a non issue.</p>
<p>Everything I tried when I use poky resulted in a complete build.</p>
<p>&nbsp;</p>
<p>Oddly enough however in my setup if you run</p>
<p><strong>MACHINE=3D"qemux86-64" bitbake core-image-base</strong></p>
<p>this results in a complete build.</p>
<p>&nbsp;</p>
<p>While running the above using my <strong>build.sh</strong> wrapper scrip=
t results in</p>
<p>&nbsp;* Solver encountered 1 problem(s):<br />&nbsp;* Problem 1/1:<br />=
&nbsp;*&nbsp;&nbsp; - package packagegroup-core-x11-1.0-r0.all requires pac=
kagegroup-core-x11-xserver, but none of the providers can be installed<br /=
>&nbsp;*&nbsp;&nbsp; - conflicting requests<br />&nbsp;*&nbsp;&nbsp; - noth=
ing provides mesa-driver-swrast needed by packagegroup-core-x11-xserver-1.0=
-r0.qemux86_64<br />&nbsp;* <br />&nbsp;* Solution 1:<br />&nbsp;*&nbsp;&nb=
sp; - do not ask to install a package providing packagegroup-core-x11</p>
<p>Probably something I'm doing inside <strong>build.sh</strong>. Still not=
 clear, but I don't think this is an OE issue.</p>

--MxOmBAPlK4pawwqnlPIK--

