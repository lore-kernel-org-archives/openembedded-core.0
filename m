Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 22AE1773E5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 22:51:48 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u108so19567048wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 14:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9zZMznjnup/Exx5NYkUn8EedD8f6D7zKqkv452HwA18=;
	b=EVHRjlKvWUZkEYkMZunQ4XihDVl8WIJC/qSmmMrYQMsFIElNSYfYgcwsBY3dcMnC+k
	4TtaRocTtHsUzUWbUF9fZM3CuakHyuCufES8MVLtwes90FtkTQXjLVRitxH+fYXur0pd
	BXXWGrtDy2qRKKug/zFTtkTF1zJs9YGtGLw9lsndMeTBEEVRdvGYkwE1WB/KYou1Vo88
	xBjOhtRFeV0hV2Ih9h1ZkK1znXh632PKwcdCHlcvRD62/rFxodnHSHqeXDrB+LU1RPHF
	q5m2KtkLjS/hcld6zRyMbpwfIVARPl3vhILNwjy59gxNrKFd1oMT4T48Yk2YAC4DCwMv
	MsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9zZMznjnup/Exx5NYkUn8EedD8f6D7zKqkv452HwA18=;
	b=hhP0dkc/WXXVChh1QfMg0XSth+f2B5AJlflOiaV8xVHH2LtX8kb8Gd1jnS2WKC4NkZ
	ZHVh1aasC+eJYoRi8W4zsm5pJBNwvO/VssJdgkl8VESsRPLd1TKQ9AUKYrO+1p6tRuAl
	PSoRwn0g0Ku9ZkFMWywDtFfnXWWoabhl0H7AswGxP0tg7oRquyYKxyWnoMIRZYSF0Q8q
	8w9WpA9Vv+uVwRZf0HBtIMXmQ3BoepWQuqfnu3bIji2bNbAWbZqSgBQpn8cFQa04dEP+
	qzRqJtflsoa7X2x6cUPRj2h35BGjq1CbRIpqQUkS3j1DfDvRVqZsIhQl7rLJcl3kbZ1N
	ZtbQ==
X-Gm-Message-State: AMke39kUCg+uW9ka0kQfU1SYf3JCX8KVqU6hWa4AXbpRQ4terQa82V9/aIx1L7YAjk1ay/JEcs1dyoPsDQ5i7w==
X-Received: by 10.223.182.133 with SMTP id j5mr18364100wre.19.1488840709999;
	Mon, 06 Mar 2017 14:51:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Mon, 6 Mar 2017 14:51:49 -0800 (PST)
In-Reply-To: <CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
References: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 6 Mar 2017 14:51:49 -0800
Message-ID: <CAJ86T=VgZMNyXwd6O9UR4wmF-8afc5HMKY2=c8QxeSajsxMa7A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Mon, 06 Mar 2017 22:51:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 6, 2017 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Defaulting to softfp probably isn't the best choice anymore,
>> especially as there are now ARM BSP layers which leave DEFAULTTUNE
>> entirely up to the distro:
>>
>>   https://lists.yoctoproject.org/pipermail/yocto/2017-February/034637.html
>>
>
> I like this patch and want to clarify that it changes the default ISA to thumb2
> which we should use anyway due to size reasons and other distros use it as
> default too.

No, it doesn't. The choice between ARM and Thumb(2) is made by the
ARM_INSTRUCTION_SET variable. Adding 't' to DEFAULTTUNE simply means
that the ARM_INSTRUCTION_SET variable will not be ignored (it's really
a long standing bug that we ever defined DEFAULTTUNE options for ARMv6
and above which ignore ARM_INSTRUCTION_SET, but that's a separate
topic).

> I am not sure of we should change it for armv6 though. since some armv6
> has t1 and some has t2 so lets leave that as it is.

I'm not aware of any ARMv6 cores which don't support Thumb2. Do you
have a reference?

(But again, to be clear, this commit doesn't change the default in
terms of instruction set - all builds will still use ARM).

>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
>>  meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
>>  meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
>>  meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
>>  meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
>>  meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
>>  meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
>>  meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
>>  meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
>>  meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
>>  10 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
>> index 91f0f07..5e1f973 100644
>> --- a/meta/conf/machine/include/arm/arch-armv6.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv6"
>> +DEFAULTTUNE ?= "armv6thf"
>>
>>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
>>  TUNECONFLICTS[armv6] = "armv4 armv5"
>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
>> index 5446048..bad1c27 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7a"
>> +DEFAULTTUNE ?= "armv7athf"
>>
>>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> index 42d8d04..4d9260f 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7ve"
>> +DEFAULTTUNE ?= "armv7vethf"
>>
>>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
>> index 53994ef..2cadbee 100644
>> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
>> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv6"
>> +DEFAULTTUNE ?= "armv6thf"
>>
>>  require conf/machine/include/arm/arch-armv6.inc
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
>> index 03de602..25e99f9 100644
>> --- a/meta/conf/machine/include/tune-cortexa15.inc
>> +++ b/meta/conf/machine/include/tune-cortexa15.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7ve-neon"
>> +DEFAULTTUNE ?= "armv7vethf-neon"
>>
>>  require conf/machine/include/arm/arch-armv7ve.inc
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
>> index f659a62..40392f9 100644
>> --- a/meta/conf/machine/include/tune-cortexa17.inc
>> +++ b/meta/conf/machine/include/tune-cortexa17.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7ve-neon"
>> +DEFAULTTUNE ?= "armv7vethf-neon"
>>
>>  require conf/machine/include/arm/arch-armv7ve.inc
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
>> index 93f9ca4..1f0cda6 100644
>> --- a/meta/conf/machine/include/tune-cortexa5.inc
>> +++ b/meta/conf/machine/include/tune-cortexa5.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7a-neon"
>> +DEFAULTTUNE ?= "armv7athf-neon"
>>
>>  require conf/machine/include/arm/arch-armv7a.inc
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
>> index 52e06b8..52415d9 100644
>> --- a/meta/conf/machine/include/tune-cortexa7.inc
>> +++ b/meta/conf/machine/include/tune-cortexa7.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7ve-neon"
>> +DEFAULTTUNE ?= "armv7vethf-neon"
>>
>>  require conf/machine/include/arm/arch-armv7ve.inc
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
>> index a831bd5..8ee8de9 100644
>> --- a/meta/conf/machine/include/tune-cortexa8.inc
>> +++ b/meta/conf/machine/include/tune-cortexa8.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7a-neon"
>> +DEFAULTTUNE ?= "armv7athf-neon"
>>
>>  require conf/machine/include/arm/arch-armv7a.inc
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
>> index 8b84e60..0cf323c 100644
>> --- a/meta/conf/machine/include/tune-cortexa9.inc
>> +++ b/meta/conf/machine/include/tune-cortexa9.inc
>> @@ -1,4 +1,4 @@
>> -DEFAULTTUNE ?= "armv7a-neon"
>> +DEFAULTTUNE ?= "armv7athf-neon"
>>
>>  require conf/machine/include/arm/arch-armv7a.inc
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

