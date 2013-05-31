Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 630C1608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 17:27:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 May 2013 10:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,780,1363158000"; d="scan'208";a="322544738"
Received: from unknown (HELO envy2.home) ([10.255.13.1])
	by orsmga001.jf.intel.com with ESMTP; 31 May 2013 10:27:51 -0700
Message-ID: <51A8DD96.1070301@linux.intel.com>
Date: Fri, 31 May 2013 10:27:50 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <51781746.2000509@linux.intel.com> <2278334.0GkpBHEP1r@helios>
In-Reply-To: <2278334.0GkpBHEP1r@helios>
X-Enigmail-Version: 1.5.1
Cc: "Garman, Scott A" <scott.a.garman@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Stable Release Process
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
X-List-Received-Date: Fri, 31 May 2013 17:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/31/2013 09:34 AM, Paul Eggleton wrote:
> Hi Darren,
> 
> Sorry it's taken me so long to reply to this.
> 
> On Wednesday 24 April 2013 10:32:54 Darren Hart wrote:
>> As the stable releases become first class citizens, we should probably
>> look at streamlining the process of getting patches to them.
>>
>> The maintainer for the stable release currently changes by release,
>> which undoubtedly creates some confusion of where to send patches and
>> who to CC. These maintainers currently attempt to track these
>> patches via email filters searching for release branch names and such,
>> which is proving tedious and prone to missing patches.
>>
>> Other projects have seen good results using a stable list for this
>> purpose. This would both make it obvious when a patch is intended for a
>> stable release as well as remove any confusion about who to Cc as it
>> would be the same list for all releases. Perhaps something like
>> openembedded-core-stable@lists.openembedded.org?
> 
> In the OE-Classic days we used to have an openembedded-stablebranch mailing 
> list for the same purpose. I don't recall anyone complaining about that when 
> we had it, so this sounds like it could help with the aforementioned issues.
> 
> The downside I can see is that it's one more mailing list with the associated 
> problems of not everyone monitoring it ("that patch of mine shouldn't have 
> been backported!" or "you backported one of my patches but missed an 
> associated one"),


This is a very valid concern. The Linux Kernel stable tree maintainer
sends out email to the author of all patches he has queued for a stable
update before they hit the tree. This provides a reliable mechanism for
authors to provide feedback.


> and new users erroneously emailing it with requests for help
> that should have gone to the normal mailing list. That could however be 
> outweighed by the advantage of stable branch patches not being drowned out by 
> the rest of the patches as they currently can be.
> 
>> In addition to the list, some policy would need to be documented on how
>> to use the list. For example, it should always be Cc'd, and never
>> emailed with patches directly that don't go first to the master branch.
>> Backports being the exception. A policy could also be put in place to
>> aid in automatic processing, such as that employed by the Linux kernel
>> stable project. The following would request that the patch be applied to
>> the denzil and danny stable releases:
>>
>> Cc: <openembedded-core-stable@lists.openembedded.org> # denzil
>> Cc: <openembedded-core-stable@lists.openembedded.org> # danny
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>
>> The advantage here over something like a subject tag, "[danny]" is that
>> it scales a bit better to sending a patch for multiple releases.
>>
>> There are certainly other approaches, I mention this one as it has a
>> proven track record and I don't have a reason to deviate from it.
> 
> I'm not familiar with this, but I've never had any direct contact with the 
> kernel patch submission process so that might explain it. I have to say I'm 


I understand we are not the Linux kernel community and we need to take
our own priorities and needs into account when definining our process.
However, just for reference (learn from history or be doomed to repeat
it and all that), here are the Linux kernel stable rules:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/stable_kernel_rules.txt?id=refs/tags/v3.10-rc3

Personally, I believe it to be a fairly sound process.


> not unhappy with the existing convention we have of marking it in the title of 
> the email though.
> 
> I'd like to hear more opinions from others, particularly submitters of stable 
> branch patches and other stable branch maintainers who have been doing it 
> longer than I have. Ping...?

Agreed.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel

