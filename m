Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E6CD41D60
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 06:49:04 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.80842.1731394142159969377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 22:49:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 337768E3;
	Tue, 12 Nov 2024 07:49:00 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.16]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tAkhv-273SAC0; Tue, 12 Nov 2024 07:48:59 +0100
Date: Tue, 12 Nov 2024 07:51:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <KDSTMS.8IBC274NUKYA3@t-online.de>
In-Reply-To: <FD0CD04C-EB0D-4DE4-A6C0-ED91DBDBDEBE@arm.com>
References: <20241110132848.2135721-1-f_l_k@t-online.de>
	<CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
	<1806A2E5B9CEF1AC.19665@lists.openembedded.org>
	<SQQQMS.OQC2MWOKNELB1@t-online.de>
	<CANNYZj_AK7rWMRkkiincd7TZwWX4+iYziAM=UG5kOmKSC9nvSg@mail.gmail.com>
	<FD0CD04C-EB0D-4DE4-A6C0-ED91DBDBDEBE@arm.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-EqfODykhTYM1Xji/O7Yx"
X-TOI-EXPURGATEID: 150726::1731394139-44FF75D1-8122F629/0/0 CLEAN NORMAL
X-TOI-MSGID: 161e1e9a-89e5-4309-833b-3142f336bd66
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 06:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206986

--=-EqfODykhTYM1Xji/O7Yx
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

Since you are already working on it, this can be ignored.

On Mon, Nov 11 2024 at 01:31:29 PM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
>=20
>=20
>>  On 10 Nov 2024, at 16:33, Alexander Kanavin via=20
>> lists.openembedded.org=20
>> <alex.kanavin=3Dgmail.com@lists.openembedded.org=20
>> <mailto:alex.kanavin=3Dgmail.com@lists.openembedded.org>> wrote:
>>=20
>>  On Sun, 10 Nov 2024 at 16:21, Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>> wrote:
>>>=20
>>>  According to meson documentation:
>>>=20
>>>   --auto-features {enabled,disabled,auto}
>>>                                         Override value of all=20
>>> 'auto' features
>>>                                         (default: auto).
>>=20
>>  Shouldn't this go to meson.bbclass then? It's useful everywhere.
>=20
> Yes, I believe so.
>=20
> <https://git.yoctoproject.org/poky-contrib/log/?h=3Dross/mesonopts> is=20
> a WIP from some time ago where I changed the auto-features option and=20
> went around forcing options where it changed build options. =20
> There=E2=80=99s a few packages that were still to do =E2=80=94 I left gst=
reamer=20
> as auto for now as the list of options is quite extensive but that=20
> should probably be fixed.  Somewhere there=E2=80=99s a script to run the=20
> meson configuration into a PACKAGECONFIG statement that just needs=20
> the DEPENDS filled in=E2=80=A6
>=20
> Ross


--=-EqfODykhTYM1Xji/O7Yx
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Since you are already working on i=
t, this can be ignored.</div></div><div id=3D"geary-quote" dir=3D"auto"><br=
>On Mon, Nov 11 2024 at 01:31:29 PM +00:00:00, Ross Burton &lt;Ross.Burton@=
arm.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" st=
yle=3D"white-space: break-spaces;">

<blockquote> On 10 Nov 2024, at 16:33, Alexander Kanavin via lists.openembe=
dded.org &lt;<a href=3D"mailto:alex.kanavin=3Dgmail.com@lists.openembedded.=
org">alex.kanavin=3Dgmail.com@lists.openembedded.org</a>&gt; wrote:
=20
 On Sun, 10 Nov 2024 at 16:21, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-on=
line.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>=20
 According to meson documentation:
=20
  --auto-features {enabled,disabled,auto}
                                        Override value of all 'auto' featur=
es
                                        (default: auto).
</blockquote>=20
 Shouldn't this go to meson.bbclass then? It's useful everywhere.
</blockquote>
Yes, I believe so.

<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dross/mesonopt=
s">https://git.yoctoproject.org/poky-contrib/log/?h=3Dross/mesonopts</a> is=
 a WIP from some time ago where I changed the auto-features option and went=
 around forcing options where it changed build options.  There=E2=80=99s a =
few packages that were still to do =E2=80=94 I left gstreamer as auto for n=
ow as the list of options is quite extensive but that should probably be fi=
xed.  Somewhere there=E2=80=99s a script to run the meson configuration int=
o a PACKAGECONFIG statement that just needs the DEPENDS filled in=E2=80=A6

Ross</div></blockquote></div>
--=-EqfODykhTYM1Xji/O7Yx--


