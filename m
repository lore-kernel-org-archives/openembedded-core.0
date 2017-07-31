Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 02FB678237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:20:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 31 Jul 2017 03:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,441,1496127600"; d="scan'208";a="293669361"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2017 03:20:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
	<CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
	<CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
	<287709d4-1010-10fa-fd94-929e4c465e49@linux.intel.com>
	<1501494217.18633.0.camel@linuxfoundation.org>
	<6b824286-9d84-5b3c-3106-40b35bc4050b@linux.intel.com>
Message-ID: <b80a80e1-1384-3702-fe94-61315c502f85@linux.intel.com>
Date: Mon, 31 Jul 2017 13:18:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <6b824286-9d84-5b3c-3106-40b35bc4050b@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Mon, 31 Jul 2017 10:20:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/31/2017 12:53 PM, Alexander Kanavin wrote:
> The only thing I found was this email:
> http://lists.gnu.org/archive/html/bug-gperf/2017-01/msg00004.html
> which was ignored by upstream.
> 
> However, both debian testing and fedora rawhide have gperf 3.1, so I'm 
> not sure how they made it work. I'm running debian here, so can look 
> into this.

Right. Debian dropped the updated gperf package into repositories, but 
did not rebuild anything that relies on it. When I tried that with 
libcap, I got the exact same error as we've seen.

Not sure what's going to happen when they discover the incompatibility. 
I'm a bit surprised they don't do such dependency rebuilds when changes 
are introduced.

Alex

