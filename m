Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D2DDC6AC49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 21:50:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Oct 2014 14:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="408742816"
Received: from unknown (HELO [10.255.13.109]) ([10.255.13.109])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2014 14:42:01 -0700
Message-ID: <5452B292.6050204@linux.intel.com>
Date: Thu, 30 Oct 2014 14:50:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <545281C5.2020004@linux.intel.com>
	<CANyK_8cJA7F3CTZ8psAUaAz-qBG31cM2fJEsd6VLX-ALcxBoKg@mail.gmail.com>
In-Reply-To: <CANyK_8cJA7F3CTZ8psAUaAz-qBG31cM2fJEsd6VLX-ALcxBoKg@mail.gmail.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Package Upgrading for 1.8
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
X-List-Received-Date: Thu, 30 Oct 2014 21:50:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/2014 12:07 PM, Paul Barker wrote:
> On 30 October 2014 18:21, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> Folks,
>>
>> Just a reminder now that master is open again for patches, now is a great
>> time to consider doing package Updates.  Based on some rough estimates from
>> 1.7 we did around 300 updates from 34 contributors, that got us about 73%
>> packages upgrades.
>>
>> We currently have about 180 packages due to be updated based on the Package
>> Reporting from this last week, about 65 of those where not updated in 1.7 so
>> should be given some priority (see attached file), there are also 10 that
>> need maintainers, let me know if you are interested in any of them.
>
> I don't see opkg, opkg-utils or libarchive in those emails or on
> http://packages.yoctoproject.org/upgradepkgname. Any particular reason
> they're missing?
>
I will look into that, could be that the code in the fetcher is not 
catching opkg correctly, we are working on updating that code to do a 
better job.

> I'll send an upgrade to opkg v0.2.3 tomorrow, then further upgrades
> once they're available.
>
> Once I've merged a patch by Jian Liu to opkg-utils there will likely
> be an opkg-utils SRCREV update.
>
> I have my eye on libarchive as well as I'm using it within the
> development versions of opkg. I'm subscribed to their announcement
> mailing list so I'll know when a new release is made.
>
Thanks, saw your email earlier, thanks your hard work on the OPKG* know 
it's appreciated.

Sau!


> Cheers,
>

