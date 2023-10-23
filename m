Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7167DC25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 20:53:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.132723.1698094416981028470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 13:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dmSk1GqO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C42F6C0004;
	Mon, 23 Oct 2023 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698094414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhloOi/GavsNB8iqs9RqH01x8qEfdT12df9WWU4hW9c=;
	b=dmSk1GqOJgObbM2GeQRm6mrchBML79qIgKO0Wl2ktFFWwpyOtQ89BJQGHfqNYqinA5SRUZ
	gUMA/UkBTb2eo4deUwNjyUM/roCcy8OB5TsMRn/sxyZjEJma8TQVFK0EIPmICaEsroKJV9
	TgIwDIbwZOJ9Q8h56WM9aoiTPIChKMBWrAftnX4okljgttjszGOApPUMX1PjT8UBgiGj0z
	YLYYcsdobAoTZMvZt3033rCHrR+tD5KEY3KVMkSBqhLY5XyAqZN3c9tzUZdXn4x3z1N7KB
	v7Lq+ysWepPs4C5dy5bmVOvp4ftXwjqfJtbnnK5q7d5HwDNxcWG6VM1N2HSqfg==
Date: Mon, 23 Oct 2023 22:53:32 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V1] cairo:Add ptest support
Message-ID: <20231023225332.173aba77@booty>
In-Reply-To: <1698042855-3883-1-git-send-email-qiutt@fujitsu.com>
References: <1698042855-3883-1-git-send-email-qiutt@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 20:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189633

Hello qiutt,

On Mon, 23 Oct 2023 14:34:15 +0800
"qiutt@fujitsu.com" <qiutt@fujitsu.com> wrote:

> From: Qiu Tingting <qiutt@fujitsu.com>
> 
> Add a ptest for cairo
> - It is taking around 65s to execute with kvm, so added it to PTESTS_SLOW
> - It contains 429 cases
> - Below is parts of the run log:
>   START: ptest-runner
>   2023-10-17T05:56
>   BEGIN: /usr/lib/cairo/ptest
> 
>   TESTING cairo-test-suite
>   Compiled against cairo 1.16.0, running on 1.16.0.
>   Compiled against pixman 0.42.2, running on 0.42.2.
> 
>   TESTING a1-bug
>   a1-bug.image.argb32 [0x1]:  PASS
> 
>   ...
>   TESTING fallback-resolution
>   UNTESTED: fallback-resolution
>   402 Passed, 13 Failed [0 crashed, 13 expected], 14 Skipped
>   DURATION: 65
>   END: /usr/lib/cairo/ptest
>   2023-10-17T05:51
>   STOP: ptest-runner
>   TOTAL: 1 FAIL: 0
> 
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>

This patch is triggering one ptest failure:

Failed ptests:
{'cairo': ['extended-blend', 'extended-blend-solid']}

See the log:
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5625/steps/12/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

