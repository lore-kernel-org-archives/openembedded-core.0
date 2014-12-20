Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9E22072973
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 22:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKMEKjL023516; Sat, 20 Dec 2014 22:14:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XB8RsaCFWbjm; Sat, 20 Dec 2014 22:14:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKME74p023510
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 20 Dec 2014 22:14:19 GMT
Message-ID: <1419113684.13316.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 20 Dec 2014 22:14:44 +0000
In-Reply-To: <CAP9ODKpOb_c1ZhF6B5W9DejgTbLtuMVpqCKDVxb=+8muQxVbuQ@mail.gmail.com>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
	<CAP9ODKpOb_c1ZhF6B5W9DejgTbLtuMVpqCKDVxb=+8muQxVbuQ@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Sat, 20 Dec 2014 22:14:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-12-20 at 17:19 -0200, Otavio Salvador wrote:
> On Sat, Dec 20, 2014 at 9:15 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > So where are we at?
> ...
> > * there are continuing problems with linux-imx from meta-fsl-arm, I
> >   thought these were addressed but clearly not :(
> 
> I have addressed those:
> 
> commit 150b8fe5fb428f9d62b8d5e589ba50bcb64bdb6a (HEAD,
> yocto/master-next, pending)
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Sat Dec 20 17:11:24 2014 -0200
> 
>     fsl-kernel-localversion.bbclass: Fix building using out-of-tree
> 
>     Since OE-Core:df9975f4 (kernel: Fix non linux-yocto builds) the way
>     the build of kernel is done has change. Now the source code is moved
>     placed at STAGING_KERNEL_DIR and the build is done at ${WORKDIR}/build
>     which is B.
> 
>     This patch adapts the configure task prepending to cope with those changes.
> 
>     Change-Id: I9ea4254ffd56e4b7201daf9a90b52756a399c0f6
>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

I had tweaked kernel.bbclass so you shouldn't need to do that, the
system notices if a kernel is configured in ${S} and moves the
configuration to ${B}. I also fixed some other race issues which were
leading to the makefile problems on older autobuilders.

> This is under meta-fsl-arm master-next branch so people give it a go
> in AB and let me know about any other issue you have.

https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/builds/131/steps/BuildImages/logs/stdio

Is the latest failure (fsl-arm built ok), I think this may be a parallel
make race?

Cheers,

Richard




