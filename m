Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8633EC52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 09:02:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.73304.1724749369878801591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 02:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QdHtup8D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C1F81BF204
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724749368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucZReA6PCnGQ1WeHqUVL0mYqdkk1GkpLOJzZQckqRqI=;
	b=QdHtup8DCaWmRpRoPI47l5e/8W7a0whSt+RtPBYxY1k6f9vPvNhoBklPiZr/mM6paCxEXt
	xPEduj9HiO+btF1pGfiKzYHYJ66OL/bm7hZBL/8W0j544VP80PwunzmVS/ehX2UGrWvVPc
	aVgT4Bjw5WFDuKKSDkmckfGdARnJo+1zPgyV0IhX4wXvgr2sxBF3xuxLqoimYPwxnG9mg7
	9qZsGUq/5ojjvldpLqXI3lzW4G9hHOuQ4y08aTb4q4esvl4xMTakGkuYR0DgS81+hwOgVG
	LJlJMTH9U8jAzW9XvZgdkwuM4h58J14AFmEVczm5+Rhl782mTwLUdoqQYMjnqw==
Content-Type: multipart/alternative;
 boundary="------------fVXSXz0ydxiYXoaZNIN5ITtZ"
Message-ID: <3b516fea-bfac-4c9e-baaa-9a80d699b0d9@bootlin.com>
Date: Tue, 27 Aug 2024 11:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from
 2.40.1 to 2.40.2
Content-Language: en-US, fr
To: openembedded-core@lists.openembedded.org
References: <20240822092642.893250-1-Qi.Chen@windriver.com>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240822092642.893250-1-Qi.Chen@windriver.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203819

This is a multi-part message in MIME format.
--------------fVXSXz0ydxiYXoaZNIN5ITtZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Chen

On 8/22/24 11:26, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi<Qi.Chen@windriver.com>
>
> Upgrade util-linux from 2.40.1 to 2.40.2.
>
> 0001-Revert-autotools-make-pam-install-path-configurable.patch
> is added to solve a problem of lastlog2 pam module not installed
> in the expected location.
>
> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>

This update might be causing the ptest failure below, in the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6937/steps/12/logs/stdio

Could you please take a look?

-- 
Best regards,
João Marcos Costa

--------------fVXSXz0ydxiYXoaZNIN5ITtZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello, Chen</font><br>
    </p>
    <div class="moz-cite-prefix">On 8/22/24 11:26, Chen Qi via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240822092642.893250-1-Qi.Chen@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>

Upgrade util-linux from 2.40.1 to 2.40.2.

0001-Revert-autotools-make-pam-install-path-configurable.patch
is added to solve a problem of lastlog2 pam module not installed
in the expected location.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
</pre>
    </blockquote>
    <p><font face="monospace">This update might be causing the ptest
        failure below, in the autobuilder:</font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6937/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6937/steps/12/logs/stdio</a></font></p>
    <p><font face="monospace">Could you please take a look?<br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------fVXSXz0ydxiYXoaZNIN5ITtZ--

