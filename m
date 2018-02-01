Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 11CBB78682
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:39:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 06:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="27263189"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2018 06:39:31 -0800
To: Mauno Niko <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
	<48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
	<32b564ff-9cad-370f-48b1-389bf69e2ffb@linux.intel.com>
	<8812d964-49f1-b18f-751a-bcdffac028c0@vaisala.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <37022525-6de2-9522-7423-70745cd5cb62@linux.intel.com>
Date: Thu, 1 Feb 2018 16:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <8812d964-49f1-b18f-751a-bcdffac028c0@vaisala.com>
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
X-List-Received-Date: Thu, 01 Feb 2018 14:39:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/01/2018 01:36 PM, Mauno Niko wrote:
>> Before we can declare that, we need to look what comm is actually used
>> for during build, and why its absence is not a problem and doesn't cause
>> errors.
>>
>> Consider also that using comm from host may break reproducibility, if
>> absence or presence of comm on the host results in a different output
>> from the build.
> 
> My patch initially did add coreutils-native to u-boot DEPENDS.
> 
> Should I resubmit it? (did not apply due to mismatch in recipe filename (version))

RP has already merged the patch you sent, I think :)

Still, in my opinion - yes, it's better to undo the HOSTTOOLS change, 
and add coreutils-native. But first, research a bit further for what 
purpose comm is used during build and why its absence doesn't break it.

Alex


