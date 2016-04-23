Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36BCE6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Apr 2016 01:40:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3N1eb5m029688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Apr 2016 18:40:37 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 22 Apr 2016 18:40:36 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1461304177.git.liezhi.yang@windriver.com>
	<bc384f220d721314dc66c998a44b7019372e84e4.1461304177.git.liezhi.yang@windriver.com>
	<571A1B73.4040802@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571AD293.4040907@windriver.com>
Date: Sat, 23 Apr 2016 09:40:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <571A1B73.4040802@linux.intel.com>
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
X-List-Received-Date: Sat, 23 Apr 2016 01:40:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/22/2016 08:39 PM, Alexander Kanavin wrote:
> On 04/22/2016 08:50 AM, Robert Yang wrote:
>> It doesn't build with armv4:
>> {standard input}: Assembler messages:
>> {standard input}:52: Error: selected processor does not support `blx
>> llint_throw_stack_overflow_error' in ARM mode
>> {standard input}:126: Error: selected processor does not support `bkpt #0' in
>> ARM mode
>> {standard input}:128: Error: selected processor does not support `blx r0' in
>> ARM mode
>> {standard input}:134: Error: selected processor does not support `bkpt #0' in
>> ARM mode
>> {standard input}:185: Error: selected processor does not support `blx
>> llint_throw_stack_overflow_error' in ARM mode
>> {standard input}:256: Error: selected processor does not support `blx r4' in
>> ARM mode
>> {standard input}:310: Error: selected processor does not support `movw
>> r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>> {standard input}:311: Error: selected processor does not support `movt
>> r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>> {standard input}:315: Error: selected processor does not support `movw
>> r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>> {standard input}:316: Error: selected processor does not support `movt
>> r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>> [snip]
>
> Can you try disabling JIT instead like is done for ARMv5/6?

Thanks, it works, updated in the repo.

// Robert


>
> Alex
>

