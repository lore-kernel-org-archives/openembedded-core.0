Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id F3BAE6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 18:06:44 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f52so22768267qga.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z+htAi+Dr463SIFuGJlKcrpbQ/A8OGMzU8Mh3o9O32Q=;
	b=eiJPo3ztFlZRW9LLFPuUrUmrhL+0hffD9OumlsZwXvSgiON3Kn2HEHf3kM5H/85lbY
	o5av9FGw9Tz2pZee6CZse/sBoabkEvR4dzcB0gNJQt69prPVtK+6nE6Okv1pnyWwclrO
	L1MzpDGj0fdVqUFBICp5mcN1yC6fJUsj3ekIEnFQmkAYU3qGgV9XjKsrOhmcuR/2knnP
	zz+ljaSs7wpKo4L3lny+WeAA9w/1O3INMbk6wzhWzDZvh7bH+Cf5W+amPrKjufJDTC2I
	sND8GuERfV95ES3XyN7fZW1hvyotMNTjVteeTiFebw+dMGaOnaxxAa6f+kr+6RUPM9Ju
	qU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z+htAi+Dr463SIFuGJlKcrpbQ/A8OGMzU8Mh3o9O32Q=;
	b=WeLo3CuDMPF71gDcXZZaVp4Qv1xn9nZb2xgkb5XGjJeqo19CaKL+306P1+opYj8Lft
	B6/ePUenPeW20hQX5nxEhe3wbOahCkGdrgT+S5Wi3eggSuUYgFP9bwQyebdVAlfBL8sX
	jLbGauN47SR0LBCcDV3Gfzv28UuaS5VJl8JU1HTpwrpoqfL3SI6VrY9mpEemfgOwmnG5
	ilMOcdk2bGVWe3PmviypcX7ORo7/eFw8E8pBDYhuRlapkEP4kQ+ytYB8zqwDASMo6u0S
	gI3eSgsuxnj9ArnpFqczs53zqA5I8ETX2u82MUcxlMjLa9B/UoZTRFVzemvv4EzybllQ
	xuQA==
X-Gm-Message-State: AOPr4FV6HBs9IUKRGYMcn64z0H64WCO8P7XGOHA8vWlu0XbD8F9/FqVRVa/3X+zBz10iI7/tIITRlzKjNBtQig==
X-Received: by 10.140.148.134 with SMTP id 128mr5972740qhu.98.1460484405084;
	Tue, 12 Apr 2016 11:06:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 11:06:15 -0700 (PDT)
In-Reply-To: <CADkTA4PBrU16rwZjWZCq_88JUYN6YKqTNH8X_XQdBZ17QYeNeg@mail.gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
	<b807b4837bfb7f579a075e107e9cd7cc297b654b.1458191793.git.raj.khem@gmail.com>
	<CADkTA4PBrU16rwZjWZCq_88JUYN6YKqTNH8X_XQdBZ17QYeNeg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Apr 2016 14:06:15 -0400
Message-ID: <CAMKF1soZXL=W87Vah6Th9ZUXond266CuWwskeM_73tMXyfcg5g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] socat: Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Tue, 12 Apr 2016 18:06:45 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 10:00 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Thu, Mar 17, 2016 at 1:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> make it more portable across libc implementations
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...001-Access-c_ispeed-and-c_ospeed-via-APIs.patch | 39
>> ++++++++++++++++++++++
>>  meta/recipes-connectivity/socat/socat_1.7.3.1.bb   |  1 +
>>  2 files changed, 40 insertions(+)
>>  create mode 100644
>> meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
>>
>> diff --git
>> a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
>> b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
>> new file mode 100644
>> index 0000000..367b48f
>> --- /dev/null
>> +++
>> b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
>> @@ -0,0 +1,39 @@
>> +From 545d3dec8c91d6074516ffcfa79323ddf9d83839 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 15 Mar 2016 21:36:02 +0000
>> +Subject: [PATCH] Access c_ispeed and c_ospeed via APIs
>> +
>> +Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
>> +instead of operating on c_ispeed and c_ospeed termios structure
>> +members directly because they are not guaranteed to exist on all
>> +libc implementations
>
>
> I finally bisected a runtime failure on my container platform to this
> change. I'm now
> failing the new assertion, where I wasn't failing before this was added:
>
> socat-1.7.3.1/xioinitialize.c:70: xioinitialize: Assertion
> `cfgetispeed(&tdata.termarg) == tdata.speeds[ISPEED_OFFSET]' failed.
>

this is a benign change. Have you root caused it before you try to revert it

> I can revert this in my own layers, but what's the best way forward to get
> this
> fixed in core ?
>
> khem: This says it is submitted upstream, did it get accepted ? I can follow
> up on the socat
> list if it merged there as well.
>
> Bruce
>
>>
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Submitted
>> +
>> + xioinitialize.c | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/xioinitialize.c b/xioinitialize.c
>> +index 9f50155..632ca4c 100644
>> +--- a/xioinitialize.c
>> ++++ b/xioinitialize.c
>> +@@ -65,10 +65,10 @@ int xioinitialize(void) {
>> + #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET !=
>> -1)
>> + #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
>> + #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
>> +-      tdata.termarg.c_ispeed = 0x56789abc;
>> +-      tdata.termarg.c_ospeed = 0x6789abcd;
>> +-      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
>> +-      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
>> ++      cfsetispeed(&tdata.termarg, 0x56789abc);
>> ++      cfsetospeed(&tdata.termarg, 0x6789abcd);
>> ++      assert(cfgetispeed(&tdata.termarg) ==
>> tdata.speeds[ISPEED_OFFSET]);
>> ++      assert(cfgetospeed(&tdata.termarg) ==
>> tdata.speeds[OSPEED_OFFSET]);
>> + #endif
>> + #endif
>> + #endif
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
>> b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
>> index b9a8a2f..6da9a17 100644
>> --- a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
>> +++ b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
>> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>  SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2
>> \
>>             file://Makefile.in-fix-for-parallel-build.patch \
>>             file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch
>> \
>> +           file://0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch \
>>  "
>>
>>  SRC_URI[md5sum] = "334e46924f2b386299c9db2ac22bcd36"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"

