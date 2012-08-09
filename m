Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren.hart@intel.com>) id 1SzK3m-0002Lc-Ur
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 06:09:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2012 20:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,737,1336374000"; d="scan'208";a="178594900"
Received: from unknown (HELO envy.home) ([10.255.12.204])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2012 20:56:20 -0700
Message-ID: <50233478.1050100@intel.com>
Date: Wed, 08 Aug 2012 20:54:32 -0700
From: Darren Hart <darren.hart@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Liang Li <liang.li@windriver.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted>
	<20120808033742.GA19078@localhost> <5023062A.8050105@intel.com>
	<20120809012454.GA13378@localhost> <50231540.6020709@intel.com>
	<20120809015229.GA2473@localhost>
In-Reply-To: <20120809015229.GA2473@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2012 04:09:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/08/2012 06:52 PM, Liang Li wrote:
> On 2012-08-09 09:41, Darren Hart <darren.hart@intel.com> wrote:
>> On 08/08/2012 06:24 PM, Liang Li wrote:
>>> On 2012-08-09 08:36, Darren Hart <darren.hart@intel.com> wrote:
>>>> On 08/07/2012 08:37 PM, Liang Li wrote:
>>>>> On 2012-08-07 22:02, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>>>>> On Fri, 2012-08-03 at 23:43 +0800, Liang Li wrote:
>>>>>>> Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
>>>>>>> provide slang.h rather than hardcoded host dir in perf's Makefile.
>>>>>>>
>>>>>>> Pass WERROR=0 to perf's Makefile to avoid warnings being treated
>>>>>>> as errors. Warnings are not fatal, and while they will be fixed in the
>>>>>>> future, there's no need for them to break the build.
>>>>>>
>>>>>> No mention of the additional slang dependency is made here?
>>>>>>
>>>>>
>>>>> Forgot mentioned it. Good catch, but the one line change that add
>>>>> slang to DEPENDS seems clear enough for everyone, isn't? :)
>>>>
>>>> Nope, the patch header declares the intent of the patch.
>>>>
>>>
>>> Can't agree with you anymore. :) But we don't list all changes(even
>>> one line straight forward change) in patch header, don't we? :)
>>
>> OK, so we're getting off into the weeds here for a relatively minor
>> change. However, the answer to your question is YES we do list all the
>> changes in the patch header. We don't list them individually, but rather
>> group them functionally.
> 
> Still agree. Yes, we did this all along the time, no confusion here.
> Then you think the one line change in this patch, to add slang to
> DEPENDS, is functional, *should* be listed out in patch header
> explicitly. That is our deviation here, I thought that is
> straightforward, and the patch is *mainly* about *fix* an issue other
> than add a function, the one line change is just part of fix so I was
> mainly focus on explain intention of the fix. :)
> 
>> Adding a dependency to a recipe is a very clear
>> example of a functional change that should be made explicit in the
>> change log in my opinion.
>>
> 
> No problem, add it to patch header would be fine to me, but here let's
> focusing on 'do we need changes in this patch'.

As for me, I am happy with the patch content itself.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


