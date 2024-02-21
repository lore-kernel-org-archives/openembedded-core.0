Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C88C5475B
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:53:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.8419.1708502030020306592
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 23:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EEeDMXG3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60AEDFF806;
	Wed, 21 Feb 2024 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708502027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEd0ZmluHPo5fOdKQrsaYYmmiwNU5QTkX2K3qcSirUc=;
	b=EEeDMXG3QlZ5e4UX9nllEixlU3b7e+qg5LTzEBfDhT50dtS/299Y5UKy2s9F+EY7UOXWWV
	RgnPu4fuJ/VpJE6MBGGjp6T8z2U5Dz88AN183RvRs2D1oEe+hVIzTVyZgBSKr99sN2sEGP
	AF6icVSSoKiBrLiCNGi8uiaaOugdKRIlFcW3ATCPEKvYfxthd3jm9WlXapY3qekZ/5Kd2N
	MJ6v9Y8U6EWLz3Tbi2pMyVgFV31B12Y1ox0FVu/MIUXJSa+vLkyl3Zu/Osb27cX6j8Tnyh
	NjT3cyJh+bpNqMXZs7l2Ocj7EkGFWLxsyBq+sF+sxqoTWhfqSTzlQVWDpDpAVg==
Message-ID: <3be76c2c-463d-4125-8182-93113ab6efa7@bootlin.com>
Date: Wed, 21 Feb 2024 08:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 1/4] testimage: create a list of failed test post
 actions
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240220200159.13419-1-alexis.lothore@bootlin.com>
 <20240220200159.13419-2-alexis.lothore@bootlin.com>
 <a57a3202b513da93b8b3a9571de922787a455328.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <a57a3202b513da93b8b3a9571de922787a455328.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 07:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195960

Hello Richard,

On 2/21/24 08:34, Richard Purdie wrote:
> On Tue, 2024-02-20 at 21:01 +0100, Alexis Lothoré via
> lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>

[...]

>> +##################################################################
>> +# General post actions runner
>> +##################################################################
>> +
>> +def run_failed_tests_post_actions(d, tc):
>> +    post_actions=[
>> +        list_and_fetch_failed_tests_artifacts
>> +    ]
>> +
>> +    for action in post_actions:
>> +        action(d, tc)
> 
> Rather than create a bbclass class of python functions, these should
> move to lib/oe and become a proper python library file?

ACK, I will do that and create a proper python file for this.

> Moving functions out of the class files is on my long term todo list so
> this seems like an idea opportunity.

So should this series take the opportunity to move all already existing python
functions from testimage to a lib ? I can certainly do that if that's your point :)

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


