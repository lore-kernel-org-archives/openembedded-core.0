Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E4DC4829A
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:48:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18737.1707216518575144082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KCSXlnYk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33265240007;
	Tue,  6 Feb 2024 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707216516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7GdegtNPWsyjyT+u04LCyQVMTQI5k2O3xO7+wbbUvg=;
	b=KCSXlnYk5DlaPw7T8Dv02k3VkBdX1D1AdHciVj1SLSV+5MqPmg5hk/0CNBRGbx3BemvC2p
	arTh6jNzAEmJTccAu1lPBHR2MTNsqrpvh7uy53JB/RNRQppeIi23AA8QTbRC5mW1RjKv1j
	+SzL7AsVlvAlHRN0Cz7rjwuV6lMbfIY1fdw0SvBIe0CqSjbtqPkgukZgJPSQ0X8A2wiDAu
	b9v0E5RXcCewkCsfY98fKRomV+8KQlI/eYHvMI3Wfy22z5cgFDnK1mBf9xq8ug+e7J5jIu
	/hVk5gX3l5I+R63lE/iyMHVZBF5AisXAg9B223B85Elu1HM0NCdoKmQbjY4cQg==
Message-ID: <693edd04-5743-4a01-9d07-9af9097e565b@bootlin.com>
Date: Tue, 6 Feb 2024 11:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: ranjitsinh.rathod@kpit.com, Zahir Hussain <zahir.basha@kpit.com>
Subject: Re: [OE-core][kirkstone][PATCH] alsa-lib: Enabling ptest for alsa-lib
 component
Content-Language: en-US
To: aszh07 <mail2szahir@gmail.com>, openembedded-core@lists.openembedded.org
References: <20231222060602.11124-1-mail2szahir@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231222060602.11124-1-mail2szahir@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 10:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194986

Hi Zahir

On 12/22/23 at 07:06, aszh07 wrote:
> From: Zahir Hussain <zahir.basha@kpit.com>
>
> This change adds ptest for alsa-lib.
>
> 1) Adding CFLAGS change for include the header file path for resolving
>   below compilation issue;
>          In file included from ../../../alsa-lib-1.2.1.2/test/lsb/config.c:4:
>          ../../../alsa-lib-1.2.1.2/test/lsb/test.h:5:10: fatal error:
>          alsa/asoundlib.h: No such file or directory
>          5 | #include <alsa/asoundlib.h>
>
> 2) Removed the test suite execution 'make' call using 'sed' command.
>
> 3) Compiled the test directory source code using "oe_runmake check" command.
>
> 4) Copied all the required binaries into PTEST path using do_install_ptest()
>   function.
>
> Signed-off-by: aszh07 <mail2szahir@gmail.com>
> Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>


Apologies for the late reply. Would you be interested in submitting a 
new version against master? I'll be happy to test and review it, as 
indeed we're missing ptests for alsa-lib and alsa-utils (see 
https://gist.github.com/ycongal-smile/dd51b0e450a8f0083e9d5cc10eeeb060#file-unimplemented-ptests_oe-core-log).

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


