Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1SE0r5-0007sp-9Z
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 18:08:43 +0200
Received: by bkcjg15 with SMTP id jg15so1321187bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 08:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=URBUDvAixYzsXhR2olT3SGoxRW7zuPAJhmmYfYyNaBA=;
	b=ICvcMo/blXU7tnmHWIyENQcI0r1qXFRePMxjKqaIO/GN+Aim46aPLlzBUoBziXIval
	7OLMfj+WPd3gHFFnTmUGzHfBhecujZaokmfbHOtzxWqqiywmOBSjW4c85+2124rl18Tv
	95Om+VpTD85OdUzGnkr4/YAWMdIUzK46ADEPsG1ihzaAtw6QuDWhfeiDO3ATUIMrUH7a
	2CmExIvbzlWS+ZnjUy+GbWLHof3dC8VlcnLHyxYECAnS7fTuD4iQ18yu+Et16TeNYuso
	MNOt3ivRgvwEsemCey24LI5UKIZ+6oIFJDd+A892m9q6WYGjwq5Gg9GXqoghh5jIPCqj
	vEIg==
MIME-Version: 1.0
Received: by 10.204.154.82 with SMTP id n18mr978765bkw.85.1333209577081; Sat,
	31 Mar 2012 08:59:37 -0700 (PDT)
Received: by 10.204.36.8 with HTTP; Sat, 31 Mar 2012 08:59:37 -0700 (PDT)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <1333208042.18082.234.camel@ted>
References: <1333202821.18082.225.camel@ted>
	<CAOSpxdYtrYctG3V=cKTvSPaNdimVDdP-MgCM0HQYdL3szAFVjg@mail.gmail.com>
	<1333208042.18082.234.camel@ted>
Date: Sat, 31 Mar 2012 08:59:37 -0700
Message-ID: <CAOSpxdYFKMVW99UNaWvNGwZ+WhSjUXoXD2XCP1zcuOYBcXFCqg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmuG4k3KiO5RDMZ+6LJRcfPrPRbmRDc4OXgnRb03ILc6JWo799syG92rlhz0/5Vu63l9YQT
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
X-List-Received-Date: Sat, 31 Mar 2012 16:08:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 31, 2012 at 8:34 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Hmm, yes. We already have a bug open against git but I'd like to
> understand shadow-native and sqlite. If you have the failure logs for
> those two, I think it would be worth opening bugs for them.

Details for shadow-native and sqlite below:

shadow-native:

ERROR: Function failed: do_configure (see
/media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/temp/log.do_configure.23277
for further information)
ERROR: Logfile of failure stored in:
/media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/temp/log.do_configure.23277
Log data follows:
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/grpck
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/usermod
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/logoutd
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/vigr
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/nologin
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/chgpasswd
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/grpunconv
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/pwconv
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/groupmems
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/pwunconv
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/groupadd
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/groupdel
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/useradd
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/groupmod
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/grpconv
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/pwck
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/chpasswd.shadow-native
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/newusers
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/userdel
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/vipw
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/chage
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/newgrp.shadow-native
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/passwd.shadow-native
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/groups
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/su
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/chfn.shadow-native
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/expiry
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/gpasswd
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/sg
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/login
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/faillog
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/lastlog
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/chsh.shadow-native
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man3/getspnam.3
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man3/shadow.3
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/chage.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/su.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/gpasswd.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/login.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/expiry.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/chsh.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/groups.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/newgrp.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/sg.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/passwd.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/chfn.1
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/chgpasswd.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/lastlog.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/groupdel.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/groupadd.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/pwck.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/vigr.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/grpunconv.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/pwunconv.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/usermod.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/newusers.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/nologin.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/logoutd.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/grpconv.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/chpasswd.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/useradd.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/pwconv.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/grpck.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/userdel.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/faillog.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/groupmems.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/vipw.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/groupmod.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/passwd.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/limits.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/gshadow.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/login.access.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/shadow.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/porttime.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/login.defs.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/suauth.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/faillog.5
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/etc/login.defs
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/etc/login.access
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/etc/limits
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/etc/default/useradd
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man5/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man8/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man1/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/man3/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/man/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/etc/default/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/sbin/
| DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/
| DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/x86_64-linux/sbin/
| DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/x86_64-linux/etc/
| DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/x86_64-linux/usr/
| DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/x86_64-linux/bin/
| ERROR: Function failed: do_configure (see
/media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/temp/log.do_configure.23277
for further information)
| automake (GNU automake) 1.11.2
| Copyright (C) 2011 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.11
| NOTE: Executing autoreconf --verbose --install --force
--exclude=autopoint
-I/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11
-I /media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/shadow-4.1.4.3/aclocal-copy/
| autoreconf: Entering directory `.'
| autoreconf: running: aclocal -I
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I
/media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/shadow-4.1.4.3/aclocal-copy/
-I /media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11
-I /media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/shadow-4.1.4.3/aclocal-copy/
--force --warnings=cross
| aclocal: unknown warning category `cross'
| configure.in:496: warning: macro `AM_GNU_GETTEXT_VERSION' not found in library
| configure.in:497: warning: macro `AM_GNU_GETTEXT' not found in library
| autoreconf: configure.in: tracing
| autoreconf: configure.in: AM_GNU_GETTEXT_VERSION is used, but not
AM_GNU_GETTEXT
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
| libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| aclocal: unknown warning category `cross'
| configure.in:496: warning: macro `AM_GNU_GETTEXT_VERSION' not found in library
| configure.in:497: warning: macro `AM_GNU_GETTEXT' not found in library
| autoreconf: running:
/media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/autoconf
--include=/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11
--include=/media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/shadow-4.1.4.3/aclocal-copy/
--force --warnings=cross
| configure.in:496: error: possibly undefined macro: AM_GNU_GETTEXT_VERSION
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| configure.in:497: error: possibly undefined macro: AM_GNU_GETTEXT
| autoreconf: /media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/autoconf
failed with exit status: 1
| ERROR: autoreconf execution failed.
NOTE: package shadow-native-4.1.4.3-r3: task do_configure: Failed
ERROR: Task 1316
(/home/steve/source/yocto/poky/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb,
do_configure) failed with exit code '1'

sqlite:

ERROR: Function failed: do_configure (see
/media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/temp/log.do_configure.20769
for further information)
ERROR: Logfile of failure stored in:
/media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/temp/log.do_configure.20769
Log data follows:
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/include/sqlite.h
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so.0
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so.0.8
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so.0.8.6
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/libsqlite.so
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/pkgconfig/sqlite.pc
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/pkgconfig/
| DEBUG: Removing manifest:
/media/data/yocto/tmp/sysroots/omap3-multi/usr/include/
| DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/omap3-multi/usr/lib/
| DEBUG: Removing manifest: /media/data/yocto/tmp/sysroots/omap3-multi/usr/
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']
| ERROR: Function failed: do_configure (see
/media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/temp/log.do_configure.20769
for further information)
| main.mk is patched, no need to configure
| mv: cannot stat
`/media/data/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/sqlite-2.8.17-r7/sqlite.pc':
No such file or directory
NOTE: package sqlite-2.8.17-r7: task do_configure: Failed
ERROR: Task 1673
(/home/steve/source/yocto/poky/meta-openembedded/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb,
do_configure) failed with exit code '1'


