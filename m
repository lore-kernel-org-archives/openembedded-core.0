Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9799CC4708B
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.19015.1652634913640735762
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EdJNoDBw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180c8b78df7-0e7a2922-75b6-41cb-812a-85921e105dca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634914;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=CE1YaMdAE+IXLxXOirsrNQGGPZK6smIieomlbSsYflw=;
	b=EdJNoDBwTE3dUBEJEzjyXJwm9nhMlAE0WfV0Zswq4vDNwSlnOIjbP7a1tS5Pnf8E
	gGNiMBVQb5RtCPkGDzKaxE33GxcgCfPtFT9+X2kPvkKDXxMfsCS03KPMFyBODrchhe0
	IBjl1SgZ9lSpr0uWwn5lllsQBFQj4HKJrjYORxEo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634914;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=CE1YaMdAE+IXLxXOirsrNQGGPZK6smIieomlbSsYflw=;
	b=QPg5/Z1LetKnf3P/BWV57oZgD6+cdRoGDZnC6cc8Wet5t3YIaBVn/SbN5xUJux47
	8dh4j2uUmL3Qzu6t3FBLg7Kmn5GIBhaPKK3nd9vdq7hRwlFQnBKl5E9EZZ8sVZTdBBI
	SJGcNqH2S6gC7InnS7cgVX3/2efhytwpiMrbJzuc=
Content-Type: multipart/mixed; boundary="===============3490825616310396655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.5 SUCCEEDED
Message-ID: 
 <01010180c8b78df7-0e7a2922-75b6-41cb-812a-85921e105dca-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:14 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165647

--===============3490825616310396655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.7.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnutls-upgrade-3.7.4-3.7.5.patch
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
--===============3490825616310396655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnutls/gnutls-bin: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: FILELIST: removed "/usr/lib/.debug/libgnutls.so.30.32.0", added "/usr/lib/.debug/libgnutls.so.30.33.0"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 7514028 to 7541748 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dev: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGSIZE changed from 465171 to 465708 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-doc: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-doc: FILELIST: added "/usr/share/man/man3/gnutls_aead_cipher_set_key.3"
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGSIZE changed from 4408022 to 4381794 (-1%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGSIZE changed from 24988 to 34568 (+38%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGSIZE changed from 24527 to 34721 (+42%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGSIZE changed from 23875 to 24329 (+2%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-src: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-src: FILELIST: directory renamed /usr/src/debug/gnutls/3.7.4-r0/build/lib/includes/gnutls -> /usr/src/debug/gnutls/3.7.5-r0/build/lib/includes/gnutls, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/includes/gnutls -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/includes/gnutls, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/nettle/int -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/nettle/int, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/x509 -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/x509, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/inih -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/inih, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/auth -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/auth, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/nettle/gost -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/n
 ettle/gost, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/nettle -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/nettle, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/accelerated/x86 -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/accelerated/x86, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/glthread -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/glthread, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/accelerated/x86/elf -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/accelerated/x86/elf, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/extras -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/extras, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/accelerated -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/accelerated, directory renamed /
 usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/extra -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/extra, directory renamed /usr/src/debug/gnutls/3.7.4-r0/build/src/gl -> /usr/src/debug/gnutls/3.7.5-r0/build/src/gl, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/tls13 -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/tls13, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/extra/includes/gnutls -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/extra/includes/gnutls, directory renamed /usr/src/debug/gnutls/3.7.4-r0/build/gl -> /usr/src/debug/gnutls/3.7.5-r0/build/gl, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/tests -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/tests, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/src/gl -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/src/gl, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/algorithms -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/algorithms, directory re
 named /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/ext -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/ext, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/system -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/system, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/src -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/src, directory renamed /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/lib/minitasn1 -> /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/lib/minitasn1, removed "/usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/hash-pjw-bare.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/c-strncasecmp.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/vasnprintf.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/cloexec.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/hash.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/c-ctype.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/malloca.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/printf-args.h /usr/src/debug
 /gnutls/3.7.4-r0/gnutls-3.7.4/gl/bitrotate.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/c-strcase.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/malloca.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/vasnprintf.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/idx.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/asnprintf.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/c-strcasecmp.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/read-file.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/printf-parse.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/memchr.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/xsize.h /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/printf-parse.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/printf-args.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/hash.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/read-file.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/fcntl.c /usr/src/debug/gnutls/3.7.4-r0/gnutls-3.7.4/gl/hash-pjw-bare.c /usr/src/debug/g
 nutls/3.7.4-r0/gnutls-3.7.4/gl/stat-time.h", added "/usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/c-strcase.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/vasnprintf.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/malloca.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/stripslash.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/basename-lgpl.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/basename-lgpl.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/read-file.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/hash-pjw-bare.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/printf-parse.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/idx.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/printf-parse.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/asnprintf.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/c-strncasecmp.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/cloexec.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/hash.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/dirn
 ame-lgpl.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/printf-args.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/hash.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/memchr.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/c-ctype.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/malloca.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/hash-pjw-bare.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/printf-args.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/read-file.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/c-strcasecmp.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/stat-time.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/vasnprintf.c /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/bitrotate.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/xsize.h /usr/src/debug/gnutls/3.7.5-r0/gnutls-3.7.5/gl/fcntl.c"
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGSIZE changed from 8379284 to 8412844 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls-xx: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls-xx: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.32.0", added "/usr/lib/libgnutls.so.30.33.0"
packages/core2-32-poky-linux/gnutls/gnutls: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls/gnutls: PKGSIZE changed from 2268364 to 2276556 (+0%)
packages/core2-32-poky-linux/gnutls: PV changed from "3.7.4" to "3.7.5"
packages/core2-32-poky-linux/gnutls: PKGV changed from 3.7.4 [default] to 3.7.5 [default]
packages/core2-32-poky-linux/gnutls: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz file://arm_eabi.patch" to "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.5.tar.xz file://arm_eabi.patch"
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so.30.32.0 moved to /usr/lib/libgnutls.so.30.33.0
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so.30.32.0 moved to /usr/lib/libgnutls.so.30.33.0

--===============3490825616310396655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gnutls/gnutls-doc: FILELIST: added "/usr/share/man/man3/gnutls_aead_cipher_set_key.3"
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGSIZE changed from 24988 to 34568 (+38%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGSIZE changed from 24527 to 34721 (+42%)
packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.32.0", added "/usr/lib/libgnutls.so.30.33.0"
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so.30.32.0 moved to /usr/lib/libgnutls.so.30.33.0
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.32.0 to libgnutls.so.30.33.0
  /usr/lib/libgnutls.so.30.32.0 moved to /usr/lib/libgnutls.so.30.33.0

--===============3490825616310396655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.7.4-3.7.5.patch"

From bbc9c754ba0fcc3c58bf3e4712653784926dc76f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 16:45:45 +0000
Subject: [PATCH] gnutls: upgrade 3.7.4 -> 3.7.5

---
 .../recipes-support/gnutls/{gnutls_3.7.4.bb => gnutls_3.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.4.bb => gnutls_3.7.5.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.4.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.5.bb
index b34eb7f5f0..5feedb7fdc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
+SRC_URI[sha256sum] = "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.31.1


--===============3490825616310396655==--

