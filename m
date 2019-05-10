Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 14C3C6C3AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 23:54:58 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b3so3513329plr.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=virqXWnJsp21EYS9P/T1JuHDCiQFUfbGxnEZXDOssRY=;
	b=UNk6C60eZBUb7vagg46wmuuVg+UO6wCmimWqJicTgiYe/L6sxJG3e9oA4K0lbkaPoD
	Iw6D8Hs5mNImERDEyd+WsUTDbRUN4XMS5bmkhRnsApFVx+JNkFoJvc4WqXbUzmoUwR+j
	qXk096PZlil+oG0EiIyuYqLz5CpdVsrojHpeDG2GoqV1zaS4BmH8Q7jYBGV1bxqzkB8Q
	+wnZjf/QQZs1AgcTfa0+RythmEoao00oFwk0vG6xw9l4JWda7QHGCy+RK/DMAxsgckwp
	Q43tFlMqlPo9fii1uceSfdHfgSEuDHZnpQiplkYBET+jjsBm8EZcMOHOv3cqXLONA5V/
	O2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=virqXWnJsp21EYS9P/T1JuHDCiQFUfbGxnEZXDOssRY=;
	b=N4ILcIf0OwCCtEuQRN8JP9KJZ+tfYGLNuxs9b0o1AZaYDUsoVUjlPhZrZnAYLAWFxK
	imAhwVK/vXHYPrmwXAzibdeiy7J7UkqpvwBVZe88d6CGwPftFRT39mKuqA+0hdVo3fsy
	SfDgmI40k1zyv+TnfciCc0t5MXgDUgRAh3cfgX63JOekTEbF2jQuUsxNnKgbkA1CCWMa
	hobXzWC2M9IepRUdGmXbdD3oSYgLxcSm5tVQdf+PLoze7RcoemFEbpbp0xXxtWs9/TbM
	hQWH5+EUHaiL1hawS/1c3Lcn67BIOTiFPJMuGOysQn9yNBWc/1AOaZE6hTQXjQMCYWGh
	9Qgw==
X-Gm-Message-State: APjAAAWR2O/aK81eJCvwkpK2Vt29IrLph6rDSmiGR5Q4IPx0ssLVWk7D
	AoKREO5Vh/pr/SSHI91gxAQz43rCH54=
X-Google-Smtp-Source: APXvYqzZTNfB664hhkmPMCNNqcEuC44mw5KrouIZCaHBRLfJPZOIHsfzyVxgJD33Ov1Y81k4QByUZQ==
X-Received: by 2002:a17:902:1003:: with SMTP id
	b3mr16429145pla.306.1557532499416; 
	Fri, 10 May 2019 16:54:59 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	k10sm6600038pgo.82.2019.05.10.16.54.58
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 16:54:58 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
	<5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
	<CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3b7d605c-ac73-6edf-7b39-598d451a4453@gmail.com>
Date: Fri, 10 May 2019 16:54:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Fri, 10 May 2019 23:54:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/10/19 4:00 PM, Andre McCurdy wrote:
> On Fri, May 10, 2019 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 5/10/19 3:13 PM, akuster808 wrote:
>>> should we change the default to openssl ?
>>
>> I dont think so. Since newer versions of gnuTLS works okay.
> 
> Isn't one of the goals for OE 2.8 to replace dependencies on [L]GPLv3
> components with non-[L]GPLv3 alternatives so that meta-gplv2 can be
> deprecated? This would seem to fit that goal exactly.

Is that stated somewhere ? while I like the goal probably I missed the 
memo, my suggestion was just to give openssl backend some time to mature 
since its relatively new, and maybe give it some soak time

> 
> It wasn't possible to build glib-networking with openssl until very
> recently but now that it's supported upstream I think we should
> switch.
> 
>    https://github.com/GNOME/glib-networking/blob/master/NEWS
> 
>>> - armin
>>>
>>> On 5/10/19 2:55 PM, Martin Jansa wrote:
>>>> * gnutls from meta-gplv2 isn't new enough for this version of glib-networking:
>>>>     meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls' ['>= 3.4.6'] found '3.3.30'
>>>>
>>>> * disabling gnutls PACKAGECONFIG isn't an option either:
>>>>     meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled. Please enable at least one TLS backend
>>>>
>>>> * add an option to replace gnutls with openssl
>>>>
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>>    meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
>>>> index 09af229d69..e2b4cffb2b 100644
>>>> --- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
>>>> +++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
>>>> @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
>>>>    PACKAGECONFIG ??= "gnutls"
>>>>
>>>>    PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
>>>> +PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
>>>>    PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
>>>>
>>>>    EXTRA_OEMESON = "-Dgnome_proxy=disabled"
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

