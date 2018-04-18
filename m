Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6EABE60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 07:37:20 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id t20-v6so591011ply.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CuhMmsDYsXcV+E7+PDMreBUHnTBHG5k10LyodwgnNws=;
	b=LBPBPJfxFYUMT9z+FYUEhzQsmneu2QXj8q0QRTGo61WCtgbn0S2odHtnKKnN9vVP+s
	unaHeHx3Az5EBNF7mdC8fWGmCS6iStm0qqgVb3wALMf51taCWmOnIKC2duI6tA9NCszH
	j3THovggpYiN4Mz7hC2xsM8Kc+MceD3GrZVOxe7FZWpPmHGYfaJlUb4w7/A8IAC73gO5
	HYMAC435KcctKJ7gieYQ6v+wiDCHkr0G9r+oo6aS2Bw7KZyNphIMnB8YfPPWBKEqnzef
	MgG7/4sMhw78gqxZMdE02a04xq/yu9VOkCIyp6/4UbDiGInrCB2ZI3vCpfEgXuovKRXU
	pk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=CuhMmsDYsXcV+E7+PDMreBUHnTBHG5k10LyodwgnNws=;
	b=r87tr5nWMB93MtiNso+VOeXz+qLR+oPmN1P/QxIhBmbje4HDyqQpyZHcs0Y46gN6Bc
	93a/gD8ALnHVvoCSpUTArEEwUQcjPpuB+hOxKfPUPFqv3ts+oCCCAAebMXGoUacCBLc5
	t1juUdKEEgj+UWFen/fF2wbemcZ7lZIDC3HDBFniJoLd+ZU1a7ooCMlMi+e/F/6ReybF
	3PjWy1Fdyid2R32OWIcjaPjaCaL+v4mbajmpnHkKCzlxuzs3dy8bTqlAzqDLqyVd2CU2
	EA65e/TMNPcEFzYKvf4oyH/1U4t6zVgHaUomqypnRq3tZ3gsVonLZSQhKeQrd0k+wZvy
	NmOg==
X-Gm-Message-State: ALQs6tCkFBTVH7BUlHSol4ukSKtI65sxjIKiuiSTk3TLpOB2Qey45tJ6
	zEqb0BZheeX0+Vp81jbhm9iW1pnl
X-Google-Smtp-Source: AIpwx4+enriOU6A51qcbHIlXpo00amu5QkQTO+6fLjUDSid7QGnAyNhVjOQ7q0MbiHxnL0A8cUITRw==
X-Received: by 2002:a17:902:264:: with SMTP id
	91-v6mr1036591plc.341.1524037041267; 
	Wed, 18 Apr 2018 00:37:21 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:68e6:e447:164c:d4e7])
	by smtp.gmail.com with ESMTPSA id
	m23sm1382128pgc.40.2018.04.18.00.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 00:37:20 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180416065014.29385-1-raj.khem@gmail.com>
	<20180416065014.29385-3-raj.khem@gmail.com>
	<CAJTo0LZk7nOy5s6fRi2vnRhbvaMqnphAFhoxyazkXVLree525g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ad3a0298-f357-00e0-c6d8-3dd53d5771c6@gmail.com>
Date: Wed, 18 Apr 2018 00:37:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZk7nOy5s6fRi2vnRhbvaMqnphAFhoxyazkXVLree525g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gcc-runtime: Disable gcc version of libssp
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
X-List-Received-Date: Wed, 18 Apr 2018 07:37:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/17/18 3:12 AM, Burton, Ross wrote:
> This is, I suspect, the cause of nativesdk-perl failing on the autobuilder:
> 
> TOPDIR/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-perl/5.24.1-r0/recipe-sysroot-native/usr/bin/x86_64-pokysdk-linux/../../libexec/x86_64-pokysdk-linux/gcc/x86_64-pokysdk-linux/7.3.0/ld:
> cannot find -lssp_nonshared
> TOPDIR/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-perl/5.24.1-r0/recipe-sysroot-native/usr/bin/x86_64-pokysdk-linux/../../libexec/x86_64-pokysdk-linux/gcc/x86_64-pokysdk-linux/7.3.0/ld:
> cannot find -lssp
> collect2: error: ld returned 1 exit status
> makefile:391: recipe for target 'lib/buildcustomize.pl' failed
> 
> http://errors.yoctoproject.org/Errors/Details/176127/
> 

Sent a V2, which should fix it.
https://patchwork.openembedded.org/patch/150197/


> Ross
> 
> On 16 April 2018 at 07:50, Khem Raj <raj.khem@gmail.com> wrote:
>> libssp is implemented fully in glibc as well as in musl
>> so we really do not need the gcc version of this library
>> except may be for mingw, where we keep it enabled anyway
>> gcc in OE is built with the knowledge that C library
>> already provides libssp implementation, we should therefore
>> not need the gcc implementation of same.
>>
>> libssp_nonshared piece is a detail which is needed when gcc
>> is the compiler, in glibc this is part of libc_nonshared.a
>> already and libc_nonshared.a is linked always when linking
>> with -lc becuase libc.so in glibc is actually a linker script
>>
>> GROUP ( /usr/lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /usr/lib/ld-linux-x86-64.so.2 ) )
>>
>> which automatically links in the needed runtime bits, this however
>> is not the case for musl, where core SSP APIs are implemented in full
>> but compiler specific runtime isn't, for this we add a new package
>> called libssp_nonshared which generate the needed runtime stub
>> and gcc is already carrying patch to link to libssp_nonshared.a
>> on musl
>>
>> This should fix a long standing problem where static PIE executable
>> were not buildable with OE since it was conflicting SSP implementation
>> one from C library and the other one from gcc and we end up with
>> duplicate symbol errors during linking.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-7.3.inc     | 4 +++-
>>   meta/recipes-devtools/gcc/gcc-runtime.inc | 4 +++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> index d968c322d2..7e52afc643 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> @@ -93,10 +93,12 @@ FORTRAN = ""
>>   JAVA = ""
>>
>>   LTO = "--enable-lto"
>> +SSP ?= "--disable-libssp"
>> +SSP_mingw = "--enable-libssp"
>>
>>   EXTRA_OECONF_BASE = "\
>>       ${LTO} \
>> -    --enable-libssp \
>> +    ${SSP} \
>>       --enable-libitm \
>>       --disable-bootstrap \
>>       --disable-libmudflap \
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> index 97365a21dc..b4e5539575 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -24,8 +24,10 @@ RUNTIMELIBITM_nios2 = ""
>>   RUNTIMELIBITM_microblaze = ""
>>   RUNTIMELIBITM_riscv32 = ""
>>   RUNTIMELIBITM_riscv64 = ""
>> +RUNTIMELIBSSP ?= ""
>> +RUNTIMELIBSSP_mingw ?= "libssp"
>>
>> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>> +RUNTIMETARGET = "libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>>       ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
>>   "
>>   RUNTIMETARGET_append_x86 = " libmpx"
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

