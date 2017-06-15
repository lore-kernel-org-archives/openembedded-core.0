Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id E60DE7839A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:25:13 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 90B6268A019; Thu, 15 Jun 2017 15:25:13 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 28BB968A019;
	Thu, 15 Jun 2017 15:25:13 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id D8A02674031E;
	Thu, 15 Jun 2017 16:25:12 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1497534748.git.pkj@axis.com>
	<4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
	<CAJTo0LZ3utZx6+rbKxs2RbjhEVHG1eGMGrX7qSf-s=TB6PwPmA@mail.gmail.com>
	<c1d410c6cb3d4e66bef8b80a78a07267@XBOX02.axis.com>
	<febb07f5-af96-82ba-69c1-46f9c7294b00@linux.intel.com>
	<8b3d9920b9bb447bb6c7574a7ae42b6e@XBOX02.axis.com>
	<55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <b8473c19-98c2-6fdf-10c3-95a6edf624fe@mlbassoc.com>
Date: Thu, 15 Jun 2017 16:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
Subject: Re: [PATCH 01/11] gtk+3: Update the patches to work without PATCHTOOL = "git"
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
X-List-Received-Date: Thu, 15 Jun 2017 14:25:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-15 16:18, Alexander Kanavin wrote:
> On 06/15/2017 05:11 PM, Peter Kjellerstedt wrote:
> 
>>> My apologies, but I do not think this is a satisfactory answer: it may
>>> mean you are fixing the wrong problem, or a problem that does not
>>> exist.
>>>
>>> Alex
>>
>> Well, I am pretty sure Git patches that rename files are not supposed
>> to be used, since quilt does not support this AFAIK. So the change in
>> this patch should be correct.
>>
>> However, I would be more than happy if anyone can explain why others
>> are not seeing this (or does everyone have PATCHTOOL = "git" in their
>> configurations somehow?)
> 
> This is unlikely; I certainly don't. Perhaps if you provide the exact command that is being executed, and what is the 
> error it prints, I could try to do the same?
By default (i.e. nothing special in my local.conf), I have
   PATCHTOOL = "quilt"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

