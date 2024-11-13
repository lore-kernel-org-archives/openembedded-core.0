Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5814FD41C23
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 09:26:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.8063.1731490003982568653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 01:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l8YCCWQC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3916C1C0008
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731490002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/i3q8ry8bYi0LPbhaAxtk3TpOdb1RHbr+UfSROjUZZE=;
	b=l8YCCWQCl1xkWq9qU69rsnngFYYLAwYHHWKDNhXxKfqYCDMBek8Z1CfjMIgAZaQi2Rkhgj
	kg2y0LXoBkBULhanIRQLenPuAY4uKG5YBMZaQfo1tl8iSr3bqIFozgfBz4qE2LPhHyZfIZ
	/ZtG6Qy+1wMWjPJkwlEuw4hgXhy2mmUG5s7N8r8UalLyF0xK07CH7H6Cpjp6umMU8EZF+n
	hAmXbwz7nEMC6gNfo1jrsm4OLNyhST7wjsC1B7PadvXFYUVHztVi+DFkkfW/lNbLIIwSvK
	T1E9L/mv6/iqoDxzGM9GXoJ+eaPaOG3YFJP/nMS9iVZ0QnlPI/G3Ut9NxteACw==
Content-Type: multipart/alternative;
 boundary="------------Uop0o0vnnaGOX5FCXhBr2OKh"
Message-ID: <637f2f5e-7f27-4f2a-9517-70059040e852@bootlin.com>
Date: Wed, 13 Nov 2024 10:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes-recipe/core-image: drop debug-tweaks
 IMAGE_FEATURE
To: openembedded-core@lists.openembedded.org
References: <20241107134752.2071720-1-ross.burton@arm.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20241107134752.2071720-1-ross.burton@arm.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 09:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207094

This is a multi-part message in MIME format.
--------------Uop0o0vnnaGOX5FCXhBr2OKh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Ross

I hope this e-mail finds you well

On 11/7/24 14:47, Ross Burton wrote:
> Remove the 'debug-tweaks' IMAGE_FEATURE. It sounds friendly and kind to
> developers, but it results primarily in an image which root can login
> remotely without a password.  This is incredibly useful for local
> development and testing purposes, but we really want to be explicit that
> this is what is happening instead of hiding it behind a vague "debug
> tweaks" statement.
>
> To preserve the eixsting behaviour, debug-tweaks should be replaced with
> these features:
>
>    allow-empty-password empty-root-password allow-root-login post-install-logging
>
> Signed-off-by: Ross Burton<ross.burton@arm.com>
> ---

(...)

What do you think about simply replacing 'debug-tweaks' with a more 
explicit term, like 'root-debug-no-password' or something similar?

Using a clearer label would make the feature's purpose more transparent 
without being vague. Plus, it would avoid the need to list all four 
individual features each time.

-- 
Best regards,
João Marcos Costa

--------------Uop0o0vnnaGOX5FCXhBr2OKh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello, Ross</font></p>
    <p><font face="monospace">I hope this e-mail finds you well<br>
      </font></p>
    <div class="moz-cite-prefix">On 11/7/24 14:47, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241107134752.2071720-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">Remove the 'debug-tweaks' IMAGE_FEATURE. It sounds friendly and kind to
developers, but it results primarily in an image which root can login
remotely without a password.  This is incredibly useful for local
development and testing purposes, but we really want to be explicit that
this is what is happening instead of hiding it behind a vague "debug
tweaks" statement.

To preserve the eixsting behaviour, debug-tweaks should be replaced with
these features:

  allow-empty-password empty-root-password allow-root-login post-install-logging

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---</pre>
    </blockquote>
    <p><font face="monospace">(...)</font></p>
    <font face="monospace">What do you think about simply replacing
      'debug-tweaks' with a more explicit term, like
      'root-debug-no-password' or something similar?<br>
      <br>
      Using a clearer label would make the feature's purpose more
      transparent without being vague. Plus, it would avoid the need to
      list all four individual features each time.</font><span
    style="white-space: pre-wrap">
</span>
    <p></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------Uop0o0vnnaGOX5FCXhBr2OKh--

