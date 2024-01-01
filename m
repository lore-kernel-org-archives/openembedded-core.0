Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC26C4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 23:42:33 +0000 (UTC)
Subject: Re: [PATCH 1/2] packagegroup-core-x11-xserver: use RRECOMMENDS for mesa-driver-swrast
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Detroit, Michigan, US (68.55.8.61)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Jan 2024 15:42:24 -0800
References: <CANNYZj-0DEz5b=P3+qO+ei-hwD4Fb_gL3fXh9uS_NwSpw-OwhQ@mail.gmail.com>
In-Reply-To: <CANNYZj-0DEz5b=P3+qO+ei-hwD4Fb_gL3fXh9uS_NwSpw-OwhQ@mail.gmail.com>
Message-ID: <25812.1704152544903871733@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="jdjaS6MXzSA6yL7SI06x"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 23:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193193

--jdjaS6MXzSA6yL7SI06x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yea, I can try to find root cause. May just be my setup.

In my setup mesa-driver-swrast package doesn't exists or rather doesn't get=
 generated
which is why during rootfs creation the package manager opkg fails on me.

*Exact error:*

>=20
>=20
>=20
> Solver encountered 1 problem(s):
> Problem 1/1:
> - package packagegroup-core-x11-1.0-r0.all requires
> packagegroup-core-x11-xserver, but none of the providers can be installed
> - conflicting requests
> - nothing provides mesa-driver-swrast needed by
> packagegroup-core-x11-xserver-1.0-r0.qemux86_64
>=20
> Solution 1:
> - do not ask to install a package providing packagegroup-core-x11
>=20
>=20

Can see that it doesn't exists with

>=20
>=20
>=20
> *ls
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/**=
/mesa**
>=20
>=20
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-dbg_23.3.1-r0_core2-64.ipk
>=20
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-dev_23.3.1-r0_core2-64.ipk
>=20
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-megadriver_23.3.1-r0_core2-64.ipk
>=20
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-src_23.3.1-r0_core2-64.ipk
>=20
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-tools_23.3.1-r0_core2-64.ipk
>=20
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-vulkan-drivers_23.3.1-r0_core2-64.ipk
>=20
>=20
>

--jdjaS6MXzSA6yL7SI06x
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Yea, I can try to find root cause. May just be my setup.<br /><br />In m=
y setup mesa-driver-swrast package doesn't exists or rather doesn't get gen=
erated<br />which is why during rootfs creation the package manager opkg fa=
ils on me.</p>
<p><strong>Exact error:</strong></p>
<blockquote>
<p>&nbsp; Solver encountered 1 problem(s):<br />&nbsp; Problem 1/1:<br />&n=
bsp;&nbsp;&nbsp; - package packagegroup-core-x11-1.0-r0.all requires packag=
egroup-core-x11-xserver, but none of the providers can be installed<br />&n=
bsp;&nbsp;&nbsp; - conflicting requests<br />&nbsp;&nbsp;&nbsp; - nothing p=
rovides mesa-driver-swrast needed by packagegroup-core-x11-xserver-1.0-r0.q=
emux86_64<br />&nbsp; <br />&nbsp; Solution 1:<br />&nbsp;&nbsp;&nbsp; - do=
 not ask to install a package providing packagegroup-core-x11</p>
</blockquote>
<p>Can see that it doesn't exists with</p>
<blockquote>
<p><strong>ls tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-ro=
otfs-repo/**/mesa*</strong><br /><br />tmp/work/qemux86_64-underview-linux/=
core-image-base/1.0/oe-rootfs-repo/core2-64/mesa-dbg_23.3.1-r0_core2-64.ipk=
<br />tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-rep=
o/core2-64/mesa-dev_23.3.1-r0_core2-64.ipk<br />tmp/work/qemux86_64-undervi=
ew-linux/core-image-base/1.0/oe-rootfs-repo/core2-64/mesa-megadriver_23.3.1=
-r0_core2-64.ipk<br />tmp/work/qemux86_64-underview-linux/core-image-base/1=
.0/oe-rootfs-repo/core2-64/mesa-src_23.3.1-r0_core2-64.ipk<br />tmp/work/qe=
mux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/core2-64/mesa-t=
ools_23.3.1-r0_core2-64.ipk<br />tmp/work/qemux86_64-underview-linux/core-i=
mage-base/1.0/oe-rootfs-repo/core2-64/mesa-vulkan-drivers_23.3.1-r0_core2-6=
4.ipk</p>
</blockquote>

--jdjaS6MXzSA6yL7SI06x--

