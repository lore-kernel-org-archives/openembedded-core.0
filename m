Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B509C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:36:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.12750.1707489364358843257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=VIpHtWqY;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68c495ba558so4954186d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707489363; x=1708094163; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXJp75G9Lsv2qdcXZDvkO2hVpzuXH/lWJsZI+7GVbng=;
        b=VIpHtWqYyg8pANSnQPv4R6rNhBFZtIrgl1P7PkSfBfBZRWLg7MaeG3kuqefNV/a1ma
         YB6yALj4OVZNYTg/BbSwFx6EATPBk30/lcymQ5egP1o5g5U4leGeyzy+k5NB4i8hX/1b
         CpKX8V6g1IRH4c3ehqO1a0ej4XfajyVVCwyFo0/QL8ZZ6h5eawrrATaumAM+Q05qoI31
         mXtISeJVe4o/2WTCrMDP/yMUaMHlDOlsWfeO/oFIa4EcT3cRusb7SuAOahj7yPG+nnGX
         n24IRQRKy56r1DYnw4PPkHD0yrRgkaaqIkOuxXBVoGAd92NwMVrkQ1Q8uKNR3DCIzZBV
         FsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707489363; x=1708094163;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sXJp75G9Lsv2qdcXZDvkO2hVpzuXH/lWJsZI+7GVbng=;
        b=Qmf2PlATtx5BC+DdpygqqM5n/4aXZZHAoGIKnt7ZHfPtIgQzMggeTLMo/wdhrgN3Ku
         iwYClAZHgrJ5nClZVlE5+ON173OW8C48mAcw0SmOcE7+IheRXtZ1PslPOrMXt4rpJjFb
         yLfNijtokIzKEp3TwjAgUpbCDLFx3cIzZocj74Zs2xVrx5bJiCQIf4txykCq5F/SBdXo
         BC+PvvquOQFiC6zv/moOowgbM/n6zqF7xL8S+2XGtCx95GNhnjIaeTPrYmXZ8yChqUZy
         mz/SBQV3Go+Wv4nwJyTsk7XGFu9riLmyZnjJ2Hm9Kg+rW41PI/S0iKieW94eHBi8J7vM
         lcoA==
X-Gm-Message-State: AOJu0Yw9Z2I2SjhB/rfmT/vbgiUPtGnvbytjTCgvx6QmB7T3O09zPPch
	C6OK96U+wS0T6/PaUx4e4hmdnMcSzYLNSYJD5dDNpwltjMKp2DT2l9THYQ5xZNI=
X-Google-Smtp-Source: AGHT+IFpqh7mW2GXlj0groCRP6Kd2PSUDkMqW545y24w1r/ndU2eFzfE+J6NHvG8Fk5XSHCkAN7PoA==
X-Received: by 2002:a05:6214:4014:b0:68c:5a42:41a3 with SMTP id kd20-20020a056214401400b0068c5a4241a3mr1682037qvb.34.1707489363113;
        Fri, 09 Feb 2024 06:36:03 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ny17-20020a056214399100b006869485d9eesm873663qvb.82.2024.02.09.06.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 06:36:02 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------7qLGVb9QszrKNjMy0B0nmAuX"
Message-ID: <1d790c49-6f24-4e0f-8a7f-99eb64522795@baylibre.com>
Date: Fri, 9 Feb 2024 09:36:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] patchtest-send-results: Add 'References' header
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240209143041.1688862-1-tgamblin@baylibre.com>
 <CANNYZj97v=L+SJeKKfdxcf8HxFa+LV7Poo5Y+8gzsLMht=qmmw@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj97v=L+SJeKKfdxcf8HxFa+LV7Poo5Y+8gzsLMht=qmmw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195222

This is a multi-part message in MIME format.
--------------7qLGVb9QszrKNjMy0B0nmAuX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-02-09 09:32, Alexander Kanavin wrote:
> I'm also seeing in google mail web client that patchtest responses
> aren't threaded with the original patch; will this address it?

It should. I went and compared Patchtest's responses to emails versus 
users' in threads (actually, one of yours!) and that was the main 
difference. It lines up with what the RFC says, too:

The "In-Reply-To:" and "References:" fields are used when creating a
    reply to a message.  They hold the message identifier of the original
    message and the message identifiers of other messages (for example,
    in the case of a reply to a message which was itself a reply).  The
    "In-Reply-To:" field may be used to identify the message (or
    messages) to which the new message is a reply, while the
    "References:" field may be used to identify a "thread" of
    conversation.

and

Note: Some implementations parse the "References:" field to display
    the "thread of the discussion".  These implementations assume that
    each new message is a reply to a single parent and hence that they
    can walk backwards through the "References:" field to find the parent
    of each message listed there.  Therefore, trying to form a
    "References:" field for a reply that has multiple parents is
    discouraged and how to do so is not defined in this document.

- Trevor

>
> Alex
>
> On Fri, 9 Feb 2024 at 15:30, Trevor Gamblin<tgamblin@baylibre.com>  wrote:
>> Based onhttps://www.rfc-editor.org/rfc/rfc2822#section-3.6.4, to get
>> proper threading there should be a 'References' field defined in
>> Patchtest's response headers if its replies are going to thread properly
>> on Patchwork. This wasn't there before, hence why were were seeing the
>> responses in the right place on the mailing list but not Patchwork.
>>
>> Since we only want Patchtest to reply directly to the tested patch,
>> the 'References' field should only need to contain the same ID as the
>> 'In-Reply-To' one.
>>
>> Signed-off-by: Trevor Gamblin<tgamblin@baylibre.com>
>> ---
>>   scripts/patchtest-send-results | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
>> index 075b60d8f7d..9fd24c9b959 100755
>> --- a/scripts/patchtest-send-results
>> +++ b/scripts/patchtest-send-results
>> @@ -81,9 +81,14 @@ if has_a_failed_test(testresult):
>>           reply_contents = greeting + testresult + suggestions
>>
>>       ses_client = boto3.client('ses', region_name='us-west-2')
>> +
>> +    # Construct the headers for the email. We only want to reply
>> +    # directly to the tested patch, so make In-Reply-To and References
>> +    # the same value.
>>       raw_data = 'From: ' + from_address + '\nTo: ' + reply_address + \
>>           '\nCC: ' + cc_address + '\nSubject:' + subject_line + \
>>           '\nIn-Reply-To:' + in_reply_to + \
>> +        '\nReferences:' + in_reply_to + \
>>           '\nMIME-Version: 1.0" + \
>>           "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n' + \
>>           reply_contents + '\n\n--NextPart'
>> --
>> 2.43.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#195220):https://lists.openembedded.org/g/openembedded-core/message/195220
>> Mute This Topic:https://lists.openembedded.org/mt/104259219/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------7qLGVb9QszrKNjMy0B0nmAuX
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
    <div class="moz-cite-prefix">On 2024-02-09 09:32, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj97v=L+SJeKKfdxcf8HxFa+LV7Poo5Y+8gzsLMht=qmmw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I'm also seeing in google mail web client that patchtest responses
aren't threaded with the original patch; will this address it?</pre>
    </blockquote>
    <p>It should. I went and compared Patchtest's responses to emails
      versus users' in threads (actually, one of yours!) and that was
      the main difference. It lines up with what the RFC says, too:</p>
    <pre class="newpage">The "In-Reply-To:" and "References:" fields are used when creating a
   reply to a message.  They hold the message identifier of the original
   message and the message identifiers of other messages (for example,
   in the case of a reply to a message which was itself a reply).  The
   "In-Reply-To:" field may be used to identify the message (or
   messages) to which the new message is a reply, while the
   "References:" field may be used to identify a "thread" of
   conversation.</pre>
    <p></p>
    <p>and</p>
    <pre class="newpage">Note: Some implementations parse the "References:" field to display
   the "thread of the discussion".  These implementations assume that
   each new message is a reply to a single parent and hence that they
   can walk backwards through the "References:" field to find the parent
   of each message listed there.  Therefore, trying to form a
   "References:" field for a reply that has multiple parents is
   discouraged and how to do so is not defined in this document.</pre>
    <p></p>
    <p>- Trevor<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj97v=L+SJeKKfdxcf8HxFa+LV7Poo5Y+8gzsLMht=qmmw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex

On Fri, 9 Feb 2024 at 15:30, Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:tgamblin@baylibre.com">&lt;tgamblin@baylibre.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Based on <a class="moz-txt-link-freetext" href="https://www.rfc-editor.org/rfc/rfc2822#section-3.6.4">https://www.rfc-editor.org/rfc/rfc2822#section-3.6.4</a>, to get
proper threading there should be a 'References' field defined in
Patchtest's response headers if its replies are going to thread properly
on Patchwork. This wasn't there before, hence why were were seeing the
responses in the right place on the mailing list but not Patchwork.

Since we only want Patchtest to reply directly to the tested patch,
the 'References' field should only need to contain the same ID as the
'In-Reply-To' one.

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:tgamblin@baylibre.com">&lt;tgamblin@baylibre.com&gt;</a>
---
 scripts/patchtest-send-results | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 075b60d8f7d..9fd24c9b959 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -81,9 +81,14 @@ if has_a_failed_test(testresult):
         reply_contents = greeting + testresult + suggestions

     ses_client = boto3.client('ses', region_name='us-west-2')
+
+    # Construct the headers for the email. We only want to reply
+    # directly to the tested patch, so make In-Reply-To and References
+    # the same value.
     raw_data = 'From: ' + from_address + '\nTo: ' + reply_address + \
         '\nCC: ' + cc_address + '\nSubject:' + subject_line + \
         '\nIn-Reply-To:' + in_reply_to + \
+        '\nReferences:' + in_reply_to + \
         '\nMIME-Version: 1.0" + \
         "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n' + \
         reply_contents + '\n\n--NextPart'
--
2.43.0


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#195220): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/195220">https://lists.openembedded.org/g/openembedded-core/message/195220</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/104259219/1686489">https://lists.openembedded.org/mt/104259219/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7qLGVb9QszrKNjMy0B0nmAuX--

