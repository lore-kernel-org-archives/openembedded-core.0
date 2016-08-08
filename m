Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7345073CF7;
	Mon,  8 Aug 2016 08:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u788oFjU024532; Mon, 8 Aug 2016 09:50:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xPhPuDmKQo9Y; Mon,  8 Aug 2016 09:50:15 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u788oAvf024525
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 8 Aug 2016 09:50:11 +0100
Message-ID: <1470646210.8166.38.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 08 Aug 2016 09:50:10 +0100
In-Reply-To: <1470644094.8166.37.camel@linuxfoundation.org>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Mon, 08 Aug 2016 08:50:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-08-08 at 09:14 +0100, Richard Purdie wrote:
> On Mon, 2016-08-08 at 00:24 -0700, Khem Raj wrote:
> > > On Aug 7, 2016, at 11:28 PM, Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Sun, 2016-08-07 at 01:39 -0700, Khem Raj wrote:
> > > > I have put together upgrade for binutils 2.27 here (
> > > > kraj/master
> > > > branch )
> > > > 
> > > > https://github.com/kraj/openembedded-core/commit/b98f5761d2285f
> > > > fd
> > > > 773e
> > > > c6ecb901b799302ebd6b
> > > > 
> > > > I have started bunch of test builds. but I would appreciate any
> > > > help
> > > > in testing it out in your
> > > > environments and report any issues you see.
> > > 
> > > I ran this through the autobuilder:
> > > 
> > > bitbake world shows issues in libunwind (from gold?):
> > > 
> > 
> > yes, however, use of gold for libunwind in OE was an escape route
> > where we were relying upon gold’s inability to detect this issue
> > while BFD linker
> > was detecting it earlier. Now in 2.27 gold has caught up as well.
> > 
> > see
> > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=6eeb0170
> > bb
> > b43ffb73e8f01b8b481adde8194c21
> > 
> > so now we have to get to nub of this issue to resolve it.
> 
> Ok. I think we also have:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
> /8
> 96
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
> /8
> 96
> 
> in that "connmand --help" is segfaulting on ppc. I've not 100%
> confirmed its the binutils patch but its seeming likely at this
> point.

Its also sefgaulting on all mips builds:

https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/883
https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds/863
https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/528

:(

Cheers,

Richard



