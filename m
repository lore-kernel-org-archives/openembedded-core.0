Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABC0C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 09:07:14 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.24240.1647248833707393594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 02:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id 82EC410E16
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 10:07:11 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.243]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nTgfW-2DRhdh0; Mon, 14 Mar 2022 10:07:10 +0100
Message-ID: <506cd2c0-20eb-a782-a34e-506d230bc32d@t-online.de>
Date: Mon, 14 Mar 2022 10:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe-core][PATCHv2] cairo: update to v1.17.4
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220314071037.3702941-1-f_l_k@t-online.de>
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
 <74c5d185-8abe-6afe-724c-8cc7b6529997@t-online.de>
 <CANNYZj9wcs9-XFD_zXob3i6WiwqMedeaC9qu7cuhGBcaqLyeGw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CANNYZj9wcs9-XFD_zXob3i6WiwqMedeaC9qu7cuhGBcaqLyeGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647248830-00013579-A4BB074F/0/0 CLEAN NORMAL
X-TOI-MSGID: 16e52d0d-5556-4ca3-b1b6-cf08bd31fa48
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 09:07:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163134


> The SRC_URI prefix changed from http://cairographics.org/releases/ to
> http://cairographics.org/snapshots/, that should've given you pause.
>
> Also:
> note 'inherit upstream-version-is-even' in the recipe
> check what's written here https://www.cairographics.org/snapshots/
> check what debian is carrying
> https://packages.debian.org/search?searchon=sourcenames&keywords=cairo
>
> Alex

just when I thought it was a bit inconvenient to have only one version 
every few years

and no bugfix versions in between i found that there is something like 
that on gitlab.

https://gitlab.freedesktop.org/cairo/cairo/-/commits/1.16/

