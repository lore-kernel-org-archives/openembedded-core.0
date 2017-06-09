Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2B527833B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 20:58:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 13:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,319,1493708400"; d="scan'208";a="978952835"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2017 13:58:32 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1497006675.git.alexander.kanavin@linux.intel.com>
	<469831ab169cb0c7a7de2a5f5a5e7f4b4b40c4fe.1497006675.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LakpwMpac5hsJzxMEWWQyBVb4HqQkFpL0OpzNbWn702kw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e8331cde-c735-e18f-05cf-dc2a03a94359@linux.intel.com>
Date: Fri, 9 Jun 2017 23:58:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LakpwMpac5hsJzxMEWWQyBVb4HqQkFpL0OpzNbWn702kw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/2] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Fri, 09 Jun 2017 20:58:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2017 07:32 PM, Burton, Ross wrote:
>
> On 9 June 2017 at 12:13, Alexander Kanavin
> <alexander.kanavin@linux.intel.com
> <mailto:alexander.kanavin@linux.intel.com>> wrote:
>
>     This greatly reduces build times when there is a large amount of small
>     rpm packages to produce. The patches are rather invasive,
>     and so will be submitted upstream.
>
>
> Sorry but I broke this in the same way as I did before...

Needless to say, this worked flawlessly here, many times over. It seems 
that failures might be specific to gcc 4.x (I have 6.x here), so I'll 
try to get a failure using that. The nasty bit about openmp is that

#pragma omp unsupported_directive_from_latest_standard

will trigger nothing with compilers that are too old to support it.

Alex


