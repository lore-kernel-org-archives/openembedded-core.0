Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC120CA9ECD
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3711.1684186747687203807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FBlXnkWF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a575f-6c05f595-c0fe-462f-a690-f3016ea7f8b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IHNZt4kQoCwHYGwjMJCvtu2LRWZg/CMRHfmrDC2Qhko=;
	b=FBlXnkWFSEu9svmYesEfBoDlq11CVI5deqQjpRJWPki1JtFIh9HrzIpCjuG+/Jcs
	00NF4JRZXCTfgVSwDjfDatByMR3eM6BwzjrEgnSF3wi8PS4ODrtRJGJhxYo/phkOtRG
	alFcAvTxf8YfZlTSiRKGUEVARIk8sPQQ5BNX84wg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IHNZt4kQoCwHYGwjMJCvtu2LRWZg/CMRHfmrDC2Qhko=;
	b=PerbT/aVHu21bbK4cvncaYQwePrZ/yrejTguGRKc7Vh43vElKplt9rafwXqnE4bN
	oslaLZ6sWgQ73xm5zMmXnUjnHDifTVwX/iBqRo2gmpE8x+tNHkxmpzETC/SADfQu1ny
	/H1nc6bsLYLg/v6FPw0S5nhP4360susP8Sxnxg3M=
Content-Type: multipart/mixed; boundary="===============8043299488318983631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.11 SUCCEEDED
Message-ID: <01010188215a575f-6c05f595-c0fe-462f-a690-f3016ea7f8b3-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181333

--===============8043299488318983631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grep* to *3.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-grep-upgrade-3.10-3.11.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8043299488318983631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/grep/grep-dbg: PKGSIZE changed from 802332 to 807096 (+1%)
packages/core2-32-poky-linux/grep/grep-dbg: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-dbg: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-dev: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-dev: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-doc: PKGSIZE changed from 169744 to 169725 (-0%)
packages/core2-32-poky-linux/grep/grep-doc: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-doc: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-af: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-af: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-be: PKGSIZE changed from 23299 to 23291 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-be: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-be: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGSIZE changed from 23919 to 23915 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-bg: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ca: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ca: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGSIZE changed from 18837 to 18845 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-cs: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-da: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-da: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-de: PKGSIZE changed from 19241 to 19248 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-de: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-de: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-el: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-el: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGSIZE changed from 17420 to 17359 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-eo: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-es: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-es: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-et: PKGSIZE changed from 16990 to 16997 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-et: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-et: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-eu: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-eu: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGSIZE changed from 17838 to 17773 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-fi: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGSIZE changed from 18120 to 18057 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-fr: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ga: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ga: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-gl: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-he: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-he: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGSIZE changed from 18215 to 18223 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-hr: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGSIZE changed from 18582 to 18874 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-hu: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-id: PKGSIZE changed from 17658 to 17660 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-id: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-id: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-it: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-it: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ja: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ja: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ka: PKGSIZE changed from 27905 to 27898 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-ka: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ka: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGSIZE changed from 19419 to 19452 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ko: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ky: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ky: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-lt: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-lt: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGSIZE changed from 17716 to 17727 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-nb: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGSIZE changed from 18671 to 18595 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-nl: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-pa: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-pa: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGSIZE changed from 18229 to 18580 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-pl: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGSIZE changed from 16000 to 18629 (+16%)
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGSIZE changed from 18875 to 18888 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ro: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGSIZE changed from 22956 to 23405 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ru: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGSIZE changed from 17790 to 18143 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-sk: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-sl: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-sl: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 21977 to 21895 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-sr: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGSIZE changed from 17567 to 17578 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-sv: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-ta: PKGSIZE changed from 24998 to 27372 (+9%)
packages/core2-32-poky-linux/grep/grep-locale-ta: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-ta: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-th: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-th: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGSIZE changed from 17874 to 17815 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-tr: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGSIZE changed from 23944 to 23948 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-uk: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGSIZE changed from 18941 to 20096 (+6%)
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-vi: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGSIZE changed from 17361 to 17367 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGSIZE changed from 17114 to 17053 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-src: PKGSIZE changed from 1888700 to 1916007 (+1%)
packages/core2-32-poky-linux/grep/grep-src: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-src: FILELIST: directory renamed /usr/src/debug/grep/3.10-r0/src -> /usr/src/debug/grep/3.11-r0/src, directory renamed /usr/src/debug/grep/3.10-r0/lib/malloc -> /usr/src/debug/grep/3.11-r0/lib/malloc, removed "/usr/src/debug/grep/3.10-r0/lib/safe-read.c /usr/src/debug/grep/3.10-r0/lib/regex_internal.c /usr/src/debug/grep/3.10-r0/lib/ialloc.h /usr/src/debug/grep/3.10-r0/lib/safe-read.h /usr/src/debug/grep/3.10-r0/lib/regex_internal.h /usr/src/debug/grep/3.10-r0/lib/fcntl.c /usr/src/debug/grep/3.10-r0/lib/fcntl.h /usr/src/debug/grep/3.10-r0/lib/str-two-way.h /usr/src/debug/grep/3.10-r0/lib/fts_.h /usr/src/debug/grep/3.10-r0/lib/exclude.c /usr/src/debug/grep/3.10-r0/lib/xalloc-die.c /usr/src/debug/grep/3.10-r0/lib/exclude.h /usr/src/debug/grep/3.10-r0/lib/mbuiter.h /usr/src/debug/grep/3.10-r0/lib/colorize.h /usr/src/debug/grep/3.10-r0/lib/stripslash.c /usr/src/debug/grep/3.10-r0/lib/mbrtowc.c /usr/src/debug/grep/3.10-r0/lib/i-ring.h /usr/src/debug/
 grep/3.10-r0/lib/quote.h /usr/src/debug/grep/3.10-r0/lib/xbinary-io.h /usr/src/debug/grep/3.10-r0/lib/c-strcaseeq.h /usr/src/debug/grep/3.10-r0/lib/i-ring.c /usr/src/debug/grep/3.10-r0/lib/opendirat.c /usr/src/debug/grep/3.10-r0/lib/mbscasecmp.c /usr/src/debug/grep/3.10-r0/lib/opendirat.h /usr/src/debug/grep/3.10-r0/lib/string.h /usr/src/debug/grep/3.10-r0/lib/basename-lgpl.h /usr/src/debug/grep/3.10-r0/lib/localcharset.c /usr/src/debug/grep/3.10-r0/lib/basename-lgpl.c /usr/src/debug/grep/3.10-r0/lib/localcharset.h /usr/src/debug/grep/3.10-r0/lib/idx.h /usr/src/debug/grep/3.10-r0/lib/dfa.c /usr/src/debug/grep/3.10-r0/lib/c-strcasecmp.c /usr/src/debug/grep/3.10-r0/lib/dfa.h /usr/src/debug/grep/3.10-r0/lib/sys-limits.h /usr/src/debug/grep/3.10-r0/lib/getopt-core.h /usr/src/debug/grep/3.10-r0/lib/hash.c /usr/src/debug/grep/3.10-r0/lib/getprogname.c /usr/src/debug/grep/3.10-r0/lib/hash.h /usr/src/debug/grep/3.10-r0/lib/regex.h /usr/src/debug/grep/3.10-r0/lib/fd-safer.c /usr/src/debug/gr
 ep/3.10-r0/lib/exitfail.h /usr/src/debug/grep/3.10-r0/lib/exitfail.c /usr/src/debug/grep/3.10-r0/lib/getopt1.c /usr/src/debug/grep/3.10-r0/lib/openat-safer.c /usr/src/debug/grep/3.10-r0/lib/fts.c /usr/src/debug/grep/3.10-r0/lib/memchr.c /usr/src/debug/grep/3.10-r0/lib/unistd-safer.h /usr/src/debug/grep/3.10-r0/lib/fnmatch_loop.c /usr/src/debug/grep/3.10-r0/lib/xalloc.h /usr/src/debug/grep/3.10-r0/lib/quotearg.c /usr/src/debug/grep/3.10-r0/lib/strstr.c /usr/src/debug/grep/3.10-r0/lib/quotearg.h /usr/src/debug/grep/3.10-r0/lib/dev-ino.h /usr/src/debug/grep/3.10-r0/lib/dirname.h /usr/src/debug/grep/3.10-r0/lib/localeinfo.c /usr/src/debug/grep/3.10-r0/lib/mbchar.c /usr/src/debug/grep/3.10-r0/lib/dirent.h /usr/src/debug/grep/3.10-r0/lib/mbchar.h /usr/src/debug/grep/3.10-r0/lib/localeinfo.h /usr/src/debug/grep/3.10-r0/lib/bitrotate.h /usr/src/debug/grep/3.10-r0/lib/setlocale_null.h /usr/src/debug/grep/3.10-r0/lib/setlocale_null.c /usr/src/debug/grep/3.10-r0/lib/argmatch.c /usr/src/debug/g
 rep/3.10-r0/lib/regcomp.c /usr/src/debug/grep/3.10-r0/lib/regexec.c /usr/src/debug/grep/3.10-r0/lib/argmatch.h /usr/src/debug/grep/3.10-r0/lib/mbrlen.c /usr/src/debug/grep/3.10-r0/lib/closeout.c /usr/src/debug/grep/3.10-r0/lib/memchr2.h /usr/src/debug/grep/3.10-r0/lib/cycle-check.h /usr/src/debug/grep/3.10-r0/lib/closeout.h /usr/src/debug/grep/3.10-r0/lib/cycle-check.c /usr/src/debug/grep/3.10-r0/lib/memchr2.c /usr/src/debug/grep/3.10-r0/lib/getopt-ext.h /usr/src/debug/grep/3.10-r0/lib/version-etc.c /usr/src/debug/grep/3.10-r0/lib/open-safer.c /usr/src/debug/grep/3.10-r0/lib/version-etc.h /usr/src/debug/grep/3.10-r0/lib/binary-io.h /usr/src/debug/grep/3.10-r0/lib/stdio.h /usr/src/debug/grep/3.10-r0/lib/fnmatch.h /usr/src/debug/grep/3.10-r0/lib/fts-cycle.c /usr/src/debug/grep/3.10-r0/lib/fnmatch.c /usr/src/debug/grep/3.10-r0/lib/sigsegv.c /usr/src/debug/grep/3.10-r0/lib/sigsegv.h /usr/src/debug/grep/3.10-r0/lib/c-stack.c /usr/src/debug/grep/3.10-r0/lib/c-stack.h /usr/src/debug/grep/3
 .10-r0/lib/c-ctype.h /usr/src/debug/grep/3.10-r0/lib/close-stream.c /usr/src/debug/grep/3.10-r0/lib/fcntl-safer.h /usr/src/debug/grep/3.10-r0/lib/close-stream.h /usr/src/debug/grep/3.10-r0/lib/hard-locale.h /usr/src/debug/grep/3.10-r0/lib/obstack.h /usr/src/debug/grep/3.10-r0/lib/obstack.c /usr/src/debug/grep/3.10-r0/lib/hard-locale.c /usr/src/debug/grep/3.10-r0/lib/xmalloc.c /usr/src/debug/grep/3.10-r0/lib/xstrtol.c /usr/src/debug/grep/3.10-r0/lib/dup-safer.c /usr/src/debug/grep/3.10-r0/lib/xstrtol.h /usr/src/debug/grep/3.10-r0/lib/stdlib.h /usr/src/debug/grep/3.10-r0/lib/getopt.c /usr/src/debug/grep/3.10-r0/lib/wchar.h /usr/src/debug/grep/3.10-r0/lib/stackvma.c /usr/src/debug/grep/3.10-r0/lib/strnlen1.c /usr/src/debug/grep/3.10-r0/lib/colorize-posix.c /usr/src/debug/grep/3.10-r0/lib/stackvma.h /usr/src/debug/grep/3.10-r0/lib/strnlen1.h /usr/src/debug/grep/3.10-r0/lib/getopt_int.h /usr/src/debug/grep/3.10-r0/lib/version-etc-fsf.c /usr/src/debug/grep/3.10-r0/lib/c-strcase.h", added 
 "/usr/src/debug/grep/3.11-r0/lib/safe-read.c /usr/src/debug/grep/3.11-r0/lib/regex_internal.c /usr/src/debug/grep/3.11-r0/lib/ialloc.h /usr/src/debug/grep/3.11-r0/lib/safe-read.h /usr/src/debug/grep/3.11-r0/lib/regex_internal.h /usr/src/debug/grep/3.11-r0/lib/fcntl.c /usr/src/debug/grep/3.11-r0/lib/fcntl.h /usr/src/debug/grep/3.11-r0/lib/fopen.c /usr/src/debug/grep/3.11-r0/lib/str-two-way.h /usr/src/debug/grep/3.11-r0/lib/fts_.h /usr/src/debug/grep/3.11-r0/lib/exclude.c /usr/src/debug/grep/3.11-r0/lib/xalloc-die.c /usr/src/debug/grep/3.11-r0/lib/exclude.h /usr/src/debug/grep/3.11-r0/lib/mbuiter.h /usr/src/debug/grep/3.11-r0/lib/colorize.h /usr/src/debug/grep/3.11-r0/lib/stripslash.c /usr/src/debug/grep/3.11-r0/lib/mbrtowc.c /usr/src/debug/grep/3.11-r0/lib/i-ring.h /usr/src/debug/grep/3.11-r0/lib/quote.h /usr/src/debug/grep/3.11-r0/lib/xbinary-io.h /usr/src/debug/grep/3.11-r0/lib/c-strcaseeq.h /usr/src/debug/grep/3.11-r0/lib/i-ring.c /usr/src/debug/grep/3.11-r0/lib/opendirat.c /usr/s
 rc/debug/grep/3.11-r0/lib/mbsrtowcs.c /usr/src/debug/grep/3.11-r0/lib/mbscasecmp.c /usr/src/debug/grep/3.11-r0/lib/opendirat.h /usr/src/debug/grep/3.11-r0/lib/string.h /usr/src/debug/grep/3.11-r0/lib/basename-lgpl.h /usr/src/debug/grep/3.11-r0/lib/localcharset.c /usr/src/debug/grep/3.11-r0/lib/basename-lgpl.c /usr/src/debug/grep/3.11-r0/lib/localcharset.h /usr/src/debug/grep/3.11-r0/lib/mbsrtowcs-impl.h /usr/src/debug/grep/3.11-r0/lib/idx.h /usr/src/debug/grep/3.11-r0/lib/dfa.c /usr/src/debug/grep/3.11-r0/lib/c-strcasecmp.c /usr/src/debug/grep/3.11-r0/lib/dfa.h /usr/src/debug/grep/3.11-r0/lib/sys-limits.h /usr/src/debug/grep/3.11-r0/lib/getopt-core.h /usr/src/debug/grep/3.11-r0/lib/hash.c /usr/src/debug/grep/3.11-r0/lib/getprogname.c /usr/src/debug/grep/3.11-r0/lib/hash.h /usr/src/debug/grep/3.11-r0/lib/regex.h /usr/src/debug/grep/3.11-r0/lib/fd-safer.c /usr/src/debug/grep/3.11-r0/lib/exitfail.h /usr/src/debug/grep/3.11-r0/lib/btowc.c /usr/src/debug/grep/3.11-r0/lib/exitfail.c /usr/
 src/debug/grep/3.11-r0/lib/getopt1.c /usr/src/debug/grep/3.11-r0/lib/openat-safer.c /usr/src/debug/grep/3.11-r0/lib/fts.c /usr/src/debug/grep/3.11-r0/lib/memchr.c /usr/src/debug/grep/3.11-r0/lib/unistd-safer.h /usr/src/debug/grep/3.11-r0/lib/fnmatch_loop.c /usr/src/debug/grep/3.11-r0/lib/xalloc.h /usr/src/debug/grep/3.11-r0/lib/quotearg.c /usr/src/debug/grep/3.11-r0/lib/strstr.c /usr/src/debug/grep/3.11-r0/lib/quotearg.h /usr/src/debug/grep/3.11-r0/lib/dev-ino.h /usr/src/debug/grep/3.11-r0/lib/dirname.h /usr/src/debug/grep/3.11-r0/lib/localeinfo.c /usr/src/debug/grep/3.11-r0/lib/mbchar.c /usr/src/debug/grep/3.11-r0/lib/dirent.h /usr/src/debug/grep/3.11-r0/lib/mbchar.h /usr/src/debug/grep/3.11-r0/lib/localeinfo.h /usr/src/debug/grep/3.11-r0/lib/bitrotate.h /usr/src/debug/grep/3.11-r0/lib/setlocale_null.h /usr/src/debug/grep/3.11-r0/lib/setlocale_null.c /usr/src/debug/grep/3.11-r0/lib/argmatch.c /usr/src/debug/grep/3.11-r0/lib/regcomp.c /usr/src/debug/grep/3.11-r0/lib/regexec.c /usr/s
 rc/debug/grep/3.11-r0/lib/argmatch.h /usr/src/debug/grep/3.11-r0/lib/mbrlen.c /usr/src/debug/grep/3.11-r0/lib/closeout.c /usr/src/debug/grep/3.11-r0/lib/memchr2.h /usr/src/debug/grep/3.11-r0/lib/cycle-check.h /usr/src/debug/grep/3.11-r0/lib/closeout.h /usr/src/debug/grep/3.11-r0/lib/cycle-check.c /usr/src/debug/grep/3.11-r0/lib/mbsrtowcs-state.c /usr/src/debug/grep/3.11-r0/lib/memchr2.c /usr/src/debug/grep/3.11-r0/lib/getopt-ext.h /usr/src/debug/grep/3.11-r0/lib/version-etc.c /usr/src/debug/grep/3.11-r0/lib/open-safer.c /usr/src/debug/grep/3.11-r0/lib/version-etc.h /usr/src/debug/grep/3.11-r0/lib/binary-io.h /usr/src/debug/grep/3.11-r0/lib/stdio.h /usr/src/debug/grep/3.11-r0/lib/fnmatch.h /usr/src/debug/grep/3.11-r0/lib/fts-cycle.c /usr/src/debug/grep/3.11-r0/lib/fnmatch.c /usr/src/debug/grep/3.11-r0/lib/sigsegv.c /usr/src/debug/grep/3.11-r0/lib/sigsegv.h /usr/src/debug/grep/3.11-r0/lib/c-stack.c /usr/src/debug/grep/3.11-r0/lib/c-stack.h /usr/src/debug/grep/3.11-r0/lib/c-ctype.h /us
 r/src/debug/grep/3.11-r0/lib/close-stream.c /usr/src/debug/grep/3.11-r0/lib/fcntl-safer.h /usr/src/debug/grep/3.11-r0/lib/close-stream.h /usr/src/debug/grep/3.11-r0/lib/dirfd.c /usr/src/debug/grep/3.11-r0/lib/hard-locale.h /usr/src/debug/grep/3.11-r0/lib/obstack.h /usr/src/debug/grep/3.11-r0/lib/obstack.c /usr/src/debug/grep/3.11-r0/lib/hard-locale.c /usr/src/debug/grep/3.11-r0/lib/xmalloc.c /usr/src/debug/grep/3.11-r0/lib/xstrtol.c /usr/src/debug/grep/3.11-r0/lib/dup-safer.c /usr/src/debug/grep/3.11-r0/lib/xstrtol.h /usr/src/debug/grep/3.11-r0/lib/stdlib.h /usr/src/debug/grep/3.11-r0/lib/getopt.c /usr/src/debug/grep/3.11-r0/lib/wchar.h /usr/src/debug/grep/3.11-r0/lib/stackvma.c /usr/src/debug/grep/3.11-r0/lib/strnlen1.c /usr/src/debug/grep/3.11-r0/lib/colorize-posix.c /usr/src/debug/grep/3.11-r0/lib/stackvma.h /usr/src/debug/grep/3.11-r0/lib/strnlen1.h /usr/src/debug/grep/3.11-r0/lib/getopt_int.h /usr/src/debug/grep/3.11-r0/lib/version-etc-fsf.c /usr/src/debug/grep/3.11-r0/lib/c-st
 rcase.h"
packages/core2-32-poky-linux/grep/grep-src: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep-staticdev: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep-staticdev: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep/grep: PKGSIZE changed from 276252 to 280348 (+1%)
packages/core2-32-poky-linux/grep/grep: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-32-poky-linux/grep/grep: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep: SRC_URI changed from "https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz" to "https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz"
packages/core2-32-poky-linux/grep: PV changed from "3.10" to "3.11"
packages/core2-32-poky-linux/grep: PKGV changed from 3.10 [default] to 3.11 [default]

--===============8043299488318983631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-grep-upgrade-3.10-3.11.patch"

RnJvbSAzZGRiMzY3MWNmMzM2M2ZmZGI4ZTk2MDZiMmVkOWU2MDQzYzMzZmQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTQ6Mjg6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cmVwOiB1cGdyYWRlIDMuMTAgLT4gMy4xMQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3Jl
cC97Z3JlcF8zLjEwLmJiID0+IGdyZXBfMy4xMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ3JlcC97Z3JlcF8zLjEwLmJiID0+IGdyZXBfMy4xMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTAuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAvZ3JlcF8zLjEwLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTEuYmIKaW5kZXggMzNmZDY0ZDI3ZS4uY2Iz
MTA1ZGUwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAvZ3JlcF8zLjEw
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ncmVwL2dyZXBfMy4xMS5iYgpAQCAtOCw3
ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MWViYmQzZTM0
MjM3YWYyNmRhNWRjMDhhNGU0NDA0NjQiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9ncmVw
L2dyZXAtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjRlZmE1YjU5NWZi
NWE3MTAwODc5YjUxYjg4NjhhMGJiODdhNzFjMTgzZDAyYzRjNjAyNjMzYjg4YWY2ODU1YiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIxZGIyYWVkZGU4OWQwZGVhNDJiMTZkOTUyOGY4OTRjOGQxNWRh
ZTRlMTkwYjU5YWVjYzc4ZjVhOTUxMjc2ZWFiIgogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0
IHRleGluZm8gcGtnY29uZmlnCiAKLS0gCjIuMzkuMgoK

--===============8043299488318983631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGSIZE changed from 16000 to 18629 (+16%)

--===============8043299488318983631==--

