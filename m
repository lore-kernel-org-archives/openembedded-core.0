Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89E9D60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:20:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6RDKMCu021122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Jul 2015 06:20:22 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 06:20:07 -0700
Message-ID: <55B6300F.7060104@windriver.com>
Date: Mon, 27 Jul 2015 09:20:15 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1437989436.821.221.camel@linuxfoundation.org>
In-Reply-To: <1437989436.821.221.camel@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: gcc 5.2 failures
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
X-List-Received-Date: Mon, 27 Jul 2015 13:20:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-07-27 05:30 AM, Richard Purdie wrote:
> I've run a gcc 5.2 test build on the autobuilder:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=3628c3c06fa4195003ac655bcc791acfac775173&limit=50
>
> 41 errors (with a few more pending).
>
> The good news is that if we tweak the security flags, the poky-lsb gcc,
> elfutils, coreutils and iptables issues can be removed and I have a
> patch for this. This leaves:
>
> 3.14 kernel failures for edgerouter, genericx86-64, qemuarm, beaglebone,
> mpc8315e-rdb

Gah. I had all these building with 5.1 .. chasing gcc is a pain
with this older kernel.

>
> openssl issue for p1022ds
>
> u-boot on imx28evk, p1022ds, mpc8315e-rdb
>
> xf86-video-imxfb-vivante on imx6qsabresd
>
> linux-imx issue on imx53qsb
>
> Some kind of "random" qemu runtime issue (4 cases).
>
> At this point I think we likely need to enter bugs into the bugzilla for
> each of these. If we want to switch 1.9 to use this (which I think is
> desirable), we need to get this fixed as a priority.
>
> Bruce: How do you want to handle the 3.14 issues? Switch to 4.1? or fix
> 3.14?

Now that 4.1 is in place, and I can't really see a large user base that
needs gcc 5.x with the linux-yocto 3.14 kernel (other folks using
master with their own kernel's will obviously have to deal with the
issue in their trees) .. join that with the fact that we need to update
all the reference boards to 4.1 anyway, my suggestion is that we open
bugs for the h/w reference updates (and I'll get the appropriate Wind
River eyes on them) and walk away from burning more cycles on gcc 5.x
and the 3.14 kernel.

Cheers,

Bruce

>
> Otavio: The freescale machines are looking unwell, can you help us make
> sure the right people know about this?
>
> Cheers,
>
> Richard
>
>
>
>


