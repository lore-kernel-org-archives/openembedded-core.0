Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAFFC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 05:58:56 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.13176.1679032728923295271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 22:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 9FC58216CA;
	Fri, 17 Mar 2023 06:58:46 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.8]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pd370-0eTUKO0; Fri, 17 Mar 2023 06:58:46 +0100
Date: Fri, 17 Mar 2023 06:58:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <SXHNRR.SXNLJNOU795T@t-online.de>
In-Reply-To: 
	<CANNYZj_fMLFi=dWVzqThAVo_CwFDHnpCeZKLyGceGCiwpLvNqA@mail.gmail.com>
References: <20230315070909.422721-1-f_l_k@t-online.de>
	<CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
	<LZHKRR.FOHLRDXQDV053@t-online.de>
	<CANNYZj_tKEA=CgQJ8QL2660VbvkXizX7+yrZ4EgaPdPnc33Siw@mail.gmail.com>
	<E8OKRR.MV94C2TWISKQ@t-online.de>
	<CANNYZj8QzLCeKESZxbHaaGFP0Xhd0oG00hcNz2Vru4S_m09Cng@mail.gmail.com>
	<08QKRR.0S9N8GIU94L5@t-online.de>
	<CANNYZj_fMLFi=dWVzqThAVo_CwFDHnpCeZKLyGceGCiwpLvNqA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HanzqmNHtOCLu7mDK7NK"
X-TOI-EXPURGATEID: 150726::1679032726-432C3378-E10DA019/0/0 CLEAN NORMAL
X-TOI-MSGID: 2c3da05a-4fc2-477c-a7c6-4a80fd045395
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 05:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178737

--=-HanzqmNHtOCLu7mDK7NK
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Do, 16. M=E4r 2023 um 09:11:59 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> You can check that regardless. Patches not eligible for mickledore
> will be stashed by integrators until master merge window reopens.

I did some tesing and found both ways are generally working. I'll send=20
patches for it marked as RFC

The less invasive patch will remove the symlink if ptest is in=20
DISTRO_FEATURES. Downside here ... this is set in=20
POKY_DEFAULT_DISTRO_FEATURES and thus will affect any poky based=20
distro. And it doesn't mount a tmpfs for /tmp yet

The other one tries to align to what systemd expects.

Both did fix the glib ptest issue for me


--=-HanzqmNHtOCLu7mDK7NK
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Do, 16. M=E4r 2023 um 09:11:59 +0100=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
You can check that regardless. Patches not eligible for mickledore
will be stashed by integrators until master merge window reopens.</div></bl=
ockquote><div><br></div><div>I did some tesing and found both ways are gene=
rally working. I'll send patches for it marked as RFC</div><div><br></div><=
div>The less invasive patch will remove the symlink if ptest is in DISTRO_F=
EATURES. Downside here ... this is set in POKY_DEFAULT_DISTRO_FEATURES and =
thus will affect any poky based distro. And it doesn't mount a tmpfs for /t=
mp yet</div><div><br></div><div>The other one tries to align to what system=
d expects.</div><div><br></div><div>Both did fix the glib ptest issue for m=
e</div></div>
--=-HanzqmNHtOCLu7mDK7NK--


