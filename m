Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41443C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:41:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10799.1709728894690616269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3B4FBrt;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-412e96284b9so15002155e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709728893; x=1710333693; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekUdBnZG98Te+D0lQom0U8j9CC90SYS/pIBkOQtJLFA=;
        b=O3B4FBrtVWanKsARcTUqZFe2WbeeUnperVvrYVnJq6sc44tq+PJDDYWamqsehzmqED
         7ToO5azc2hekF/T4RgzUwfQ1/W5Ms6Gsxw9KbVj689RjcoJKfT7oOLK4N3rDczUJD++f
         wV4Gpz+3T+5BJmDuajz3kXzrlL1Vge8A33WNwfWy5uXRjoQWh9MfvO1ziu2Def72yLpg
         6yJiGZhLU1pJJ6nXvUjAhercjF55KB3hNAG/mMsM2b8AI6JNBd/tCaIdr+NROA7fMhWw
         VIgSZ4BjQn8d1GOKoO61uc0n2iGeCPPw2Y/XpccR3yQTGa+HimLlO1S30BCQm8+mpBms
         W4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728893; x=1710333693;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ekUdBnZG98Te+D0lQom0U8j9CC90SYS/pIBkOQtJLFA=;
        b=GFyVCnD13M5kGfaEP9pkd8tG0mnKHyCZ2qWRfLqWCkHXTPQWFNKbjjVyikoPbjbbTz
         5j4NNa3WYN1ppOL/tJRiovswDoc037YEP+nJ+9VhipDFhPbRJIVqSKBAQBrovVQnllkt
         K7d8/z6k2XKBkEZf4ldrwbcv+mealMaIs3r57JJ4eUVFLcqWqBkLtLRRoa3v3hXF7AqN
         Us1kBoKyxBKJ34yv/ydaXmIS+5RkK3ZAmndQ0S4PEgODQgXCb6Awk+tCYc7J5NHUq0ip
         LpoQTrcYMSh3vJHxJC/kR2L+Np/UkWbvh9QC1fTTGEMM6pxCrlAYWt5b5QJxR5O3cdP7
         Dn0A==
X-Gm-Message-State: AOJu0YwCgjy0Z3KDY6JyvS5cL331ALqEvB20paaV+IiQ2FJ/ADZffJgV
	ea0Fnmjbznp932r7ZJNTy8QflTSu/IFEGA8ThFqTs5SkL6L6Vg19WrETSf6G
X-Google-Smtp-Source: AGHT+IFXMsDRz2Nsbvls4m4GU4NwDU8GRKwrZCw25439mt44I4tso2mYaDKQBQ0Jt8+s5L9AxEd+SA==
X-Received: by 2002:a5d:4bd0:0:b0:33d:7e9e:4eb with SMTP id l16-20020a5d4bd0000000b0033d7e9e04ebmr10505403wrt.12.1709728892422;
        Wed, 06 Mar 2024 04:41:32 -0800 (PST)
Received: from [192.168.144.139] ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id e18-20020adfef12000000b0033cf5094fcesm17468158wro.36.2024.03.06.04.41.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:41:31 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------bBTyETX0sjN49EsgrNRlQOV5"
Message-ID: <5f06f07b-fd27-4c84-b6e9-4d28123975ef@gmail.com>
Date: Wed, 6 Mar 2024 12:41:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH v2] shadow: backport patch to fix
 CVE-2023-29383
To: openembedded-core@lists.openembedded.org
References: <29120.1707998122174808963@lists.openembedded.org>
 <29581.1708924459856405185@lists.openembedded.org>
 <17BA048F79699A0A.32420@lists.openembedded.org>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <17BA048F79699A0A.32420@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196673

This is a multi-part message in MIME format.
--------------bBTyETX0sjN49EsgrNRlQOV5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


The error message is caused because the 
0001-Disable-use-of-syslog-for-sysroot.patch applied to the native 
recipe disables syslog support and the native tool does not recognize 
SYSLOG_SU_ENAB.

On 3/6/2024 12:13 AM, Fabio Berton via lists.openembedded.org wrote:
>
> Hi,
>
> I checked on kirkstone using OE-Core with DISTRO="nodistro" and when 
> running bitbake useradd-example I can see this:
>
> configuration error - unknown item 'SYSLOG_SU_ENAB' (notify administrator)
> configuration error - unknown item 'SYSLOG_SG_ENAB' (notify administrator)
>
> in the log.do_prepare_recipe_sysroot.
>
> The same happens without CVE-2023-29383.patch and 
> 0001-Overhaul-valid_field.patch patches. I didn't understand why the 
> SYSLOG_SU_ENAB is not supported.
>
> What is the correct approach here, remove SYSLOG_SU_ENAB and 
> SYSLOG_SG_ENAB from login.defs_shadow-sysroot?
>
> To use the useradd-example.bb was needed to add this change 
> https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patch/104757004
>
> Thanks
>
> On 2/26/2024 5:14 AM, Pawan Badganchi wrote:
>> Hi,
>>
>> Could please help here?
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196655):https://lists.openembedded.org/g/openembedded-core/message/196655
> Mute This Topic:https://lists.openembedded.org/mt/98361235/6083838
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [fbberton@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------bBTyETX0sjN49EsgrNRlQOV5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><font face="monospace">Hi,</font></p>
    <p><font face="monospace"><br>
      </font></p>
    <p><font face="monospace">The error message is caused because the
        0001-Disable-use-of-syslog-for-sysroot.patch applied to the
        native recipe disables syslog support and the native tool does
        not recognize SYSLOG_SU_ENAB.</font></p>
    <div class="moz-cite-prefix">On 3/6/2024 12:13 AM, Fabio Berton via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:17BA048F79699A0A.32420@lists.openembedded.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><font face="monospace">Hi,</font></p>
      <p><font face="monospace">I checked on kirkstone using OE-Core
          with DISTRO="nodistro" and when running bitbake
          useradd-example I can see this:</font></p>
      <p><font face="monospace">configuration error - unknown item
          'SYSLOG_SU_ENAB' (notify administrator)<br>
          configuration error - unknown item 'SYSLOG_SG_ENAB' (notify
          administrator)</font></p>
      <p><font face="monospace">in the log.do_prepare_recipe_sysroot.</font></p>
      <p><font face="monospace">The same happens without
          CVE-2023-29383.patch and 0001-Overhaul-valid_field.patch
          patches. I didn't understand why the </font><font
          face="monospace">SYSLOG_SU_ENAB is not supported.</font></p>
      <p><font face="monospace">What is the correct approach here,
          remove </font><font face="monospace">SYSLOG_SU_ENAB and </font><font
          face="monospace">SYSLOG_SG_ENAB from
          login.defs_shadow-sysroot?</font></p>
      <p><font face="monospace">To use the </font><font
          face="monospace">useradd-example.bb was needed to add this
          change
          <a class="moz-txt-link-freetext"
href="https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patch/104757004"
            moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patch/104757004</a><br>
        </font></p>
      <p><font face="monospace">Thanks<br>
        </font></p>
      <div class="moz-cite-prefix">On 2/26/2024 5:14 AM, Pawan Badganchi
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:29581.1708924459856405185@lists.openembedded.org">
        <meta http-equiv="content-type"
          content="text/html; charset=UTF-8">
        Hi,<br>
        <br>
        Could please help here? <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
      </blockquote>
      <lt-container></lt-container>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#196655): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/196655">https://lists.openembedded.org/g/openembedded-core/message/196655</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/98361235/6083838">https://lists.openembedded.org/mt/98361235/6083838</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:fbberton@gmail.com">fbberton@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------bBTyETX0sjN49EsgrNRlQOV5--

