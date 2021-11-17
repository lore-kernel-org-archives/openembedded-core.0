Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942B9C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 23:10:11 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.314.1637190606776519330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 15:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QW6WdLqO;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id de30so4414063qkb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 15:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cca032dAv35Zv32KV1sRMmNxjRXI1+Q6qKedKbUXFcw=;
        b=QW6WdLqONBQaqYDKhxNW5HjnHyyWaRU91PRdJyMDSTwruxBa5qKUvZ86oGyV+/X5W+
         /0HDCzTUX3ScCq4CZCvOM+NVJ/siAFk391/fMJR0VsYji4lobeOjYUSXuAN4Q7gEUMlM
         UDakCHHE8YTRu7a8SuS7UfvFrd/zqy9LxYlT8y5+uLX4xwLhWVGbuVY9jYrrwqse078j
         ttjcjtRNoS3YOtzF8YaTh3QoB+QG7k0hPtKDAqcVtPjyJpdai7DDMa3e0p/RdAam83ka
         FangVuVc+8xTFf6N5fOrefz6+RlLcPQa08hGw9ixjRYv4vd21Q/tFbaidE90KdoL6wii
         v7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cca032dAv35Zv32KV1sRMmNxjRXI1+Q6qKedKbUXFcw=;
        b=7EyKniFcNesVKvPHshPiFKTClret9BHxF2FsK5VSqlfO2DZk7IJGSxDpK5hl+3Ffzr
         SDSizckDKQtUmDe9Ct5sqXapx7625hZoj2ln4LdJNgUdm/Ct/Ou1cCBor/5nswas0Gmt
         kdSKVIDuHCx3NOUn5yqnAeHzCUx1lYqAsOCRgXz1TkTo5IrQDndnTcoV91QZbmS+e6YQ
         ttIPOxFT0TR47sK0Au83OMIUwxCHNqPHmUd3nVL5LjSGW8n7zS7Z8rDlgoN1aZXihv5H
         UI181qjf7PMGrgZKopT7WdhjUxhR6CJxxGB/AL7Gg00htk6j8W9nlFJpp1GQcqRUyqyd
         7c1A==
X-Gm-Message-State: AOAM5320W1oFNWo0x73yQ7jreouQI9qVx4TXw0NHG/BbsMXXYXJLq/gZ
	25I2tS5Hw+6iRnNg0M5yT1Qff4vXRJ0yMdYVnXc=
X-Google-Smtp-Source: 
 ABdhPJzo2EaXUIx6nQEbOyhk/FQePJ0NxOzXh8srzN9W6TP72xE9lIrrd0OkPHAz0GcxRt1kggY/iF38kY9VdBlYowo=
X-Received: by 2002:ae9:dc84:: with SMTP id
 q126mr17159564qkf.128.1637190605642;
 Wed, 17 Nov 2021 15:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-33-alex@linutronix.de>
 <d262e394-c2b6-de95-7a08-ea2f7afa10f5@gmail.com>
 <CANNYZj_6gWxy2VMwJ+Hz1fdQnZ-OedCSq0tb+NK3KJ6PnxOd=g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_6gWxy2VMwJ+Hz1fdQnZ-OedCSq0tb+NK3KJ6PnxOd=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2021 15:09:39 -0800
Message-ID: 
 <CAMKF1srG6xH4OTbdiFBM76fjSo-N09tgHC2h7S=Cn7rsRrbh=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 33/36] expect: do not install examples, drop
 related patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 23:10:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158462

On Wed, Nov 17, 2021 at 2:00 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 17 Nov 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> yes perhaps as part of main PN package its not but as a separate package
>> something like PN-examples or some such it will be better
>
>
> If upstream doesn't install them, there's no need to override that; they're just example code snippets that serve no purpose on embedded targets.
>

Yes examples perhaps can be removed, thats perhaps fine, atleast its
clear change if someone needs to re-introduce it.
separately when looking at code I do see examples/ as folder being
referenced for EXECSCRIPTDIR and SCRIPTDIR in exp_main_sub.c
 that sounds interesting, hopefully not an issue but worth checking

> Alex
>
>
>>
>>
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >   .../expect/expect/01-example-shebang.patch    | 144 ------------------
>> >   meta/recipes-devtools/expect/expect_5.45.4.bb |   2 -
>> >   2 files changed, 146 deletions(-)
>> >   delete mode 100644 meta/recipes-devtools/expect/expect/01-example-shebang.patch
>> >
>> > diff --git a/meta/recipes-devtools/expect/expect/01-example-shebang.patch b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
>> > deleted file mode 100644
>> > index 8597f31387..0000000000
>> > --- a/meta/recipes-devtools/expect/expect/01-example-shebang.patch
>> > +++ /dev/null
>> > @@ -1,144 +0,0 @@
>> > -Author: Mike Markley <mike@markley.org>
>> > -Author: Sergei Golovan <sgolovan@debian.org>
>> > -Description: Fixes shebangs in examples (Closes: #152367).
>> > -
>> > -Backported from Debian
>> > -
>> > -Upstream-Status: Pending
>> > -Index: expect5.45/example/beer.exp
>> > -===================================================================
>> > ---- expect5.45.orig/example/beer.exp 2006-01-25 13:51:39.000000000 -0800
>> > -+++ expect5.45/example/beer.exp      2013-11-01 17:35:19.817318341 -0700
>> > -@@ -1,4 +1,9 @@
>> > --#!/depot/path/expect -f
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -
>> > - # 99 bottles of beer on the wall, Expect-style
>> > - # Author: Don Libes <libes@nist.gov>
>> > -Index: expect5.45/example/expectd.proto
>> > -===================================================================
>> > ---- expect5.45.orig/example/expectd.proto    2010-07-02 09:03:31.000000000 -0700
>> > -+++ expect5.45/example/expectd.proto 2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,10 @@
>> > --#!/depot/tcl/src/expect/e --
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -+
>> > - # Description: Simple fragment to begin a telnet daemon
>> > - # For more information, see Chapter 17 of "Exploring Expect"
>> > - # Author: Don Libes, NIST
>> > -Index: expect5.45/example/irsh
>> > -===================================================================
>> > ---- expect5.45.orig/example/irsh     2010-07-02 09:03:31.000000000 -0700
>> > -+++ expect5.45/example/irsh  2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,9 @@
>> > --#!/depot/path/expect --
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -
>> > - # Do rsh interactively.  For example, consider the following command:
>> > - #    rsh <remote> ls -l "|" more
>> > -Index: expect5.45/example/passwd.cgi
>> > -===================================================================
>> > ---- expect5.45.orig/example/passwd.cgi       2000-01-06 15:22:07.000000000 -0800
>> > -+++ expect5.45/example/passwd.cgi    2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,9 @@
>> > --#!/depot/path/expect --
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -
>> > - # This is a CGI script to process requests created by the accompanying
>> > - # passwd.html form.  This script is pretty basic, although it is
>> > -Index: expect5.45/example/passwdprompt
>> > -===================================================================
>> > ---- expect5.45.orig/example/passwdprompt     2003-09-05 12:01:59.000000000 -0700
>> > -+++ expect5.45/example/passwdprompt  2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,9 @@
>> > --#!/depot/path/expect
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -
>> > - # This script prompts for a passwd from stdin while echoing *'s
>> > -
>> > -Index: expect5.45/example/reprompt
>> > -===================================================================
>> > ---- expect5.45.orig/example/reprompt 2000-01-06 15:22:07.000000000 -0800
>> > -+++ expect5.45/example/reprompt      2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,9 @@
>> > --#!/depot/path/expect --
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -
>> > - # Name: reprompt
>> > - # Description: reprompt every so often until user enters something
>> > -Index: expect5.45/example/term_expect
>> > -===================================================================
>> > ---- expect5.45.orig/example/term_expect      2005-02-15 10:11:31.000000000 -0800
>> > -+++ expect5.45/example/term_expect   2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,9 @@
>> > --#!/depot/path/expectk
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec wish "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -
>> > - # Name: tkterm - terminal emulator using Expect and Tk text widget, v3.0
>> > - # Author: Don Libes, July '94
>> > -Index: expect5.45/example/vrfy
>> > -===================================================================
>> > ---- expect5.45.orig/example/vrfy     2010-07-02 09:03:31.000000000 -0700
>> > -+++ expect5.45/example/vrfy  2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,9 @@
>> > --#!/depot/path/expect -f
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -
>> > -
>> > - # separate address into user and host
>> > -Index: expect5.45/example/xrlogin
>> > -===================================================================
>> > ---- expect5.45.orig/example/xrlogin  2000-01-06 15:22:08.000000000 -0800
>> > -+++ expect5.45/example/xrlogin       2013-11-01 17:35:19.821318341 -0700
>> > -@@ -1,4 +1,10 @@
>> > --#!/depot/path/expect --
>> > -+#!/bin/sh
>> > -+# -*- tcl -*-
>> > -+# The next line is executed by /bin/sh, but not tcl \
>> > -+exec tclsh "$0" ${1+"$@"}
>> > -+
>> > -+package require Expect
>> > -+
>> > - # xrlogin - rlogin but with current DISPLAY
>> > - #
>> > - # You can extend this idea to save any arbitrary information across rlogin
>> > diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
>> > index e27b0d9d71..4214ab0f27 100644
>> > --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
>> > +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
>> > @@ -21,7 +21,6 @@ inherit autotools update-alternatives
>> >   SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>> >              file://0001-configure.in.patch \
>> >              file://0002-tcl.m4.patch \
>> > -           file://01-example-shebang.patch \
>> >              file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
>> >              file://0001-Resolve-string-formatting-issues.patch \
>> >              file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
>> > @@ -39,7 +38,6 @@ do_install:append() {
>> >       install -d ${D}${libdir}
>> >           install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
>> >           install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
>> > -        install -m 0755 ${S}/example/*          ${D}${libdir}/expect${PV}/
>> >           rm ${D}${libdir}/expect${PV}/libexpect*.so
>> >           sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
>> >   }
>> >
>> >
>> >
>> >
>> >
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#158455): https://lists.openembedded.org/g/openembedded-core/message/158455
>> Mute This Topic: https://lists.openembedded.org/mt/87122010/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

