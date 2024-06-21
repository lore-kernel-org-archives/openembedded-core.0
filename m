Return-Path: <gauravpathak2@eaton.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6DDC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 14:30:01 +0000 (UTC)
Subject: Facing Issue in generating initramfs image bundle on Openembedded-Core Kirkstone
To: openembedded-core@lists.openembedded.org
From: gauravpathak2@eaton.com
X-Originating-Location: US (136.226.254.111)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 21 Jun 2024 07:29:56 -0700
Message-ID: <YY3c.1718980196853108639.8xuw@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qTtvlsU3roJe0EwCAimt"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 14:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201026

--qTtvlsU3roJe0EwCAimt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello List,

I am using openembedded-core for building Linux image and I am facing issue=
 while trying to generate initramfs bundle.

I have used

INITRAMFS_IMAGE_BUNDLE =3D "1"
and also

MACHINE_FEATURES +=3D "fit"

I get error in Kernel do_install task

install: cannot stat 'fitImage': No such file or directory

I found out that do_assemble_fitimage task gets removed when INITRAMFS_IMAG=
E_BUNDLE is set to 1
- https://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-f=
itimage.bbclass?h=3Dkirkstone#n807 ( https://lists.openembedded.org/g/-%20h=
ttps:/git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitim=
age.bbclass?h=3Dkirkstone#n807 )

I want to generate initramfs images for images mentioned in KERNEL_IMAGETYP=
ES variable such that I should get uImage-initramfs-<machine-name>.bin, Ima=
ge-initramfs-<machine-name>.bin.

Can anyone please help in this regard?

--qTtvlsU3roJe0EwCAimt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello List,</p>
<p>I am using openembedded-core for building Linux image and I am facing is=
sue while trying to generate initramfs bundle.</p>
<p>I have used</p>
<p><span style=3D"font-family: courier_newregular, courier;">INITRAMFS_IMAG=
E_BUNDLE =3D "1"<br /><span style=3D"font-family: system-ui, 'helvetica neu=
e';">and also</span></span></p>
<p><span style=3D"font-family: courier_newregular, courier;">MACHINE_FEATUR=
ES +=3D "fit"<br /><br /><span style=3D"font-family: system-ui, 'helvetica =
neue';">I get error in Kernel do_install task<br /><br /><span style=3D"fon=
t-family: courier_newregular, courier;">install: cannot stat 'fitImage': No=
 such file or directory<br /><br /><span style=3D"font-family: system-ui, '=
helvetica neue';">I found out that</span> do_assemble_fitimage <span style=
=3D"font-family: system-ui, 'helvetica neue';">task gets removed when</span=
> <span style=3D"font-family: courier_newregular, courier;">INITRAMFS_IMAGE=
_BUNDLE <span style=3D"font-family: system-ui, 'helvetica neue';">is set to=
</span> 1</span> <br /><a href=3D"https://lists.openembedded.org/g/-%20http=
s:/git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage=
.bbclass?h=3Dkirkstone#n807" target=3D"_blank" rel=3D"noopener"><span style=
=3D"font-family: system-ui, 'helvetica neue';">- https://git.openembedded.o=
rg/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass?h=3Dkirkston=
e#n807</span></a><br /><br /><span style=3D"font-family: system-ui, 'helvet=
ica neue';">I want to generate</span> initramfs <span style=3D"font-family:=
 system-ui, 'helvetica neue';">images for images mentioned in</span> KERNEL=
_IMAGETYPES <span style=3D"font-family: system-ui, 'helvetica neue';">varia=
ble such that I should get uImage-initramfs-&lt;machine-name&gt;.bin, Image=
-initramfs-&lt;machine-name&gt;.bin.</span></span></span></span></p>
<p><span style=3D"font-family: courier_newregular, courier;"><span style=3D=
"font-family: system-ui, 'helvetica neue';"><span style=3D"font-family: cou=
rier_newregular, courier;"><br /><span style=3D"font-family: system-ui, 'he=
lvetica neue';">Can anyone please help in this regard?</span></span></span>=
</span></p>

--qTtvlsU3roJe0EwCAimt--

