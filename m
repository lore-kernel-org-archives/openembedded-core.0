Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA87C3DA61
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 08:51:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.13505.1722329486044731364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 01:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VC2+fBGT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15EEA1BF208;
	Tue, 30 Jul 2024 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722329484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2B3Ed1lKwxxwQ8zwGUVTfdwW5BUZp0cmyJYnM5DkyrM=;
	b=VC2+fBGTeG+XvjYS3zShOTORylvfA9Mmzxsvbzxk6YpH7FJx8DAL7UdDyeXlNFDHH/Arza
	4bwIID97x+bxrwGycHasNmd2/Q6jIQH2Ju6/2I93jgTp6Pz2UknSLwDpssnWLFoAisVwmV
	W8LC5WXTXQel9QieCbh9jk9HtypBi/rQ1xiLu3QktGtswDIWigq20u4lcl19f/N4QqcLJL
	QsBZS7E242r1fgVId6atoWxoFaByGOkaXqmDBu4NYnagBkhgk6XycF5frSW7pTkEtnlITz
	QrQEvFxAY0csFg+anhh7hSVKLxsMo7Ozr6W3KSmVg1HywXWNoGKtAsoQK/G4Pg==
Content-Type: multipart/alternative;
 boundary="------------5hNJXF0yOZKJQu7tp4NDoQuh"
Message-ID: <f5f1f5e4-f946-496d-ab3d-74427ac0d635@bootlin.com>
Date: Tue, 30 Jul 2024 10:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 06/33] libnl: upgrade 3.9.0 -> 3.10.0
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
 <1722215408-27541-6-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <1722215408-27541-6-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 08:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202668

This is a multi-part message in MIME format.
--------------5hNJXF0yOZKJQu7tp4NDoQuh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Wang

On 7/29/24 03:09, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu<wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu<wangmy@fujitsu.com>
> ---
>   meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} (96%)
>
> diff --git a/meta/recipes-support/libnl/libnl_3.9.0.bb b/meta/recipes-support/libnl/libnl_3.10.0.bb
> similarity index 96%
> rename from meta/recipes-support/libnl/libnl_3.9.0.bb
> rename to meta/recipes-support/libnl/libnl_3.10.0.bb
> index b2825374cf..4691c6554f 100644
> --- a/meta/recipes-support/libnl/libnl_3.9.0.bb
> +++ b/meta/recipes-support/libnl/libnl_3.10.0.bb
> @@ -18,7 +18,7 @@ SRC_URI ="${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')} 
> file://run-ptest \ "

Could you please check this autobuilder error?

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6679/steps/13/logs/stdio

namely:

Failed ptests:
{'libnl': ['cksuite-all-netns.c:Core:route_1_command']}

Thanks!

-- 
Best regards,
João Marcos Costa

--------------5hNJXF0yOZKJQu7tp4NDoQuh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello, Wang</font><br>
    </p>
    <div class="moz-cite-prefix">On 7/29/24 03:09, wangmy via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1722215408-27541-6-git-send-email-wangmy@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">From: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
---
 meta/recipes-support/libnl/{libnl_3.9.0.bb =&gt; libnl_3.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libnl/{libnl_3.9.0.bb =&gt; libnl_3.10.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/libnl_3.9.0.bb b/meta/recipes-support/libnl/libnl_3.10.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.9.0.bb
rename to meta/recipes-support/libnl/libnl_3.10.0.bb
index b2825374cf..4691c6554f 100644
--- a/meta/recipes-support/libnl/libnl_3.9.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.10.0.bb
@@ -18,7 +18,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="mailto:${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}file://run-ptest\">"${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://run-ptest \
            "</a>
</pre>
    </blockquote>
    <p><font face="monospace">Could you please check this autobuilder
        error?</font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6679/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6679/steps/13/logs/stdio</a></font></p>
    <p><font face="monospace">namely:</font></p>
    <p><font face="monospace">Failed ptests:<br>
        {'libnl': ['cksuite-all-netns.c:Core:route_1_command']}<br>
      </font></p>
    <p><font face="monospace">Thanks!<br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------5hNJXF0yOZKJQu7tp4NDoQuh--

