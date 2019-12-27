Return-Path: <fdk17@ftml.net>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0988D606B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 14:31:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 24241366
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 09:31:16 -0500 (EST)
Received: from imap7 ([10.202.2.57])
	by compute6.internal (MEProxy); Fri, 27 Dec 2019 09:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftml.net; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm2; bh=piqwAxb0GpI//mAxMOUbEfDBeo/x/o+
	0Ue6CeLon3vY=; b=SRMN13gMQHl4QVX4SRF5dNpdBRC6ukad0pWrSra2UYTy81G
	PXtRAx5vo60CxWheJIsP/xcGHIKreud/okxo4dAMzv045BSYpa8vALOJDzkrq7Ei
	aZqCJVPNEPTbEYs2M984MyaHOUt8E05GEg9jacVSPPRHNeclr8p6SZ6u/ALQ3akD
	cKfC1K+svWEMb+8Nal0oBpcTnG/Xw2Gs5Ji2lYR/2uSqg/DB0WaSTpTcTNOcQbJc
	Ekc0sid9xcN+p88OuXBsi6FTMHIRiBZXci0zoti1RtRebWJ/iU1lgHjPQrogLxym
	CLpEosjOOrFrxByz/hPJ/HN0SlqhQvsAPYRJkDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=piqwAx
	b0GpI//mAxMOUbEfDBeo/x/o+0Ue6CeLon3vY=; b=R5NO9+g/dCKsp06b6XjOIZ
	tx9qvM4J4fS/xN8g1UecVVp3k1REZKPxGGhBCnAZUgsihIMbBNj7ZJWX09HJWxPf
	H6OuHw1w7PpVWG7U4dl+ADSBH0Sx5g3NpJyS01os/uOZcmhtZwbLsksGbpuC9AZS
	G/PDXQQ0M9mKBBe5vn4DAQyWNng1hQQ+RQ0FD2bzm2uWjAxoZaUD4zbPqRj8kwAQ
	3zwYEA3s7h7+QyRSR70gC3JTPwx6QFfsDIhO/BZPls/rn1QXqguALAFqu7lrg4mJ
	JsTtTUAQ7SN05qUig1MnanEdSTkQKyYjIY5tpzSkW4+UrasC9VW3GPVB0L696e/w
	==
X-ME-Sender: <xms:sxUGXk1IxO0JTqTgRaIjw0zg67bdzPkKwfWqHKFxWg1WLAqN3k6dFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvkedgieegucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsegrtd
	erreerreejnecuhfhrohhmpedfhfhrvgguuceurghkshhikhdfuceofhgukhdujeesfhht
	mhhlrdhnvghtqeenucfrrghrrghmpehmrghilhhfrhhomhepfhgukhdujeesfhhtmhhlrd
	hnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:sxUGXl9y5WwspnUYrkYAvw2V4frdGgAOtENHBjFOfrxXEe6y1ocavQ>
	<xmx:sxUGXp2NmF6iTLjL4uPEyS-6-VJy3GKi_-TEH_yj_6mjkjYQ84UJfg>
	<xmx:sxUGXq9jvnadOrJSeuhHXdH85jApnF2CqW8Riz7NQIiKIAXuMfKsyA>
	<xmx:sxUGXrCbLjkRb5t_55ToxHXoL-TsDSNVUGqkOMHLqYtRdj_NdHyUog>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7E2D41801C3; Fri, 27 Dec 2019 09:31:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <64c454f8-03fa-435e-ab25-ee4c67edabe2@www.fastmail.com>
In-Reply-To: <32ae7b92-fdc4-4773-8977-282c4502edb0@www.fastmail.com>
References: <1758bd87-e492-46bc-8aaa-514e802c5030@www.fastmail.com>
	<54a01022886647f9baa8608f8a6af5b1@XBOX03.axis.com>
	<32ae7b92-fdc4-4773-8977-282c4502edb0@www.fastmail.com>
Date: Fri, 27 Dec 2019 09:30:55 -0500
From: "Fred Baksik" <fdk17@ftml.net>
To: openembedded-core@lists.openembedded.org
Subject: Re: [meson][PATCH] meson: Allow for llvm-native tools to be	used
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 14:31:15 -0000
Content-Type: multipart/alternative; boundary=8e8a95a6bdfb4e52a24035e8dd43292a

--8e8a95a6bdfb4e52a24035e8dd43292a
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Fri, Dec 27, 2019, at 9:25 AM, fdk17 wrote:
>=20
>=20
> On Fri, Dec 27, 2019, at 7:03 AM, Peter Kjellerstedt wrote:
> > If we=E2=80=99re adding a --native-file, shouldn=E2=80=99t it always=
 be specified, regardless of --cross-file?
>=20
> I don't think so. It seems to me that it should be one or the other. I=
f you are building a -native package then you don't need a native file a=
nd vice versa.=20
>=20

Sorry I meant to write: If you are building a -native package then you d=
on't need a cross file and vice versa.=20

I guess this change is not needed unless you have the updates to build a=
 full llvm-native install. Those changes probably should be part of this=
. If there is any interest then I could make a new version for a working=
 llvm-native with meson patch.=20

--
fdk17

--8e8a95a6bdfb4e52a24035e8dd43292a
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div><br></div><div>=
<br></div><div>On Fri, Dec 27, 2019, at 9:25 AM, fdk17 wrote:<br></div><=
blockquote type=3D"cite" id=3D"qt"><div><br></div><div><br></div><div>On=
 Fri, Dec 27, 2019, at 7:03 AM, Peter Kjellerstedt wrote:<br></div><div>=
&gt; If we=E2=80=99re adding a --native-file, shouldn=E2=80=99t it alway=
s be specified, regardless of --cross-file?<br></div><div><br></div><div=
>I don't think so.&nbsp; It seems to me that it should be one or the oth=
er.&nbsp; If you are building a -native package then you don't need a na=
tive file and vice versa.&nbsp;<br></div><div><br></div></blockquote><di=
v><br></div><div>Sorry&nbsp; I meant to write: If you are building a -na=
tive package then you don't need a cross file and vice versa.&nbsp;<br><=
/div><div><br></div><div>I guess this change is not needed unless you ha=
ve the updates to build a full llvm-native install.&nbsp; Those changes =
probably should be part of this.&nbsp; If there is any interest then I c=
ould make a new version for a working llvm-native with meson patch. <br>=
</div><div><br></div><div>--<br></div><div>fdk17<br></div><div><br></div=
></body></html>

--8e8a95a6bdfb4e52a24035e8dd43292a--
