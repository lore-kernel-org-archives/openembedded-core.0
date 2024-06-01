Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972D3C32716
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.42247.1717263219592985950
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DroOLJFS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LEk1j9am;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018fd4dd36e0-4cc98103-5aa2-4d61-851e-4e88d031335d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bpJ/mXLaTBwJsw9nEbLayST7y1FVxSb3svm7esKrjyQ=;
	b=DroOLJFSH2N2NtjtaCOf8kFt7SKz6BOL2liGdZV37qAc/mF8qSzt4SG55Nodbpgr
	jX5PdfD4awX0njRIk7jj+0EBYp/t7L5NhRrKH1JwdFSlp2ob/Zo0uieDa9/cx3iaHgb
	f2S8iowPtF5laqBU75W4xQFNogSO8Q4EcQGbFM/s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bpJ/mXLaTBwJsw9nEbLayST7y1FVxSb3svm7esKrjyQ=;
	b=LEk1j9amZGF082SDjeuhtOL/GNsE3i5q6IzgsFZ+y8sZYJbjLuCnzWYAAf9QOmRH
	PFlxE/DmMqac/MsrHGpSDvzZYixc8qP7wsfHurdfy6p4DR2njMmkxDcmiW99Ja88fEc
	jWmOnmuaJSYZKb+3SeqakPTVBSYSCxEbaeOsRcOo=
Content-Type: multipart/mixed; boundary="===============8938287522386508943=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.6.2 SUCCEEDED
Message-ID: <0101018fd4dd36e0-4cc98103-5aa2-4d61-851e-4e88d031335d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200180

--===============8938287522386508943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xz* to *5.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.4.6-5.6.2.patch
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
From f03d1b09c5859f51f356268522dc0c630349ae47 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 12:05:00 +0000
Subject: [PATCH] xz: upgrade 5.4.6 -> 5.6.2

---
 .../xz/{xz_5.4.6.bb => xz_5.6.2.bb}           | 192 +++++++++++++++++-
 1 file changed, 189 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.6.2.bb} (21%)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.6.2.bb
similarity index 21%
rename from meta/recipes-extended/xz/xz_5.4.6.bb
rename to meta/recipes-extended/xz/xz_5.6.2.bb
index da3b75a10b..4c11eb2bbe 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.6.2.bb
@@ -1,3 +1,189 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -3,75 +3,81 @@
+#  ==================
+#  
+#      Different licenses apply to different files in this package. Here
+# -    is a rough summary of which licenses apply to which parts of this
+# -    package (but check the individual files to be sure!):
+# +    is a summary of which licenses apply to which parts of this package:
+#  
+# -      - liblzma is in the public domain.
+# +      - liblzma is under the BSD Zero Clause License (0BSD).
+#  
+# -      - xz, xzdec, and lzmadec command line tools are in the public
+# -        domain unless GNU getopt_long had to be compiled and linked
+# -        in from the lib directory. The getopt_long code is under
+# -        GNU LGPLv2.1+.
+# +      - The command line tools xz, xzdec, lzmadec, and lzmainfo are
+# +        under 0BSD except that, on systems that don't have a usable
+# +        getopt_long, GNU getopt_long is compiled and linked in from the
+# +        'lib' directory. The getopt_long code is under GNU LGPLv2.1+.
+#  
+#        - The scripts to grep, diff, and view compressed files have been
+# -        adapted from gzip. These scripts and their documentation are
+# -        under GNU GPLv2+.
+# +        adapted from GNU gzip. These scripts (xzgrep, xzdiff, xzless,
+# +        and xzmore) are under GNU GPLv2+. The man pages of the scripts
+# +        are under 0BSD; they aren't based on the man pages of GNU gzip.
+#  
+# -      - All the documentation in the doc directory and most of the
+# -        XZ Utils specific documentation files in other directories
+# -        are in the public domain.
+# +      - Most of the XZ Utils specific documentation that is in
+# +        plain text files (like README, INSTALL, PACKAGERS, NEWS,
+# +        and ChangeLog) are under 0BSD unless stated otherwise in
+# +        the file itself. The files xz-file-format.txt and
+# +        lzma-file-format.xt are in the public domain but may
+# +        be distributed under the terms of 0BSD too.
+#  
+# -        Note: The JavaScript files (under the MIT license) have
+# -        been removed from the Doxygen-generated HTML version of the
+# -        liblzma API documentation. Doxygen itself is under the GNU GPL
+# -        but the remaining files generated by Doxygen are not affected
+# -        by the licenses used in Doxygen because Doxygen licensing has
+# -        the following exception:
+# +      - Translated messages and man pages are under 0BSD except that
+# +        some old translations are in the public domain.
+#  
+# -            "Documents produced by doxygen are derivative works
+# -            derived from the input used in their production;
+# -            they are not affected by this license."
+# +      - Test files and test code in the 'tests' directory, and
+# +        debugging utilities in the 'debug' directory are under
+# +        the BSD Zero Clause License (0BSD).
+#  
+# -      - Translated messages are in the public domain.
+# +      - The GNU Autotools based build system contains files that are
+# +        under GNU GPLv2+, GNU GPLv3+, and a few permissive licenses.
+# +        These files don't affect the licensing of the binaries being
+# +        built.
+#  
+# -      - The build system contains public domain files, and files that
+# -        are under GNU GPLv2+ or GNU GPLv3+. None of these files end up
+# -        in the binaries being built.
+# +      - The 'extra' directory contains files that are under various
+# +        free software licenses. These aren't built or installed as
+# +        part of XZ Utils.
+#  
+# -      - Test files and test code in the tests directory, and debugging
+# -        utilities in the debug directory are in the public domain.
+# +    For the files under the BSD Zero Clause License (0BSD), if
+# +    a copyright notice is needed, the following is sufficient:
+#  
+# -      - The extra directory may contain public domain files, and files
+# -        that are under various free software licenses.
+# +        Copyright (C) The XZ Utils authors and contributors
+#  
+# -    You can do whatever you want with the files that have been put into
+# -    the public domain. If you find public domain legally problematic,
+# -    take the previous sentence as a license grant. If you still find
+# -    the lack of copyright legally problematic, you have too many
+# -    lawyers.
+# -
+# -    As usual, this software is provided "as is", without any warranty.
+# -
+# -    If you copy significant amounts of public domain code from XZ Utils
+# +    If you copy significant amounts of 0BSD-licensed code from XZ Utils
+#      into your project, acknowledging this somewhere in your software is
+#      polite (especially if it is proprietary, non-free software), but
+# -    naturally it is not legally required. Here is an example of a good
+# -    notice to put into "about box" or into documentation:
+# +    it is not legally required by the license terms. Here is an example
+# +    of a good notice to put into "about box" or into documentation:
+#  
+# -        This software includes code from XZ Utils
+# -        <https://xz.tukaani.org/xz-utils/>.
+# +        This software includes code from XZ Utils <https://tukaani.org/xz/>.
+#  
+#      The following license texts are included in the following files:
+# +      - COPYING.0BSD: BSD Zero Clause License
+#        - COPYING.LGPLv2.1: GNU Lesser General Public License version 2.1
+#        - COPYING.GPLv2: GNU General Public License version 2
+#        - COPYING.GPLv3: GNU General Public License version 3
+#  
+# -    Note that the toolchain (compiler, linker etc.) may add some code
+# -    pieces that are copyrighted. Thus, it is possible that e.g. liblzma
+# -    binary wouldn't actually be in the public domain in its entirety
+# -    even though it contains no copyrighted code from the XZ Utils source
+# -    package.
+# +    A note about old XZ Utils releases:
+#  
+# -    If you have questions, don't hesitate to ask the author(s) for more
+# -    information.
+# +        XZ Utils releases 5.4.6 and older and 5.5.1alpha have a
+# +        significant amount of code put into the public domain and
+# +        that obviously remains so. The switch from public domain to
+# +        0BSD for newer releases was made in Febrary 2024 because
+# +        public domain has (real or perceived) legal ambiguities in
+# +        some jurisdictions.
+#  
+# +        There is very little *practical* difference between public
+# +        domain and 0BSD. The main difference likely is that one
+# +        shouldn't claim that 0BSD-licensed code is in the public
+# +        domain; 0BSD-licensed code is copyrighted but available under
+# +        an extremely permissive license. Neither 0BSD nor public domain
+# +        require retaining or reproducing author, copyright holder, or
+# +        license notices when distributing the software. (Compare to,
+# +        for example, BSD 2-Clause "Simplified" License which does have
+# +        such requirements.)
+# +
+# +    If you have questions, don't hesitate to ask for more information.
+# +    The contact information is in the README file.
+# +
+# --- lib/getopt.c
+# +++ lib/getopt.c
+# @@ -1,23 +1,23 @@
+# +/* SPDX-License-Identifier: LGPL-2.1-or-later */
+# +
+#  /* Getopt for GNU.
+# -   NOTE: getopt is now part of the C library, so if you don't know what
+# -   "Keep this file name-space clean" means, talk to drepper@gnu.org
+# -   before changing it!
+# -   Copyright (C) 1987,88,89,90,91,92,93,94,95,96,98,99,2000,2001,2002,2003,2004,2006
+# -	Free Software Foundation, Inc.
+# -   This file is part of the GNU C Library.
+# +   Copyright (C) 1987-2023 Free Software Foundation, Inc.
+# +   This file is part of the GNU C Library and is also part of gnulib.
+# +   Patches to this file should be submitted to both projects.
+#  
+# -   This program is free software; you can redistribute it and/or modify
+# -   it under the terms of the GNU Lesser General Public License as published by
+# -   the Free Software Foundation; either version 2.1, or (at your option)
+# -   any later version.
+# +   The GNU C Library is free software; you can redistribute it and/or
+# +   modify it under the terms of the GNU Lesser General Public
+# +   License as published by the Free Software Foundation; either
+# +   version 2.1 of the License, or (at your option) any later version.
+#  
+# -   This program is distributed in the hope that it will be useful,
+# +   The GNU C Library is distributed in the hope that it will be useful,
+#     but WITHOUT ANY WARRANTY; without even the implied warranty of
+# -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# -   GNU Lesser General Public License for more details.
+# +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# +   Lesser General Public License for more details.
+#  
+# -   You should have received a copy of the GNU Lesser General Public License along
+# -   with this program; if not, write to the Free Software Foundation,
+# -   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
+# +   You should have received a copy of the GNU Lesser General Public
+# +   License along with the GNU C Library; if not, see
+# +   <https://www.gnu.org/licenses/>.  */
+#  
+#  #ifndef _LIBC
+# +# ifdef HAVE_CONFIG_H
+# 
+#
+
 SUMMARY = "Utilities for managing LZMA compressed files"
 HOMEPAGE = "https://tukaani.org/xz/"
 DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
@@ -17,17 +203,17 @@ LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
+                    file://lib/getopt.c;endline=23;md5=3f33e207287bf72834f3ae8c247dfb6a \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c"
+SRC_URI[sha256sum] = "8bfd20c0e1d86f0402f2497cfa71c6ab62d4cd35fd704276e3140bfb71414519"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.44.0


--===============8938287522386508943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.gz file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.gz file://run-ptest"
packages/core2-64-poky-linux/xz: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.4.6", added "/usr/lib/liblzma.so.5.6.2"
packages/core2-64-poky-linux/xz/liblzma: PKGSIZE changed from 190528 to 194624 (+2%)
packages/core2-64-poky-linux/xz/liblzma: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/liblzma: PV changed from "5.4.6" to "5.6.2"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so.5.4.6 moved to /usr/lib/liblzma.so.5.6.2
packages/core2-64-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.4.6", added "/usr/lib/xz/ptest/tests/.debug/test_microlzma /usr/lib/.debug/liblzma.so.5.6.2"
packages/core2-64-poky-linux/xz/xz-dbg: PKGSIZE changed from 1868816 to 2007264 (+7%)
packages/core2-64-poky-linux/xz/xz-dbg: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-dbg: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-dev: PKGSIZE changed from 225706 to 226687 (+0%)
packages/core2-64-poky-linux/xz/xz-dev: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-dev: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-doc: FILELIST: removed "/usr/share/doc/xz/api/tabs.css /usr/share/doc/xz/api/tab_bd.png /usr/share/doc/xz/api/structlzma__block.html /usr/share/doc/xz/api/hardware_8h.html /usr/share/man/fr/man1/lzcmp.1 /usr/share/man/fr/man1/xzcmp.1 /usr/share/doc/xz/api/doxygen.svg /usr/share/doc/xz/api/globals_enum.html /usr/share/doc/xz/api/tab_a.png /usr/share/man/fr/man1/lzmore.1 /usr/share/man/fr/man1/xzmore.1 /usr/share/doc/xz/api/structlzma__filter.html /usr/share/doc/xz/api/doxygen.css /usr/share/doc/xz/api/structlzma__stream.html /usr/share/doc/xz/api/tab_hd.png /usr/share/doc/xz/api/globals.html /usr/share/doc/xz/api/tab_ad.png /usr/share/doc/xz/api/structlzma__stream__flags.html /usr/share/doc/xz/api/classes.html /usr/share/doc/xz/api/open.png /usr/share/man/pt_BR/man1/lzdiff.1 /usr/share/man/pt_BR/man1/lzgrep.1 /usr/share/man/pt_BR/man1/lzmore.1 /usr/share/man/pt_BR/man1/xzdiff.1 /usr/share/man/pt_BR/man1/xzgrep.1 /usr/share/man/pt_BR/man1/xzmore.1 /us
 r/share/doc/xz/api/globals_defs.html /usr/share/doc/xz/api/folderclosedd.svg /usr/share/doc/xz/api/globals_eval.html /usr/share/doc/xz/api/sync_off.png /usr/share/doc/xz/api/files.html /usr/share/doc/xz/examples_old/xz_pipe_decomp.c /usr/share/doc/xz/api/container_8h.html /usr/share/doc/xz/api/lzma_8h.html /usr/share/doc/xz/api/bcj_8h.html /usr/share/doc/xz/examples_old/xz_pipe_comp.c /usr/share/doc/xz/api/globals_func.html /usr/share/doc/xz/api/functions_vars.html /usr/share/doc/xz/api/folderopen.svg /usr/share/doc/xz/api/index.html /usr/share/doc/xz/api/vli_8h.html /usr/share/doc/xz/api/structlzma__options__bcj.html /usr/share/man/fr/man1/lzdiff.1 /usr/share/man/fr/man1/xzdiff.1 /usr/share/doc/xz/api/base_8h.html /usr/share/doc/xz/api/nav_fd.png /usr/share/doc/xz/api/filter_8h.html /usr/share/doc/xz/api/block_8h.html /usr/share/doc/xz/api/structlzma__index__iter.html /usr/share/man/pt_BR/man1/xzcmp.1 /usr/share/man/pt_BR/man1/lzcmp.1 /usr/share/doc/xz/api/tab_sd.png /usr/share/doc
 /xz/api/nav_hd.png /usr/share/doc/xz/api/folderclosed.svg /usr/share/doc/xz/api/index_8h.html /usr/share/doc/xz/api/structlzma__allocator.html /usr/share/man/pt_BR/man1/lzegrep.1 /usr/share/man/pt_BR/man1/lzfgrep.1 /usr/share/doc/xz/api/tab_h.png /usr/share/man/pt_BR/man1/xzegrep.1 /usr/share/man/pt_BR/man1/xzfgrep.1 /usr/share/doc/xz/api/folderopend.svg /usr/share/doc/xz/api/lzma12_8h.html /usr/share/doc/xz/api/splitbard.png /usr/share/doc/xz/api/nav_f.png /usr/share/doc/xz/api/structlzma__mt.html /usr/share/doc/xz/TODO /usr/share/doc/xz/api/tab_b.png /usr/share/doc/xz/api/bc_sd.png /usr/share/doc/xz/api/index__hash_8h.html /usr/share/doc/xz/api/nav_g.png /usr/share/doc/xz/api/stream__flags_8h.html /usr/share/doc/xz/api/sync_on.png /usr/share/doc/xz/api/structlzma__options__delta.html /usr/share/doc/xz/api/check_8h.html /usr/share/doc/xz/api/dir_b17a1d403082bd69a703ed987cf158fb.html /usr/share/doc/xz/api/splitbar.png /usr/share/doc/xz/api/annotated.html /usr/share/doc/xz/api/functi
 ons.html /usr/share/doc/xz/api/globals_type.html /usr/share/doc/xz/api/nav_h.png /usr/share/doc/xz/api/structlzma__options__lzma.html /usr/share/doc/xz/api/delta_8h.html /usr/share/doc/xz/api/closed.png /usr/share/doc/xz/api/version_8h.html /usr/share/doc/xz/api/doc.svg /usr/share/doc/xz/api/docd.svg /usr/share/doc/xz/api/tab_s.png /usr/share/doc/xz/api/bc_s.png", added "/usr/share/man/uk/man1/lzmainfo.1 /usr/share/man/de/man1/lzmainfo.1 /usr/share/man/pt_BR/man1/lzmainfo.1 /usr/share/doc/xz/COPYING.0BSD /usr/share/man/ro/man1/lzmainfo.1 /usr/share/man/ko/man1/lzmainfo.1 /usr/share/doc/xz/examples/11_file_info.c /usr/share/man/fr/man1/lzmainfo.1"
packages/core2-64-poky-linux/xz/xz-doc: PKGSIZE changed from 1793515 to 993542 (-45%)
packages/core2-64-poky-linux/xz/xz-doc: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-doc: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGSIZE changed from 26876 to 22289 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-ca: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGSIZE changed from 17576 to 15436 (-12%)
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-cs: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-da: PKGSIZE changed from 12015 to 11042 (-8%)
packages/core2-64-poky-linux/xz/xz-locale-da: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-da: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-de: PKGSIZE changed from 28599 to 32560 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-de: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-de: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGSIZE changed from 26139 to 29979 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-eo: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-es: PKGSIZE changed from 27192 to 31175 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-es: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-es: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGSIZE changed from 25923 to 21441 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-fi: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGSIZE changed from 22313 to 19342 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-fr: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGSIZE changed from 26682 to 30343 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-hr: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGSIZE changed from 27374 to 31658 (+16%)
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-hu: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-it: PKGSIZE changed from 22043 to 19130 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-it: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-it: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGSIZE changed from 27394 to 31480 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-ko: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGSIZE changed from 26643 to 30611 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-pl: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 26890 to 22302 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGSIZE changed from 21887 to 18992 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGSIZE changed from 28538 to 32640 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-ro: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGSIZE changed from 27551 to 23849 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-sr: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGSIZE changed from 26576 to 30379 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-sv: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGSIZE changed from 26545 to 22029 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-tr: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGSIZE changed from 35322 to 40332 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-uk: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGSIZE changed from 28619 to 32859 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-vi: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGSIZE changed from 25247 to 22476 (-11%)
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGSIZE changed from 24823 to 20613 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-ptest: FILELIST: removed "/usr/lib/xz/ptest/tests/files/good-1-x86-lzma2.xz /usr/lib/xz/ptest/tests/files/good-1-sparc-lzma2.xz", added "/usr/lib/xz/ptest/tests/test_microlzma"
packages/core2-64-poky-linux/xz/xz-ptest: PKGSIZE changed from 433361 to 472412 (+9%)
packages/core2-64-poky-linux/xz/xz-ptest: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-ptest: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-src: FILELIST: directory renamed /usr/src/debug/xz/5.4.6/src/liblzma/rangecoder -> /usr/src/debug/xz/5.6.2/src/liblzma/rangecoder, directory renamed /usr/src/debug/xz/5.4.6/src/common -> /usr/src/debug/xz/5.6.2/src/common, directory renamed /usr/src/debug/xz/5.4.6/src/liblzma/common -> /usr/src/debug/xz/5.6.2/src/liblzma/common, directory renamed /usr/src/debug/xz/5.4.6/src/liblzma/delta -> /usr/src/debug/xz/5.6.2/src/liblzma/delta, directory renamed /usr/src/debug/xz/5.4.6/src/liblzma/api/lzma -> /usr/src/debug/xz/5.6.2/src/liblzma/api/lzma, directory renamed /usr/src/debug/xz/5.4.6/src/liblzma/lz -> /usr/src/debug/xz/5.6.2/src/liblzma/lz, directory renamed /usr/src/debug/xz/5.4.6/src/liblzma/lzma -> /usr/src/debug/xz/5.6.2/src/liblzma/lzma, directory renamed /usr/src/debug/xz/5.4.6/src/lzmainfo -> /usr/src/debug/xz/5.6.2/src/lzmainfo, directory renamed /usr/src/debug/xz/5.4.6/src/xzdec -> /usr/src/debug/xz/5.6.2/src/xzdec, removed "/usr/src/debug/
 xz/5.4.6/src/xz/args.h /usr/src/debug/xz/5.4.6/src/xz/hardware.h /usr/src/debug/xz/5.4.6/src/liblzma/simple/powerpc.c /usr/src/debug/xz/5.4.6/src/xz/hardware.c /usr/src/debug/xz/5.4.6/src/xz/args.c /usr/src/debug/xz/5.4.6/tests/test_lzip_decoder.c /usr/src/debug/xz/5.4.6/tests/test_vli.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/armthumb.c /usr/src/debug/xz/5.4.6/src/xz/options.c /usr/src/debug/xz/5.4.6/tests/test_bcj_exact_size.c /usr/src/debug/xz/5.4.6/src/xz/suffix.h /usr/src/debug/xz/5.4.6/tests/test_index_hash.c /usr/src/debug/xz/5.4.6/src/xz/options.h /usr/src/debug/xz/5.4.6/src/xz/suffix.c /usr/src/debug/xz/5.4.6/src/xz/list.h /usr/src/debug/xz/5.4.6/src/liblzma/simple/simple_decoder.h /usr/src/debug/xz/5.4.6/src/liblzma/simple/simple_encoder.h /usr/src/debug/xz/5.4.6/src/xz/main.c /usr/src/debug/xz/5.4.6/src/liblzma/check/check.h /usr/src/debug/xz/5.4.6/src/liblzma/simple/simple_encoder.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/simple_decoder.c /usr/src/debug/xz/5.4.6/sr
 c/xz/list.c /usr/src/debug/xz/5.4.6/src/liblzma/check/check.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/x86.c /usr/src/debug/xz/5.4.6/src/xz/main.h /usr/src/debug/xz/5.4.6/src/xz/mytime.c /usr/src/debug/xz/5.4.6/tests/test_hardware.c /usr/src/debug/xz/5.4.6/src/xz/mytime.h /usr/src/debug/xz/5.4.6/src/liblzma/check/crc32_table.c /usr/src/debug/xz/5.4.6/src/liblzma/check/crc64_table.c /usr/src/debug/xz/5.4.6/tests/test_filter_str.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/arm64.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/sparc.c /usr/src/debug/xz/5.4.6/src/xz/file_io.h /usr/src/debug/xz/5.4.6/src/liblzma/simple/arm.c /usr/src/debug/xz/5.4.6/src/xz/signals.c /usr/src/debug/xz/5.4.6/src/xz/coder.c /usr/src/debug/xz/5.4.6/src/xz/file_io.c /usr/src/debug/xz/5.4.6/tests/tests.h /usr/src/debug/xz/5.4.6/src/xz/coder.h /usr/src/debug/xz/5.4.6/src/liblzma/check/crc64_table_le.h /usr/src/debug/xz/5.4.6/src/liblzma/check/crc32_table_le.h /usr/src/debug/xz/5.4.6/src/xz/signals.h /usr/src/debu
 g/xz/5.4.6/tests/create_compress_files.c /usr/src/debug/xz/5.4.6/src/xz/util.c /usr/src/debug/xz/5.4.6/src/xz/message.h /usr/src/debug/xz/5.4.6/tests/test_block_header.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/simple_coder.h /usr/src/debug/xz/5.4.6/src/xz/message.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/ia64.c /usr/src/debug/xz/5.4.6/src/xz/util.h /usr/src/debug/xz/5.4.6/tests/test_stream_flags.c /usr/src/debug/xz/5.4.6/src/liblzma/check/crc32_fast.c /usr/src/debug/xz/5.4.6/src/liblzma/check/crc64_fast.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/simple_coder.c /usr/src/debug/xz/5.4.6/tests/test_filter_flags.c /usr/src/debug/xz/5.4.6/tests/test_check.c /usr/src/debug/xz/5.4.6/tests/test_index.c /usr/src/debug/xz/5.4.6/tests/test_memlimit.c /usr/src/debug/xz/5.4.6/src/liblzma/simple/simple_private.h /usr/src/debug/xz/5.4.6/src/liblzma/check/sha256.c /usr/src/debug/xz/5.4.6/tests/tuktest.h", added "/usr/src/debug/xz/5.6.2/src/xz/sandbox.c /usr/src/debug/xz/5.6.2/src/xz/args.h /
 usr/src/debug/xz/5.6.2/src/xz/hardware.h /usr/src/debug/xz/5.6.2/src/xz/sandbox.h /usr/src/debug/xz/5.6.2/src/liblzma/simple/powerpc.c /usr/src/debug/xz/5.6.2/src/xz/hardware.c /usr/src/debug/xz/5.6.2/src/xz/args.c /usr/src/debug/xz/5.6.2/tests/test_lzip_decoder.c /usr/src/debug/xz/5.6.2/tests/test_vli.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/armthumb.c /usr/src/debug/xz/5.6.2/src/xz/options.c /usr/src/debug/xz/5.6.2/tests/test_bcj_exact_size.c /usr/src/debug/xz/5.6.2/src/xz/suffix.h /usr/src/debug/xz/5.6.2/tests/test_index_hash.c /usr/src/debug/xz/5.6.2/src/xz/options.h /usr/src/debug/xz/5.6.2/src/xz/suffix.c /usr/src/debug/xz/5.6.2/src/xz/list.h /usr/src/debug/xz/5.6.2/src/liblzma/simple/simple_decoder.h /usr/src/debug/xz/5.6.2/src/liblzma/simple/simple_encoder.h /usr/src/debug/xz/5.6.2/src/xz/main.c /usr/src/debug/xz/5.6.2/src/liblzma/check/check.h /usr/src/debug/xz/5.6.2/src/liblzma/simple/simple_decoder.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/simple_encoder.c /usr/src/
 debug/xz/5.6.2/src/xz/list.c /usr/src/debug/xz/5.6.2/src/liblzma/check/check.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/x86.c /usr/src/debug/xz/5.6.2/src/xz/main.h /usr/src/debug/xz/5.6.2/src/xz/mytime.c /usr/src/debug/xz/5.6.2/tests/test_hardware.c /usr/src/debug/xz/5.6.2/src/xz/mytime.h /usr/src/debug/xz/5.6.2/src/liblzma/check/crc32_table.c /usr/src/debug/xz/5.6.2/src/liblzma/check/crc64_table.c /usr/src/debug/xz/5.6.2/tests/test_filter_str.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/arm64.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/riscv.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/sparc.c /usr/src/debug/xz/5.6.2/src/xz/file_io.h /usr/src/debug/xz/5.6.2/src/liblzma/simple/arm.c /usr/src/debug/xz/5.6.2/src/xz/signals.c /usr/src/debug/xz/5.6.2/src/xz/coder.c /usr/src/debug/xz/5.6.2/src/xz/file_io.c /usr/src/debug/xz/5.6.2/tests/tests.h /usr/src/debug/xz/5.6.2/src/xz/coder.h /usr/src/debug/xz/5.6.2/src/liblzma/check/crc64_table_le.h /usr/src/debug/xz/5.6.2/src/liblzma/check/crc
 32_table_le.h /usr/src/debug/xz/5.6.2/src/xz/signals.h /usr/src/debug/xz/5.6.2/tests/create_compress_files.c /usr/src/debug/xz/5.6.2/src/xz/util.c /usr/src/debug/xz/5.6.2/src/liblzma/check/crc_x86_clmul.h /usr/src/debug/xz/5.6.2/src/xz/message.h /usr/src/debug/xz/5.6.2/src/liblzma/simple/simple_coder.h /usr/src/debug/xz/5.6.2/tests/test_block_header.c /usr/src/debug/xz/5.6.2/tests/test_microlzma.c /usr/src/debug/xz/5.6.2/src/xz/message.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/ia64.c /usr/src/debug/xz/5.6.2/src/xz/util.h /usr/src/debug/xz/5.6.2/tests/test_stream_flags.c /usr/src/debug/xz/5.6.2/src/liblzma/check/crc32_fast.c /usr/src/debug/xz/5.6.2/src/liblzma/check/crc64_fast.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/simple_coder.c /usr/src/debug/xz/5.6.2/tests/test_filter_flags.c /usr/src/debug/xz/5.6.2/tests/test_check.c /usr/src/debug/xz/5.6.2/tests/test_index.c /usr/src/debug/xz/5.6.2/tests/test_memlimit.c /usr/src/debug/xz/5.6.2/src/liblzma/simple/simple_private.h /usr/sr
 c/debug/xz/5.6.2/src/liblzma/check/sha256.c /usr/src/debug/xz/5.6.2/tests/tuktest.h"
packages/core2-64-poky-linux/xz/xz-src: PKGSIZE changed from 1543297 to 1658436 (+7%)
packages/core2-64-poky-linux/xz/xz-src: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-src: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz-staticdev: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz-staticdev: PV changed from "5.4.6" to "5.6.2"
packages/core2-64-poky-linux/xz/xz: PKGSIZE changed from 149851 to 158871 (+6%)
packages/core2-64-poky-linux/xz/xz: PKGV changed from 5.4.6 [default] to 5.6.2 [default]
packages/core2-64-poky-linux/xz/xz: PV changed from "5.4.6" to "5.6.2"
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so.5.4.6 moved to /usr/lib/liblzma.so.5.6.2

--===============8938287522386508943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.4.6-5.6.2.patch"

RnJvbSBmMDNkMWIwOWM1ODU5ZjUxZjM1NjI2ODUyMmRjMGM2MzAzNDlhZTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxMjowNTowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh6
OiB1cGdyYWRlIDUuNC42IC0+IDUuNi4yCgotLS0KIC4uLi94ei97eHpfNS40LjYuYmIgPT4geHpf
NS42LjIuYmJ9ICAgICAgICAgICB8IDE5MiArKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxODkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQveHove3h6XzUuNC42LmJiID0+IHh6XzUuNi4yLmJifSAoMjElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjQuNi5iYiBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei94el81LjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDIxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHoveHpfNS40LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC94ei94el81LjYuMi5iYgppbmRleCBkYTNiNzVhMTBiLi40YzExZWIyYmJl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHoveHpfNS40LjYuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuNi4yLmJiCkBAIC0xLDMgKzEsMTg5IEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMyw3NSAr
Myw4MSBAQAorIyAgPT09PT09PT09PT09PT09PT09CisjICAKKyMgICAgICBEaWZmZXJlbnQgbGlj
ZW5zZXMgYXBwbHkgdG8gZGlmZmVyZW50IGZpbGVzIGluIHRoaXMgcGFja2FnZS4gSGVyZQorIyAt
ICAgIGlzIGEgcm91Z2ggc3VtbWFyeSBvZiB3aGljaCBsaWNlbnNlcyBhcHBseSB0byB3aGljaCBw
YXJ0cyBvZiB0aGlzCisjIC0gICAgcGFja2FnZSAoYnV0IGNoZWNrIHRoZSBpbmRpdmlkdWFsIGZp
bGVzIHRvIGJlIHN1cmUhKToKKyMgKyAgICBpcyBhIHN1bW1hcnkgb2Ygd2hpY2ggbGljZW5zZXMg
YXBwbHkgdG8gd2hpY2ggcGFydHMgb2YgdGhpcyBwYWNrYWdlOgorIyAgCisjIC0gICAgICAtIGxp
Ymx6bWEgaXMgaW4gdGhlIHB1YmxpYyBkb21haW4uCisjICsgICAgICAtIGxpYmx6bWEgaXMgdW5k
ZXIgdGhlIEJTRCBaZXJvIENsYXVzZSBMaWNlbnNlICgwQlNEKS4KKyMgIAorIyAtICAgICAgLSB4
eiwgeHpkZWMsIGFuZCBsem1hZGVjIGNvbW1hbmQgbGluZSB0b29scyBhcmUgaW4gdGhlIHB1Ymxp
YworIyAtICAgICAgICBkb21haW4gdW5sZXNzIEdOVSBnZXRvcHRfbG9uZyBoYWQgdG8gYmUgY29t
cGlsZWQgYW5kIGxpbmtlZAorIyAtICAgICAgICBpbiBmcm9tIHRoZSBsaWIgZGlyZWN0b3J5LiBU
aGUgZ2V0b3B0X2xvbmcgY29kZSBpcyB1bmRlcgorIyAtICAgICAgICBHTlUgTEdQTHYyLjErLgor
IyArICAgICAgLSBUaGUgY29tbWFuZCBsaW5lIHRvb2xzIHh6LCB4emRlYywgbHptYWRlYywgYW5k
IGx6bWFpbmZvIGFyZQorIyArICAgICAgICB1bmRlciAwQlNEIGV4Y2VwdCB0aGF0LCBvbiBzeXN0
ZW1zIHRoYXQgZG9uJ3QgaGF2ZSBhIHVzYWJsZQorIyArICAgICAgICBnZXRvcHRfbG9uZywgR05V
IGdldG9wdF9sb25nIGlzIGNvbXBpbGVkIGFuZCBsaW5rZWQgaW4gZnJvbSB0aGUKKyMgKyAgICAg
ICAgJ2xpYicgZGlyZWN0b3J5LiBUaGUgZ2V0b3B0X2xvbmcgY29kZSBpcyB1bmRlciBHTlUgTEdQ
THYyLjErLgorIyAgCisjICAgICAgICAtIFRoZSBzY3JpcHRzIHRvIGdyZXAsIGRpZmYsIGFuZCB2
aWV3IGNvbXByZXNzZWQgZmlsZXMgaGF2ZSBiZWVuCisjIC0gICAgICAgIGFkYXB0ZWQgZnJvbSBn
emlwLiBUaGVzZSBzY3JpcHRzIGFuZCB0aGVpciBkb2N1bWVudGF0aW9uIGFyZQorIyAtICAgICAg
ICB1bmRlciBHTlUgR1BMdjIrLgorIyArICAgICAgICBhZGFwdGVkIGZyb20gR05VIGd6aXAuIFRo
ZXNlIHNjcmlwdHMgKHh6Z3JlcCwgeHpkaWZmLCB4emxlc3MsCisjICsgICAgICAgIGFuZCB4em1v
cmUpIGFyZSB1bmRlciBHTlUgR1BMdjIrLiBUaGUgbWFuIHBhZ2VzIG9mIHRoZSBzY3JpcHRzCisj
ICsgICAgICAgIGFyZSB1bmRlciAwQlNEOyB0aGV5IGFyZW4ndCBiYXNlZCBvbiB0aGUgbWFuIHBh
Z2VzIG9mIEdOVSBnemlwLgorIyAgCisjIC0gICAgICAtIEFsbCB0aGUgZG9jdW1lbnRhdGlvbiBp
biB0aGUgZG9jIGRpcmVjdG9yeSBhbmQgbW9zdCBvZiB0aGUKKyMgLSAgICAgICAgWFogVXRpbHMg
c3BlY2lmaWMgZG9jdW1lbnRhdGlvbiBmaWxlcyBpbiBvdGhlciBkaXJlY3RvcmllcworIyAtICAg
ICAgICBhcmUgaW4gdGhlIHB1YmxpYyBkb21haW4uCisjICsgICAgICAtIE1vc3Qgb2YgdGhlIFha
IFV0aWxzIHNwZWNpZmljIGRvY3VtZW50YXRpb24gdGhhdCBpcyBpbgorIyArICAgICAgICBwbGFp
biB0ZXh0IGZpbGVzIChsaWtlIFJFQURNRSwgSU5TVEFMTCwgUEFDS0FHRVJTLCBORVdTLAorIyAr
ICAgICAgICBhbmQgQ2hhbmdlTG9nKSBhcmUgdW5kZXIgMEJTRCB1bmxlc3Mgc3RhdGVkIG90aGVy
d2lzZSBpbgorIyArICAgICAgICB0aGUgZmlsZSBpdHNlbGYuIFRoZSBmaWxlcyB4ei1maWxlLWZv
cm1hdC50eHQgYW5kCisjICsgICAgICAgIGx6bWEtZmlsZS1mb3JtYXQueHQgYXJlIGluIHRoZSBw
dWJsaWMgZG9tYWluIGJ1dCBtYXkKKyMgKyAgICAgICAgYmUgZGlzdHJpYnV0ZWQgdW5kZXIgdGhl
IHRlcm1zIG9mIDBCU0QgdG9vLgorIyAgCisjIC0gICAgICAgIE5vdGU6IFRoZSBKYXZhU2NyaXB0
IGZpbGVzICh1bmRlciB0aGUgTUlUIGxpY2Vuc2UpIGhhdmUKKyMgLSAgICAgICAgYmVlbiByZW1v
dmVkIGZyb20gdGhlIERveHlnZW4tZ2VuZXJhdGVkIEhUTUwgdmVyc2lvbiBvZiB0aGUKKyMgLSAg
ICAgICAgbGlibHptYSBBUEkgZG9jdW1lbnRhdGlvbi4gRG94eWdlbiBpdHNlbGYgaXMgdW5kZXIg
dGhlIEdOVSBHUEwKKyMgLSAgICAgICAgYnV0IHRoZSByZW1haW5pbmcgZmlsZXMgZ2VuZXJhdGVk
IGJ5IERveHlnZW4gYXJlIG5vdCBhZmZlY3RlZAorIyAtICAgICAgICBieSB0aGUgbGljZW5zZXMg
dXNlZCBpbiBEb3h5Z2VuIGJlY2F1c2UgRG94eWdlbiBsaWNlbnNpbmcgaGFzCisjIC0gICAgICAg
IHRoZSBmb2xsb3dpbmcgZXhjZXB0aW9uOgorIyArICAgICAgLSBUcmFuc2xhdGVkIG1lc3NhZ2Vz
IGFuZCBtYW4gcGFnZXMgYXJlIHVuZGVyIDBCU0QgZXhjZXB0IHRoYXQKKyMgKyAgICAgICAgc29t
ZSBvbGQgdHJhbnNsYXRpb25zIGFyZSBpbiB0aGUgcHVibGljIGRvbWFpbi4KKyMgIAorIyAtICAg
ICAgICAgICAgIkRvY3VtZW50cyBwcm9kdWNlZCBieSBkb3h5Z2VuIGFyZSBkZXJpdmF0aXZlIHdv
cmtzCisjIC0gICAgICAgICAgICBkZXJpdmVkIGZyb20gdGhlIGlucHV0IHVzZWQgaW4gdGhlaXIg
cHJvZHVjdGlvbjsKKyMgLSAgICAgICAgICAgIHRoZXkgYXJlIG5vdCBhZmZlY3RlZCBieSB0aGlz
IGxpY2Vuc2UuIgorIyArICAgICAgLSBUZXN0IGZpbGVzIGFuZCB0ZXN0IGNvZGUgaW4gdGhlICd0
ZXN0cycgZGlyZWN0b3J5LCBhbmQKKyMgKyAgICAgICAgZGVidWdnaW5nIHV0aWxpdGllcyBpbiB0
aGUgJ2RlYnVnJyBkaXJlY3RvcnkgYXJlIHVuZGVyCisjICsgICAgICAgIHRoZSBCU0QgWmVybyBD
bGF1c2UgTGljZW5zZSAoMEJTRCkuCisjICAKKyMgLSAgICAgIC0gVHJhbnNsYXRlZCBtZXNzYWdl
cyBhcmUgaW4gdGhlIHB1YmxpYyBkb21haW4uCisjICsgICAgICAtIFRoZSBHTlUgQXV0b3Rvb2xz
IGJhc2VkIGJ1aWxkIHN5c3RlbSBjb250YWlucyBmaWxlcyB0aGF0IGFyZQorIyArICAgICAgICB1
bmRlciBHTlUgR1BMdjIrLCBHTlUgR1BMdjMrLCBhbmQgYSBmZXcgcGVybWlzc2l2ZSBsaWNlbnNl
cy4KKyMgKyAgICAgICAgVGhlc2UgZmlsZXMgZG9uJ3QgYWZmZWN0IHRoZSBsaWNlbnNpbmcgb2Yg
dGhlIGJpbmFyaWVzIGJlaW5nCisjICsgICAgICAgIGJ1aWx0LgorIyAgCisjIC0gICAgICAtIFRo
ZSBidWlsZCBzeXN0ZW0gY29udGFpbnMgcHVibGljIGRvbWFpbiBmaWxlcywgYW5kIGZpbGVzIHRo
YXQKKyMgLSAgICAgICAgYXJlIHVuZGVyIEdOVSBHUEx2Misgb3IgR05VIEdQTHYzKy4gTm9uZSBv
ZiB0aGVzZSBmaWxlcyBlbmQgdXAKKyMgLSAgICAgICAgaW4gdGhlIGJpbmFyaWVzIGJlaW5nIGJ1
aWx0LgorIyArICAgICAgLSBUaGUgJ2V4dHJhJyBkaXJlY3RvcnkgY29udGFpbnMgZmlsZXMgdGhh
dCBhcmUgdW5kZXIgdmFyaW91cworIyArICAgICAgICBmcmVlIHNvZnR3YXJlIGxpY2Vuc2VzLiBU
aGVzZSBhcmVuJ3QgYnVpbHQgb3IgaW5zdGFsbGVkIGFzCisjICsgICAgICAgIHBhcnQgb2YgWFog
VXRpbHMuCisjICAKKyMgLSAgICAgIC0gVGVzdCBmaWxlcyBhbmQgdGVzdCBjb2RlIGluIHRoZSB0
ZXN0cyBkaXJlY3RvcnksIGFuZCBkZWJ1Z2dpbmcKKyMgLSAgICAgICAgdXRpbGl0aWVzIGluIHRo
ZSBkZWJ1ZyBkaXJlY3RvcnkgYXJlIGluIHRoZSBwdWJsaWMgZG9tYWluLgorIyArICAgIEZvciB0
aGUgZmlsZXMgdW5kZXIgdGhlIEJTRCBaZXJvIENsYXVzZSBMaWNlbnNlICgwQlNEKSwgaWYKKyMg
KyAgICBhIGNvcHlyaWdodCBub3RpY2UgaXMgbmVlZGVkLCB0aGUgZm9sbG93aW5nIGlzIHN1ZmZp
Y2llbnQ6CisjICAKKyMgLSAgICAgIC0gVGhlIGV4dHJhIGRpcmVjdG9yeSBtYXkgY29udGFpbiBw
dWJsaWMgZG9tYWluIGZpbGVzLCBhbmQgZmlsZXMKKyMgLSAgICAgICAgdGhhdCBhcmUgdW5kZXIg
dmFyaW91cyBmcmVlIHNvZnR3YXJlIGxpY2Vuc2VzLgorIyArICAgICAgICBDb3B5cmlnaHQgKEMp
IFRoZSBYWiBVdGlscyBhdXRob3JzIGFuZCBjb250cmlidXRvcnMKKyMgIAorIyAtICAgIFlvdSBj
YW4gZG8gd2hhdGV2ZXIgeW91IHdhbnQgd2l0aCB0aGUgZmlsZXMgdGhhdCBoYXZlIGJlZW4gcHV0
IGludG8KKyMgLSAgICB0aGUgcHVibGljIGRvbWFpbi4gSWYgeW91IGZpbmQgcHVibGljIGRvbWFp
biBsZWdhbGx5IHByb2JsZW1hdGljLAorIyAtICAgIHRha2UgdGhlIHByZXZpb3VzIHNlbnRlbmNl
IGFzIGEgbGljZW5zZSBncmFudC4gSWYgeW91IHN0aWxsIGZpbmQKKyMgLSAgICB0aGUgbGFjayBv
ZiBjb3B5cmlnaHQgbGVnYWxseSBwcm9ibGVtYXRpYywgeW91IGhhdmUgdG9vIG1hbnkKKyMgLSAg
ICBsYXd5ZXJzLgorIyAtCisjIC0gICAgQXMgdXN1YWwsIHRoaXMgc29mdHdhcmUgaXMgcHJvdmlk
ZWQgImFzIGlzIiwgd2l0aG91dCBhbnkgd2FycmFudHkuCisjIC0KKyMgLSAgICBJZiB5b3UgY29w
eSBzaWduaWZpY2FudCBhbW91bnRzIG9mIHB1YmxpYyBkb21haW4gY29kZSBmcm9tIFhaIFV0aWxz
CisjICsgICAgSWYgeW91IGNvcHkgc2lnbmlmaWNhbnQgYW1vdW50cyBvZiAwQlNELWxpY2Vuc2Vk
IGNvZGUgZnJvbSBYWiBVdGlscworIyAgICAgIGludG8geW91ciBwcm9qZWN0LCBhY2tub3dsZWRn
aW5nIHRoaXMgc29tZXdoZXJlIGluIHlvdXIgc29mdHdhcmUgaXMKKyMgICAgICBwb2xpdGUgKGVz
cGVjaWFsbHkgaWYgaXQgaXMgcHJvcHJpZXRhcnksIG5vbi1mcmVlIHNvZnR3YXJlKSwgYnV0Cisj
IC0gICAgbmF0dXJhbGx5IGl0IGlzIG5vdCBsZWdhbGx5IHJlcXVpcmVkLiBIZXJlIGlzIGFuIGV4
YW1wbGUgb2YgYSBnb29kCisjIC0gICAgbm90aWNlIHRvIHB1dCBpbnRvICJhYm91dCBib3giIG9y
IGludG8gZG9jdW1lbnRhdGlvbjoKKyMgKyAgICBpdCBpcyBub3QgbGVnYWxseSByZXF1aXJlZCBi
eSB0aGUgbGljZW5zZSB0ZXJtcy4gSGVyZSBpcyBhbiBleGFtcGxlCisjICsgICAgb2YgYSBnb29k
IG5vdGljZSB0byBwdXQgaW50byAiYWJvdXQgYm94IiBvciBpbnRvIGRvY3VtZW50YXRpb246Cisj
ICAKKyMgLSAgICAgICAgVGhpcyBzb2Z0d2FyZSBpbmNsdWRlcyBjb2RlIGZyb20gWFogVXRpbHMK
KyMgLSAgICAgICAgPGh0dHBzOi8veHoudHVrYWFuaS5vcmcveHotdXRpbHMvPi4KKyMgKyAgICAg
ICAgVGhpcyBzb2Z0d2FyZSBpbmNsdWRlcyBjb2RlIGZyb20gWFogVXRpbHMgPGh0dHBzOi8vdHVr
YWFuaS5vcmcveHovPi4KKyMgIAorIyAgICAgIFRoZSBmb2xsb3dpbmcgbGljZW5zZSB0ZXh0cyBh
cmUgaW5jbHVkZWQgaW4gdGhlIGZvbGxvd2luZyBmaWxlczoKKyMgKyAgICAgIC0gQ09QWUlORy4w
QlNEOiBCU0QgWmVybyBDbGF1c2UgTGljZW5zZQorIyAgICAgICAgLSBDT1BZSU5HLkxHUEx2Mi4x
OiBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAyLjEKKyMgICAgICAg
IC0gQ09QWUlORy5HUEx2MjogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAyCisj
ICAgICAgICAtIENPUFlJTkcuR1BMdjM6IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNp
b24gMworIyAgCisjIC0gICAgTm90ZSB0aGF0IHRoZSB0b29sY2hhaW4gKGNvbXBpbGVyLCBsaW5r
ZXIgZXRjLikgbWF5IGFkZCBzb21lIGNvZGUKKyMgLSAgICBwaWVjZXMgdGhhdCBhcmUgY29weXJp
Z2h0ZWQuIFRodXMsIGl0IGlzIHBvc3NpYmxlIHRoYXQgZS5nLiBsaWJsem1hCisjIC0gICAgYmlu
YXJ5IHdvdWxkbid0IGFjdHVhbGx5IGJlIGluIHRoZSBwdWJsaWMgZG9tYWluIGluIGl0cyBlbnRp
cmV0eQorIyAtICAgIGV2ZW4gdGhvdWdoIGl0IGNvbnRhaW5zIG5vIGNvcHlyaWdodGVkIGNvZGUg
ZnJvbSB0aGUgWFogVXRpbHMgc291cmNlCisjIC0gICAgcGFja2FnZS4KKyMgKyAgICBBIG5vdGUg
YWJvdXQgb2xkIFhaIFV0aWxzIHJlbGVhc2VzOgorIyAgCisjIC0gICAgSWYgeW91IGhhdmUgcXVl
c3Rpb25zLCBkb24ndCBoZXNpdGF0ZSB0byBhc2sgdGhlIGF1dGhvcihzKSBmb3IgbW9yZQorIyAt
ICAgIGluZm9ybWF0aW9uLgorIyArICAgICAgICBYWiBVdGlscyByZWxlYXNlcyA1LjQuNiBhbmQg
b2xkZXIgYW5kIDUuNS4xYWxwaGEgaGF2ZSBhCisjICsgICAgICAgIHNpZ25pZmljYW50IGFtb3Vu
dCBvZiBjb2RlIHB1dCBpbnRvIHRoZSBwdWJsaWMgZG9tYWluIGFuZAorIyArICAgICAgICB0aGF0
IG9idmlvdXNseSByZW1haW5zIHNvLiBUaGUgc3dpdGNoIGZyb20gcHVibGljIGRvbWFpbiB0bwor
IyArICAgICAgICAwQlNEIGZvciBuZXdlciByZWxlYXNlcyB3YXMgbWFkZSBpbiBGZWJyYXJ5IDIw
MjQgYmVjYXVzZQorIyArICAgICAgICBwdWJsaWMgZG9tYWluIGhhcyAocmVhbCBvciBwZXJjZWl2
ZWQpIGxlZ2FsIGFtYmlndWl0aWVzIGluCisjICsgICAgICAgIHNvbWUganVyaXNkaWN0aW9ucy4K
KyMgIAorIyArICAgICAgICBUaGVyZSBpcyB2ZXJ5IGxpdHRsZSAqcHJhY3RpY2FsKiBkaWZmZXJl
bmNlIGJldHdlZW4gcHVibGljCisjICsgICAgICAgIGRvbWFpbiBhbmQgMEJTRC4gVGhlIG1haW4g
ZGlmZmVyZW5jZSBsaWtlbHkgaXMgdGhhdCBvbmUKKyMgKyAgICAgICAgc2hvdWxkbid0IGNsYWlt
IHRoYXQgMEJTRC1saWNlbnNlZCBjb2RlIGlzIGluIHRoZSBwdWJsaWMKKyMgKyAgICAgICAgZG9t
YWluOyAwQlNELWxpY2Vuc2VkIGNvZGUgaXMgY29weXJpZ2h0ZWQgYnV0IGF2YWlsYWJsZSB1bmRl
cgorIyArICAgICAgICBhbiBleHRyZW1lbHkgcGVybWlzc2l2ZSBsaWNlbnNlLiBOZWl0aGVyIDBC
U0Qgbm9yIHB1YmxpYyBkb21haW4KKyMgKyAgICAgICAgcmVxdWlyZSByZXRhaW5pbmcgb3IgcmVw
cm9kdWNpbmcgYXV0aG9yLCBjb3B5cmlnaHQgaG9sZGVyLCBvcgorIyArICAgICAgICBsaWNlbnNl
IG5vdGljZXMgd2hlbiBkaXN0cmlidXRpbmcgdGhlIHNvZnR3YXJlLiAoQ29tcGFyZSB0bywKKyMg
KyAgICAgICAgZm9yIGV4YW1wbGUsIEJTRCAyLUNsYXVzZSAiU2ltcGxpZmllZCIgTGljZW5zZSB3
aGljaCBkb2VzIGhhdmUKKyMgKyAgICAgICAgc3VjaCByZXF1aXJlbWVudHMuKQorIyArCisjICsg
ICAgSWYgeW91IGhhdmUgcXVlc3Rpb25zLCBkb24ndCBoZXNpdGF0ZSB0byBhc2sgZm9yIG1vcmUg
aW5mb3JtYXRpb24uCisjICsgICAgVGhlIGNvbnRhY3QgaW5mb3JtYXRpb24gaXMgaW4gdGhlIFJF
QURNRSBmaWxlLgorIyArCisjIC0tLSBsaWIvZ2V0b3B0LmMKKyMgKysrIGxpYi9nZXRvcHQuYwor
IyBAQCAtMSwyMyArMSwyMyBAQAorIyArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExHUEwt
Mi4xLW9yLWxhdGVyICovCisjICsKKyMgIC8qIEdldG9wdCBmb3IgR05VLgorIyAtICAgTk9URTog
Z2V0b3B0IGlzIG5vdyBwYXJ0IG9mIHRoZSBDIGxpYnJhcnksIHNvIGlmIHlvdSBkb24ndCBrbm93
IHdoYXQKKyMgLSAgICJLZWVwIHRoaXMgZmlsZSBuYW1lLXNwYWNlIGNsZWFuIiBtZWFucywgdGFs
ayB0byBkcmVwcGVyQGdudS5vcmcKKyMgLSAgIGJlZm9yZSBjaGFuZ2luZyBpdCEKKyMgLSAgIENv
cHlyaWdodCAoQykgMTk4Nyw4OCw4OSw5MCw5MSw5Miw5Myw5NCw5NSw5Niw5OCw5OSwyMDAwLDIw
MDEsMjAwMiwyMDAzLDIwMDQsMjAwNgorIyAtCUZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5j
LgorIyAtICAgVGhpcyBmaWxlIGlzIHBhcnQgb2YgdGhlIEdOVSBDIExpYnJhcnkuCisjICsgICBD
b3B5cmlnaHQgKEMpIDE5ODctMjAyMyBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMg
KyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5IGFuZCBpcyBhbHNvIHBh
cnQgb2YgZ251bGliLgorIyArICAgUGF0Y2hlcyB0byB0aGlzIGZpbGUgc2hvdWxkIGJlIHN1Ym1p
dHRlZCB0byBib3RoIHByb2plY3RzLgorIyAgCisjIC0gICBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyAtICAgaXQg
dW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5CisjIC0gICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRo
ZXIgdmVyc2lvbiAyLjEsIG9yIChhdCB5b3VyIG9wdGlvbikKKyMgLSAgIGFueSBsYXRlciB2ZXJz
aW9uLgorIyArICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisjICsgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisjICsgICBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIKKyMgKyAgIHZlcnNpb24g
Mi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9u
LgorIyAgCisjIC0gICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhh
dCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyMgKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjICAgICBidXQgV0lUSE9V
VCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorIyAt
ICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAg
U2VlIHRoZQorIyAtICAgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3Jl
IGRldGFpbHMuCisjICsgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorIyArICAgTGVzc2VyIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAtICAgWW91IHNob3VsZCBoYXZlIHJlY2Vp
dmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25n
CisjIC0gICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLAorIyAtICAgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBG
bG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxLCBVU0EuICAqLworIyArICAgWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworIyAr
ICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBHTlUgQyBMaWJyYXJ5OyBpZiBub3QsIHNlZQorIyAr
ICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4gICovCisjICAMCisjICAjaWZuZGVm
IF9MSUJDCisjICsjIGlmZGVmIEhBVkVfQ09ORklHX0gKKyMgCisjCisKIFNVTU1BUlkgPSAiVXRp
bGl0aWVzIGZvciBtYW5hZ2luZyBMWk1BIGNvbXByZXNzZWQgZmlsZXMiCiBIT01FUEFHRSA9ICJo
dHRwczovL3R1a2Fhbmkub3JnL3h6LyIKIERFU0NSSVBUSU9OID0gIlhaIFV0aWxzIGlzIGZyZWUg
Z2VuZXJhbC1wdXJwb3NlIGRhdGEgY29tcHJlc3Npb24gc29mdHdhcmUgd2l0aCBhIGhpZ2ggY29t
cHJlc3Npb24gcmF0aW8uIFhaIFV0aWxzIHdlcmUgd3JpdHRlbiBmb3IgUE9TSVgtbGlrZSBzeXN0
ZW1zLCBidXQgYWxzbyB3b3JrIG9uIHNvbWUgbm90LXNvLVBPU0lYIHN5c3RlbXMuIFhaIFV0aWxz
IGFyZSB0aGUgc3VjY2Vzc29yIHRvIExaTUEgVXRpbHMuIgpAQCAtMTcsMTcgKzIwMywxNyBAQCBM
SUNFTlNFOiR7UE59LWRiZyA9ICJHUEwtMi4wLW9yLWxhdGVyIgogTElDRU5TRToke1BOfS1sb2Nh
bGUgPSAiR1BMLTIuMC1vci1sYXRlciIKIExJQ0VOU0U6bGlibHptYSA9ICJQRCIKIAotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDQzNzhlYTlkNWQxZmM5YWIwYWUxMGQ3
OTQ4ODI3ZDkgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YzAyZGU3
MTJiMDI4YTVjYzdlMjI0NzJlOGYyYjNkYjEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
Q09QWUlORy5HUEx2MjttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5HUEx2MzttZDU9MWViYmQzZTM0MjM3YWYy
NmRhNWRjMDhhNGU0NDA0NjQgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5M
R1BMdjIuMTttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAotICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vbGliL2dldG9wdC5jO2VuZGxpbmU9MjM7bWQ1PTIwNjliMGVlNzEw
NTcyYzAzYmIzMTE0ZTQ1MzJjZDg0IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL2xpYi9n
ZXRvcHQuYztlbmRsaW5lPTIzO21kNT0zZjMzZTIwNzI4N2JmNzI4MzRmM2FlOGMyNDdkZmI2YSBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20v
dHVrYWFuaS1wcm9qZWN0L3h6L3JlbGVhc2VzL2Rvd25sb2FkL3Yke1BWfS94ei0ke1BWfS50YXIu
Z3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYWViYTNlMDNiZjgxNDBkZGVkZjYyYTBhMzY3MTU4MzQwNTIwZjZiMzg0
Zjc1Y2E2MDQ1Y2NjNmMwZDQzZmQ1YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4YmZkMjBjMGUx
ZDg2ZjA0MDJmMjQ5N2NmYTcxYzZhYjYyZDRjZDM1ZmQ3MDQyNzZlMzE0MGJmYjcxNDE0NTE5Igog
VVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3YoP1A8cHZlcj5cZCsoXC5cZCsp
KykiCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3R1a2FhbmktcHJv
amVjdC94ei9yZWxlYXNlcy8iCiAKLS0gCjIuNDQuMAoK

--===============8938287522386508943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.4.6", added "/usr/lib/liblzma.so.5.6.2"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so.5.4.6 moved to /usr/lib/liblzma.so.5.6.2
packages/core2-64-poky-linux/xz/xz-doc: PKGSIZE changed from 1793515 to 993542 (-45%)
packages/core2-64-poky-linux/xz/xz-doc: FILELIST: removed "/usr/share/doc/xz/api/lzma12_8h.html /usr/share/doc/xz/api/bcj_8h.html /usr/share/doc/xz/api/tab_bd.png /usr/share/man/fr/man1/xzdiff.1 /usr/share/man/fr/man1/lzdiff.1 /usr/share/doc/xz/api/globals_eval.html /usr/share/doc/xz/api/index_8h.html /usr/share/doc/xz/api/version_8h.html /usr/share/doc/xz/api/docd.svg /usr/share/doc/xz/api/nav_fd.png /usr/share/doc/xz/api/base_8h.html /usr/share/doc/xz/api/folderopen.svg /usr/share/doc/xz/api/nav_f.png /usr/share/doc/xz/api/structlzma__block.html /usr/share/doc/xz/api/folderclosed.svg /usr/share/doc/xz/api/vli_8h.html /usr/share/man/pt_BR/man1/lzcmp.1 /usr/share/man/pt_BR/man1/xzcmp.1 /usr/share/doc/xz/api/container_8h.html /usr/share/doc/xz/api/index.html /usr/share/doc/xz/api/globals_type.html /usr/share/doc/xz/api/stream__flags_8h.html /usr/share/doc/xz/api/globals_defs.html /usr/share/doc/xz/api/structlzma__stream__flags.html /usr/share/doc/xz/api/nav_g.png /usr/share/doc/xz/api
 /globals.html /usr/share/doc/xz/api/splitbard.png /usr/share/doc/xz/api/structlzma__filter.html /usr/share/doc/xz/api/structlzma__stream.html /usr/share/doc/xz/api/functions_vars.html /usr/share/doc/xz/api/filter_8h.html /usr/share/doc/xz/api/annotated.html /usr/share/doc/xz/api/functions.html /usr/share/doc/xz/api/structlzma__index__iter.html /usr/share/doc/xz/api/structlzma__mt.html /usr/share/doc/xz/api/structlzma__allocator.html /usr/share/doc/xz/api/block_8h.html /usr/share/doc/xz/api/folderopend.svg /usr/share/doc/xz/api/tabs.css /usr/share/man/fr/man1/lzmore.1 /usr/share/man/fr/man1/xzmore.1 /usr/share/doc/xz/api/tab_hd.png /usr/share/doc/xz/api/tab_a.png /usr/share/doc/xz/api/globals_enum.html /usr/share/doc/xz/api/classes.html /usr/share/doc/xz/api/nav_hd.png /usr/share/doc/xz/api/sync_on.png /usr/share/doc/xz/examples_old/xz_pipe_comp.c /usr/share/doc/xz/api/sync_off.png /usr/share/doc/xz/api/tab_ad.png /usr/share/doc/xz/api/tab_h.png /usr/share/doc/xz/api/structlzma__opti
 ons__bcj.html /usr/share/doc/xz/api/index__hash_8h.html /usr/share/man/fr/man1/lzcmp.1 /usr/share/man/fr/man1/xzcmp.1 /usr/share/doc/xz/api/folderclosedd.svg /usr/share/doc/xz/api/closed.png /usr/share/man/pt_BR/man1/lzegrep.1 /usr/share/man/pt_BR/man1/lzfgrep.1 /usr/share/man/pt_BR/man1/xzegrep.1 /usr/share/man/pt_BR/man1/xzfgrep.1 /usr/share/doc/xz/api/doc.svg /usr/share/doc/xz/api/bc_s.png /usr/share/doc/xz/api/check_8h.html /usr/share/doc/xz/api/tab_b.png /usr/share/doc/xz/api/tab_sd.png /usr/share/doc/xz/api/dir_b17a1d403082bd69a703ed987cf158fb.html /usr/share/doc/xz/api/nav_h.png /usr/share/doc/xz/api/hardware_8h.html /usr/share/man/pt_BR/man1/xzmore.1 /usr/share/man/pt_BR/man1/lzdiff.1 /usr/share/man/pt_BR/man1/lzgrep.1 /usr/share/man/pt_BR/man1/lzmore.1 /usr/share/man/pt_BR/man1/xzdiff.1 /usr/share/man/pt_BR/man1/xzgrep.1 /usr/share/doc/xz/api/lzma_8h.html /usr/share/doc/xz/api/globals_func.html /usr/share/doc/xz/TODO /usr/share/doc/xz/api/structlzma__options__lzma.html /usr
 /share/doc/xz/api/doxygen.svg /usr/share/doc/xz/api/tab_s.png /usr/share/doc/xz/api/doxygen.css /usr/share/doc/xz/api/structlzma__options__delta.html /usr/share/doc/xz/api/delta_8h.html /usr/share/doc/xz/api/files.html /usr/share/doc/xz/examples_old/xz_pipe_decomp.c /usr/share/doc/xz/api/splitbar.png /usr/share/doc/xz/api/open.png /usr/share/doc/xz/api/bc_sd.png", added "/usr/share/doc/xz/COPYING.0BSD /usr/share/man/uk/man1/lzmainfo.1 /usr/share/man/pt_BR/man1/lzmainfo.1 /usr/share/man/de/man1/lzmainfo.1 /usr/share/doc/xz/examples/11_file_info.c /usr/share/man/ko/man1/lzmainfo.1 /usr/share/man/fr/man1/lzmainfo.1 /usr/share/man/ro/man1/lzmainfo.1"
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGSIZE changed from 26876 to 22289 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGSIZE changed from 17576 to 15436 (-12%)
packages/core2-64-poky-linux/xz/xz-locale-de: PKGSIZE changed from 28599 to 32560 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGSIZE changed from 26139 to 29979 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-es: PKGSIZE changed from 27192 to 31175 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGSIZE changed from 25923 to 21441 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGSIZE changed from 22313 to 19342 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGSIZE changed from 26682 to 30343 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGSIZE changed from 27374 to 31658 (+16%)
packages/core2-64-poky-linux/xz/xz-locale-it: PKGSIZE changed from 22043 to 19130 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGSIZE changed from 27394 to 31480 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGSIZE changed from 26643 to 30611 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 26890 to 22302 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGSIZE changed from 21887 to 18992 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGSIZE changed from 28538 to 32640 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGSIZE changed from 27551 to 23849 (-13%)
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGSIZE changed from 26576 to 30379 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGSIZE changed from 26545 to 22029 (-17%)
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGSIZE changed from 35322 to 40332 (+14%)
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGSIZE changed from 28619 to 32859 (+15%)
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGSIZE changed from 25247 to 22476 (-11%)
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGSIZE changed from 24823 to 20613 (-17%)
packages/core2-64-poky-linux/xz/xz-ptest: FILELIST: removed "/usr/lib/xz/ptest/tests/files/good-1-x86-lzma2.xz /usr/lib/xz/ptest/tests/files/good-1-sparc-lzma2.xz", added "/usr/lib/xz/ptest/tests/test_microlzma"
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.6 to liblzma.so.5.6.2
  /usr/lib/liblzma.so.5.4.6 moved to /usr/lib/liblzma.so.5.6.2

--===============8938287522386508943==--

