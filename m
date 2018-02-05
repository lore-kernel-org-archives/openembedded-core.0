Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF902784A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:18:28 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id q17so10094567pll.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 10:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=q7kh4odaevcpmIgubFEzQPTHhL1+rd8xlcEBINGxiGs=;
	b=fpv56zBXtvTfAbl5xQ7sYtJwMtNIArQNfE1B7JkPojqsJQxAyEzA4EY4KKwW/Gb36S
	K6E0XRCcjt4q9DvUUNOj/OgHCPVoL1vpZaUIZX7gKargN6bQrbnKTwRbce48bhOGUScK
	JIsST2inte2Sqn9DjnryABXMMCeBK5xRJPqCtfYZetU4bRukq5Zusbdw3bpKsslAj2u+
	lQrldWom3UmDNZsqLAMGNiXKxOv+WDsqMroos/6y+KUA6C+c3UllTCaJwPcdAn++3gug
	7er0Fq+i1RcRBUDO5BCmpd25rhSXTbwpVVmmfbgTg9qJdlf/5rT20N12+3DB1WR3lsDK
	4N6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=q7kh4odaevcpmIgubFEzQPTHhL1+rd8xlcEBINGxiGs=;
	b=Y4AjXUrdAkSdOAuH6Wk99FrhrbfSKXLsQAEVflW2TLZQsLefwmRRC5WOPz7Lm95YM/
	/wxoyhw0j5SuyBUMG9gRh6+o8M2zPA5xUl7wLthoU5Qj8Odv6QhU92yqdCUTMr+bDqHk
	prB0mT2hjBkFBffBV6glJ/BmNVBrppXFr2xoTymlFhMpwnGY4B0ewRU7aGJ04nPFCAlF
	krswNEijunGxu19r6OKMsf2UCrmkcel6TzodG+EPX5ex4uLGzvF3B1xwI7BMPVyosv6h
	k+UegYpQL2NZj9O1lIiaDCLbf7tB06G3rSY/zuSeGw6YJeLHAGD+Y4Op4MPL3uGo/3OG
	e6Hw==
X-Gm-Message-State: AKwxyteWViL6JqEx0YNETed4z3IpNDnmte4oOdRyiIUNe52+Cm8w/jNC
	PzeA+W9dGsrNWqtMKcuVnOc=
X-Google-Smtp-Source: AH8x226ZdtAQVaJv9MCOhpEm+bJxwcbZDdV/DCM12XaXxWnEFSvooYfKWrL0m26/Ae1jQQqMewxJBQ==
X-Received: by 2002:a17:902:7486:: with SMTP id
	h6-v6mr14512114pll.236.1517854709743; 
	Mon, 05 Feb 2018 10:18:29 -0800 (PST)
Received: from ?IPv6:2601:647:4c00:6cf9:8c68:858d:e4d9:273b?
	([2601:647:4c00:6cf9:8c68:858d:e4d9:273b])
	by smtp.gmail.com with ESMTPSA id
	e71sm10399495pgc.79.2018.02.05.10.18.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 10:18:29 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
	<20180201180210.21652-16-alexander.kanavin@linux.intel.com>
	<CAJTo0LZFzhjunzJANsfm6Poo=idkyd-y6N7BnANc3kjD51Z26Q@mail.gmail.com>
	<CAMKF1spkfhB7su3w1afLHcfz0wSrvOKvJ9AOQQktSLyHH-mCwg@mail.gmail.com>
	<cf9b1424-a148-fe3b-fc77-49b6c7b89e0f@linux.intel.com>
	<7452a226-371f-7bcb-d183-8d22a69f8e11@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <a552f3d5-7e45-aca9-03c6-33f78a67857a@gmail.com>
Date: Mon, 5 Feb 2018 10:18:28 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <7452a226-371f-7bcb-d183-8d22a69f8e11@linux.intel.com>
Cc: Marek Vasut <marex@denx.de>, trini@konsulko.com,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/20] dtc: upgrade to 1.4.6
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
X-List-Received-Date: Mon, 05 Feb 2018 18:18:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/5/18 6:52 AM, Alexander Kanavin wrote:
> On 02/05/2018 12:42 PM, Alexander Kanavin wrote:
>>>> /data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/recipe-sysroot-native/usr/include/libfdt_env.h:70:30:
>>>>
>>>> error: conflicting types for 'fdt64_t'
>>>> |  typedef uint64_t FDT_BITWISE fdt64_t;
>>>> |                               ^~~~~~~
>>>> | In file included from <command-line>:0:0:
>>>> |
>>>> /data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/git/include/libfdt_env.h:19:16:
>>>>
>>>> note: previous declaration of 'fdt64_t' was here
>>>> |  typedef __be64 fdt64_t;
>>>> |                 ^~~~~~~
>>>>
>>>
>>> I have a patch to u-boot which is fixing similar issue. see
>>> see if this helps.
>>>
>>> https://gist.github.com/kraj/70d613d1ead4be98a5787928d8518434
>>>
>>
>> Thanks, I think u-boot upstream also has a fix for it. I'll check.
> 
> Unfortunately, latest u-boot upstream still fails in the same way. As I
> really have no idea about when system includes vs bundled includes
> should be used (and no way to test anything u-boot related), let's defer
> this update until either upstream takes care of this issue.
> 

I have a local patch upgrading uboot related recipes here.
https://github.com/kraj/openembedded-core/commit/0ed2c4ff4835142893b8c711ed09ffe10061d4a8
waiting for 2018.03 to come out. May be you can slate this update there
after

> Alex
> 


