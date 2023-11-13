Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808BBC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:21:04 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.1803.1699906854560767540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout03.t-online.de (Postfix) with SMTP id 74ED77BAA;
	Mon, 13 Nov 2023 21:20:50 +0100 (CET)
Received: from [192.168.178.62] ([84.163.34.200]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2dQQ-0G3R2m0; Mon, 13 Nov 2023 21:20:50 +0100
Date: Mon, 13 Nov 2023 21:21:22 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] cups: Upgrade 2.4.6 -> 2.4.7
To: Ross Burton <Ross.Burton@arm.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Message-Id: <MJW24S.1EK6OM8CHC88@t-online.de>
In-Reply-To: <6071A77D-A48A-455A-BB22-A0BF0A5FE295@arm.com>
References: <20231112212327.82530-1-f_l_k@t-online.de>
	<6071A77D-A48A-455A-BB22-A0BF0A5FE295@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wtoQAbw57cxdBQDATRki"
X-TOI-EXPURGATEID: 150726::1699906850-950A8968-FF23342E/0/0 CLEAN NORMAL
X-TOI-MSGID: d67039be-3b00-42c5-86d1-ec77093d1f48
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 20:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190485

--=-wtoQAbw57cxdBQDATRki
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13 2023 at 04:04:46 PM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
> That=FFs horrible, there=FFs a perfectly good way of specifying=20
> DEPENDS in PACKAGECONFIGs.

The reason I did it this way is because bb.utils.contains cannot be=20
used in PACKAGECONFIGs depends field.

I know this conflict option and also have considered it, but I took the=20
boolean either/or approach so that users don't have to use=20
PACKAGECONFIG:remove to get rid of the openssl entry in order to  use=20
gnutls.

I'll send an update with the requested change



--=-wtoQAbw57cxdBQDATRki
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, Nov 13 2023 at 04:04:46 PM +00:=
00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type=
=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Tha=
t=FFs horrible, there=FFs a perfectly good way of specifying DEPENDS in PAC=
KAGECONFIGs.
</div></blockquote><div><br></div><div><div>The reason I did it this way is=
 because bb.utils.contains cannot be used in PACKAGECONFIGs depends field.<=
/div><div><br></div><div>I know this conflict option and also have consider=
ed it, but I took the boolean either/or approach so that users don't have t=
o use PACKAGECONFIG:remove to get rid of the openssl entry in order to &nbs=
p;use gnutls.</div><div><br></div><div>I'll send an update with the request=
ed change</div></div><div><br></div></div>
--=-wtoQAbw57cxdBQDATRki--


