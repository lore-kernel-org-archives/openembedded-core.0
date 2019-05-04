Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5083E7DBB8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 17:05:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w24so4244685plp.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 10:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3B0b/qkFQVnAxHvL7mc9QHDyeVHKRFbw9J63jCuCPIA=;
	b=I7X2KhHkrZy9SEmfRYPJ2FOuVtN5OUaDbuBf/9C3t0T3DJxNfzHHCWK0B72Qhb1g8r
	05+S/tUP7NHnjPIbSYxFJQriAhfr33c8sjyLmbByeP8163urwmLZ3tVD2PDmrmODbvMH
	wesv3CBccdDKYVdmizMIrf4iHVmwDMYhCKlcUbiv94L5gGOWMSacbAZAA5NJQ+/ZVxIK
	dE6O8pPtUvj3Ghy4c0jth0jVNZopRt2ycA3px3/Lp3rxgzpVanXe8+EbMQMqa7ak3ajb
	2PU0JBWjU9ubDKpWUrh94ddPG+gePd6aVtE2VMZRqmwXEpRHFm8x78y3NphHD1WItK/k
	v51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=3B0b/qkFQVnAxHvL7mc9QHDyeVHKRFbw9J63jCuCPIA=;
	b=eQCw7bRy9djIn9ZERPS+UwGUdfWuRsgatq0rr4L2CdxyQE50Dq+ypRGtFitHhxhF62
	alrApyXpUTri2s4JXZyQwBMDzuYv9S0pT2fwL9fCrLVLLZyL4QgjovrxG1U2oqNB+UQ/
	mpTuKQ8uWEEBb01zwoANlIEF61Zm5McHE48rrn5LN39bwxJ5wtHdRJe3ZPe6bh3VsLMF
	Gx7oPOEFbDfonAhT2R0+qDHBzA5N9ptHSRreGJDR24cY7tBCQo0f5JMvdW9k0ojGXo1f
	BqITpJXECuH4B4YnroaxmwXtgxBpjHI+9Ff45UvuvSHet6NlNs0Mp4X+Lma0X8+wO1ge
	jIhw==
X-Gm-Message-State: APjAAAWcYMSky4KWCA/5j7/9MdkU+XRBZxM9bUQi8siXQxk1Jbl9Vgd6
	58kasfFoHCyWykCx2mXyUXUDUAs2
X-Google-Smtp-Source: APXvYqyINAen17Mf5Sn5/r2GXiDj4nj3CulCWfwTwWOmvZQ856BkWg0l0Qg257Px8OlTmmIeDLLQcQ==
X-Received: by 2002:a17:902:28e4:: with SMTP id
	f91mr19692537plb.321.1556989513155; 
	Sat, 04 May 2019 10:05:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:e5bb:fdcb:954:875c?
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	o9sm10547305pgh.68.2019.05.04.10.05.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 10:05:12 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1556983501.git.akuster808@gmail.com>
	<6b6aa062a72aa2d50a8318dc03f8d91a32c21e94.1556983501.git.akuster808@gmail.com>
	<20190504160956.GE11633@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e26f8733-d1f8-4ea8-03b1-900b12f69f73@gmail.com>
Date: Sat, 4 May 2019 10:05:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504160956.GE11633@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 40/43] waffle: supprt build waffle without x11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 May 2019 17:05:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/4/19 9:09 AM, Adrian Bunk wrote:
> On Sat, May 04, 2019 at 08:27:16AM -0700, Armin Kuster wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> respect DISTRO_FEATURES to make waffle support different platform,
>> gbm platform is supported by default.
>>
>> [YOCTO #6077]
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-graphics/waffle/waffle_1.5.2.bb | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
>> index 43c3edc..31572f2 100644
>> --- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
>> +++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
>> @@ -15,10 +15,9 @@ inherit cmake distro_features_check lib_package
>>  
>>  # This should be overridden per-machine to reflect the capabilities of the GL
>>  # stack.
>> -PACKAGECONFIG ??= "glx"
>> -
>> -# libx11 requires x11 in DISTRO_FEATURES.
>> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
>> +                   gbm"
>> ...
> Changing the default PACKAGECONFIG does not look appropriate for
> a stable branch.

Go look at the bug for more details.

- armin
>
> cu
> Adrian
>


