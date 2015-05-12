Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7AED373FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 16:17:45 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so17775258pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Yptk/gzrMQuYPjHIULQI35xknHxpN5L2celsNFX9OGo=;
	b=UoNNLrr1jZai3MTCem1FsHfbZ5dLxCdflafuiaUB6PIR1aLXGXqQrt9qxTjo/HIW1a
	KWonNKvWakTaCw8BHa/CPgvHlDtwaihbSE2PU43zgjkkAqpZJeGm0uXDjwuvhNy2sJ7F
	1X5DlSsXYApwhzlhEv9KhCfvJehLXcPdtbj3MKuZ4udk2s1xzLCsHh+72JrFa1nDuQwY
	NQIi4OoUNJdslrXlk93PT6/f6HjzPARPNuh18IaU6mIwmWLBMxV/AX6ttcW6KDdDrNbb
	gOZN5hwj0fyqfBlYKH8iDIAtgWifTy16VsTnZAh90d5o4pZkht/y6s27HWodjKbEx1Du
	C2mA==
X-Received: by 10.66.141.202 with SMTP id rq10mr30041495pab.64.1431447467491; 
	Tue, 12 May 2015 09:17:47 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:7c79:332d:8dea:73b5?
	([2601:c:a700:3ba7:7c79:332d:8dea:73b5])
	by mx.google.com with ESMTPSA id v7sm16688243pde.81.2015.05.12.09.17.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 09:17:46 -0700 (PDT)
Message-ID: <555227A8.8040309@gmail.com>
Date: Tue, 12 May 2015 09:17:44 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Khem Raj <raj.khem@gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
In-Reply-To: <1431414393.30971.109.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 12 May 2015 16:17:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2015 12:06 AM, Richard Purdie wrote:
> On Sun, 2015-05-10 at 23:03 +0100, Richard Purdie wrote:
>> On Sun, 2015-05-10 at 09:15 -0700, Khem Raj wrote:
>>> On Sun, May 10, 2015 at 7:28 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>>> | tset.o:(.debug_loc+0xe8): undefined reference to `.LCL0'
>>>> | tset.o:(.debug_loc+0xf7): undefined reference to `.LCL0'
>>>>
>>>> thanks Khem
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>   meta/recipes-devtools/rpm/rpm_5.4.14.bb | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>>>> index 03a24f0..22b111a 100644
>>>> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>>>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>>>> @@ -110,6 +110,9 @@ inherit autotools gettext
>>>>
>>>>   acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
>>>>
>>>> +FULL_OPTIMIZATION_powerpc_remove = "-O2"
>>>> +FULL_OPTIMIZATION_append_powerpc = " -Os "
>>>> +
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=741d3bf91144973d26de647039fa60b87a09edf1
>>> fixes same issue for libx11
>>>
>>> I am wondering if we should make this change in some common config
>>> metadata file to list all recipes that need this workaround
>>> untill gcc is fixed for it may be arch-powerpc.inc, since then it will
>>> be easy to remember to unbolt them once gcc is fixed.
>>
>> I like the idea of a common include to handle this a lot better.
>>
>> FWIW, I tried gcc 5 on the autobuilder. The results were 141 failures so
>> far:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150
>
> With the gcc patch I've posted applied:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=5fd0b7c163f4f3312bea9bd3246a6bd67a8da594&limit=100
>
> so down to 57 errors. There are a few themes:
>
> * linux-yocto 3.14 gcc5 issues
> * meta-fsl-ppc and metafsl-arm gcc5 issues, particularly kernel
> * poky-lsb issues with the security flags and gcc5
> * x32 failed with a race of some kind in glibc, suspect transient
> * gcc-target has a packaging issue which fails builds (have patch)
>
> The good news is that the various ppc issues are fixed including the rpm
> one from this series.
>

Have you tried arm64?

kernel did not build ( as of last week) and I have not yet tried the 
kernel patches Khem pointed out.

- armin

> Ross: The backports we were looking at are for warnings, not errors on
> the most part.
>
> Otavio: Could you see what our options are with meta-fsl-ppc and
> metafsl-arm?
>
> Cheers,
>
> Richard
>
>
>

