Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DF92875CB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 17:03:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2015 10:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,379,1432623600"; d="scan'208";a="720433585"
Received: from ashussai-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.105.108])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2015 10:02:41 -0700
Message-ID: <5592CBB0.4010701@linux.intel.com>
Date: Tue, 30 Jun 2015 10:02:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1435623417-18133-1-git-send-email-juro.bystricky@intel.com>	<CAJTo0LaOUcu7qRdmYvXm3jqoYQx48_wsKRDM5bxsMZVj_ew-CQ@mail.gmail.com>
	<1435660700.7287.84.camel@intel.com>
In-Reply-To: <1435660700.7287.84.camel@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: OpenSUSE 13.2 configure error
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
X-List-Received-Date: Tue, 30 Jun 2015 17:03:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2015 03:38 AM, Richard Purdie wrote:
> On Tue, 2015-06-30 at 11:32 +0100, Burton, Ross wrote:
>>
>> On 30 June 2015 at 01:16, Juro Bystricky <juro.bystricky@intel.com>
>> wrote:
>>          Qemu configure tests for the presence/existance of SDL by
>>          trying to link against libSDL. libSDL in turn attempts to load
>>          libcrypt which will then attempt to load libgpg-error.
>>          The bitbaked libgpg-error will be built with ABI incompatible
>>          with the one required by libcrypt.
>>          The remedy is to force qemu configure to use the host's
>>          libgpg-error instead. This is achieved by modifying the linker
>>          library search order.
>>
>> I think seeing this summary will send Saul into a quivering wreck as
>> this was a massive source of pain in the previous release.
>> Interesting solution but I'd like Saul's opinion.
>>
> If backporting this means we don't have to reconfigure the autobuilder
> to run old releases, Saul, Beth and I are likely all in favour.

The quivering stop long ago when I handed this off to Juro!  I am all in 
favor of this patch and a backport.

Thanks Juro for figuring this out.

Sau!

>>
>> The patch should probably only be applied for native and nativesdk
>> builds, as I suspect that's going to break a target build quite badly.
>> Also, it needs signed-of-by and upstream-status (inappropriate, I
>> imagine) tags in the patch header.
>
> It needs a description and the patch should be native only, not
> nativesdk which should link against the sysroot.
>


> Cheers,
>
> Richard
>

