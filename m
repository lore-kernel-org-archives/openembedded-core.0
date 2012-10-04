Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJigr-0001tB-Jn; Thu, 04 Oct 2012 12:30:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q94AGxYb005761;
	Thu, 4 Oct 2012 11:16:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05539-06; Thu,  4 Oct 2012 11:16:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q94AGqQk005755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 4 Oct 2012 11:16:53 +0100
Message-ID: <1349345816.18301.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 04 Oct 2012 11:16:56 +0100
In-Reply-To: <20121004093329.GD3005@jama.jama.net>
References: <20121002161853.6075610353@opal>
	<20121004091206.GC3005@jama.jama.net> <1349342915.18301.70.camel@ted>
	<20121004093329.GD3005@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : bitbake.conf: Add chrpath-native to ASSUME_PROVIDED
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 10:30:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-04 at 11:33 +0200, Martin Jansa wrote:
> On Thu, Oct 04, 2012 at 10:28:35AM +0100, Richard Purdie wrote:
> > On Thu, 2012-10-04 at 11:12 +0200, Martin Jansa wrote:
> > > On Tue, Oct 02, 2012 at 04:18:50PM +0000, git@git.openembedded.org wrote:
> > > > Module: openembedded-core.git
> > > > Branch: master
> > > > Commit: 97a3ea712003e8d48dc68c282e656591f39d2d1a
> > > > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=97a3ea712003e8d48dc68c282e656591f39d2d1a
> > > > 
> > > > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Date:   Tue Oct  2 14:12:21 2012 +0100
> > > > 
> > > > bitbake.conf: Add chrpath-native to ASSUME_PROVIDED
> > > > 
> > > > We assume chrpath is provided natively so it should be listed in ASSUME_PROVIDED.
> > > > 
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > 
> > > This breaks do_install in gpsd:
> > > 
> > > | arm-oe-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/nokia900 -o gpsd --sysroot=/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/nokia900 -pthread -Wl,-rpath=/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/gpsd-3.7 -Wl,-rpath=/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/lib gpsd.o ntpshm.o shmexport.o dbusexport.o sd_socket.o -L. -L/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/nokia900/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/lib -L/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/nokia900/lib -lrt -lcap -lbluetooth -lgpsd -lusb-1.0 -lbluetooth -lgps -lm -lcap
> > > | Install file: "gpsd" as "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd"
> > > | chrpath -d "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd"
> > > | `/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd' probably isn't a 64-bit LSB-first ELF file.
> > > | elf_open: Exec format error
> > > | scons: *** [/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd] Error 1
> > > | scons: building terminated because of errors.
> > > | ERROR: scons install execution failed.
> > > | ERROR: Function failed: do_install (see /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/temp/log.do_install.8833 for further information)
> > > NOTE: recipe gpsd-3.7-r9: task do_install: Failed
> > > 
> > > I guess I can add chrpath-replacement-native to DEPENDS, but do you have any 
> > > idea why chrpath in Ubuntu 14.04.1 does not support arm binaries?
> > > $ chrpath --version
> > > chrpath version 0.13
> > 
> > Er, chrpath should only get used on native/nativesdk/crosssdk/cross
> > binaries. Its not expected to work on target binaries and we should
> > never be running this there.
> > 
> > Is this error coming from something we're putting in do_install or is it
> > from gpsd's makefile?
> > 
> > I think this might be a problem in the Makefile and not from OE itself.
> 
> It's used from gpsd's SConstruct.
> 
> I can remove it there, but that results in 
>   WARNING: QA Issue: libgps:
>   /work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0
>   contains probably-redundant RPATH /usr/lib
> or
>   WARNING: QA Issue: package libgps contains bad RPATH
>   /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/image/usr/lib
>   in file
>   /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0

Its clearly a gpsd build issue rather than anything in OE-Core. The
former is a mild performance issue, the latter a potential security
hole.

Ideally, just stop gpsd putting any rpaths in...

Cheers,

Richard





