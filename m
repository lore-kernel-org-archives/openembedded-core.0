Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CC1C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:22:56 +0000 (UTC)
Subject: Re: [AUH] bluez5: upgrading to 5.76 FAILED
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Jul 2024 07:22:52 -0700
References: <CANNYZj8Cn3KqC3DDgxNhFPVBjv=BOCkYauZGTQ+3pPf8JWfyhw@mail.gmail.com>
In-Reply-To: <CANNYZj8Cn3KqC3DDgxNhFPVBjv=BOCkYauZGTQ+3pPf8JWfyhw@mail.gmail.com>
Message-ID: <11876.1719843772013706895@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="JhHMbKy7IlTCrorMf8ve"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 14:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201305

--JhHMbKy7IlTCrorMf8ve
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Then to complete the upgrade there are two tasks:

1) Remove patch file: 0001-Allow-using-obexd-without-systemd-in-the-user-se=
ssio.patch
2) Create a patch file for https://marc.info/?l=3Dlinux-bluetooth&m=3D17132=
4504410000&w=3D2 to fix the issue where --disable-cups option fails the bui=
ld. This patch is ~3 months old, anyone know if that is unusually long revi=
ew for the Linux kernel? Might it be worth it to submit a new patch which a=
t least signs the commit?

I probably won't be able to look at this until next weekend earliest.

--JhHMbKy7IlTCrorMf8ve
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Then to complete the upgrade there are two tasks:<br /><br />1) Remove patc=
h file: <em><span style=3D"box-sizing: border-box; color: #000000; font-fam=
ily: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberat=
ion Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe=
 UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-variant-ligatures: n=
ormal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: normal;">0001-Allow-u=
sing-obexd-without-systemd-in-the-user-sessio.patch</span></em><br />2) Cre=
ate a patch file for <a href=3D"https://marc.info/?l=3Dlinux-bluetooth&amp;=
m=3D171324504410000&amp;w=3D2" target=3D"_blank" rel=3D"noopener">https://m=
arc.info/?l=3Dlinux-bluetooth&amp;m=3D171324504410000&amp;w=3D2</a> to fix =
the issue where --disable-cups option fails the build. This patch is ~3 mon=
ths old, anyone know if that is unusually long review for the Linux kernel?=
 Might it be worth it to submit a new patch which at least signs the commit=
?<br /><br />I probably won't be able to look at this until next weekend ea=
rliest.

--JhHMbKy7IlTCrorMf8ve--

