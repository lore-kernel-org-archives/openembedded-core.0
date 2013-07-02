Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A37F621E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:52:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2013 07:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,980,1363158000"; d="scan'208";a="363542727"
Received: from unknown (HELO [10.255.13.91]) ([10.255.13.91])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 07:28:37 -0700
Message-ID: <51D2E395.3000300@linux.intel.com>
Date: Tue, 02 Jul 2013 07:28:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
	<51CB2164.5090102@linux.intel.com>
In-Reply-To: <51CB2164.5090102@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 02 Jul 2013 14:52:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Any updates on this issue?

Sau!


On 06/26/2013 10:14 AM, Saul Wold wrote:
> On 06/25/2013 11:00 AM, Khem Raj wrote:
>>
>> On Jun 25, 2013, at 10:46 AM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>
>>> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=imx_2.6.35_11.09.01
>>>
>>>
>>
>> hmm 2.6.35
>>
>>> If you provide me the command I should do, I can get it. Or Saul might
>>> get it from autobuilder as well.
>>
>> something like below. Replace the paths to your tmpdir appropriately
>> in below cmd ( e.g.
>> /builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi
>> might be something else for you and also compiler name and sysroot)
>>
>> cd into kernel srcdir in staging
>> tmp/sysroots/beaglebone/usr/src/kernel/tools/perf
>>
>> arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork
>> -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
>> --sysroot=/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/qemuarm
>> -O2 -pipe -g -feliminate-unused-debug-types -D_LARGEFILE64_SOURCE
>> -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -Iutil/include -Iarch/arm/include
>> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/arch/arm/include/generated/uapi
>> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel/arch/arm/include/uapi
>> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel/arch/arm/include
>> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/include/generated/uapi
>> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel/include/uapi
>> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel
>>
> /include
> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/util
> -Iutil -I. -I../lib/traceevent/ -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
> -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/
> -DLIBELF_SUPPORT -DLIBELF_MMAP -I=/usr/include/slang -DNEWT_SUPPORT
> -DHAVE_ON_EXIT -DBACKTRACE_SUPPORT  util/callchain.c -E -dD -o callchain.i
>>
>> and send me callchain.i
>>
> Finally got a hold of a build!
>
> Here's the command that I used:
>
>> arm-poky-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/sysroots/imx28evk
>> -c -O2 -pipe -g -feliminate-unused-debug-types -D_LARGEFILE64_SOURCE
>> -D_FILE_OFFSET_BITS=64 -Iutil/include -Iarch/arm/include
>> -I../../include
>> -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx28evk-poky-linux-gnueabi/perf/1.0-r8/perf-1.0/
>> -DNO_NEWT_SUPPORT -DNO_LIBPERL -DNO_LIBPYTHON -DHAVE_CPLUS_DEMANGLE
>> -DSHA1_HEADER="<openssl/sha.h>" util/callchain.c -E -dD -o callchain.i
>
> I hope this can help.
>
> Sau!
>

