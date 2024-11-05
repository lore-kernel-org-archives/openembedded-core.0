Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AF1D1266D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 09:25:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.14000.1730798742608968059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 01:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LL5i7czF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BB56C0008;
	Tue,  5 Nov 2024 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730798740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvKC8+nR/2qNGM2ShfonXk279yQ6iWvFkAG2wedsdmQ=;
	b=LL5i7czFoAAn10ajtfirfvlHCGSX9aR7kHgHjhIoT+rJTrZuORHkAK3SXNmBkqh2d8bDZe
	WamOnW8EqBY4C7WUriPeIQCtqAuPcqwba34dKc/33nUCWw7NWaRbBg3tLW1t53w6mhpJgG
	ABl/xrS1Ucy9yPUOJaxw6vG2sMoyh72ZElk0hSxeZ2lLLBf/dUpkEjiRUMzSl+YKdG7+kR
	t7TZ24enGMNzdJMxKwlPNUu/TWPtz7ML/drKcYiyYjqeLub1e9nvZh6Fhojh1yKZ55IpTD
	R6PL2JQK7xlaftgoM5+FO73ctxWlbche9t1wzSLPc4RF785G7WOgooCKt1xgZA==
Content-Type: multipart/alternative;
 boundary="------------t6iR6jJCEWjBk4dESfvF6VL9"
Message-ID: <8da131e0-d2a0-4f9a-be25-a0f70af09886@bootlin.com>
Date: Tue, 5 Nov 2024 10:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241031101556.1913400-1-alex.kanavin@gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20241031101556.1913400-1-alex.kanavin@gmail.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206697

This is a multi-part message in MIME format.
--------------t6iR6jJCEWjBk4dESfvF6VL9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Alexander

I hope this email finds you well.


On 10/31/24 11:15, Alexander Kanavin wrote:
> From: Alexander Kanavin<alex@linutronix.de>
>
> Make adjustments needed for ptests: among others,
> the binary.test needs 4G of RAM.
>
> Apply all patches unconditionally for ease of future upgrades.
>
> Signed-off-by: Alexander Kanavin<alex@linutronix.de>
> ---

(...)

I noticed a ptest failure potentially related to the update:

https://valkyrie.yoctoproject.org/#/builders/73/builds/319/steps/12/logs/stdio 
(lines 432-433)

Failed ptests:
{'tcl': ['http11.test']}

Could you please take a look? Thanks!

--
Best regards,
João Marcos Costa

--------------t6iR6jJCEWjBk4dESfvF6VL9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello, Alexander</font></p>
    <p><font face="monospace">I hope this email finds you well.</font></p>
    <br>
    <div class="moz-cite-prefix">On 10/31/24 11:15, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241031101556.1913400-1-alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>

Make adjustments needed for ptests: among others,
the binary.test needs 4G of RAM.

Apply all patches unconditionally for ease of future upgrades.

Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>
---</pre>
    </blockquote>
    <p><font face="monospace">(...)</font><span
      style="white-space: pre-wrap">
</span></p>
    <p><font face="monospace">I noticed a ptest failure potentially
        related to the update:</font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://valkyrie.yoctoproject.org/#/builders/73/builds/319/steps/12/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/73/builds/319/steps/12/logs/stdio</a>
        (lines 432-433)</font></p>
    <p><font face="monospace">Failed ptests:<br>
        {'tcl': ['http11.test']}<br>
      </font></p>
    <p><font face="monospace">Could you please take a look? Thanks!</font><br>
    </p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <pre class="moz-signature" cols="72">--
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------t6iR6jJCEWjBk4dESfvF6VL9--

