Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E20D96B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 22:38:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jan 2014 14:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,665,1384329600"; d="scan'208";a="439477852"
Received: from unknown (HELO [10.255.12.135]) ([10.255.12.135])
	by orsmga001.jf.intel.com with ESMTP; 15 Jan 2014 14:37:52 -0800
Message-ID: <52D70DC0.3060709@linux.intel.com>
Date: Wed, 15 Jan 2014 14:37:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
	<1389752246-4296-4-git-send-email-paul@paulbarker.me.uk>
	<52D6A554.2050705@linux.intel.com>
	<CANyK_8cBWSps_v=eF-ktk6YbUKo76KfGTufa09m2gVsgQk7NRQ@mail.gmail.com>
In-Reply-To: <CANyK_8cBWSps_v=eF-ktk6YbUKo76KfGTufa09m2gVsgQk7NRQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] opkg: No longer PROVIDES update-alternatives
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
X-List-Received-Date: Wed, 15 Jan 2014 22:38:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2014 08:13 AM, Paul Barker wrote:
> On 15 January 2014 15:12, Saul Wold <sgw@linux.intel.com> wrote:
>> On 01/14/2014 06:17 PM, Paul Barker wrote:
>>>
>>> The new provider is the opkg-utils recipe.
>>>
>> This seems to have triggered a failure on the AB:
>>
>> | Computing transaction...error: Can't install
>> nativesdk-shadow-4.1.4.3-r13@i686_nativesdk: no package provides
>> nativesdk-update-alternatives-opkg
>>
>
> I've not really done much with nativesdk, but my guess is I just need to change
>
>      BBCLASSEXTEND = "native"
>
> to
>
>      BBCLASSEXTEND = "native nativesdk"
>
> in the opkg-utils recipe so that nativesdk-* packages are built for
> that recipe. Does that sound correct? If so, I'll re-spin the patches
> with that change.
>
Yup, that's it, aslo why did you locate opkg-utils in a separate 
directory from opkgs itself?  Is there a reason they can't co-locate?

Sau!


