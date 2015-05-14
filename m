Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 892796013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 15:43:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 14 May 2015 08:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,429,1427785200"; d="scan'208";a="493610793"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.79])
	([10.219.4.79])
	by FMSMGA003.fm.intel.com with ESMTP; 14 May 2015 08:42:44 -0700
Message-ID: <5554C274.5050202@linux.intel.com>
Date: Thu, 14 May 2015 10:42:44 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1431443215.git.alejandro.hernandez@linux.intel.com>	
	<62f3e62e0a2145d32fd75530b6f2aeba00dc1bc4.1431443215.git.alejandro.hernandez@linux.intel.com>	
	<20150512223017.GG2714@jama> <55528041.8020901@linux.intel.com>
	<1431600879.30971.211.camel@linuxfoundation.org>
In-Reply-To: <1431600879.30971.211.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python3: Upgrade from 3.4.2 to 3.4.3
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
X-List-Received-Date: Thu, 14 May 2015 15:43:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/05/15 05:54, Richard Purdie wrote:
> On Tue, 2015-05-12 at 17:35 -0500, Alejandro Hernandez wrote:
>> On 12/05/15 17:30, Martin Jansa wrote:
>>> On Tue, May 12, 2015 at 03:09:50PM +0000, Alejandro Hernandez wrote:
>>>> Modifies:
>>>> python3-native_3.4.2.bb -> python3-native_3.4.3.bb: Updates checksums, LICENSE did not change,
>>>> dates were updated.
>>>> python3_3.4.2.bb -> python3_3.4.3.bb: Updates checksums, LICENSE did not change,
>>>> dates were updated.
>>>> generate-manifest-3.4.py: fixes asyncio and net-tools.
>>>> python-3.4-manifest.inc: fixes asyncio and net-tools.
>>>> This upgrade contains a fix for CVE-2014-9365.
>>> There is still that textrel issue I've reported earlier:
>>> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-audio/usr/lib/python3.4/lib-dynload/ossaudiodev.cpython-34m.so' has relocations in .text [textrel]
>> [...]
>>> IIRC you've already sent some patch to fix it, do you know what's the status of it, if it was applied or not (why?)?
>> Oh nice, I had not seen your patch, I was aware the issue still existed
>> but I upgraded first,  mainly to include the CVE fix and I was just
>> gonna start to work on that issue, no I don't know what the status of it
>> is, RP was probably waiting for the Autobuilder issues to be fixed, but
>> now they are, so it'll probably be applied soon.
> I think there is some misunderstanding here. I don't think there is a
> patch to fix the textrel issues as yet. If there is, someone needs to
> point me at it as I can't find it.
>
> Cheers,
>
> Richard
Oh, my bad, apparently I read that wrong, I have NOT sent any patch to 
fix the textrel issues yet.

