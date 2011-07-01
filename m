Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QchL0-0001xT-4K for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 19:17:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61HDImu013380;
	Fri, 1 Jul 2011 18:13:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12899-09; Fri,  1 Jul 2011 18:13:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61HD9p3013372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 18:13:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309537504.20015.531.camel@rex>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<201106301633.48933.paul.eggleton@linux.intel.com>
	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
	<201106301659.54941.paul.eggleton@linux.intel.com>
	<1309537504.20015.531.camel@rex>
Date: Fri, 01 Jul 2011 18:12:47 +0100
Message-ID: <1309540367.20015.534.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Fri, 01 Jul 2011 17:17:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 17:25 +0100, Richard Purdie wrote:
> On Thu, 2011-06-30 at 16:59 +0100, Paul Eggleton wrote:
> > OK, comprehension fail on my part, sorry. Good to have them listed out 
> > explicitly though, thanks for that. The fatal errors are definitely not good 
> > things to be allowing through if we can avoid it.
> > 
> > Without checking, do you have a handle on how many of these we would have to 
> > fix in OE-core to make it build without fatal errors?
> 
> For a world build of OE-Core/Poky on qemux86 (on a 64 bit machine so it
> is cross) and ignoring desktop errors and things I've posted fixes for:
> 
> db-5.1.19, non dev contains .so, db, /work/i586-poky-linux/db-5.1.19-r3/packages-split/db/usr/lib/libdb-5.so
> perl-5.12.3, package contains RPATH, perl-module-compress, /work/i586-poky-linux/perl-5.12.3-r1/packages-split/perl-module-compress/usr/lib/perl/5.12.3/auto/Compress/Raw/Zlib/Zlib.so
> libxml-parser-perl-2.40, package contains RPATH, libxml-parser-perl, /work/i586-poky-linux/libxml-parser-perl-2.40-r2/packages-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.12.3/auto/XML/Parser/Expat/Expat.so
> oprofile-0.9.6, non dev contains .so, oprofile, /work/i586-poky-linux/oprofile-0.9.6-r1/packages-split/oprofile/usr/lib/oprofile/libopagent.so
> lttng-viewer-0.12.38, non dev contains .so, lttng-viewer, /work/i586-poky-linux/lttng-viewer-0.12.38-r1/packages-split/lttng-viewer/usr/lib/liblttvtraceread.so
> gcc-4.6.0+svnr175150, non dev contains .so, gcc, /work/i586-poky-linux/gcc-4.6.0+svnr175150-r4/packages-split/gcc/usr/libexec/gcc/i586-poky-linux/4.6.1/liblto_plugin.so
> 
> libgsmd-0.1+svnr5394, non dev contains .so, gsmd-plugin-machine-generic, /work/i586-poky-linux/libgsmd-0.1+svnr5394-r2/packages-split/gsmd-plugin-machine-generic/usr/lib/gsmd/libgsmd-machine_generic.so
> libgsmd-0.1+svnr5394, non dev contains .so, gsmd-plugin-machine-tihtc, /work/i586-poky-linux/libgsmd-0.1+svnr5394-r2/packages-split/gsmd-plugin-machine-tihtc/usr/lib/gsmd/libgsmd-machine_tihtc.so
> libgsmd-0.1+svnr5394, non dev contains .so, gsmd-plugin-machine-gta01, /work/i586-poky-linux/libgsmd-0.1+svnr5394-r2/packages-split/gsmd-plugin-machine-gta01/usr/lib/gsmd/libgsmd-machine_gta01.so
> libgsmd-0.1+svnr5394, non dev contains .so, gsmd-plugin-vendor-bcm, /work/i586-poky-linux/libgsmd-0.1+svnr5394-r2/packages-split/gsmd-plugin-vendor-bcm/usr/lib/gsmd/libgsmd-vendor_bcm.so
> libgsmd-0.1+svnr5394, non dev contains .so, gsmd-plugin-vendor-qc, /work/i586-poky-linux/libgsmd-0.1+svnr5394-r2/packages-split/gsmd-plugin-vendor-qc/usr/lib/gsmd/libgsmd-vendor_qc.so
> libgsmd-0.1+svnr5394, non dev contains .so, gsmd-plugin-vendor-ti, /work/i586-poky-linux/libgsmd-0.1+svnr5394-r2/packages-split/gsmd-plugin-vendor-ti/usr/lib/gsmd/libgsmd-vendor_ti.so
> libgsmd-0.1+svnr5394, non dev contains .so, gsmd-plugin-vendor-tihtc, /work/i586-poky-linux/libgsmd-0.1+svnr5394-r2/packages-split/gsmd-plugin-vendor-tihtc/usr/lib/gsmd/libgsmd-vendor_tihtc.so
> qemu-0.14.0, wrong architecture, qemu, /work/i586-poky-linux/qemu-0.14.0-r2/packages-split/qemu/usr/share/qemu/openbios-ppc
> qemu-0.14.0, wrong architecture, qemu, /work/i586-poky-linux/qemu-0.14.0-r2/packages-split/qemu/usr/share/qemu/openbios-sparc32
> qemu-0.14.0, wrong architecture, qemu, /work/i586-poky-linux/qemu-0.14.0-r2/packages-split/qemu/usr/share/qemu/openbios-sparc64
> 
> qt4-x11-free-4.7.3, wrong architecture, qt4-tools-dbg, /work/i586-poky-linux/qt4-x11-free-4.7.3-r23.1/packages-split/qt4-tools-dbg/usr/bin/.debug/uic
> qt4-x11-free-4.7.3, wrong architecture, qt4-tools-dbg, /work/i586-poky-linux/qt4-x11-free-4.7.3-r23.1/packages-split/qt4-tools-dbg/usr/bin/.debug/rcc
> qt4-x11-free-4.7.3, wrong architecture, qt4-tools-dbg, /work/i586-poky-linux/qt4-x11-free-4.7.3-r23.1/packages-split/qt4-tools-dbg/usr/bin/.debug/moc
> qt4-x11-free-4.7.3, wrong architecture, qt4-tools, /work/i586-poky-linux/qt4-x11-free-4.7.3-r23.1/packages-split/qt4-tools/usr/bin/uic
> qt4-x11-free-4.7.3, wrong architecture, qt4-tools, /work/i586-poky-linux/qt4-x11-free-4.7.3-r23.1/packages-split/qt4-tools/usr/bin/rcc
> qt4-x11-free-4.7.3, wrong architecture, qt4-tools, /work/i586-poky-linux/qt4-x11-free-4.7.3-r23.1/packages-split/qt4-tools/usr/bin/moc
> qt4-x11-free-4.7.3, wrong architecture, qt4-linguist, /work/i586-poky-linux/qt4-x11-free-4.7.3-r23.1/packages-split/qt4-linguist/usr/bin/lrelease
> 
> The qemu ones are false positives, the qt ones are nasty as are the
> libxml-parser-perl and perl ones. The .so errors are hard to get excited
> about but should get looked at and resolved.
> 
> In the meantime I'll run a world build for mips or ppc and see if that
> shows anything different up.

Just to update, Nitin will look at the two perl issues, I have fixes
ready for libgsmd and oprofile (will post the patches later). The lttng
one is a false positive.

The gcc one looks simple enough and I'm not sure if the db one is a
false positive or not.

Any volunteers for qt4-x11-free-4.7.3?

Cheers,

Richard



