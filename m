Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D61DC52CF8
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4623.1704114719064543032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UZBNmO7z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ULWyiSze;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018cc527064b-69d455fa-21ae-4f79-acdf-fc57c5a7a0b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k7Eiij+zxRibfemgnhAjfUpnWNMFhi0pithwn7NmFAY=;
	b=UZBNmO7zIVsJXEQE8V4w9+jFVBiGFyJMVTf+pacjP6ryBzamL+royGhqc5+DNqvO
	dUqlk3DeFcS62hZpvcxNWB+X6fKmDqOp+23pq+NSJV5C7aaKwQ4A0tk3lVe8E2GkUsc
	hfcsEc90MYixjzHOGGK3TvauTqKw/l4V72kkuYEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k7Eiij+zxRibfemgnhAjfUpnWNMFhi0pithwn7NmFAY=;
	b=ULWyiSzeMrIleIHWJS/v0Y0YK6ZHcTm6On3NieOx4GXQFVcN0WSIrxt+zfY/CjBw
	KIrf0m/dZgbu/tRcrXBlZJSNqK5HifQE0SyloX4z0yfNrb/R0O/n8fZG+IsmlEblUEz
	W10RNU32/Go/pM1VHy9fIwa+XIsI68ZcwYFt9vJE=
Content-Type: multipart/mixed; boundary="===============0992611440545787460=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus-wait: upgrading to
 64bc7c8fae61ded0c4e555aa775911f84c56e438 SUCCEEDED
Message-ID: <0101018cc527064b-69d455fa-21ae-4f79-acdf-fc57c5a7a0b1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193103

--===============0992611440545787460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus-wait* to *64bc7c8fae61ded0c4e555aa775911f84c56e438* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-wait-upgrade-to-latest-revision.patch
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
From 7578b2b7a437364da1cc728e7baa2db7bd1878dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 05:24:00 +0000
Subject: [PATCH] dbus-wait: upgrade to latest revision

---
 meta/recipes-core/dbus-wait/dbus-wait_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 1cdf07d03d..39363b9b3a 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "dbus"
 
-SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
+SRCREV = "64bc7c8fae61ded0c4e555aa775911f84c56e438"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-- 
2.42.0


--===============0992611440545787460==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-wait-upgrade-to-latest-revision.patch"

RnJvbSA3NTc4YjJiN2E0MzczNjRkYTFjYzcyOGU3YmFhMmRiN2JkMTg3OGRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNToyNDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRi
dXMtd2FpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWNv
cmUvZGJ1cy13YWl0L2RidXMtd2FpdF9naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9kYnVzLXdhaXQvZGJ1cy13YWl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2RidXMtd2Fp
dC9kYnVzLXdhaXRfZ2l0LmJiCmluZGV4IDFjZGYwN2QwM2QuLjM5MzYzYjliM2EgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2RidXMtd2FpdC9kYnVzLXdhaXRfZ2l0LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL2RidXMtd2FpdC9kYnVzLXdhaXRfZ2l0LmJiCkBAIC03LDcgKzcsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0
NDg2YTgwZmRhZjRhNDI2MyIKIAogREVQRU5EUyA9ICJkYnVzIgogCi1TUkNSRVYgPSAiNmNjNjA3
N2EzNmZlMjY0OGE1Zjk5M2ZlN2MxNmM5NjMyZjk0NjUxNyIKK1NSQ1JFViA9ICI2NGJjN2M4ZmFl
NjFkZWQwYzRlNTU1YWE3NzU5MTFmODRjNTZlNDM4IgogUFYgPSAiMC4xK2dpdCIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy8ke0JQTn07YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwcyIKLS0gCjIuNDIuMAoK

--===============0992611440545787460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dbus-wait/dbus-wait-dbg: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-dev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-doc: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-locale: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-src: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-staticdev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae

--===============0992611440545787460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dbus-wait/dbus-wait-dbg: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-dev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-doc: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-locale: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-src: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-staticdev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae

--===============0992611440545787460==--

