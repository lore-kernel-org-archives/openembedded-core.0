Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63000C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:59:51 +0000 (UTC)
Subject: Re: How to use linux-firmware to install single firmware package? #kirkstone
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: New York, New York, US (172.254.251.35)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 04 Nov 2022 07:59:43 -0700
References: <d682bdd7-ba1f-8708-fb64-6ae29b2ac074@theobroma-systems.com>
In-Reply-To: <d682bdd7-ba1f-8708-fb64-6ae29b2ac074@theobroma-systems.com>
Message-ID: <22885.1667573983338145032@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dXslC1aZ1xOXER34ky2p"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 14:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172718

--dXslC1aZ1xOXER34ky2p
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I can confirm I'm seeing something similar with MACHINE_ESSENTIAL_EXTRA_RDE=
PENDS =3D "linux-firmware-amdgpu"

I use with OE-core kirkstone HEAD + custom distro config. Was wondering of =
the best way to debug why issue occurs.

Is there anything else besides bitbake -g <your-image> and INHERIT +=3D "bu=
ildhistory" that I can try?
How would one best check what happens during rootfs creation?

--dXslC1aZ1xOXER34ky2p
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I can confirm I'm seeing something similar with MACHINE_ESSENTIAL_EXTRA_RDE=
PENDS =3D "linux-firmware-amdgpu"<br /><br />I use with OE-core kirkstone H=
EAD + custom distro config. Was wondering of the best way to debug why issu=
e occurs.<br /><br />Is there anything else besides bitbake -g &lt;your-ima=
ge&gt; and INHERIT +=3D "buildhistory" that I can try?<br />How would one b=
est check what happens during rootfs creation?

--dXslC1aZ1xOXER34ky2p--

