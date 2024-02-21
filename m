Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396FAC48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 16:15:38 +0000 (UTC)
Subject: Re: [Openembedded-architecture] [RFC PATCH] Add genericarm64 MACHINE using upstream defconfig
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Poplar, England, GB (84.70.146.249)
X-Originating-Platform: Mac Firefox 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 21 Feb 2024 08:15:28 -0800
References: <ee6a686362c533dc70c442b64c96ca23b8bde45c.camel@linuxfoundation.org>
In-Reply-To: <ee6a686362c533dc70c442b64c96ca23b8bde45c.camel@linuxfoundation.org>
Message-ID: <29891.1708532128196960218@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kLfY2k6eAymidqznGQRc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 16:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195980

--kLfY2k6eAymidqznGQRc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 03:21 AM, Richard Purdie wrote:

>=20
> I think it comes down to whether the fragments are usable and testable.
> We have a list of targets we want this new machine to run on so lets
> start with those, define genericarm64 as that set of fragments combined
> plus the generic pieces linux-yocto adds, then go from there. If you
> add a new machine to the test matrix, we add a new fragment. If someone
> wants to add new config, they need to show a machine using it.

Although Ross mentioned that there are not a lot of SystemReady IR compatib=
le hardware in the wild, we're already talking about tens of them in existe=
nce. With this approach the genericarm64 machine will be compatible with on=
ly some of them unless we test all of the certified platforms and update ke=
rnel fragments accordingly.

The whole idea of SystemReady+defconfig is that it would allow to avoid fut=
ure maintenance of kernel fragments in Yocto for existing and new SR certif=
ied platforms. If a platform is SystemReady certified (i.e. required driver=
s are up-streamed and mainline defconfig is updated) then the genericarm64 =
Yocto image would "just work".=C2=A0 On the last Yocto summit Bruce mention=
ed a tool which can automate defconfig -> kernel fragments conversion. Usin=
g this tool as a part of kernel versions updates in Yocto might solve the p=
roblem for genericarm64. But, I don't know how up to date and robust the to=
ols is.

Some additional information explaining requirements for genericarm64=C2=A0 =
- currently for SystemReady IR certification it is required that at least t=
wo of the main Linux distros (Fedora, Debian, Ubuntu, OpenSuse) generic arm=
64 images are bootable and functional. We would like to expand this list wi=
th Yocto and Openwrt as well. There is also a PR into Openwrt which adds a =
generic armsr target with the same defconfig approach to build the kernel.

Cheers,

Anton

--kLfY2k6eAymidqznGQRc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 03:21 AM, Richard Purdie wrote:<br />
<blockquote>I think it comes down to whether the fragments are usable and t=
estable.<br />We have a list of targets we want this new machine to run on =
so lets<br />start with those, define genericarm64 as that set of fragments=
 combined<br />plus the generic pieces linux-yocto adds, then go from there=
. If you<br />add a new machine to the test matrix, we add a new fragment. =
If someone<br />wants to add new config, they need to show a machine using =
it.</blockquote>
<br />
<p>Although Ross mentioned that there are not a lot of SystemReady IR compa=
tible hardware in the wild, we're already talking about tens of them in exi=
stence. With this approach the genericarm64 machine will be compatible with=
 only some of them unless we test all of the certified platforms and update=
 kernel fragments accordingly. </p>
<p>The whole idea of SystemReady+defconfig is that it would allow to avoid =
future maintenance of kernel fragments in Yocto for existing and new SR cer=
tified platforms. If a platform is SystemReady certified (i.e. required dri=
vers are up-streamed and mainline defconfig is updated) then the genericarm=
64 Yocto image would "just work".&nbsp; On the last Yocto summit Bruce ment=
ioned a tool which can automate defconfig -&gt; kernel fragments conversion=
. Using this tool as a part of kernel versions updates in Yocto might solve=
 the problem for genericarm64. But, I don't know how up to date and robust =
the tools is.&nbsp; </p>
<p>Some additional information explaining requirements for genericarm64&nbs=
p; - currently for SystemReady IR certification it is required that at leas=
t two of the main Linux distros (Fedora, Debian, Ubuntu, OpenSuse) generic =
arm64 images are bootable and functional. We would like to expand this list=
 with Yocto and Openwrt as well. There is also a PR into Openwrt which adds=
 a generic armsr target with the same defconfig approach to build the kerne=
l.</p>
<p>&nbsp;</p>
<p>Cheers,</p>
<p>Anton</p>
<p>&nbsp;</p>

--kLfY2k6eAymidqznGQRc--

