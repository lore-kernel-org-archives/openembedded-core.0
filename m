Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74FF577334
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:31:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tADGV1iv030026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 13 Nov 2015 08:31:02 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 08:31:01 -0800
To: <alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
	<5645EB64.4020200@windriver.com>
	<60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56461044.2020202@windriver.com>
Date: Fri, 13 Nov 2015 10:31:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 13 Nov 2015 16:31:03 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/13/15 10:12 AM, alexander.kanavin@linux.intel.com wrote:
>>> Hmm, maybe it's simpler to just fix QEMU so it can handle the missing
>>> instructions?
>>
>> Unfortunately it's not reasonable in my experience.  The problem is that
>> anyone
>> who implements a BSP/machine that includes so far unknown instructions to
>> qemu
>> would be required to implement them.
>>
>> As most people don't understand the instruction implementation in QEMU,
>> I'm not
>> sure this is reasonable.
> 
> If someone is competent enough to add new instructions to the compiler,
> they should be competent enough to figure out how to do the same in QEMU,
> no?

That's the problem right there.  The same developers rarely do that work.

The compiler today support many more instructions for a given architecture
family then QEMU models for that same architecture.

IA32 -- some of the current and even some former generate i7 instructions fall
under this problem.  If you host system does not have the same instruction set,
QEMU doesn't know how to emulate everything.

MIPS64 (Such as the Octeon III) is a good example.

PowerPC has many variants as well that QEMU does not support.

It would be wonderful if there was a tie together of what gcc/as and qemu
supported -- at least from an application perspective, but that simply doesn't
happen in the real world.

--Mark

> Alex
> 


