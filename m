Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rrvun-0004ND-V4
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 19:25:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 10:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="101956845"
Received: from mkgumbel-mobl5.jf.intel.com (HELO [10.7.199.151])
	([10.7.199.151])
	by orsmga001.jf.intel.com with ESMTP; 30 Jan 2012 10:17:24 -0800
Message-ID: <4F26DEB2.40304@linux.intel.com>
Date: Mon, 30 Jan 2012 10:17:22 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
	<4F26D85A.8030908@linux.intel.com>
	<1327946189.29933.86.camel@phil-desktop>
In-Reply-To: <1327946189.29933.86.camel@phil-desktop>
Subject: Re: [PATCH 1/2] alsa-state: fix RDEPENDS assignment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2012 18:25:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 30/01/12 09:56, Phil Blundell wrote:
> On Mon, 2012-01-30 at 09:50 -0800, Joshua Lock wrote:
>> Yikes, I don't know why I keep making this mistake. Thanks for catching
>> it Koen.
>>
>> I thought we caught this in a QA error but I definitely didn't see it,
>> best investigate.
>
> It seems that Yocto doesn't enable those checks.  Possibly it should, or
> maybe we should just turn them on by default for everybody.

Personally, I feel that this check is useful enough to be turned on by 
default.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


