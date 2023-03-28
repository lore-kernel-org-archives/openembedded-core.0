Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B56C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:08:34 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.60990.1679990905016758664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id 9FEBC1D406;
	Tue, 28 Mar 2023 10:08:22 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.35.166]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph4NS-1A8aTg0; Tue, 28 Mar 2023 10:08:22 +0200
Message-ID: <7f2b3a3e-5e33-5948-f230-a39baad4703b@t-online.de>
Date: Tue, 28 Mar 2023 10:08:22 +0200
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
 <17508627FA842C9E.14179@lists.openembedded.org>
In-Reply-To: <17508627FA842C9E.14179@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1679990902-DBFFCC10-2FE3B712/0/0 CLEAN NORMAL
X-TOI-MSGID: 035dbff0-bab3-4906-a248-829ae8dc2df9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179209

I've sent a patch that imports libadwaita. Don't know if thats what is=20
planned to do, but that would be needed along with the epiphany update=20
to test the webkitgtk patch

Am 28.03.23 um 09:56 schrieb Markus Volk:
> I have to partially correct myself. The recipe is so far standalone=20
> that webkitgtk can be built without the other patches. However,=20
> epiphany will break because=C2=A0 DEPENDS =3D "webkitgtk" would need to=
 be=20
> DEPENDS =3D "webkitgtk-3" for the old epiphany recipe.
>
> Am 28.03.23 um 09:26 schrieb Markus Volk:
>> This patch is standalone. There is still the problem for Epiphany=20
>> with libadwaita. But that would require a decision that should not be=20
>> made by me.=20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179207): https://lists.openembedded.org/g/openembed=
ded-core/message/179207
> Mute This Topic: https://lists.openembedded.org/mt/97899808/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

