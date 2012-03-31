Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SE1j3-0000Gg-48 for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 19:04:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VGtNHP025033;
	Sat, 31 Mar 2012 17:55:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23140-09; Sat, 31 Mar 2012 17:55:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VGtDO3025027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 31 Mar 2012 17:55:14 +0100
Message-ID: <1333212913.18082.247.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Date: Sat, 31 Mar 2012 17:55:13 +0100
In-Reply-To: <CAOSpxdYFKMVW99UNaWvNGwZ+WhSjUXoXD2XCP1zcuOYBcXFCqg@mail.gmail.com>
References: <1333202821.18082.225.camel@ted>
	<CAOSpxdYtrYctG3V=cKTvSPaNdimVDdP-MgCM0HQYdL3szAFVjg@mail.gmail.com>
	<1333208042.18082.234.camel@ted>
	<CAOSpxdYFKMVW99UNaWvNGwZ+WhSjUXoXD2XCP1zcuOYBcXFCqg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Re-execution of tasks - test report and results
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
X-List-Received-Date: Sat, 31 Mar 2012 17:04:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-31 at 08:59 -0700, Steve Sakoman wrote:
> On Sat, Mar 31, 2012 at 8:34 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> 
> > Hmm, yes. We already have a bug open against git but I'd like to
> > understand shadow-native and sqlite. If you have the failure logs for
> > those two, I think it would be worth opening bugs for them.
> 
> Details for shadow-native and sqlite below:
> 
> shadow-native:
> 
> | aclocal: unknown warning category `cross'
> | configure.in:496: warning: macro `AM_GNU_GETTEXT_VERSION' not found in library
> | configure.in:497: warning: macro `AM_GNU_GETTEXT' not found in library
> | autoreconf: configure.in: tracing
> | autoreconf: configure.in: AM_GNU_GETTEXT_VERSION is used, but not
> AM_GNU_GETTEXT
> | autoreconf: running: libtoolize --copy --force
> | libtoolize: putting auxiliary files in `.'.
> | libtoolize: copying file `./ltmain.sh'
> | libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
> | libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
> | libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
> | aclocal: unknown warning category `cross'
> | configure.in:496: warning: macro `AM_GNU_GETTEXT_VERSION' not found in library
> | configure.in:497: warning: macro `AM_GNU_GETTEXT' not found in library
> | autoreconf: running:
> /media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/autoconf
> --include=/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11
> --include=/media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/shadow-4.1.4.3/aclocal-copy/
> --force --warnings=cross
> | configure.in:496: error: possibly undefined macro: AM_GNU_GETTEXT_VERSION
> |       If this token and others are legitimate, please use m4_pattern_allow.
> |       See the Autoconf documentation.
> | configure.in:497: error: possibly undefined macro: AM_GNU_GETTEXT
> | autoreconf: /media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/autoconf
> failed with exit status: 1
> | ERROR: autoreconf execution failed.
> NOTE: package shadow-native-4.1.4.3-r3: task do_configure: Failed
> ERROR: Task 1316
> (/home/steve/source/yocto/poky/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb,
> do_configure) failed with exit code '1'

This looks like a missing gettext dependency...

> sqlite:
> 
> ERROR: Function failed: do_configure (see
> /media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/temp/log.do_configure.20769
> for further information)
> ERROR: Logfile of failure stored in:
> /media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/temp/log.do_configure.20769
> Log data follows:
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/include/sqlite.h
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so.0
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so.0.8
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so.0.8.6
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/pkgconfig/sqlite.pc
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/pkgconfig/
> | DEBUG: Removing manifest:
> /media/data/yocto/tmp/sysroots/omap3-multi/usr/include/
> | DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/
> | DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/omap3-multi/usr/
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | ERROR: Function failed: do_configure (see
> /media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/temp/log.do_configure.20769
> for further information)
> | main.mk is patched, no need to configure
> | mv: cannot stat
> `/media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/sqlite.pc':
> No such file or directory
> NOTE: package sqlite-2.8.17-r7: task do_configure: Failed
> ERROR: Task 1673
> (/home/steve/source/yocto/poky/meta-openembedded/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb,
> do_configure) failed with exit code '1'

I've just realised, this is from meta-oe, not OE-Core. sqlite3 doesn't
seem to have this problem...

Cheers,

Richard




