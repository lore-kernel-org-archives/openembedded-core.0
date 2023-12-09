Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B95C10DC3
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 12:25:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8468.1702124752811399113
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 04:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J1KvqIi3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 972B11BF204;
	Sat,  9 Dec 2023 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702124751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8dx3zSHsoP5XSx/dqTTGqTGDs6edidP7lb00ws5cbqU=;
	b=J1KvqIi3EG6+A1lyh4EUaOwB+FBYL/Pdf6a/MZQkTsJcVwZgJDbjLgufkFObv3FrHOZ1r+
	dFaS1GUJEjfvY+weC3U1XQu1uMkKFULvenY9317D9aGIRxqoMLo/6luSu76L3mdpe0jLnj
	zjsSQxGEVfgDBiqRvs3HM4gnZU6dKkS94g8rm+HRzYDskptDhiAa4BfCRjEJm55kGBK+Yj
	O+iaF8MW+lnw9S8+I2PAa53ovZSZ2I5rD14MEP0TYnOg0fBN73rKUkHs+diKtPjkEza724
	rvxuj0PuiccJO9C1h7wmagxgmBWkPnXHpsmXjrlmI5Izvp7G1GAgaL55n1VKrg==
Date: Sat, 9 Dec 2023 13:25:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2 1/1] go: ignore CVE-2023-45283 and
 CVE-2023-45284
Message-ID: <202312091225509233e4be@mail.local>
References: <20231208104215.1425474-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208104215.1425474-1-soumya.sambu@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 12:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192102

Hello,

We had go upgrades in between, can you rebase (and check if this is
still needed)?

On 08/12/2023 10:42:15+0000, Soumya via lists.openembedded.org wrote:
> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> These CVEs affect path handling on Windows.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-45283
> https://nvd.nist.gov/vuln/detail/CVE-2023-45284
> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.20.10.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-devtools/go/go-1.20.10.inc
> index 39509ed986..0c0a736084 100644
> --- a/meta/recipes-devtools/go/go-1.20.10.inc
> +++ b/meta/recipes-devtools/go/go-1.20.10.inc
> @@ -16,3 +16,6 @@ SRC_URI += "\
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>  "
>  SRC_URI[main.sha256sum] = "72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb"
> +
> +CVE_STATUS[CVE-2023-45283] = "not-applicable-platform: Issue only applies on Windows"
> +CVE_STATUS[CVE-2023-45284] = "not-applicable-platform: Issue only applies on Windows"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192038): https://lists.openembedded.org/g/openembedded-core/message/192038
> Mute This Topic: https://lists.openembedded.org/mt/103052741/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

