Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8AFC54ED3
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2095.1706810405189795237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ebDRTNqI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UkCAtbtE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d65d3ed47-e1433af0-2f65-4d71-a694-3e2281c4185f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qoA0hOjd72NzIrEOjHPFnzEMZy3obyXCQcd1yyv539w=;
	b=ebDRTNqI735JhzYFHTyaT/9hQCc1dgbjEY5jDAwy4M5qxHfBcvPVF+uKfCt9zag2
	ri4XfRVXVqfimsH3oru467NrQDCi2jHHnEUwZCncVORLD3BizNJh9egz5TMzNfxFrpf
	IvOh6RG6GyTrF36IdYQPOUTFzP+BZkxMHB3Ag63A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qoA0hOjd72NzIrEOjHPFnzEMZy3obyXCQcd1yyv539w=;
	b=UkCAtbtEgEn1l+HSVAWzaDYqpN2clXUIIw7SKkPH5EoOJ9HsKdl2nd5VnMr+hDub
	ILAD3ncACGhCOCQWp0ILrHh/lkhsr0pD+mUVHfyaJnAEomestqcPj1axoQ6IR+p/CQ+
	U8MIbK+Zi2KALB85xGd084kG6NDkNlzPfi3xMlMs=
Content-Type: multipart/mixed; boundary="===============8433492218979979666=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.7 SUCCEEDED
Message-ID: <0101018d65d3ed47-e1433af0-2f65-4d71-a694-3e2281c4185f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194613

--===============8433492218979979666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.5.3-6.7.patch
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
From 5801ab2df18ab35a5cc3aff35cf94b1b160a9bcb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 06:26:09 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.5.3 -> 6.7

---
 ...-a-possibility-to-specify-where-python-modules-ar.patch | 7 ++++---
 .../{btrfs-tools_6.5.3.bb => btrfs-tools_6.7.bb}           | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.7.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 5846f04d1a..7806b5b261 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From d3adfc21c9cc264bd191722f102963cbc4794259 Mon Sep 17 00:00:00 2001
+From 18340b736441a9fa05210307c944b6f2f091a064 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.bb
index 6455efd1bc..0456a36d05 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
+SRCREV = "a42b07077f3897a8bc4d8b993596e83e930d1d35"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.42.0


--===============8433492218979979666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/top_level.txt was removed

--===============8433492218979979666==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.5.3-6.7.patch"

RnJvbSA1ODAxYWIyZGYxOGFiMzVhNWNjM2FmZjM1Y2Y5NGIxYjE2MGE5YmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNjoyNjowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuNS4zIC0+IDYuNwoKLS0tCiAuLi4tYS1wb3NzaWJpbGl0eS10
by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgNyArKysrLS0tCiAuLi4v
e2J0cmZzLXRvb2xzXzYuNS4zLmJiID0+IGJ0cmZzLXRvb2xzXzYuNy5iYn0gICAgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182LjUu
My5iYiA9PiBidHJmcy10b29sc182LjcuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxp
dHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5
LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggNTg0NmYwNGQx
YS4uNzgwNmI1YjI2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRv
b2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1w
eXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMt
dG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJl
LXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkM2FkZmMyMWM5
Y2MyNjRiZDE5MTcyMmYxMDI5NjNjYmM0Nzk0MjU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSAxODM0MGI3MzY0NDFhOWZhMDUyMTAzMDdjOTQ0YjZmMmYwOTFhMDY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1vZHVsZXMg
YXJlCkBAIC02LDE1ICs2LDE2IEBAIFN1YmplY3Q6IFtQQVRDSF0gQWRkIGEgcG9zc2liaWxpdHkg
dG8gc3BlY2lmeSB3aGVyZSBweXRob24gbW9kdWxlcyBhcmUKIAogVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljIHRvIHNvbHZlIG11bHRpbGliIHVzZSBjYXNl
XQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CisKIC0tLQogIE1ha2VmaWxlIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQot
aW5kZXggMTY5Nzc5NGMuLjhhYjM4ODE4IDEwMDY0NAoraW5kZXggMzc0ZjU5YjkuLmVkMDgzZjZi
IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtNjUxLDcgKzY1MSw3
IEBAIGVuZGlmCitAQCAtOTU5LDcgKzk1OSw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05fQklO
RElOR1MpLDEpCiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChRKWNk
IGxpYmJ0cmZzdXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9idHJmcy10b29scy9idHJmcy10b29sc182LjUuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9idHJmcy10b29scy9idHJmcy10b29sc182LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
NS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMt
dG9vbHNfNi43LmJiCmluZGV4IDY0NTVlZmQxYmMuLjA0NTZhMzZkMDUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjUuMy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi43LmJiCkBA
IC0xOCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2RhdmUvYnRyZnMt
cHJvZ3MuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVz
LWFyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImE0NWMzNjBiNjQ2NjA0NzdjNzI2
ZTE5MmQ5ZTkyY2ViNzNhNTBmODAiCitTUkNSRVYgPSAiYTQyYjA3MDc3ZjM4OTdhOGJjNGQ4Yjk5
MzU5NmU4M2U5MzBkMWQzNSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tBR0VDT05GSUcg
Pz89ICIgXAotLSAKMi40Mi4wCgo=

--===============8433492218979979666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.5.3 [default] to 6.7 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 24927496 to 25027400 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.5.3 [default] to 6.7 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208146 to 208142 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.5.3 [default] to 6.7 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.5.3 [default] to 6.7 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.5.3 [default] to 6.7 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4123002 to 4150855 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.5.3 [default] to 6.7 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.7 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5751124 to 5787986 (+1%)
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.5.3" to "6.7"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.7 [default]
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.5.3-py3.12.egg-info/top_level.txt was removed

--===============8433492218979979666==--

