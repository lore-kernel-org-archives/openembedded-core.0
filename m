Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E6F4B719C9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2016 19:19:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tGRSC1vWFz3hjGp;
	Sat, 12 Nov 2016 20:19:55 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tGRSC0VNwzvknj;
	Sat, 12 Nov 2016 20:19:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id rulN9lj4wZej; Sat, 12 Nov 2016 20:19:54 +0100 (CET)
X-Auth-Info: oaPdEFp2c37FAiIoDRCWFubsI9TcbNVPVoVUHE+gCF4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 12 Nov 2016 20:19:54 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LYgvyAriBj2Wf839f6E6Vv04+MLh++gBOEdqSQS+zizwg@mail.gmail.com>
	<CAJTo0LYV3L=i9Nq94uYHck9cGHrqvHrVtJsqOv0do+A4j-eBhg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <db0f1a76-ef02-c274-9dfd-1bb8808faebc@denx.de>
Date: Sat, 12 Nov 2016 19:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYV3L=i9Nq94uYHck9cGHrqvHrVtJsqOv0do+A4j-eBhg@mail.gmail.com>
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
X-List-Received-Date: Sat, 12 Nov 2016 19:19:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/07/2016 09:21 PM, Burton, Ross wrote:
> 
> On 7 November 2016 at 20:15, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
> 
>     Looking at the makefile this isn't the case - it's part of hostprogs
>     so if anyone of the host-built tools work, they all should.
> 
> 
> Just verified that the HOSTCC changes in this patch make it work for me
> even after removing the sed.  Can you send a revision?

It cannot work without the sed, try building for target. Then the
bin2header is built for target.

> Also the u-boot series went through a number of revisions, can you
> verify that the patches in poky-contrib:ross/mut match what you expect
> to see?

Do you have a link for me ?

-- 
Best regards,
Marek Vasut

