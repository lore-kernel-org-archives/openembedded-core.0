Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022AFC6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 00:43:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.1309.1679791413480787696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 17:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id 5BA69C3BA;
	Sun, 26 Mar 2023 01:43:31 +0100 (CET)
Received: from [192.168.178.83] ([79.219.238.34]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgETo-1IRM240; Sun, 26 Mar 2023 01:43:28 +0100
Date: Sat, 25 Mar 2023 20:19:50 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <2DC3SR.QP48K851D7YL2@t-online.de>
In-Reply-To: 
	<CANNYZj9AJpny7V47e64KQsmCOitU1vAkzO=C_3+cwOETwtAM=A@mail.gmail.com>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	<9FONRR.ZLSABXKTP67E@t-online.de>
	<a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
	<B0EORR.JWJ884MGYK8G2@t-online.de>
	<CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
	<CHRXRR.A1NILQGNBS7P1@t-online.de>
	<CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
	<1TC1SR.M6OX77V0K20W3@t-online.de>
	<CANNYZj8eyCvwacnVoQui+ghL=cN=D8yDaBWAV1eBtvcz9qPOGA@mail.gmail.com>
	<UHS1SR.41XVDUNLPY6P2@t-online.de>
	<CANNYZj9AJpny7V47e64KQsmCOitU1vAkzO=C_3+cwOETwtAM=A@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qBh/Wp4pg5gBskJGYir3"
X-TOI-EXPURGATEID: 150726::1679791408-9EFFACC3-964089B9/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e65ee41-7b59-4e50-bd1e-f8edabda639e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 00:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179107

--=-qBh/Wp4pg5gBskJGYir3
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Sa, 25. M=E4r 2023 um 19:38:56 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> so if it doesn't regress there, it's fine.

core-image-minimal () - Ran 71 tests in 38.845s
core-image-minimal - OK - All required tests passed (successes=3D1,=20
skipped=3D70, failures=3D0, errors=3D0)
NOTE: Tasks Summary: Attempted 1159 tasks of which 1158 didn't need to=20
be rerun and all succeeded.



--=-qBh/Wp4pg5gBskJGYir3
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Sa, 25. M=E4r 2023 um 19:38:56 +0100=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
so if it doesn't regress there, it's fine.</div></blockquote><div><br></div=
><div><div>core-image-minimal () - Ran 71 tests in 38.845s</div><div>core-i=
mage-minimal - OK - All required tests passed (successes=3D1, skipped=3D70,=
 failures=3D0, errors=3D0)</div><div>NOTE: Tasks Summary: Attempted 1159 ta=
sks of which 1158 didn't need to be rerun and all succeeded.</div></div><di=
v><br></div></div>
--=-qBh/Wp4pg5gBskJGYir3--


