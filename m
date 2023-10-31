Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66694C4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 13:33:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.186435.1698759200739844647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 06:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mMh45De3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4473E6000C;
	Tue, 31 Oct 2023 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698759198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0F3k76EVv6LHaZNaKNZS4Tn+o6IJlaRl9oB47GVZ+o8=;
	b=mMh45De3+ibzo0PsuH63fNWhWjZvf1oosrLssyZcWz+K/PD9k/ADBgLX9kfechHvTV/AbY
	Rd4tMHXco6FQfBqlr7+g4gJOdDDXIEBzrA9Oz+6TqaSzzrmdea4CXSFLofxDj4Ry5c69D8
	NiTbdHy1WVWE5drhCgERWemQ+URrMs1YGaqxEvzIWIKLfjEN+bzKQMpvL26v3+otzjGQ+Q
	VYK8I8sKJQ4Jyo6btV+OksSTcz5c9fpQ5/jvCW160wsHAhWkQkzj7Ta3mqnQSm93CsJLw1
	dv3SXNLL7OiY6URMC/FUIkcoFQzMlgrrHV3pD3322M55cA0M5//F7IAZz8jnzw==
Message-ID: <b5624398-79ea-4838-ace2-774fac6f787a@bootlin.com>
Date: Tue, 31 Oct 2023 14:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Stephen Jolley <sjolley.yp.pm@gmail.com>
Subject: Re: [yocto] Yocto Project Status 31 October 2023 (WW44)
Content-Language: en-US
To: Neal Caidin <ncaidin@linuxfoundation.org>, yocto@lists.yoctoproject.org,
 openembedded-core@lists.openembedded.org
References: <CAODMxsJ2Wsd6fURK_JLP-YTtOSqVknZnJ87BNN8jVOGQ4J_=Bw@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAODMxsJ2Wsd6fURK_JLP-YTtOSqVknZnJ87BNN8jVOGQ4J_=Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 13:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189841

Greetings,

On 31.10.23 at 13:29, Neal Caidin wrote:
>
> Current Dev Position: YP 4.3 M4 (Feature Freeze)
>
> Next Deadline: 2nd October 2023 YP 4.3 M4 build date
>
>
> Next Team Meetings:
>
>  *
>
>     Bug Triage meeting Thursday November 2, 7:30 am PDT
>     (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09
>     <https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09>)
>
>  *
>
>     Weekly Project Engineering Sync Tuesday October 31st at 8 am PDT
>     (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
>     <https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>)
>     <https://zoom.us/j/990892712>
>

Reminder: this week 8:00 PDT translates to 16:00 CET if I understood 
correctly. That's one hour earlier because daylight saving time changes 
happen in Europe 1 week earlier than in the USA.

Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


