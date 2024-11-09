Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95109D5E378
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 17:09:37 +0000 (UTC)
Subject: Re: Question: Need advise with providing native Bluetooth sockets for Python
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 09:09:33 -0800
References: <20128.1731163792219546941@lists.openembedded.org>
In-Reply-To: <20128.1731163792219546941@lists.openembedded.org>
Message-ID: <20128.1731172173460804344@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Mi9wERT86vhKCZ1kDCiG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 17:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206908

--Mi9wERT86vhKCZ1kDCiG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Adding this to bluez5 bbappend:

PACKAGECONFIG:class-native =3D ""
BBCLASSEXTEND =3D "native"

And to python3 bbappend:
DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES', '=
bluetooth', 'bluez5-native', '', d)}"

Seems to do the trick.

--Mi9wERT86vhKCZ1kDCiG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Adding this to bluez5 bbappend:</div>
<div>&nbsp;</div>
<div>PACKAGECONFIG:class-native =3D ""</div>
<div>BBCLASSEXTEND =3D "native"</div>
<div>&nbsp;</div>
<div>And to python3 bbappend:</div>
<div>DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURE=
S', 'bluetooth', 'bluez5-native', '', d)}"</div>
<div>&nbsp;</div>
<div>Seems to do the trick.</div>

--Mi9wERT86vhKCZ1kDCiG--

