Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AD0FA3742
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 10:40:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70484.1726224030270140895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 03:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=huwzUQGU;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374c4d4f219so1311450f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726224029; x=1726828829; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ND+LF5RSCvUf8hpu4DEB6bJY+PmTg6WBATp+M2ZUso=;
        b=huwzUQGUEUA1BgVDz6+TNdumyCla6nABBinLtaHU6lFrxQWkNVAwccc8yP18pbqNgz
         3QDtR51qOpViFAcEs9r42ejqW0BHAdFLNGxEY/Xah+hB2BTK6FCRkqIFECrgC9UUaJcg
         gVBA9WNVOX1glgcYYzRt3jQMNuMdMtL3iopucb5u3C9MOAOjM79jLwgnbda6sM5axG/y
         xMvr3PTEBPDBA+igDYV2BRLSSgseUkSqxTANNJ2kyxb75WyhNByTBMb8uJK1ZdZQHXP9
         7f9WiO9BIpiQaBY/Cwp+QWDJkobRq5wIwvoNVFvPia7lEiOsKaGrfYs4DWjVOsZgEeby
         nXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726224029; x=1726828829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ND+LF5RSCvUf8hpu4DEB6bJY+PmTg6WBATp+M2ZUso=;
        b=ufk/UZ1Oi8Cm3+pPx9Trlfu/vNCZEgBraqoW2qVUKzR+R6RNmxI5dOtAYFA3hFWl61
         /EHM1GL2A4+U0K3MBan7c0F/uSmoSpbDDQPPIyEwdhlAR+qhM1JrlQI5+49avxiYHD8C
         SVsVj2nIvuLEtPrnXHAzzjZX+PnShKOizRpNKiOAEqLoUI/i+vR0mEDUiUTdTM9s+5vm
         7Zzp61wenRxdn1iMYGAmMGdZzMVDid4e02G9nM3OGKHeEjCR2JbyFhAXN8q6EfInL5Hg
         BkIXpG6pnSgjZvqbucd0FYZneg2T+8L62WC53Nbu3TaQdJUNwUAk6L32HAmWcQygjFE2
         bIrA==
X-Gm-Message-State: AOJu0YxGTl2QJ+k2Xk/FQnPcxK8fwj694PEsxUbbjVo0BgCoCho+FEus
	BJd8oWa7QS5DJn+WF3k4FwILVV45Bt4GWm3gy8dZOV21y+j0Y3Js
X-Google-Smtp-Source: AGHT+IGiBQhuXkEAgjxqKIMN80nZ/xg50GkxSyr+i5loLJTUI802XOGsISi0TkbQsny33lyDcJSK+g==
X-Received: by 2002:a05:6000:cd1:b0:374:c847:85d with SMTP id ffacd0b85a97d-378c2d124bdmr3137285f8f.29.1726224027714;
        Fri, 13 Sep 2024 03:40:27 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm16497354f8f.50.2024.09.13.03.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 03:40:27 -0700 (PDT)
Message-ID: <686f2e31-0311-4e02-b688-9cdd95bc71c3@gmail.com>
Date: Fri, 13 Sep 2024 12:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][oe-core][PATCH] mesa: add support for rusticl
To: f_l_k@t-online.de, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240908172311.3773048-1-f_l_k@t-online.de>
 <CANNYZj_aLfFFe14-YNYfGt5T05dRb_-N7NPSk3Tx5-j09xRtrg@mail.gmail.com>
 <HSHJJS.OO3X80OW2KGA@t-online.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <HSHJJS.OO3X80OW2KGA@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 10:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204478

2024. 09. 09. 11:45 keltezéssel, Markus Volk via lists.openembedded.org írta:
> On Mon, Sep 9 2024 at 10:46:59 AM +02:00:00, Alexander Kanavin <alex.kanavin@gmail.com> 
> wrote:
>> This does need to be properly looked into, there's probably a better patch possible, or 
>> a build setting we're missing, or at least an upstream ticket to be filed. It's not a 
>> good patch when it says 'workaround' and doesn't explain the issue and the fix.
>
> Fully agree. This is ugly as hell. Just a quick and dirty hack to get things working 
> (which is always a good starting point) but by no means a solution for oe-core. Thats 
> why I marked it RFC

Don't call it a "workaround" then.
Call it "pass in recipe-sysroot include directories" because
that's what this patch does combined with the mesa.inc changes.

Though it's not complete in my testing.
I needed this patch against 24.2.2 so I could build Mesa Rusticl,
plus EXTRA_OEMESON += "-Dintel-rt=disabled" in my bbappend
because the iris driver failed to build otherwise, complaining for
every generated file from *.cl about "shader not available, consider
installing libclc" or something like that, eventually failing the build.

diff --git a/src/gallium/frontends/rusticl/meson.build 
b/src/gallium/frontends/rusticl/meson.build
index eef09d8f01e..efac4cab964 100644
--- a/src/gallium/frontends/rusticl/meson.build
+++ b/src/gallium/frontends/rusticl/meson.build
@@ -146,6 +146,7 @@ rusticl_opencl_bindings_rs = rust.bindgen(
      rusticl_bindgen_c_args,
      pre_args,
      cl_c_args,
+   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
    ],
    args : [
      rusticl_bindgen_args,
@@ -190,6 +191,7 @@ rusticl_llvm_bindings_rs = rust.bindgen(
    c_args : [
      rusticl_bindgen_c_args,
      pre_args,
+   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
    ],
    dependencies : [
      dep_clang,


>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204323): https://lists.openembedded.org/g/openembedded-core/message/204323
> Mute This Topic: https://lists.openembedded.org/mt/108340502/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


