Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 45B41601F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 17:09:23 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id y126so10706722pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h/0QA/7GUNc0sz6w4Xe8B4QWc/bHni+dUD6DndGVa58=;
	b=qA5RjqJwtEkExB1leM3X65GrzKRpcxwphqFnqcaLO7lOHdM3gILhKPbFmFXUqcFCT7
	/ou7jqVRSds2GN/sF0PJ3WvwocsiFTWZWmuHJiRty74MTGaKuhR9/sBMuH1NK/sWFtQB
	tYUDNevTRTvG6+by9H8T4NSAFuGIZdKRetGEHSUBme19/yjZWrQIXfEI21lgXYSZ8MHK
	nqR2WFTmpioj6cbjABIXPzefo04wXtg/T2BUEtUr0DxJoKCXiKlvV9zhPurqCKzLdWjU
	S2RPjUujSpa3OWie9pXFoKYhxegYQgw3ItCve2yo/dPMniizV75S/9cSCxGXiFkGvxG9
	tS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=h/0QA/7GUNc0sz6w4Xe8B4QWc/bHni+dUD6DndGVa58=;
	b=o7WnnTQXCC82qxDLAaxE9yI7d2lO1icxtU8n3mhgIKgZbIOg1XX2gqe8lwP9oMoIZ3
	RM/Fn4lTTyQ5SdMo5nDOIdri/vgCHvqImHVDftRfLxJKLVhJpdZl0BY2HU4Se8Cw4n/1
	pKl4P62oVXFL5Gs/ZuJMT3O7czWMIsarabojv90TuhZP6N/4tNMQeR1itodBokTkRcfW
	b+uITiwHtM5q4TsN83WhIuyPyjh7ldcCaKZJGQYgUi57jfIvNPVegiMzKqKSlkNlThZC
	XhmI9LycQ0jaXlM3q1QnW3TPP3AR1+Xmfa0wzzNAHuZJDbCmnqDON6vvpkUmeC1p7nVx
	coxw==
X-Gm-Message-State: AJcUuke+AjmCRvkYJokxACU6gQr4NjM/wQPmF9dgkEg2hN8mKLfyOMO8
	aAmOR8S19wwPTlU4AK14USQ=
X-Google-Smtp-Source: ALg8bN7HWgh1X8aw9cnUOrb8LkMqoZM6YMtaivmaL9jbRHKgYBFn3AFjQ7YKh90L0RibQxDLfcuZhQ==
X-Received: by 2002:a63:1412:: with SMTP id u18mr26634896pgl.247.1546016963720;
	Fri, 28 Dec 2018 09:09:23 -0800 (PST)
Received: from hermes.local ([2601:646:877f:9499:3c66:e24:63f5:7a43])
	by smtp.gmail.com with ESMTPSA id
	b10sm62797754pfj.183.2018.12.28.09.09.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Dec 2018 09:09:22 -0800 (PST)
To: richard.purdie@linuxfoundation.org, ChenQi <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <efccb653-580b-3a5f-6e3d-be5d51b6b8c1@windriver.com>
	<8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org>
	<298dd0b5-f2f8-23dc-3a0d-cf05958e038c@windriver.com>
	<cc3405fd6c7f18dfa7dc9f545ae33e4515b7b856.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ab613fa4-f4b8-9415-bedf-e2a2b6a52101@gmail.com>
Date: Fri, 28 Dec 2018 09:09:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0)
	Gecko/20100101 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <cc3405fd6c7f18dfa7dc9f545ae33e4515b7b856.camel@linuxfoundation.org>
Subject: Re: gdb failure on simplest hello world program -- oe-selftest
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
X-List-Received-Date: Fri, 28 Dec 2018 17:09:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/28/18 8:31 AM, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-12-28 at 17:49 +0800, ChenQi wrote:
>> On 12/26/2018 07:06 PM, richard.purdie@linuxfoundation.org wrote:
>>> On Wed, 2018-12-26 at 10:09 +0800, ChenQi wrote:
>>>> Hi All,
>>>>
>>>> 'oe-selftest -r package.PackageTests.test_gdb_hardlink_debug'
>>>> fails.
>>>> I did the tests on both my Fedora27 and ubuntu16.04 servers. They
>>>> both
>>>> failed.
>>>> I can also reproduce this issue manually.
>>>>
>>>> I did some investigation. No clue how to fix this it. So I want
>>>> to seek
>>>> help from community.
>>>>
>>>> Below is some output from oe-selftest.
>>>> [snip]
>>>> 2018-12-26 09:27:58,440 - oe-selftest - INFO -
>>>> test_gdb_hardlink_debug
>>>> (package.PackageTests)
>>>> 2018-12-26 09:37:55,333 - oe-selftest - INFO - gdbtest
>>>> /usr/bin/hello1
>>>> 2018-12-26 09:37:59,904 - oe-selftest - ERROR - GDB result:
>>>> 1: Reading symbols from /usr/bin/hello1...Reading symbols from
>>>> /usr/bin/.debug/hello4...done.
>>>> done.
>>>> (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h,
>>>> line 107.
>>>> (gdb) Starting program: /usr/bin/hello1
>>>>
>>>> Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
>>>> 107    /usr/include/bits/stdio2.h: No such file or directory.
>>>> (gdb) Continuing.
>>>> Hello World!
>>>> [Inferior 1 (process 312) exited normally]
>>>> (gdb)
>>>> 2018-12-26 09:38:00,907 - oe-selftest - INFO -  ... FAIL
>>>> [snip]
>>>>
>>>> The hello world problem is as follows.
>>>> $ cat
>>>> meta-selftest/recipes-test/selftest-hardlink/selftest-
>>>> hardlink/hello.c
>>>> #include <stdio.h>
>>>>
>>>> int main() {
>>>>       printf("Hello World!\n");
>>>> }
>>>>
>>>> Some extra information:
>>>> 1. Remove '-O2' or '-D_FORTIFY_SOURCE=2', and it works correctly.
>>>> 2. Adding some system call like daemon(0,0) before printf also
>>>> works.
>>>> 3. Reverting poky repo to
>>>> 1c048479af7cc98e30f9a33d1f3bef03711544aa,
>>>> which adds this selftest case, does not work. It still fails.
>>>> 4. Hongxu confirms that things work on his host.
>>>> 5. I also don't see failure about this test case on yocto's
>>>> autobuilder.
>>>>
>>>> Could somebody help to provide some suggestions?
>>>
>>> This is strange and there must be some difference between your
>>> configuration and what what we test on the autobuilder or on
>>> Hongxu's
>>> setup.
>>   
>> Hi Richard,
>>
>> I have talked with Hongxu and we can now both confirm that there does
>> exist some problem.
>>
>>> Which DISTRO and MACHINE are you using?
>>   
>> DISTRO is poky
>> MACHINE is qemux86.
>>
>> It seems that if MACHINE is qemux86-64, the test case could pass. But
>> that's just because the test case only checks 'Breakpoint 1, main ()
>> at hello.c:4'. See the console output below.
>> (gdb) b main
>> Breakpoint 1 at 0x1050: file /usr/include/bits/stdio2.h, line 107.
>> (gdb) r
>> Starting program: /usr/bin/hello1
>>
>> Breakpoint 1, main () at hello.c:4
>> 4        printf("Hello World!\n");
>> (gdb) c
>> Continuing.
>> Hello World!
>> [Inferior 1 (process 156) exited normally]
>> (gdb) q
>>
>> Even in this case, the 'b main' does not give correct result. The
>> test case passes because 'Breakpoint 1, main () at hello.c:4' is
>> there.
>>
>> On qemux86, we have:
>> (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line
>> 107.
>> (gdb) Starting program: /usr/bin/hello1
>>
>> Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
>> 107    /usr/include/bits/stdio2.h: No such file or directory.
>> (gdb) Continuing.
>> Hello World!
>> [Inferior 1 (process 156) exited normally]
>> (gdb)
>>
>>> I think the key to resolving this is will be to understanding how
>>> to
>>> reproduce it...
>>   
>> Two ways to reproduce the problem:
>>
>> I) reproduce it via oe-selftest
>> 1) . oe-init-build-env build-selftest
>> 2) SANITY_TESTED_DISTROS = ""
>> 3) oe-selftest -r package.PackageTests.test_gdb_hardlink_debug
>>
>> II) reproduce it manually
>> 1) add meta-selftest to bblayers.conf
>> 2) IMAGE_INSTALL_append = " selftest-hardlink selftest-hardlink-dbg
>> selftest-hardlink-gdb"
>> 3) bitbake core-image-minimal
>> 4) On target:
>>       gdb /usr/bin/hello1
>>       (gdb) b main
> 
> I confirmed I could also reproduce it. We've just been lucky with the
> configuration the autobuilder tests.
> 
> I think we need to improve the test case. Does installing the libc
> headers/dev package so that stdio2.h is there help?

This is not exported API so libc headers may not work but installing 
libc dev package should help here.

> 
> Cheers,
> 
> Richard
> 

