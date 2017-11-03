Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3F89A7017B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 09:03:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 03 Nov 2017 02:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,337,1505804400"; d="scan'208";a="1033046646"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 03 Nov 2017 02:03:17 -0700
To: Andre McCurdy <armccurdy@gmail.com>,
	Zhixiong Chi <zhixiong.chi@windriver.com>
References: <1509440578-173066-1-git-send-email-zhixiong.chi@windriver.com>
	<4903a7b3-5039-9b7c-9372-37f10d555b9c@linux.intel.com>
	<59F846E4.3050003@windriver.com>
	<CAJ86T=UnT5woKyTFC82_O0kycoqPufavbOvduRXy4_9F0hWS4Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1ce560f5-8efb-1058-7c51-ece82f8d16e4@linux.intel.com>
Date: Fri, 3 Nov 2017 11:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UnT5woKyTFC82_O0kycoqPufavbOvduRXy4_9F0hWS4Q@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: CVE-2017-13089 and CVE-2017-13090
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
X-List-Received-Date: Fri, 03 Nov 2017 09:03:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/02/2017 10:29 PM, Andre McCurdy wrote:
>>> Update the master to 1.19.2 instead please.
> 
> Patching 1.19.1 does have the advantage of creating a commit which can
> easily be cherry-picked into rocko (and pyro, which also uses wget
> 1.19.1).

Yes, but this is coincidental. If the versions wouldn't exactly match, 
cherry-picking would not be possible.

> Master should certainly update to 1.19.2 but doing so in two steps
> might be appreciated by the stable branch maintainers.

When fixing CVEs, the yocto branches should be considered separately, 
and patched all at the same time by the same person. For master, 
updating to latest upstream release without the vulnerability is the 
best, as it lessens the load on people who have to keep master up to 
date. For stable branches, it depends. If the upstream maintains a 
stable branch themselves where cves and other bugs are fixed, I think we 
should trust that rather than backport patches.


Alex

