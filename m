Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4184265D52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:17:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Apr 2014 13:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,885,1389772800"; d="scan'208";a="420886447"
Received: from rmcintyr-mobl.ger.corp.intel.com (HELO [10.255.12.108])
	([10.255.12.108])
	by azsmga001.ch.intel.com with ESMTP; 18 Apr 2014 13:17:31 -0700
Message-ID: <5351885B.5090806@linux.intel.com>
Date: Fri, 18 Apr 2014 13:17:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: gary.robertson@linaro.org, openembedded-core@lists.openembedded.org
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
In-Reply-To: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org, clark.williams@gmail.com
Subject: Re: [PATCH] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Fri, 18 Apr 2014 20:17:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2014 01:12 PM, gary.robertson@linaro.org wrote:
> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> cyclictest was updated to correct some problems with CPU affinity selection
> and display of help and/or execution details.
> These patches were accepted by the maintainer of the cyclictest utility.
> The changes were reflected in an updated release of rt-tests - v0.89
> The cyclictest changes were successfully tested on both an ARM v7 and x86_64
> host environments.
> The OE recipe was updated locally to incorporate the updated rt-tests release
> and the resulting builds were verified for the same ARM v7 target
> and for qemux86.
> This patch set was then generated from the local commit for the recipe update
> and is now submitted for your review and hopefully your approval.
>
>
Can you move some of these comments into the actual commit message, 
these would be good to have with the update commit.

Thanks
	Sau!

> Anders Roxell (1):
>    rt-tests: bump version 0.87 => 0.89
>
>   meta/recipes-rt/rt-tests/rt-tests.inc              |    7 ++-----
>   .../{rt-tests_0.87.bb => rt-tests_0.89.bb}         |    0
>   2 files changed, 2 insertions(+), 5 deletions(-)
>   rename meta/recipes-rt/rt-tests/{rt-tests_0.87.bb => rt-tests_0.89.bb} (100%)
>

