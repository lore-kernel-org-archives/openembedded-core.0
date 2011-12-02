Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWHOg-0001zd-2g
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 01:54:38 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Dec 2011 16:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="91313935"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2011 16:47:55 -0800
Message-ID: <4ED8203B.7050609@linux.intel.com>
Date: Thu, 01 Dec 2011 16:47:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED6CC1E.5040504@windriver.com> <4ED70FBF.6020308@intel.com>
	<CADkTA4O44WnWUuVsAAtBiOTUA=fzYft7yoG=f+bwPZn63Vcqkw@mail.gmail.com>
In-Reply-To: <CADkTA4O44WnWUuVsAAtBiOTUA=fzYft7yoG=f+bwPZn63Vcqkw@mail.gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 02 Dec 2011 00:54:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2011 01:58 PM, Bruce Ashfield wrote:
> On Thu, Dec 1, 2011 at 12:25 AM, Saul Wold<saul.wold@intel.com>  wrote:
>> On 11/30/2011 04:36 PM, Bruce Ashfield wrote:
>>>
>>> Richard/Saul,
>>>
>>> FYI: I can't get git-send email to work over the hotel wifi, so
>>> I can't chain the patches to this email. If you want me to send
>>> the patches separately, let me know. But for now, this is the
>>> best I can do.
>>>
>>> This pull request represents a collection of changes that were
>>> part of yocto M1 work, and that set the stage for more updates
>>> that will follow in the not too distant future.
>>>
>>> I've bumped the 3.0 kernel to the 3.0.10 baseline (3.0.11 is
>>> out, but not in this merge request) and updated our -rt patches
>>> to the latest upstream -rt series.
>>>
>>> This also drops the 2.6.34 recipe and leaves it to be supported
>>> in previous releases. If there's somewhere else I should be
>>> putting it, let me know and I'll put it there.
>>>
>>> The kernel revision updates have been built and boot tested by
>>> Tom and myself. And we have't seen any problems.
>>>
>>> Also included in this are some changes to kernel tools that
>>> prepare to move the kernel tools into the kernel tree itself.
>>> They also move us to doing configuration auditing using the
>>> merge_config script that Darren and John Stultz have been
>>> working on.
>>>
>>> And finally there's a small tweak to install the kernel tools
>>> via Makefile in the package itself, something that I recall
>>> Richard mentioning to me over 2 years ago a meeting .. so I thought
>>> I'd finally get to it.
>>>
>>> Cheers,
>>>
>>> Brucedvhart@linux.intel.com
>>>
>>> cc: Tom Zanussi<tom.zanussi@intel.com>
>>> cc: Darren Hart<dvhart@linux.intel.com>
>>>
>>> The following changes since commit
>>> d7cd934376ae1edaf7055ec635eb3c85fdbf58b3:
>>>
>>> squashfs-tools: fix PR, those should start with 'r' (2011-11-30 23:37:44
>>> +0000)
>>>
>>> are available in the git repository at:
>>> git://git.pokylinux.org/poky-contrib zedd/kernel
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>>
>>> Bruce Ashfield (7):
>>> kern-tools: add pre_config and merge_config.sh to the list of tools
>>> kernel-yocto: support allnoconfig base configuration
>>> linux-yocto: remove 2.6.34 recipes
>>> linux-yocto: v3.0.9 + enhancements
>>> linux-yocto: v3.0.10 + rt27
>>> linux-yocto: prefer in-tree tools to external ones
>>> kern-tools: use Makefile provided install rules
>>>
>>> meta/classes/kernel-yocto.bbclass | 24 +++++++++-
>>> .../kern-tools/kern-tools-native_git.bb | 15 ++----
>>> meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb | 38 ---------------
>>> meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb | 8 ++--
>>> meta/recipes-kernel/linux/linux-yocto_2.6.34.bb | 49 --------------------
>>> meta/recipes-kernel/linux/linux-yocto_3.0.bb | 18 ++++----
>>> 6 files changed, 39 insertions(+), 113 deletions(-)
>>> delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
>>> delete mode 100644 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
>>>
>>
>> I had a problem with this change set, it gave me the following:
>>
>> NOTE: Error expanding variable do_kernel_checkout               | ETA:
>> 00:00:07
>> ERROR: Unable to parse
>> /intel/poky/distro/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
>
> Looking at this some more before I head for travel, I can't see how my
> change set
> caused this. I haven't touched the 2.6.37 kernel (where that SRC_URI points by
> default) and I haven't touched any of the include files that it depends on.
>
> What machine were you building for ? I can't reproduce it here, so I'm
> looking for
> more information to properly debug the problem!
>

Problem found and solved, I will be sending this patchset in later today 
with a consolidated pull.

Sau!

> Cheers,
>
> Bruce
>
>>
>> during parsing.
>>
>> Sau!
>>
>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>


