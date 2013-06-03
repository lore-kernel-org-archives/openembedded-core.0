Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34B71601AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 16:22:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2013 09:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,794,1363158000"; d="scan'208";a="347374530"
Received: from unknown (HELO envy.home) ([10.255.13.115])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2013 09:22:57 -0700
Message-ID: <51ACC2E1.9000206@linux.intel.com>
Date: Mon, 03 Jun 2013 09:22:57 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <51781746.2000509@linux.intel.com> <2278334.0GkpBHEP1r@helios>
	<20130531173450.GC23802@jama> <51A8E185.1010303@linux.intel.com>
	<938455D5-B24C-4B2E-880B-A235A10D22C5@dominion.thruhere.net>
	<51AC7B73.8040005@balister.org>
In-Reply-To: <51AC7B73.8040005@balister.org>
X-Enigmail-Version: 1.5.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Garman,
	Scott A" <scott.a.garman@intel.com>
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
X-List-Received-Date: Mon, 03 Jun 2013 16:22:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/03/2013 04:18 AM, Philip Balister wrote:
> On 06/03/2013 02:00 AM, Koen Kooi wrote:
>>
>> Op 31 mei 2013, om 19:44 heeft Darren Hart <dvhart@linux.intel.com> het volgende geschreven:

>>>> I like subject tags, at least because they are nicely shown in
>>>> patchwork subject, so I can easily sort incoming patches to right
>>>> bundles.
>>>>
>>>> And this problem with scaling when sending a patch for multiple 
>>>> releases we already have when tagging multiple affected layers
>>>> (which happens more often for meta-oe layers then multiple
>>>> releases).
>>>
>>> It has been expressed that this has been challenging to enforce
>>> (anything that is freeform is). Do you have any suggestions on how we
>>> could address that? Documentation? Firm maintainer policy of willfully
>>> ignoring non-tagged patches?
>>
>> An email saying "wrong tag, please read README and resubmit"
>> followed by willfully ignoring wrong tags has worked quite well in
>> the past. But only if the README clearly states the tags needed and
>> has a sample git-send-email cmdline.
> 
> I find the sample git send-email line in the README to be a huge
> help for me.
> 
> Philip
> 

In my experience with this project and our maintainers, they are
exceptionally good-natured and eager to help compared to some other
projects. There would definitely be a painful period as they tried to
resist reminding people and just pulling the patch in anyway. I think it
could work, but we would have to be firm about it and document it well.
Some kind of a stable-release.txt README is definitely in order.

I went to check oe-core for some kind of existing documentation on
policies and came up empty. Perhaps just documenting this
pseudo-existing policy in a place where developers are likely to find it
and can be easily referred to would be a good first step.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel

