Return-Path: <marex@denx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Nov 2017 08:17:47 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 720CC78347
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 08:17:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3ycvB442WZz1qsTT;
	Thu, 16 Nov 2017 09:12:44 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3ycvB42zdmz1rJhw;
	Thu, 16 Nov 2017 09:12:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id e__tXrxnE_W8; Thu, 16 Nov 2017 09:12:42 +0100 (CET)
X-Auth-Info: 63WpuSDD3bB1FxM3QH9QCuLKl26ru/zltg7UomAo5vE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 16 Nov 2017 09:12:42 +0100 (CET)
To: Stefan Agner <stefan@agner.ch>, Otavio Salvador <otavio@ossystems.com.br>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
	<52e78a6cf11a3a374fab68885140c2b4@agner.ch>
From: Marek Vasut <marex@denx.de>
Message-ID: <12cc8c4c-7d8c-f3c5-eef0-938ff9d16801@denx.de>
Date: Thu, 16 Nov 2017 09:12:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <52e78a6cf11a3a374fab68885140c2b4@agner.ch>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Thu, 16 Nov 2017 08:17:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/2017 05:47 PM, Stefan Agner wrote:
> On 2017-11-14 19:32, Otavio Salvador wrote:
>> This upgrades the U-Boot from 2017.09 to 2017.11 release.
> 
> You might encounter this when building fw_printenv/setenv tools alone:
> 
> https://lists.denx.de/pipermail/u-boot/2017-November/311505.html

[...]

>>  SRC_URI = "git://git.denx.de/u-boot.git \
>>      file://MPC8315ERDB-enable-DHCP.patch \
I also see that the number of out-of-tree patches didn't change since
last time, even though I complained about it ... why are these patches
still here ?

-- 
Best regards,
Marek Vasut

