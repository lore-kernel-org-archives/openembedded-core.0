Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A1DC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 19:05:21 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.340.1637175920161757396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lC4vppp3;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id x7so3140443pjn.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=JW1g1E809gHqwphpsIBld99u4LoNciCFrqu7gdbg+w4=;
        b=lC4vppp3SA+CZhf0A6BXhUdurLF+AepKiest2HrElsXHDs4rOr0pv+jF0oBj/Igzsk
         76j4/2N0OD26Hk+6wOtjukkJ4vEtTah6G0FLJhq/MRMbrVPamTArBlFBehIpsN5nUOnd
         ZzTB0vopTpZDAYk24qnhR2e1+/b7HCY2vcTgntRzlagEzYlckSYtiit+heZARuhvCGJ4
         QJzWnM3IxjFc/c90Jy9Yf98jKmSey/73gabfCan+bxiLGrC1dHubopj/L30AdGXgv5Qr
         mgRSVaA8Z4jwxxL3v7BUBheaSgxR4nB0TpFBc4dWAybTlfxrQfm4QGTqtXcw4BgO72Ae
         93+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=JW1g1E809gHqwphpsIBld99u4LoNciCFrqu7gdbg+w4=;
        b=u8BkJW61vb7IXeR7VDrJtRG5TKRtx9ihQcj1RgBLMFrHsDcAZoEJQvs49271pxsty+
         rcwyH+hvEuwuZsgWZmD8uXQYZDbQ1eg1NjYEM+0H68h8lcoI2xcCn4GlD/rnWQuWwEXj
         7c0O89CVrnGk4W7dtNjrkYJ3L0xCF4GxjiW3nY4LKkitAhWR7JibDvkzmOSU6B/7BtNK
         rgjdr0vgpVrr7IqgwFUpUa9uUxdqirpEGWRRjuhrx30f2L9NMHviR8khyPWuCsJEofGt
         Tq6Pu+spJtPjlqgb/sG/ALGpHoB5u0hLYxErTFv1VbZXR+xV3k1zID4tCADoFkkqoKXD
         YnEw==
X-Gm-Message-State: AOAM530JvHpnG+Y3b/y3U5NBGLabL+kgf7uX0zfWNtI8U6u+dkZFHF3N
	kkrGQ0ZsNWs6QrifA0Ij5lg=
X-Google-Smtp-Source: 
 ABdhPJwMgaGMRpY1IUPDfjVrVrVS928FNnc4Z9JyDqSXlWyCMmZElX/T9Q3CYLZsFR0tMXBKC2pfPw==
X-Received: by 2002:a17:902:c410:b0:142:2506:cb5b with SMTP id
 k16-20020a170902c41000b001422506cb5bmr58321501plk.36.1637175919433;
        Wed, 17 Nov 2021 11:05:19 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:4504:2148:47d8:ca58?
 ([2601:646:9200:a0f0:4504:2148:47d8:ca58])
        by smtp.gmail.com with ESMTPSA id
 j7sm6205633pjf.41.2021.11.17.11.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 11:05:19 -0800 (PST)
Message-ID: <d262e394-c2b6-de95-7a08-ea2f7afa10f5@gmail.com>
Date: Wed, 17 Nov 2021 11:05:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [OE-core] [PATCH 33/36] expect: do not install examples, drop
 related patch
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-33-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211117153525.257146-33-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 19:05:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158455



On 11/17/21 7:35 AM, Alexander Kanavin wrote:
> There is really no reason to install them; this was done
> in the original recipe submission for unexplained reasons.

yes perhaps as part of main PN package its not but as a separate package 
something like PN-examples or some such it will be better

> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../expect/expect/01-example-shebang.patch    | 144 ------------------
>   meta/recipes-devtools/expect/expect_5.45.4.bb |   2 -
>   2 files changed, 146 deletions(-)
>   delete mode 100644 meta/recipes-devtools/expect/expect/01-example-shebang.patch
> 
> diff --git a/meta/recipes-devtools/expect/expect/01-example-shebang.patch b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
> deleted file mode 100644
> index 8597f31387..0000000000
> --- a/meta/recipes-devtools/expect/expect/01-example-shebang.patch
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -Author: Mike Markley <mike@markley.org>
> -Author: Sergei Golovan <sgolovan@debian.org>
> -Description: Fixes shebangs in examples (Closes: #152367).
> -
> -Backported from Debian
> -
> -Upstream-Status: Pending
> -Index: expect5.45/example/beer.exp
> -===================================================================
> ---- expect5.45.orig/example/beer.exp	2006-01-25 13:51:39.000000000 -0800
> -+++ expect5.45/example/beer.exp	2013-11-01 17:35:19.817318341 -0700
> -@@ -1,4 +1,9 @@
> --#!/depot/path/expect -f
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -
> - # 99 bottles of beer on the wall, Expect-style
> - # Author: Don Libes <libes@nist.gov>
> -Index: expect5.45/example/expectd.proto
> -===================================================================
> ---- expect5.45.orig/example/expectd.proto	2010-07-02 09:03:31.000000000 -0700
> -+++ expect5.45/example/expectd.proto	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,10 @@
> --#!/depot/tcl/src/expect/e --
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -+
> - # Description: Simple fragment to begin a telnet daemon
> - # For more information, see Chapter 17 of "Exploring Expect"
> - # Author: Don Libes, NIST
> -Index: expect5.45/example/irsh
> -===================================================================
> ---- expect5.45.orig/example/irsh	2010-07-02 09:03:31.000000000 -0700
> -+++ expect5.45/example/irsh	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,9 @@
> --#!/depot/path/expect --
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -
> - # Do rsh interactively.  For example, consider the following command:
> - #    rsh <remote> ls -l "|" more
> -Index: expect5.45/example/passwd.cgi
> -===================================================================
> ---- expect5.45.orig/example/passwd.cgi	2000-01-06 15:22:07.000000000 -0800
> -+++ expect5.45/example/passwd.cgi	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,9 @@
> --#!/depot/path/expect --
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -
> - # This is a CGI script to process requests created by the accompanying
> - # passwd.html form.  This script is pretty basic, although it is
> -Index: expect5.45/example/passwdprompt
> -===================================================================
> ---- expect5.45.orig/example/passwdprompt	2003-09-05 12:01:59.000000000 -0700
> -+++ expect5.45/example/passwdprompt	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,9 @@
> --#!/depot/path/expect
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -
> - # This script prompts for a passwd from stdin while echoing *'s
> -
> -Index: expect5.45/example/reprompt
> -===================================================================
> ---- expect5.45.orig/example/reprompt	2000-01-06 15:22:07.000000000 -0800
> -+++ expect5.45/example/reprompt	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,9 @@
> --#!/depot/path/expect --
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -
> - # Name: reprompt
> - # Description: reprompt every so often until user enters something
> -Index: expect5.45/example/term_expect
> -===================================================================
> ---- expect5.45.orig/example/term_expect	2005-02-15 10:11:31.000000000 -0800
> -+++ expect5.45/example/term_expect	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,9 @@
> --#!/depot/path/expectk
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec wish "$0" ${1+"$@"}
> -+
> -+package require Expect
> -
> - # Name: tkterm - terminal emulator using Expect and Tk text widget, v3.0
> - # Author: Don Libes, July '94
> -Index: expect5.45/example/vrfy
> -===================================================================
> ---- expect5.45.orig/example/vrfy	2010-07-02 09:03:31.000000000 -0700
> -+++ expect5.45/example/vrfy	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,9 @@
> --#!/depot/path/expect -f
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -
> -
> - # separate address into user and host
> -Index: expect5.45/example/xrlogin
> -===================================================================
> ---- expect5.45.orig/example/xrlogin	2000-01-06 15:22:08.000000000 -0800
> -+++ expect5.45/example/xrlogin	2013-11-01 17:35:19.821318341 -0700
> -@@ -1,4 +1,10 @@
> --#!/depot/path/expect --
> -+#!/bin/sh
> -+# -*- tcl -*-
> -+# The next line is executed by /bin/sh, but not tcl \
> -+exec tclsh "$0" ${1+"$@"}
> -+
> -+package require Expect
> -+
> - # xrlogin - rlogin but with current DISPLAY
> - #
> - # You can extend this idea to save any arbitrary information across rlogin
> diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
> index e27b0d9d71..4214ab0f27 100644
> --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> @@ -21,7 +21,6 @@ inherit autotools update-alternatives
>   SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>              file://0001-configure.in.patch \
>              file://0002-tcl.m4.patch \
> -           file://01-example-shebang.patch \
>              file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
>              file://0001-Resolve-string-formatting-issues.patch \
>              file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
> @@ -39,7 +38,6 @@ do_install:append() {
>   	install -d ${D}${libdir}
>           install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
>           install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
> -        install -m 0755 ${S}/example/*          ${D}${libdir}/expect${PV}/
>           rm ${D}${libdir}/expect${PV}/libexpect*.so
>           sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
>   }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158428): https://lists.openembedded.org/g/openembedded-core/message/158428
> Mute This Topic: https://lists.openembedded.org/mt/87122010/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

