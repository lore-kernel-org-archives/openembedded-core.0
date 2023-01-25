Return-Path: <dowens@precisionplanting.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1266DC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 17:24:58 +0000 (UTC)
Subject: Use zImage instead of linux.bin in fitImage
To: openembedded-core@lists.openembedded.org
From: dowens@precisionplanting.com
X-Originating-Location: Tampa, Florida, US (174.228.34.234)
X-Originating-Platform: Linux Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 25 Jan 2023 09:24:51 -0800
Message-ID: <SptN.1674667491903478336.gAIC@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ju1IhbrOuq3bdZHUYW60"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 17:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176371

--Ju1IhbrOuq3bdZHUYW60
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm trying to build a fit image for an ARM target and am struggling to conf=
igure kernel-fitimage in such a way that it includes zImage as the fitImage=
 kernel instead of linux.bin.=C2=A0 zImage is significantly smaller than li=
nux.bin and can be used on my system without needing to modify u-boot's=C2=
=A0CONFIG_SYS_BOOTM_LEN due to the large kernel size.

I've tried several permutations of the following settings in my machine.con=
f file without success:
KERNEL_CLASSES +=3D "kernel-fitimage"
KERNEL_IMAGETYPE =3D "fitImage"
KERNEL_IMAGETYPES +=3D "zImage"
KERNEL_IMAGETYPE_REPLACEMENT =3D "zImage"

I've also tried patterning my config on oe-core/meta/lib/oeqa/selftest/case=
s/fitimage.py which uses several combinations of the settings above.=C2=A0 =
In every case, linux.bin is the kernel included in the resulting fitImage.=
=C2=A0 Is there some combination of settings that will enable zImage in my =
fit image?

Thanks,
Dave

--Ju1IhbrOuq3bdZHUYW60
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm trying to build a fit image for an ARM target and am struggling to conf=
igure kernel-fitimage in such a way that it includes zImage as the fitImage=
 kernel instead of linux.bin.&nbsp; zImage is significantly smaller than li=
nux.bin and can be used on my system without needing to modify u-boot's&nbs=
p;CONFIG_SYS_BOOTM_LEN due to the large kernel size.<br /><br />I've tried =
several permutations of the following settings in my machine.conf file with=
out success:<br />
<div><em>KERNEL_CLASSES +=3D "kernel-fitimage"</em></div>
<div><em>KERNEL_IMAGETYPE =3D "fitImage"</em></div>
<div><em>KERNEL_IMAGETYPES +=3D "zImage"</em></div>
<div><em>KERNEL_IMAGETYPE_REPLACEMENT =3D "zImage"</em><br /><br />I've als=
o tried patterning my config on&nbsp;<em>oe-core/meta/lib/oeqa/selftest/cas=
es/fitimage.py</em> which uses several combinations of the settings above.&=
nbsp; In every case, linux.bin is the kernel included in the resulting fitI=
mage.&nbsp; Is there some combination of settings that will enable zImage i=
n my fit image?<br /><br />Thanks,<br />Dave</div>

--Ju1IhbrOuq3bdZHUYW60--

