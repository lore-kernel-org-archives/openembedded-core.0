Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDC573180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 14:52:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2016 06:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,325,1449561600"; d="scan'208";a="895411053"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2016 06:52:50 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
	<cover.1453217744.git.alexander.kanavin@linux.intel.com>
	<5f464411a18a53b395e749b2b3a1fbfaab4ffd74.1453217744.git.alexander.kanavin@linux.intel.com>
	<D70F5507-7ED6-4281-8FC9-4BFE9EAD0B72@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56A0F02B.9000600@linux.intel.com>
Date: Thu, 21 Jan 2016 16:50:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <D70F5507-7ED6-4281-8FC9-4BFE9EAD0B72@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/12] nss: update to 3.21
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
X-List-Received-Date: Thu, 21 Jan 2016 14:52:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2016 09:05 PM, Khem Raj wrote:
>> +    export NSS_DISABLE_GTESTS=1
>> +
>
> this export is appearing twice
> can it be optimized ?

I'm only following the pattern in the nss recipe: it has custom 
do_compile() and do_install() sections which to a large extend duplicate 
each other. Eliminating this duplication was not a goal, I just wanted 
to update to latest upstream.

Alex


