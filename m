Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAF6601A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 21:16:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 15 Jun 2016 14:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,477,1459839600"; d="scan'208";a="976526636"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by orsmga001.jf.intel.com with ESMTP; 15 Jun 2016 14:16:24 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
	<CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com>
	<57608079.2020008@linux.intel.com>
	<CAMKF1sp583CejzXNPSVwHVB-fDXfDN_q-PbG=4bt+04m8HKg2g@mail.gmail.com>
	<5761C211.6050604@linux.intel.com>
	<CAMKF1soZoS9fBShVDOdQ31FMijXY4PJ-LAf1dCrXwO+MW5NXoA@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <5761C5A9.2020300@linux.intel.com>
Date: Wed, 15 Jun 2016 16:16:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soZoS9fBShVDOdQ31FMijXY4PJ-LAf1dCrXwO+MW5NXoA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] selftest/runtime-test.py: Add test for import test from other layers
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
X-List-Received-Date: Wed, 15 Jun 2016 21:16:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/15/2016 04:05 PM, Khem Raj wrote:
> On Wed, Jun 15, 2016 at 2:01 PM, Mariano Lopez
> <mariano.lopez@linux.intel.com> wrote:
>>
>> On 06/15/2016 03:47 PM, Khem Raj wrote:
>>> On Tue, Jun 14, 2016 at 3:08 PM, Mariano Lopez
>>> <mariano.lopez@linux.intel.com> wrote:
>>>> If we're just running ping/ssh/selftest, can the image be something a lot
>>>> smaller such as core-image-base?
>>>>
>>>> Ross
>>>>
>>>>
>>>> Unfortunately, base or minimal don't have ssh installed, and ssh it is
>>>> required for the runtime tests.
>>>> I could add the ssh to DISTRO_FEATURES but personally I think that is not
>>>> clean. What do you think?
>>> Can ssh be added to images automatically if testing is enabled ?
>>
>> IMO that is not a good practice, because the image being tested is polluted
>> with packages not meant to be there.
> I thought you mentioned that ssh is required for testing, I dont see
> that as polluting.
> and its only added to image with have ptest turned on.

This is for testimage/testexport and there is a TEST_SUITE specific for 
minimal image.

If the resource consumption seems to be the problem; adding ssh to 
minimal or base would trigger the build of a new rootfs/image; in the 
other hand is very likely core-image-sato is already built when running 
this test.

