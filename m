Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1So8zL-0002xi-W1
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 10:06:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 00:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120227303"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 00:55:24 -0700
Message-ID: <4FFA8E6C.90504@linux.intel.com>
Date: Mon, 09 Jul 2012 00:55:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341606068.git.tom.zanussi@intel.com>
	<1341724701.6761.177.camel@trz-ThinkPad-T420>
In-Reply-To: <1341724701.6761.177.camel@trz-ThinkPad-T420>
Subject: Re: [PATCH 0/3] perf-scripting/perf-tui features, v2
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
X-List-Received-Date: Mon, 09 Jul 2012 08:06:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2012 10:18 PM, Tom Zanussi wrote:
> On Fri, 2012-07-06 at 15:29 -0500, tom.zanussi@intel.com wrote:
>> From: Tom Zanussi <tom.zanussi@intel.com>
>>
>> This patchset adds perf-scriping and perf-tui features as
>> a per-arch thing rather than per-machine, as suggested by
>> Richard Purdie.
>>
>> I just started testing this, it works so far, but thought
>> I'd put it out there now in case there were comments before
>> putting too much effort into that, and possibly giving other
>> people a chance to try it out.
>>
>
> Looks fine after more build-testing: qemux86, qemux86-64, crownbay,
> sugarbay, qemuarm and qemuppc both with and without perf-scripting and
> perf-tui, and builds without perf as well all build fine here.
>
Tom, I am sorry, I am not sure how else to say this, I have tested 
master with the only the following change and I am still getting the
the setup.py failure mentioned.

I am not sure what else to suspect at this point, this is Master plus 3 
commits, please help me understand where I have gone wrong.

This is the branch I have tested, which is 3 commits pasted Master:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgw/fail

Thanks
	Sau!

> Tom
>
>> The following changes since commit 5051e9837fa698e03d0a7a8a918ee7aa98409ce1:
>>    Robert P. J. Day (1):
>>          bitbake: usermanual: Fix missing markup
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting-v2
>>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-scripting-v2
>>
>> Tom Zanussi (3):
>>    perf: add perf.inc
>>    perf: add arch-specific perf-scripting feature
>>    perf: add arch-specific perf-tui feature
>>
>>   meta/recipes-kernel/perf/perf.inc    |   30 ++++++++++++++++++++++++++++++
>>   meta/recipes-kernel/perf/perf_3.4.bb |   18 +++++++++++++++---
>>   2 files changed, 45 insertions(+), 3 deletions(-)
>>   create mode 100644 meta/recipes-kernel/perf/perf.inc
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



