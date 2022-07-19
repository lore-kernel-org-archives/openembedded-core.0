Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDB5C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 19:38:51 +0000 (UTC)
Subject: Re: Forced password change in first login
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?utf-8?q?Fegyvernek=2C_J=C3=A1sz-Nagykun-Szolnok=2C?=
 =?utf-8?q?_HU_=28178=2E48=2E208=2E198=29?=
X-Originating-Platform: Windows Chrome 103
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 19 Jul 2022 12:38:49 -0700
References: <7de31512-a9f1-4682-15a5-06b53da83458@theobroma-systems.com>
In-Reply-To: <7de31512-a9f1-4682-15a5-06b53da83458@theobroma-systems.com>
Message-ID: <21049.1658259529123357494@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="IwaRxs3dxw91lC5mmXwW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 19:38:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168288

--IwaRxs3dxw91lC5mmXwW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I got this "feature" on Yocto project of Xilinx ( https://xilinx-wiki.atlas=
sian.net/wiki/spaces/A/pages/18841883/Yocto ) rel-v2022.1 (honister). It se=
ems to me my Linux kernel uses SHA-512 in default because after my first pa=
ssword change i could se the ident number of this encryption in /etc/shadow=
 ( https://www.cyberciti.biz/faq/understanding-etcshadow-file/ ). For all o=
f my pre-made users from Yocto recipes if they had SHA-256 password hash, i=
n first login it was forced to change. I could solve it after that i realiz=
edm my Linux build likes to generate SHA-512 password has in run-time.

--IwaRxs3dxw91lC5mmXwW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I got this "feature" on <a href=3D"https://xilinx-wiki.atlassian.net/wiki/s=
paces/A/pages/18841883/Yocto" target=3D"_blank" rel=3D"noopener">Yocto proj=
ect of Xilinx</a> rel-v2022.1 (honister). It seems to me my Linux kernel us=
es SHA-512 in default because after my first password change i could se the=
 ident number of this encryption in <a href=3D"https://www.cyberciti.biz/fa=
q/understanding-etcshadow-file/" target=3D"_blank" rel=3D"noopener">/etc/sh=
adow</a>. For all of my pre-made users from Yocto recipes if they had SHA-2=
56 password hash, in first login it was forced to change. I could solve it =
after that i realizedm my Linux build likes to generate SHA-512 password ha=
s in run-time.

--IwaRxs3dxw91lC5mmXwW--

