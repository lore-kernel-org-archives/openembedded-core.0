Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D476C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 12:22:10 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.17319.1708086126541107496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 04:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=uT7MKxYd;
 spf=pass (domain: baylibre.com, ip: 209.85.167.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c02b993a5aso425336b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 04:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708086125; x=1708690925; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXj/R6FWL3nevF+OFVfZxEFNNaDTQxdJ/gAYemdnUXE=;
        b=uT7MKxYdpyJW9vcJp8ttIeJ8v1i13K7NhpqytHxpUiRyodY96cfnKFRaGlObTKkiHC
         /hy3fy2y+SmWZ1+N5cqP9sPIukn37ENmfLGbhtkDEVyJePilqnnFHw3ndP0kdNwIVhSH
         825nM9H2YDePH2sMqyk/Go1r08ux9wjfg043JVuMAEmMzSQQmUHuMOkyyytZYW4vcFmN
         OhKZDRXKIcCsfQuLViTrihC4JkZZ5+qFswKIuU+2/1mxNM8KlHL9Ff09iqSSPFNnX+LM
         3SG7RzyXR/TLBb5l65zT4tRuiDiFSf4THznuzmaeEMR8dJ0XImnsK7M+axr2VYNoWQqH
         Q6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708086125; x=1708690925;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXj/R6FWL3nevF+OFVfZxEFNNaDTQxdJ/gAYemdnUXE=;
        b=Id/4cttT8pv5g33A8pPNAeR1ZUCKH51YqzTKLauXMfXjRZkNnRZsgWj5LAPsp3MB0G
         bt6qg8sdyaAguybG4J++N/f09fmQJpMVcakgaMl8pzn+CRDuROtr/NVL8FsMYdLVfTqs
         NvoHwvyY26/jkXdo+kaiZiXziykB7Vb5GLVNbn/D6OvEkUiRaYYXl2kBIkNfZminoJyX
         31L/gIa8BbAm3+JgpTz0Rx/aj2pMXPqBIvCNLOjytSuXU8wQqWjqMPYlxBeTsp1d1ugs
         n4CD7cwkWzd2oSxJNH5k7H6CNOCEbpCdd+JKWP9WyG7NUrMpH7/s3f2TmHuNBZKLgL4T
         qDeQ==
X-Gm-Message-State: AOJu0Yx1gHnnYKGkVJZlQpkAWLRX6y3xkyQSjdfOsFm7Z93kshyqgfEl
	RLrm74/VqEIn4BhJXsxehNgMAVZXIoNtsRDIpCmTwK4CcGZWW7+VeAFZxLYyKC0=
X-Google-Smtp-Source: AGHT+IFm01SRKjQTxqXny0i9LDsq1UIb+6Wwj7DDo6QsVRr7q9M2DR/swXwS7ag9xBApdgJGaFvGXA==
X-Received: by 2002:a05:6808:2388:b0:3c0:4129:9467 with SMTP id bp8-20020a056808238800b003c041299467mr6089610oib.0.1708086125312;
        Fri, 16 Feb 2024 04:22:05 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id mc7-20020a056214554700b0068cb9a819a2sm1689704qvb.28.2024.02.16.04.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 04:22:04 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------AgF8uxB0iHa9Sn3dqrnsSQ5g"
Message-ID: <3c9e33ac-295c-4486-b50d-aa18ed9af7ea@baylibre.com>
Date: Fri, 16 Feb 2024 07:22:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] patchtest-send-results: use Message-ID directly
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240215213705.3315438-1-tgamblin@baylibre.com>
 <CANNYZj_ooL_1SoQ17y_03cOXghrW5MaEUc6+tpA9PVi3x312nw@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_ooL_1SoQ17y_03cOXghrW5MaEUc6+tpA9PVi3x312nw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 12:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195763

This is a multi-part message in MIME format.
--------------AgF8uxB0iHa9Sn3dqrnsSQ5g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-02-16 04:35, Alexander Kanavin wrote:
> Just wanted to note that sadly patchtest replies still aren't
> threaded. What are regular mail clients doing that patchtest does not?

Patchwork's docs say 
(https://patchwork.readthedocs.io/en/latest/usage/overview/#comments):

|Comments are replies to a submission - either a patch or a cover 
letter. Unlike a Mail User Agent (MUA) like Gmail, Patchwork does not 
thread comments. Instead, every comment is associated with either a 
patch or a cover letter, and organized by date.|

I'm wondering if maybe it's as simple as the subject line being too 
different - instead of "Patchtest results for [OE-core][PATCH 1/2] 
patchtest: Fix grammar in log output", maybe it just needs to reply with 
the exact subject line like anyone else.

That being said, I haven't seen the Patchtest service send a result 
since that change was merged...

>
> Alex
>
> On Thu, 15 Feb 2024 at 22:37, Trevor Gamblin<tgamblin@baylibre.com>  wrote:
>> There's no need to use regex for extracting the Message-ID field from
>> the patch email and mangle it by removing the angle brackets in the
>> process. Pull it directly from the mbox so that Patchtest's replies have
>> even fewer differences when compared to other replies. Also add a TODO
>> so that it's clear this needs adjustment when full series support is
>> added.
>>
>> Signed-off-by: Trevor Gamblin<tgamblin@baylibre.com>
>> ---
>>   scripts/patchtest-send-results | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
>> index 8190fe86c32..8a3dadbd111 100755
>> --- a/scripts/patchtest-send-results
>> +++ b/scripts/patchtest-send-results
>> @@ -65,7 +65,9 @@ subject_line = f"Patchtest results for {mbox_subject}"
>>   reply_address = mbox[0]['from']
>>
>>   # extract the message ID and use that as the in-reply-to address
>> -in_reply_to = re.findall("<(.*)>", mbox[0]['Message-ID'])[0]
>> +# TODO: This will need to change again when patchtest can handle a whole
>> +# series at once
>> +in_reply_to = mbox[0]['Message-ID']
>>
>>   # the address the results email is sent from
>>   from_address ="patchtest@automation.yoctoproject.org"
>> --
>> 2.43.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#195705):https://lists.openembedded.org/g/openembedded-core/message/195705
>> Mute This Topic:https://lists.openembedded.org/mt/104382040/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------AgF8uxB0iHa9Sn3dqrnsSQ5g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2024-02-16 04:35, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_ooL_1SoQ17y_03cOXghrW5MaEUc6+tpA9PVi3x312nw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Just wanted to note that sadly patchtest replies still aren't
threaded. What are regular mail clients doing that patchtest does not?</pre>
    </blockquote>
    <p>Patchwork's docs say
      (<a class="moz-txt-link-freetext" href="https://patchwork.readthedocs.io/en/latest/usage/overview/#comments">https://patchwork.readthedocs.io/en/latest/usage/overview/#comments</a>):</p>
    <p><code>Comments are replies to a submission - either a patch or a
        cover letter. Unlike
        a Mail User Agent (MUA) like Gmail, Patchwork does not thread
        comments.
        Instead, every comment is associated with either a patch or a
        cover letter, and
        organized by date.</code></p>
    <p>I'm wondering if maybe it's as simple as the subject line being
      too different - instead of "Patchtest results for [OE-core][PATCH
      1/2] patchtest: Fix grammar in log output", maybe it just needs to
      reply with the exact subject line like anyone else.</p>
    <p>That being said, I haven't seen the Patchtest service send a
      result since that change was merged...<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj_ooL_1SoQ17y_03cOXghrW5MaEUc6+tpA9PVi3x312nw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex

On Thu, 15 Feb 2024 at 22:37, Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:tgamblin@baylibre.com">&lt;tgamblin@baylibre.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
There's no need to use regex for extracting the Message-ID field from
the patch email and mangle it by removing the angle brackets in the
process. Pull it directly from the mbox so that Patchtest's replies have
even fewer differences when compared to other replies. Also add a TODO
so that it's clear this needs adjustment when full series support is
added.

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:tgamblin@baylibre.com">&lt;tgamblin@baylibre.com&gt;</a>
---
 scripts/patchtest-send-results | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 8190fe86c32..8a3dadbd111 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -65,7 +65,9 @@ subject_line = f"Patchtest results for {mbox_subject}"
 reply_address = mbox[0]['from']

 # extract the message ID and use that as the in-reply-to address
-in_reply_to = re.findall("&lt;(.*)&gt;", mbox[0]['Message-ID'])[0]
+# TODO: This will need to change again when patchtest can handle a whole
+# series at once
+in_reply_to = mbox[0]['Message-ID']

 # the address the results email is sent from
 from_address = <a class="moz-txt-link-rfc2396E" href="mailto:patchtest@automation.yoctoproject.org">"patchtest@automation.yoctoproject.org"</a>
--
2.43.0


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#195705): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/195705">https://lists.openembedded.org/g/openembedded-core/message/195705</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/104382040/1686489">https://lists.openembedded.org/mt/104382040/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------AgF8uxB0iHa9Sn3dqrnsSQ5g--

