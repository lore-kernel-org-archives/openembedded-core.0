Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C14C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 22:00:43 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.246.1637186442726001313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 14:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M7UZhCOM;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id y5so9148181ual.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 14:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZYbtKfBQvm9Xi+MreqIRCOQewg3oct/JCpumXQlNl3o=;
        b=M7UZhCOMPazWPKJyj0CrV0WaKBa1y4gBW717iKNx7JL477Jflb+4+yEL07TRSqZgBi
         GQuCDIe+Ipq2eAPgTexIgtwYEeZi9IaOHq33u7QWmRqRtKBVrDXH6M7AZcBJ5ZiSYPEP
         e8xJ0f7dDnZegGBKGaWDgN+lJ6gjx07l8q1A+UZ7IE8+MznvNftvjGC4nmY1FAMu7Jcq
         E504gzJPdF2VL70XV0VNru3woTf5IE3CsCaVppzKtGEcf19lfHETe9/0wTHF3ERuKFct
         U19djyyTzfUWywTi6NjoYZ2zc41TU5YbFOfC7+8PgtmVpaDcmzRGut4rxgse24I1rmFl
         vaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZYbtKfBQvm9Xi+MreqIRCOQewg3oct/JCpumXQlNl3o=;
        b=ceffPgdZDDFAMBkyFQ69fw5pWKojX5eDQTnuO3t/n7BhPciJ6J9flJMMOmSnaRHy2K
         xP9Y79mIoVjFAQVMATFXL854+VNQpYsXfMgRJRSKK4KlgoGDVtSC0MnY2AJaf+mJ5rNd
         0s8Uks0e3WR/tsOf1po36a5R1gPdkSaZl3jlzdXNjBRFiFbLo47Om7YCPcal+pCcYphm
         w+tsg4LUukGbvFVJ5DzGDJId+Z48KWrRpnCZRFHG9KaNOOyNtOA216sTsIRTvrOgSBzP
         b40LvmLieXPHxi4H7Aorm34i7OZiXuScaNoTvnM9EK/5ptKyRE1wHQ6AzrYYnqn2ZgX8
         Jc0A==
X-Gm-Message-State: AOAM531bY951OJWbCbQwucKcX1NHEyK2BZldYirv/ZgNpPRkeLuPzQsw
	2kXnrpTDocXyNRqB70qE8Kb4ngnladqMEfdqYG0=
X-Google-Smtp-Source: 
 ABdhPJw6TZFVERqbgOqwGwqgGacIGqGiOowKLTPf429VyL9wqxWdF67bWtYu2WG2WX1S0pIYvYR66dIp8lrYcd1H5mE=
X-Received: by 2002:ab0:1e04:: with SMTP id m4mr29046597uak.100.1637186441831;
 Wed, 17 Nov 2021 14:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-33-alex@linutronix.de>
 <d262e394-c2b6-de95-7a08-ea2f7afa10f5@gmail.com>
In-Reply-To: <d262e394-c2b6-de95-7a08-ea2f7afa10f5@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 23:00:30 +0100
Message-ID: 
 <CANNYZj_6gWxy2VMwJ+Hz1fdQnZ-OedCSq0tb+NK3KJ6PnxOd=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 33/36] expect: do not install examples, drop
 related patch
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000004be8f605d1032c9b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 22:00:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158460

--0000000000004be8f605d1032c9b
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Nov 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:

> yes perhaps as part of main PN package its not but as a separate package
> something like PN-examples or some such it will be better
>

If upstream doesn't install them, there's no need to override that; they're
just example code snippets that serve no purpose on embedded targets.

Alex



>
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   .../expect/expect/01-example-shebang.patch    | 144 ------------------
> >   meta/recipes-devtools/expect/expect_5.45.4.bb |   2 -
> >   2 files changed, 146 deletions(-)
> >   delete mode 100644
> meta/recipes-devtools/expect/expect/01-example-shebang.patch
> >
> > diff --git
> a/meta/recipes-devtools/expect/expect/01-example-shebang.patch
> b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
> > deleted file mode 100644
> > index 8597f31387..0000000000
> > --- a/meta/recipes-devtools/expect/expect/01-example-shebang.patch
> > +++ /dev/null
> > @@ -1,144 +0,0 @@
> > -Author: Mike Markley <mike@markley.org>
> > -Author: Sergei Golovan <sgolovan@debian.org>
> > -Description: Fixes shebangs in examples (Closes: #152367).
> > -
> > -Backported from Debian
> > -
> > -Upstream-Status: Pending
> > -Index: expect5.45/example/beer.exp
> > -===================================================================
> > ---- expect5.45.orig/example/beer.exp 2006-01-25 13:51:39.000000000 -0800
> > -+++ expect5.45/example/beer.exp      2013-11-01 17:35:19.817318341 -0700
> > -@@ -1,4 +1,9 @@
> > --#!/depot/path/expect -f
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -
> > - # 99 bottles of beer on the wall, Expect-style
> > - # Author: Don Libes <libes@nist.gov>
> > -Index: expect5.45/example/expectd.proto
> > -===================================================================
> > ---- expect5.45.orig/example/expectd.proto    2010-07-02
> 09:03:31.000000000 -0700
> > -+++ expect5.45/example/expectd.proto 2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,10 @@
> > --#!/depot/tcl/src/expect/e --
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -+
> > - # Description: Simple fragment to begin a telnet daemon
> > - # For more information, see Chapter 17 of "Exploring Expect"
> > - # Author: Don Libes, NIST
> > -Index: expect5.45/example/irsh
> > -===================================================================
> > ---- expect5.45.orig/example/irsh     2010-07-02 09:03:31.000000000 -0700
> > -+++ expect5.45/example/irsh  2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,9 @@
> > --#!/depot/path/expect --
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -
> > - # Do rsh interactively.  For example, consider the following command:
> > - #    rsh <remote> ls -l "|" more
> > -Index: expect5.45/example/passwd.cgi
> > -===================================================================
> > ---- expect5.45.orig/example/passwd.cgi       2000-01-06
> 15:22:07.000000000 -0800
> > -+++ expect5.45/example/passwd.cgi    2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,9 @@
> > --#!/depot/path/expect --
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -
> > - # This is a CGI script to process requests created by the accompanying
> > - # passwd.html form.  This script is pretty basic, although it is
> > -Index: expect5.45/example/passwdprompt
> > -===================================================================
> > ---- expect5.45.orig/example/passwdprompt     2003-09-05
> 12:01:59.000000000 -0700
> > -+++ expect5.45/example/passwdprompt  2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,9 @@
> > --#!/depot/path/expect
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -
> > - # This script prompts for a passwd from stdin while echoing *'s
> > -
> > -Index: expect5.45/example/reprompt
> > -===================================================================
> > ---- expect5.45.orig/example/reprompt 2000-01-06 15:22:07.000000000 -0800
> > -+++ expect5.45/example/reprompt      2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,9 @@
> > --#!/depot/path/expect --
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -
> > - # Name: reprompt
> > - # Description: reprompt every so often until user enters something
> > -Index: expect5.45/example/term_expect
> > -===================================================================
> > ---- expect5.45.orig/example/term_expect      2005-02-15
> 10:11:31.000000000 -0800
> > -+++ expect5.45/example/term_expect   2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,9 @@
> > --#!/depot/path/expectk
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec wish "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -
> > - # Name: tkterm - terminal emulator using Expect and Tk text widget,
> v3.0
> > - # Author: Don Libes, July '94
> > -Index: expect5.45/example/vrfy
> > -===================================================================
> > ---- expect5.45.orig/example/vrfy     2010-07-02 09:03:31.000000000 -0700
> > -+++ expect5.45/example/vrfy  2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,9 @@
> > --#!/depot/path/expect -f
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -
> > -
> > - # separate address into user and host
> > -Index: expect5.45/example/xrlogin
> > -===================================================================
> > ---- expect5.45.orig/example/xrlogin  2000-01-06 15:22:08.000000000 -0800
> > -+++ expect5.45/example/xrlogin       2013-11-01 17:35:19.821318341 -0700
> > -@@ -1,4 +1,10 @@
> > --#!/depot/path/expect --
> > -+#!/bin/sh
> > -+# -*- tcl -*-
> > -+# The next line is executed by /bin/sh, but not tcl \
> > -+exec tclsh "$0" ${1+"$@"}
> > -+
> > -+package require Expect
> > -+
> > - # xrlogin - rlogin but with current DISPLAY
> > - #
> > - # You can extend this idea to save any arbitrary information across
> rlogin
> > diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb
> b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > index e27b0d9d71..4214ab0f27 100644
> > --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> > +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > @@ -21,7 +21,6 @@ inherit autotools update-alternatives
> >   SRC_URI =
> "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
> >              file://0001-configure.in.patch \
> >              file://0002-tcl.m4.patch \
> > -           file://01-example-shebang.patch \
> >
> file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
> >              file://0001-Resolve-string-formatting-issues.patch \
> >
> file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
> > @@ -39,7 +38,6 @@ do_install:append() {
> >       install -d ${D}${libdir}
> >           install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so
>  ${D}${libdir}/
> >           install -m 0755 ${S}/fixline1
>  ${D}${libdir}/expect${PV}/
> > -        install -m 0755 ${S}/example/*
> ${D}${libdir}/expect${PV}/
> >           rm ${D}${libdir}/expect${PV}/libexpect*.so
> >           sed -e 's|$dir|${libdir}|' -i
> ${D}${libdir}/expect${PV}/pkgIndex.tcl
> >   }
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158455):
> https://lists.openembedded.org/g/openembedded-core/message/158455
> Mute This Topic: https://lists.openembedded.org/mt/87122010/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004be8f605d1032c9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 17 Nov 2021 at 20:05, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
yes perhaps as part of main PN package its not but as a separate package <b=
r>
something like PN-examples or some such it will be better<br></blockquote><=
div><br></div><div>If upstream doesn&#39;t install them, there&#39;s no nee=
d to override that; they&#39;re just example code snippets that serve no pu=
rpose on embedded targets.</div><div><br></div><div>Alex<br></div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../expect/expect/01-example-shebang.patch=C2=A0 =C2=A0 | =
144 ------------------<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/expect/<a href=3D"http://expect_5.45=
.4.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a> |=C2=A0 =
=C2=A02 -<br>
&gt;=C2=A0 =C2=A02 files changed, 146 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/expect/expect/01-=
example-shebang.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/expect/expect/01-example-shebang.pa=
tch b/meta/recipes-devtools/expect/expect/01-example-shebang.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 8597f31387..0000000000<br>
&gt; --- a/meta/recipes-devtools/expect/expect/01-example-shebang.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,144 +0,0 @@<br>
&gt; -Author: Mike Markley &lt;<a href=3D"mailto:mike@markley.org" target=
=3D"_blank">mike@markley.org</a>&gt;<br>
&gt; -Author: Sergei Golovan &lt;<a href=3D"mailto:sgolovan@debian.org" tar=
get=3D"_blank">sgolovan@debian.org</a>&gt;<br>
&gt; -Description: Fixes shebangs in examples (Closes: #152367).<br>
&gt; -<br>
&gt; -Backported from Debian<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Index: expect5.45/example/beer.exp<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/beer.exp 2006-01-25 13:51:39.000000000 -0=
800<br>
&gt; -+++ expect5.45/example/beer.exp=C2=A0 =C2=A0 =C2=A0 2013-11-01 17:35:=
19.817318341 -0700<br>
&gt; -@@ -1,4 +1,9 @@<br>
&gt; --#!/depot/path/expect -f<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -<br>
&gt; - # 99 bottles of beer on the wall, Expect-style<br>
&gt; - # Author: Don Libes &lt;<a href=3D"mailto:libes@nist.gov" target=3D"=
_blank">libes@nist.gov</a>&gt;<br>
&gt; -Index: expect5.45/example/expectd.proto<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/expectd.proto=C2=A0 =C2=A0 2010-07-02 09:=
03:31.000000000 -0700<br>
&gt; -+++ expect5.45/example/expectd.proto 2013-11-01 17:35:19.821318341 -0=
700<br>
&gt; -@@ -1,4 +1,10 @@<br>
&gt; --#!/depot/tcl/src/expect/e --<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -+<br>
&gt; - # Description: Simple fragment to begin a telnet daemon<br>
&gt; - # For more information, see Chapter 17 of &quot;Exploring Expect&quo=
t;<br>
&gt; - # Author: Don Libes, NIST<br>
&gt; -Index: expect5.45/example/irsh<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/irsh=C2=A0 =C2=A0 =C2=A02010-07-02 09:03:=
31.000000000 -0700<br>
&gt; -+++ expect5.45/example/irsh=C2=A0 2013-11-01 17:35:19.821318341 -0700=
<br>
&gt; -@@ -1,4 +1,9 @@<br>
&gt; --#!/depot/path/expect --<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -<br>
&gt; - # Do rsh interactively.=C2=A0 For example, consider the following co=
mmand:<br>
&gt; - #=C2=A0 =C2=A0 rsh &lt;remote&gt; ls -l &quot;|&quot; more<br>
&gt; -Index: expect5.45/example/passwd.cgi<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/passwd.cgi=C2=A0 =C2=A0 =C2=A0 =C2=A02000=
-01-06 15:22:07.000000000 -0800<br>
&gt; -+++ expect5.45/example/passwd.cgi=C2=A0 =C2=A0 2013-11-01 17:35:19.82=
1318341 -0700<br>
&gt; -@@ -1,4 +1,9 @@<br>
&gt; --#!/depot/path/expect --<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -<br>
&gt; - # This is a CGI script to process requests created by the accompanyi=
ng<br>
&gt; - # passwd.html form.=C2=A0 This script is pretty basic, although it i=
s<br>
&gt; -Index: expect5.45/example/passwdprompt<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/passwdprompt=C2=A0 =C2=A0 =C2=A02003-09-0=
5 12:01:59.000000000 -0700<br>
&gt; -+++ expect5.45/example/passwdprompt=C2=A0 2013-11-01 17:35:19.8213183=
41 -0700<br>
&gt; -@@ -1,4 +1,9 @@<br>
&gt; --#!/depot/path/expect<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -<br>
&gt; - # This script prompts for a passwd from stdin while echoing *&#39;s<=
br>
&gt; -<br>
&gt; -Index: expect5.45/example/reprompt<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/reprompt 2000-01-06 15:22:07.000000000 -0=
800<br>
&gt; -+++ expect5.45/example/reprompt=C2=A0 =C2=A0 =C2=A0 2013-11-01 17:35:=
19.821318341 -0700<br>
&gt; -@@ -1,4 +1,9 @@<br>
&gt; --#!/depot/path/expect --<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -<br>
&gt; - # Name: reprompt<br>
&gt; - # Description: reprompt every so often until user enters something<b=
r>
&gt; -Index: expect5.45/example/term_expect<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/term_expect=C2=A0 =C2=A0 =C2=A0 2005-02-1=
5 10:11:31.000000000 -0800<br>
&gt; -+++ expect5.45/example/term_expect=C2=A0 =C2=A02013-11-01 17:35:19.82=
1318341 -0700<br>
&gt; -@@ -1,4 +1,9 @@<br>
&gt; --#!/depot/path/expectk<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec wish &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -<br>
&gt; - # Name: tkterm - terminal emulator using Expect and Tk text widget, =
v3.0<br>
&gt; - # Author: Don Libes, July &#39;94<br>
&gt; -Index: expect5.45/example/vrfy<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/vrfy=C2=A0 =C2=A0 =C2=A02010-07-02 09:03:=
31.000000000 -0700<br>
&gt; -+++ expect5.45/example/vrfy=C2=A0 2013-11-01 17:35:19.821318341 -0700=
<br>
&gt; -@@ -1,4 +1,9 @@<br>
&gt; --#!/depot/path/expect -f<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -<br>
&gt; -<br>
&gt; - # separate address into user and host<br>
&gt; -Index: expect5.45/example/xrlogin<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- expect5.45.orig/example/xrlogin=C2=A0 2000-01-06 15:22:08.0000000=
00 -0800<br>
&gt; -+++ expect5.45/example/xrlogin=C2=A0 =C2=A0 =C2=A0 =C2=A02013-11-01 1=
7:35:19.821318341 -0700<br>
&gt; -@@ -1,4 +1,10 @@<br>
&gt; --#!/depot/path/expect --<br>
&gt; -+#!/bin/sh<br>
&gt; -+# -*- tcl -*-<br>
&gt; -+# The next line is executed by /bin/sh, but not tcl \<br>
&gt; -+exec tclsh &quot;$0&quot; ${1+&quot;$@&quot;}<br>
&gt; -+<br>
&gt; -+package require Expect<br>
&gt; -+<br>
&gt; - # xrlogin - rlogin but with current DISPLAY<br>
&gt; - #<br>
&gt; - # You can extend this idea to save any arbitrary information across =
rlogin<br>
&gt; diff --git a/meta/recipes-devtools/expect/<a href=3D"http://expect_5.4=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a> b/meta/re=
cipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb" rel=3D"noreferrer=
" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; index e27b0d9d71..4214ab0f27 100644<br>
&gt; --- a/meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; +++ b/meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; @@ -21,7 +21,6 @@ inherit autotools update-alternatives<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/expect/Expect/${PV=
}/${BPN}${PV}.tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.=
in.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-tcl.m4.pat=
ch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://01-example-shebang.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-expect-ins=
tall-scripts-without-using-the-fixline1-tc.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Resolve-st=
ring-formatting-issues.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-expect-Fix=
-segfaults-if-Tcl-is-built-with-stubs-and-.patch \<br>
&gt; @@ -39,7 +38,6 @@ do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${D}${libdir}/=
expect${PV}/libexpect*.so=C2=A0 =C2=A0${D}${libdir}/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/fixline1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir}/expect${PV}/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/example/*=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/expect${PV}/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/expect${PV}/l=
ibexpect*.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|$dir|${libdir}|&=
#39; -i ${D}${libdir}/expect${PV}/pkgIndex.tcl<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158455): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158455" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158455</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87122010/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87122010/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004be8f605d1032c9b--

