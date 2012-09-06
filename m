Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T9Zq7-0008Lm-KJ
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 13:01:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Sep 2012 03:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="142131336"
Received: from costin-desktop (HELO [10.237.105.156]) ([10.237.105.156])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Sep 2012 03:49:12 -0700
Message-ID: <504872CD.7040407@intel.com>
Date: Thu, 06 Sep 2012 12:54:21 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20120904115104.46A5A10383@opal>
	<20120905140516.GQ3372@jama.jama.net>
In-Reply-To: <20120905140516.GQ3372@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: autoreconf: automake failed with exit status: 1 Was: [oe-commits] Constantin Musca : automake: upgrade to 1.12.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 11:01:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 05:05 PM, Martin Jansa wrote:
> On Tue, Sep 04, 2012 at 11:51:04AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 1110da87a2395e1d516f092553e6ed542bb34805
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=1110da87a2395e1d516f092553e6ed542bb34805
>>
>> Author: Constantin Musca <constantinx.musca@intel.com>
>> Date:   Mon Sep  3 10:06:42 2012 +0300
>>
>> automake: upgrade to 1.12.3
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>   .../{automake_1.12.1.bb => automake_1.12.3.bb}     |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/automake/automake_1.12.1.bb b/meta/recipes-devtools/automake/automake_1.12.3.bb
>> similarity index 92%
>> rename from meta/recipes-devtools/automake/automake_1.12.1.bb
>> rename to meta/recipes-devtools/automake/automake_1.12.3.bb
>> index 700592c..25069d7 100644
> Has anyone seen errors like this?
>
> | autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
> | automake: warning: unknown warning category 'cross'
> | automake: warnings are treated as errors
> | automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
> | autoreconf: automake failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | ERROR: Function failed: do_configure (see /OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/foxtrotgps-1.1.0-r1/temp/log.do_configure.32412 for further information)
> NOTE: recipe foxtrotgps-1.1.0-r1: task do_configure: Failed
> ERROR: Task 886 (/OE/shr-core/meta-openembedded/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.0.bb, do_configure) failed with exit code '1'
>
> Failed like this for first time today.. so I suspect it's caused by automake upgrade.
>
> Cheers,
>
>> --- a/meta/recipes-devtools/automake/automake_1.12.1.bb
>> +++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
>> @@ -39,10 +39,10 @@ SRC_URI += "${PATHFIXPATCH} \
>>   	    file://python-libdir.patch \
>>               file://py-compile-compile-only-optimized-byte-code.patch"
>>   
>> -SRC_URI[md5sum] = "ec25c1855cacf47e4bdee76a776b96ba"
>> -SRC_URI[sha256sum] = "24bf1640679ba4a9cbe2d36422f39a81eced7f556b576a7a2ccfc70ca85a1e2f"
>> +SRC_URI[md5sum] = "d2af8484de94cdee16d89c50aaa1c729"
>> +SRC_URI[sha256sum] = "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06aeae05c93730cdda9a5a0"
>>   
>> -PR = "r1"
>> +PR = "r0"
>>   
>>   do_install () {
>>       oe_runmake 'DESTDIR=${D}' install
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
I have sent a patch ([PATCH] automake 1.12.3: fix warnings) that 
eliminates the warnings.

Cheers,
Constantin Musca


