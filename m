Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DF7C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 10:03:29 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.55960.1717322604813614380
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 03:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RjCt5L/q;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eaa794eb9fso6399211fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717322603; x=1717927403; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KSX7DEegzRK2g6CWjW76v/IRBXpQR5Em6+i+HMz3p+o=;
        b=RjCt5L/qoeZTsnxcTWcndfWETZFBnBxQlg1DjWoPToZn7Tg2Lc/MVa/TtMjMyqHlzo
         0v5MhURzaKi06VWxL+KdNsp3Hqh5eO53Mz3f/1ioHryJGMyCMJqEnYRdz7rqNsUYyyKT
         88ytRrvcU1ynUDyV95dhHTBD/kj0WYnFsCUibth//p5H71R2rLWazvrNi3BlW5xKmrqF
         n1NmqzZzNwEqW8W5FHexJ51FV0x6CyxRjZSHFxSzthcF3PZ1Auij/7IKLka0L3NkKBNa
         gEO11oEVn9sjH8NLOAZtABpZhCYUQxdjmfhS47OhlsRqIlnuMPtsHZojhra9YpT11+D+
         KNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717322603; x=1717927403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSX7DEegzRK2g6CWjW76v/IRBXpQR5Em6+i+HMz3p+o=;
        b=CUdhURITyh5qk4Yy5IH+MsvCHfkadFS1QINGi/36KmTkuHKENIjXo6N6TiSEdEsZLO
         JwP1KbdhXKXydvSycIxuZdXc3mSoUGMKUHCzaLC9DaDFDlS1b7l4J9tvU3zB37yzZZ2N
         shQ+8DS1rV8OzLsBswq+h3SNtE/hsXhdXwQhgHEp2k33rEfUObh55vM1wZLL0JLgnhuJ
         6fgTbacRtV5Np6leXYTAwwF7oFLhgA6yewsofXqEQy2+BLX/+uOWua/tzYeGGmhYBQ21
         u52JwCfL42jAiJiESjHe5dC60YxRaiYd6DwMVI+PYUXAj+x8nthwKq3fuDDzx8AEdH5a
         VfKw==
X-Gm-Message-State: AOJu0Yx0l50X0M77Hdk6oktAzSZJJ1nJVK/Lb9a4TFPy9upt9qwv2Akd
	6WP4+eHONXcin8Qk3tb80X5IDbWerSgFq1xb7PVq0bof/zbgi1Pvr/cQjjdwP952jHEpIDJZgnN
	npj7xLJ3dT+5mszp+En+agvzntZRmkqG1
X-Google-Smtp-Source: AGHT+IH2yFRdzPy8TBF9UqkSGI7/eC2cm7vgraT6Y/bFqUl7NjuzFAQ09zOMIHVpqK3Nt7j4lcmWuF1sKf77xDPQHMU=
X-Received: by 2002:a2e:7c12:0:b0:2ea:804a:18b2 with SMTP id
 38308e7fff4ca-2ea951ac739mr40930831fa.35.1717322602441; Sun, 02 Jun 2024
 03:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <0101018fd4dd36e0-4cc98103-5aa2-4d61-851e-4e88d031335d-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018fd4dd36e0-4cc98103-5aa2-4d61-851e-4e88d031335d-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 2 Jun 2024 12:03:14 +0200
Message-ID: <CANNYZj9_sJoodqWCHFhS62L1wDWMs4=+WwD1X5Mak8t3iR8g6A@mail.gmail.com>
Subject: Re: [OE-core] [AUH] xz: upgrading to 5.6.2 SUCCEEDED
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 10:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200203

These are the release notes:
https://github.com/tukaani-project/xz/releases/

There are also backdoor notes:
https://tukaani.org/xz-backdoor/
"I plan to write an article how the backdoor got into the releases and
what can be learned from this." - that'd be most welcome, as it would
be first hand information that sets the record straight.

And there's a commit by commit review of Jia Tan's contributions:
https://tukaani.org/xz-backdoor/review.html

The scary part of the last one is that almost all of their commits
over the past two years were totally fine and legit. Inserting the
backdoor was spread over several well-disguised changes and happened
only in 2024, although there are indications the code was written long
before that. I don't know how one can defend against competent
professionals playing long games, but perhaps checking one's identity
before granting them maintainer rights might help a little. Passport
scans aren't needed (and can be forged), having someone *else* confirm
the person is legit is better.

Alex

On Sat, 1 Jun 2024 at 19:35, Auto Upgrade Helper via
lists.openembedded.org <auh=yoctoproject.org@lists.openembedded.org>
wrote:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *xz* to *5.6.2* has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-xz-upgrade-5.4.6-5.6.2.patch
>     - check the changes to upstream patches and summarize them in the commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From f03d1b09c5859f51f356268522dc0c630349ae47 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Sat, 1 Jun 2024 12:05:00 +0000
> Subject: [PATCH] xz: upgrade 5.4.6 -> 5.6.2
>
> ---
>  .../xz/{xz_5.4.6.bb => xz_5.6.2.bb}           | 192 +++++++++++++++++-
>  1 file changed, 189 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.6.2.bb} (21%)
>
> diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.6.2.bb
> similarity index 21%
> rename from meta/recipes-extended/xz/xz_5.4.6.bb
> rename to meta/recipes-extended/xz/xz_5.6.2.bb
> index da3b75a10b..4c11eb2bbe 100644
> --- a/meta/recipes-extended/xz/xz_5.4.6.bb
> +++ b/meta/recipes-extended/xz/xz_5.6.2.bb
> @@ -1,3 +1,189 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> +# The following is the difference between the old and the new license text.
> +# Please update the LICENSE value if needed, and summarize the changes in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- COPYING
> +# +++ COPYING
> +# @@ -3,75 +3,81 @@
> +#  ==================
> +#
> +#      Different licenses apply to different files in this package. Here
> +# -    is a rough summary of which licenses apply to which parts of this
> +# -    package (but check the individual files to be sure!):
> +# +    is a summary of which licenses apply to which parts of this package:
> +#
> +# -      - liblzma is in the public domain.
> +# +      - liblzma is under the BSD Zero Clause License (0BSD).
> +#
> +# -      - xz, xzdec, and lzmadec command line tools are in the public
> +# -        domain unless GNU getopt_long had to be compiled and linked
> +# -        in from the lib directory. The getopt_long code is under
> +# -        GNU LGPLv2.1+.
> +# +      - The command line tools xz, xzdec, lzmadec, and lzmainfo are
> +# +        under 0BSD except that, on systems that don't have a usable
> +# +        getopt_long, GNU getopt_long is compiled and linked in from the
> +# +        'lib' directory. The getopt_long code is under GNU LGPLv2.1+.
> +#
> +#        - The scripts to grep, diff, and view compressed files have been
> +# -        adapted from gzip. These scripts and their documentation are
> +# -        under GNU GPLv2+.
> +# +        adapted from GNU gzip. These scripts (xzgrep, xzdiff, xzless,
> +# +        and xzmore) are under GNU GPLv2+. The man pages of the scripts
> +# +        are under 0BSD; they aren't based on the man pages of GNU gzip.
> +#
> +# -      - All the documentation in the doc directory and most of the
> +# -        XZ Utils specific documentation files in other directories
> +# -        are in the public domain.
> +# +      - Most of the XZ Utils specific documentation that is in
> +# +        plain text files (like README, INSTALL, PACKAGERS, NEWS,
> +# +        and ChangeLog) are under 0BSD unless stated otherwise in
> +# +        the file itself. The files xz-file-format.txt and
> +# +        lzma-file-format.xt are in the public domain but may
> +# +        be distributed under the terms of 0BSD too.
> +#
> +# -        Note: The JavaScript files (under the MIT license) have
> +# -        been removed from the Doxygen-generated HTML version of the
> +# -        liblzma API documentation. Doxygen itself is under the GNU GPL
> +# -        but the remaining files generated by Doxygen are not affected
> +# -        by the licenses used in Doxygen because Doxygen licensing has
> +# -        the following exception:
> +# +      - Translated messages and man pages are under 0BSD except that
> +# +        some old translations are in the public domain.
> +#
> +# -            "Documents produced by doxygen are derivative works
> +# -            derived from the input used in their production;
> +# -            they are not affected by this license."
> +# +      - Test files and test code in the 'tests' directory, and
> +# +        debugging utilities in the 'debug' directory are under
> +# +        the BSD Zero Clause License (0BSD).
> +#
> +# -      - Translated messages are in the public domain.
> +# +      - The GNU Autotools based build system contains files that are
> +# +        under GNU GPLv2+, GNU GPLv3+, and a few permissive licenses.
> +# +        These files don't affect the licensing of the binaries being
> +# +        built.
> +#
> +# -      - The build system contains public domain files, and files that
> +# -        are under GNU GPLv2+ or GNU GPLv3+. None of these files end up
> +# -        in the binaries being built.
> +# +      - The 'extra' directory contains files that are under various
> +# +        free software licenses. These aren't built or installed as
> +# +        part of XZ Utils.
> +#
> +# -      - Test files and test code in the tests directory, and debugging
> +# -        utilities in the debug directory are in the public domain.
> +# +    For the files under the BSD Zero Clause License (0BSD), if
> +# +    a copyright notice is needed, the following is sufficient:
> +#
> +# -      - The extra directory may contain public domain files, and files
> +# -        that are under various free software licenses.
> +# +        Copyright (C) The XZ Utils authors and contributors
> +#
> +# -    You can do whatever you want with the files that have been put into
> +# -    the public domain. If you find public domain legally problematic,
> +# -    take the previous sentence as a license grant. If you still find
> +# -    the lack of copyright legally problematic, you have too many
> +# -    lawyers.
> +# -
> +# -    As usual, this software is provided "as is", without any warranty.
> +# -
> +# -    If you copy significant amounts of public domain code from XZ Utils
> +# +    If you copy significant amounts of 0BSD-licensed code from XZ Utils
> +#      into your project, acknowledging this somewhere in your software is
> +#      polite (especially if it is proprietary, non-free software), but
> +# -    naturally it is not legally required. Here is an example of a good
> +# -    notice to put into "about box" or into documentation:
> +# +    it is not legally required by the license terms. Here is an example
> +# +    of a good notice to put into "about box" or into documentation:
> +#
> +# -        This software includes code from XZ Utils
> +# -        <https://xz.tukaani.org/xz-utils/>.
> +# +        This software includes code from XZ Utils <https://tukaani.org/xz/>.
> +#
> +#      The following license texts are included in the following files:
> +# +      - COPYING.0BSD: BSD Zero Clause License
> +#        - COPYING.LGPLv2.1: GNU Lesser General Public License version 2.1
> +#        - COPYING.GPLv2: GNU General Public License version 2
> +#        - COPYING.GPLv3: GNU General Public License version 3
> +#
> +# -    Note that the toolchain (compiler, linker etc.) may add some code
> +# -    pieces that are copyrighted. Thus, it is possible that e.g. liblzma
> +# -    binary wouldn't actually be in the public domain in its entirety
> +# -    even though it contains no copyrighted code from the XZ Utils source
> +# -    package.
> +# +    A note about old XZ Utils releases:
> +#
> +# -    If you have questions, don't hesitate to ask the author(s) for more
> +# -    information.
> +# +        XZ Utils releases 5.4.6 and older and 5.5.1alpha have a
> +# +        significant amount of code put into the public domain and
> +# +        that obviously remains so. The switch from public domain to
> +# +        0BSD for newer releases was made in Febrary 2024 because
> +# +        public domain has (real or perceived) legal ambiguities in
> +# +        some jurisdictions.
> +#
> +# +        There is very little *practical* difference between public
> +# +        domain and 0BSD. The main difference likely is that one
> +# +        shouldn't claim that 0BSD-licensed code is in the public
> +# +        domain; 0BSD-licensed code is copyrighted but available under
> +# +        an extremely permissive license. Neither 0BSD nor public domain
> +# +        require retaining or reproducing author, copyright holder, or
> +# +        license notices when distributing the software. (Compare to,
> +# +        for example, BSD 2-Clause "Simplified" License which does have
> +# +        such requirements.)
> +# +
> +# +    If you have questions, don't hesitate to ask for more information.
> +# +    The contact information is in the README file.
> +# +
> +# --- lib/getopt.c
> +# +++ lib/getopt.c
> +# @@ -1,23 +1,23 @@
> +# +/* SPDX-License-Identifier: LGPL-2.1-or-later */
> +# +
> +#  /* Getopt for GNU.
> +# -   NOTE: getopt is now part of the C library, so if you don't know what
> +# -   "Keep this file name-space clean" means, talk to drepper@gnu.org
> +# -   before changing it!
> +# -   Copyright (C) 1987,88,89,90,91,92,93,94,95,96,98,99,2000,2001,2002,2003,2004,2006
> +# -    Free Software Foundation, Inc.
> +# -   This file is part of the GNU C Library.
> +# +   Copyright (C) 1987-2023 Free Software Foundation, Inc.
> +# +   This file is part of the GNU C Library and is also part of gnulib.
> +# +   Patches to this file should be submitted to both projects.
> +#
> +# -   This program is free software; you can redistribute it and/or modify
> +# -   it under the terms of the GNU Lesser General Public License as published by
> +# -   the Free Software Foundation; either version 2.1, or (at your option)
> +# -   any later version.
> +# +   The GNU C Library is free software; you can redistribute it and/or
> +# +   modify it under the terms of the GNU Lesser General Public
> +# +   License as published by the Free Software Foundation; either
> +# +   version 2.1 of the License, or (at your option) any later version.
> +#
> +# -   This program is distributed in the hope that it will be useful,
> +# +   The GNU C Library is distributed in the hope that it will be useful,
> +#     but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# -   GNU Lesser General Public License for more details.
> +# +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# +   Lesser General Public License for more details.
> +#
> +# -   You should have received a copy of the GNU Lesser General Public License along
> +# -   with this program; if not, write to the Free Software Foundation,
> +# -   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
> +# +   You should have received a copy of the GNU Lesser General Public
> +# +   License along with the GNU C Library; if not, see
> +# +   <https://www.gnu.org/licenses/>.  */
> +#
> +#  #ifndef _LIBC
> +# +# ifdef HAVE_CONFIG_H
> +#
> +#
> +
>  SUMMARY = "Utilities for managing LZMA compressed files"
>  HOMEPAGE = "https://tukaani.org/xz/"
>  DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
> @@ -17,17 +203,17 @@ LICENSE:${PN}-dbg = "GPL-2.0-or-later"
>  LICENSE:${PN}-locale = "GPL-2.0-or-later"
>  LICENSE:liblzma = "PD"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
>                      file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
>                      file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
> -                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
> +                    file://lib/getopt.c;endline=23;md5=3f33e207287bf72834f3ae8c247dfb6a \
>                      "
>
>  SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
>             file://run-ptest \
>            "
> -SRC_URI[sha256sum] = "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c"
> +SRC_URI[sha256sum] = "8bfd20c0e1d86f0402f2497cfa71c6ab62d4cd35fd704276e3140bfb71414519"
>  UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
>  UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
>
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200180): https://lists.openembedded.org/g/openembedded-core/message/200180
> Mute This Topic: https://lists.openembedded.org/mt/106431303/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

