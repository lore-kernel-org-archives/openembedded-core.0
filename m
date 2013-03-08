Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UE2TI-0000sM-OD
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 19:57:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Mar 2013 10:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,809,1355126400"; d="scan'208";a="267007518"
Received: from unknown (HELO envy.home) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 08 Mar 2013 10:40:08 -0800
Message-ID: <513A3088.2080307@linux.intel.com>
Date: Fri, 08 Mar 2013 10:40:08 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1362702690.git.tom.zanussi@linux.intel.com>
	<CADkTA4OYYH=2LB1OLT0oJQk-wdTi1H_iWN07hFeR0p+zUpVS-Q@mail.gmail.com>
In-Reply-To: <CADkTA4OYYH=2LB1OLT0oJQk-wdTi1H_iWN07hFeR0p+zUpVS-Q@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Cc: tom.zanussi@linux.intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] perf recipe update
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
X-List-Received-Date: Fri, 08 Mar 2013 18:57:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/07/2013 05:06 PM, Bruce Ashfield wrote:
> On Thu, Mar 7, 2013 at 7:38 PM,  <tom.zanussi@linux.intel.com> wrote:
>> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>>
>> With the 3.8 kernel update, we need a new perf recipe to match.   Well,
>> not really, because there's nothing 3.4-specific about the current one,
>> and there's nothing tying it to a specific version of the kernel.
>>
>> This acknowledges that by getting rid fo the version number.  It also
>> adds a minor cleanup to rename the current include file to something
>> more appropriate.
> 
> Looks good Tom. Thanks for taking care of this.
> 
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> 
>>
>> The following changes since commit d823759b4594143d522eae0b2a2498436a6dcb1e:
>>
>>   core-image.bbclass: support read-only rootfs (2013-03-07 11:20:02 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib.git tzanussi/rename-perf-v0
>>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/rename-perf-v0
>>
>> Tom Zanussi (2):
>>   perf: rename perf.inc to perf-features.inc
>>   perf: rename perf_3.4 to perf
>>
>>  meta/recipes-kernel/perf/{perf.inc => perf-features.inc} | 0
>>  meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb}        | 2 +-
>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-kernel/perf/{perf.inc => perf-features.inc} (100%)
>>  rename meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb} (99%)
>>
>> --
>> 1.7.11.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


