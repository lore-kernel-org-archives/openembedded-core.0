Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A6EB1608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:38:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2016 05:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="950710930"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2016 05:38:50 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1461304177.git.liezhi.yang@windriver.com>
	<bc384f220d721314dc66c998a44b7019372e84e4.1461304177.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <571A1B73.4040802@linux.intel.com>
Date: Fri, 22 Apr 2016 15:39:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <bc384f220d721314dc66c998a44b7019372e84e4.1461304177.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/4] webkitgtk: set COMPATIBLE_HOST_armv4 to null
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
X-List-Received-Date: Fri, 22 Apr 2016 12:38:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/22/2016 08:50 AM, Robert Yang wrote:
> It doesn't build with armv4:
> {standard input}: Assembler messages:
> {standard input}:52: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
> {standard input}:126: Error: selected processor does not support `bkpt #0' in ARM mode
> {standard input}:128: Error: selected processor does not support `blx r0' in ARM mode
> {standard input}:134: Error: selected processor does not support `bkpt #0' in ARM mode
> {standard input}:185: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
> {standard input}:256: Error: selected processor does not support `blx r4' in ARM mode
> {standard input}:310: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
> {standard input}:311: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
> {standard input}:315: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
> {standard input}:316: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
> [snip]

Can you try disabling JIT instead like is done for ARMv5/6?

Alex


