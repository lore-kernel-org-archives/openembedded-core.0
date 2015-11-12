Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCE0A7725A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:12:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tACJBv4A020438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Nov 2015 11:11:57 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 11:11:57 -0800
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
References: <1447351617-7516-1-git-send-email-alexandre.belloni@free-electrons.com>
	<5644D9F1.2030705@windriver.com> <20151112184340.GE4230@piout.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5644E47C.70904@windriver.com>
Date: Thu, 12 Nov 2015 13:11:56 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151112184340.GE4230@piout.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-cortexa5.inc: Allow tuning for vfpv3d16, vfpv3 and neon-vfpv4
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
X-List-Received-Date: Thu, 12 Nov 2015 19:12:20 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/12/15 12:43 PM, Alexandre Belloni wrote:
> On 12/11/2015 at 12:26:57 -0600, Mark Hatle wrote :
>> Seems odd to me that the package arch are the same between the generic (assumed
>> to be the default ARMv7a, which is USUALLY VFPv4-D32 in most cases.)
>>
>> If we want to limit to v3 and/or D16.  It might make sense for a different
>> package arch, otherwise there is no way to separate the feeds in a
>> multiple-machine configuration with different per-target optimizations.
>>
>> (similarly the -neon versions as well, but that is existing code)
>>
> 
> Yeah, I'm also not sure this is the correct thing but all the package
> arch for tune-armv7a* are armv7a so I've replicated that.
> 
> Also, I just realized there are no users for armv7a*-vfpv3* in oe-core,
> maybe I should leave those tunes in my soc specific BSP layer?
> 

There are a lot of tunes defined that have no direct oe-core users.  We try to
define things we think are useful and supported by the included toolchain.

External BSPs may be required to actually test it.

--Mark

