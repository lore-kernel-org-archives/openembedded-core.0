Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16491772DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:53:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tADDrfOg002305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Nov 2015 05:53:41 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 05:53:40 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5645EB64.4020200@windriver.com>
Date: Fri, 13 Nov 2015 07:53:40 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5643497F.1080106@linux.intel.com>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Fri, 13 Nov 2015 13:53:43 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/11/15 7:58 AM, Alexander Kanavin wrote:
> On 11/11/2015 03:34 PM, Mark Hatle wrote:
> 
>> For the same architecture (i.e. MIPS64) and the same ABI (n64), the resulting
>> data structures, packing and similar should all be standard.  Only the generated
>> instructions and execution order would/could change.
>>
>> So you would need a way to generate, cache, store the results by arch/abi combo
>> in order to do this.  The issue of course is that you would need to declare the
>> arch and abi -- the tune files are the natural place to do this (we really are
>> declaring it there ANYWAY), and the tune features in many cases may have already
>> done this...
>>
>> Something to consider -- the alternative is the dual object (one generic
>> [arch/abi], one optimized for the tune) that can be used to run on QEMU.  Twice
>> the compile time but should work fine.
> 
> Hmm, maybe it's simpler to just fix QEMU so it can handle the missing 
> instructions?

Unfortunately it's not reasonable in my experience.  The problem is that anyone
who implements a BSP/machine that includes so far unknown instructions to qemu
would be required to implement them.

As most people don't understand the instruction implementation in QEMU, I'm not
sure this is reasonable.

I really want to get the gir support into oe-core, but I'm concerned that doing
things this way is going to cause a significant gap in functionality for many of
the machines that use OE.

--Mark

> 
> Alex
> 


