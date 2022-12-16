Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED128C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 21:37:01 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.7159.1671226621078905347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 13:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BGLax7W031162
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 15:36:59 -0600
Message-ID: <d7ec026b-4343-a133-5462-034655a9403d@kernel.crashing.org>
Date: Fri, 16 Dec 2022 15:36:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [OE-core] [RFC PATCH v2] qemu: update 7.1.0 -> 7.2.0
To: openembedded-core@lists.openembedded.org
References: <20221216154511.341054-1-alex@linutronix.de>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20221216154511.341054-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 21:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174763



On 12/16/22 9:45 AM, Alexander Kanavin wrote:
> Disable slirp by default: qemu no longer carries libslirp in-tree,
> and enabling slirp requires providing external libslirp first
> (available from e.g. meta-virtualization).

I think disabling slirp (by default) is going to be problematic.  Most of my 
configurations and those of people I work with use slirp.  Forcing people to 
include meta-virtualization in all configurations may not be reasonable either.

I suggest that we bring libslirp from meta-virtualization to oe-core to preserve 
existing behavior.

--Mark

> Another noteworthy change is:
> 
> x86: TCG support for AVX, AVX2, F16C, FMA3 and VAES instructions
> 
> ... which means both meta-intel and qemu x86 targets can
> now fully utilize Haswell-and-later instruction set with benefits
> for performance in emulation and on silicon.
> 
> Changelog:
> https://wiki.qemu.org/ChangeLog/7.2
> 

