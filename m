Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B536970178
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 14:50:35 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tCsgH6RFrz3hjPd;
	Tue,  8 Nov 2016 15:50:34 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tCsgG50gqzvl28;
	Tue,  8 Nov 2016 15:50:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 0JM_YwC0QG9k; Tue,  8 Nov 2016 15:50:33 +0100 (CET)
X-Auth-Info: kPJwlUz4A2YXrnLXypn8Y++9v3l8gRCA9SRfKiKK3wI=
Received: from [IPv6:::1] (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  8 Nov 2016 15:50:33 +0100 (CET)
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <20161107182006.4207-1-marex@denx.de>
	<CAHiDW_Gynj2f6ByeSwYe61S8kQ_q8BiAG9Ng2d8BzQ-KNwH=EA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ce7eb69f-a02d-d1b4-5a40-f0ac129e8d22@denx.de>
Date: Tue, 8 Nov 2016 15:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_Gynj2f6ByeSwYe61S8kQ_q8BiAG9Ng2d8BzQ-KNwH=EA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Tue, 08 Nov 2016 14:50:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/07/2016 09:43 PM, Jussi Kukkonen wrote:
> On 7 November 2016 at 20:20, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     The build failed on qemux86-64 because it couldn't execute
>     tools/bin2header on a host due to it being compiled with target
>     toolchain. Drop the incorrect EXTRA_OEMAKE, U-Boot Kbuild/Kconfig
>     respects the flags from OE. Moreover, since U-Boot buildsystem
>     already strips the tools, add INSANE_SKIP = "already-stripped" .
> 
> 
> The INSANE_SKIP mentioned here is no longer included in the patch.

I just noticed that too that I forgot to update the commit message
altogether.


-- 
Best regards,
Marek Vasut

