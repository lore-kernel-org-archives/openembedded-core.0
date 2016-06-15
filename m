Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3E60D73196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 21:01:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2016 14:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,477,1459839600"; d="scan'208";a="828833285"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by orsmga003.jf.intel.com with ESMTP; 15 Jun 2016 14:01:05 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
	<CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com>
	<57608079.2020008@linux.intel.com>
	<CAMKF1sp583CejzXNPSVwHVB-fDXfDN_q-PbG=4bt+04m8HKg2g@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <5761C211.6050604@linux.intel.com>
Date: Wed, 15 Jun 2016 16:01:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp583CejzXNPSVwHVB-fDXfDN_q-PbG=4bt+04m8HKg2g@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Jun 2016 21:01:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/15/2016 03:47 PM, Khem Raj wrote:
> On Tue, Jun 14, 2016 at 3:08 PM, Mariano Lopez
> <mariano.lopez@linux.intel.com> wrote:
>> If we're just running ping/ssh/selftest, can the image be something a lot
>> smaller such as core-image-base?
>>
>> Ross
>>
>>
>> Unfortunately, base or minimal don't have ssh installed, and ssh it is
>> required for the runtime tests.
>> I could add the ssh to DISTRO_FEATURES but personally I think that is not
>> clean. What do you think?
> Can ssh be added to images automatically if testing is enabled ?

IMO that is not a good practice, because the image being tested is 
polluted with packages not meant to be there.

Mariano

