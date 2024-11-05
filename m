Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D0DD1269D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 12:30:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.16689.1730809812908018149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 04:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P2hFNG+z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDE26FF808
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730809811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPOpVNvnNczFnIp8BrRAhdkXKzzAMJMOFMR7EmRypng=;
	b=P2hFNG+zf0Kn2/8hyGh++z3Co8qZb0Nakq6U4PKC4CHfxiL8yW7TPpORc5k1do21+oFM3y
	bTfMYVL6+HWVMTXhgeEoxrgHgpx8QHcJYYi8BgbOSZtK9cJ42GGohasSZKsVURvkA2QE3B
	hsEO2K2ralb/D4nT5Sz6v8mtICX/zvfIv7httRxzUVwLl2NwPSQuB5EMoF/xh5TocoiNmy
	v2wcf1o6ngZAjqdcMmPiXVFzWLSKeJCpTCjN34DngCFk69CMsSH3Ek5Vn6JMaFaQ40recQ
	4tnZ8e3TdgUYlqGdHh96B6BtIUmyXl0kGA8ayjbnHNF9hM07exkepZ6H1zkQgA==
Content-Type: multipart/alternative;
 boundary="------------D4cDlmVtEChkBq8EciErGLbe"
Message-ID: <2109b74c-9c7c-493f-808c-da68f3c24697@bootlin.com>
Date: Tue, 5 Nov 2024 13:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
To: openembedded-core@lists.openembedded.org
References: <20241031101556.1913400-1-alex.kanavin@gmail.com>
 <8da131e0-d2a0-4f9a-be25-a0f70af09886@bootlin.com>
 <CANNYZj-1Amk-9dA4XFDcr3SNcphT4MzHNFmcieBw6iwfzWqEMg@mail.gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj-1Amk-9dA4XFDcr3SNcphT4MzHNFmcieBw6iwfzWqEMg@mail.gmail.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 12:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206708

This is a multi-part message in MIME format.
--------------D4cDlmVtEChkBq8EciErGLbe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 11/5/24 12:59, Alexander Kanavin wrote:
> On Tue, 5 Nov 2024 at 10:25, Joao Marcos Costa
> <joaomarcos.costa@bootlin.com>  wrote:
>> I noticed a ptest failure potentially related to the update:
>>
>> https://valkyrie.yoctoproject.org/#/builders/73/builds/319/steps/12/logs/stdio  (lines 432-433)
>>
>> Failed ptests:
>> {'tcl': ['http11.test']}
>>
>> Could you please take a look? Thanks!
> Hello,
> this happened just once 4 days ago, and isn't reproducible:
> https://valkyrie.yoctoproject.org/#/builders/73
>   If you see this again, please let me know. We can add the specific
> failing testcase to the tcl's ptest skiplist.
Ack. Thanks!
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206705):https://lists.openembedded.org/g/openembedded-core/message/206705
> Mute This Topic:https://lists.openembedded.org/mt/109311930/8026893
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [joaomarcos.costa@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Best regards,
João Marcos Costa

--------------D4cDlmVtEChkBq8EciErGLbe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello,</font><br>
    </p>
    <div class="moz-cite-prefix">On 11/5/24 12:59, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj-1Amk-9dA4XFDcr3SNcphT4MzHNFmcieBw6iwfzWqEMg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 5 Nov 2024 at 10:25, Joao Marcos Costa
<a class="moz-txt-link-rfc2396E" href="mailto:joaomarcos.costa@bootlin.com">&lt;joaomarcos.costa@bootlin.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I noticed a ptest failure potentially related to the update:

<a class="moz-txt-link-freetext" href="https://valkyrie.yoctoproject.org/#/builders/73/builds/319/steps/12/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/73/builds/319/steps/12/logs/stdio</a> (lines 432-433)

Failed ptests:
{'tcl': ['http11.test']}

Could you please take a look? Thanks!
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hello,
this happened just once 4 days ago, and isn't reproducible:
<a class="moz-txt-link-freetext" href="https://valkyrie.yoctoproject.org/#/builders/73">https://valkyrie.yoctoproject.org/#/builders/73</a>
 If you see this again, please let me know. We can add the specific
failing testcase to the tcl's ptest skiplist.</pre>
    </blockquote>
    <font face="monospace">Ack. Thanks!</font><br>
    <blockquote type="cite"
cite="mid:CANNYZj-1Amk-9dA4XFDcr3SNcphT4MzHNFmcieBw6iwfzWqEMg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#206705): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/206705">https://lists.openembedded.org/g/openembedded-core/message/206705</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109311930/8026893">https://lists.openembedded.org/mt/109311930/8026893</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:joaomarcos.costa@bootlin.com">joaomarcos.costa@bootlin.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------D4cDlmVtEChkBq8EciErGLbe--

