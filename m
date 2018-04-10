Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFAF749F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 07:36:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 00:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="42115415"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 Apr 2018 00:36:09 -0700
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <00d1380c-5cd8-b062-1abf-b09b330b04a8@linux.intel.com>
Date: Tue, 10 Apr 2018 10:29:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: Re: [PATCH] oe-selftest: runqemu: add tests for qemu boot and shutdown
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
X-List-Received-Date: Tue, 10 Apr 2018 07:36:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/09/2018 08:43 PM, Yeoh Ee Peng wrote:
> QA team were testing qemu boot image and shutdown on each
> qemu architecture manually. Add automated test to test qemu boot on
> ext4 and nfs, finally check that it can shutdown properly.
> 
> Original runqemu tests was dedicated for MACHINE=qemux86-64 and
> it was testing various live image (iso and hddimg) will be able
> to boot while live image was not supported on all qemu architecture.
> 
> The new tests were designed as a separate class as this tests
> focus on testing qemu boot and shutdown on each qemu architecture.
> Furthermore, this tests focus on testing qemu could shutdown
> as expected.

1. I believe the clock on the machine that you use to send the patches 
isn't set correctly, it seems to be several hours in the past.

2. What I meant is that you comment the source code itself, not write a 
longer commit message. So that anyone reading the actual file can 
quickly figure out why there are two classes and what they test. 
Basically take the above, and write it down as comments in the actual 
file; take your time to write a nice, clear explanation (similar to what 
we discussed). Then the commit message can be more brief, basically the 
first paragraph above is enough.

The reason for this is that commit history is less obvious or convenient 
to use when you want to find explanations. You can certainly use 'git 
log <filename>', but it comes with lots of irrelevant commits, and if 
the code was restructured in the past, then the history of changes stops 
there.

Alex

