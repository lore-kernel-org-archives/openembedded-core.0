Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id E63E66D419
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 04:58:54 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id jt11so8548121pbb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2013 20:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=4Rlp5et1P7t3cCxX/8e0ynyrj4at9w0cuNe2vOyOZ1w=;
	b=CVD6zkBVf62C6oHxi9c9SQ6DL2qyiDuHrcR23Odc5VV4dvhO6KbaGoFhQuZSsjgxS5
	buhqUlSE2J8cQlbr9Jvb4J5uOb/8/0s4N/RVPqOWv8K6xWsYqVwpJUbSMSUsj8oG9GVO
	rOFzotBol8aH3V6YHkDcgsnGHzRKmrFioAYweaqlfN7fud75cYF8bhPqqb7JuS0J0rae
	tfkwD6OA1Jwcb7hnW8iK6XXmML5lX/vCjTEjSivzRGwiYg118avhBrVpRkHtW1UIddJN
	pyeqZSYc833bWdYm5/xCT7DncTRiyTrbhn/qFwVwfTaBkSGkYmHbFxR/WyOzFRMjgzPJ
	HiOw==
X-Received: by 10.66.216.193 with SMTP id os1mr1968407pac.29.1383713936478;
	Tue, 05 Nov 2013 20:58:56 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	qw8sm38366670pbb.27.2013.11.05.20.58.55 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Nov 2013 20:58:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5279C70B.90103@linux.intel.com>
Date: Tue, 5 Nov 2013 20:58:54 -0800
Message-Id: <E60C2A2A-EC7B-4A72-8553-B37D7DD19A58@gmail.com>
References: <1383622893-5185-1-git-send-email-raj.khem@gmail.com>
	<5279C70B.90103@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1816)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5] expect: Add recipe
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
X-List-Received-Date: Wed, 06 Nov 2013 04:58:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 5, 2013, at 8:35 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 11/04/2013 07:41 PM, Khem Raj wrote:
>> From: Mihaela Sendrea <mihaela.sendrea@enea.com>
>>=20
>> Nedeed for gcc-runtime tests.
>>=20
>=20
> i am seeing configure fails with this patch
>=20
>> configure:2350: checking for correct TEA configuration
>> configure:2363: result: ok (TEA 3.9)
>> configure:2430: configuring expect 5.45
>> configure:2508: checking for Tcl configuration
>> configure:2528: error: =
/srv/ssd/sgw/builds/world/tmp/sysroots/genericx86/usr/lib directory =
doesn't contain tclConfig.sh


OK what happens if you readd DEPENDS +=3D =93tcl=94 ?
since you have it reproduced may be its best to try it out.


>>=20
> Sau!
>=20
>=20
>=20
>> Fixed build on multilib and add patch to remove
>> !/depot/path/expect -f
>> which caused rpm to puke on rfs generation
>>=20
>> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../expect/expect/0001-configure.in.patch          | 108 =
++++++++++++++++
>>  .../expect/expect/0002-tcl.m4.patch                |  17 +++
>>  .../expect/expect/01-example-shebang.patch         | 144 =
+++++++++++++++++++++
>>  meta/recipes-devtools/expect/expect_5.45.bb        |  60 +++++++++
>>  4 files changed, 329 insertions(+)
>>  create mode 100644 =
meta/recipes-devtools/expect/expect/0001-configure.in.patch
>>  create mode 100644 =
meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
>>  create mode 100644 =
meta/recipes-devtools/expect/expect/01-example-shebang.patch
>>  create mode 100644 meta/recipes-devtools/expect/expect_5.45.bb
>>=20
>> diff --git =
a/meta/recipes-devtools/expect/expect/0001-configure.in.patch =
b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
>> new file mode 100644
>> index 0000000..7595a25
>> --- /dev/null
>> +++ b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
>> @@ -0,0 +1,108 @@
>> +Allow cross compiling.
>> +
>> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
>> +Upstream-Status: Pending
>> +---
>> +diff -uNr a/configure.in b/configure.in
>> +--- a/configure.in	2012-12-14 15:31:32.623180450 +0100
>> ++++ b/configure.in	2012-12-14 15:53:34.518233519 +0100
>> +@@ -481,7 +481,7 @@
>> + ,
>> + 	AC_MSG_RESULT(no)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++	AC_MSG_RESULT(no)
>> + )
>> +
>> + AC_MSG_CHECKING([if any value exists for WNOHANG])
>> +@@ -506,7 +506,9 @@
>> + 	AC_MSG_RESULT(no)
>> + 	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++	AC_MSG_RESULT(yes)
>> ++	AC_DEFINE_UNQUOTED(WNOHANG_BACKUP_VALUE, `cat wnohang`)
>> ++	rm -f wnohang
>> + )
>> +
>> + #
>> +@@ -574,7 +576,8 @@
>> + 	AC_DEFINE(REARM_SIG)
>> + ,
>> + 	AC_MSG_RESULT(no)
>> +-, AC_MSG_WARN([Expect can't be cross compiled])
>> ++,
>> ++	AC_MSG_RESULT(no)
>> + )
>> +
>> + # HPUX7 has trouble with the big cat so split it
>> +@@ -725,7 +728,9 @@
>> + ,
>> +         AC_MSG_RESULT(no)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++        AC_MSG_RESULT(yes)
>> ++        AC_DEFINE(HAVE_SGTTYB)
>> ++        PTY_TYPE=3Dsgttyb
>> + )
>> +
>> + # mach systems have include files for unimplemented features
>> +@@ -749,7 +754,9 @@
>> + ,
>> +         AC_MSG_RESULT(no)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++        AC_DEFINE(HAVE_TERMIO)
>> ++        PTY_TYPE=3Dtermios
>> ++        AC_MSG_RESULT(yes)
>> + )
>> +
>> +   # now check for the new style ttys (not yet posix)
>> +@@ -771,7 +778,9 @@
>> +   ,
>> +         AC_MSG_RESULT(no)
>> +   ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++        AC_DEFINE(HAVE_TERMIOS)
>> ++        PTY_TYPE=3Dtermios
>> ++        AC_MSG_RESULT(yes)
>> +   )
>> + fi
>> +
>> +@@ -794,7 +803,7 @@
>> + ,
>> + 	AC_MSG_RESULT(no)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++	AC_MSG_RESULT(no)
>> + )
>> +
>> + AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])
>> +@@ -816,7 +825,7 @@
>> + ,
>> + 	AC_MSG_RESULT(no)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++	AC_MSG_RESULT(no)
>> + )
>> +
>> + # finally check for Cray style ttys
>> +@@ -837,7 +846,7 @@
>> + ,
>> + 	AC_MSG_RESULT(no)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++	AC_MSG_RESULT(no)
>> + )
>> +
>> + #
>> +@@ -889,7 +898,8 @@
>> + 	AC_MSG_RESULT(yes),
>> + 	AC_MSG_RESULT(no)
>> + ,
>> +-	AC_MSG_ERROR([Expect can't be cross compiled])
>> ++	AC_DEFINE(HAVE_SV_TIMEZONE)
>> ++	AC_MSG_RESULT(yes),
>> + )
>> +
>> +
>> diff --git a/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch =
b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
>> new file mode 100644
>> index 0000000..dc4c6ba
>> --- /dev/null
>> +++ b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
>> @@ -0,0 +1,17 @@
>> +Use proper -L path when cross compiling.
>> +
>> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
>> +Upstream-Status: Pending
>> +---
>> +diff -uNr a/tclconfig/tcl.m4 b/tclconfig/tcl.m4
>> +--- a/tclconfig/tcl.m4	2012-12-14 09:16:58.789861281 +0100
>> ++++ b/tclconfig/tcl.m4	2012-12-14 10:55:43.542297010 +0100
>> +@@ -371,7 +371,7 @@
>> +     # of TCL_BUILD_LIB_SPEC. An extension should make use of =
TCL_LIB_SPEC
>> +     # instead of TCL_BUILD_LIB_SPEC since it will work with both an
>> +     # installed and uninstalled version of Tcl.
>> +-    if test -f "${TCL_BIN_DIR}/Makefile" ; then
>> ++    if test -f "${TCL_BIN_DIR}/Makefile" || test "$cross_compiling" =
=3D yes; then
>> +         TCL_LIB_SPEC=3D"${TCL_BUILD_LIB_SPEC}"
>> +         TCL_STUB_LIB_SPEC=3D"${TCL_BUILD_STUB_LIB_SPEC}"
>> +         TCL_STUB_LIB_PATH=3D"${TCL_BUILD_STUB_LIB_PATH}"
>> diff --git =
a/meta/recipes-devtools/expect/expect/01-example-shebang.patch =
b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
>> new file mode 100644
>> index 0000000..8597f31
>> --- /dev/null
>> +++ b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
>> @@ -0,0 +1,144 @@
>> +Author: Mike Markley <mike@markley.org>
>> +Author: Sergei Golovan <sgolovan@debian.org>
>> +Description: Fixes shebangs in examples (Closes: #152367).
>> +
>> +Backported from Debian
>> +
>> +Upstream-Status: Pending
>> +Index: expect5.45/example/beer.exp
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/beer.exp	2006-01-25 =
13:51:39.000000000 -0800
>> ++++ expect5.45/example/beer.exp	2013-11-01 17:35:19.817318341 =
-0700
>> +@@ -1,4 +1,9 @@
>> +-#!/depot/path/expect -f
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> +
>> + # 99 bottles of beer on the wall, Expect-style
>> + # Author: Don Libes <libes@nist.gov>
>> +Index: expect5.45/example/expectd.proto
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/expectd.proto	2010-07-02 =
09:03:31.000000000 -0700
>> ++++ expect5.45/example/expectd.proto	2013-11-01 =
17:35:19.821318341 -0700
>> +@@ -1,4 +1,10 @@
>> +-#!/depot/tcl/src/expect/e --
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> ++
>> + # Description: Simple fragment to begin a telnet daemon
>> + # For more information, see Chapter 17 of "Exploring Expect"
>> + # Author: Don Libes, NIST
>> +Index: expect5.45/example/irsh
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/irsh	2010-07-02 09:03:31.000000000 =
-0700
>> ++++ expect5.45/example/irsh	2013-11-01 17:35:19.821318341 -0700
>> +@@ -1,4 +1,9 @@
>> +-#!/depot/path/expect --
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> +
>> + # Do rsh interactively.  For example, consider the following =
command:
>> + #    rsh <remote> ls -l "|" more
>> +Index: expect5.45/example/passwd.cgi
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/passwd.cgi	2000-01-06 =
15:22:07.000000000 -0800
>> ++++ expect5.45/example/passwd.cgi	2013-11-01 17:35:19.821318341 =
-0700
>> +@@ -1,4 +1,9 @@
>> +-#!/depot/path/expect --
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> +
>> + # This is a CGI script to process requests created by the =
accompanying
>> + # passwd.html form.  This script is pretty basic, although it is
>> +Index: expect5.45/example/passwdprompt
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/passwdprompt	2003-09-05 =
12:01:59.000000000 -0700
>> ++++ expect5.45/example/passwdprompt	2013-11-01 17:35:19.821318341 =
-0700
>> +@@ -1,4 +1,9 @@
>> +-#!/depot/path/expect
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> +
>> + # This script prompts for a passwd from stdin while echoing *'s
>> +
>> +Index: expect5.45/example/reprompt
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/reprompt	2000-01-06 =
15:22:07.000000000 -0800
>> ++++ expect5.45/example/reprompt	2013-11-01 17:35:19.821318341 =
-0700
>> +@@ -1,4 +1,9 @@
>> +-#!/depot/path/expect --
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> +
>> + # Name: reprompt
>> + # Description: reprompt every so often until user enters something
>> +Index: expect5.45/example/term_expect
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/term_expect	2005-02-15 =
10:11:31.000000000 -0800
>> ++++ expect5.45/example/term_expect	2013-11-01 17:35:19.821318341 =
-0700
>> +@@ -1,4 +1,9 @@
>> +-#!/depot/path/expectk
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec wish "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> +
>> + # Name: tkterm - terminal emulator using Expect and Tk text widget, =
v3.0
>> + # Author: Don Libes, July '94
>> +Index: expect5.45/example/vrfy
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/vrfy	2010-07-02 09:03:31.000000000 =
-0700
>> ++++ expect5.45/example/vrfy	2013-11-01 17:35:19.821318341 -0700
>> +@@ -1,4 +1,9 @@
>> +-#!/depot/path/expect -f
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> +
>> +
>> + # separate address into user and host
>> +Index: expect5.45/example/xrlogin
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- expect5.45.orig/example/xrlogin	2000-01-06 15:22:08.000000000 =
-0800
>> ++++ expect5.45/example/xrlogin	2013-11-01 17:35:19.821318341 =
-0700
>> +@@ -1,4 +1,10 @@
>> +-#!/depot/path/expect --
>> ++#!/bin/sh
>> ++# -*- tcl -*-
>> ++# The next line is executed by /bin/sh, but not tcl \
>> ++exec tclsh "$0" ${1+"$@"}
>> ++
>> ++package require Expect
>> ++
>> + # xrlogin - rlogin but with current DISPLAY
>> + #
>> + # You can extend this idea to save any arbitrary information across =
rlogin
>> diff --git a/meta/recipes-devtools/expect/expect_5.45.bb =
b/meta/recipes-devtools/expect/expect_5.45.bb
>> new file mode 100644
>> index 0000000..ecc5e75
>> --- /dev/null
>> +++ b/meta/recipes-devtools/expect/expect_5.45.bb
>> @@ -0,0 +1,60 @@
>> +SUMMARY =3D "tool for automating interactive applications according =
to a script"
>> +DESCRIPTION =3D "Expect is a tool for automating interactive =
applications according to a script. \
>> +Following the script, Expect knows what can be expected from a =
program and what \
>> +the correct response should be. Expect is also useful for testing =
these same \
>> +applications. And by adding Tk, you can also wrap interactive =
applications in \
>> +X11 GUIs. An interpreted language provides branching and high-level =
control \
>> +structures to direct the dialogue. In addition, the user can take =
control and \
>> +interact directly when desired, afterward returning control to the =
script. \
>> +"
>> +HOMEPAGE =3D "http://sourceforge.net/projects/expect/"
>> +LICENSE=3D"PD"
>> +SECTION =3D "devel"
>> +
>> +LIC_FILES_CHKSUM =3D =
"file://license.terms;md5=3Dfbf2de7e9102505b1439db06fc36ce5c"
>> +
>> +RDEPENDS_${PN} =3D "tcl"
>> +
>> +inherit autotools
>> +
>> +SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>> +           file://0001-configure.in.patch \
>> +           file://0002-tcl.m4.patch \
>> +           file://01-example-shebang.patch \
>> +          "
>> +SRC_URI[md5sum] =3D "44e1a4f4c877e9ddc5a542dfa7ecc92b"
>> +SRC_URI[sha256sum] =3D =
"b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
>> +
>> +S =3D "${WORKDIR}/${BPN}${PV}"
>> +
>> +do_install_append() {
>> +	install -d ${D}${libdir}
>> +        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   =
${D}${libdir}/
>> +        install -m 0755 ${S}/fixline1           =
${D}${libdir}/expect${PV}/
>> +        install -m 0755 ${S}/example/*          =
${D}${libdir}/expect${PV}/
>> +        rm ${D}${libdir}/expect${PV}/libexpect*.so
>> +}
>> +
>> +EXTRA_OECONF +=3D "--includedir=3D${STAGING_INCDIR} \
>> +                 --with-tcl=3D${STAGING_LIBDIR} \
>> +                 --with-tclinclude=3D${STAGING_INCDIR} \
>> +                 --enable-shared \
>> +                 --enable-threads \
>> +                 --disable-rpath \
>> +                "
>> +EXTRA_OEMAKE_install =3D " 'SCRIPTS=3D' "
>> +
>> +FILES_${PN}-dbg +=3D "${libdir}/${BPN}${PV}/.debug \
>> +                    ${libdir}/.debug \
>> +                   "
>> +FILES_${PN}-dev =3D "${libdir_native}/expect${PV}/libexpect*.so \
>> +                   ${STAGING_INCDIR}/expect.h \
>> +                   ${STAGING_INCDIR}/expect_tcl.h \
>> +                   ${STAGING_INCDIR}/expect_comm.h \
>> +                   ${STAGING_INCDIR}/tcldbg.h \
>> +                   ${includedir}/*.h \
>> +                  "
>> +
>> +FILES_${PN} +=3D "${libdir}/libexpect${PV}.so \
>> +                ${libdir}/expect${PV}/* \
>> +               "
>>=20


