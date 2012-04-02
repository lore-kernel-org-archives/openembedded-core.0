Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SEYMA-0000FU-Ih for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 05:55:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q323jtKY004777;
	Mon, 2 Apr 2012 04:45:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03987-03; Mon,  2 Apr 2012 04:45:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q323jgLd004771
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 2 Apr 2012 04:45:44 +0100
Message-ID: <1333338343.647.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Apr 2012 04:45:43 +0100
In-Reply-To: <1333212913.18082.247.camel@ted>
References: <1333202821.18082.225.camel@ted>
	<CAOSpxdYtrYctG3V=cKTvSPaNdimVDdP-MgCM0HQYdL3szAFVjg@mail.gmail.com>
	<1333208042.18082.234.camel@ted>
	<CAOSpxdYFKMVW99UNaWvNGwZ+WhSjUXoXD2XCP1zcuOYBcXFCqg@mail.gmail.com>
	<1333212913.18082.247.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Steve Sakoman <steve@sakoman.com>
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
X-List-Received-Date: Mon, 02 Apr 2012 03:55:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-31 at 17:55 +0100, Richard Purdie wrote:
> On Sat, 2012-03-31 at 08:59 -0700, Steve Sakoman wrote:
> > On Sat, Mar 31, 2012 at 8:34 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > 
> > > Hmm, yes. We already have a bug open against git but I'd like to
> > > understand shadow-native and sqlite. If you have the failure logs for
> > > those two, I think it would be worth opening bugs for them.
> > 
> > Details for shadow-native and sqlite below:
> > 
> > shadow-native:
> > 
> > | aclocal: unknown warning category `cross'
> > | configure.in:496: warning: macro `AM_GNU_GETTEXT_VERSION' not found in library
> > | configure.in:497: warning: macro `AM_GNU_GETTEXT' not found in library
> > | autoreconf: configure.in: tracing
> > | autoreconf: configure.in: AM_GNU_GETTEXT_VERSION is used, but not
> > AM_GNU_GETTEXT
> > | autoreconf: running: libtoolize --copy --force
> > | libtoolize: putting auxiliary files in `.'.
> > | libtoolize: copying file `./ltmain.sh'
> > | libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
> > | libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
> > | libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
> > | aclocal: unknown warning category `cross'
> > | configure.in:496: warning: macro `AM_GNU_GETTEXT_VERSION' not found in library
> > | configure.in:497: warning: macro `AM_GNU_GETTEXT' not found in library
> > | autoreconf: running:
> > /media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/autoconf
> > --include=/media/data/yocto/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11
> > --include=/media/data/yocto/tmp/work/x86_64-linux/shadow-native-4.1.4.3-r3/shadow-4.1.4.3/aclocal-copy/
> > --force --warnings=cross
> > | configure.in:496: error: possibly undefined macro: AM_GNU_GETTEXT_VERSION
> > |       If this token and others are legitimate, please use m4_pattern_allow.
> > |       See the Autoconf documentation.
> > | configure.in:497: error: possibly undefined macro: AM_GNU_GETTEXT
> > | autoreconf: /media/data/yocto/tmp/sysroots/x86_64-linux/usr/bin/autoconf
> > failed with exit status: 1
> > | ERROR: autoreconf execution failed.
> > NOTE: package shadow-native-4.1.4.3-r3: task do_configure: Failed
> > ERROR: Task 1316
> > (/home/steve/source/yocto/poky/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb,
> > do_configure) failed with exit code '1'
> 
> This looks like a missing gettext dependency...

I think its more subtle than that. I think gettext-minimal-native and
gettext-native are trampling over each other's files. This can probably
be reproduced with:

bitbake gettext-minimal-native
bitbake gettext-native
bitbake gettext-native -c clean
bitbake shadow-native

I think the fix should be something like:

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 4144d2b..0ed5dd9 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PR = "r10"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
-DEPENDS_virtclass-native = "libxml2-native"
+DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = "virtual/gettext-native"
 CONFLICTS_${PN} = "proxy-libintl"
@@ -95,4 +95,8 @@ do_install_append() {
     rm -f ${D}${libdir}/preloadable_libintl.so
 }
 
+do_install_append_virtclass-native () {
+	rm ${D}${datadir}/aclocal/*
+}
+
 BBCLASSEXTEND = "native nativesdk"

although I'm travelling at the moment and have not tested this yet.

Cheers,

Richard



