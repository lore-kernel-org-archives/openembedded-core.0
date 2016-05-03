Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5F76011A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 11:26:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2016 04:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="967607901"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2016 04:26:03 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1461761088-15117-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAMKF1spLRX=XrS+Kf8GeC=XufwtTPxQJ-oeEQHH1ay2sOZb4Wg@mail.gmail.com>
	<5727269A.30405@linux.intel.com>
	<95CD514D-A18A-4D04-9A00-AD1034D843EA@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <57288AF0.5010303@linux.intel.com>
Date: Tue, 3 May 2016 14:26:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <95CD514D-A18A-4D04-9A00-AD1034D843EA@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-powerpc64.inc: disable the use of qemu usermode on ppc64
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
X-List-Received-Date: Tue, 03 May 2016 11:26:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2016 06:46 PM, Khem Raj wrote:

>>> should we replace qemu-ppc with qemu-ppc64 instead of disabling it
>>
>> qemu-ppc64 is already used on 64 bit powerpc, the problem is that it always crashes.
>
> Do we need to adjust the emulated machine parameter ?

I don't see how. The CPU list produced by 'qemu-ppc64 -cpu help' does 
not include anything that resembles e5500/6500 or Power5/6/7 (the 64 bit 
ppc chips that oe-core has definitions for), and I'm not a powerpc 
expert by any measure, so I can't investigate the problem any further. 
It needs to be looked at by someone who is actually working with that 
hardware.

The best we can do now is disable use of qemu, so that builds that 
target ppc64 don't fail.

Alex


