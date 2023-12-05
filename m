Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D12C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 15:02:51 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.101610.1701788569042842398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 07:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=TuHK1HOV;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-423ed5fb48eso44307231cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 07:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788568; x=1702393368; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipq6PjmSdkbvufZE/UUZ3dJqHwu91DzBpugarkCmzVU=;
        b=TuHK1HOVxEtgB4X4Ah2HKnnRnqNpWC0oFS1AF03F03GQiEyAcIQEmGnbNYBtjMQDXe
         ZliVM10U12Pr81h646IcYL1eHmfj308ceMUUAMmINZOAH8hL1RbUMY8TP5+WBRVJjlHV
         PdPrmL1X4JQFAXoDk9jLhoxfDdHvvJSq75AZI00d0elKD+dZXxSvOmrpI6/VCVZpPoS0
         djo26gX1Uc//u10wfCxc7S/wFWyqLf3QONSojsbC4VM3hJiBg/9plNYz2toktCKvbmX5
         wgbfMYzMxlL1+dipBc6eyWoMAyRoH4Y1FFxJYsE0GwX5QwFnQ4mwZzN8HMtIl97DtwbL
         TpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788568; x=1702393368;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipq6PjmSdkbvufZE/UUZ3dJqHwu91DzBpugarkCmzVU=;
        b=Pn41zWv2xWLKrp7Rsjpu/OhxBn1A+6AdlXkd6TDBP7z1r0drE0tQsSFFBNghz+b0Vi
         Ael+MJfRTENqI24K8qDqnWwCp5EkJRPZ6q+aZ7yhQZctFbf9Hqcm6x7Hwf6e7TwlFc2g
         gHr7HqUjGTSXNKgQCi6qp8jlXWXNOukX5XMq4UyYAU2Z9fvD4Rp+AkQPjrEduWCZL98L
         2N3pk+L3wTPhZ/9ak6ZJOAgejP0gjbGF4Zgn+p603g7JVNtHbUmbjB0XkBHM8JdY7Ni0
         L+jdQ6Cis+bxPXwygay82zsWQVEBuomODJ+jdf3NtlC+f3kCYAEWJgG5m8twq3c3MGkU
         +VLg==
X-Gm-Message-State: AOJu0YzDN5etbb3WC6ZnAt8g+5Ogji3l22+DuJ2MqgzlbBQcZYfm36yT
	kM4Rls/5y3hcsyKk5aUoJ6uixQ==
X-Google-Smtp-Source: AGHT+IGBc7PS1cRtsjcYgbUREqxcQjKKHAx+RAyY1FoD3yxIj13MQ8xFQRAdO8ky/fwk10e7v0b5Tw==
X-Received: by 2002:ac8:5f82:0:b0:425:4043:762b with SMTP id j2-20020ac85f82000000b004254043762bmr1705341qta.83.1701788567692;
        Tue, 05 Dec 2023 07:02:47 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id b18-20020ac86bd2000000b0042388bce404sm5186541qtt.57.2023.12.05.07.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 07:02:47 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------FXbqr30QBV7Jovkn0mPUL5zT"
Message-ID: <66403875-9e89-4fb1-a5f8-7235e506a840@baylibre.com>
Date: Tue, 5 Dec 2023 10:02:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH] tiff: Backport fixes for
 CVE-2023-6277
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <0101018c30874843-c31eae1e-0aa2-41f0-832a-7c03e92ab619-000000@us-west-2.amazonses.com>
 <CANNYZj_ffhYrDfG+rcjG=UbokBa-pRw+zc4gxqK1Jv5Nwnhhkw@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_ffhYrDfG+rcjG=UbokBa-pRw+zc4gxqK1Jv5Nwnhhkw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 15:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191841

This is a multi-part message in MIME format.
--------------FXbqr30QBV7Jovkn0mPUL5zT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023-12-04 04:57, Alexander Kanavin wrote:
> Is this a different patchtest issue to the one that was fixed?

Looks like there are still excessive line length issues with the 
patchtest report that I need to fix.

This is what it reported:

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag. Sign off the added patch file (meta/recipes-multimedia/libtiff/tiff/545.patch) (test_patch.TestPatch.test_signed_off_by_presence)
FAIL: test Upstream-Status presence: Added patch file is missing Upstream-Status: <Valid status> in the commit message (test_patch.TestPatch.test_upstream_status_presence_format)
FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

>
> Alex
>
> On Sun, 3 Dec 2023 at 17:33, Patchtest
> <patchtest@automation.yoctoproject.org>  wrote:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Tests failed for the patch, but the results log could not be processed due to excessive result line length.
>> ---
>>
>> Please address the issues identified and
>> submit a new revision of the patch, or alternatively, reply to this
>> email with an explanation of why the patch should be accepted. If you
>> believe these results are due to an error in patchtest, please submit a
>> bug athttps://bugzilla.yoctoproject.org/  (use the 'Patchtest' category
>> under 'Yocto Project Subprojects'). For more information on specific
>> failures, see:https://wiki.yoctoproject.org/wiki/Patchtest. Thank
>> you!
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#191718):https://lists.openembedded.org/g/openembedded-core/message/191718
>> Mute This Topic:https://lists.openembedded.org/mt/102954001/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------FXbqr30QBV7Jovkn0mPUL5zT
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
    <div class="moz-cite-prefix">On 2023-12-04 04:57, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_ffhYrDfG+rcjG=UbokBa-pRw+zc4gxqK1Jv5Nwnhhkw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Is this a different patchtest issue to the one that was fixed?</pre>
    </blockquote>
    <p>Looks like there are still excessive line length issues with the
      patchtest report that I need to fix.</p>
    <p>This is what it reported:</p>
    <pre>FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag. Sign off the added patch file (meta/recipes-multimedia/libtiff/tiff/545.patch) (test_patch.TestPatch.test_signed_off_by_presence)
FAIL: test Upstream-Status presence: Added patch file is missing Upstream-Status: &lt;Valid status&gt; in the commit message (test_patch.TestPatch.test_upstream_status_presence_format)
FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)</pre>
    <p></p>
    <blockquote type="cite"
cite="mid:CANNYZj_ffhYrDfG+rcjG=UbokBa-pRw+zc4gxqK1Jv5Nwnhhkw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex

On Sun, 3 Dec 2023 at 17:33, Patchtest
<a class="moz-txt-link-rfc2396E" href="mailto:patchtest@automation.yoctoproject.org">&lt;patchtest@automation.yoctoproject.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Tests failed for the patch, but the results log could not be processed due to excessive result line length.
---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/">https://bugzilla.yoctoproject.org/</a> (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: <a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Patchtest">https://wiki.yoctoproject.org/wiki/Patchtest</a>. Thank
you!

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#191718): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/191718">https://lists.openembedded.org/g/openembedded-core/message/191718</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102954001/1686489">https://lists.openembedded.org/mt/102954001/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------FXbqr30QBV7Jovkn0mPUL5zT--

