Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7A9C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 17:58:16 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.3768.1679680694528522167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 10:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 96ED04F6B;
	Fri, 24 Mar 2023 18:58:12 +0100 (CET)
Received: from [192.168.178.83] ([84.163.41.244]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pflg2-1fUzIm0; Fri, 24 Mar 2023 18:58:10 +0100
Date: Fri, 24 Mar 2023 18:58:04 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <SWD1SR.SLQ5L42WUNEX1@t-online.de>
In-Reply-To: <174F6B63D17BDF87.25304@lists.openembedded.org>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	<9FONRR.ZLSABXKTP67E@t-online.de>
	<a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
	<B0EORR.JWJ884MGYK8G2@t-online.de>
	<CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
	<CHRXRR.A1NILQGNBS7P1@t-online.de>
	<CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
	<174F6B63D17BDF87.25304@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-NL6wO8rGRo2D1OFBrsuK"
X-TOI-EXPURGATEID: 150726::1679680690-6FFFCC08-59597C74/0/0 CLEAN NORMAL
X-TOI-MSGID: 05f191a6-8006-42d6-83af-d9b7a0bbf36e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 17:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179075

--=-NL6wO8rGRo2D1OFBrsuK
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Fr, 24. M=E4r 2023 um 18:34:13 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> It fails, but in the same way even without this patch being applied

Meanwhile I edited=20
'core-image-sato-sdk-qemux86-64-20230324174311.qemuboot.conf' and=20
increased qb_mem =3D -m 2048
Lets see if this helps


--=-NL6wO8rGRo2D1OFBrsuK
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Fr, 24. M=E4r 2023 um 18:34:13 +0100=
 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite=
">It fails, but in the same way even without this patch being applied</bloc=
kquote><div><br></div><div>Meanwhile I edited 'core-image-sato-sdk-qemux86-=
64-20230324174311.qemuboot.conf' and increased&nbsp;qb_mem =3D -m 2048</div=
><div>Lets see if this helps</div></div>
--=-NL6wO8rGRo2D1OFBrsuK--


