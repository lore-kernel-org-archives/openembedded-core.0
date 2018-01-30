Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3895F784F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 14:20:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2018 06:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,435,1511856000"; d="scan'208";a="13705188"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 30 Jan 2018 06:20:10 -0800
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
	<48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <32b564ff-9cad-370f-48b1-389bf69e2ffb@linux.intel.com>
Date: Tue, 30 Jan 2018 16:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Tue, 30 Jan 2018 14:20:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/30/2018 09:07 AM, Khem Raj wrote:

>> I disagree. Expanding HOSTTOOLS just to cater to the needs of a single 
>> recipe is not optimal, IMO.
> 
> alternative are
> build time dep on coreutils-native.
> fix uboot script to not use comm
> do not invoke check-config.sh at all.
> 
> none of them are any better.

Before we can declare that, we need to look what comm is actually used 
for during build, and why its absence is not a problem and doesn't cause 
errors.

Consider also that using comm from host may break reproducibility, if 
absence or presence of comm on the host results in a different output 
from the build.

Alex

