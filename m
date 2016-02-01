Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 30610760AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 09:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u119CcR0020062; Mon, 1 Feb 2016 09:12:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0UI9LJcHVVu4; Mon,  1 Feb 2016 09:12:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u119CZZ3020059
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Feb 2016 09:12:36 GMT
Message-ID: <1454317955.27087.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Date: Mon, 01 Feb 2016 09:12:35 +0000
In-Reply-To: <1454229127.27087.11.camel@linuxfoundation.org>
References: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
	<56AB73C0.8030505@linux.intel.com>
	<CAMKF1spkRPwBzY+6j6pVM_epfB2sVYS37-i+s9rJw4-rTXOMbQ@mail.gmail.com>
	<1454229127.27087.11.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Glibc 2.23 and binutils 2.26
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
X-List-Received-Date: Mon, 01 Feb 2016 09:12:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-31 at 08:32 +0000, Richard Purdie wrote:
> On Fri, 2016-01-29 at 06:44 -0800, Khem Raj wrote:
> > On Fri, Jan 29, 2016 at 6:14 AM, Alexander Kanavin
> > <alexander.kanavin@linux.intel.com> wrote:
> > > On 01/17/2016 01:54 PM, Khem Raj wrote:
> > > > 
> > > > upstream glibc and binutils release branches have been cut out
> > > > and are
> > > > being made ready for next release
> > > > I have put together update patchset for both of them
> > > > 
> > > > here are the branches
> > > > 
> > > > https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.
> > > > 26
> > > > https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23
> > > 
> > > 
> > > Hello Khem,
> > > 
> > > when are you planning to submit these?
> > 
> > binutils exposes a problem for ppc as a result kernel fails to
> > build.
> > The fix is to drop
> > http://git.openembedded.org/openembedded-core/tree/meta/recipes-dev
> > to
> > ols/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux
> > -target.patch
> > 
> > that patch makes generic ppc configs to be specific to fsl ppc.
> > but we need context as to why this was done
> > 
> > glibc is still not released.
> 
> I ran the binutils upgrade in -next on the autobuilder. It looked
> mostly good but with poky-lsb we did see:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb
> /b
> uilds/635/steps/BuildImages/logs/stdio
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb
> /b
> uilds/635/steps/BuildImages_1/logs/stdio

Good news is I fixed the binutils build issues. 

There was a window of available time on the autobuilder so I tested
glibc 2.23 which failed in ltp with:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/634/steps/BuildImages/logs/stdio

bdflush01.c:84:25: fatal error: sys/kdaemon.h: No such file or directory

That made the builds rather red with many failures but was the only
error I could spot.

Cheers,

Richard



