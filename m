Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 60C636E630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:14:44 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Oct 2017 04:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,431,1503385200"; d="scan'208";a="167370121"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2017 04:14:45 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Joe Slater <jslater@windriver.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
Date: Wed, 25 Oct 2017 14:14:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Wed, 25 Oct 2017 11:14:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/25/2017 02:43 AM, Andre McCurdy wrote:
> On Tue, Oct 24, 2017 at 4:23 PM, Joe Slater <jslater@windriver.com> wrote:
>> qemu-usermode is only available for mips64 and o32 code.
> 
> Isn't that already handled by meta/conf/machine/include/mips/arch-mips.inc
> 
>    # user mode qemu doesn't support mips64 n32: "Invalid ELF image for
> this architecture"
>    MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "
> ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"

Yes, but this is really unreadable isn't it :) I don't see how anyone 
could grasp that the above means "remove qemu-usermode from 
MACHINE_FEATURES if n32 is in TUNE_FEATURES" (without diving into 
documentation).

Any better way to express this would be appreciated.

Alex

