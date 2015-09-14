Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5E4173D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 15:36:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 08:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,529,1437462000"; d="scan'208";a="804888487"
Received: from aomotosh-mobl3.amr.corp.intel.com (HELO [10.254.14.204])
	([10.254.14.204])
	by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2015 08:36:08 -0700
Message-ID: <55F6E9BE.8030701@linux.intel.com>
Date: Mon, 14 Sep 2015 10:37:34 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>	
	<7f18159f085ddebd9b4dd58912b83c83f092b10e.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1442095230.18370.2.camel@linuxfoundation.org>
In-Reply-To: <1442095230.18370.2.camel@linuxfoundation.org>
Cc: leonardo.sandoval.gonzalez@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/3] iasl: Recipe taken from the luv-yocto repository
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
X-List-Received-Date: Mon, 14 Sep 2015 15:36:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/12/2015 05:00 PM, Richard Purdie wrote:
> On Tue, 2015-07-14 at 20:07 +0000,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Taken from [1]. ACPICA is licensed under two main licenses:
>> 1) An Intel license (Intel-ACPI) and 2) a dual GPL/BSP license. This
>> recipe uses the latter.
>>
>> [1] https://github.com/01org/luv-yocto/tree/master/meta-luv/recipes-extended/iasl
>>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>> ---
>>   meta/recipes-extended/iasl/iasl_20150515.bb | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb
>
> Sadly this and the ovmf patch trigger failures in world and world-lsb
> builds:

RP, Working on it. I will send an update ASAP.

>
> https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/495
> https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/builds/213
>
> Cheers,
>
> Richard
>

