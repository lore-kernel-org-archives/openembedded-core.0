Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EA1C5472E
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.75481.1722536822847967021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JgM8WiKC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=c0ffO4GM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101910f320a37-526a3929-216e-4e13-ab83-9b91acfac55c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qrnPbLEKeyZDmvb4oS/4U/Smicbl86E40DF+jl72hJs=;
	b=JgM8WiKCUThRZ2HOryhWkYskL7NyyKa+ukQcqTxDQYCdm7OkrrZ6SXizTKeMId/R
	5xg6xfa4YprGWX6d6tnJFU5ca6rZq73xIS9+JzDyLRL1MgoGT5oLqaAe9K7ZO92zrfb
	MURNaeCRaWdoQQcqueBLZaMNfmo4S3oFsOY+NBi0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qrnPbLEKeyZDmvb4oS/4U/Smicbl86E40DF+jl72hJs=;
	b=c0ffO4GMqZaPD3dSMBbPbgj1Z5W0uurCuhNDeDUEBdsUZCxDHCr+0Y2boKcZSAxA
	q8nuDQpHnPylN+V2LAhGe/fgvKT6MPNevtiKP2LZrRbwPzARDvf2HnWTzuBH9LsSPNC
	yjwk/Qm5MroaDnCdF11IcWh5rrBxGrw9JPLwnGvU=
Content-Type: multipart/mixed; boundary="===============3970702145921545151=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.10 SUCCEEDED
Message-ID: <010101910f320a37-526a3929-216e-4e13-ab83-9b91acfac55c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202781

--===============3970702145921545151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.9.2-6.10.patch
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
From 7b80abce56e19c7c5eeff9a27d007c7e81c79ed8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 09:09:27 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.9.2 -> 6.10

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.9.2.bb => btrfs-tools_6.10.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.9.2.bb => btrfs-tools_6.10.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index ef431cd69a..d5d53fbb86 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 3b9b9b6ac033b44b3864abb1296fce1e19a2b622 Mon Sep 17 00:00:00 2001
+From daccbfbdd3609d7c110f634e222f59f7ff07742c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 82dfb1b4..4968989a 100644
+index c0428c57..1d06ae12 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -984,7 +984,7 @@ endif
+@@ -985,7 +985,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.bb
index 9f5586490d..67c669ecd0 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "b0e5ef4cf7c8b473119e0d487a26b96058e8f80d"
+SRCREV = "0cac9acfc617bd96cc6c296cc680223fe74973a5"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.44.0


--===============3970702145921545151==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.9.2-6.10.patch"

RnJvbSA3YjgwYWJjZTU2ZTE5YzdjNWVlZmY5YTI3ZDAwN2M3ZTgxYzc5ZWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwOTowOToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuOS4yIC0+IDYuMTAKCi0tLQogLi4uZC1hLXBvc3NpYmlsaXR5
LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L3tidHJmcy10b29sc182LjkuMi5iYiA9PiBidHJmcy10b29sc182LjEwLmJifSAgICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYu
OS4yLmJiID0+IGJ0cmZzLXRvb2xzXzYuMTAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmls
aXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggZWY0MzFj
ZDY5YS4uZDVkNTNmYmI4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZz
LXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVy
ZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRy
ZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdo
ZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYjliOWI2
YWMwMzNiNDRiMzg2NGFiYjEyOTZmY2UxZTE5YTJiNjIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBkYWNjYmZiZGQzNjA5ZDdjMTEwZjYzNGUyMjJmNTlmN2ZmMDc3NDJjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1vZHVs
ZXMgYXJlCkBAIC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCi1p
bmRleCA4MmRmYjFiNC4uNDk2ODk4OWEgMTAwNjQ0CitpbmRleCBjMDQyOGM1Ny4uMWQwNmFlMTIg
MTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUKLUBAIC05ODQsNyArOTg0LDcg
QEAgZW5kaWYKK0BAIC05ODUsNyArOTg1LDcgQEAgZW5kaWYKICBpZmVxICgkKFBZVEhPTl9CSU5E
SU5HUyksMSkKICBpbnN0YWxsX3B5dGhvbjogbGliYnRyZnN1dGlsX3B5dGhvbgogIAkkKFEpY2Qg
bGliYnRyZnN1dGlsL3B5dGhvbjsgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuOS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
OS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMt
dG9vbHNfNi4xMC5iYgppbmRleCA5ZjU1ODY0OTBkLi42N2M2NjllY2QwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi45LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTAuYmIK
QEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNfVVJJID0g
ImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2ZS9idHJm
cy1wcm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVs
ZXMtYXIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiYjBlNWVmNGNmN2M4YjQ3MzEx
OWUwZDQ4N2EyNmI5NjA1OGU4ZjgwZCIKK1NSQ1JFViA9ICIwY2FjOWFjZmM2MTdiZDk2Y2M2YzI5
NmNjNjgwMjIzZmU3NDk3M2E1IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJ
RyA/Pz0gIiBcCi0tIAoyLjQ0LjAKCg==

--===============3970702145921545151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/top_level.txt was removed

--===============3970702145921545151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 25107992 to 25402560 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.9.2 [default] to 6.10 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 219002 to 219000 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.9.2 [default] to 6.10 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.9.2 [default] to 6.10 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.9.2 [default] to 6.10 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4192255 to 4208775 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.9.2/cmds -> /usr/src/debug/btrfs-tools/6.10/cmds, directory renamed /usr/src/debug/btrfs-tools/6.9.2/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.10/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.9.2/image -> /usr/src/debug/btrfs-tools/6.10/image, directory renamed /usr/src/debug/btrfs-tools/6.9.2/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.10/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.9.2/mkfs -> /usr/src/debug/btrfs-tools/6.10/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.9.2/convert -> /usr/src/debug/btrfs-tools/6.10/convert, directory renamed /usr/src/debug/btrfs-tools/6.9.2/kernel-lib -> /usr/src/debug/btrfs-tools/6.10/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.9.2/libbtrfs -> /usr/src/debug/btrfs-tools/6.10/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.9.2/check -> /usr/src/debug/btrfs
 -tools/6.10/check, directory renamed /usr/src/debug/btrfs-tools/6.9.2/tune -> /usr/src/debug/btrfs-tools/6.10/tune, directory renamed /usr/src/debug/btrfs-tools/6.9.2/include -> /usr/src/debug/btrfs-tools/6.10/include, directory renamed /usr/src/debug/btrfs-tools/6.9.2/crypto -> /usr/src/debug/btrfs-tools/6.10/crypto, directory renamed /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/6.10/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.9.2 -> /usr/src/debug/btrfs-tools/6.10, removed "/usr/src/debug/btrfs-tools/6.9.2/kernel-shared/tree-checker.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/tree-checker.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.9.2/common/parse-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/parse-utils.h /usr/src/debug/btrfs-tools/6.9.2/common/string-table.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/file-item.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/file-ite
 m.c /usr/src/debug/btrfs-tools/6.9.2/common/string-table.h /usr/src/debug/btrfs-tools/6.9.2/common/device-scan.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/extent_io.c /usr/src/debug/btrfs-tools/6.9.2/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/device-scan.h /usr/src/debug/btrfs-tools/6.9.2/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/extent_io.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/print-tree.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/print-tree.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/accessors.c /usr/src/debug/btrfs-tools/6.9.2/common/messages.h /usr/src/debug/btrfs-tools/6.9.2/common/clear-cache.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/accessors.h /usr/src/debug/btrfs-tools/6.9.2/common/clear-cache.c /usr/src/debug/btrfs-tools/6.9.2/common/messages.c /usr/src/debug/btrfs-tools/6.9
 .2/kernel-shared/locking.h /usr/src/debug/btrfs-tools/6.9.2/common/task-utils.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/locking.c /usr/src/debug/btrfs-tools/6.9.2/common/task-utils.h /usr/src/debug/btrfs-tools/6.9.2/common/open-utils.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/extent-io-tree.h /usr/src/debug/btrfs-tools/6.9.2/common/open-utils.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/extent-io-tree.c /usr/src/debug/btrfs-tools/6.9.2/common/string-utils.h /usr/src/debug/btrfs-tools/6.9.2/common/format-output.c /usr/src/debug/btrfs-tools/6.9.2/common/format-output.h /usr/src/debug/btrfs-tools/6.9.2/common/string-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.9.2/common/units.c /usr/src/debug/btrfs-tools/6.9.2/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.9.2/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6.9.2/common/sysfs-utils.c /usr/src/debug/btrfs-tools/6.
 9.2/common/units.h /usr/src/debug/btrfs-tools/6.9.2/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/misc.h /usr/src/debug/btrfs-tools/6.9.2/common/array.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/uuid-tree.c /usr/src/debug/btrfs-tools/6.9.2/common/array.c /usr/src/debug/btrfs-tools/6.9.2/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/root-tree.c /usr/src/debug/btrfs-tools/6.9.2/common/path-utils.h /usr/src/debug/btrfs-tools/6.9.2/common/path-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/extent-cache.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.9.2/common/extent-cache.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/volumes.c /usr/src/debug/btrfs-tool
 s/6.9.2/kernel-shared/async-thread.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/messages.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/messages.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/async-thread.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/volumes.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/compression.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.9.2/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.9.2/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.9.2/common/send-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/sort-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/send-utils.
 h /usr/src/debug/btrfs-tools/6.9.2/common/sort-utils.h /usr/src/debug/btrfs-tools/6.9.2/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.9.2/common/send-stream.h /usr/src/debug/btrfs-tools/6.9.2/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/send-stream.c /usr/src/debug/btrfs-tools/6.9.2/common/tree-search.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/free-space-tree.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/free-space-tree.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.9.2/common/utils.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/send.h /usr/src/debug/btrfs-tools/6.9.2/common/device-utils.c /usr/src/debug/btrfs-tools/6.9.2/common/help.h /usr/src/debug/btrfs-tools/6.9.2/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.9.2/common/
 utils.h /usr/src/debug/btrfs-tools/6.9.2/common/help.c /usr/src/debug/btrfs-tools/6.9.2/common/device-utils.h", added "/usr/src/debug/btrfs-tools/6.10/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/send.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.10/common/parse-utils.h /usr/src/debug/btrfs-tools/6.10/common/parse-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/misc.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/free-space-tree.h /usr/src/debug/btrfs-tools/6.10/common/send-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/free-space-tree.c /usr/src/debug/btrfs-tools/6.10/common/send-utils.h /usr/src/debug/btrfs-tools/6.10/common/tree-search.h /usr/src/debug/btrfs-tools/6.10/common/un
 its.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6.10/common/units.c /usr/src/debug/btrfs-tools/6.10/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.10/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/messages.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/messages.c /usr/src/debug/btrfs-tools/6.10/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/print-tree.c /usr/src/debug/btrfs-tools/6.10/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/print-tree.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.10/common/array.h /usr/src/debug/btrfs-tools/6.10/common/array.c /usr/src/debug/btrfs-tools/6.10/kernel-sh
 ared/volumes.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/volumes.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.10/common/task-utils.h /usr/src/debug/btrfs-tools/6.10/common/task-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.10/common/format-output.h /usr/src/debug/btrfs-tools/6.10/common/format-output.c /usr/src/debug/btrfs-tools/6.10/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.10/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.10/common/send-stream.h /usr/src/debug/btrfs-tools/6.10/common/send-stream.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/extent-io-tree.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/tree-checker.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/tree-checker.h /usr/src/debug/btrfs-tools/6
 .10/kernel-shared/extent-io-tree.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/uuid-tree.h /usr/src/debug/btrfs-tools/6.10/common/string-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/uuid-tree.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.10/common/string-utils.h /usr/src/debug/btrfs-tools/6.10/common/utils.h /usr/src/debug/btrfs-tools/6.10/common/utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.10/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.10/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/compression.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/extent_io.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/extent_io.h /usr/src/debug/btrfs-tools/6.10/common/clear-cache.h /usr/src/debug/btrfs-tools/6.10/common/help.h /usr/src/debug/btrfs-tools/6.10/common/help.c 
 /usr/src/debug/btrfs-tools/6.10/common/clear-cache.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/file-item.h /usr/src/debug/btrfs-tools/6.10/common/device-utils.h /usr/src/debug/btrfs-tools/6.10/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.10/common/string-table.h /usr/src/debug/btrfs-tools/6.10/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.10/common/device-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/file-item.c /usr/src/debug/btrfs-tools/6.10/common/string-table.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/locking.h /usr/src/debug/btrfs-tools/6.10/common/extent-cache.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/root-tree.c /usr/src/debug/btrfs-tools/6.10/common/extent-cache.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/locking.c /usr/src/debug/btrfs-tools/6.10/common/messages.c /usr/src/debug/btrfs-tools/6.10/common/sort-utils.c /usr/src/debug/btrfs-tools/6.10/common/device-scan.c /usr/src/debug/btrfs-tools/6.10/common/root-tree-utils.c /usr/s
 rc/debug/btrfs-tools/6.10/common/sort-utils.h /usr/src/debug/btrfs-tools/6.10/common/messages.h /usr/src/debug/btrfs-tools/6.10/common/root-tree-utils.h /usr/src/debug/btrfs-tools/6.10/common/device-scan.h /usr/src/debug/btrfs-tools/6.10/common/sysfs-utils.c /usr/src/debug/btrfs-tools/6.10/common/open-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/async-thread.h /usr/src/debug/btrfs-tools/6.10/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/async-thread.c /usr/src/debug/btrfs-tools/6.10/common/open-utils.h /usr/src/debug/btrfs-tools/6.10/common/path-utils.h /usr/src/debug/btrfs-tools/6.10/kernel-shared/accessors.c /usr/src/debug/btrfs-tools/6.10/common/path-utils.c /usr/src/debug/btrfs-tools/6.10/kernel-shared/accessors.h"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.9.2 [default] to 6.10 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.9.2 [default] to 6.10 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5829244 to 5894747 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.9.2 [default] to 6.10 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.9.2" to "6.10"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.9.2 [default] to 6.10 [default]
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.10-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info/top_level.txt was removed

--===============3970702145921545151==--

