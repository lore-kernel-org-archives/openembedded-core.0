Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id D9E906E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:45:47 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id y89so64655712qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JvFgBlXKfXgybnux7aUJSpQ0K5Yv9mmlr8lYuE80Duo=;
	b=SsfiP+sCFIbShsIp7YluhkUenhSbgviu37ZVGKKLtoglvoM2eHNN0fug/yGJeFySZ/
	LGPpJK9qVr4Go7JD/6/ZqHv7wBRaSneslU9cEHYXB5a71WXe92uQg00371/Dxh++/txa
	d4KRk/xIIQ0F8K7CcYCd5kqJZa6rBsdIcZgsonTbHjK+wfFh1FnUMmC64+1f+TviA3S0
	VGoPuo99vRl2L4IwtndWAZQciteS9wnGmZxQ6SOGp4YuhFFmK14EnilY2xTXZG1hXHsb
	/OP77MtZ/3mODjQZu5fBVuD4qSaFdnX3Buby4hz4D6AU/8lSSGmCjnRyxb3b/YebmlPK
	x1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JvFgBlXKfXgybnux7aUJSpQ0K5Yv9mmlr8lYuE80Duo=;
	b=LJHod0GSQxCJIzlYNyDXpguRKczCfiwphjCChpP5I7SU73zGR6I2nbsg2HJurPeLlJ
	L0WgaHNtIPPepe/1Zk8fgpO4sxr+rFY9qAwKi4J6ywa+kyJPY9Tf4nYd/f7gmMAaF0AO
	M/bRK+DACpYbgpZ9L79I7fXDep2IvlJeZzxKymM3nAVRwlrIikC35vDhF9tviDB5u0Kh
	5huCk2FoDsk0Teq26pEF/JSEjAYoBgsUQz8FNKLp6tveCXd/FDcBmkkWgVn9blyhL7HW
	ZJ7AGRtM3XybtMPWb+UazwHNrckZOECf7cOtpbe5Nyf8L75hYo1cxHMAJW4k7PJy0wL3
	jmrg==
X-Gm-Message-State: AD7BkJIVyoqwoVB7Ar9YxuK4tXwFszj/3bDDZMaFd1vR9xJBV/fUC3MtGAsKsfscNGcGE/WhFSs/dC3Zc3rzZg==
X-Received: by 10.140.148.134 with SMTP id 128mr2670036qhu.98.1457599548122;
	Thu, 10 Mar 2016 00:45:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 10 Mar 2016 00:45:18 -0800 (PST)
In-Reply-To: <56E13335.5030702@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
	<14047fe718ae0dcf3e1671364bcfa76e31aecc77.1457593651.git.hongxu.jia@windriver.com>
	<CAMKF1sqhFDRPHEFJFPoqqKpNbhKA9Sw9CpxA1+OOLceqEVPHrw@mail.gmail.com>
	<56E13335.5030702@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Mar 2016 15:45:18 +0700
Message-ID: <CAMKF1spzXhdUHSZCxNStsqetp7zzVB6KFWzUuZR4xn9Fbr5PsA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/18] cmake-native:convert source file to relative path
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
X-List-Received-Date: Thu, 10 Mar 2016 08:45:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 10, 2016 at 3:41 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 03/10/2016 04:08 PM, Khem Raj wrote:
>
> We should submit these kind of changes upstream first and get an opinion
> before forking like this
>
>
> OK, I will have a try.

IMO this could be an improvement in all packages that you have
modified, so submit them all


>
>>
>> +Although there is CMAKE_USE_RELATIVE_PATHS, but upstream
>> +explicitly did not support relative path.
>> +In git://cmake.org/cmake.git
>> +...
>> +commit 1335992c8f4e8b96f1a21d5dcc7d65a9fbd84c11
>> +Author: Stephen Kelly <steveire@gmail.com>
>> +Date:   Mon Jun 1 19:56:46 2015 +0200
>> +
>> +    Remove CMAKE_USE_RELATIVE_PATHS variable.
>> +...
>> +The reason is in https://cmake.org/Wiki/CMake_FAQ
>> +(Why does CMake use full paths, or can I copy my build tree?)
>
>
> Currently, The upstream explicitly do not support it.
>
> //Hongxu
>
>> +
>> +But oe-core need the source file path relative while compiling
>> +to avoid build path issue. The fix partly refer the above commit,
>> +but in order to minimize the influence, it only tweak gcc compiling
>> +rule in generated Makefile (With "Building ** object" message).
>
>
>

