Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1134FC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 09:11:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6508.1721812287085159736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 02:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jVmBfUuD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3503C20005;
	Wed, 24 Jul 2024 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721812284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dllf5LqthwjoBpOE7U9Usi8md5eyxPnfnMka7s2EqaQ=;
	b=jVmBfUuDk2HkDOnGI3EmGJZMqJk91cjhi70vsUdGWpa4tMXUYoqhiI9ddUeXfHCggk5EPN
	hKoYtLR83NFH6TToyASdcP+zY/dUY5KMUzb7NO1tDSNEa9zRDlnoXKIDlK33wPIV2rVjr1
	SjcPErmwFM7cShQWbNNgMLcm9vldQV4nqMtgVz9QUbib2kYkXrF87H/RBOlc59s1N3MV1K
	dz2iNKwFmWgDVJoPglqzhcfYB8m4agYXjSriyQ4mbx3FrXY31+RlsPUMU+zYiyj0hrv1tA
	JnO09WuT7Y9/7ul+LsY2YVGsxufG1lWR05k7fszGzf8nl3ZWWq4D1YJbNVuUCA==
Content-Type: multipart/alternative;
 boundary="------------MJ103GLI5A1lFo6zZDFwQ6Uf"
Message-ID: <b52d8f89-e4c4-4e25-954f-ef178a7d82d4@bootlin.com>
Date: Wed, 24 Jul 2024 11:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 05/37] python3-pytest: clean up RDEPENDS
Content-Language: en-US, fr
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
References: <20240723145137.74198-1-ross.burton@arm.com>
 <20240723145137.74198-5-ross.burton@arm.com>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240723145137.74198-5-ross.burton@arm.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202432

This is a multi-part message in MIME format.
--------------MJ103GLI5A1lFo6zZDFwQ6Uf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Ross

On 7/23/24 16:51, Ross Burton wrote:
> These dependencies are only used in development:
> - attrs
> - setuptools
>
> These dependencies are obsolete:
> - atomicwrites removed 7.2.0
> - importlib-metadata removed in 5.1.0
> - more-itertools removed 6.1.0
> - pathlib2 removed 6.2.2
> - py removed in 7.2
> - six removed in 5.0.0
> - tomllib not needed as we have Python 3.11+
> - wcwidth removed in 6.0.0

[...]

There are a few errors potentially related to tomllib removal in the 
autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6836/steps/13/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6659/steps/13/logs/stdio

Could you please take a look at them? Thanks!

-- 
Best regards,
João Marcos Costa

--------------MJ103GLI5A1lFo6zZDFwQ6Uf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello, Ross</font><br>
    </p>
    <div class="moz-cite-prefix">On 7/23/24 16:51, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240723145137.74198-5-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">These dependencies are only used in development:
- attrs
- setuptools

These dependencies are obsolete:
- atomicwrites removed 7.2.0
- importlib-metadata removed in 5.1.0
- more-itertools removed 6.1.0
- pathlib2 removed 6.2.2
- py removed in 7.2
- six removed in 5.0.0
- tomllib not needed as we have Python 3.11+
- wcwidth removed in 6.0.0
</pre>
    </blockquote>
    <p><font face="monospace">[...]</font></p>
    <p><font face="monospace">There are a few errors potentially related
        to tomllib removal in the autobuilder:</font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6836/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6836/steps/13/logs/stdio</a></font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6659/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6659/steps/13/logs/stdio</a></font></p>
    <p><font face="monospace">Could you please take a look at them?
        Thanks!<br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------MJ103GLI5A1lFo6zZDFwQ6Uf--

