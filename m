Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2D078063
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 08:21:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wYMgF4Ttgz1qs0L;
	Thu, 25 May 2017 10:21:45 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wYMgF3gWkz3hmN6;
	Thu, 25 May 2017 10:21:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id KYQbVf3ZG3es; Thu, 25 May 2017 10:21:45 +0200 (CEST)
X-Auth-Info: JyvXIB7SbY8ebX1Zo0ZSs5M8rEtzFbpWk7qLSSdUniU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 25 May 2017 10:21:44 +0200 (CEST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170524204615.2748-1-marex@denx.de>
	<0a6178cd-a30c-26e6-52b0-5b651766a3ba@linux.intel.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b23ed167-0070-3915-db2b-bb20b8a9f61b@denx.de>
Date: Thu, 25 May 2017 10:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <0a6178cd-a30c-26e6-52b0-5b651766a3ba@linux.intel.com>
Subject: Re: [PATCH] u-boot: Fix build with OpenSSL 1.1.x
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
X-List-Received-Date: Thu, 25 May 2017 08:21:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/25/2017 10:02 AM, Alexander Kanavin wrote:
> On 05/24/2017 11:46 PM, Marek Vasut wrote:
>> Pick two patches from the U-Boot ML fixing build with OpenSSL 1.1.x .
> 
> Thanks :) This was holding up the transition to 1.1 (u-boot cannot stay
> at 1.0 as it will cause a sysroot clash).

Cool. The U-Boot OpenSSL 1.1 patches will likely land in 2017.07 too so
we'd be able to drop them altogether then.

-- 
Best regards,
Marek Vasut

