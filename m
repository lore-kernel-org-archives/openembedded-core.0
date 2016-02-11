Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB91608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 17:25:02 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id y8so10584524igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 09:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=7PC6DakOP08cbNjvD2EQ3DtdTKzSRxUPD6Ndvv+kvyg=;
	b=giG8Q08oJMbg8CwXBrOpKds7DJ7wQFWSf0UMnInHlSQPmPy+hyuu3CSLpJ/eBLwXeN
	lYrgnCjzgGm+O+TyHjjoqSWfE3zLOYQ8VJoUHxOF2/yHYrxKI2+y5WEWLRgADfjxYhsU
	kuaFTKop8lJe/RUeBXnjGK12DY6Q4HydgLs8/q2HsI47Ge+zFuyTkhocTYRWHvubwAnX
	Ese4xHhIIL2Si7HqOtL82OeJAsIFwtiVaAXhF6s0SeJBBHKImJHkC0aoKNRuUBmvk2Qt
	Z1ieeYv3y2zHOBrbqof1g7+kOJLpAnsTKGC17+wLsqflW2lvFd1zkD11vNVA4yrMe5GX
	zeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7PC6DakOP08cbNjvD2EQ3DtdTKzSRxUPD6Ndvv+kvyg=;
	b=GSR+vAvdbxPJV6ukeHCZbDzuJUE/oeeNsm0ruWx5hvLtG4yxEfmyEeBds97PTyfAbl
	0sbBnNhMNKZe7F4qHcR8NZ+x+FBCGW45kiAMzFmpR/1EZN1d6stB5+YjbcVSu21ebjo3
	dQxa/dEtQrafjkJFsEdlsMVS1B29+SbCXg5jRIen7kuOG9yQDEjR80IUuowRpPAjIjGE
	Q/pEXbv+Oh2r4BGoL1zaN52olWC3ROcq8V7SZEgbRW+HDUWXEdXyiMaatbeNrRmUjqbh
	jEqPv3sftQCFO/s57lChywrWR915U3PdyepRp/ySrMZtD/5Dspv4/2n5NFynRvzFjyd1
	dgQA==
X-Gm-Message-State: AG10YORLqFxXOUOKX/jSUhMVHf3+2Nb+AteGzuckzBHFtMU/qLXJ5c7F0ecZ0qvjLL6uFA==
X-Received: by 10.50.61.234 with SMTP id t10mr18609728igr.20.1455211503135;
	Thu, 11 Feb 2016 09:25:03 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	ea8sm1592515igc.0.2016.02.11.09.25.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 09:25:02 -0800 (PST)
References: <56B922B3.9070604@gmail.com> <56BAB9F8.4000106@gmail.com>
	<A7F6AE58-0DBC-4180-B232-4876DD5E20E6@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56BCC3F8.9000908@gmail.com>
Date: Thu, 11 Feb 2016 12:25:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <A7F6AE58-0DBC-4180-B232-4876DD5E20E6@gmail.com>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Thu, 11 Feb 2016 17:25:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/16 23:37, Khem Raj wrote:
> IIRC gold has its own notions to enable gold
> so you need to enable that
>
>> On Feb 9, 2016, at 8:18 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> I've tried every combination I can think of and no matter what I try, if gold is the linker the chromium build always errors out with:
>>
>>     collect2: fatal error: cannot find 'ld'

Building with gold does cut the build time of the chromium component 
back down.

binutils 2.25, bfd:  00:47:51, 00:44:24, 00:44:25
binutils 2.26, bfd:  02:07:45, 02:09:31, 02:02:42

binutils 2.26, gold: 00:43:49, 00:45:18, 00:42:51


But the only way I could get it to work was to manually perform the 
following steps:
$ cd <oe tmp dir>/sysroots/<native sysroot>/usr/bin
$ ln -s <cross toolchain prefix>/<cross toolchain prefix>ld.gold ld.gold

where:
   <native sysroot> = x86_64-linux
   <cross toolchain prefix> = x86_64-poky-linux

to give:
$ cd <oe-tmp-dir>/sysroots/x86_64-linux
$ ln -s x86_64-poky-linux/x86_64-poky-linux-ld.gold ld.gold

Maybe I can play with the recipe a bit more to get this to work 
"automatically"; maybe by setting the LD environment variable 
differently or something.

But, as I said before, the last time I tried booting a gold-linked image 
on the minnow grub2 refused to work :-(

