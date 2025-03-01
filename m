Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBCEC282DC
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.7050.1740828321365258053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bheShNZS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NQ1Wdvb4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019551742394-5340140f-0df8-4e1f-a6bb-08a9a3c21dd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yJqvGp132IWcdlLQKp9cJaG8kgUNwdemiBNEjTkVV8Q=;
	b=bheShNZSWZthrlcOZcSzlKjiIbpkqINB1Cw+GYnT8lKimfC/XBFR8zOeHPhyzh5k
	rPNNWaj+Svpz0c/bsnnAQHJ5dlUFKP3u3tmIqQeoIrRnaZJF2+2PALj94TuAub+HJca
	1AVqKlt1BvrVrhYJ5mDHGU3EtVgbAWuQTQkP30kA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yJqvGp132IWcdlLQKp9cJaG8kgUNwdemiBNEjTkVV8Q=;
	b=NQ1Wdvb4Kie68OW05/luoG4zqAu7bqYjl6A6vNPJ9pH9Vu2Yw0FTeGqcI0Tt4U8U
	o8T0FTrVSOs67RyQgR22J89qtbcArd2AS6M/XtsVB02vCAAvq7x/mjmpV6dn2qj1hx1
	tmTJ9b7y3uzhgGdeyeyMrEVLC19pLK8Gy41k5ff0=
Content-Type: multipart/mixed; boundary="===============5152474559186906013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.13 SUCCEEDED
Message-ID: <0101019551742394-5340140f-0df8-4e1f-a6bb-08a9a3c21dd9-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212110

--===============5152474559186906013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.12-6.13.patch
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
From ca3cc8a33dcfd96e4c6b6c3539f306a442ec87c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 07:15:46 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.12 -> 6.13

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.12.bb => btrfs-tools_6.13.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.12.bb => btrfs-tools_6.13.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 59ea5a66da..ca152133f8 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 76e635a56c5973671da3a8a2fd4fc32e823bf8c9 Mon Sep 17 00:00:00 2001
+From 1a005b31777b695f1509db5a46e7be2f73eb67a3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 2f8d2fa0..c760e5ae 100644
+index 7e36aa42..edff7d5b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -985,7 +985,7 @@ endif
+@@ -996,7 +996,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
index 3c0bb81f75..895002010c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "85ca0a6d60c14eefda509970a26616ff16115612"
+SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.44.1


--===============5152474559186906013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.12-6.13.patch"

RnJvbSBjYTNjYzhhMzNkY2ZkOTZlNGM2YjZjMzUzOWYzMDZhNDQyZWM4N2MxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNzoxNTo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMTIgLT4gNi4xMwoKLS0tCiAuLi5kLWEtcG9zc2liaWxpdHkt
dG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCB8IDYgKysrLS0tCiAuLi4v
e2J0cmZzLXRvb2xzXzYuMTIuYmIgPT4gYnRyZnMtdG9vbHNfNi4xMy5iYn0gICAgICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi4x
Mi5iYiA9PiBidHJmcy10b29sc182LjEzLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmls
aXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0
eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDU5ZWE1YTY2
ZGEuLmNhMTUyMTMzZjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10
b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUt
cHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZz
LXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVy
ZS1weXRob24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzZlNjM1YTU2
YzU5NzM2NzFkYTNhOGEyZmQ0ZmMzMmU4MjNiZjhjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMWEwMDViMzE3NzdiNjk1ZjE1MDlkYjVhNDZlN2JlMmY3M2ViNjdhMyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3ViamVjdDog
W1BBVENIXSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1bGVz
IGFyZQpAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5k
ZXggMmY4ZDJmYTAuLmM3NjBlNWFlIDEwMDY0NAoraW5kZXggN2UzNmFhNDIuLmVkZmY3ZDViIDEw
MDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtOTg1LDcgKzk4NSw3IEBA
IGVuZGlmCitAQCAtOTk2LDcgKzk5Niw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05fQklORElO
R1MpLDEpCiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChRKWNkIGxp
YmJ0cmZzdXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29sc182LjEyLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTMuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjEzLmJiCmluZGV4IDNjMGJiODFmNzUuLjg5NTAwMjAxMGMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjEyLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjEzLmJiCkBAIC0x
OCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29s
PWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3Bl
Y2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JF
ViA9ICI4NWNhMGE2ZDYwYzE0ZWVmZGE1MDk5NzBhMjY2MTZmZjE2MTE1NjEyIgorU1JDUkVWID0g
IjI2ZTRkOTE3NGM3MGFhYzBlNTNjM2I1ZGU1NWNmMTU5ZjhkOTM5N2YiCiBTID0gIiR7V09SS0RJ
Un0vZ2l0IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKLS0gCjIuNDQuMQoK

--===============5152474559186906013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27082560 to 26978568 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 166841 to 166883 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4176305 to 4215056 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5938684 to 5860772 (-1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.12" to "6.13"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.12 [default] to 6.13 [default]
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.12-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.13-py3.13.egg-info

--===============5152474559186906013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.12-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.13-py3.13.egg-info

--===============5152474559186906013==--

