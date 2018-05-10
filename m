Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1C27527B;
	Thu, 10 May 2018 18:50:03 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id n10-v6so1809765plp.0;
	Thu, 10 May 2018 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aPUi75QM5kUXpOBGZzDpVnBxhkzO9ZqF5xqBLsjVYBg=;
	b=f7ogmbOcGrXna1RUSq24pIRQZveJq0XZth6QS7cfO1oY0RRhm5vwcKkw9CznrgjXzF
	E9aUDY15n+nPn95RaNta5Z8QvQ7Z/u4yxcFlw2gmrbkKNAxhZr1z6mRyp5SYqD3CD88f
	4vTe6JWNdjM7/k4jAzgSFyUV+cFerW8J9veMZsZ13yilMddjnkITR3+yXaQl1wEF/6JS
	D3QbgfhegafHkLfpBmXsQnnegT+mDuSSlkoA1aZyyUmq9ntcGqpcdOZRDjjRYD5Z9IuD
	t6mIWp2CDXLhhdomo7//2BZr72MYoFIS1SWHCxztjjPtiU8LGv6WTVpMuhur51LHC4AT
	5eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=aPUi75QM5kUXpOBGZzDpVnBxhkzO9ZqF5xqBLsjVYBg=;
	b=WuSB29npoiAazmBDHpDBA1fF9NlBUuJC7GS980oF+ouRk2JmJSBvRvy5KmAQB28koY
	o7nMKo794YrR7NgxvEP8ACuuE6gAKqbbfGEgny8vfB8vlVaDC6H1EzW+F+nHlBYORD2y
	uAi+DKgk5fpe2hMkXTdFmgIZzNB692iUJCIeToKHKnArlORm/1gE/M5Ni42MZwZ8Hv8k
	4OqiN3S5NBZF27t9U9ji6gJS3OpOs1entyj86e7SPkSmmO53mkl6RD5jLygQbO18DfMj
	ueH5vwmH+WBMp4ES7+4YV6xbkmsELdwq72tKdN2mtOnLgmkKT5xZFFitbDE/qjJGVgLG
	H97A==
X-Gm-Message-State: ALKqPweZyqyTkXI8JJdg6icV4R/aPCx+1UN870YMb9QnmRQivP0G7dLk
	3zCAAKN2rA4s/pzdqjMuLpw=
X-Google-Smtp-Source: AB8JxZqPkVo6OANnXGxT5BQaF8egrVXBZ3oc5ykrpsZfmQInlDrKyjcDwdIPq1hLRD+P5Oqv5JnQug==
X-Received: by 2002:a17:902:3181:: with SMTP id
	x1-v6mr2452134plb.198.1525978204495; 
	Thu, 10 May 2018 11:50:04 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:49fa:9382:bcbc:28ae])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm4362534pfk.145.2018.05.10.11.50.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 11:50:03 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
Date: Thu, 10 May 2018 11:50:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 18:50:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Martin

Thanks for testing and reporting back

On 5/9/18 2:38 AM, Martin Jansa wrote:
> My initial tests show couple issues, but usually caused by other changes 
> in that branch, not the gcc-8 itself.
> 
> 1) strace-4.22 from 
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-8&id=af33a8b721cc9caebd3f5226b4c5903f666ab654
> fails to build with ptest enabled (it builds with 4.20 version if I 
> revert this change)
> ../../strace-4.22/tests/inject-nf.c: In function 'main':
> ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used in 
> asm here
>   }
>   ^

are you targeting thumb1 ? how can I reproduce it ?

> Makefile:6313: recipe for target 'inject-nf.o' failed
> make: *** [inject-nf.o] Error 1
> make: Leaving directory 'strace/4.22-r0/build/tests'
> 
> 2) glibc with obsolete rpc disabled from: 
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-8&id=0cd820424d4bdb5cc68e7503e09a0359fd21150a
> causes busybox's mount applet to fail building:
> util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file or directory
>   # include <rpc/rpc.h>
>             ^~~~~~~~~~~
> compilation terminated.
> make[1]: *** [util-linux/mount.o] Error 1
> make: *** [util-linux] Error 2

I think you sent a patch already for this so discussion for fix are on 
going.

> 
> 3) grub and grub-efi fails to build with gcc8:
> In file included from ../grub-2.02/grub-core/partmap/gpt.c:26:
> ../grub-2.02/include/grub/gpt_partition.h:79:1: error: alignment 1 of 
> 'struct grub_gpt_partentry' is less than 8 [-Werror=packed-not-aligned]
>   } GRUB_PACKED;
>   ^
> In file included from ../grub-2.02/grub-core/disk/ldm.c:26:
> ../grub-2.02/include/grub/gpt_partition.h:79:1: error: alignment 1 of 
> 'struct grub_gpt_partentry' is less than 8 [-Werror=packed-not-aligned]
>   } GRUB_PACKED;
>   ^
> ..
> ../grub-2.02/grub-core/fs/btrfs.c:186:1: error: alignment 1 of 'struct 
> grub_btrfs_inode' is less than 4 [-Werror=packed-not-aligned]
>   } GRUB_PACKED;
>   ^
> 

I think we need to align end of these structs here, can you try
https://src.fedoraproject.org/rpms/grub2/raw/master/f/0198-align-struct-efi_variable-better.patch

> 4) iotivity fails to build with gcc8:
> service/resource-encapsulation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp: 
> In lambda function:
> service/resource-encapsulation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp:164:30: 
> error: 'value' is not captured
>                   ocRep[KEY] = value;
>                                ^~~~~
> 

this needs more investigation. May be move
https://github.com/iotivity/iotivity/blob/master/service/resource-encapsulation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp#L160

just above
https://github.com/iotivity/iotivity/blob/master/service/resource-encapsulation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp#L165

> 5) nativesdk-libxcrypt fails to build (not sure which change caused 
> this, it build OK with sumo since the -std=gnu99 addition.
> ../git/crypt-sunmd5.c:189:13: error: 'snprintf' output may be truncated 
> before the last format character [-Werror=format-truncation=]
>               "$" CRYPT_ALGNAME "," ROUNDS "%u$%s$",
>               ^~~
> 

something new, I will look into reproducing this.

> 6) couple internal components which usually fail to build with gcc8, 
> because of more strict warnings + Werror.

OK, feel free to send out question if you get stuck

> 
> I didn't get very far in testing, because our old kernel fails to build 
> with gcc8 and there are some other issues caused by other master 
> changes. But it doesn't look too bad (in my small test, lets see what 
> bitbake world will show), thanks a lot for new gcc.
> 

yes, older kernel needs fixes, especially to disable new warnings.
the mips/ppc fixes that I put out there might be helpful to cook up 
fixes for older kernels if running into same issues.

> Cheers,
> 
> 
> 
> 
> 
> On Sat, May 5, 2018 at 2:26 AM, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     Hi All
> 
>     As you might have noticed that gcc 8.1 was released this week, I am
>     calling out for some testing help on testing branch so we can weed out
>     issues you might see in your setups. so if you have your
>     builders idling over weekend, then you know what they can do this
>     weekend :)
> 
>     Highlighted changes are
> 
>     https://gcc.gnu.org/gcc-8/changes.html
>     <https://gcc.gnu.org/gcc-8/changes.html>
> 
>     and porting doc is
> 
>     https://gcc.gnu.org/gcc-8/porting_to.html
>     <https://gcc.gnu.org/gcc-8/porting_to.html>
> 
>     The branch is here
> 
>     http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>     <http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8>
> 
>     Its uptodate on top of current master oe-core
> 
>     May fourth be with you !!
> 
>     Cheers!
> 
>     -Khem
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 

