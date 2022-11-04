Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC678C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 12:42:10 +0000 (UTC)
Subject: Re: How to use linux-firmware to install single firmware package? #kirkstone
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Stuttgart, Baden-Württemberg, DE (194.39.218.10)
X-Originating-Platform: Windows Chrome 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 04 Nov 2022 05:42:06 -0700
References: <3ac2df35-d9be-5b2d-1576-38ba5a712d56@theobroma-systems.com>
In-Reply-To: <3ac2df35-d9be-5b2d-1576-38ba5a712d56@theobroma-systems.com>
Message-ID: <17126.1667565726738758884@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5prA1yYT2ZYO78HkjQuR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 12:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172711

--5prA1yYT2ZYO78HkjQuR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In my tmp/deploy/rpm/noarch folder i can see many-many other firmware .rpm =
files like linux-firmware-bcm43xx, linux-firmware-nvidia-tegra and so on, t=
hese were not planed to be installed. It seems to me, the full linux-firmwa=
re package was deployed somehow. I think i am using poky now, this is my pa=
th for linux-firmware: PROJECT/sources/poky/meta/recipes-kernel/linux-firmw=
are/linux-firmware_20220913.bb

So, my poky come from git.yoctoproject.org ( https://git.yoctoproject.org/p=
oky/log/?h=3Dkirkstone ) , i use latest kirkstone commit ( https://git.yoct=
oproject.org/poky/commit/?h=3Dkirkstone&id=3D2e79b199114b25d81bfaa029ccfb17=
676946d20d ).

In pn-buildlist and task-depends.dot i can see only linux-firmware, i have =
no any listed single package like should be linux-firmware-imx-sdma-imx7d.

--5prA1yYT2ZYO78HkjQuR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>In my tmp/deploy/rpm/noarch folder i can see many-many other firmware .r=
pm files like linux-firmware-bcm43xx, linux-firmware-nvidia-tegra and so on=
, these were not planed to be installed. It seems to me, the full linux-fir=
mware package was deployed somehow. I think i am using poky now, this is my=
 path for linux-firmware: PROJECT/sources/poky/meta/recipes-kernel/linux-fi=
rmware/linux-firmware_20220913.bb<br /><br />So, my poky come from <a href=
=3D"https://git.yoctoproject.org/poky/log/?h=3Dkirkstone" target=3D"_blank"=
 rel=3D"noopener">git.yoctoproject.org</a>, i use latest <a href=3D"https:/=
/git.yoctoproject.org/poky/commit/?h=3Dkirkstone&amp;id=3D2e79b199114b25d81=
bfaa029ccfb17676946d20d" target=3D"_blank" rel=3D"noopener">kirkstone commi=
t</a>.<br /><br />In pn-buildlist and task-depends.dot i can see only linux=
-firmware, i have no any listed single package like should be linux-firmwar=
e-imx-sdma-imx7d.</p>

--5prA1yYT2ZYO78HkjQuR--

