Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 65BCE6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:12:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2015 14:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,410,1444719600"; d="scan'208";a="869150151"
Received: from bitbang.jf.intel.com (HELO [10.7.199.175]) ([10.7.199.175])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2015 14:12:46 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1449693306.git.randy.e.witt@linux.intel.com>
	<49ad2cee12cc6fdf471ea3e600afb7949138beb6.1449693306.git.randy.e.witt@linux.intel.com>
	<CAJTo0LbpvDC-NZrKkAmVMan17-DNLptSKUhagrPzA3LcundFNQ@mail.gmail.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <5669F8DD.9010108@linux.intel.com>
Date: Thu, 10 Dec 2015 14:12:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbpvDC-NZrKkAmVMan17-DNLptSKUhagrPzA3LcundFNQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][master][PATCH 1/1] uninative.bbclass: Choose the correct loader based on BUILD_ARCH
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
X-List-Received-Date: Thu, 10 Dec 2015 22:12:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2015 02:01 PM, Burton, Ross wrote:
> On 9 December 2015 at 20:50, Randy Witt <randy.e.witt@linux.intel.com>
> wrote:
>
>> -UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"
>> +UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64',
>> '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2',
>> '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
>>
>
> Would it be neater, and more flexible when other arches are different
> (specifically I'm thinking of aarch64 here) to do:
>
> UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux.so.2"
> UNINATIVE_LOADER_x86-64 = "'${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"

Yes, I like that better. I'll check the override and test it again.

> At least I think that overload is correct...
>
> Ross
>


