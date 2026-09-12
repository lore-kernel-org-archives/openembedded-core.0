Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C9CC88E56
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 06:46:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1971.1789195563695910844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 23:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cS4sPQZ/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nBbAeZUi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0945dad62-a33db34b-2f77-4277-9be1-8bd4992b6a3b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789195562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ly4mvfyNEhxlYSPpyL4rY1S2LTEImXkk2NawrPDXZbk=;
	b=cS4sPQZ/GuePVymjb5hNS9VK6YpPBMOEw7uVpFU0dNcavARwMhwvQY9KHe9qR4v0
	shqpIxb4kBPCoe5pt1MBaQBHsJRAeI+YXONb7BFN4wNDMSvzgsFXhnVNLypW03692Aq
	QC3ul+C9A83vIj+mnEAcIq+d2Zag/8QaLTogQC6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789195562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ly4mvfyNEhxlYSPpyL4rY1S2LTEImXkk2NawrPDXZbk=;
	b=nBbAeZUiAAao27XvpacAxfAsWV0uc8+PHt7Yi6cu+Hm96iGfF0vLBURW0USdTSGG
	aoVmXkeJHZ8WG5fkujO0mhgsFBvBGDB6AgXMEmWuGqWBrkxcGO2VONmvUScmy3qfmrM
	9Cn4uKyleS16C8yoq/euFEJw412FlXYXiTytOjPY=
Content-Type: multipart/mixed; boundary="===============6767091867909005791=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.15.7 SUCCEEDED
Message-ID: <010101a0945dad62-a33db34b-2f77-4277-9be1-8bd4992b6a3b-000000@us-west-2.amazonses.com>
Date: Sat, 12 Sep 2026 06:46:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.12-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 06:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245693

--===============6767091867909005791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.15.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburcu-upgrade-0.15.6-0.15.7.patch
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
From e7baa4ba2191f4b74d4b6ab6cddb3ffc16ece709 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 12 Sep 2026 06:45:52 +0000
Subject: [PATCH] liburcu: upgrade 0.15.6 -> 0.15.7

Source: ChangeLog

2026-09-11 Userspace RCU 0.15.7
	* call-rcu worker: set CPU affinity on first non-empty dequeue
	* Fix: leaky wfcq tests
	* Fix: test_build.c: Test output mismatch
	* Fix: workqueue leaks mutexes on FreeBSD
	* Fix: call-rcu leaks mutexes on FreeBSD
	* call_rcu: pin per-CPU worker at thread startup
	* urcu-pointer: Add rcu_dereference_sym2() taking the pointer address
	* urcu-pointer: Fix missing memory ordering in rcu_dereference_sym()
---
 .../liburcu/{liburcu_0.15.6.bb => liburcu_0.15.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.6.bb => liburcu_0.15.7.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.6.bb b/meta/recipes-support/liburcu/liburcu_0.15.7.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.6.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.7.bb
index 140488eaa3..0aa51903be 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.6.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.7.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f"
+SRC_URI[sha256sum] = "2556b83adc0f9b3ac8024e613e17d014d04c4c49110604ce55fcb14eae32edd3"
 
 S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.47.1


--===============6767091867909005791==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburcu-upgrade-0.15.6-0.15.7.patch"

RnJvbSBlN2JhYTRiYTIxOTFmNGI3NGQ0YjZhYjZjZGRiM2ZmYzE2ZWNlNzA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTIgU2VwIDIwMjYgMDY6NDU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmN1OiB1cGdyYWRlIDAuMTUuNiAtPiAwLjE1LjcKClNvdXJjZTogQ2hhbmdlTG9nCgoyMDI2
LTA5LTExIFVzZXJzcGFjZSBSQ1UgMC4xNS43CgkqIGNhbGwtcmN1IHdvcmtlcjogc2V0IENQVSBh
ZmZpbml0eSBvbiBmaXJzdCBub24tZW1wdHkgZGVxdWV1ZQoJKiBGaXg6IGxlYWt5IHdmY3EgdGVz
dHMKCSogRml4OiB0ZXN0X2J1aWxkLmM6IFRlc3Qgb3V0cHV0IG1pc21hdGNoCgkqIEZpeDogd29y
a3F1ZXVlIGxlYWtzIG11dGV4ZXMgb24gRnJlZUJTRAoJKiBGaXg6IGNhbGwtcmN1IGxlYWtzIG11
dGV4ZXMgb24gRnJlZUJTRAoJKiBjYWxsX3JjdTogcGluIHBlci1DUFUgd29ya2VyIGF0IHRocmVh
ZCBzdGFydHVwCgkqIHVyY3UtcG9pbnRlcjogQWRkIHJjdV9kZXJlZmVyZW5jZV9zeW0yKCkgdGFr
aW5nIHRoZSBwb2ludGVyIGFkZHJlc3MKCSogdXJjdS1wb2ludGVyOiBGaXggbWlzc2luZyBtZW1v
cnkgb3JkZXJpbmcgaW4gcmN1X2RlcmVmZXJlbmNlX3N5bSgpCi0tLQogLi4uL2xpYnVyY3Uve2xp
YnVyY3VfMC4xNS42LmJiID0+IGxpYnVyY3VfMC4xNS43LmJifSAgICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS97bGlidXJjdV8wLjE1LjYuYmIgPT4gbGlidXJjdV8w
LjE1LjcuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJj
dS9saWJ1cmN1XzAuMTUuNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJj
dV8wLjE1LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuNy5iYgppbmRleCAxNDA0ODhlYWEzLi4wYWE1
MTkwM2JlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1cmN1L2xpYnVyY3Vf
MC4xNS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8wLjE1
LjcuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS5tZDttZDU9YzJhOTI0OThiNmU4OGUyNzZmOTg2ODc3OTk1NDI1YjggXAogCiBTUkNfVVJJID0g
Imh0dHA6Ly9sdHRuZy5vcmcvZmlsZXMvdXJjdS91c2Vyc3BhY2UtcmN1LSR7UFZ9LnRhci5iejIi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NTBiMTkyMDk2ZWIxMWViZjJjNzBlOGY5N2JjN2Rh
NzQ3OWVlNDFkYTFiZWJlYjQ0ZTM5ODY5MDhiYWM0MTRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjI1NTZiODNhZGMwZjliM2FjODAyNGU2MTNlMTdkMDE0ZDA0YzRjNDkxMTA2MDRjZTU1ZmNiMTRl
YWUzMmVkZDMiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L3VzZXJzcGFjZS1yY3UtJHtQVn0iCiBpbmhl
cml0IGF1dG90b29scyBtdWx0aWxpYl9oZWFkZXIKLS0gCjIuNDcuMQoK

--===============6767091867909005791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/liburcu/liburcu: FILELIST: removed "/usr/lib/liburcu.so.8.1.0 /usr/lib/liburcu-memb.so.8.1.0 /usr/lib/liburcu-qsbr.so.8.1.0 /usr/lib/liburcu-bp.so.8.1.0 /usr/lib/liburcu-mb.so.8.1.0 /usr/lib/liburcu-cds.so.8.1.0 /usr/lib/liburcu-common.so.8.1.0", added "/usr/lib/liburcu-common.so.8.2.0 /usr/lib/liburcu.so.8.2.0 /usr/lib/liburcu-bp.so.8.2.0 /usr/lib/liburcu-cds.so.8.2.0 /usr/lib/liburcu-memb.so.8.2.0 /usr/lib/liburcu-qsbr.so.8.2.0 /usr/lib/liburcu-mb.so.8.2.0"
Changes to packages/x86-64-v3-poky-linux/liburcu (sysroot):
  /usr/lib/liburcu-bp.so.8 changed symlink target from liburcu-bp.so.8.1.0 to liburcu-bp.so.8.2.0
  /usr/lib/liburcu-bp.so changed symlink target from liburcu-bp.so.8.1.0 to liburcu-bp.so.8.2.0
  /usr/lib/liburcu-cds.so.8 changed symlink target from liburcu-cds.so.8.1.0 to liburcu-cds.so.8.2.0
  /usr/lib/liburcu-cds.so changed symlink target from liburcu-cds.so.8.1.0 to liburcu-cds.so.8.2.0
  /usr/lib/liburcu-common.so.8 changed symlink target from liburcu-common.so.8.1.0 to liburcu-common.so.8.2.0
  /usr/lib/liburcu-common.so changed symlink target from liburcu-common.so.8.1.0 to liburcu-common.so.8.2.0
  /usr/lib/liburcu-mb.so.8 changed symlink target from liburcu-mb.so.8.1.0 to liburcu-mb.so.8.2.0
  /usr/lib/liburcu-mb.so changed symlink target from liburcu-mb.so.8.1.0 to liburcu-mb.so.8.2.0
  /usr/lib/liburcu-memb.so.8 changed symlink target from liburcu-memb.so.8.1.0 to liburcu-memb.so.8.2.0
  /usr/lib/liburcu-memb.so changed symlink target from liburcu-memb.so.8.1.0 to liburcu-memb.so.8.2.0
  /usr/lib/liburcu-qsbr.so.8 changed symlink target from liburcu-qsbr.so.8.1.0 to liburcu-qsbr.so.8.2.0
  /usr/lib/liburcu-qsbr.so changed symlink target from liburcu-qsbr.so.8.1.0 to liburcu-qsbr.so.8.2.0
  /usr/lib/liburcu.so.8 changed symlink target from liburcu.so.8.1.0 to liburcu.so.8.2.0
  /usr/lib/liburcu.so changed symlink target from liburcu.so.8.1.0 to liburcu.so.8.2.0
  /usr/lib/liburcu-bp.so.8.1.0 moved to /usr/lib/liburcu-bp.so.8.2.0
  /usr/lib/liburcu-cds.so.8.1.0 moved to /usr/lib/liburcu-cds.so.8.2.0
  /usr/lib/liburcu-common.so.8.1.0 moved to /usr/lib/liburcu-common.so.8.2.0
  /usr/lib/liburcu-mb.so.8.1.0 moved to /usr/lib/liburcu-mb.so.8.2.0
  /usr/lib/liburcu-memb.so.8.1.0 moved to /usr/lib/liburcu-memb.so.8.2.0
  /usr/lib/liburcu-qsbr.so.8.1.0 moved to /usr/lib/liburcu-qsbr.so.8.2.0
  /usr/lib/liburcu.so.8.1.0 moved to /usr/lib/liburcu.so.8.2.0

--===============6767091867909005791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="liburcu-changelog.txt"

Changelog for liburcu: 0.15.6 -> 0.15.7
Source: ChangeLog

2026-09-11 Userspace RCU 0.15.7
	* call-rcu worker: set CPU affinity on first non-empty dequeue
	* Fix: leaky wfcq tests
	* Fix: test_build.c: Test output mismatch
	* Fix: workqueue leaks mutexes on FreeBSD
	* Fix: call-rcu leaks mutexes on FreeBSD
	* call_rcu: pin per-CPU worker at thread startup
	* urcu-pointer: Add rcu_dereference_sym2() taking the pointer address
	* urcu-pointer: Fix missing memory ordering in rcu_dereference_sym()

--===============6767091867909005791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/liburcu: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu: SRC_URI changed from "http://lttng.org/files/urcu/userspace-rcu-0.15.6.tar.bz2" to "http://lttng.org/files/urcu/userspace-rcu-0.15.7.tar.bz2"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: FILELIST: removed "/usr/lib/.debug/liburcu-bp.so.8.1.0 /usr/lib/.debug/liburcu-cds.so.8.1.0 /usr/lib/.debug/liburcu.so.8.1.0 /usr/lib/.debug/liburcu-mb.so.8.1.0 /usr/lib/.debug/liburcu-memb.so.8.1.0 /usr/lib/.debug/liburcu-common.so.8.1.0 /usr/lib/.debug/liburcu-qsbr.so.8.1.0", added "/usr/lib/.debug/liburcu-mb.so.8.2.0 /usr/lib/.debug/liburcu-qsbr.so.8.2.0 /usr/lib/.debug/liburcu-common.so.8.2.0 /usr/lib/.debug/liburcu-memb.so.8.2.0 /usr/lib/.debug/liburcu-bp.so.8.2.0 /usr/lib/.debug/liburcu-cds.so.8.2.0 /usr/lib/.debug/liburcu.so.8.2.0"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGSIZE changed from 976864 to 976880 (+0%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGSIZE changed from 365958 to 366977 (+0%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: FILELIST: directory renamed /usr/src/debug/liburcu/0.15.6/include/urcu -> /usr/src/debug/liburcu/0.15.7/include/urcu, directory renamed /usr/src/debug/liburcu/0.15.6/include/urcu/uatomic -> /usr/src/debug/liburcu/0.15.7/include/urcu/uatomic, directory renamed /usr/src/debug/liburcu/0.15.6/include/urcu/static -> /usr/src/debug/liburcu/0.15.7/include/urcu/static, directory renamed /usr/src/debug/liburcu/0.15.6/src -> /usr/src/debug/liburcu/0.15.7/src
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PKGSIZE changed from 428659 to 431441 (+1%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu: PV changed from "0.15.6" to "0.15.7"
packages/x86-64-v3-poky-linux/liburcu/liburcu: PKGV changed from 0.15.6 [default] to 0.15.7 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu: FILELIST: removed "/usr/lib/liburcu-common.so.8.1.0 /usr/lib/liburcu-cds.so.8.1.0 /usr/lib/liburcu-qsbr.so.8.1.0 /usr/lib/liburcu-memb.so.8.1.0 /usr/lib/liburcu-bp.so.8.1.0 /usr/lib/liburcu-mb.so.8.1.0 /usr/lib/liburcu.so.8.1.0", added "/usr/lib/liburcu-bp.so.8.2.0 /usr/lib/liburcu-cds.so.8.2.0 /usr/lib/liburcu-memb.so.8.2.0 /usr/lib/liburcu-common.so.8.2.0 /usr/lib/liburcu-qsbr.so.8.2.0 /usr/lib/liburcu.so.8.2.0 /usr/lib/liburcu-mb.so.8.2.0"
Changes to packages/x86-64-v3-poky-linux/liburcu (sysroot):
  /usr/lib/liburcu-bp.so.8 changed symlink target from liburcu-bp.so.8.1.0 to liburcu-bp.so.8.2.0
  /usr/lib/liburcu-bp.so changed symlink target from liburcu-bp.so.8.1.0 to liburcu-bp.so.8.2.0
  /usr/lib/liburcu-cds.so.8 changed symlink target from liburcu-cds.so.8.1.0 to liburcu-cds.so.8.2.0
  /usr/lib/liburcu-cds.so changed symlink target from liburcu-cds.so.8.1.0 to liburcu-cds.so.8.2.0
  /usr/lib/liburcu-common.so.8 changed symlink target from liburcu-common.so.8.1.0 to liburcu-common.so.8.2.0
  /usr/lib/liburcu-common.so changed symlink target from liburcu-common.so.8.1.0 to liburcu-common.so.8.2.0
  /usr/lib/liburcu-mb.so.8 changed symlink target from liburcu-mb.so.8.1.0 to liburcu-mb.so.8.2.0
  /usr/lib/liburcu-mb.so changed symlink target from liburcu-mb.so.8.1.0 to liburcu-mb.so.8.2.0
  /usr/lib/liburcu-memb.so.8 changed symlink target from liburcu-memb.so.8.1.0 to liburcu-memb.so.8.2.0
  /usr/lib/liburcu-memb.so changed symlink target from liburcu-memb.so.8.1.0 to liburcu-memb.so.8.2.0
  /usr/lib/liburcu-qsbr.so.8 changed symlink target from liburcu-qsbr.so.8.1.0 to liburcu-qsbr.so.8.2.0
  /usr/lib/liburcu-qsbr.so changed symlink target from liburcu-qsbr.so.8.1.0 to liburcu-qsbr.so.8.2.0
  /usr/lib/liburcu.so.8 changed symlink target from liburcu.so.8.1.0 to liburcu.so.8.2.0
  /usr/lib/liburcu.so changed symlink target from liburcu.so.8.1.0 to liburcu.so.8.2.0
  /usr/lib/liburcu-bp.so.8.1.0 moved to /usr/lib/liburcu-bp.so.8.2.0
  /usr/lib/liburcu-cds.so.8.1.0 moved to /usr/lib/liburcu-cds.so.8.2.0
  /usr/lib/liburcu-common.so.8.1.0 moved to /usr/lib/liburcu-common.so.8.2.0
  /usr/lib/liburcu-mb.so.8.1.0 moved to /usr/lib/liburcu-mb.so.8.2.0
  /usr/lib/liburcu-memb.so.8.1.0 moved to /usr/lib/liburcu-memb.so.8.2.0
  /usr/lib/liburcu-qsbr.so.8.1.0 moved to /usr/lib/liburcu-qsbr.so.8.2.0
  /usr/lib/liburcu.so.8.1.0 moved to /usr/lib/liburcu.so.8.2.0

--===============6767091867909005791==--

