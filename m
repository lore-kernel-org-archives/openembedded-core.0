Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBEA7557B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 19:16:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41QphX08Pyz1qxRs;
	Wed, 11 Jul 2018 21:16:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41QphV35mVz1qsf4;
	Wed, 11 Jul 2018 21:16:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id JyWcVdXTNTEE; Wed, 11 Jul 2018 21:16:25 +0200 (CEST)
X-Auth-Info: ffi1mGmldmCXXQMbML05gU6z5dioE68OXMiVwwiIn1w=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 11 Jul 2018 21:16:25 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180711150308.30275-1-marex@denx.de>
	<CAJTo0Latp_c1LVzzObR+FPYosVDuohbRwnGfOGruxaoHLSr8Uw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <95864f6b-fae7-eb3a-ac2c-0e4efb18f88a@denx.de>
Date: Wed, 11 Jul 2018 20:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Latp_c1LVzzObR+FPYosVDuohbRwnGfOGruxaoHLSr8Uw@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Add missing dependency on swig
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
X-List-Received-Date: Wed, 11 Jul 2018 19:16:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/11/2018 06:10 PM, Burton, Ross wrote:
> On 11 July 2018 at 16:03, Marek Vasut <marex@denx.de> wrote:
>> The U-Boot build, in particular the pylibfdt, depends on swig-native.
>> Add the missing dependency.
> 
> If pylibfdt isn't usually needed (which it cant be, if swig is an
> optional build dependency which isn't on my machines, or the
> autobuilders, right?) can we just disable the building of pylibfdt
> instead?

Why do you think libpyfdt isn't usually needed ?

Why do you think swig is optional dependency ?

> Ross
> 


-- 
Best regards,
Marek Vasut

