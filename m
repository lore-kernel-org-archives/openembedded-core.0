Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6ABC76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 00:54:53 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.55606.1679964885894250293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 17:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id 1A8BB6F7D;
	Tue, 28 Mar 2023 02:54:34 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.35.166]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgxbP-28BqgS0; Tue, 28 Mar 2023 02:54:19 +0200
Message-ID: <dd874e52-dc20-813c-3211-62b70c1d210c@t-online.de>
Date: Tue, 28 Mar 2023 02:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe-core][PATCH 6/7] epiphany: update 43.1 -> 44.0
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230325004818.2784943-1-f_l_k@t-online.de>
 <20230325004818.2784943-6-f_l_k@t-online.de>
 <2023032714382786bc343b@mail.local>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <2023032714382786bc343b@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1679964859-F27EAC10-E4150377/0/0 CLEAN NORMAL
X-TOI-MSGID: 437fafb6-29be-41f4-b9ae-e069caa86144
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 00:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179192

libadwaita is a hard dependency for epiphany so it would be needed to=20
import it from meta-gnome or to move=C2=A0 epiphany to meta-gnome

https://gitlab.gnome.org/GNOME/epiphany/-/blob/44.0/meson.build#L78


Am 27.03.23 um 16:38 schrieb Alexandre Belloni:
> ERROR: Nothing PROVIDES 'libadwaita' (but /home/pokybuild/yocto-worker/=
reproducible/build/meta/recipes-gnome/epiphany/epiphany_44.0.bb DEPENDS o=
n or otherwise requires it). Close matches:
>    libedit

