Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DED3CD6E71
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1566.1780328135645243064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NZJnuhfr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qA0re049;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e83d37776-bb5c92f3-4ab4-4a14-8e03-ca05bc8ffa87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hbmlf26uPW1z88IPUIqYM1/F38TOmH3X/kgVJ19UYic=;
	b=NZJnuhfraLBCnUzh6GZ81Ia56hy19fBmnaWcbJRsTsMTIu05FrkjjIbArB14EEZR
	iYd6k7lC+wQIjMGci58Urw4EGg/lV+0hEVcBWVcaGjbEB1u5oj9mCdNpOcDx6pc+s88
	ivRwrabaG3UPfg3+Z1UFab2w/lMtwk7fTpVAuLUU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hbmlf26uPW1z88IPUIqYM1/F38TOmH3X/kgVJ19UYic=;
	b=qA0re0490W+HW3B/RPhYW3gSKSqqQXeNTP1RQ4mlYvPr3nzUN2/XdaH9p0SPvNtL
	Bo2ptYc47lKq5qKO5QW3OXDNAuHLTWxcKyAXrEIcsmch8kG6MeWSt3njgg4mIXyrJS/
	BYZDvpmt7BlI5dfZQmrEO+RGbqpa630SlWAr1Aps=
Content-Type: multipart/mixed; boundary="===============0084766126374611324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 7.0 SUCCEEDED
Message-ID: <0101019e83d37776-bb5c92f3-4ab4-4a14-8e03-ca05bc8ffa87-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237870

--===============0084766126374611324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.19.1-7.0.patch
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
From f1346cd0e79568dc9b8c66c8540c56f8c15068c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:40:36 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.19.1 -> 7.0

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.19.1.bb => btrfs-tools_7.0.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.19.1.bb => btrfs-tools_7.0.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 7272c27c6c..9989b22a87 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
+From cb803a173ed182014676d492f25551a5e3e82bd2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 96c11830..3f2585cb 100644
+index 4f471ff4..2bcfbf63 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -997,7 +997,7 @@ endif
+@@ -995,7 +995,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
index dee1270fa0..72b5575703 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "fa79dbea32d39ac0ae41a88a079013c7ad2a8a58"
+SRCREV = "9c5987432906daebde23f9703c0f6f90c35fa9da"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============0084766126374611324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/dependency_links.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/PKG-INFO was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/SOURCES.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/top_level.txt was removed

--===============0084766126374611324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.19.1-7.0.patch"

RnJvbSBmMTM0NmNkMGU3OTU2OGRjOWI4YzY2Yzg1NDBjNTZmOGMxNTA2OGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzo0MDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMTkuMSAtPiA3LjAKCi0tLQogLi4uZC1hLXBvc3NpYmlsaXR5
LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L3tidHJmcy10b29sc182LjE5LjEuYmIgPT4gYnRyZnMtdG9vbHNfNy4wLmJifSAgICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYu
MTkuMS5iYiA9PiBidHJmcy10b29sc183LjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmls
aXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggNzI3MmMy
N2M2Yy4uOTk4OWIyMmE4NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZz
LXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVy
ZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRy
ZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdo
ZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZWRjZWU1
NzA3ODc2OWI3NzUyMjc1ZTBlNWYzNWFlZmJmZWZjOWViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBjYjgwM2ExNzNlZDE4MjAxNDY3NmQ0OTJmMjU1NTFhNWUzZTgyYmQyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1vZHVs
ZXMgYXJlCkBAIC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCi1p
bmRleCA5NmMxMTgzMC4uM2YyNTg1Y2IgMTAwNjQ0CitpbmRleCA0ZjQ3MWZmNC4uMmJjZmJmNjMg
MTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUKLUBAIC05OTcsNyArOTk3LDcg
QEAgZW5kaWYKK0BAIC05OTUsNyArOTk1LDcgQEAgZW5kaWYKICBpZmVxICgkKFBZVEhPTl9CSU5E
SU5HUyksMSkKICBpbnN0YWxsX3B5dGhvbjogbGliYnRyZnN1dGlsX3B5dGhvbgogIAkkKFEpY2Qg
bGliYnRyZnN1dGlsL3B5dGhvbjsgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTkuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9idHJmcy10b29scy9idHJmcy10b29sc183LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
MTkuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZz
LXRvb2xzXzcuMC5iYgppbmRleCBkZWUxMjcwZmEwLi43MmI1NTc1NzAzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xOS4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc183LjAuYmIK
QEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20va2RhdmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJv
dG9jb2w9aHR0cHM7dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBv
c3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNSRVYgPSAiZmE3OWRiZWEzMmQzOWFjMGFlNDFhODhhMDc5MDEzYzdhZDJh
OGE1OCIKK1NSQ1JFViA9ICI5YzU5ODc0MzI5MDZkYWViZGUyM2Y5NzAzYzBmNmY5MGMzNWZhOWRh
IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKICAgICBwcm9ncmFtcyBcCi0tIAoyLjQ3LjEKCg==

--===============0084766126374611324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27790624 to 27852248 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 166890 to 166884 (-0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.19.1 -> /usr/src/debug/btrfs-tools/7.0, directory renamed /usr/src/debug/btrfs-tools/6.19.1/crypto -> /usr/src/debug/btrfs-tools/7.0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.19.1/mkfs -> /usr/src/debug/btrfs-tools/7.0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.19.1/check -> /usr/src/debug/btrfs-tools/7.0/check, directory renamed /usr/src/debug/btrfs-tools/6.19.1/common -> /usr/src/debug/btrfs-tools/7.0/common, directory renamed /usr/src/debug/btrfs-tools/6.19.1/libbtrfs -> /usr/src/debug/btrfs-tools/7.0/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.19.1/convert -> /usr/src/debug/btrfs-tools/7.0/convert, directory renamed /usr/src/debug/btrfs-tools/6.19.1/image -> /usr/src/debug/btrfs-tools/7.0/image, directory renamed /usr/src/debug/btrfs-tools/6.19.1/libbtrfsutil -> /usr/src/debug/btrfs-tools/7.0/libbtrfsutil, directory renamed /usr/s
 rc/debug/btrfs-tools/6.19.1/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/7.0/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.19.1/kernel-shared -> /usr/src/debug/btrfs-tools/7.0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.19.1/cmds -> /usr/src/debug/btrfs-tools/7.0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.19.1/kernel-lib -> /usr/src/debug/btrfs-tools/7.0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.19.1/include -> /usr/src/debug/btrfs-tools/7.0/include, removed "/usr/src/debug/btrfs-tools/6.19.1/tune/main.c /usr/src/debug/btrfs-tools/6.19.1/tune/seeding.c /usr/src/debug/btrfs-tools/6.19.1/tune/change-csum.c /usr/src/debug/btrfs-tools/6.19.1/tune/quota.c /usr/src/debug/btrfs-tools/6.19.1/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/6.19.1/tune/tune.h /usr/src/debug/btrfs-tools/6.19.1/tune/convert-bgt.c /usr/src/debug/btrfs-tools/6.19.1/tune/change-uuid.c", added "/usr/src/debug/btrfs-tools/7.0/tune/quota.c /
 usr/src/debug/btrfs-tools/7.0/tune/convert-remap-tree.c /usr/src/debug/btrfs-tools/7.0/tune/seeding.c /usr/src/debug/btrfs-tools/7.0/tune/change-uuid.c /usr/src/debug/btrfs-tools/7.0/tune/change-csum.c /usr/src/debug/btrfs-tools/7.0/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/7.0/tune/tune.h /usr/src/debug/btrfs-tools/7.0/tune/convert-bgt.c /usr/src/debug/btrfs-tools/7.0/tune/main.c"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4317762 to 4327127 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6078699 to 6107368 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.19.1 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.0 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/dependency_links.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/PKG-INFO was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/SOURCES.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/top_level.txt was removed

--===============0084766126374611324==--

