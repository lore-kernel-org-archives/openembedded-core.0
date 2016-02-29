Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED267708E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:38:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Feb 2016 06:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="926220210"
Received: from unknown (HELO [10.219.25.111]) ([10.219.25.111])
	by fmsmga002.fm.intel.com with ESMTP; 29 Feb 2016 06:38:44 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
	<1456561971.11498.124.camel@linuxfoundation.org>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <56D45841.1090105@linux.intel.com>
Date: Mon, 29 Feb 2016 08:40:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456561971.11498.124.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Mon, 29 Feb 2016 14:38:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/27/2016 02:32 AM, Richard Purdie wrote:
> On Thu, 2016-02-25 at 23:34 +0000, Alejandro Hernandez wrote:
>> udev has started to fail on new kernels (4.4), due to being
>> deprecated in favor
>> of systemd's udev implementation. To maintain a sysvinit alternative
>> we also
>> need to provide an alternative to udev. Eudev is a fork of systemds
>> udev,
>> this new eudev recipe provides upstream udev 220 funcitonality.
>>
>> - libgudev is not provided by eudev as it was with udev before
>> - We can now drop usbutils_007 since usbutils_008 is now compatible
>>    also with eudev, and not only with systemd's udev
>> - Adds new eudev package to maintainers.inc
> This doesn't correctly handle multlibs:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
> lds/675/steps/BuildImages_2/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
> lds/675/steps/BuildImages_3/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
> lds/675/steps/Running%20Sanity%20Tests_1/logs/stdio
>
> The issue is that these files should be installed into /lib/udev
> regardless of the multilib, they're common files, I think there is a
> "nonarch" variable with the correct directory name in it.
OK, I will look into this, thanks Richard.

>
> Cheers,
>
> Richard


