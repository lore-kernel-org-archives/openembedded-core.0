Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F116AC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 11:27:00 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.17059.1718018817132570385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 04:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id C3DD335E50;
	Mon, 10 Jun 2024 13:26:54 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.42.224]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGdAr-2Ucz6e0; Mon, 10 Jun 2024 13:26:54 +0200
Date: Mon, 10 Jun 2024 13:27:42 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] xcb-util-errors: add recipe
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <6U3VES.KDK7QQ9YMWJD@t-online.de>
In-Reply-To: <43A0E60A-6316-495D-9F90-27685D03E168@arm.com>
References: <20240603060913.4178-1-f_l_k@t-online.de>
	<43A0E60A-6316-495D-9F90-27685D03E168@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-myyZI9KJJBkG4o+yZ15C"
X-TOI-EXPURGATEID: 150726::1718018814-413BEC65-54B6D05D/0/0 CLEAN NORMAL
X-TOI-MSGID: dec9300a-144b-41e6-b639-6e856423482c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 11:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200472

--=-myyZI9KJJBkG4o+yZ15C
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10 2024 at 11:07:24 AM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
> Can you try removing python3 from DEPENDS and export=20
> PYTHON=3D=B4python3=A1 instead?

Thanks, that works too.


--=-myyZI9KJJBkG4o+yZ15C
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, Jun 10 2024 at 11:07:24 AM +00:=
00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type=
=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Can=
 you try removing python3 from DEPENDS and export PYTHON=3D=B4python3=A1 in=
stead?
</div></blockquote><div><br></div><div>Thanks, that works too.</div></div>
--=-myyZI9KJJBkG4o+yZ15C--


