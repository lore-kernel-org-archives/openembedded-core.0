Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27DEC55182
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.919.1785564322473475371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=i7Fyake1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iQFGiekI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019fbbed5752-b34ee003-eb04-4d82-9005-ff2cf954e981-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tV6IL5fXjS3qyNe2AW+7OBJTLLq/HTN9XUUeD9QLS84=;
	b=i7Fyake1aGlBkPgUkOZzOBRxb8AExrpiRRl+mKErE1QxnHta840eI/NalxFTIR2/
	7g2CHf3zUPSy2V6qV7krXTWAAcZTA/qKeA+3MBgWixncKgeb8/tKybVv+ZamD7UF38w
	boAQCZGSpJDEjszRm7PYKIMFqdbrOFZdMiN02+Zc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tV6IL5fXjS3qyNe2AW+7OBJTLLq/HTN9XUUeD9QLS84=;
	b=iQFGiekIl9PB6UQNmG3gZxxnv0iD1yRgtkNugWRLOEHeFG8gZ1JvX2shzQFBwb4s
	xEjo/OJd2G/xnOp0SLWmtcaGq8AEG40oNRP0e8Qg5muFUy6R4AARdSF25G/K9M2gJRT
	Yaxsu7L1ej8d8a7oFRz6w0W0sxfyhFk79/0bzdcs=
Content-Type: multipart/mixed; boundary="===============8911144685465340559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.34 SUCCEEDED
Message-ID: <0101019fbbed5752-b34ee003-eb04-4d82-9005-ff2cf954e981-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242463

--===============8911144685465340559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *msmtp* to *1.8.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.32-1.8.34.patch
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
From db6dc9dd90613c14920b9c000c3456efd18dda90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Aug 2026 05:43:24 +0000
Subject: [PATCH] msmtp: upgrade 1.8.32 -> 1.8.34

Source: ChangeLog

commit 755df9f0d3acae5fbf981642587be3d0fa631eac
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-31 22:41:43 +0200

    Bump version to 1.8.34

 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

commit 691d7814c3e9018437d524a34f4b8c32c9114a42
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-31 22:41:13 +0200

    Update translations

 po/de.po    | 432 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------------------
 po/eo.po    |  76 ++++++++++++++++---------------
 po/fr.po    |  78 +++++++++++++++++---------------
 po/pt_BR.po |  80 +++++++++++++++++----------------
 po/ro.po    |  81 +++++++++++++++++----------------
 po/uk.po    |  78 +++++++++++++++++---------------
 6 files changed, 423 insertions(+), 402 deletions(-)

commit eeb363da4739b84c4b576e2facbcb1e57db8fbf1
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-31 22:40:20 +0200

    Update NEWS

 NEWS | 3 +++
 1 file changed, 3 insertions(+)

commit dd851b4559024a318ee2259181427a3a9dbf09cf
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-25 12:38:16 +0200

    Update gettext.h from current gettext

 src/gettext.h | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------
 1 file changed, 98 insertions(+), 33 deletions(-)

commit 933d35be8ab6e35a7ea3f78df54b64230177590b
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-19 18:41:42 +0200

    msmtpq: fix loop condition in make_id()

    This fixes the second part of Github issue #228.

 scripts/msmtpq/msmtpq | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

commit 116ab6ba707d08d49d286b812daf3d2569b5117a
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-19 18:40:42 +0200

    msmtpq: fix compatibility with older bash

    This fixes the first part of Github issue #228.

 scripts/msmtpq/msmtpq | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

commit 3b21f759a64a25922c9f4488166fe05206752c6e
Author: CrazyMax <notifications@github.com>
Date:   2026-07-14 20:45:20 +0200

    Fix: msmtpd can leak zombie session children and eventually stop accepting connections

    This closes Github issue #227.

 src/msmtpd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

commit ef53d8234de99de4e3fb91c1a8d49b6a2b8f1c43
Merge: 8d04b10 cd297e5
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-13 08:47:03 +0200

    Merge branch 'novel-novel-base64-bool'

commit cd297e5936372adfa27d3cdf0895ebd22e26f75a
Author: Roman Bogorodskiy <bogorodskiy@gmail.com>
Date:   2026-07-12 08:44:17 +0200

    Fix base64 build on FreeBSD

    On FreeBSD with clang 21 build fails with:

    In file included from smtp.c:42:
    ./base64.h:45:8: error: unknown type name 'bool'
       45 | extern bool base64_decode_ctx (struct base64_decode_context *ctx,

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../recipes-extended/msmtp/{msmtp_1.8.32.bb => msmtp_1.8.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.32.bb => msmtp_1.8.34.bb} (88%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb b/meta/recipes-extended/msmtp/msmtp_1.8.34.bb
similarity index 88%
rename from meta/recipes-extended/msmtp/msmtp_1.8.32.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.34.bb
index 7f39f66f65..c6ac7bf585 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.34.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "20cd58b58dd007acf7b937fa1a1e21f3afb3e9ef5bbcfb8b4f5650deadc64db4"
+SRC_URI[sha256sum] = "84e8fe2a5a80a1ee7802013b3fbdb846a3f27a4163cf37a1c6d7c7f888873ead"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.47.1


--===============8911144685465340559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="msmtp-changelog.txt"

Changelog for msmtp: 1.8.32 -> 1.8.34
Source: ChangeLog

commit 755df9f0d3acae5fbf981642587be3d0fa631eac
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-31 22:41:43 +0200

    Bump version to 1.8.34

 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

commit 691d7814c3e9018437d524a34f4b8c32c9114a42
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-31 22:41:13 +0200

    Update translations

 po/de.po    | 432 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------------------
 po/eo.po    |  76 ++++++++++++++++---------------
 po/fr.po    |  78 +++++++++++++++++---------------
 po/pt_BR.po |  80 +++++++++++++++++----------------
 po/ro.po    |  81 +++++++++++++++++----------------
 po/uk.po    |  78 +++++++++++++++++---------------
 6 files changed, 423 insertions(+), 402 deletions(-)

commit eeb363da4739b84c4b576e2facbcb1e57db8fbf1
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-31 22:40:20 +0200

    Update NEWS

 NEWS | 3 +++
 1 file changed, 3 insertions(+)

commit dd851b4559024a318ee2259181427a3a9dbf09cf
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-25 12:38:16 +0200

    Update gettext.h from current gettext

 src/gettext.h | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------
 1 file changed, 98 insertions(+), 33 deletions(-)

commit 933d35be8ab6e35a7ea3f78df54b64230177590b
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-19 18:41:42 +0200

    msmtpq: fix loop condition in make_id()
    
    This fixes the second part of Github issue #228.

 scripts/msmtpq/msmtpq | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

commit 116ab6ba707d08d49d286b812daf3d2569b5117a
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-19 18:40:42 +0200

    msmtpq: fix compatibility with older bash
    
    This fixes the first part of Github issue #228.

 scripts/msmtpq/msmtpq | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

commit 3b21f759a64a25922c9f4488166fe05206752c6e
Author: CrazyMax <notifications@github.com>
Date:   2026-07-14 20:45:20 +0200

    Fix: msmtpd can leak zombie session children and eventually stop accepting connections
    
    This closes Github issue #227.

 src/msmtpd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

commit ef53d8234de99de4e3fb91c1a8d49b6a2b8f1c43
Merge: 8d04b10 cd297e5
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-13 08:47:03 +0200

    Merge branch 'novel-novel-base64-bool'

commit cd297e5936372adfa27d3cdf0895ebd22e26f75a
Author: Roman Bogorodskiy <bogorodskiy@gmail.com>
Date:   2026-07-12 08:44:17 +0200

    Fix base64 build on FreeBSD
    
    On FreeBSD with clang 21 build fails with:
    
    In file included from smtp.c:42:
    ./base64.h:45:8: error: unknown type name 'bool'
       45 | extern bool base64_decode_ctx (struct base64_decode_context *ctx,
          |        ^
    
    This happens because commit 4d710b4f8d09c3879bd0582cb61372168898f413
    removed 'include <stdbool.h>' from base64.h. Add it back to make it compile
    again.

 src/base64.h | 1 +
 1 file changed, 1 insertion(+)

commit 8d04b1082c216471c863eb86592c4321df971470
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 13:15:55 +0200

    Bump version to 1.8.33

 configure.ac | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

commit 47b85b538b695c0b3baa82c85e62fc80006c902f
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 13:15:31 +0200

    Bump year in --version output

 src/msmtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

commit 66a43f2837353f87e9db72f338769170b8dbae8b
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 13:14:23 +0200

    Update NEWS

 NEWS | 3 +++
 1 file changed, 3 insertions(+)

commit bc0c0e2cc703f77b82a13be745752f981d5c2ce6
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 13:12:44 +0200

    Update translations

 po/LINGUAS  |    1 +
 po/de.po    |  629 ++++++++++++++++++++++++++++--------------------------------------
 po/eo.po    |  270 +++++++++--------------------
 po/es.po    |  307 +++++++++++----------------------
 po/fr.po    |  377 +++++++++++++---------------------------
 po/ka.po    | 1650 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 po/pt_BR.po |  411 +++++++++++++++----------------------------
 po/ro.po    |  321 +++++++++++-----------------------
 po/ru.po    |  321 +++++++++++-----------------------
 po/sr.po    |  318 +++++++++++-----------------------
 po/sv.po    |  268 +++++++++-------------------
 po/ta.po    | 1317 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------------------
 po/uk.po    |  339 +++++++++++-------------------------
 po/zh_CN.po |  152 ++++++----------
 14 files changed, 3518 insertions(+), 3163 deletions(-)

commit 4c2fe33f2ad87b5ccd9742bc73f4d3dd570420ca
Merge: 7bc09c5 e865c9d
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 12:49:47 +0200

    Merge branch 'acts-1631-fix-recipient-buffer-realloc'

commit e865c9d5a677b51425c1e77c6c8d030515c023a6
Author: bramadams <yasser.araf@belgacom.net>
Date:   2026-05-12 15:20:55 -0600

    Add curl-based connection test to use when ping-style prohibited
    
    When using a mobile device like an iphone as a personal data hotspot,
    some data plans do not allow ping-style connection checks, leading to
    a "couldn't be sent - host not connected" error message despite having
    connectivity.
    
    This PR adds a curl-based connection test that can be used by setting
    `EMAIL_CONN_TEST=c`, avoiding being blocked if ping-style checks are
    not allowed. Documentation was updated as well.

 scripts/msmtpq/README.msmtpq | 3 +++
 scripts/msmtpq/msmtpq        | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

commit 37613f439cc5a89b71220d5279471a6b663ab8c2
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 12:43:39 +0200

    Update gettext files

 build-aux/config.rpath |  23 ++++---------------
 po/Makefile.in.in      | 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------------------
 po/Makevars.template   |   6 -----
 po/Rules-quot          |   4 ++--
 po/boldquot.sed        |   4 ++--
 po/en@boldquot.header  |   4 ++--
 po/en@quot.header      |   4 ++--
 po/fetch-po            |  30 ++++++++++++++++++++++++
 po/insert-header.sed   |   4 ++--
 po/quot.sed            |   4 ++--
 10 files changed, 142 insertions(+), 144 deletions(-)

commit 7bc09c5a8ea95c871b9a6528fa83a7b6578abaec
Merge: 2ae7de6 af373b6
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 12:46:17 +0200

    Merge branch 'bramadams-master'

commit af373b6c8831ce551697a441ee4c571cc223cee9
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 12:43:39 +0200

    Update gettext files

 build-aux/config.rpath |  23 ++++---------------
 po/Makefile.in.in      | 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------------------
 po/Makevars.template   |   6 -----
 po/Rules-quot          |   4 ++--
 po/boldquot.sed        |   4 ++--
 po/en@boldquot.header  |   4 ++--
 po/en@quot.header      |   4 ++--
 po/fetch-po            |  30 ++++++++++++++++++++++++
 po/insert-header.sed   |   4 ++--
 po/quot.sed            |   4 ++--
 10 files changed, 142 insertions(+), 144 deletions(-)

commit 2ae7de65e5897b55f7331cb201dfa5b6a86826c3
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-07-11 12:43:39 +0200

    Update gettext files

 build-aux/config.rpath |  23 ++++---------------
 po/Makefile.in.in      | 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------------------
 po/Makevars.template   |   6 -----
 po/Rules-quot          |   4 ++--
 po/boldquot.sed        |   4 ++--
 po/en@boldquot.header  |   4 ++--
 po/en@quot.header      |   4 ++--
 po/fetch-po            |  30 ++++++++++++++++++++++++
 po/insert-header.sed   |   4 ++--
 po/quot.sed            |   4 ++--
 10 files changed, 142 insertions(+), 144 deletions(-)

commit 56a5aa37b233ee7a7099297b76f1e84d32cfac6c
Author: Acts1631 <acts1631kjv@proton.me>
Date:   2026-07-10 14:01:55 -0400

    Fix heap buffer overflow in RCPT TO command buffer growth
    
    When msmtpd grows the command buffer to accommodate additional RCPT TO
    addresses, the realloc() call uses CMD_MAX_BLOCKS (16) instead of
    CMD_BLOCK_SIZE (4096) as the multiplier. This causes the allocation to
    shrink from 4096 bytes to 32 bytes while cmd_index remains near 4096,
    resulting in a heap buffer overflow when the next recipient address is
    copied.
    
    Replace CMD_MAX_BLOCKS with CMD_BLOCK_SIZE in the realloc call to
    match the allocation unit used by the capacity check and initial
    malloc.

 src/msmtpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

commit 7686253fcca12f50925dc4b6ff677607d263fe32
Author: bramadams <yasser.araf@belgacom.net>
Date:   2026-05-12 15:20:55 -0600

    Add curl-based connection test to use when ping-style prohibited
    
    When using a mobile device like an iphone as a personal data hotspot,
    some data plans do not allow ping-style connection checks, leading to
    a "couldn't be sent - host not connected" error message despite having
    connectivity.
    
    This PR adds a curl-based connection test that can be used by setting
    `EMAIL_CONN_TEST=c`, avoiding being blocked if ping-style checks are
    not allowed. Documentation was updated as well.

 scripts/msmtpq/README.msmtpq | 3 +++
 scripts/msmtpq/msmtpq        | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

commit fc89cffa1b179011a26d583734e8772f77998776
Author: Acts1631 <acts1631kjv@proton.me>
Date:   2026-07-02 20:06:19 +0200

    msmtpd: fix infinite loop in smtp_pipe on premature client disconnect
    
    When a client disconnects during the DATA phase (without sending the
    end-of-mail marker .\r\n), stream_gets returns len=0. The loop has no
    guard for this case and enters an infinite loop writing newlines to
    the pipe. Add a len==0 break to terminate cleanly on EOF.

 src/msmtpd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

commit 836240a3bf38a0bf6677baa2980ff131f5e7268b
Author: Acts1631 <acts1631kjv@proton.me>
Date:   2026-07-02 20:06:15 +0200

    msmtpd: fix read_smtp_cmd out-of-bounds access when len=0
    
    When stream_gets returns len=0 (EOF before any data), accessing
    buf[len-1] is an out-of-bounds read (size_t wraparound to SIZE_MAX).
    Add a len==0 guard before the character access.

 src/msmtpd.c | 2 ++
 1 file changed, 2 insertions(+)

commit b42d2293d6be89c4138481c8acdab19bbd4781ae
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-06-05 22:03:51 +0200

    Protect against overflow in string_replace()

 src/tools.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

commit 9d8c5689051b9bede043b9f16b3045794176ae71
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-06-05 17:20:24 +0200

    Fix a potential overflow or NULL pointer dereference on systems lacking strndup()

 src/xalloc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

commit 4d710b4f8d09c3879bd0582cb61372168898f413
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-06-05 17:14:30 +0200

    Update base64 from current gnulib

 src/base64.c | 188 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------------------------------
 src/base64.h |  57 ++++++++++++++++++++++++-----------------------------
 2 files changed, 122 insertions(+), 123 deletions(-)

commit 181091e5f625aeb37aebf6a9cc852e6d209f493a
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-06-05 17:13:54 +0200

    Protect against buffer overflow with very large input strings

 src/tools.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

commit 4c25dac128c8580cf2144ae94b3ec8217cda1b96
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-06-05 15:53:02 +0200

    Fix a potential error-mishandling on systems lacking vasprintf()

 src/xalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

commit 5bb5ba6fc3d224bbd6324495c70290275f2bfc0d
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-03-12 22:24:50 +0100

    Fix typo in man page

 doc/msmtp.1 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

commit fc3262c785749abf1877bde49455d8a4f6e309ee
Merge: 2e747e7 6e33d7f
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-03-12 22:13:34 +0100

    Merge branch 'i-v5-master'

commit 6e33d7fe65e467c1bd54d862f574a3b3401885fa
Author: i-v5 <112407311+i-v5@users.noreply.github.com>
Date:   2026-02-27 11:36:19 +0100

    Fix typo in msmtp.texi

 doc/msmtp.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

commit 2e747e7833f2e7050d9e0bb628d864a897ebc7a5
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-02-03 21:08:41 +0100

    msmtpd: allow NOOP and RSET commands at certain points in the session
    
    Note that msmtpd still uses an extremely simple and limited session model, and
    therefore only supports NOOP or RSET in places where it is trivial.
    
    This can be extended if and when the need arises.
    
    Fiex github issue #216

 src/msmtpd.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

commit 83412ecbc111254649bfadaa2e599bd067fbf331
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-01-17 17:51:48 +0100

    Fix minor type

 scripts/msmtpq/msmtpq | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

commit 9344d79648ad40cb5242fae62ecde365afbaedaa
Merge: 22a006a cde746b
Author: Martin Lambers <marlam@marlam.de>
Date:   2026-01-17 17:51:06 +0100

    Merge branch 'Konfekt-patch-5'

commit cde746b725d2ea2429aea9d90ce9287927b0df29
Author: Enno <Konfekt@users.noreply.github.com>
Date:   2025-12-27 08:46:54 +0100

    Update notification checks for DBUS session address
    
    checking for DBUS is more reliable as there's no hard dependency on (WAYLAND_)DISPLAY

 scripts/msmtpq/msmtpq | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

commit 22a006a413ca9671a1574f6f9e811c6d09c93c58
Merge: 725eabe a5b91df
Author: Martin Lambers <marlam@marlam.de>
Date:   2025-11-29 12:58:21 +0100

    Merge branch 'dpshelio-force-queue'

commit a5b91df78342efcfaa766edbe5f1171a9b48242d
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-17 12:14:32 +0200

    msmtpq: Add uuid, simplify anti-collision logic
    
    The uuid should be enough to ensure uniqueness, keeping the loop in case
    the system has poor randomness/uuid generation.
    Add touch to the selected paths to shrink possible TOCTOU window.
    This approach is chosen over using mktemp because:
    - mktemp has conflicting implementations on various systems
    - mktemp can only guarantee prior nonexistence of a single inode, which
      forces us into using sudirectories for mail items instead of our
      current standard of a flat directory
      (this would be needless backwards-incompatible churn)
    - The gains to be gotten are minimal -- especially with the TOCTOU
      mitigation in this patch

 scripts/msmtpq/msmtpq | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

commit 0426fcc362485cb7f26a38008c8206a381263f18
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-17 11:55:21 +0200

    msmtpq: explicitly enumerate globs
    
    More explicit, more safe

 scripts/msmtpq/msmtpq | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

commit d89f6578c2cc5a0320301f65e5a4ffae99c8caf8
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-11 02:06:56 +0200

    msmtpq: Add config knobs (esp rc location)
    
    This latter option enables XDG Base Directory-compliant setups without
    too much pain.
    
    Variables added:
    -  MSMTPQ_RC -- config file location
    -  MSMTPQ_LOG_DATEFMT -- log timestamp format string

 scripts/msmtpq/README.msmtpq | 24 +++++++++++++++++++++---
 scripts/msmtpq/msmtpq        |  8 ++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

commit 2b75ead540019e645b9bf6e8bf883a5e24697d38
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-11 03:48:04 +0200

    msmtpq: move up err() defn (SC complained)

 scripts/msmtpq/msmtpq | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

commit 725eabeda2932e4e7e34a332eaa6cc9f7a0b9a82
Merge: adb72eb 96089dc
Author: Martin Lambers <marlam@marlam.de>
Date:   2025-11-29 12:57:07 +0100

    Merge branch 'hseg-use-uuid'

commit 96089dc758477e4bb1a16fcb39dae3dac7a365b5
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-11 02:06:56 +0200

    msmtpq: Add config knobs (esp rc location)
    
    This latter option enables XDG Base Directory-compliant setups without
    too much pain.
    
    Variables added:
    -  MSMTPQ_RC -- config file location
    -  MSMTPQ_LOG_DATEFMT -- log timestamp format string

 scripts/msmtpq/README.msmtpq | 24 +++++++++++++++++++++---
 scripts/msmtpq/msmtpq        |  8 ++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

commit e52d42e6ac6e1ee68860c3f7788c269896d18820
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-11 03:48:04 +0200

    msmtpq: move up err() defn (SC complained)

 scripts/msmtpq/msmtpq | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

commit adb72eb66441b2717faf7378dc75da5d8cc610ef
Merge: b79e7a4 ecc25b9
Author: Martin Lambers <marlam@marlam.de>
Date:   2025-11-29 12:54:54 +0100

    Merge branch 'hseg-make-configable'

commit ecc25b9c09735db743c322a9d176bc107622f23b
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-11 03:48:04 +0200

    msmtpq: move up err() defn (SC complained)

 scripts/msmtpq/msmtpq | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

commit b79e7a4271338e153776c9f954666eb676182de6
Merge: de8d74d a1a840a
Author: Martin Lambers <marlam@marlam.de>
Date:   2025-11-29 12:52:59 +0100

    Merge branch 'hseg-fix-shellcheck'

commit f585da2621e70416f53e4633c4513fe3b9c22946
Author: David Perez-Suarez <d.perez-suarez@ucl.ac.uk>
Date:   2025-11-19 20:20:51 +0000

    Adds connection test option q to force msmtpq to queue

 scripts/msmtpq/README.msmtpq | 2 ++
 scripts/msmtpq/msmtpq        | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

commit 4116e237c18d7ebefa5bac5543cabecb3f98972a
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-17 12:14:32 +0200

    msmtpq: Add uuid, simplify anti-collision logic
    
    The uuid should be enough to ensure uniqueness, keeping the loop in case
    the system has poor randomness/uuid generation.
    Add touch to the selected paths to shrink possible TOCTOU window.
    This approach is chosen over using mktemp because:
    - mktemp has conflicting implementations on various systems
    - mktemp can only guarantee prior nonexistence of a single inode, which
      forces us into using sudirectories for mail items instead of our
      current standard of a flat directory
      (this would be needless backwards-incompatible churn)
    - The gains to be gotten are minimal -- especially with the TOCTOU
      mitigation in this patch

 scripts/msmtpq/msmtpq | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

commit ac749844cb6f9acf843bba6f81a453af5064de79
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-17 11:55:21 +0200

    msmtpq: explicitly enumerate globs
    
    More explicit, more safe

 scripts/msmtpq/msmtpq | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

commit a1a840a11a58485b899afa37f42ec77908afec6a
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-11 03:48:04 +0200

    msmtpq: move up err() defn (SC complained)

 scripts/msmtpq/msmtpq | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

commit d1ed3b2ef36a6b601381eaeac2032784ff194d00
Author: gesh <gesh@gesh.uni.cx>
Date:   2025-11-11 02:06:56 +0200

    msmtpq: Add config knobs (esp rc location)
    
    This latter option enables XDG Base Directory-compliant setups without
    too much pain.
    
    Variables added:
    -  MSMTPQ_RC -- config file location
    -  MSMTPQ_LOG_DATEFMT -- log timestamp format string

 scripts/msmtpq/README.msmtpq | 24 +++++++++++++++++++++---
 scripts/msmtpq/msmtpq        |  8 ++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

commit de8d74d83f15eb139fa92b3b59465fe48dd218d6
Merge: f6774d9 09dbca0
Author: Martin Lambers <marlam@marlam.de>
Date:   2025-10-27 22:14:04 +0100

    Merge branch 'Konfekt-patch-4'

commit 09dbca028460bd51a0e9ab1703078546796c3257
Author: Konfekt <Konfekt@users.noreply.github.com>
Date:   2025-10-23 15:37:51 +0200

    express failed sending attempt more clearly
    
    I missed emails not being sent due to both notifications, for
    succesful/less sending showing a success message (albeit the latter for
    queuing instead of sending!)

 scripts/msmtpq/msmtpq | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

commit f07bddd8257eee2622c9b25568142015b492bd06
Author: Konfekt <Konfekt@users.noreply.github.com>
Date:   2025-10-19 17:47:44 +0200

    msmtpq: robust notify, stderr, nc timeout, path/typo fix
    
    - send errors to stderr.
    - make notify-send and non-fatal.
    - Use $HOME instead of ~ for queue path
    - Unset the correct log var.
    - Add nc -w timeout
    - remove grep color flag.
    - tidy locals and input checks
    - simplify loop

 scripts/msmtpq/msmtpq | 70 ++++++++++++++++++++++++++++++----------------------------------------
 1 file changed, 30 insertions(+), 40 deletions(-)

commit f6774d9e0558ca9d03b763908da0100cb82f8dc8
Author: Martin Lambers <marlam@marlam.de>
Date:   2025-10-12 10:26:57 +0200

    Bump version to 1.8.32

 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

commit f0a74b2a407f09a110fbff0c6b8501171bbfa878
Author: Martin Lambers <marlam@marlam.de>
Date:   2025-10-12 10:26:51 +0200

    Update NEWS.

 NEWS | 3 +++
 1 file changed, 3 insertions(+)

--===============8911144685465340559==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.32-1.8.34.patch"

RnJvbSBkYjZkYzlkZDkwNjEzYzE0OTIwYjljMDAwYzM0NTZlZmQxOGRkYTkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBdWcgMjAyNiAwNTo0MzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
bXRwOiB1cGdyYWRlIDEuOC4zMiAtPiAxLjguMzQKClNvdXJjZTogQ2hhbmdlTG9nCgpjb21taXQg
NzU1ZGY5ZjBkM2FjYWU1ZmJmOTgxNjQyNTg3YmUzZDBmYTYzMWVhYwpBdXRob3I6IE1hcnRpbiBM
YW1iZXJzIDxtYXJsYW1AbWFybGFtLmRlPgpEYXRlOiAgIDIwMjYtMDctMzEgMjI6NDE6NDMgKzAy
MDAKCiAgICBCdW1wIHZlcnNpb24gdG8gMS44LjM0CgogY29uZmlndXJlLmFjIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpjb21taXQgNjkxZDc4
MTRjM2U5MDE4NDM3ZDUyNGEzNGY0YjhjMzJjOTExNGE0MgpBdXRob3I6IE1hcnRpbiBMYW1iZXJz
IDxtYXJsYW1AbWFybGFtLmRlPgpEYXRlOiAgIDIwMjYtMDctMzEgMjI6NDE6MTMgKzAyMDAKCiAg
ICBVcGRhdGUgdHJhbnNsYXRpb25zCgogcG8vZGUucG8gICAgfCA0MzIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBwby9lby5wbyAg
ICB8ICA3NiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiBwby9mci5wbyAgICB8ICA3
OCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogcG8vcHRfQlIucG8gfCAgODAgKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiBwby9yby5wbyAgICB8ICA4MSArKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIHBvL3VrLnBvICAgIHwgIDc4ICsrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDQyMyBpbnNlcnRpb25zKCsp
LCA0MDIgZGVsZXRpb25zKC0pCgpjb21taXQgZWViMzYzZGE0NzM5Yjg0YzRiNTc2ZTJmYWNiY2Ix
ZTU3ZGI4ZmJmMQpBdXRob3I6IE1hcnRpbiBMYW1iZXJzIDxtYXJsYW1AbWFybGFtLmRlPgpEYXRl
OiAgIDIwMjYtMDctMzEgMjI6NDA6MjAgKzAyMDAKCiAgICBVcGRhdGUgTkVXUwoKIE5FV1MgfCAz
ICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKY29tbWl0IGRkODUxYjQ1NTkw
MjRhMzE4ZWUyMjU5MTgxNDI3YTNhOWRiZjA5Y2YKQXV0aG9yOiBNYXJ0aW4gTGFtYmVycyA8bWFy
bGFtQG1hcmxhbS5kZT4KRGF0ZTogICAyMDI2LTA3LTI1IDEyOjM4OjE2ICswMjAwCgogICAgVXBk
YXRlIGdldHRleHQuaCBmcm9tIGN1cnJlbnQgZ2V0dGV4dAoKIHNyYy9nZXR0ZXh0LmggfCAxMzEg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5OCBpbnNlcnRpb25zKCspLCAzMyBk
ZWxldGlvbnMoLSkKCmNvbW1pdCA5MzNkMzViZThhYjZlMzVhN2VhM2Y3OGRmNTRiNjQyMzAxNzc1
OTBiCkF1dGhvcjogTWFydGluIExhbWJlcnMgPG1hcmxhbUBtYXJsYW0uZGU+CkRhdGU6ICAgMjAy
Ni0wNy0xOSAxODo0MTo0MiArMDIwMAoKICAgIG1zbXRwcTogZml4IGxvb3AgY29uZGl0aW9uIGlu
IG1ha2VfaWQoKQoKICAgIFRoaXMgZml4ZXMgdGhlIHNlY29uZCBwYXJ0IG9mIEdpdGh1YiBpc3N1
ZSAjMjI4LgoKIHNjcmlwdHMvbXNtdHBxL21zbXRwcSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmNvbW1pdCAxMTZhYjZiYTcwN2QwOGQ0
OWQyODZiODEyZGFmM2QyNTY5YjUxMTdhCkF1dGhvcjogTWFydGluIExhbWJlcnMgPG1hcmxhbUBt
YXJsYW0uZGU+CkRhdGU6ICAgMjAyNi0wNy0xOSAxODo0MDo0MiArMDIwMAoKICAgIG1zbXRwcTog
Zml4IGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBiYXNoCgogICAgVGhpcyBmaXhlcyB0aGUgZmly
c3QgcGFydCBvZiBHaXRodWIgaXNzdWUgIzIyOC4KCiBzY3JpcHRzL21zbXRwcS9tc210cHEgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpj
b21taXQgM2IyMWY3NTlhNjRhMjU5MjJjOWY0NDg4MTY2ZmUwNTIwNjc1MmM2ZQpBdXRob3I6IENy
YXp5TWF4IDxub3RpZmljYXRpb25zQGdpdGh1Yi5jb20+CkRhdGU6ICAgMjAyNi0wNy0xNCAyMDo0
NToyMCArMDIwMAoKICAgIEZpeDogbXNtdHBkIGNhbiBsZWFrIHpvbWJpZSBzZXNzaW9uIGNoaWxk
cmVuIGFuZCBldmVudHVhbGx5IHN0b3AgYWNjZXB0aW5nIGNvbm5lY3Rpb25zCgogICAgVGhpcyBj
bG9zZXMgR2l0aHViIGlzc3VlICMyMjcuCgogc3JjL21zbXRwZC5jIHwgMyArKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmNvbW1pdCBlZjUzZDgyMzRk
ZTk5ZGU0ZTNmYjkxYzFhOGQ0OWI2YTJiOGYxYzQzCk1lcmdlOiA4ZDA0YjEwIGNkMjk3ZTUKQXV0
aG9yOiBNYXJ0aW4gTGFtYmVycyA8bWFybGFtQG1hcmxhbS5kZT4KRGF0ZTogICAyMDI2LTA3LTEz
IDA4OjQ3OjAzICswMjAwCgogICAgTWVyZ2UgYnJhbmNoICdub3ZlbC1ub3ZlbC1iYXNlNjQtYm9v
bCcKCmNvbW1pdCBjZDI5N2U1OTM2MzcyYWRmYTI3ZDNjZGYwODk1ZWJkMjJlMjZmNzVhCkF1dGhv
cjogUm9tYW4gQm9nb3JvZHNraXkgPGJvZ29yb2Rza2l5QGdtYWlsLmNvbT4KRGF0ZTogICAyMDI2
LTA3LTEyIDA4OjQ0OjE3ICswMjAwCgogICAgRml4IGJhc2U2NCBidWlsZCBvbiBGcmVlQlNECgog
ICAgT24gRnJlZUJTRCB3aXRoIGNsYW5nIDIxIGJ1aWxkIGZhaWxzIHdpdGg6CgogICAgSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIHNtdHAuYzo0MjoKICAgIC4vYmFzZTY0Lmg6NDU6ODogZXJyb3I6IHVu
a25vd24gdHlwZSBuYW1lICdib29sJwogICAgICAgNDUgfCBleHRlcm4gYm9vbCBiYXNlNjRfZGVj
b2RlX2N0eCAoc3RydWN0IGJhc2U2NF9kZWNvZGVfY29udGV4dCAqY3R4LAoKW0NoYW5nZWxvZyB0
cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxv
ZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4u
Li9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL3ttc210cF8xLjguMzIuYmIgPT4gbXNtdHBfMS44LjM0
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC97bXNtdHBfMS44LjMyLmJiID0+
IG1zbXRwXzEuOC4zNC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbXNtdHAvbXNtdHBfMS44LjMyLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21z
bXRwXzEuOC4zNC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjMyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjM0LmJiCmluZGV4IDdmMzlmNjZmNjUuLmM2YWM3YmY1
ODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjguMzIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4zNC5iYgpAQCAt
MTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIy
MzliY2I2NzM0NjNhYjg3NGU4MGQ0N2ZhZTUwNCIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRw
czovL21hcmxhbS5kZS9tc210cC9kb3dubG9hZC8iCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9tYXJs
YW0uZGUvJHtCUE59L3JlbGVhc2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIyMGNkNThiNThkZDAwN2FjZjdiOTM3ZmExYTFlMjFmM2FmYjNlOWVmNWJiY2ZiOGI0ZjU2NTBk
ZWFkYzY0ZGI0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg0ZThmZTJhNWE4MGExZWU3ODAyMDEz
YjNmYmRiODQ2YTNmMjdhNDE2M2NmMzdhMWM2ZDdjN2Y4ODg4NzNlYWQiCiAKIGluaGVyaXQgZ2V0
dGV4dCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi40Ny4x
Cgo=

--===============8911144685465340559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ka"

--===============8911144685465340559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.32.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.34.tar.xz"
packages/x86-64-v3-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ka"
packages/x86-64-v3-poky-linux/msmtp: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 513560 to 514584 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 117983 to 117987 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 36741 to 37025 (+1%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 34913 to 35018 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-es: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-es: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-fr: PKGSIZE changed from 37633 to 37751 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-pt-br: PKGSIZE changed from 37527 to 37642 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ro: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ro: PKGSIZE changed from 38227 to 38338 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ro: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47511 to 47629 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-zh-cn: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-zh-cn: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 527114 to 541250 (+3%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: FILELIST: removed "/usr/src/debug/msmtp/1.8.32/src/readbuf.h /usr/src/debug/msmtp/1.8.32/src/tools.c /usr/src/debug/msmtp/1.8.32/src/readbuf.c /usr/src/debug/msmtp/1.8.32/src/msmtp.c /usr/src/debug/msmtp/1.8.32/src/tools.h /usr/src/debug/msmtp/1.8.32/src/msgid.c /usr/src/debug/msmtp/1.8.32/src/xalloc.h /usr/src/debug/msmtp/1.8.32/src/smtp.h /usr/src/debug/msmtp/1.8.32/src/xalloc.c /usr/src/debug/msmtp/1.8.32/src/msgid.h /usr/src/debug/msmtp/1.8.32/src/smtp.c /usr/src/debug/msmtp/1.8.32/src/aliases.c /usr/src/debug/msmtp/1.8.32/src/md5.c /usr/src/debug/msmtp/1.8.32/src/md5-apps.h /usr/src/debug/msmtp/1.8.32/src/stream.h /usr/src/debug/msmtp/1.8.32/src/aliases.h /usr/src/debug/msmtp/1.8.32/src/md5-apps.c /usr/src/debug/msmtp/1.8.32/src/md5.h /usr/src/debug/msmtp/1.8.32/src/stream.c /usr/src/debug/msmtp/1.8.32/src/base64.c /usr/src/debug/msmtp/1.8.32/src/conf.h /usr/src/debug/msmtp/1.8.32/src/conf.c /usr/src/debug/msmtp/1.8.32/src/base64.h 
 /usr/src/debug/msmtp/1.8.32/src/eval.c /usr/src/debug/msmtp/1.8.32/src/mtls-gnutls.c /usr/src/debug/msmtp/1.8.32/src/mtls.h /usr/src/debug/msmtp/1.8.32/src/eval.h /usr/src/debug/msmtp/1.8.32/src/mtls.c /usr/src/debug/msmtp/1.8.32/src/net.c /usr/src/debug/msmtp/1.8.32/src/netrc.h /usr/src/debug/msmtp/1.8.32/src/net.h /usr/src/debug/msmtp/1.8.32/src/netrc.c /usr/src/debug/msmtp/1.8.32/src/msmtpd.c /usr/src/debug/msmtp/1.8.32/src/list.h /usr/src/debug/msmtp/1.8.32/src/password.h /usr/src/debug/msmtp/1.8.32/src/password.c /usr/src/debug/msmtp/1.8.32/src/list.c", added "/usr/src/debug/msmtp/1.8.34/src/readbuf.h /usr/src/debug/msmtp/1.8.34/src/tools.c /usr/src/debug/msmtp/1.8.34/src/readbuf.c /usr/src/debug/msmtp/1.8.34/src/msmtp.c /usr/src/debug/msmtp/1.8.34/src/tools.h /usr/src/debug/msmtp/1.8.34/src/msgid.c /usr/src/debug/msmtp/1.8.34/src/xalloc.h /usr/src/debug/msmtp/1.8.34/src/smtp.h /usr/src/debug/msmtp/1.8.34/src/xalloc.c /usr/src/debug/msmtp/1.8.34/src/msgid.h /usr/src/debug/msmtp
 /1.8.34/src/smtp.c /usr/src/debug/msmtp/1.8.34/src/gettext.h /usr/src/debug/msmtp/1.8.34/src/aliases.c /usr/src/debug/msmtp/1.8.34/src/md5.c /usr/src/debug/msmtp/1.8.34/src/md5-apps.h /usr/src/debug/msmtp/1.8.34/src/stream.h /usr/src/debug/msmtp/1.8.34/src/aliases.h /usr/src/debug/msmtp/1.8.34/src/md5-apps.c /usr/src/debug/msmtp/1.8.34/src/md5.h /usr/src/debug/msmtp/1.8.34/src/stream.c /usr/src/debug/msmtp/1.8.34/src/base64.c /usr/src/debug/msmtp/1.8.34/src/conf.h /usr/src/debug/msmtp/1.8.34/src/conf.c /usr/src/debug/msmtp/1.8.34/src/base64.h /usr/src/debug/msmtp/1.8.34/src/eval.c /usr/src/debug/msmtp/1.8.34/src/mtls-gnutls.c /usr/src/debug/msmtp/1.8.34/src/mtls.h /usr/src/debug/msmtp/1.8.34/src/eval.h /usr/src/debug/msmtp/1.8.34/src/mtls.c /usr/src/debug/msmtp/1.8.34/src/net.c /usr/src/debug/msmtp/1.8.34/src/netrc.h /usr/src/debug/msmtp/1.8.34/src/net.h /usr/src/debug/msmtp/1.8.34/src/netrc.c /usr/src/debug/msmtp/1.8.34/src/msmtpd.c /usr/src/debug/msmtp/1.8.34/src/list.h /usr/src/d
 ebug/msmtp/1.8.34/src/password.h /usr/src/debug/msmtp/1.8.34/src/password.c /usr/src/debug/msmtp/1.8.34/src/list.c"
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.32 [default] to 1.8.34 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp: PV changed from "1.8.32" to "1.8.34"
packages/x86-64-v3-poky-linux/msmtp/msmtp: PKGV changed from 1.8.32 [default] to 1.8.34 [default]

--===============8911144685465340559==--

