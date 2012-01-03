Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEGx-0001aI-0h
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:00:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jan 2012 15:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102877402"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 15:52:39 -0800
Message-ID: <4F0394C7.6070500@linux.intel.com>
Date: Tue, 03 Jan 2012 15:52:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <4EF0C808.8060609@gmail.com> <4EFA2B81.4090405@linux.intel.com>
	<CABcZAN=kQT-imznF0wRWW_Nazs+YefcC2YY-yk+ckp6gjV757w@mail.gmail.com>
	<C912F71A353F438184732085CC1952DC@gmail.com>
In-Reply-To: <C912F71A353F438184732085CC1952DC@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch.bbclass: abstract out logic that determines patches to apply
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
X-List-Received-Date: Wed, 04 Jan 2012 00:00:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2011 07:18 PM, Christopher Larson wrote:
> Pushed an updated version of the patch-refactor commit that should fix this.
> --
> Christopher Larson
>
> On Tuesday, December 27, 2011 at 1:38 PM, Chris Larson wrote:
>
>> On Tue, Dec 27, 2011 at 1:33 PM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>> Do you need to pass d here?
>>>
>>> I am seeing errors (see
>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/295/steps/shell_14/logs/stdio)
>>
>> Bah, indeed, apparently my testing didn't hit any recipes using
>> minrev/maxrev/notrev. Will rework the patch. Grr.

Merged the Updated version to OE-Core

Thanks
	Sau!


