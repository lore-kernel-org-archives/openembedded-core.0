Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AE4107BCD2
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 17:15:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21162.1773422145517941101
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 10:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1w166u-00057T-TC; Fri, 13 Mar 2026 18:15:40 +0100
Message-ID: <67653695-5d20-4ef6-bd99-9a6ee5e70966@pengutronix.de>
Date: Fri, 13 Mar 2026 18:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 5/6] barebox-tools: fix build failure with
 glibc 2.43
To: alex.kanavin@gmail.com, Randy MacLeod <randy.macleod@windriver.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org,
 Sundeep.Kokkonda@windriver.com
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
 <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com>
 <CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com>
 <0d193cac-0f0e-4eb3-a462-ba5c459bce73@windriver.com>
 <CANNYZj-UY4DVgPbs9RtnCo3g9mxNu6Vh7WbhzXjLeN67J3qHaQ@mail.gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CANNYZj-UY4DVgPbs9RtnCo3g9mxNu6Vh7WbhzXjLeN67J3qHaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 17:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233066

Hi,

On 3/12/26 8:17 PM, Alexander Kanavin via lists.openembedded.org wrote:
> On Thu, 12 Mar 2026 at 20:07, Randy MacLeod <randy.macleod@windriver.com> wrote:
> 
>> Hemanth meant to reply saying:
>>
>> Hi Alex,
>>
>> Sure, I'll do that but since we're in a hurry to get the glibc-2.43 merged,
>> I'll keep the existing status and follow-up with a status change next week,
>> once I've had time to submit a patch to upstream barebox:
>>   https://github.com/barebox/barebox?tab=readme-ov-file#contributing
>>
>> Right Hemanth ?   :-)
> 
> No problem :) Note that v4 also does not address a Pending patch in
> ltp. I made a comment to v3.

Thank you Hemanth for your patch. I took the liberty of resending[1]
your patch to the barebox mailing list, so it could make it into today's
v2026.03.0 in time.

The barebox recipe in OE-core should thus become patch free once the
recipe is updated.

[1]:
https://lore.kernel.org/barebox/177340033069.206252.6842304138227246713.b4-ty@pengutronix.de

Cheers,
Ahmad

> 
> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233002): https://lists.openembedded.org/g/openembedded-core/message/233002
> Mute This Topic: https://lists.openembedded.org/mt/118245373/4830399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a.fatoum@pengutronix.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


