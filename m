Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SWO1y-0007sg-PB for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 10:31:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4L8LmCZ018732
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:21:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18004-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:21:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4L8Lf4C018726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:21:42 +0100
Message-ID: <1337588501.11345.605.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2012 09:21:41 +0100
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][PATCH 00/14] mips64 support and sh4 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 08:31:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-05-20 at 20:35 -0700, Khem Raj wrote:
> This patchset adds required bits into metadata for having
> mips64/n64 support. I have tested the core-image-sato and core-image-minimal
> builds and boots on qemumips64 and runs gcc regression testsuite.
> It needs linux-yocto-dev kernel for now which can be obtained from
> poky-extra repo. Additionally systemd-image on angstrom-next builds and boots
> fine on qemumips64 as well.
> 
> Additionally it also adds bits to have SH4 root file systems to be
> able to built and again core-image-sato builds for sh4 however qemu
> machine support is not yet done but root file sytem boots fine on 
> real hardware.
> 
> The images are tested on both eglibc and uclibc.
> 
> Any help in providing feedback or testing these patches is welcome.
> 
> I have tested them enough for over a month now.
> 
> The following changes since commit 326563d5a897ae2dba7cfd8d73579d3d979d72c8:
> 
>   sstate.bbclass: Make sure we don't have an empty fixmepath file (2012-05-18 15:24:45 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/mips64
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/mips64
> 
> Khem Raj (14):
>   insane.bbclass: Add mips64{el} to known machines
>   site: Add mips64 eglibc and uclibc site files
>   gcc-4.6, gcc-4.7: Add support for building mips64 cross compiler
>   binutils: Default to n64 when configured for mips64
>   kernel-arch.bbclass: Map mips64{el} to mips KARCH
>   eglibc-2.15: Support mips64
>   libc-package: Add sh4 and mips64 to arch options
>   runqemu: Add qemush4 and qemumips64 knowledge
>   netbase: Add interface files for qemumips64 and qemush4
>   site/sh-common: Add missing caches variables to build glib-2.32
>   xserver-xorg: Fix build for mips64
>   tune-mips64.inc: Add new tune file for mips64 big-endian
>   qemumips64.conf: Add machine configuration for mips64(eb)
>   qemush4.conf: Add machine configuration for qemush4


We need to figure out what it means to add new qemu machines like this
to OE-Core. I'm not against it however I can't offer the Yocto Project's
resources to test them at this point as we're haven't budgeted for it.

The above patches make sense regardless so I've merged them except the
final two machine files. I'd like to hold off adding those until the
system builds and runs with our default kernel and qemu recipes.
Hopefully this lets you develop without having a huge queue of patches. 

In the meantime we need to figure out the resource concern for testing.
Is there a commercial interest in these new machines from anyone who
could perhaps help with the resource issue?

Cheers,

Richard





