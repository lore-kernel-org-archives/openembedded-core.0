Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD01A65C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 10:08:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u38A8mTx019381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2016 03:08:48 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Apr 2016 03:08:47 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1460099653.git.liezhi.yang@windriver.com>
	<088e89118818dccb4f19c73795d7ae2a724e6473.1460099653.git.liezhi.yang@windriver.com>
	<57077543.1010708@denx.de> <20160408095448.GA4953@ad.chargestorm.se>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5707832E.8080007@windriver.com>
Date: Fri, 8 Apr 2016 18:08:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160408095448.GA4953@ad.chargestorm.se>
Subject: Re: [PATCH 2/4] image_types.bbclass: fix ubi ubifs and multiubi
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
X-List-Received-Date: Fri, 08 Apr 2016 10:08:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/08/2016 05:54 PM, Anders Darander wrote:
> * Stefano Babic <sbabic@denx.de> [160408 11:19]:
>> On 08/04/2016 09:15, Robert Yang wrote:
>>> Fixed when do_image_ubi:
>>> | DEBUG: Executing shell function do_image_ubifs
>>> | Error: min. I/O unit was not specified (use -h for help)
>>> | WARNING: exit code 255 from a shell command.
>
> NAK
>
>>> +MKUBIFS_ARGS ?= "-m 1KiB -e 128KiB -c $ROOTFS_SIZE"
>>> +UBINIZE_ARGS ?= "-m 1KiB -p 128KiB"
>>> +
>
>> These are machine specific and are generally set in the machine
>> configuration file. Default values you set here could be wrong in most
>> cases, depending on the NAND chip.
>
>> Is it not better to get the error ? Then I know that I forget to set the
>> two variables and I can easy fix it. If no error is raised, we get a
>> ubifs that never run on the machine and as rootfs is not mounted - and
>> finding the reason is much more difficult.
>
> I agree with Stefano here; I'd also prefer a build failure instead of a
> non-working image.

My concerns was that if they can't be built out by default, then we have no
idea about whether they work or not. But as you said ubifs is a little
special, so I removed the patch from the repo. In YP 2.2, maybe we can
make it work a with a qemu machine ?

// Robert

>
> Cheers,
> Anders
>

