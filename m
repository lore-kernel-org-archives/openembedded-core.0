Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D73D26E650
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 17:55:17 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zF5fG6gR6z1qsT4;
	Sun,  7 Jan 2018 18:55:18 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zF5fG6Qcpz26T1q;
	Sun,  7 Jan 2018 18:55:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id jruJY7c7hSaS; Sun,  7 Jan 2018 18:55:17 +0100 (CET)
X-Auth-Info: 6rb6UB/5VetIG+NG61WT4I+y0a9RObFo1IxnCyLJlcE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun,  7 Jan 2018 18:55:17 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20180107161920.30937-1-marex@denx.de>
	<3cdba2e1-94df-32fd-0138-a6fa533ec165@linux.intel.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <233b2ff5-22a9-f378-98d9-fb833f5cc848@denx.de>
Date: Sun, 7 Jan 2018 18:55:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <3cdba2e1-94df-32fd-0138-a6fa533ec165@linux.intel.com>
Subject: Re: [PATCH 1/2] xenomai: Add xenomai recipe
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
X-List-Received-Date: Sun, 07 Jan 2018 17:55:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/07/2018 06:17 PM, Alexander Kanavin wrote:
> On 01/07/2018 06:19 PM, Marek Vasut wrote:
>> Add recipe for the xenomai. This recipe is used twice, once to build
>> the xenomai userspace components and again to patch the kernel with
>> the cobalt core. Therefore, the xenomai sources are installed into
>> work-shared rather then work to make them accessible to the kernel
>> recipe, which triggers the patching.
> 
> What is xenomai? What is a 'cobalt core'? What do they do and who would
> want to use them? Please do explain that in the commit message.

I guess the link in the xenomai recipe explains it, details are here:
http://xenomai.org/installing-xenomai-3-x/

>> +SUMMARY = "Xenomai 3 userspace libraries"
>> +DESCRIPTION = "Xenomai 3 userspace libraries"
> 
> ... and here - description cannot be the same as the summary.

So do I remove one of them or what's the difference really ?

> Alex


-- 
Best regards,
Marek Vasut

