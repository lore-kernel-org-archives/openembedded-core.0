Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THiBX-00074i-DP for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 23:33:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SLKNgL014791;
	Fri, 28 Sep 2012 22:20:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13751-05; Fri, 28 Sep 2012 22:20:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SLKF4m014785
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 22:20:17 +0100
Message-ID: <1348867217.15753.81.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Fri, 28 Sep 2012 22:20:17 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6B7ED0@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347373349.2122.35.camel@ted>
	<1348679272.32611.4.camel@phil-desktop> <1348838588.15753.52.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A6B7ED0@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
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
X-List-Received-Date: Fri, 28 Sep 2012 21:33:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-28 at 20:21 +0000, McClintock Matthew-B29882 wrote:
> I've seen this now:
> 
> ERROR: Logfile of failure stored in:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/temp/log.do_configure.26311
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Removing manifest:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/beagleboard/usr/include/FlexLexer.h
> | DEBUG: Removing manifest:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/beagleboard/usr/lib/libfl.a
> | DEBUG: Removing manifest:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/beagleboard/usr/lib/libfl_pic.a
> | DEBUG: Removing manifest:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/beagleboard/usr/include/
> | DEBUG: Removing manifest:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/beagleboard/usr/share/
> | DEBUG: Removing manifest:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/beagleboard/usr/lib/
> | DEBUG: Removing manifest:
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/beagleboard/usr/
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.3
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later
> <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | NOTE: Executing autoreconf --verbose --install --force
> --exclude=autopoint -I
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/m4/
> -I/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
> -I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/aclocal-copy/
> | autoreconf: Entering directory `.'
> | autoreconf: running: aclocal -I
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/m4/
> -I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
> -I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/aclocal-copy/
> -I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/m4/
> -I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
> -I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/aclocal-copy/
> --force -I m4
> | aclocal: error: aclocal: file
> '/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/sysroots/x86_64-linux/usr/share/aclocal/gconf-2.m4'
> does not exist
> | autoreconf: aclocal failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | ERROR: Function failed: do_configure (see
> /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/temp/log.do_configure.26311
> for further information)

Totally unrelated, likely a transient race we're meant to have fixed but
don't seem to have done so :/

The supposed fix was:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a92ff3ad4212f8966bbd3f6defcb112737d81cda

Cheers,

Richard



