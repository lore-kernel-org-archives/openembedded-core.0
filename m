Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A235C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 07:56:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.11309.1713945365048321357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 00:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QC4lQIpN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b0bc4ce39so2130825e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713945363; x=1714550163; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2UbPmmxifNBKa8UXH8+P2W72oJBPKW2tP2YdQEG78E=;
        b=QC4lQIpNUAr40BbGWVuDiVTCAM51OLrnVtjfPr9ds6dQIegYJ1RsHEhpqThp9jx1MA
         qb+tShBYQjV/sCvDkmaZJywnv6Ukbq9hrodxDLru/3VzgpUQrYALLqxnADmdgsUXTFdu
         4QdXVP3O+Pyvk8Nh8BmjVhFUB7p1qN+7r9GOSgyQ+DR6kSd9ECItQkBKl9ju2F5Di3DB
         4mfha8/iSP1SQquga7qw56DN0njVMC5z4ZQXBi20pemhbgrrKEN2YrYMNagx+Qmy+kKT
         jhRtKRXniEW9IWe2Crtq7YTnlVD+YvqhDAo3HtB/0b/oOHp0pOB6dVDw7oE2KNAbeNuG
         wsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713945363; x=1714550163;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2UbPmmxifNBKa8UXH8+P2W72oJBPKW2tP2YdQEG78E=;
        b=g83kpW+1ZmPDbwq1/FXT0QDPRwd4R/jKMT9NFHCb9mQf/4bc0hsIdah5JAcALsr0nN
         G9Z/bNSKIzTvvi58Cvp/3SoF+yHrIO7Xb/evf/OtV4IquXa/FqJx32PWXKyKOWGi+Na/
         eo66dIUoFkv5Dd3uLU4rNF+utmaaFeSDLtTnzdjOaRnl2tDv/wM1E3Lh/7Kv2AAa94x6
         VatIeV//3C+o9grTahdl6+GoSv1FTDyw90lMZF00jtrPlRbX7H/iQtU7TQyHPUzcU+u0
         +7MtbCliQkRfV6/KfLa0cYLApptreSayBw3RromgVhgzXsZ/iHJItPA0dFeIJRqvWURK
         ka2g==
X-Gm-Message-State: AOJu0Yy8oXlmwGBB/qFGTvf+IJ1dMrYDBf9OAlpw81IfRHJd4XQTtszV
	zpU67UFQMXHpQgneAATNiWi9wU7cyIIBk0oBtGKO0XXdLaJ20hOB
X-Google-Smtp-Source: AGHT+IEfoYEQkMhfmRjfp8yIcxU6GPMkVguwlAhg4ETRbI5g1NlKxtD+2SL777ILqyoxyaN09sHE3Q==
X-Received: by 2002:a05:600c:3c95:b0:41a:5521:d82c with SMTP id bg21-20020a05600c3c9500b0041a5521d82cmr1677936wmb.29.1713945363049;
        Wed, 24 Apr 2024 00:56:03 -0700 (PDT)
Received: from [10.190.5.38] ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0041a0f3d996bsm13159670wmq.47.2024.04.24.00.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 00:56:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uR09PClzhLUKsON00thcg1w3"
Message-ID: <f553ffbc-16a7-4060-9b43-2625852ac55d@gmail.com>
Date: Wed, 24 Apr 2024 08:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Set the CMake BUILD_TESTING option to OFF as the
 default setting
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <e574884f-d13f-4e57-b55f-4ffdd9fe3103@gmail.com>
 <CANNYZj8De8ufESxPOFGodeaq8Lvu4-S-46NMNOzNVYuZUU+D_g@mail.gmail.com>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <CANNYZj8De8ufESxPOFGodeaq8Lvu4-S-46NMNOzNVYuZUU+D_g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 07:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198640

This is a multi-part message in MIME format.
--------------uR09PClzhLUKsON00thcg1w3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

What should I test to measure build time, all recipes that use cmake 
from OE-Core and meta-openembedded? Is there a way to build all recipes, 
or should I find all recipes that use cmake and run bitbake <all-recipes>?

Regards,

Fabio Berton

On 4/23/2024 2:01 PM, Alexander Kanavin wrote:
> I'm not sure I like the idea. This is going to break ptests or other
> usage of CTest in cmake-based recipes that aren't under our control.
> Building tests is also a test in itself even if you don't run them.
> I'd say unless this adds significantly to build times we should leave
> it as it is.
>
> Alex
>
> On Tue, 23 Apr 2024 at 14:31, Fabio Berton via lists.openembedded.org
> <fbberton=gmail.com@lists.openembedded.org>  wrote:
>> I've noticed that some recipes, like json-c [1], which use the cmake bbclass, are generating files that aren't being used. This is because CMake sets the BUILD_TESTING option to ON by default. According to the CMake documentation [2], when CTest is included, as json-c does here [3], the module automatically creates a BUILD_TESTING option. This option determines whether to enable testing support, and it is ON by default.
>>
>> In the json-c example, the tests used by the do_install_ptest task are always generated. Thus, ${B}/tests/ exists even when ptests are not included in DISTRO_FEATURES.
>>
>> As the behavior of CTest/CMake to build tests by default is rather surprising, we are wondering whether disabling this option by default is feasible in the OpenEmbedded context. Recipes expecting tests to be built (e.g. because of ptest support) would then turn on the flag explicitly.
>>
>> For example, adding this to cmake.bbclass:
>>
>> OECMAKE_BUILD_TESTING ??= "false"
>>
>> EXTRA_OECMAKE:append = "\\
>>      ${@bb.utils.contains('OECMAKE_BUILD_TESTING', 'false', '-DBUILD_TESTING=OFF', '', d)} \\
>> "
>>
>> and then set the OECMAKE_BUILD_TESTING in the recipe that requires BUILD_TESTING=ON
>>
>> Do you have any suggestions on which steps we should take to verify that this does not introduce any regressions?
>>
>>
>> 1 -https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/json-c/json-c_0.17.bb?h=master
>>
>> 2 -https://cmake.org/cmake/help/latest/module/CTest.html
>>
>> 3 -https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19
>>
>>
>> Regards,
>>
>> Fabio Berton
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#198621):https://lists.openembedded.org/g/openembedded-core/message/198621
>> Mute This Topic:https://lists.openembedded.org/mt/105688417/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------uR09PClzhLUKsON00thcg1w3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><font face="monospace">Hi Alex,</font></p>
    <p><font face="monospace">What should I test to measure build time,
        all recipes that use cmake from OE-Core and meta-openembedded?
        Is there a way to build all recipes, or should I find all
        recipes that use cmake and run bitbake &lt;all-recipes&gt;?</font></p>
    <pre class="moz-quote-pre" wrap="">Regards,

Fabio Berton</pre>
    <p></p>
    <div class="moz-cite-prefix">On 4/23/2024 2:01 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8De8ufESxPOFGodeaq8Lvu4-S-46NMNOzNVYuZUU+D_g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I'm not sure I like the idea. This is going to break ptests or other
usage of CTest in cmake-based recipes that aren't under our control.
Building tests is also a test in itself even if you don't run them.
I'd say unless this adds significantly to build times we should leave
it as it is.

Alex

On Tue, 23 Apr 2024 at 14:31, Fabio Berton via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:fbberton=gmail.com@lists.openembedded.org">&lt;fbberton=gmail.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I've noticed that some recipes, like json-c [1], which use the cmake bbclass, are generating files that aren't being used. This is because CMake sets the BUILD_TESTING option to ON by default. According to the CMake documentation [2], when CTest is included, as json-c does here [3], the module automatically creates a BUILD_TESTING option. This option determines whether to enable testing support, and it is ON by default.

In the json-c example, the tests used by the do_install_ptest task are always generated. Thus, ${B}/tests/ exists even when ptests are not included in DISTRO_FEATURES.

As the behavior of CTest/CMake to build tests by default is rather surprising, we are wondering whether disabling this option by default is feasible in the OpenEmbedded context. Recipes expecting tests to be built (e.g. because of ptest support) would then turn on the flag explicitly.

For example, adding this to cmake.bbclass:

OECMAKE_BUILD_TESTING ??= "false"

EXTRA_OECMAKE:append = "\\
    ${@bb.utils.contains('OECMAKE_BUILD_TESTING', 'false', '-DBUILD_TESTING=OFF', '', d)} \\
"

and then set the OECMAKE_BUILD_TESTING in the recipe that requires BUILD_TESTING=ON

Do you have any suggestions on which steps we should take to verify that this does not introduce any regressions?


1 - <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/json-c/json-c_0.17.bb?h=master">https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/json-c/json-c_0.17.bb?h=master</a>

2 - <a class="moz-txt-link-freetext" href="https://cmake.org/cmake/help/latest/module/CTest.html">https://cmake.org/cmake/help/latest/module/CTest.html</a>

3 - <a class="moz-txt-link-freetext" href="https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19">https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19</a>


Regards,

Fabio Berton


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#198621): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/198621">https://lists.openembedded.org/g/openembedded-core/message/198621</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/105688417/1686489">https://lists.openembedded.org/mt/105688417/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------uR09PClzhLUKsON00thcg1w3--

