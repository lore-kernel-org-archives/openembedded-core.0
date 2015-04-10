Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12598605F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 03:16:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A3GttH000662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Apr 2015 20:16:56 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 9 Apr 2015 20:16:55 -0700
Message-ID: <552740A4.2090804@windriver.com>
Date: Fri, 10 Apr 2015 11:16:52 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1428488582.git.Qi.Chen@windriver.com>	
	<f59ab3d057c5535b83735ed997f9bcc39fa0b661.1428488582.git.Qi.Chen@windriver.com>
	<1428579962.6976.8.camel@linuxfoundation.org>
In-Reply-To: <1428579962.6976.8.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.236]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] kmod: upgrade to 20
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
X-List-Received-Date: Fri, 10 Apr 2015 03:16:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2015 07:46 PM, Richard Purdie wrote:
> On Wed, 2015-04-08 at 18:24 +0800, Chen Qi wrote:
>> The following patches are rebased.
>> -- Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
>> -- avoid_parallel_tests.patch
>>
>> The following patch is added to solve a parallel build bug.
>> -- 0001-Makefile.am-fix-parallel-build-problem.patch
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-kernel/kmod/kmod.inc                  |  5 ++--
>>   ...01-Makefile.am-fix-parallel-build-problem.patch | 29 +++++++++++++++++++++
>>   ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 15 +++++------
>>   .../kmod/kmod/avoid_parallel_tests.patch           | 30 ++++++++++++++--------
>>   4 files changed, 57 insertions(+), 22 deletions(-)
>>   create mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
> Doesn't seem to build:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/250/steps/BuildImages_1/logs/stdio
>
> Cheers,
>
> Richard
>
>
>

Thanks for pointing it out.

I'm looking into this problem.
New version of kmod is modified to use modules from module-playground 
instead of copying prebuilt modules to the repository. And those modules 
are built against host /lib/modules/xxx directory. I think that's the 
root cause.
I'm trying to figure out a solution.

Best Regards,
Chen Qi

