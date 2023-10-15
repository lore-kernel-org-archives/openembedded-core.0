Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000AAC04FEE
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.102697.1697399113073199657
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b2CQZBJq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DXDqKm++;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b34df0469-6f1f474e-4bbf-46c0-aba4-ea531439337b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JI8UFQqWvFEr65v8iIxWdpofDNOsYOsdCxUTmZfobU4=;
	b=b2CQZBJqsWu0w863wsyv9lS4j59QD0mb7QKzH1qc4AOzF7Q6syrSHqgAtNPIthLX
	lvGpvY4icty4h34vBnPfboz1lTQk7oRsV+xdojYJERX30QUfnp89ZwFCjT8S+1/H6gb
	fO5dJOyIq/vvj6aLqHU3XriUCsh3VJy1+YKLe3e8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JI8UFQqWvFEr65v8iIxWdpofDNOsYOsdCxUTmZfobU4=;
	b=DXDqKm++Pto7yoJf5UQvmYzOZ9mOhs3vP5SqtLVVCDJehlqvwaoY6c69ywK9kEzn
	tuh+MdodQtCN/enoMMzK5fXxOBkI22iLorxNVgyN9Wzs7xWfRvKQcDLp4PBhhk+a3Ur
	7WGFMTSaFX3LmgX2KJn3d8tCRnilXtude39/EsSI=
Content-Type: multipart/mixed; boundary="===============3123996313863601928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.5 SUCCEEDED
Message-ID: <0101018b34df0469-6f1f474e-4bbf-46c0-aba4-ea531439337b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189162

--===============3123996313863601928==
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
From 139047ed7c3e25f779ab13ad1fd6774775d867bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 08:22:49 +0000
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


--===============3123996313863601928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============3123996313863601928==
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

--===============3123996313863601928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============3123996313863601928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-254.4-254.5.patch"

RnJvbSAxMzkwNDdlZDdjM2UyNWY3NzlhYjEzYWQxZmQ2Nzc0Nzc1ZDg2N2JmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDg6MjI6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjU0LjQgLT4gMjU0LjUKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTQuNC5iYiA9PiBzeXN0ZW1kLWJvb3RfMjU0LjUuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTQuNC5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjU0LjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC40LmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjUuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTQuNS5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggM2JhMGI1ZmZjNS4uMGVm
Y2Y4ODkyMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNCw3ICsx
NCw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb25seSIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gIjJlNzUw
NDQ0OWE1MWZiMzhkYjljZDJkYTM5MWM2NDM0ZjgyZGVmNTEiCitTUkNSRVYgPSAiZWY2YzJkYWY5
OTQ3ZDIzZTJiYTZkNTBjNDJlNGEwZDc5ZmU4ZDMyYyIKIFNSQ0JSQU5DSCA9ICJ2MjU0LXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IgogCi0tIAoyLjM5LjIKCg==

--===============3123996313863601928==--

