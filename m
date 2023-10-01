Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FC4E748FA
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.64728.1696183990449736726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KLjeZ/Wa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W8kSkd7w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018aec71b53e-152ec8cd-9d58-4650-9ba3-69e1adcf166c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U4Cy006h2KAkouScZl+9zsLdBBJgLLxUjMUEls9kC68=;
	b=KLjeZ/WaXDHLFWwIIXd9J3nmdvqeEMKQjheHpc9EktKL1w3fNSOB05+sIl3cIM5L
	7u9aGJAA6LMe+b4wlTwKeNJglnfuKIjmUR2tZGluTkgMf+z3BIHPizBMsVyHLIs8jKY
	hAh45ZFuopnBTTwM4HnV+0OSWPzo6wBj56oEZ3r8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U4Cy006h2KAkouScZl+9zsLdBBJgLLxUjMUEls9kC68=;
	b=W8kSkd7w0yqhWqWZADWXM79v0o0EORSr8SXy8vXknAsiqX3vaco5CokZOVEp9VT1
	1X2pH9RTd10VweaUOejg3KirEKPWTZQ+Px0LNPvdiJTR+QTzgM+wrmol/a8T3VhCIjz
	o+dWws7gUYuvz+w8umgj+NCY06QqAt/pjMrfeHmg=
Content-Type: multipart/mixed; boundary="===============5077014729355205419=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.5 SUCCEEDED
Message-ID: <0101018aec71b53e-152ec8cd-9d58-4650-9ba3-69e1adcf166c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188520

--===============5077014729355205419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *254.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-254.4-254.5.patch
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
From 3892cba24ff48416046cce359b6e029bc871d344 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 07:46:30 +0000
Subject: [PATCH] systemd-boot: upgrade 254.4 -> 254.5

---
 .../systemd/{systemd-boot_254.4.bb => systemd-boot_254.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.4.bb => systemd-boot_254.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_254.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_254.4.bb
rename to meta/recipes-core/systemd/systemd-boot_254.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3ba0b5ffc5..0efcf88922 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
+SRCREV = "ef6c2daf9947d23e2ba6d50c42e4a0d79fe8d32c"
 SRCBRANCH = "v254-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.39.2


--===============5077014729355205419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "254.4" to "254.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 254.4 [default] to 254.5 [default]

--===============5077014729355205419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============5077014729355205419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============5077014729355205419==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-254.4-254.5.patch"

RnJvbSAzODkyY2JhMjRmZjQ4NDE2MDQ2Y2NlMzU5YjZlMDI5YmM4NzFkMzQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwNzo0NjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTQuNCAtPiAyNTQuNQoKLS0tCiAuLi4vc3lzdGVtZC97c3lz
dGVtZC1ib290XzI1NC40LmJiID0+IHN5c3RlbWQtYm9vdF8yNTQuNS5iYn0gICAgfCAwCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1NC40LmJi
ID0+IHN5c3RlbWQtYm9vdF8yNTQuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjQuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTQuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC41LmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwppbmRleCAzYmEwYjVmZmM1Li4wZWZj
Zjg4OTIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKQEAgLTE0LDcgKzE0
LDcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJh
YWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiMmU3NTA0
NDQ5YTUxZmIzOGRiOWNkMmRhMzkxYzY0MzRmODJkZWY1MSIKK1NSQ1JFViA9ICJlZjZjMmRhZjk5
NDdkMjNlMmJhNmQ1MGM0MmU0YTBkNzlmZThkMzJjIgogU1JDQlJBTkNIID0gInYyNTQtc3RhYmxl
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0iCiAKLS0gCjIuMzkuMgoK

--===============5077014729355205419==--

