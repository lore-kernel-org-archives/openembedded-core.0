Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 89A1277277
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:37:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 24 Feb 2016 04:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,493,1449561600"; d="scan'208";a="658505636"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2016 04:37:16 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
	<CA+chaQe460XR_hNRMS3MyUh5KGMWjykiQKnVOh58FAg2zk0WVQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56CDA358.8070108@linux.intel.com>
Date: Wed, 24 Feb 2016 14:34:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQe460XR_hNRMS3MyUh5KGMWjykiQKnVOh58FAg2zk0WVQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] ffmpeg: update to 2.8.6
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
X-List-Received-Date: Wed, 24 Feb 2016 12:37:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2016 03:55 AM, Martin Jansa wrote:
> Fails to build for qemuarm when thumb is enabled.
>
> Why was:
> ARM_INSTRUCTION_SET = "arm"
>
> removed in
> http://git.openembedded.org/openembedded-core/commit/?id=77dbf07293df15cd5473422abd678930d6277bb0
>
> without checking if it works?

That line has no explanation of its intent and dates back to before 
2009. I had also checked that ffmpeg builds fine with default qemuarm 
configuration (and just checked that it still does), so it was dropped 
as old cruft.

I see that 'thumb' is in TUNE_FEATURES for qemuarm, but not sure if that 
is same as 'thumb is enabled'. How do I make it break?

Alex



