Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id DDC937416A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:45:55 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so17295936pdf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 09:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QV/CellHJLevBfWTepopkDkB0ECbJFJ7PKUciPj9M9o=;
	b=IfQK7YKHhAZVfn/MIG9zksMzVX91OaHuNSCv+sri6FDNeFhOsKGjdSndlmKAk9t+O5
	F7y8j0Y9klrjN78SfGrH+GTbik1a/2EJb/rVZLHFwdHh3hxn4hBMMXM8PkCVS5Qh67Zc
	YL2T37HW0q1g/9479SjHBvGX47npiDqUx07OqN+9ftvnREXlJzJD8nJYWm7ALoWxZ74C
	ki7macn+wOo4/pFV4nwBEWyTfbstKQuySbasAO5aZqxmrptyAAJ/UkP7Aj52cqAyE3Zn
	SGi62zrxiheXsh9H+ls33NTkO4sk2O+6+WDzTDQpdYIkaux9FB2xLFzb/Cf188UMOF38
	xZtA==
X-Received: by 10.66.160.71 with SMTP id xi7mr19719470pab.19.1431708356696;
	Fri, 15 May 2015 09:45:56 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:f0a2:acf0:8681:7abc?
	([2601:c:a700:3ba7:f0a2:acf0:8681:7abc])
	by mx.google.com with ESMTPSA id el6sm2355313pdb.93.2015.05.15.09.45.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 May 2015 09:45:55 -0700 (PDT)
Message-ID: <555622C1.8070204@gmail.com>
Date: Fri, 15 May 2015 09:45:53 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>	<1431295383.30971.25.camel@linuxfoundation.org>	<1431414393.30971.109.camel@linuxfoundation.org>	<1431686433.18723.22.camel@linuxfoundation.org>
	<CAMKF1spbCyde8wGJgu=GgR14M4g4qSbzLob3rbadhUNPw8_g=Q@mail.gmail.com>
In-Reply-To: <CAMKF1spbCyde8wGJgu=GgR14M4g4qSbzLob3rbadhUNPw8_g=Q@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Fri, 15 May 2015 16:45:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/15/2015 09:25 AM, Khem Raj wrote:
> On Fri, May 15, 2015 at 3:40 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2015-05-12 at 08:06 +0100, Richard Purdie wrote:
>>> With the gcc patch I've posted applied:
>>>
>>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=5fd0b7c163f4f3312bea9bd3246a6bd67a8da594&limit=100
>>>
>>> so down to 57 errors. There are a few themes:
>>>
>>> * linux-yocto 3.14 gcc5 issues
>>> * meta-fsl-ppc and metafsl-arm gcc5 issues, particularly kernel
>>> * poky-lsb issues with the security flags and gcc5
>>> * x32 failed with a race of some kind in glibc, suspect transient
>>> * gcc-target has a packaging issue which fails builds (have patch)
>>>
>>> The good news is that the various ppc issues are fixed including the rpm
>>> one from this series.
>>
>> Latest run:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=a2fbb1b6b6e564b3f9d40550c0b408978f420039&limit=100
>>
>> with 37 errors.
>>
>> * linux-yocto 3.14 gcc5 issues
>
> I guess there are patches around which I pointed out in last email
> which should be ported

I believe they would be:

bebf56a kasan: enable instrumentation of global variables
5631b8f compiler/gcc4+: Remove inaccurate comment about 'asm goto' 
miscompiles
71458cf kernel: add support for gcc 5

just for completeness.

I will give it a shot this weekend.

- armin
>
>> * meta-fsl-ppc and meta-fsl-arm gcc5 issues, particularly kernel
>
> same as above mostly.
>
>> * poky-lsb issues with the security flags and gcc5 (elfutils,
>>    coreutils, iptables, openssl on edgerouter)
>
> Those are something need fixing per package. I will look into some of
> those. x86-64 issues are w.r.t one particular relocation
>
>> * qemuarm doesn't boot
>
> I have booted several arm machines ( bbb, overo tegra ST ) using
> kernels ranging from 3.8 to 3.14, I believe its linux-yocto issue most
> probably.
>
>> * u-boot with beaglebone
>
> This needs patches like this one
> http://patchwork.openembedded.org/patch/92425/
>
>>
>> linux-yocto 3.14 is the next thing we need to clean up to have the most
>> impact, qemuarm not booting is the most worrying.
>>
>
> agreed.
>> Cheers,
>>
>> Richard
>>
>>
>>

