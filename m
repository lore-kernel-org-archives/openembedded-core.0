Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A29AC67791
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.5622.1650016925526235523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 03:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TrlVBXBX;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0CA3910000B;
	Fri, 15 Apr 2022 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650016923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZKjKTdrhj9ORLR3MZHAwwYxUevV2ztS4NKCPSnWVOs=;
	b=TrlVBXBXuNfsiIocAo0xTpg5FbkWs/0DNISSpk6z6twQC3vqm1dI2LTMn/ijJDMu2xlLVN
	V44q+Lt53StLgzJ85mVV/mgMoQeJLHBfknzSrhBxhmETu2/SfmilJg2P4xvfLyVp6bPt85
	dfqHgdaaYfsp6sP9ASrykzgw/KGIRskWA8g0r70i8ooWljU+BQqE1x1lLgWTXN0E8K0dC6
	w7LjEA9sgRbsmvIPHYdjg6DV5AM0/8Fgg7b+Buzz3gg5vi+OrzGR/V56aoe2bZvaOkyWPf
	LuzIZsDBbhFIj/aXrVdrARcQyGL9IBka2BySDBEg0NqQ2U9zhdHrS5pSDhpy6Q==
Message-ID: <dbec5575-3687-3d8a-ef9e-03a46bc72933@bootlin.com>
Date: Fri, 15 Apr 2022 12:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] bitbake.conf: reason for assignment of deprecated
 variable
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <2d083c9ebada9a9ee8eaf9c97f3ef3171bdb2356.camel@ew.tq-group.com>
 <5b5b2b45fe494472abcfc8e06c6480c2@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <5b5b2b45fe494472abcfc8e06c6480c2@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164421


On 4/15/22 02:08, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Markus Niebel
>> Sent: den 11 april 2022 17:07
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] bitbake.conf: reason for assignment of deprecated
>> variable
>>
>> Hello,
>>
>> with the deprecation of SERIAL_CONSOLE the following was introduced in
>> bitbake.conf:
>>
>> 3f0d665384e6d1b7aa2854a9cc4f13e0961bacb7 (bitbake.conf: set
>> SERIAL_CONSOLES from SERIAL_CONSOLE by default)
>>
>> Since this is done after inclusion of local.conf and <machine>.conf any
>> weak default done for a System-on-Module / CPU will be overwritten. Is 
>> this just by forgetting to remove these lines after the deprecation or 
>> is there still a reason to keep this as is?
>>
>> Thank you
>>
>> Markus Niebel
> Given that it is almost ten years since SERIAL_CONSOLE was deprecated, 
> it might be time to actually remove it soon...


I agree, and this would allow to simplify documentation too.
Markus, would you like to submit a patch to openembedded-core?
Good catch by the way!
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


