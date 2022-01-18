Return-Path: <abeltran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E39C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 21:32:18 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.805.1642541537511569211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 13:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=SCi0l74F;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: abeltran@linux.microsoft.com)
Received: from [192.168.1.103] (unknown [186.69.115.196])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2E71220B4091
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 13:32:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2E71220B4091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1642541536;
	bh=eRdXkCpVScFlLF23aqNb1wSAwKQOOQj3cXwgtIkEtL0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SCi0l74FtaeLnGCe1iJaARnSGukfGTS4yz6FHrtnlDmIT1XzF3roDCBT8XwowpMUN
	 4j9tzQoKUwydxGGC9EXbNZC6gZ1buzoTXLIutOYvssfMdHk7+KClE2Tzyvf/xgp4DF
	 isGyb2eAhau3QyrhSODUW+KhkjN15eeLO7Mea8bE=
Message-ID: <a7253b15-7f8b-5e7a-7055-ab492bf2a214@linux.microsoft.com>
Date: Tue, 18 Jan 2022 16:32:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH] create-spdx: add support for SDKs
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220112194012.873-1-abeltran@linux.microsoft.com>
 <CAJdd5GbMHoJzLmRaVtyrHbr8eTVD-tRWWzuu2tTf32=YANDq+A@mail.gmail.com>
From: Andres Beltran <abeltran@linux.microsoft.com>
In-Reply-To: 
 <CAJdd5GbMHoJzLmRaVtyrHbr8eTVD-tRWWzuu2tTf32=YANDq+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 21:32:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160680

On 1/14/2022 3:49 PM, Joshua Watt wrote:
>
> Most of us just pipe the output through `jq` to view it (colors are
> really helpful). These files are already quite large, do we really
> need to add more padding?

Ok thanks Joshua. I can certainly remove that change. I saw that the
json files didn't have any indentation out of a build, so added
some padding to make them more readable. But yes, we can certainly use
jq as well.


