Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE5AC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 19:06:20 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web12.1813.1654023971722294391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 12:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 7E759715;
	Tue, 31 May 2022 21:06:09 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.125]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nw7Bv-0lMoKX0; Tue, 31 May 2022 21:06:07 +0200
Message-ID: <d35993c7-1745-1d2f-6267-37f9797b4873@t-online.de>
Date: Tue, 31 May 2022 21:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
 <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
 <31d4ac7f1c8db63e0bcc2028c787dc59e30a2781.camel@linuxfoundation.org>
 <1286dfdb-a0ac-67a7-a026-f95da89c35da@t-online.de>
 <f304f84a8bb4bd353898d54cf1378b5c0084498e.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <f304f84a8bb4bd353898d54cf1378b5c0084498e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1654023967-014272E6-ED077A00/0/0 CLEAN NORMAL
X-TOI-MSGID: def43015-7191-471e-8af8-232c5390a236
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 19:06:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166328

I have made some progress in building an image with DISTRO_FEATURE=20
'wayland' without X11. So far I had the problem that I had to enable x11=20
DISTRO_FEATURE to build many packages under wayland. So all recipes=C2=A0=
=20
additionally pulled=C2=A0 x11 support.
I allowed the base xlibs to build under wayland and so was able to build=20
my image without x11 DISTRO_FEATURE. Although I use code like thunar and=20
therefore had to add 'x11' PACKAGECONFIG for gtk+3 and libepoxy and=20
build cairo with xlib support, this had a positive effect on my image.=20
Without the loss of features, my build's tasks were reduced from 13186=20
to 12781 just by using DISTRO_FEATURES:remove =3D "x11" in local.conf

Am 22.05.22 um 11:24 schrieb richard.purdie@linuxfoundation.org:
> On Sun, 2022-05-22 at 10:48 +0200, Markus Volk wrote:
>>  From the perspective
>> that we eventually want to reach the point where wayland/x11 becomes a=
n
>> either/or decision, I think that should be changed.
>

