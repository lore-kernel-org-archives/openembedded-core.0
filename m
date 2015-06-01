Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC977324E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 02:38:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t512cbI7015452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 May 2015 19:38:37 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 31 May 2015 19:38:37 -0700
Message-ID: <556BC5AB.3040705@windriver.com>
Date: Mon, 1 Jun 2015 10:38:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1432805258.git.liezhi.yang@windriver.com>	
	<9267553a2f080dfb2fac0522df25346195b831fa.1432805258.git.liezhi.yang@windriver.com>
	<1432906592.404.138.camel@linuxfoundation.org>
In-Reply-To: <1432906592.404.138.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/9] btrfs-tools: 3.18.2 -> 4.0.1
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
X-List-Received-Date: Mon, 01 Jun 2015 02:38:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/29/2015 09:36 PM, Richard Purdie wrote:
> On Thu, 2015-05-28 at 02:57 -0700, Robert Yang wrote:
>> * Updated fix-parallel.patch
>> * inherit autotools-brokensep, the autotools doesn't work:
>>    | make: *** No rule to make target `ctree.o', needed by `btrfs'.  Stop.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   16 ++++++++--------
>>   .../btrfs-tools/btrfs-tools_git.bb                 |   16 +++++++++-------
>>   2 files changed, 17 insertions(+), 15 deletions(-)
>
> Did upstream switch to autotools for 4.x? If so, this should really be
> mentioned in the commit message to make sense of the changes.

Yes, it does, I will send an updated patch for it.

// Robert

>
> Cheers,
>
> Richard
>
>
>

