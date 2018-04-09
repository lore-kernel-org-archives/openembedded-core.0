Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7266974A58
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 08:29:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40KNlJ1d5yz1qtXM;
	Mon,  9 Apr 2018 10:29:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40KNlJ1Mk3z1qqkR;
	Mon,  9 Apr 2018 10:29:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id K-BOxtvFbil3; Mon,  9 Apr 2018 10:29:47 +0200 (CEST)
X-Auth-Info: yIEL/0jNVs2PNDERENS5HQOPl4lTP2kE3DVlqCSn1+4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  9 Apr 2018 10:29:47 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
Message-ID: <b904641a-c0f3-8c21-7051-a30934ab7638@denx.de>
Date: Mon, 9 Apr 2018 10:25:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 09 Apr 2018 08:29:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04/09/2018 02:54 AM, Khem Raj wrote:
> 
> On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>     patches accepted upstream, getting the patch count to zero.
> 
> 
> 
> It fails for me if I have libfdt installed on build host 
> It seems build is doing the include dance which goes all the way into
> hosts system include directories 

Which version of libfdt and dtc do you have installed ?
And is it really libfdt or dtc ?

-- 
Best regards,
Marek Vasut

