Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFA3CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 15:21:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.30932.1697728909628145766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 08:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JFzJee/S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C6A920005;
	Thu, 19 Oct 2023 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697728907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=21xdpVhaeY5V6ukn78kUGvPNzr45nmLGwJ1u9uZ9/BI=;
	b=JFzJee/SfoGWhn/TNUAo+BUrQnQNemKiNy0pKY0awgUAGrgNlRsS3DyD3+XXJHSgn0S0nG
	3RKvNwP4jWqNDwHgl/hEcSCiY0oezMty2iMfrXtSJ/K0XyHVvRDbK8g7xqeUvlp3a+aTFA
	KZAFF38Q7rhv4CCpBdmQUcmUoCdN5upYtrcU1F2oLTT6GWxP1dhDPCQzEA03m/L1HC4A4l
	snQl0OjXqZCcN+KA0DqWlUld+ooC3AbmGwzexQ4VrBrltMRZbf2X949LjPRhMkDigx5gTp
	r0DfQXHv8ik9hjrMN4w/Olyw+KTJwc3o7M0Hrszdkzyj1Igc76AA0g9Zl3+aTw==
Message-ID: <f0d794fd-ae24-4999-b564-c608da9f0af7@bootlin.com>
Date: Thu, 19 Oct 2023 17:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>,
 openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] Detecting unimplemented ptests with heuristics
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>
References: <c8b8ee57-7e21-0189-ba71-3e4805725bcc@smile.fr>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <c8b8ee57-7e21-0189-ba71-3e4805725bcc@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 15:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189469

Hi Yoann

On 19.10.23 at 10:00, Yoann Congal wrote:
> Hi everyone,
>
> We recently implemented a way to detect recipes for upstream code that contain unit tests but does not implement ptests.
> Those recipes make good candidates for increasing the ptests coverage.
>
> This is implemented as a QA check. The check is disabled by default since it generates a lot of warning at build.
> In order to activate it (in local.conf for exemple) :
> WARN_QA += "unimplemented-ptest"
>
> The warnings looks like:
> WARNING: time-1.9-r0 do_patch: QA Issue: time: autotools-based tests detected [unimplemented-ptest]
>   
> I've generated the list for the unimplemented ptests for oe-core and for meta-openembedded:
>    329 unimplemented-ptests_oe-core.log: https://gist.github.com/ycongal-smile/dd51b0e450a8f0083e9d5cc10eeeb060#file-unimplemented-ptests_oe-core-log
>   1080 unimplemented-ptests_meta-openembedded.log: https://gist.github.com/ycongal-smile/dd51b0e450a8f0083e9d5cc10eeeb060#file-unimplemented-ptests_meta-openembedded-log

Thanks, indeed, I "own" recipes that were flagged :)
Maybe, you could find a way to notify the maintainers of such recipes, 
as in the AUH upgrade status reports 
(https://lists.openembedded.org/g/openembedded-core/message/188589 for 
example).
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


