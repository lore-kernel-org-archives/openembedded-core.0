Return-Path: <california.l.sullivan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7081D60557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 22:02:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 19 Sep 2016 15:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,364,1470726000"; d="scan'208";a="11136664"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga005.jf.intel.com with ESMTP; 19 Sep 2016 15:02:17 -0700
To: Saul Wold <saul.wold@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
	<CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
	<CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
	<db821c4f-4099-94de-f2d2-17ddf2486bbc@intel.com>
	<CAJTo0LYTP5LGgxDxJj1Y+88YnoXDQa8G7yD2QyU5dF3kKN+1TQ@mail.gmail.com>
	<3b43b291-4f81-f801-4f23-cf5647bd37fb@intel.com>
	<6c08189b-9ac1-d239-c324-c9d04e38ed2d@windriver.com>
	<1474318190.24399.19.camel@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <28095475-0487-d01c-e90e-147f03091758@intel.com>
Date: Mon, 19 Sep 2016 15:02:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474318190.24399.19.camel@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Mon, 19 Sep 2016 22:02:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I don't have time to smoke test a SRCREV update for so many machines 
right now, so I think for now I will just set the correct PV in the 
various linux-yocto recipes so we don't block master-next builds.

Is this acceptable?

Thanks,
Cal

On 09/19/2016 01:49 PM, Saul Wold wrote:
> On Mon, 2016-09-19 at 15:55 -0400, Bruce Ashfield wrote:
>> On 2016-09-19 03:53 PM, Cal Sullivan wrote:
>>> Yep, these all have incorrect PVs.
>>> 628bf62756 Merge tag 'v4.4.11' into standard/base
>>> The problem seems fairly wide spread.
>>>
>>> Bruce, do you suggest updating PVs or updating the SRCREVs (is
>>> there a
>>> good reason to keep using old SRCREVs?)?
>> Updating the SRCREVs is the right thing to do to sync them up now.
>>
>> but ..
>>
>> at the same time, they should probably have their own PVs, since
>> next time up update 4.4.x, they'll fall out of sync and fail again.
>>
> +1, I think that these need their own PV since they also don't update
> as fast as the base qemu recipes do.
>
> Sau!
>
>> We want them to be aligned with the latest -stable, but we also
>> don't need failures every time I push a new SRCREV and update the
>> PV of the base recipe.
>>
>> Bruce
>>
>>>
>>> ---
>>> Cal
>>>
>>>
>>> On 09/19/2016 11:54 AM, Burton, Ross wrote:
>>>>
>>>> On 19 September 2016 at 18:05, Cal Sullivan
>>>> <california.l.sullivan@intel.com
>>>> <mailto:california.l.sullivan@intel.com>> wrote:
>>>>
>>>>      It looks like the function is doing as its supposed to, and
>>>> we
>>>>      need to update some PVs or SRCREVs to match PVs.
>>>>
>>>>      E.g., on the error below, SRCREV d6237b3b24 is indeed 4.1.31.
>>>>
>>>>
>>>> And some more builders failed with 4.4:
>>>>
>>>> ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
>>>> do_kernel_version_sanity_check: Package Version
>>>> (4.4.20+gitAUTOINC+e66032e2d9_628bf62756) does not match of
>>>> kernel
>>>> being built (4.4.11). Please update the PV variable to match the
>>>> kernel source.
>>>> ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
>>>> do_kernel_version_sanity_check: Function failed:
>>>> do_kernel_version_sanity_check (log file is located at
>>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>>>> arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-
>>>> yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-
>>>> r0/temp/log.do_kernel_version_sanity_check.30210)
>>>> NOTE: recipe usbutils-008-r0: task do_fetch: Started
>>>> ERROR: Logfile of failure stored in:
>>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>>>> arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-
>>>> yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-
>>>> r0/temp/log.do_kernel_version_sanity_check.30210
>>>> ERROR: Task
>>>> (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>>>> arm/build/meta/recipes-kernel/linux/linux-
>>>> yocto_4.4.bb:do_kernel_version_sanity_check)
>>>> failed with exit code '1'
>>>>
>>>> (ditto for ppc and x86)
>>>>
>>>> Ross


