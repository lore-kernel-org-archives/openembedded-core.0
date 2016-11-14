Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 20A43719A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:48:30 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tHYL72RNTz3hjQf;
	Mon, 14 Nov 2016 15:48:31 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tHYL71zXFzvkFB;
	Mon, 14 Nov 2016 15:48:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id kBC9qC1wgozq; Mon, 14 Nov 2016 15:48:30 +0100 (CET)
X-Auth-Info: Z15XFNOltlLn72v8MGNVBy9EGxBqSJcFhyeyP/gGj/o=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 14 Nov 2016 15:48:30 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LYgvyAriBj2Wf839f6E6Vv04+MLh++gBOEdqSQS+zizwg@mail.gmail.com>
	<CAJTo0LYV3L=i9Nq94uYHck9cGHrqvHrVtJsqOv0do+A4j-eBhg@mail.gmail.com>
	<db0f1a76-ef02-c274-9dfd-1bb8808faebc@denx.de>
	<CAJTo0LZVXqvWmRaYHCchxLJ-Bpb86d+EQk-49J3cUZUH07Q5NQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <56dfa413-c2e2-80f6-8cda-d0837f9fd99d@denx.de>
Date: Mon, 14 Nov 2016 15:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZVXqvWmRaYHCchxLJ-Bpb86d+EQk-49J3cUZUH07Q5NQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Nov 2016 14:48:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/14/2016 03:45 PM, Burton, Ross wrote:
> 
> On 12 November 2016 at 18:31, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     > Also the u-boot series went through a number of revisions, can you
>     > verify that the patches in poky-contrib:ross/mut match what you expect
>     > to see?
> 
>     Do you have a link for me ?
> 
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut-broken&id=4f6dbc99950da645dc4d0e23e0065ff8245a0e74
> 
> As the cleanups didn't really make sense standalone, I squashed the lot.

I prefer to keep the history, but OK. It looks like what I'd expect there.

-- 
Best regards,
Marek Vasut

