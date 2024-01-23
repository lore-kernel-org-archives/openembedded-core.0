Return-Path: <antoine.coutant@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B4EC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:34:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.13969.1706020454273490901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 06:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ZynznBVL;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: antoine.coutant@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40eb99a72dcso7549925e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706020452; x=1706625252; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQrdL/hrTBqmSjhZsMy4I2+sEvbFsbaQIc5k38UMyJw=;
        b=ZynznBVLupeP7xra06gc4y//fka7tF28j5eMJIRtn/sRGf1ocCTxiEmaQWaAvDTIdk
         pLZfat/O9rpwMItIVm3Tbgh+Z9xVlA12TsuXgesBPVxfaEOSYX6uZCvF8ksDZ2Iekh6i
         RA8AZ6K1y59wivDJXKColLqczLtT0tpsi1nDun49iJddqgiZVka8lIG+DUeZY93I4Ox7
         T3JsaZ4ZnIyOEC/Rrz70jWhfAGsUvcWg80uX3ujN3RFIhs9LZfdl6CK8gKWRJYrXVgu+
         8LDsD3+0iLKFLL8aL2ZzWaOmEfc2BUM1HAlIDhbXcGPwBIU2iC3YloeCTDoZbS8yMX4z
         943g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706020452; x=1706625252;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQrdL/hrTBqmSjhZsMy4I2+sEvbFsbaQIc5k38UMyJw=;
        b=H6Ihfnn2RsaWXTnNCQkVI1KHBZ5+XkVVwZne6u5aWIXw4yc5mmBQy5YyXkCKppNUBu
         ilcuRM1IuINhbvpCnX8D/bnLbXcIePXtdozm6soSWVrGjhb4dPW0MejPxf1bt0v3HeW0
         R+9EoL5gLQupnmNnIaNUECek5pWGj+/VVVVEwRrTRrVuqKMWi5dhxLlFXm8ApuDj2ka7
         E99KsWXJ8gAPsST/F4T64X/a2Y+YRLv9tgXMVYwcC5Nqp9kGWV8mFmP78TZduvhspVbO
         AG5YoLp1mFtbXEdi2koeAyaZO8ZHdVI8P1ijzuYUg4jv3ShmLgJ3axyCRSBD6CNmEVnd
         Rv7Q==
X-Gm-Message-State: AOJu0Yz0lMa+EC41nb2kUeBMyVbrvfJ/Y4ZgXfuzkgcHepvlsadVuvSR
	fsMQs0dJKiFBYIFb3OpzxXhgDu/drlTWrEEM9hREZHl+7ndVWJbNBkXKf1wCfWE=
X-Google-Smtp-Source: AGHT+IHfZYF5rrh5uuMB8H0lDpL69cmKjDe9LLiWSeOut9GHFtFQAn8FXju2HDIGp6nVGzWJPaQU2A==
X-Received: by 2002:a05:600c:5185:b0:40e:5333:2024 with SMTP id fa5-20020a05600c518500b0040e53332024mr221935wmb.53.1706020452331;
        Tue, 23 Jan 2024 06:34:12 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr. [90.12.67.126])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b0040e56830a35sm42678435wmo.18.2024.01.23.06.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 06:34:12 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------AX6i3anhue7IZr9fv1l0bkW9"
Message-ID: <601a63f0-3b5f-45fe-888e-03608ba74273@smile.fr>
Date: Tue, 23 Jan 2024 15:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Dmitry Baryshkov <dbaryshkov@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
 <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 14:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194242

This is a multi-part message in MIME format.
--------------AX6i3anhue7IZr9fv1l0bkW9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30/12/2023 22:02, Richard Purdie wrote:
> On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
>> From: Zoltán Böszörményi<zboszor@gmail.com>
>>
>> Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
>> (newer one). Extend the "opencl" package config to include both
>> implementations into the libopencl-mesa (-dev) packages. As the Clover
>> implementation is in maintenance mode and is expected to be removed at
>> some point, it doesn't make sense to split the packages or to provide
>> two config options.
>>
>> Signed-off-by: Zoltán Böszörményi<zboszor@gmail.com>
>> [DB: reworked rust class inheritance]
>> [DB: merged "rusticl" and "clover" back to "opencl"]
>> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@linaro.org>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index efbce5caade5..a192562a7935 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -48,6 +48,12 @@ PROVIDES = " \
>>   
>>   inherit meson pkgconfig python3native gettext features_check
>>   
>> +# We can not include rust conditionally, otherwise it can not be overriden by
>> +# the bbappends.  Instead always include it, but remove the dependencies by
>> +# default.
>> +inherit rust
>> +INHIBIT_DEFAULT_RUST_DEPS ="${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
>> +
> I'd really prefer not to have the rust inherit unconditionally. I have
> some ideas about how we could fix this in bitbake so we may need to
> wait for that if we can't avoid the PACKAGECONFIG issue from appends...
>
> Cheers,
>
> Richard
>
Richard, All,


Thanks for your work.


I tried to build rusticl with inherit_defer[1][2]. Inherit_defer worked 
well but I got an error message:


ERROR: mesa-native-2_23.3.2-r0 do_prepare_recipe_sysroot: The file 
/usr/bin/llvm-tblgen17.0.6 is installed by both llvm-native and 
clang-native, aborting


It seems that llvm-native and clang-native are in conflict. llvm-native 
is a dependency of mesa-native. clang-native is inherited from the 
rust-llvm recipe (this inheritance is added by rust-llvm_%.bbappend in  
meta-clang).


Here is my configuration:


Build Configuration:

BB_VERSION = "2.7.1"

BUILD_SYS = "x86_64-linux"

NATIVELSBSTRING = "universal"

TARGET_SYS = "x86_64-poky-linux"

MACHINE = "qemux86-64"

DISTRO = "poky"

DISTRO_VERSION = "4.3+snapshot-5ed5d717f122078dd908cce86a0c625c2c64f32a"

TUNE_FEATURES = "m64 core2"

TARGET_FPU = ""

meta

meta-poky

meta-yocto-bsp = "master:5ed5d717f122078dd908cce86a0c625c2c64f32a"

meta-clang = "master:beffde692f3d365678f5fdf60b473b93045d4161"


I also tried the build on the Nanbield version and I got the same message.


[1] : 
https://git.yoctoproject.org/poky/commit/?h=master-next&id=859832795040ad04d6136732e4275da443409110 
<https://git.yoctoproject.org/poky/commit/?h=master-next&id=859832795040ad04d6136732e4275da443409110>

[2] : 
https://git.yoctoproject.org/poky/commit/?h=master-next&id=7ef978a7e66d5ebd2986b890488eeb52d4e2af2e 
<https://git.yoctoproject.org/poky/commit/?h=master-next&id=7ef978a7e66d5ebd2986b890488eeb52d4e2af2e>

---

Regards,

Antoine Coutant

--------------AX6i3anhue7IZr9fv1l0bkW9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30/12/2023 22:02, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Zoltán Böszörményi <a class="moz-txt-link-rfc2396E" href="mailto:zboszor@gmail.com">&lt;zboszor@gmail.com&gt;</a>

Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
(newer one). Extend the "opencl" package config to include both
implementations into the libopencl-mesa (-dev) packages. As the Clover
implementation is in maintenance mode and is expected to be removed at
some point, it doesn't make sense to split the packages or to provide
two config options.

Signed-off-by: Zoltán Böszörményi <a class="moz-txt-link-rfc2396E" href="mailto:zboszor@gmail.com">&lt;zboszor@gmail.com&gt;</a>
[DB: reworked rust class inheritance]
[DB: merged "rusticl" and "clover" back to "opencl"]
Signed-off-by: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@linaro.org">&lt;dmitry.baryshkov@linaro.org&gt;</a>
---
 meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index efbce5caade5..a192562a7935 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -48,6 +48,12 @@ PROVIDES = " \
 
 inherit meson pkgconfig python3native gettext features_check
 
+# We can not include rust conditionally, otherwise it can not be overriden by
+# the bbappends.  Instead always include it, but remove the dependencies by
+# default.
+inherit rust
+INHIBIT_DEFAULT_RUST_DEPS = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','opencl','','1',d)}">"${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"</a>
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'd really prefer not to have the rust inherit unconditionally. I have
some ideas about how we could fix this in bitbake so we may need to
wait for that if we can't avoid the PACKAGECONFIG issue from appends...

Cheers,

Richard

</pre>
    </blockquote>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"
      id="docs-internal-guid-33723099-7fff-3551-65af-076448474a5a"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Richard, All,</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Thanks for your work. </span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">I tried to build rusticl with inherit_defer[1][2]. Inherit_defer worked well but I got an error message:</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">ERROR: mesa-native-2_23.3.2-r0 do_prepare_recipe_sysroot: The file /usr/bin/llvm-tblgen17.0.6 is installed by both llvm-native and clang-native, aborting</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">It seems that llvm-native and clang-native are in conflict. llvm-native is a dependency of mesa-native. clang-native is inherited from the rust-llvm recipe (this inheritance is added by rust-llvm_%.bbappend in  meta-clang).</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Here is my configuration:</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Build Configuration:</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">BB_VERSION       </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "2.7.1"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">BUILD_SYS        </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "x86_64-linux"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">NATIVELSBSTRING  </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "universal"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">TARGET_SYS       </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "x86_64-poky-linux"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">MACHINE          </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "qemux86-64"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">DISTRO           </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "poky"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">DISTRO_VERSION   </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "4.3+snapshot-5ed5d717f122078dd908cce86a0c625c2c64f32a"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">TUNE_FEATURES    </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "m64 core2"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">TARGET_FPU       </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= ""</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">meta            </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"> </span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">meta-poky       </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"> </span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">meta-yocto-bsp   </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "master:5ed5d717f122078dd908cce86a0c625c2c64f32a"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">meta-clang       </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">= "master:beffde692f3d365678f5fdf60b473b93045d4161"</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">I also tried the build on the Nanbield version and I got the same message.</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">[1] : </span><a
href="https://git.yoctoproject.org/poky/commit/?h=master-next&amp;id=859832795040ad04d6136732e4275da443409110"
        style="text-decoration:none;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#1155cc;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">https://git.yoctoproject.org/poky/commit/?h=master-next&amp;id=859832795040ad04d6136732e4275da443409110</span></a></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">[2] : </span><a
href="https://git.yoctoproject.org/poky/commit/?h=master-next&amp;id=7ef978a7e66d5ebd2986b890488eeb52d4e2af2e"
        style="text-decoration:none;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#1155cc;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">https://git.yoctoproject.org/poky/commit/?h=master-next&amp;id=7ef978a7e66d5ebd2986b890488eeb52d4e2af2e</span></a></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">---</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Regards,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Antoine Coutant</span></p>
  </body>
</html>

--------------AX6i3anhue7IZr9fv1l0bkW9--

