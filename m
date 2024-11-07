Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C07D43370
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 15:31:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.74638.1730993493435448854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 07:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dW8my1U+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46A331BF204;
	Thu,  7 Nov 2024 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730993491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5reYC6a29u8h17bdgglKg6zLiDgGddH964yvkz20T8=;
	b=dW8my1U+rcA97+OP8q2qqlzK8gvbE9CKCNwwJXOZp6Tn5vov5rffqDK/81Xw/M/jL0GLBi
	yAHFozH4uKhs2P/p5xuZPgrB1Ncr3rnSANtCBkKdT1rdYIXJ/tyr4/Edb57SMhlpylo0El
	f++GQXFfPFWC7Ivqo50EQG3z97LCkeI7PwFVC3QWFKPIwADgEPC93pzJyoiyrWZ4hvUp4a
	e9KPxBUt0Kd4or4hueUUGwi/p7ktQOCoHnMMdnL+F1ZrcMtfTAKvjq6824dRaaa1uwdtiO
	37Z1ikJmDNFkdX24XCGlFwUuXd6ayi8+245nuEIPiBTuZlmZLxFiFiIwj5D4uw==
Content-Type: multipart/alternative;
 boundary="------------RM0hkqUnTk8Sdcm1sARJ3ybw"
Message-ID: <e17a3c4d-9729-429b-85a1-3086a4e8beae@bootlin.com>
Date: Thu, 7 Nov 2024 16:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 11/12] lttng-modules: fix build for 6.12+
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
 <ac12252f5a7d14eda8a14728cf178b93068c99cb.1730946087.git.bruce.ashfield@gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <ac12252f5a7d14eda8a14728cf178b93068c99cb.1730946087.git.bruce.ashfield@gmail.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 15:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206838

This is a multi-part message in MIME format.
--------------RM0hkqUnTk8Sdcm1sARJ3ybw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Bruce

I hope this email finds you well

On 11/7/24 03:29, Bruce Ashfield wrote:
> From: Bruce Ashfield<bruce.ashfield@gmail.com>
>
> We backport two fixes from the -stable 2.13 lttng branch
> to fix the build against kernels 6.12+
>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@gmail.com>
> ---
>   ...-uprobe_register-return-struct-uprob.patch | 160 ++++++++++++++++++
>   ...fine-the-show_inode_state-macro-defi.patch |  68 ++++++++
>   .../lttng/lttng-modules_2.13.15.bb            |   2 +
>   3 files changed, 230 insertions(+)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
>   create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch

(...)

There is a ptest failure in the autobuilder:

https://valkyrie.yoctoproject.org/#/builders/73/builds/351/steps/13/logs/stdio

This is not the first time this error appears, though.

Still, could you please take a look?

-- 
Best regards,
João Marcos Costa

--------------RM0hkqUnTk8Sdcm1sARJ3ybw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello, Bruce</font></p>
    <p><font face="monospace">I hope this email finds you well<br>
      </font></p>
    <div class="moz-cite-prefix">On 11/7/24 03:29, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:ac12252f5a7d14eda8a14728cf178b93068c99cb.1730946087.git.bruce.ashfield@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com">&lt;bruce.ashfield@gmail.com&gt;</a>

We backport two fixes from the -stable 2.13 lttng branch
to fix the build against kernels 6.12+

Signed-off-by: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com">&lt;bruce.ashfield@gmail.com&gt;</a>
---
 ...-uprobe_register-return-struct-uprob.patch | 160 ++++++++++++++++++
 ...fine-the-show_inode_state-macro-defi.patch |  68 ++++++++
 .../lttng/lttng-modules_2.13.15.bb            |   2 +
 3 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch
</pre>
    </blockquote>
    <p><font face="monospace">(...)</font></p>
    <p><font face="monospace">There is a ptest failure in the
        autobuilder:</font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://valkyrie.yoctoproject.org/#/builders/73/builds/351/steps/13/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/73/builds/351/steps/13/logs/stdio</a></font></p>
    <p><font face="monospace">This is not the first time this error
        appears, though.<br>
      </font></p>
    <p><font face="monospace">Still, could you please take a look?</font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------RM0hkqUnTk8Sdcm1sARJ3ybw--

