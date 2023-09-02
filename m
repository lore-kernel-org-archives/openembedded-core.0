Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423A3CCF986
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:26 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5679.1693650553403327734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JD9qGrQ6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A0rpZopw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a557094a8-d790b045-c50c-4a6d-b402-a3da560263ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650556;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=YOvRqUK86l9CBf6JhlOCP2YguvejtKZ/J8uN9JO1zaQ=;
	b=JD9qGrQ6a57xmc2hDAVX6LhgM92WNI08b5UV5nfKTb8wVXH0fqkygRjNQNBhYvOl
	EW4qOHWYKn7qF+CyYz05iaw5yEvi/6ZcQ8K0g7IOK31Ud+YUszat3oWAFwydc+feUjZ
	fUiUsuOPOj9pCHOulyi7McghDmqV5OzgQ297CcCU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650556;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=YOvRqUK86l9CBf6JhlOCP2YguvejtKZ/J8uN9JO1zaQ=;
	b=A0rpZopweRFbkZuxj1wGbRxOTuQSghco91qGUXbBIpr9guSvL8OYQYM9mU1+JyDm
	nSuMYZVcGYe+90YbNcqohzI74pKcYbHNdqOnAuG6fPGJ4e7eLXulAW9q7jb8fnGpVvT
	vyqoWdyKqvJUuu+Si1uY6cD+sTEd+/pXiizfdnoM=
Content-Type: multipart/mixed; boundary="===============0870619156683020648=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.7.1 SUCCEEDED
Message-ID: <0101018a557094a8-d790b045-c50c-4a6d-b402-a3da560263ce-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187134

--===============0870619156683020648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.7.0-1.7.1.patch
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
From 7066b1f257b8d426e79491ff29f475eab822b648 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 07:17:34 +0000
Subject: [PATCH] libgit2: upgrade 1.7.0 -> 1.7.1

---
 .../libgit2/{libgit2_1.7.0.bb => libgit2_1.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.7.0.bb => libgit2_1.7.1.bb} (92%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.7.0.bb b/meta/recipes-support/libgit2/libgit2_1.7.1.bb
similarity index 92%
rename from meta/recipes-support/libgit2/libgit2_1.7.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.7.1.bb
index 15a91cfb27..92af0b8454 100644
--- a/meta/recipes-support/libgit2/libgit2_1.7.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.7;protocol=https"
-SRCREV = "3e2baa6d0bfb42f9016e24cba1733a6ae26a8ae6"
+SRCREV = "a2bde63741977ca0f4ef7db2f609df320be67a08"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============0870619156683020648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgit2: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.7.0", added "/usr/lib/.debug/libgit2.so.1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 8328372 to 8334716 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGSIZE changed from 769351 to 769378 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dev: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-doc: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-locale: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4169994 to 4172330 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-src: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.7.0", added "/usr/lib/libgit2.so.1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2: PV changed from "1.7.0" to "1.7.1"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.7 changed symlink target from libgit2.so.1.7.0 to libgit2.so.1.7.1
  /usr/lib/libgit2.so.1.7.0 moved to /usr/lib/libgit2.so.1.7.1

--===============0870619156683020648==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.7.0-1.7.1.patch"

RnJvbSA3MDY2YjFmMjU3YjhkNDI2ZTc5NDkxZmYyOWY0NzVlYWI4MjJiNjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwNzoxNzozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmdpdDI6IHVwZ3JhZGUgMS43LjAgLT4gMS43LjEKCi0tLQogLi4uL2xpYmdpdDIve2xpYmdpdDJf
MS43LjAuYmIgPT4gbGliZ2l0Ml8xLjcuMS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ2l0Mi97bGliZ2l0Ml8xLjcuMC5iYiA9PiBsaWJnaXQyXzEuNy4xLmJi
fSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0
Ml8xLjcuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjcuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnaXQyL2xpYmdpdDJfMS43LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdpdDIvbGliZ2l0Ml8xLjcuMS5iYgppbmRleCAxNWE5MWNmYjI3Li45MmFmMGI4NDU0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS43LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuNy4xLmJiCkBAIC02LDcg
KzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01YmRmNDdiYmM5
YTM5ZGM2Y2UwNzZkNTllMzIyZGMxNyIKIERFUEVORFMgPSAiY3VybCBvcGVuc3NsIHpsaWIgbGli
c3NoMiBsaWJnY3J5cHQgbGlicGNyZTIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9s
aWJnaXQyL2xpYmdpdDIuZ2l0O2JyYW5jaD1tYWludC92MS43O3Byb3RvY29sPWh0dHBzIgotU1JD
UkVWID0gIjNlMmJhYTZkMGJmYjQyZjkwMTZlMjRjYmExNzMzYTZhZTI2YThhZTYiCitTUkNSRVYg
PSAiYTJiZGU2Mzc0MTk3N2NhMGY0ZWY3ZGIyZjYwOWRmMzIwYmU2N2EwOCIKIAogUyA9ICIke1dP
UktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============0870619156683020648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.7.0", added "/usr/lib/libgit2.so.1.7.1"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.7 changed symlink target from libgit2.so.1.7.0 to libgit2.so.1.7.1
  /usr/lib/libgit2.so.1.7.0 moved to /usr/lib/libgit2.so.1.7.1

--===============0870619156683020648==--

