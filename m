Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TPKGU-0006h9-Q5
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 23:37:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Oct 2012 14:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,617,1344236400"; d="scan'208";a="158231794"
Received: from unknown (HELO [10.255.14.107]) ([10.255.14.107])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Oct 2012 14:24:35 -0700
Message-ID: <5081C512.1060301@linux.intel.com>
Date: Fri, 19 Oct 2012 14:24:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1350571171.git.bruce.ashfield@windriver.com>
	<7b8c12ae454f69996f935aef35cccc6d352b0964.1350571171.git.bruce.ashfield@windriver.com>
	<1350573146.2520.2.camel@ted> <50802FC0.7060803@windriver.com>
In-Reply-To: <50802FC0.7060803@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel.bbclass: remove explicit version.h target
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
X-List-Received-Date: Fri, 19 Oct 2012 21:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2012 09:35 AM, Bruce Ashfield wrote:
> On 12-10-18 11:12 AM, Richard Purdie wrote:
>> On Thu, 2012-10-18 at 10:47 -0400, Bruce Ashfield wrote:
>>> The compilation routine for the kernel has an explicit call to
>>> build version.h, which works fine for most kernels, but the
>>> location of it has recently changes.
>>>
>>> commit d183e6f5 [UAPI: Move linux/version.h]
>>> commit 10b63956 [UAPI: Plumb the UAPI Kbuilds into the user
>>>                   header installation and checking]
>>>
>>> moves the file to include/generated/linux/version.h and then to
>>> include/generated/uapi/linux/version.h.
>>>
>>> As a result kernel builds of 3.7 or bisection builds of intermediate
>>> kernel commits will fail with:
>>>
>>>    make[2]: *** No rule to make target `include/linux/version.h'.  Stop.
>>>
>>> Making the explicit version.h build conditional on the version, or
>>> via a file test would fix the problem, but it introduces some complexity
>>> to the build.
>>>
>>> Even without an explicit call to build version.h, it is always produced
>>> by the kernel build, so it can simply be removed.
>>>
>>> Note: it isn't clear why the explicit build of version.h was originally
>>> required, but the prep phases of the kernel have changed significantly,
>>> so it should no longer be required.
>>
>> I had a look through the archives. I think this is a throwback to 2.4,
>> we had to build the version.h file to figure out if we had a 2.6 or a
>> 2.4 kernel, then we could do the right thing to build it.
>>
>> Since we don't support 2.4 anymore, this can die!
>
> That makes my day.
>
> Should I resend, or is the RFC patch enough ?
>
Nope, It's merged into OE-Core

Thanks
	Sau!

> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


