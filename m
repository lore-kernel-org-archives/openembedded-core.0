Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA33C48BF2
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.4626.1704114719392600119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QUVWSntK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MeQYdGHo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018cc527073c-eb6a8528-3467-4942-a62d-52c628caa905-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ewsSGOKJYtLjp8hDEjdGjV5WqUEx/oVTu0vzu0i9vWc=;
	b=QUVWSntKTBmYb23YS/czzRDa4dhctq3npnRfWGGaFMR8r8f7znJOnjJvCtAfy/5I
	yofY++pBiWl332xKwY3XRjzkrSuPXqx08sM/jg18cSJ6/5phfWM4g5r05kKGiW8zN0B
	eMYkm2uJ/X+alj5rZuEoTr+Hqth4IuRUD/tPjktA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ewsSGOKJYtLjp8hDEjdGjV5WqUEx/oVTu0vzu0i9vWc=;
	b=MeQYdGHoQRqDpkFRwi0SnDS/1jvi2BbvMK15A+QKEVnG9b36bjCJ1tnSx9wC0mTN
	Dh2Uij60nbqoEMFaJWuA72WoQRu31vjWitILpIWlaF94pyn9jco/foSwBIGisZ6vBar
	jUfzH3l4MUPwR/VNeFO1NwIJ6cgg0FGarkdsXAqc=
Content-Type: multipart/mixed; boundary="===============4671547815914951637=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.6.3 SUCCEEDED
Message-ID: <0101018cc527073c-eb6a8528-3467-4942-a62d-52c628caa905-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193110

--===============4671547815914951637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.5.3-6.6.3.patch
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
From a5438a323300d7b0ceaae19377fba04101ea8deb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 05:52:02 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.5.3 -> 6.6.3

---
 ...-a-possibility-to-specify-where-python-modules-ar.patch | 7 ++++---
 .../{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb}         | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 5846f04d1a..d452796c4d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From d3adfc21c9cc264bd191722f102963cbc4794259 Mon Sep 17 00:00:00 2001
+From 8e853323ce772ccb708537882b7e3a45e60301a4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -6,15 +6,16 @@ Subject: [PATCH] Add a possibility to specify where python modules are
 
 Upstream-Status: Inappropriate [oe-core specific to solve multilib use case]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 1697794c..8ab38818 100644
+index 374f59b9..ed083f6b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -651,7 +651,7 @@ endif
+@@ -959,7 +959,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
index 873d5e7a14..ef40f553fb 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
+SRCREV = "92e18dbce521789e02057d406769b073d474fa72"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.42.0


--===============4671547815914951637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.6.3-py3.11.egg-info

--===============4671547815914951637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 24925904 to 25012304 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4123002 to 4144114 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5751116 to 5783884 (+1%)
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.5.3" to "6.6.3"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.6.3-py3.11.egg-info

--===============4671547815914951637==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.5.3-6.6.3.patch"

RnJvbSBhNTQzOGEzMjMzMDBkN2IwY2VhYWUxOTM3N2ZiYTA0MTAxZWE4ZGViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNTo1MjowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuNS4zIC0+IDYuNi4zCgotLS0KIC4uLi1hLXBvc3NpYmlsaXR5
LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggfCA3ICsrKystLS0KIC4u
Li97YnRyZnMtdG9vbHNfNi41LjMuYmIgPT4gYnRyZnMtdG9vbHNfNi42LjMuYmJ9ICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYu
NS4zLmJiID0+IGJ0cmZzLXRvb2xzXzYuNi4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3Np
YmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJp
bGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDU4NDZm
MDRkMWEuLmQ0NTI3OTZjNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJm
cy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hl
cmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13
aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDNhZGZj
MjFjOWNjMjY0YmQxOTE3MjJmMTAyOTYzY2JjNDc5NDI1OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOGU4NTMzMjNjZTc3MmNjYjcwODUzNzg4MmI3ZTNhNDVlNjAzMDFhNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3ViamVj
dDogW1BBVENIXSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1
bGVzIGFyZQpAQCAtNiwxNSArNiwxNiBAQCBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmls
aXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1vZHVsZXMgYXJlCiAKIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpYyB0byBzb2x2ZSBtdWx0aWxpYiB1c2Ug
Y2FzZV0KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgorCiAtLS0KICBNYWtlZmlsZSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZp
bGUKLWluZGV4IDE2OTc3OTRjLi44YWIzODgxOCAxMDA2NDQKK2luZGV4IDM3NGY1OWI5Li5lZDA4
M2Y2YiAxMDA2NDQKIC0tLSBhL01ha2VmaWxlCiArKysgYi9NYWtlZmlsZQotQEAgLTY1MSw3ICs2
NTEsNyBAQCBlbmRpZgorQEAgLTk1OSw3ICs5NTksNyBAQCBlbmRpZgogIGlmZXEgKCQoUFlUSE9O
X0JJTkRJTkdTKSwxKQogIGluc3RhbGxfcHl0aG9uOiBsaWJidHJmc3V0aWxfcHl0aG9uCiAgCSQo
USljZCBsaWJidHJmc3V0aWwvcHl0aG9uOyBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi41LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi42LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5
OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRv
b2xzXzYuNS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMv
YnRyZnMtdG9vbHNfNi42LjMuYmIKaW5kZXggODczZDVlN2ExNC4uZWY0MGY1NTNmYiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNS4z
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182
LjYuMy5iYgpAQCAtMTgsNyArMTgsNyBAQCBERVBFTkRTID0gInV0aWwtbGludXggemxpYiIKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tk
YXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRo
b24tbW9kdWxlcy1hci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJhNDVjMzYwYjY0
NjYwNDc3YzcyNmUxOTJkOWU5MmNlYjczYTUwZjgwIgorU1JDUkVWID0gIjkyZTE4ZGJjZTUyMTc4
OWUwMjA1N2Q0MDY3NjliMDczZDQ3NGZhNzIiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBQQUNL
QUdFQ09ORklHID8/PSAiIFwKLS0gCjIuNDIuMAoK

--===============4671547815914951637==--

