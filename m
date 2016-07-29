Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B342260853
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 12:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TC0NRW022022; Fri, 29 Jul 2016 13:00:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wuz-edU0JzjI; Fri, 29 Jul 2016 13:00:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TC0Ih8022019
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 13:00:20 +0100
Message-ID: <1469793618.9142.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 29 Jul 2016 13:00:18 +0100
In-Reply-To: <ebc1baa1-18d7-8de4-0edc-6213aa62eb1c@windriver.com>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
	<009dfcea9c78b09da41ed2502482b1e116772c78.1469638333.git.bruce.ashfield@windriver.com>
	<1469774922.9142.39.camel@linuxfoundation.org>
	<ebc1baa1-18d7-8de4-0edc-6213aa62eb1c@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] linux-yocto/4.1: bump to v4.1.28
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
X-List-Received-Date: Fri, 29 Jul 2016 12:00:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-07-29 at 07:15 -0400, Bruce Ashfield wrote:
> On 2016-07-29 2:48 AM, Richard Purdie wrote:
> > On Wed, 2016-07-27 at 12:57 -0400, Bruce Ashfield wrote:
> > > Updating the 4.1 kernel to the korg -stable release
> > > 
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
> > >  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
> > >  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20
> > > ++++++++++---
> > > -------
> > >  3 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb
> > /bui
> > lds/851/steps/BuildImages/logs/stdio
> > 
> > http://errors.yoctoproject.org/Errors/Details/73456/
> > 
> > > /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips
> > > -lsb/build/build/tmp/work-shared/qemumips/kernel
> > > -source/arch/mips/kernel/setup.c: In function 'arch_mem_init':
> > > /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips
> > > -lsb/build/build/tmp/work-shared/qemumips/kernel
> > > -source/arch/mips/kernel/setup.c:690:2: error: implicit
> > > declaration of function 'reserve_bootmem_region' [
> > > -Werror=implicit-function-declaration]
> > >   reserve_bootmem_region(__pa_symbol(&__nosave_begin),
> > >   ^~~~~~~~~~~~~~~~~~~~~~
> > >   CC      mm/swap.o
> > > cc1: all warnings being treated as errors
> > > /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips
> > > -lsb/build/build/tmp/work-shared/qemumips/kernel
> > > -source/scripts/Makefile.build:258: recipe for target
> > > 'arch/mips/kernel/setup.o' failed
> > > make[4]: *** [arch/mips/kernel/setup.o] Error 1
> > > make[4]: *** Waiting for unfinished jobs....
> > 
> > also
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/
> > buil
> > ds/857/steps/BuildImages/logs/stdio
> > 
> > http://errors.yoctoproject.org/Errors/Details/73450/
> > 
> > TOPDIR/tmp/work-shared/qemuppc/kernel
> > -source/arch/powerpc/kernel/prom.c:170:25: error:
> > 'PPC_FEATURE2_HTM_NOSC_COMP' undeclared here (not in a function)
> >    PPC_FEATURE2_HTM_COMP|PPC_FEATURE2_HTM_NOSC_COMP, 22, 0, 0},
> >                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > make[3]: *** [arch/powerpc/kernel/prom.o] Error 1
> > make[3]: *** Waiting for unfinished jobs....
> > make[2]: *** [arch/powerpc/kernel] Error 2
> > make[1]: *** [sub-make] Error 2
> > make: *** [__sub-make] Error 2
> 
> odd. My core-image-builds claim to have worked. I'll pick this up and
> re-submit my queue with some new 4.1 patches that fix any issues.

I've dropped the 4.1 patches from the test queue, I left the 4.4 ones
in since those seem ok and hopefully pull back a bit of performance so
you may not need to resubmit those.

Cheers,

Richard

