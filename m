Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82825C3DA63
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 07:48:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.56101.1721980136348108465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 00:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BDtOKvJm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AE36C0003;
	Fri, 26 Jul 2024 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721980134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ts7VyN+QJXXiYxUYfgIHeX30G/iok0IsKqnyvjIUZoQ=;
	b=BDtOKvJmqvUw79iPLI9PlpA1IDEMtsC4u/n0MQVELte4fFoQbpeoEe9cjYe+F+ovvH883+
	/Fkza2ckuCkYXRaaDxD6TAySeVqTwPfVtesxnniZBBDWOOx4yRkTC/jXgm79GPdoNiP/4f
	H5zJAVlauF8llB+GWME6HuYjOwmSYSrIsomSqSPriNSWZQl2XhHBH2+u2a5jVgSz1dvr6b
	7xlJBYpRGEnQpm1At04Op7TrCQQ/0AmasPHw1RTeLgwP7/94ERFhSYSBKAgpGre2ubJV9W
	uOSuCLVbXvQr568yd4HoUEwIzAinaWFPBzWaWay+nxbAnQzrg1x/DTtKMCJnuA==
Content-Type: multipart/alternative;
 boundary="------------RyilpM1o2zjMN3WxuYhr9Fru"
Message-ID: <561ea044-054b-4e27-82bc-452ee2f17df3@bootlin.com>
Date: Fri, 26 Jul 2024 09:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 23/37] python3-beartype: use
 python_setuptools_build_meta build class
Content-Language: en-US, fr
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
References: <20240723145137.74198-1-ross.burton@arm.com>
 <20240723145137.74198-23-ross.burton@arm.com>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240723145137.74198-23-ross.burton@arm.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 07:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202517

This is a multi-part message in MIME format.
--------------RyilpM1o2zjMN3WxuYhr9Fru
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Ross

On 7/23/24 16:51, Ross Burton wrote:
> This package can be built using pep517 classes now.
>
> Signed-off-by: Ross Burton<ross.burton@arm.com>
> ---
>   meta/recipes-devtools/python/python3-beartype_0.18.5.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
> index 00554dd60c5..95d947c90ee 100644
> --- a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
> +++ b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM ="file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
>   
>   SRC_URI[sha256sum] = "264ddc2f1da9ec94ff639141fbe33d22e12a9f75aa863b83b7046ffff1381927"
>   
> -inherit setuptools3 pypi
> +inherit pypi python_setuptools_build_meta
>   
>   RDEPENDS:${PN} += "python3-numbers python3-io"

Could this patch be causing such an error in the autobuilder?

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6663/steps/11/logs/stdio

-- 
Best regards,
João Marcos Costa

--------------RyilpM1o2zjMN3WxuYhr9Fru
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello, Ross<br>
      </font></p>
    <div class="moz-cite-prefix">On 7/23/24 16:51, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240723145137.74198-23-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---
 meta/recipes-devtools/python/python3-beartype_0.18.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
index 00554dd60c5..95d947c90ee 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e">"file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"</a>
 
 SRC_URI[sha256sum] = "264ddc2f1da9ec94ff639141fbe33d22e12a9f75aa863b83b7046ffff1381927"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-numbers python3-io"
</pre>
    </blockquote>
    <p><font face="monospace">Could this patch be causing such an error
        in the autobuilder?</font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6663/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6663/steps/11/logs/stdio</a><br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------RyilpM1o2zjMN3WxuYhr9Fru--

