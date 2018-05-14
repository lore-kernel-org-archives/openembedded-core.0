Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1175377FEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 13:13:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4EDDH1h025492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 May 2018 14:13:18 +0100
Message-ID: <1526303597.5720.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 14:13:17 +0100
In-Reply-To: <BN6PR1201MB019568D1F8B405A49C7121CA8B9C0@BN6PR1201MB0195.namprd12.prod.outlook.com>
References: <BN6PR1201MB019576F9685E3FFFC5E183E08B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<1526286006.5720.113.camel@linuxfoundation.org>
	<BN6PR1201MB019568D1F8B405A49C7121CA8B9C0@BN6PR1201MB0195.namprd12.prod.outlook.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: UNVERIFIED SENDER Re: Running BitBake multiple times without rechecking upstream AUTOREV versions
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
X-List-Received-Date: Mon, 14 May 2018 13:13:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-05-14 at 13:05 +0000, chris.laplante@agilent.com wrote:
> Hi Richard,
> 
> That looks perfect, thanks! On a related note, it seems "bitbake --
> revisions-changed" is broken in Sumo:
> 
> ERROR: Command execution failed: Traceback (most recent call last):
>   File "/home/laplante/yocto/sources/poky/bitbake/lib/bb/command.py",
> line 116, in runAsyncCommand
>     commandmethod(self.cmds_async, self, options)
>   File "/home/laplante/yocto/sources/poky/bitbake/lib/bb/command.py",
> line 723, in compareRevisions
>     if bb.fetch.fetcher_compare_revisions(command.cooker.data):
> TypeError: fetcher_compare_revisions() takes 0 positional arguments
> but 1 was given
> 
> 
> 
> Looks like commit 97617fd6755ffa25c058215ffb060cbb86240b44 dropped
> the 'd' argument from that method, but command.py was never updated
> to reflect that.
> 
> Shall I submit a patch to change the line to be "if
> bb.fetch.fetcher_compare_revisions():"  ?

A patch to the bitbake list would be great thanks!

Cheers,

Richard

