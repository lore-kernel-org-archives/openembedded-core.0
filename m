Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B97C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 18:43:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.142.1642704235086882337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 10:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 11227E0004;
	Thu, 20 Jan 2022 18:43:52 +0000 (UTC)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] runqemu: automatically turn on "kvm" on x86
 CPUs with VT
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Ross Burton <ross.burton@arm.com>
References: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
Date: Thu, 20 Jan 2022 19:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 18:43:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160776

Hi Alex

On 1/20/22 4:28 PM, Alexander Kanavin wrote:
> I think this should cover aarch64 on aarch64 too :) And presence of
> (and ability to open) /dev/kvm is probably a better check than looking
> through cpuinfo?

Thanks for the review!

However, my abilities to build and test on aarch64 are limited. At least
this change would take me much more time to develop and is more likely
to cause regressions.

Wouldn't this version already be a worthy change for users? I'm not sure
we have many users running QEMU on aarch64. Would automatically passing
the "kvm" option on applicable cases have value in our automated tests?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


