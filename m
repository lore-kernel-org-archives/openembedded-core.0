Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E0AC64EC6
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.38363.1650284380282878144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fDyL+U7r;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284381; i=@fujitsu.com;
	bh=5TnnZNnUAxULHmwbVnDZ/aHYVysA217+3R6S+0l3LOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fDyL+U7retGd4gJPxrNiLiNT2eOq0RoNiBYnswcPY60g9qWzbgx9sqsyc5J3kCHIL
	 K01BZ+kwRkZTET8QTvUye80a6mIuPwIt8ozwd7us9Nld/HZ4dWmX+W2sLFmbx8/+k+
	 e1kPLayMsTAXqxEd8faGCMONjl1WizjYf6ho9d/2kTIyKiEr8n88j8oT70ShdTSsOQ
	 /XqKUZ2lAw/KvkCF/Shw/cowooxzoNu5h74h/JS1QyZwOkcFtV24RB/g6ZzFETjHAm
	 3U9QgfhDQ84Bsn65Xu+7O0ZCjmNaXfOroVZe4E6QOw5/F+oaQyPe1gR1E+/i+9WdfQ
	 KigTjV4HtwFEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MRohsbHpt
  kcGkZi8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHxz0OWgnPaFVcmNrI3MJ5T6WLk4hASmMUk
  se/mLRYIZw+jxIJbn5i6GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwFpi1
  f9rbCA2i4CqxM1zD1lAbF4BJ4kjDW1gtoSAgsSUh++ZQWxOAWeJiT2djCAjhYBqutt9IMoFJU
  7OfMICMV5C4uCLF8wQrYoSsy83Q42pkJg1q41pAiP/LCQts5C0LGBkWsVonVSUmZ5RkpuYmaN
  raGCga2hoqmtsAWRa6iVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBIZkSrFa
  7g7GKSt/6h1ilORgUhLl/e8bmyTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgndWCFBOsCg1PbUiL
  TMHGB8waQkOHiUR3n6QNG9xQWJucWY6ROoUoy7H2oYDe5mFWPLy81KlxHmrw4CKBECKMkrz4E
  bAYvUSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHen6FAU3gy80rgNr0COoIJ6Ijt8yNBjih
  JREhJNTDxPq7tv6xf+1+1x/4R7xzdDb07I5aINdz/7b2biVmx3T1Y+PPpt6xswcWnHswNfXr8
  6+7J02dGqL06xHe3IXhXmewau5gwtSL7bVouRy5OEc1rt9neHXhrxd8HUnvXal4F2uh37l1vz
  rSnZYmJ4Wt/bV21+lqHP/9/j/WSCt8lIrSLD90MaPhyZs2zfJ9/vQeLIm5quuV3LmjwkzdS+b
  guaLrxpbtTNvh57/G5tjs9YG3FxsRHLTIlb179P+I+Na7RNUszrSZGde7nRzsexlwPzE43E9z
  zq+ys1aZnJVNP77dqXxab1fqS6drW1aseXHrWkjSv7NOlxWXKVxk1f+5TiZ1hfkP3+elLvDPv
  sL1QYinOSDTUYi4qTgQAWEUhT1ADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1650284380!199348!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3413 invoked from network); 18 Apr 2022 12:19:41 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:19:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23ICJebk029022
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:19:40 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:19:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpcre2: upgrade 10.39 -> 10.40
Date: Mon, 18 Apr 2022 20:19:21 +0800
Message-ID: <1650284363-16570-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650284363-16570-1-git-send-email-wangmy@fujitsu.com>
References: <1650284363-16570-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164595

License-Update: year updated to 2022

Changelog:
==========
1. Merged patch from @carenas (GitHub #35, 7db87842) to fix pcre2grep incorrect
handling of multiple passes.

2. Merged patch from @carenas (GitHub #36, dae47509) to fix portability issue
in pcre2grep with buffered fseek(stdin).

3. Merged patch from @carenas (GitHub #37, acc520924) to fix tests when -S is
not supported.

4. Revert an unintended change in JIT repeat detection.

5. Merged patch from @carenas (GitHub #52, b037bfa1) to fix build on GNU Hurd.

6. Merged documentation and comments patches from @carenas (GitHub #47).

7. Merged patch from @carenas (GitHub #49) to remove obsolete JFriedl test code
from pcre2grep.

8. Merged patch from @carenas (GitHub #48) to fix CMake install issue #46.

9. Merged patch from @carenas (GitHub #53) fixing NULL checks in matching and
substituting.

10. Add null_subject and null_replacement modifiers to pcre2test.

11. Add check for NULL subject to POSIX regexec() function.

12. Add check for NULL replacement to pcre2_substitute().

13. For the subject arguments of pcre2_match(), pcre2_dfa_match(), and
pcre2_substitute(), and the replacement argument of the latter, if the pointer
is NULL and the length is zero, treat as an empty string. Apparently a number
of applications treat NULL/0 in this way.

14. Added support for Bidi_Class and a number of binary Unicode properties,
including Bidi_Control.

15. Fix some minor issues raised by clang sanitize.

16. Very minor code speed up for maximizing character property matches.

17. A number of changes to script matching for \p and \P:

    (a) Script extensions for a character are now coded as a bitmap instead of
        a list of script numbers, which should be faster and does not need a
        loop.

    (b) Added the syntax \p{script:xxx} and \p{script_extensions:xxx} (synonyms
        sc and scx).

    (c) Changed \p{scriptname} from being the same as \p{sc:scriptname} to being
        the same as \p{scx:scriptname} because this change happened in Perl at
        release 5.26.

    (d) The standard Unicode 4-letter abbreviations for script names are now
        recognized.

    (e) In accordance with Unicode and Perl's "loose matching" rules, spaces,
        hyphens, and underscores are ignored in property names, which are then
        matched independent of case.

18. The Python scripts in the maint directory have been refactored. There are
now three scripts that generate pcre2_ucd.c, pcre2_ucp.h, and pcre2_ucptables.c
(which is #included by pcre2_tables.c). The data lists that used to be
duplicated are now held in a single common Python module.

19. On CHERI, and thus Arm's Morello prototype, pointers are represented as
hardware capabilities, which consist of both an integer address and additional
metadata, meaning they are twice the size of the platform's size_t type, i.e.
16 bytes on a 64-bit system. The ovector member of heapframe happens to only be
8 byte aligned, and so computing frame_size ended up with a multiple of 8 but
not 16. Whilst the first frame was always suitably aligned, this then
misaligned the frame that follows, resulting in an alignment fault when storing
a pointer to Fecode at the start of match. Patch to fix this issue by Jessica
Clarke PR#72.

20. Added -LP and -LS listing options to pcre2test.

21. A user discovered that the library names in CMakeLists.txt for MSVC
debugger (PDB) files were incorrect - perhaps never tried for PCRE2?

22. An item such as [Aa] is optimized into a caseless single character match.
When this was quantified (e.g. [Aa]{2}) and was also the last literal item in a
pattern, the optimizing "must be present for a match" character check was not
being flagged as caseless, causing some matches that should have succeeded to
fail.

23. Fixed a unicode properrty matching issue in JIT. The character was not
fully read in caseless matching.

24. Fixed an issue affecting recursions in JIT caused by duplicated data
transfers.

25. Merged patch from @carenas (GitHub #96) which fixes some problems with
pcre2test and readline/readedit:

  * Use the right header for libedit in FreeBSD with autoconf
  * Really allow libedit with cmake
  * Avoid using readline headers with libedit

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcre/{libpcre2_10.39.bb => libpcre2_10.40.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.39.bb => libpcre2_10.40.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.39.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre2_10.39.bb
rename to meta/recipes-support/libpcre/libpcre2_10.40.bb
index b5ec62fe18..8c2cadfe2b 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.39.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -8,13 +8,13 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=43cfa999260dd853cd6cb174dc396f3d"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
-SRC_URI[sha256sum] = "0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440"
+SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.25.1


