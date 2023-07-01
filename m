Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD6EC18E72
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.10768.1688227323737430039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ogt3wKZd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018912309c00-f43cfab6-ec59-4b89-92ea-a77d696c1d22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AQEP+IyxkI3/9TZK1WuP1sFOVPhg6LspG5aP3mSDewM=;
	b=Ogt3wKZdDxKfBHhRsF+vlFvN1Hog2/qSzit538uBfHy9d2pj7q3ow3yMfzgZcbgA
	qqlBbWuSNiiRUDDPcLdB4dbdOjsqdkogYi0UXNpsMn1pDf6jtPwbit/2jyr6+HGKGnf
	a8w3cNpkvwBYVqjI4Q4bjnUoETkQFkFMClhKPakI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AQEP+IyxkI3/9TZK1WuP1sFOVPhg6LspG5aP3mSDewM=;
	b=Ve7wc7qVIPHfo2jlHYsz1dfyedV/HC/I/KEtIMsPNzE0ULx+CA+y8bEqHMkgJrDU
	bfpsKBMN2/pGcwimY7vLYvvpFGMSFiPDgSGK9DgYbJKutk9WlB56ATJLOJbhcWzGTKe
	B2Um1qK5pOSo8xeCUlG+yMd1nXS5IngsEglmx0Qc=
Content-Type: multipart/mixed; boundary="===============0603338811539872311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnss-nis: upgrading to 3.2 SUCCEEDED
Message-ID: <0101018912309c00-f43cfab6-ec59-4b89-92ea-a77d696c1d22-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183739

--===============0603338811539872311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnss-nis* to *3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnss-nis-upgrade-3.1-3.2.patch
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
From b515d1cf347798b5e75223bf048f738807712d6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 10:34:53 +0000
Subject: [PATCH] libnss-nis: upgrade 3.1 -> 3.2

---
 meta/recipes-extended/libnss-nis/libnss-nis.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index d0afb3ca0a..f0e687c330 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.1+git${SRCPV}"
+PV = "3.2"
 
-SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
+SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
-- 
2.39.2


--===============0603338811539872311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-doc: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-locale: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-staticdev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]

--===============0603338811539872311==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnss-nis-upgrade-3.1-3.2.patch"

RnJvbSBiNTE1ZDFjZjM0Nzc5OGI1ZTc1MjIzYmYwNDhmNzM4ODA3NzEyZDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMDozNDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5zcy1uaXM6IHVwZ3JhZGUgMy4xIC0+IDMuMgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGlibnNzLW5pcy9saWJuc3MtbmlzLmJiIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJuc3MtbmlzL2xpYm5zcy1uaXMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGli
bnNzLW5pcy9saWJuc3MtbmlzLmJiCmluZGV4IGQwYWZiM2NhMGEuLmYwZTY4N2MzMzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJuc3MtbmlzL2xpYm5zcy1uaXMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYm5zcy1uaXMvbGlibnNzLW5pcy5iYgpAQCAtMTMs
OSArMTMsOSBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT00ZmJkNjUz
ODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIFNFQ1RJT04gPSAibGlicyIKIERFUEVORFMgKz0g
ImxpYnRpcnBjIGxpYm5zbDIiCiAKLVBWID0gIjMuMStnaXQke1NSQ1BWfSIKK1BWID0gIjMuMiIK
IAotU1JDUkVWID0gIjA2MmYzMTk5OWIzNTM5M2FiZjc1OTVjYjg5ZGZjOTU5MGQ1YTQyYWQiCitT
UkNSRVYgPSAiY2QwZDM5MWFmOTUzNWI1NmU2MTJlZDIyN2MxYjg5YmUyNjlmM2Q1OSIKIAogU1JD
X1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3Roa3VrdWsvbGlibnNzX25pczticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAiCi0tIAoyLjM5LjIKCg==

--===============0603338811539872311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnss-nis: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis: PKGV changed from 3.1+gitAUTOINC+062f31999b [default] to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PKGSIZE changed from 159256 to 158792 (-0%)
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dev: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-doc: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-doc: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-locale: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-locale: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PKGSIZE changed from 127071 to 127010 (-0%)
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-staticdev: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-staticdev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]

--===============0603338811539872311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 45 skipped, 0 masked, 0 errors.
Removing 8 recipes from the core2-32 sysroot...done.
Removing 7 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libnss-nis'
libnss-nis was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============0603338811539872311==--

