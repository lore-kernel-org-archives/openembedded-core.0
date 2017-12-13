Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADC507842D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 13:38:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBDDcCf7027464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Dec 2017 05:38:12 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Dec 2017 05:38:11 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1513168490.19417.183.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
Date: Wed, 13 Dec 2017 08:38:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513168490.19417.183.camel@linuxfoundation.org>
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Wed, 13 Dec 2017 13:38:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/13/2017 07:34 AM, Richard Purdie wrote:
> Hi Bruce,
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
> 
> We've root caused the hangs we're seeing in qemux86-64 on our
> autobuilder workers. We've identified a commit on 4.15-rc3 which fixes
> the issue but backporting it to the autobuilder's host kernels will be
> a pain.
> 
> As a workaround I'd like to enable x2apic on qemux86-64. Since that
> works via MSRs it avoids the problem.
> 
> Would it be a big issue to set CONFIG_X86_X2APIC=y for qemux86-64?

Nope. No big deal at all. I've used the same config i the past
when doing work with rt-KVM, so I know it well.

I'll prep a commit, and send it along as part of a rebased set
of kernel patches.

Cheers,

Bruce

> 
> Cheers,
> 
> Richard
> 
> 
> 


