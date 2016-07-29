Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CED5E607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:16:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6TBG0Ae004396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 29 Jul 2016 04:16:00 -0700
Received: from server.local (147.11.117.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jul 2016 04:15:59 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
	<009dfcea9c78b09da41ed2502482b1e116772c78.1469638333.git.bruce.ashfield@windriver.com>
	<1469774922.9142.39.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <ebc1baa1-18d7-8de4-0edc-6213aa62eb1c@windriver.com>
Date: Fri, 29 Jul 2016 07:15:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1469774922.9142.39.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] linux-yocto/4.1: bump to v4.1.28
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
X-List-Received-Date: Fri, 29 Jul 2016 11:16:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-29 2:48 AM, Richard Purdie wrote:
> On Wed, 2016-07-27 at 12:57 -0400, Bruce Ashfield wrote:
>> Updating the 4.1 kernel to the korg -stable release
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++---
>> -------
>>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/bui
> lds/851/steps/BuildImages/logs/stdio
>
> http://errors.yoctoproject.org/Errors/Details/73456/
>
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/setup.c: In function 'arch_mem_init':
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/setup.c:690:2: error: implicit declaration of function 'reserve_bootmem_region' [-Werror=implicit-function-declaration]
> |   reserve_bootmem_region(__pa_symbol(&__nosave_begin),
> |   ^~~~~~~~~~~~~~~~~~~~~~
> |   CC      mm/swap.o
> | cc1: all warnings being treated as errors
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work-shared/qemumips/kernel-source/scripts/Makefile.build:258: recipe for target 'arch/mips/kernel/setup.o' failed
> | make[4]: *** [arch/mips/kernel/setup.o] Error 1
> | make[4]: *** Waiting for unfinished jobs....
>
> also
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/buil
> ds/857/steps/BuildImages/logs/stdio
>
> http://errors.yoctoproject.org/Errors/Details/73450/
>
> TOPDIR/tmp/work-shared/qemuppc/kernel-source/arch/powerpc/kernel/prom.c:170:25: error: 'PPC_FEATURE2_HTM_NOSC_COMP' undeclared here (not in a function)
>    PPC_FEATURE2_HTM_COMP|PPC_FEATURE2_HTM_NOSC_COMP, 22, 0, 0},
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> make[3]: *** [arch/powerpc/kernel/prom.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [arch/powerpc/kernel] Error 2
> make[1]: *** [sub-make] Error 2
> make: *** [__sub-make] Error 2

odd. My core-image-builds claim to have worked. I'll pick this up and
re-submit my queue with some new 4.1 patches that fix any issues.

Bruce

>
> Cheers,
>
> Richard
>
>


