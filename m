Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 538A7783C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 03:10:55 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id y129so7521791pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 20:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/TmlDj1qm6KevNgldFGCgIo7AGs6sOuNY761tboUp9Q=;
	b=Q/1vXLp01CJgqYz1ZXo7nQW+EyeINSaDfZdwFMZyRbmf94B0PkRuiFt46xOzzFK5mc
	C7IrYoDGzP+Vn2C6vIJ55U2ZpPohI2UYhmsSzjvAdtyeBkcDSRHJJHwLM/euQEnGpJlx
	W/k6eRhCNwjVOHSOeORoMsQKuFnLJkSi6DGs3XHrjYTATHqBz50r1UCkhG6LYSVWN2LE
	f4jXgkteq2kU1LVkDC0ppSqUYCPMD9aXiGjowhb00bah7gbmbFW5b1s9QDh4i8Y6E8nf
	mQ+5O2WgMss8WUtr4mi9DoQFjBcOlb4n2dYQEcpqgdD1ZUrtfchkqSnbb/j+5Sbc6dDR
	+mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/TmlDj1qm6KevNgldFGCgIo7AGs6sOuNY761tboUp9Q=;
	b=mBBQtHfmCuqERVNNBwo59m4H+FB4anwyd5iHd+KlmoozJe1O041QTQrKy16INY9UrD
	tha6j8NFO5eV+QpfLQ0KznbjYQidZLIR9NsqHu6RPSZ1pXIWFXqJqrutZmbmbM2exORZ
	SucnRhpirwa66C9qWA3QfJZwoihBA+WqHtLsLczgY+XgDqCp8rqtyceUgt2piKzErX/+
	2LPiEP6yeGUTrt0HOl38PF7YHejIRNkYB9+CGeyIbKm+arQ/7IcowNwdqNEOFLbMtnIj
	0wqLJErm762F/WFeJY2hhNciURrbUNfJCQkBDAEPOtoJ722l6+4fxjv5eubv5IFbjE+2
	2OGA==
X-Gm-Message-State: AHYfb5i0dcnC1NPpivllEAcVBRT9SqzT7qQqMxSDYxr3FN5hn/OdPmby
	1GvBz7+5mSnJdwChAKo=
X-Received: by 10.84.225.147 with SMTP id u19mr4068494plj.313.1502939457350;
	Wed, 16 Aug 2017 20:10:57 -0700 (PDT)
Received: from Khems-MacBook-Pro.local ([2601:646:8882:b8c:f933:597:7ef9:8139])
	by smtp.gmail.com with ESMTPSA id
	188sm4171078pfe.171.2017.08.16.20.10.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 20:10:56 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170814032418.3936-1-raj.khem@gmail.com>
	<20170814032418.3936-2-raj.khem@gmail.com>
	<1502870987.13978.87.camel@linuxfoundation.org>
	<1502871098.13978.88.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <15365276-05d6-2fb2-3481-9885861e9e54@gmail.com>
Date: Wed, 16 Aug 2017 20:10:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <1502871098.13978.88.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/3] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Thu, 17 Aug 2017 03:10:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 8/16/17 1:11 AM, Richard Purdie wrote:
> On Wed, 2017-08-16 at 09:09 +0100, Richard Purdie wrote:
>> On Sun, 2017-08-13 at 20:24 -0700, Khem Raj wrote:
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>>>  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>>>  2 files changed, 5 insertions(+), 1 deletion(-)
>> I think this breaks on x32:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds
>> /1183/steps/BuildImages/logs/stdio
> 
> Also on musl:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-musl/builds/523/steps/BuildImages/logs/stdio
> 

Fixed and patch is on ml
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/140928.html

> Cheers,
> 
> Richard
> 

