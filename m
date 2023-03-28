Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3685C77B60
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 07:56:14 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.60723.1679990166524421994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 00:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id DB76D25108;
	Tue, 28 Mar 2023 09:56:03 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.35.166]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph4BX-19JAKe0; Tue, 28 Mar 2023 09:56:03 +0200
Message-ID: <0563af8f-7f46-cea4-be86-3968281c6446@t-online.de>
Date: Tue, 28 Mar 2023 09:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe-core][PATCHv4] webkitgtk: update 2.38.5 -> 2.40.0
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
References: <17507FB5CB63E584.14179@lists.openembedded.org>
 <6d514983-364b-99a0-4a5c-528bf6cb26bc@t-online.de>
 <20230328071714e8631733@mail.local>
 <17508499C64227F9.28404@lists.openembedded.org>
In-Reply-To: <17508499C64227F9.28404@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1679990163-F4DA8C53-3D87F1A3/0/0 CLEAN NORMAL
X-TOI-MSGID: 04dc0da5-78d8-4982-bdf0-05cc0a6fc5be
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179207

I have to partially correct myself. The recipe is so far standalone that=20
webkitgtk can be built without the other patches. However, epiphany will=20
break because=C2=A0 DEPENDS =3D "webkitgtk" would need to be DEPENDS =3D=20
"webkitgtk-3" for the old epiphany recipe.

Am 28.03.23 um 09:26 schrieb Markus Volk:
> This patch is standalone. There is still the problem for Epiphany with=20
> libadwaita. But that would require a decision that should not be made=20
> by me.=20

