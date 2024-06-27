Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8341BC3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:18:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.3255.1719476319609242390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 01:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YEZbi/D8;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57d457357easo1322116a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1719476318; x=1720081118; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW+IzYhPawRSqQc+LrabC4z78kyXycAGxUt+mTwTjy8=;
        b=YEZbi/D8sc2MbjBny8v9W2s3x3FvSAAE1O1HvInSfM19p3qAIlYcRFEIjGZBl9iRf5
         WUMLizvEIOle8Eib6xo1bxizNm13qdZgUcB0VWamwt/XwIG2YDacU/eD9oM4e0ZxzsSV
         uQv8tXWwWuVcMFfRnJ0ioA0G/Ohj3kKWeZglw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719476318; x=1720081118;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VW+IzYhPawRSqQc+LrabC4z78kyXycAGxUt+mTwTjy8=;
        b=GWcC2jVBbBE5epRhPtxv08yxceeu75k29nQUVmkqRvZR9NEdcHEWS62rPlJCP/sUJ+
         MfO911ofoiJVdrNaAnzZtxuqtjVN6mk1rzb0PFNMT/pH2wO20ZtSNxCdf5Yim3Uzji4x
         Dl0HItV+vhpyx2G3rSVjJEHyCgsExL7REsDzC28PGDF4pioV8zsMpxDR9HacmPTWQ4zN
         LWt9hkpjBUKs3NACLn8yG2HWAiF0vcfZmIttY5usGMc4LBfQOqTWG/YU7FmEUhaLw8vc
         /3n0XY3FNSnFVpxlmjm+7wbq6QO9djDZIrYPsIVHxnE5M+k6MeHyMyRzyslMVIIE2Iw1
         FeFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHjSYoTy/4ECv+IJUvOjHFDAQJouRKAUBh4TZ7bYHA+0KznxJV+aCwhqOPwA1EGJf3uHjavTVZ3yOiU6Y/t922bsOrwwYKGVptd23o1Rx02bFbuD8hwOk/
X-Gm-Message-State: AOJu0YxOUZ0E5fzIvzUFIwtb4BT+u/R5tgcg1EgFMw/Y8LttN9FiSXNm
	p0tuP+kYGQh+kHwQo1Da83+7rmzaFtdw9UU90/50czjSGMWnN4asej3calCu2fE=
X-Google-Smtp-Source: AGHT+IEmmHNeuuWKttWe98NH++rTs9uvO3aofyWD7VTDDoGaYn1oSlzJC6IwQmeK9+8fTMQp4YdvRA==
X-Received: by 2002:a50:d59c:0:b0:57d:1696:fd16 with SMTP id 4fb4d7f45d1cf-57d4bd569afmr9057656a12.2.1719476317922;
        Thu, 27 Jun 2024 01:18:37 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d127eb9asm550852a12.22.2024.06.27.01.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 01:18:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------mAjD9q53GyC2wQViX4SJsoL4"
Message-ID: <4d1b1638-2a15-471f-a799-3f91c1535609@konsulko.com>
Date: Thu, 27 Jun 2024 11:18:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot.inc: WORKDIR -> UNPACKDIR transition
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
References: <20240623213254.3215897-1-leon.anavi@konsulko.com>
 <88f54166e39db5b6035f21bfad5f08f7a1008007.camel@linuxfoundation.org>
 <c38d4947-f02b-4e4a-982a-131a27ed0941@cherry.de>
 <925ec48934b53e9f53d6998fe730078c6e5de365.camel@linuxfoundation.org>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <925ec48934b53e9f53d6998fe730078c6e5de365.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201195

This is a multi-part message in MIME format.
--------------mAjD9q53GyC2wQViX4SJsoL4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard, Quentin,

On 26.06.24 г. 17:09 ч., Richard Purdie wrote:
> On Wed, 2024-06-26 at 15:34 +0200, Quentin Schulz wrote:
>> Hi Richard,
>>
>> On 6/26/24 3:20 PM, Richard Purdie via lists.openembedded.org wrote:
>>> On Mon, 2024-06-24 at 00:32 +0300, Leon Anavi via lists.openembedded.org wrote:
>>>> Replace references of WORKDIR with UNPACKDIR for U-Boot script
>>>> and variable UBOOT_ENV_BINARY, for example for boot.scr.
>>>>
>>>> Signed-off-by: Leon Anavi<leon.anavi@konsulko.com>
>>>> ---
>>>>    meta/recipes-bsp/u-boot/u-boot.inc | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
>>>> index 45d700fbdd..9a91a0e3d8 100644
>>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>>>> @@ -92,7 +92,7 @@ do_compile () {
>>>>    
>>>>        if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
>>>>        then
>>>> -        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_ENV_BINARY}
>>>> +        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${UNPACKDIR}/${UBOOT_ENV_BINARY}
>>>>        fi
>>>>    }
>>>
>>> If that command is writing a file, the written file should remain in
>>> WORKDIR, not UNPACKDIR. I suspect the SRC should probably therefore be
>>> changed but not the BINARY?
>> WORKDIR still isn't cleaned between builds of a recipe I assume? While
>> migrating to UNPACKDIR gets rid of patches that were once in SRC_URI but
>> aren't anymore (or other files for that matter), using WORKDIR as a
>> temporary directory between tasks is going to be an issue depending on
>> how the other tasks are going to behave. If the logic using the file is
>> the same as the logic for creating the file then it shouldn't be an
>> issue. But if the logic using the file is just checking whether the file
>> exists, then using WORKDIR is an issue since it won't be cleaned between
>> builds of the same recipe.
> Correct.
>
>> Maybe we should go for ${B} instead?
> ${B} would probably be an improvement, yes.

Thank you for the valuable feedback. Following your suggestions I 
modified the patch to use B for UBOOT_ENV_BINARY. I sent v2 of the patch 
a few minutes ago. Best regards, Leon

>
> Cheers,
>
> Richard
>
>
--------------mAjD9q53GyC2wQViX4SJsoL4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Richard, <span style="white-space: pre-wrap">Quentin,
</span><span style="white-space: pre-wrap">
</span></p>
    <div class="moz-cite-prefix">On 26.06.24 г. 17:09 ч., Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:925ec48934b53e9f53d6998fe730078c6e5de365.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Wed, 2024-06-26 at 15:34 +0200, Quentin Schulz wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Richard,

On 6/26/24 3:20 PM, Richard Purdie via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, 2024-06-24 at 00:32 +0300, Leon Anavi via lists.openembedded.org wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Replace references of WORKDIR with UNPACKDIR for U-Boot script
and variable UBOOT_ENV_BINARY, for example for boot.scr.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
---
  meta/recipes-bsp/u-boot/u-boot.inc | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 45d700fbdd..9a91a0e3d8 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -92,7 +92,7 @@ do_compile () {
  
      if [ -n "${UBOOT_ENV}" ] &amp;&amp; [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
      then
-        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_ENV_BINARY}
+        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${UNPACKDIR}/${UBOOT_ENV_BINARY}
      fi
  }
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">

If that command is writing a file, the written file should remain in
WORKDIR, not UNPACKDIR. I suspect the SRC should probably therefore be
changed but not the BINARY?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
WORKDIR still isn't cleaned between builds of a recipe I assume? While 
migrating to UNPACKDIR gets rid of patches that were once in SRC_URI but 
aren't anymore (or other files for that matter), using WORKDIR as a 
temporary directory between tasks is going to be an issue depending on 
how the other tasks are going to behave. If the logic using the file is 
the same as the logic for creating the file then it shouldn't be an 
issue. But if the logic using the file is just checking whether the file 
exists, then using WORKDIR is an issue since it won't be cleaned between 
builds of the same recipe.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Correct.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Maybe we should go for ${B} instead?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
${B} would probably be an improvement, yes.</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">
Thank you for the valuable feedback. Following your suggestions I modified the patch to use </span><span
      style="white-space: pre-wrap">B for </span><span
      style="white-space: pre-wrap">UBOOT_ENV_BINARY. I sent v2 of the patch a few minutes ago.

Best regards, Leon

</span></p>
    <blockquote type="cite"
cite="mid:925ec48934b53e9f53d6998fe730078c6e5de365.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard


</pre>
    </blockquote>
  </body>
</html>

--------------mAjD9q53GyC2wQViX4SJsoL4--

