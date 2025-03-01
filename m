Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43485C35FEE
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7163.1740828318538724398
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gOeNXfpi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rrlDXCoq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195517422a3-539dfd13-ca32-41fa-b47d-64306846047f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=36zdehEcPLpjLmkcWz9Q9D+Ahx0aFOLJ5MT7eL3669o=;
	b=gOeNXfpi0bHps/k/0S+Q92BB7FG0z7c6JiYs+omfpD5pSn/n6sfwm2PdGONvRY4M
	ERTIRWpibjvRd3uRKACMuy6bVbdx4bx0EuXfUPF5LViawTxSw8BnAjSc/2NKPWga0yD
	IWAWI30l3PO+wNM9eMoqFrt6qNpYIViKccPrXI80=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=36zdehEcPLpjLmkcWz9Q9D+Ahx0aFOLJ5MT7eL3669o=;
	b=rrlDXCoqo911i1hdVC5pS+fh2406pwPgsn/XG9NEEv9fVSSj3aMqWbrs5bnHioTt
	fmDMKRF2p0yt8OSlgP2MuhYyHE1hA0VhxEVXKKYX23hZ5O9YjHfJE90q6acCQMtbokm
	k+BUoZnxKCmBRHZdZ1zKO5k9haeGvY86RRsihRfU=
Content-Type: multipart/mixed; boundary="===============5046783554633236481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] inetutils: upgrading to 2.6 SUCCEEDED
Message-ID: <01010195517422a3-539dfd13-ca32-41fa-b47d-64306846047f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212106

--===============5046783554633236481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *inetutils* to *2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-inetutils-upgrade-2.5-2.6.patch
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

-- >8 --
From 87a71924437a904494bd95d8f68902ed4d8e104e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 06:45:30 +0000
Subject: [PATCH] inetutils: upgrade 2.5 -> 2.6

---
 .../inetutils/{inetutils_2.5.bb => inetutils_2.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/inetutils/{inetutils_2.5.bb => inetutils_2.6.bb} (99%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
similarity index 99%
rename from meta/recipes-connectivity/inetutils/inetutils_2.5.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index 19bf7e1539..ef453d3bb2 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -11,7 +11,7 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "87697d60a31e10b5cb86a9f0651e1ec7bee98320d048c0739431aac3d5764fb6"
+SRC_URI[sha256sum] = "68bedbfeaf73f7d86be2a7d99bcfbd4093d829f52770893919ae174c0b2357ca"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://rexec.xinetd.inetutils \
            file://rlogin.xinetd.inetutils \
-- 
2.44.1


--===============5046783554633236481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/inetutils/inetutils-dbg: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-dbg: PKGSIZE changed from 5240136 to 5335976 (+2%)
packages/core2-64-poky-linux/inetutils/inetutils-dbg: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-dev: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-dev: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-doc: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-doc: PKGSIZE changed from 265045 to 271401 (+2%)
packages/core2-64-poky-linux/inetutils/inetutils-doc: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-ftp: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-ftp: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-ftpd: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-ftpd: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-hostname: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-hostname: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-ifconfig: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-ifconfig: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-inetd: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-inetd: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-locale: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-locale: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-logger: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-logger: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-ping: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-ping: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-ping6: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-ping6: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-rsh: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-rsh: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-rshd-dbg: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-rshd-dbg: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-rshd: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-rshd: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-src: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-src: PKGSIZE changed from 3176340 to 3593248 (+13%)
packages/core2-64-poky-linux/inetutils/inetutils-src: FILELIST: directory renamed /usr/src/debug/inetutils/2.5/ftpd -> /usr/src/debug/inetutils/2.6/ftpd, directory renamed /usr/src/debug/inetutils/2.5/lib/malloc -> /usr/src/debug/inetutils/2.6/lib/malloc, directory renamed /usr/src/debug/inetutils/2.5/telnetd -> /usr/src/debug/inetutils/2.6/telnetd, directory renamed /usr/src/debug/inetutils/2.5/ping -> /usr/src/debug/inetutils/2.6/ping, directory renamed /usr/src/debug/inetutils/2.5/ftp -> /usr/src/debug/inetutils/2.6/ftp, directory renamed /usr/src/debug/inetutils/2.5/talkd -> /usr/src/debug/inetutils/2.6/talkd, directory renamed /usr/src/debug/inetutils/2.5/ifconfig/system -> /usr/src/debug/inetutils/2.6/ifconfig/system, directory renamed /usr/src/debug/inetutils/2.5/telnet -> /usr/src/debug/inetutils/2.6/telnet, directory renamed /usr/src/debug/inetutils/2.5/talk -> /usr/src/debug/inetutils/2.6/talk, directory renamed /usr/src/debug/inetutils/2.5/libtelnet -> /usr/src/debug/inetu
 tils/2.6/libtelnet, directory renamed /usr/src/debug/inetutils/2.5/libls -> /usr/src/debug/inetutils/2.6/libls, directory renamed /usr/src/debug/inetutils/2.5/ifconfig -> /usr/src/debug/inetutils/2.6/ifconfig, directory renamed /usr/src/debug/inetutils/2.5/libicmp -> /usr/src/debug/inetutils/2.6/libicmp, directory renamed /usr/src/debug/inetutils/2.5/lib/sys -> /usr/src/debug/inetutils/2.6/lib/sys, directory renamed /usr/src/debug/inetutils/2.5/libinetutils -> /usr/src/debug/inetutils/2.6/libinetutils, directory renamed /usr/src/debug/inetutils/2.5/whois -> /usr/src/debug/inetutils/2.6/whois, directory renamed /usr/src/debug/inetutils/2.5/src -> /usr/src/debug/inetutils/2.6/src, removed "/usr/src/debug/inetutils/2.5/lib/fts.c /usr/src/debug/inetutils/2.5/lib/memchr.c /usr/src/debug/inetutils/2.5/lib/getopt.c /usr/src/debug/inetutils/2.5/lib/i-ring.c /usr/src/debug/inetutils/2.5/lib/getcwd.c /usr/src/debug/inetutils/2.5/lib/stdlib.h /usr/src/debug/inetutils/2.5/lib/unistd-safer.h /us
 r/src/debug/inetutils/2.5/lib/fcntl.h /usr/src/debug/inetutils/2.5/lib/argp-version-etc.h /usr/src/debug/inetutils/2.5/lib/dup-safer.c /usr/src/debug/inetutils/2.5/lib/string.h /usr/src/debug/inetutils/2.5/lib/unistd.h /usr/src/debug/inetutils/2.5/lib/ialloc.h /usr/src/debug/inetutils/2.5/lib/i-ring.h /usr/src/debug/inetutils/2.5/lib/argp-version-etc.c /usr/src/debug/inetutils/2.5/lib/bitrotate.h /usr/src/debug/inetutils/2.5/lib/fcntl.c /usr/src/debug/inetutils/2.5/lib/mbsrtowcs-state.c /usr/src/debug/inetutils/2.5/lib/open-safer.c /usr/src/debug/inetutils/2.5/lib/openat-safer.c /usr/src/debug/inetutils/2.5/lib/strnlen1.c /usr/src/debug/inetutils/2.5/lib/strnlen1.h /usr/src/debug/inetutils/2.5/lib/glob-libc.gl.h /usr/src/debug/inetutils/2.5/lib/filemode.c /usr/src/debug/inetutils/2.5/lib/progname.c /usr/src/debug/inetutils/2.5/lib/filemode.h /usr/src/debug/inetutils/2.5/lib/progname.h /usr/src/debug/inetutils/2.5/lib/ioctl.c /usr/src/debug/inetutils/2.5/lib/idx.h /usr/src/debug/inet
 utils/2.5/lib/mbsrtowcs-impl.h /usr/src/debug/inetutils/2.5/lib/hash.c /usr/src/debug/inetutils/2.5/lib/regex.h /usr/src/debug/inetutils/2.5/lib/hash.h /usr/src/debug/inetutils/2.5/lib/fnmatch.c /usr/src/debug/inetutils/2.5/lib/regcomp.c /usr/src/debug/inetutils/2.5/lib/regexec.c /usr/src/debug/inetutils/2.5/lib/xgetcwd.c /usr/src/debug/inetutils/2.5/lib/xmalloc.c /usr/src/debug/inetutils/2.5/lib/boot-time-aux.h /usr/src/debug/inetutils/2.5/lib/dev-ino.h /usr/src/debug/inetutils/2.5/lib/fnmatch.h /usr/src/debug/inetutils/2.5/lib/xgetcwd.h /usr/src/debug/inetutils/2.5/lib/argp-pvh.c /usr/src/debug/inetutils/2.5/lib/hard-locale.h /usr/src/debug/inetutils/2.5/lib/hard-locale.c /usr/src/debug/inetutils/2.5/lib/getugroups.h /usr/src/debug/inetutils/2.5/lib/mgetgroups.h /usr/src/debug/inetutils/2.5/lib/mbsrtowcs.c /usr/src/debug/inetutils/2.5/lib/mgetgroups.c /usr/src/debug/inetutils/2.5/lib/getopt_int.h /usr/src/debug/inetutils/2.5/lib/getopt-ext.h /usr/src/debug/inetutils/2.5/lib/versio
 n-etc.c /usr/src/debug/inetutils/2.5/lib/wchar.h /usr/src/debug/inetutils/2.5/lib/version-etc.h /usr/src/debug/inetutils/2.5/lib/fd-safer.c /usr/src/debug/inetutils/2.5/lib/fopen.c /usr/src/debug/inetutils/2.5/lib/opendirat.h /usr/src/debug/inetutils/2.5/lib/xvasprintf.c /usr/src/debug/inetutils/2.5/lib/readutmp.h /usr/src/debug/inetutils/2.5/lib/opendirat.c /usr/src/debug/inetutils/2.5/lib/readutmp.c /usr/src/debug/inetutils/2.5/lib/xvasprintf.h /usr/src/debug/inetutils/2.5/lib/argp-eexst.c /usr/src/debug/inetutils/2.5/lib/xgetaname-impl.h /usr/src/debug/inetutils/2.5/lib/cycle-check.h /usr/src/debug/inetutils/2.5/lib/fseeko.c /usr/src/debug/inetutils/2.5/lib/cycle-check.c /usr/src/debug/inetutils/2.5/lib/xalloc.h /usr/src/debug/inetutils/2.5/lib/dirent.h /usr/src/debug/inetutils/2.5/lib/regex_internal.h /usr/src/debug/inetutils/2.5/lib/globfree.c /usr/src/debug/inetutils/2.5/lib/btowc.c /usr/src/debug/inetutils/2.5/lib/regex_internal.c /usr/src/debug/inetutils/2.5/lib/memset_expli
 cit.c /usr/src/debug/inetutils/2.5/lib/read-file.h /usr/src/debug/inetutils/2.5/lib/xasprintf.c /usr/src/debug/inetutils/2.5/lib/read-file.c /usr/src/debug/inetutils/2.5/lib/fts-cycle.c /usr/src/debug/inetutils/2.5/lib/stdio.h /usr/src/debug/inetutils/2.5/lib/xalloc-die.c /usr/src/debug/inetutils/2.5/lib/glob_internal.h /usr/src/debug/inetutils/2.5/lib/obstack.c /usr/src/debug/inetutils/2.5/lib/argp-ba.c /usr/src/debug/inetutils/2.5/lib/argp-pv.c /usr/src/debug/inetutils/2.5/lib/argp-help.c /usr/src/debug/inetutils/2.5/lib/mbrtowc.c /usr/src/debug/inetutils/2.5/lib/basename-lgpl.c /usr/src/debug/inetutils/2.5/lib/getopt1.c /usr/src/debug/inetutils/2.5/lib/obstack.h /usr/src/debug/inetutils/2.5/lib/basename-lgpl.h /usr/src/debug/inetutils/2.5/lib/xsize.h /usr/src/debug/inetutils/2.5/lib/fcntl-safer.h /usr/src/debug/inetutils/2.5/lib/xgethostname.h /usr/src/debug/inetutils/2.5/lib/exitfail.h /usr/src/debug/inetutils/2.5/lib/exitfail.c /usr/src/debug/inetutils/2.5/lib/fts_.h /usr/src/d
 ebug/inetutils/2.5/lib/glob.c /usr/src/debug/inetutils/2.5/lib/setlocale_null.c /usr/src/debug/inetutils/2.5/lib/glob.h /usr/src/debug/inetutils/2.5/lib/getopt-core.h /usr/src/debug/inetutils/2.5/lib/argp-parse.c /usr/src/debug/inetutils/2.5/lib/setlocale_null.h /usr/src/debug/inetutils/2.5/lib/stat-time.h /usr/src/debug/inetutils/2.5/lib/argp.h /usr/src/debug/inetutils/2.5/lib/version-etc-fsf.c /usr/src/debug/inetutils/2.5/lib/inttostr.h /usr/src/debug/inetutils/2.5/lib/argp-fmtstream.h /usr/src/debug/inetutils/2.5/lib/argp-fmtstream.c /usr/src/debug/inetutils/2.5/lib/xgetdomainname.h /usr/src/debug/inetutils/2.5/lib/anytostr.c /usr/src/debug/inetutils/2.5/lib/fnmatch_loop.c", added "/usr/src/debug/inetutils/2.6/lib/fts.c /usr/src/debug/inetutils/2.6/lib/memchr.c /usr/src/debug/inetutils/2.6/lib/getopt.c /usr/src/debug/inetutils/2.6/lib/i-ring.c /usr/src/debug/inetutils/2.6/lib/getcwd.c /usr/src/debug/inetutils/2.6/lib/strtol.c /usr/src/debug/inetutils/2.6/lib/stdlib.h /usr/src/deb
 ug/inetutils/2.6/lib/unistd-safer.h /usr/src/debug/inetutils/2.6/lib/fcntl.h /usr/src/debug/inetutils/2.6/lib/argp-version-etc.h /usr/src/debug/inetutils/2.6/lib/dup-safer.c /usr/src/debug/inetutils/2.6/lib/string.h /usr/src/debug/inetutils/2.6/lib/unistd.h /usr/src/debug/inetutils/2.6/lib/ialloc.h /usr/src/debug/inetutils/2.6/lib/i-ring.h /usr/src/debug/inetutils/2.6/lib/argp-version-etc.c /usr/src/debug/inetutils/2.6/lib/bitrotate.h /usr/src/debug/inetutils/2.6/lib/fcntl.c /usr/src/debug/inetutils/2.6/lib/mbsrtowcs-state.c /usr/src/debug/inetutils/2.6/lib/open-safer.c /usr/src/debug/inetutils/2.6/lib/strnlen1.c /usr/src/debug/inetutils/2.6/lib/reallocarray.c /usr/src/debug/inetutils/2.6/lib/timespec.h /usr/src/debug/inetutils/2.6/lib/strnlen1.h /usr/src/debug/inetutils/2.6/lib/glob-libc.gl.h /usr/src/debug/inetutils/2.6/lib/filemode.c /usr/src/debug/inetutils/2.6/lib/printf-args.c /usr/src/debug/inetutils/2.6/lib/progname.c /usr/src/debug/inetutils/2.6/lib/printf-args.h /usr/src/d
 ebug/inetutils/2.6/lib/filemode.h /usr/src/debug/inetutils/2.6/lib/progname.h /usr/src/debug/inetutils/2.6/lib/ioctl.c /usr/src/debug/inetutils/2.6/lib/idx.h /usr/src/debug/inetutils/2.6/lib/mbsrtowcs-impl.h /usr/src/debug/inetutils/2.6/lib/hash.c /usr/src/debug/inetutils/2.6/lib/regex.h /usr/src/debug/inetutils/2.6/lib/hash.h /usr/src/debug/inetutils/2.6/lib/fnmatch.c /usr/src/debug/inetutils/2.6/lib/regcomp.c /usr/src/debug/inetutils/2.6/lib/regexec.c /usr/src/debug/inetutils/2.6/lib/xgetcwd.c /usr/src/debug/inetutils/2.6/lib/xmalloc.c /usr/src/debug/inetutils/2.6/lib/xstrtol.c /usr/src/debug/inetutils/2.6/lib/boot-time-aux.h /usr/src/debug/inetutils/2.6/lib/dev-ino.h /usr/src/debug/inetutils/2.6/lib/fnmatch.h /usr/src/debug/inetutils/2.6/lib/xgetcwd.h /usr/src/debug/inetutils/2.6/lib/xstrtol.h /usr/src/debug/inetutils/2.6/lib/timespec-add.c /usr/src/debug/inetutils/2.6/lib/printf-parse.c /usr/src/debug/inetutils/2.6/lib/timespec-sub.c /usr/src/debug/inetutils/2.6/lib/argp-pvh.c /
 usr/src/debug/inetutils/2.6/lib/hard-locale.h /usr/src/debug/inetutils/2.6/lib/printf-parse.h /usr/src/debug/inetutils/2.6/lib/hard-locale.c /usr/src/debug/inetutils/2.6/lib/getugroups.h /usr/src/debug/inetutils/2.6/lib/mgetgroups.h /usr/src/debug/inetutils/2.6/lib/mbsrtowcs.c /usr/src/debug/inetutils/2.6/lib/mgetgroups.c /usr/src/debug/inetutils/2.6/lib/getopt_int.h /usr/src/debug/inetutils/2.6/lib/getopt-ext.h /usr/src/debug/inetutils/2.6/lib/version-etc.c /usr/src/debug/inetutils/2.6/lib/wchar.h /usr/src/debug/inetutils/2.6/lib/version-etc.h /usr/src/debug/inetutils/2.6/lib/fd-safer.c /usr/src/debug/inetutils/2.6/lib/fopen.c /usr/src/debug/inetutils/2.6/lib/opendirat.h /usr/src/debug/inetutils/2.6/lib/vasnprintf.c /usr/src/debug/inetutils/2.6/lib/readutmp.h /usr/src/debug/inetutils/2.6/lib/opendirat.c /usr/src/debug/inetutils/2.6/lib/vaszprintf.c /usr/src/debug/inetutils/2.6/lib/xvasprintf.c /usr/src/debug/inetutils/2.6/lib/readutmp.c /usr/src/debug/inetutils/2.6/lib/xvasprintf.h
  /usr/src/debug/inetutils/2.6/lib/vasnprintf.h /usr/src/debug/inetutils/2.6/lib/argp-eexst.c /usr/src/debug/inetutils/2.6/lib/xgetaname-impl.h /usr/src/debug/inetutils/2.6/lib/cycle-check.h /usr/src/debug/inetutils/2.6/lib/fseeko.c /usr/src/debug/inetutils/2.6/lib/cycle-check.c /usr/src/debug/inetutils/2.6/lib/dirent.h /usr/src/debug/inetutils/2.6/lib/xalloc.h /usr/src/debug/inetutils/2.6/lib/setlocale_null-unlocked.c /usr/src/debug/inetutils/2.6/lib/regex_internal.h /usr/src/debug/inetutils/2.6/lib/globfree.c /usr/src/debug/inetutils/2.6/lib/btowc.c /usr/src/debug/inetutils/2.6/lib/regex_internal.c /usr/src/debug/inetutils/2.6/lib/memset_explicit.c /usr/src/debug/inetutils/2.6/lib/read-file.h /usr/src/debug/inetutils/2.6/lib/xasprintf.c /usr/src/debug/inetutils/2.6/lib/fts-cycle.c /usr/src/debug/inetutils/2.6/lib/read-file.c /usr/src/debug/inetutils/2.6/lib/stdio.h /usr/src/debug/inetutils/2.6/lib/xalloc-die.c /usr/src/debug/inetutils/2.6/lib/glob_internal.h /usr/src/debug/inetutil
 s/2.6/lib/obstack.c /usr/src/debug/inetutils/2.6/lib/argp-ba.c /usr/src/debug/inetutils/2.6/lib/argp-pv.c /usr/src/debug/inetutils/2.6/lib/argp-help.c /usr/src/debug/inetutils/2.6/lib/mbrtowc.c /usr/src/debug/inetutils/2.6/lib/basename-lgpl.c /usr/src/debug/inetutils/2.6/lib/getopt1.c /usr/src/debug/inetutils/2.6/lib/gettime.c /usr/src/debug/inetutils/2.6/lib/obstack.h /usr/src/debug/inetutils/2.6/lib/basename-lgpl.h /usr/src/debug/inetutils/2.6/lib/xsize.h /usr/src/debug/inetutils/2.6/lib/fcntl-safer.h /usr/src/debug/inetutils/2.6/lib/xgethostname.h /usr/src/debug/inetutils/2.6/lib/exitfail.h /usr/src/debug/inetutils/2.6/lib/exitfail.c /usr/src/debug/inetutils/2.6/lib/fts_.h /usr/src/debug/inetutils/2.6/lib/glob.c /usr/src/debug/inetutils/2.6/lib/setlocale_null.c /usr/src/debug/inetutils/2.6/lib/glob.h /usr/src/debug/inetutils/2.6/lib/getopt-core.h /usr/src/debug/inetutils/2.6/lib/argp-parse.c /usr/src/debug/inetutils/2.6/lib/setlocale_null.h /usr/src/debug/inetutils/2.6/lib/stat-t
 ime.h /usr/src/debug/inetutils/2.6/lib/argp.h /usr/src/debug/inetutils/2.6/lib/version-etc-fsf.c /usr/src/debug/inetutils/2.6/lib/inttostr.h /usr/src/debug/inetutils/2.6/lib/argp-fmtstream.h /usr/src/debug/inetutils/2.6/lib/argp-fmtstream.c /usr/src/debug/inetutils/2.6/lib/xgetdomainname.h /usr/src/debug/inetutils/2.6/lib/anytostr.c /usr/src/debug/inetutils/2.6/lib/fnmatch_loop.c"
packages/core2-64-poky-linux/inetutils/inetutils-src: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-staticdev: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-staticdev: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-syslogd: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-syslogd: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-telnet: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-telnet: PKGSIZE changed from 144968 to 161352 (+11%)
packages/core2-64-poky-linux/inetutils/inetutils-telnet: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-telnetd-dbg: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-telnetd-dbg: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-telnetd: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-telnetd: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-tftp: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-tftp: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-tftpd-dbg: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-tftpd-dbg: PKGSIZE changed from 219856 to 219456 (-0%)
packages/core2-64-poky-linux/inetutils/inetutils-tftpd-dbg: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-tftpd: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-tftpd: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils-traceroute: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils-traceroute: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils/inetutils: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils/inetutils: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/inetutils: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/inetutils: SRC_URI changed from "https://ftp.gnu.org/gnu/inetutils/inetutils-2.5.tar.xz file://rexec.xinetd.inetutils file://rlogin.xinetd.inetutils file://rsh.xinetd.inetutils file://telnet.xinetd.inetutils file://tftpd.xinetd.inetutils" to "https://ftp.gnu.org/gnu/inetutils/inetutils-2.6.tar.xz file://rexec.xinetd.inetutils file://rlogin.xinetd.inetutils file://rsh.xinetd.inetutils file://telnet.xinetd.inetutils file://tftpd.xinetd.inetutils"
packages/core2-64-poky-linux/inetutils: PKGV changed from 2.5 [default] to 2.6 [default]

--===============5046783554633236481==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-inetutils-upgrade-2.5-2.6.patch"

RnJvbSA4N2E3MTkyNDQzN2E5MDQ0OTRiZDk1ZDhmNjg5MDJlZDRkOGUxMDRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNjo0NTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlu
ZXR1dGlsczogdXBncmFkZSAyLjUgLT4gMi42CgotLS0KIC4uLi9pbmV0dXRpbHMve2luZXR1dGls
c18yLjUuYmIgPT4gaW5ldHV0aWxzXzIuNi5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvaW5ldHV0aWxzL3tpbmV0dXRpbHNfMi41LmJiID0+IGluZXR1dGlsc18y
LjYuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pbmV0
dXRpbHMvaW5ldHV0aWxzXzIuNS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaW5ldHV0
aWxzL2luZXR1dGlsc18yLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pbmV0dXRpbHMvaW5ldHV0aWxzXzIuNS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pbmV0dXRpbHMvaW5ldHV0aWxzXzIuNi5iYgpp
bmRleCAxOWJmN2UxNTM5Li5lZjQ1M2QzYmIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2luZXR1dGlscy9pbmV0dXRpbHNfMi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvaW5ldHV0aWxzL2luZXR1dGlsc18yLjYuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJHUEwtMy4wLW9ubHkiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTBjNzA1MWFlZjkyMTlkYzcyMzdmMjA2YzVjNDE3OWE3IgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiODc2OTdkNjBhMzFlMTBiNWNiODZhOWYwNjUxZTFlYzdiZWU5ODMyMGQwNDhj
MDczOTQzMWFhYzNkNTc2NGZiNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2OGJlZGJmZWFmNzNm
N2Q4NmJlMmE3ZDk5YmNmYmQ0MDkzZDgyOWY1Mjc3MDg5MzkxOWFlMTc0YzBiMjM1N2NhIgogU1JD
X1VSSSA9ICIke0dOVV9NSVJST1J9L2luZXR1dGlscy9pbmV0dXRpbHMtJHtQVn0udGFyLnh6IFwK
ICAgICAgICAgICAgZmlsZTovL3JleGVjLnhpbmV0ZC5pbmV0dXRpbHMgXAogICAgICAgICAgICBm
aWxlOi8vcmxvZ2luLnhpbmV0ZC5pbmV0dXRpbHMgXAotLSAKMi40NC4xCgo=

--===============5046783554633236481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/inetutils/inetutils-src: PKGSIZE changed from 3176340 to 3593248 (+13%)
packages/core2-64-poky-linux/inetutils/inetutils-telnet: PKGSIZE changed from 144968 to 161352 (+11%)

--===============5046783554633236481==--

