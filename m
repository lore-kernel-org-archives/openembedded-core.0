Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BE2CF746DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 14:51:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40Ln6M0Yyjz1qvTV;
	Wed, 11 Apr 2018 16:51:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40Ln6M0778z1qqyc;
	Wed, 11 Apr 2018 16:51:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id qEPJvqUGtgdw; Wed, 11 Apr 2018 16:51:04 +0200 (CEST)
X-Auth-Info: D1CeLIjyH0YBgjRrcMHTERiWd/jDtPME7pbDiU970co=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 11 Apr 2018 16:51:04 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180408230223.17260-1-marex@denx.de>
	<CAJTo0Lbdrm7y5ZHHSHH980jmZSJE0RbhLQCVY3NtQ1DPz-A3fw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2c318d94-b321-e83a-a5ef-254647b3d35e@denx.de>
Date: Wed, 11 Apr 2018 16:51:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbdrm7y5ZHHSHH980jmZSJE0RbhLQCVY3NtQ1DPz-A3fw@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Wed, 11 Apr 2018 14:51:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/11/2018 04:47 PM, Burton, Ross wrote:
> On 9 April 2018 at 00:02, Marek Vasut <marex@denx.de> wrote:
>> This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>> patches accepted upstream, getting the patch count to zero.
> 
> Are you proposing this for 2.5/Sumo (breaking the freeze) or is it
> fine to sit in master-next until 2.5 is released?

master-next, for 2.6 .

-- 
Best regards,
Marek Vasut

