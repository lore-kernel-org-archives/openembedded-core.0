Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D69CCA473
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:10:56 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web08.8851.1654096248331623175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout06.t-online.de (Postfix) with SMTP id DF674D155;
	Wed,  1 Jun 2022 17:10:46 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.87]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nwPzh-0nhB0T0; Wed, 1 Jun 2022 17:10:46 +0200
Message-ID: <6b5c87ac-3ea0-be92-9439-7cf69d136c9b@t-online.de>
Date: Wed, 1 Jun 2022 17:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH 1/4] xorg-lib-common: allow to build for wayland
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220531190620.186764-1-f_l_k@t-online.de>
 <20220601170035.76ab1bcc@booty>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220601170035.76ab1bcc@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1654096246-014272E6-5CFB0ACD/0/0 CLEAN NORMAL
X-TOI-MSGID: 27fbe353-5b34-4517-bd58-52af4c5ef396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166385

Hi Luca,

i've sent a patch that should hopefully fix your issue

Am 01.06.22 um 17:00 schrieb Luca Ceresoli:
> Hi Markus,
>
> On Tue, 31 May 2022 21:06:17 +0200
> "Markus Volk" <f_l_k@t-online.de> wrote:
>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> I applied patches 1 to 3 of this series to my testing branch and got
> these failures:
>
> stdio: ERROR: Nothing PROVIDES 'font-util' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb DEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'libxfont2' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'libxfont2-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'libfontenc' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'libfontenc-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'libxfont-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'libxfont' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb RDEPENDS on or otherwise requires it)
>
> See the full logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/12/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/15/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/15/logs/stdio
>

