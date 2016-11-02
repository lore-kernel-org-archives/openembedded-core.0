Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9A50A71A9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 20:33:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t8KY972CRz3hjP2;
	Wed,  2 Nov 2016 21:33:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t8KY817SWzw2pM;
	Wed,  2 Nov 2016 21:33:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id vX6WrJkcyu5H; Wed,  2 Nov 2016 21:32:58 +0100 (CET)
X-Auth-Info: h+jQuwf7J/FSeBQ32H425as3FEsfV+FgU/QSCOc6Lek=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  2 Nov 2016 21:32:58 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161102120724.30063-1-marex@denx.de>
	<CAJTo0LaoMkEMaB8LC=w_DUFcZE4AVr4ARZMWTVZNGKJu=X=dAQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ac4a3766-6dee-2e89-141f-1eab2e4b9fa6@denx.de>
Date: Wed, 2 Nov 2016 20:40:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaoMkEMaB8LC=w_DUFcZE4AVr4ARZMWTVZNGKJu=X=dAQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 02 Nov 2016 20:33:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/02/2016 03:48 PM, Burton, Ross wrote:
> 
> On 2 November 2016 at 12:07, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     Drop the incorrect EXTRA_OEMAKE and just use the one
>     from u-boot-common*.inc . Moreover, since U-Boot buildsystem
>     already strips the tools, add INSANE_SKIP = "already-stripped" .
> 
> 
> But u-boot-common doesn't set EXTRA_OEMAKE...

Should be u-boot.inc , sorry.


-- 
Best regards,
Marek Vasut

