Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC24D10DB0
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.149800.1733047556582687056
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AAbkhBEI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WaljCsnB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019381af1688-0f4d4cd3-a255-458f-843b-6cb64083734c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qO+QPnbPnasGIj0UAbTZ5OCJZ57jx12NTCmvqrnT7Dw=;
	b=AAbkhBEIoobOQsIvrIl9/eQ+RtUIJOytQx0HtwdwRwd6ZVwtWmv7Akzfdn0V1KS2
	5xxB5oO0krxiWg7IABmuE1f4IdjYEs/cTzuiMXDG6O5EAGNs37WpGFCFieXIwXU88dG
	fqyO/XyQalQ7NFd6Y5VaetBH6raCnyJsS9LRuKJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qO+QPnbPnasGIj0UAbTZ5OCJZ57jx12NTCmvqrnT7Dw=;
	b=WaljCsnBpecMgPwCJew6AjGLYMRMSN755RUq+4nwU2uJ2j4KKKjBkl85E3edZPRZ
	ggNdPUoYNBO1PpvSDMLl5nNPBCRSmiB2dVMfm1POsKSmTMlYGDvhNb4HEbxDLBvmvVM
	ORmVq9tASRRWc3Tp+Wd2pSjvHpx5cVFazYcZVEqc=
Content-Type: multipart/mixed; boundary="===============8317657009547635352=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.12 SUCCEEDED
Message-ID: <0101019381af1688-0f4d4cd3-a255-458f-843b-6cb64083734c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208064

--===============8317657009547635352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.10.1-6.12.patch
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
From 29e07a385e59aeedf7203225053b2e19e77a16d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 06:48:25 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.10.1 -> 6.12

---
 ...1-Add-a-possibility-to-specify-where-python-modules-ar.patch | 2 +-
 .../btrfs-tools/{btrfs-tools_6.10.1.bb => btrfs-tools_6.12.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.10.1.bb => btrfs-tools_6.12.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index fbd1b05a7f..fb4efb41a5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From cb7f8a6c3538ee3086d15c4d2c9f2a2f4f38db3b Mon Sep 17 00:00:00 2001
+From 3c2c386b96d581d6aa80915ba54a65f6e37a6490 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
index f37272d7ab..c1a73dd957 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a00c2b25474b5306ef29a790adb5fd5afbaba9a2"
+SRCREV = "85ca0a6d60c14eefda509970a26616ff16115612"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.44.1


--===============8317657009547635352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.10-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.12-py3.13.egg-info

--===============8317657009547635352==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.10.1-6.12.patch"

RnJvbSAyOWUwN2EzODVlNTlhZWVkZjcyMDMyMjUwNTNiMmUxOWU3N2ExNmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNjo0ODoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMTAuMSAtPiA2LjEyCgotLS0KIC4uLjEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCB8IDIgKy0KIC4u
Li9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi4xMC4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuMTIu
YmJ9ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9v
bHNfNi4xMC4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuMTIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEt
cG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBv
c3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXgg
ZmJkMWIwNWE3Zi4uZmI0ZWZiNDFhNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lm
eS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVj
aWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBj
YjdmOGE2YzM1MzhlZTMwODZkMTVjNGQyYzlmMmEyZjRmMzhkYjNiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAzYzJjMzg2Yjk2ZDU4MWQ2YWE4MDkxNWJhNTRhNjVmNmUzN2E2NDkwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9u
IG1vZHVsZXMgYXJlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9v
bHMvYnRyZnMtdG9vbHNfNi4xMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRv
b2xzL2J0cmZzLXRvb2xzXzYuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTAuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
MTIuYmIKaW5kZXggZjM3MjcyZDdhYi4uYzFhNzNkZDk1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTAuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xMi5iYgpAQCAtMTgs
NyArMTgsNyBAQCBERVBFTkRTID0gInV0aWwtbGludXggemxpYiIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0cmZzLXByb2dz
LmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5w
YXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJhMDBjMmIyNTQ3NGI1MzA2ZWYyOWE3OTBh
ZGI1ZmQ1YWZiYWJhOWEyIgorU1JDUkVWID0gIjg1Y2EwYTZkNjBjMTRlZWZkYTUwOTk3MGEyNjYx
NmZmMTYxMTU2MTIiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBQQUNLQUdFQ09ORklHID8/PSAi
IFwKLS0gCjIuNDQuMQoK

--===============8317657009547635352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 25439064 to 25489488 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.10.1" to "6.12"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 166845 to 166841 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.10.1" to "6.12"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.10.1" to "6.12"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.10.1" to "6.12"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4196805 to 4219049 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.10.1" to "6.12"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.10.1" to "6.12"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5911131 to 5938576 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.10.1" to "6.12"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.10.1 [default] to 6.12 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.10.1" to "6.12"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.10-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.12-py3.13.egg-info

--===============8317657009547635352==--

