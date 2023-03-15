Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C0DC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 18:05:06 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.532.1678903496820330187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 11:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout09.t-online.de (Postfix) with SMTP id 4790F6855;
	Wed, 15 Mar 2023 19:04:54 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.85]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pcVUb-05gWhM0; Wed, 15 Mar 2023 19:04:54 +0100
Date: Wed, 15 Mar 2023 19:04:48 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <08QKRR.0S9N8GIU94L5@t-online.de>
In-Reply-To: 
	<CANNYZj8QzLCeKESZxbHaaGFP0Xhd0oG00hcNz2Vru4S_m09Cng@mail.gmail.com>
References: <20230315070909.422721-1-f_l_k@t-online.de>
	<CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
	<LZHKRR.FOHLRDXQDV053@t-online.de>
	<CANNYZj_tKEA=CgQJ8QL2660VbvkXizX7+yrZ4EgaPdPnc33Siw@mail.gmail.com>
	<E8OKRR.MV94C2TWISKQ@t-online.de>
	<CANNYZj8QzLCeKESZxbHaaGFP0Xhd0oG00hcNz2Vru4S_m09Cng@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-aBa7bYT7Wp9g3IXXNmWs"
X-TOI-EXPURGATEID: 150726::1678903494-511B9A0B-C10B4F0A/0/0 CLEAN NORMAL
X-TOI-MSGID: 44fa2a07-021a-402c-b094-1eb63304aa33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178656

--=-aBa7bYT7Wp9g3IXXNmWs
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Mi, 15. M=E4r 2023 um 18:46:29 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
>  I was hoping setting VOLATILE_TMP_DIR correctly
> would be enough.

I guess it will be enough to pass the test, but it won't resolve the=20
logic gap between systemd and sysvinit. Unfortunately I am quite busy=20
for the next week but if it is planned to include glib-2.0-2.76.0 in=20
mickledore, I can check that route as it seems to be the less invasive=20
one for now.



--=-aBa7bYT7Wp9g3IXXNmWs
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Mi, 15. M=E4r 2023 um 18:46:29 +0100=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
 I was hoping setting VOLATILE_TMP_DIR correctly
would be enough.</div></blockquote><div><br></div><div>I guess it will be e=
nough to pass the test, but it won't resolve the logic gap between systemd =
and sysvinit. Unfortunately I am quite busy for the next week but if it is =
planned to include glib-2.0-2.76.0 in mickledore, I can check that route as=
 it seems to be the less invasive one for now.</div><div>&nbsp;</div></div>
--=-aBa7bYT7Wp9g3IXXNmWs--


