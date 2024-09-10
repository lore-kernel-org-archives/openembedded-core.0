Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F78ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 08:18:01 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 2/2] bluez5: Install /etc/bluetooth/main.conf
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Reykjavik, Capital Region, IS (46.182.184.62)
X-Originating-Platform: iPhone Safari 18
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 01:17:51 -0700
References: <20240910000209.3330191-2-pkj@axis.com>
In-Reply-To: <20240910000209.3330191-2-pkj@axis.com>
Message-ID: <30802.1725956271959929509@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EnKtO7pXuBkOQwlwCqKf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204338

--EnKtO7pXuBkOQwlwCqKf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi thanks for the patch. I have one concern. Normally one would install a c=
ustom main.conf and not the one from BlueZ. With these changes is that stil=
l possible with a bbappend? The file must be installed in the same folder, =
I worry if this creates a conflict when two recipes are installing main.con=
f.

Best regards,
Gudni

--EnKtO7pXuBkOQwlwCqKf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi thanks for the patch. I have one concern. Normally one would instal=
l a custom main.conf and not the one from BlueZ. With these changes is that=
 still possible with a bbappend? The file must be installed in the same fol=
der, I worry if this creates a conflict when two recipes are installing mai=
n.conf.</div>
<div>&nbsp;</div>
<div>Best regards,</div>
<div>Gudni</div>

--EnKtO7pXuBkOQwlwCqKf--

