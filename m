Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD1FB6FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 13:02:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 06:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,338,1498546800"; d="scan'208";a="887424092"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2017 06:02:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-3-alexander.kanavin@linux.intel.com>
	<CAJTo0LZPE-vj-+4ud=L8n5JiEKYdhFHod6dsox90ULghcvOaWA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <770aa4a4-d872-a701-82c4-ba880652976b@linux.intel.com>
Date: Mon, 7 Aug 2017 15:59:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZPE-vj-+4ud=L8n5JiEKYdhFHod6dsox90ULghcvOaWA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] btrfs-tools: update to 4.12
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
X-List-Received-Date: Mon, 07 Aug 2017 13:02:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/07/2017 03:59 PM, Burton, Ross wrote:

>     +-      $(Q)$(CC) $(CFLAGS) $< -o $@
>     ++      $(Q)$(BUILD_CC) $(CFLAGS) $< -o $@
> 
> 
> This won't work when CFLAGS contains arguments that the host compiler 
> doesn't recognise, or are inappropriate.

Right, should've been BUILD_CFLAGS? Can you amend the patch in-place?

Alex

