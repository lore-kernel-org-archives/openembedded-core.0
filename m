Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.48138.1585570029919438094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 05:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Gd8N6ZK9;
 spf=pass (domain: burtonini.com, ip: 209.85.215.196, mailfrom: ross@burtonini.com)
Received: by mail-pg1-f196.google.com with SMTP id 142so8547308pgf.11
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 05:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9F2uIV1UW1qupKcRWe67byx3tOL2OYcRA4x+pfagxME=;
        b=Gd8N6ZK98xV8116WaC+Xz2q5YYuzcSTwNf3MDzOOaKYU5sVb6p24SWTUcgr3DjrbRg
         +FSBGM8Z/XawEGE0gLbu7A2zs/hN/QlZPZHvibqM8K9WHkUQ4qmnXQtR2O2jbnRNYe1r
         8L7AX2L5vya3lNgjqjztJzI0WHXs+CJXq5PdpNAwfBx7alRNbJkQc+oOGIlbDdLnw2j8
         r80HlpvFow1s/KIOvZ2Kh7XuguCOL41GuYibdayQvYwWNBV4aqdTTaSWD6cLY0oY84K2
         Xqf81Vuhcm+bd4HYokEcBduMeVyfoG2VUVsZaj2gCH03VolLrg9hLPnVWoR9CuBL81WI
         T41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9F2uIV1UW1qupKcRWe67byx3tOL2OYcRA4x+pfagxME=;
        b=sO+DanatxjFgKNP2wc5q7NHhuAx2YXrV6NzDF8w3gCb78xyxxuZ5/ajSdYeum519Iw
         x+J4tuiQYw9sPsBpARMb7EM0cgm4Yn3sqEEG0kOwXcHpuE1wAndGHWynRqpFPF64j994
         Lb9xDjtlMfVlhtbwDL/2NQTIaNBdFHxaQUJ0JLbzBPc4BFmlU7U7KtaD4CBdc05RpEhL
         EhF5Fg+yZkMJ+O1Vplg9GfCeFicklX+Vj0JBRK//yPXkNyp3g+r2hiQV6QGuwTluwVNU
         XAK7ld3oCzVv0BX8pqsbeECi6UVO81IYr7wnIYqcPHDk6OWD2EScwtMCsbBc3DxoGSS4
         Ok/A==
X-Gm-Message-State: ANhLgQ0mwuUDqYqB7aUe4arruk8c+k+vOiSAVS2TuHM9/QF++wmH9TZ4
	qMXNzL0ZsCO8wx4d6ZfEOAVv1yFlfSbYFQ==
X-Google-Smtp-Source: ADFU+vulvBANIrjJw/8hKcrhD902BMVTMXw5/yLw7y2vUk3MGfwHV/wxgLtlSVC01uTlwVj5I0oiAQ==
X-Received: by 2002:a63:4f64:: with SMTP id p36mr12530864pgl.330.1585570028885;
        Mon, 30 Mar 2020 05:07:08 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from ntmurphy-mobl.ger.corp.intel.com ([134.134.137.79])
        by smtp.gmail.com with ESMTPSA id b9sm9560012pgi.75.2020.03.30.05.07.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 05:07:08 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
To: openembedded-core@lists.openembedded.org
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
 <CAP9ODKr3EFtcpu3cxvr4BSw9LkoM+qL-2idSDiMLzu-DGpAbVA@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Message-ID: <11d0b8b3-8ff3-1022-1f1a-6547742ba9ce@burtonini.com>
Date: Mon, 30 Mar 2020 13:07:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr3EFtcpu3cxvr4BSw9LkoM+qL-2idSDiMLzu-DGpAbVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 25/03/2020 21:58, Otavio Salvador wrote:
> On Wed, Mar 25, 2020 at 3:15 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>> Trying to build mesa-gl without X11 enabled, results in numerous errors
>> about being incorrectly configured, such as:
>>
>>    ERROR: Problem encountered: building dri drivers require at least one windowing system or classic osmesa
>>
>> After consulting with the author of this recipe, it was clear that it
>> was only intended for the X11 use-case, so requring X11 should avoid the
>> error message above.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> 
> This is wrong. We ought to add osmesa as fallback and not hard-require X11

But does anyone actually use this combination, or are we talking about 
ways to make it work in theory?

At the end of the day, OpenGL (not EGL, not GLES) on Linux *is* GLX and 
the point of this recipe was to be a software-backed GL stack for boards 
that only supports GLES in hardware.

Ross
