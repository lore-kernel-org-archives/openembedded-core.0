Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3147AEEEC06
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.29461.1694804392269737438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BwVStOd+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CMaqDJje;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a9a36bfe8-44d0084d-bb5b-4ba1-b4fd-c05c83bae5e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h8DTH6f1e9MduOn5/UkJwUbPrKqctHNQTavjHJCQ/DM=;
	b=BwVStOd+azl9QKX0+RPW1Q5roWHb6oS44RPlkCUn9mK5Xz+pfG0YwcsgeirQlDdw
	/ueGyoLJRlKG+AzNecuyDvruhljkNTZfepOKtmeveXUmhgSaZf2RgZ+y3xjGrii4WtR
	Pyt0rOuAm+f5qkyf4XitXJNhd+yTfbYsVqpEkkuA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h8DTH6f1e9MduOn5/UkJwUbPrKqctHNQTavjHJCQ/DM=;
	b=CMaqDJje51kyZL/kraObSD4lOoPuHCtyLIXRm6ohC+XDXL4V84m1uUimh9YrdFEL
	XbYGDMem1eVbofJOzTK5KGIQbR1AxFRbPyo646koMcctSKQPHf00U+At8d9vBtKx4DU
	mOEgZJ2fG+hmmGZ/Lkuvhfn9mxzSvQhxy4tzc7ww=
Content-Type: multipart/mixed; boundary="===============9104584561493538584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.5 SUCCEEDED
Message-ID: <0101018a9a36bfe8-44d0084d-bb5b-4ba1-b4fd-c05c83bae5e3-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187721

--===============9104584561493538584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.3-6.5.patch
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
From 2b8b49992e2d03bcf36bf209b67f4d021d87f207 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 12:22:07 +0000
Subject: [PATCH] ethtool: upgrade 6.3 -> 6.5

---
 .../ethtool/ethtool/avoid_parallel_tests.patch            | 8 ++++----
 .../ethtool/{ethtool_6.3.bb => ethtool_6.5.bb}            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.3.bb => ethtool_6.5.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 5e9024834c..409c8de685 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 08f887f4bc65684397bf8ec30cc61d91d894deac Mon Sep 17 00:00:00 2001
+From 0c77437267601d40d7ce9efd87eb4b82a5675d2f Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,12 +15,12 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c1e0012..c460398 100644
+index 11efb99..b5ce018 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 6.3, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.5, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
+ AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
 +AM_INIT_AUTOMAKE([gnu subdir-objects serial-tests])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.3.bb b/meta/recipes-extended/ethtool/ethtool_6.5.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.3.bb
rename to meta/recipes-extended/ethtool/ethtool_6.5.bb
index 504e645966..ef925e16b9 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.3.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "342d37d3fe19da79d0276c4c69c34c61f1ad8f87b06514d664bf1eeb29bfd525"
+SRC_URI[sha256sum] = "aed41ca58b3129126f18429172064d214191d7e7ef52c6e3f6b2ff7503706c03"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.39.2


--===============9104584561493538584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.3-6.5.patch"

RnJvbSAyYjhiNDk5OTJlMmQwM2JjZjM2YmYyMDliNjdmNGQwMjFkODdmMjA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTI6MjI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuMyAtPiA2LjUKCi0tLQogLi4uL2V0aHRvb2wvZXRodG9vbC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAgICAgIHwgOCArKysrLS0tLQogLi4uL2V0aHRv
b2wve2V0aHRvb2xfNi4zLmJiID0+IGV0aHRvb2xfNi41LmJifSAgICAgICAgICAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wve2V0aHRvb2xfNi4zLmJiID0+IGV0aHRvb2xf
Ni41LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29s
L2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IDVlOTAy
NDgzNGMuLjQwOWM4ZGU2ODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMDhmODg3ZjRiYzY1Njg0Mzk3YmY4ZWMzMGNjNjFkOTFkODk0ZGVh
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGM3NzQzNzI2NzYwMWQ0MGQ3Y2U5ZWZk
ODdlYjRiODJhNTY3NWQyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZs
b3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAxNCAxODo1
OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRlc3RzIGNv
bmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC0xNSwxMiArMTUsMTIgQEAgVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4
IGMxZTAwMTIuLmM0NjAzOTggMTAwNjQ0CitpbmRleCAxMWVmYjk5Li5iNWNlMDE4IDEwMDY0NAog
LS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0yLDcgKzIsNyBAQCBk
bmwgUHJvY2VzcyB0aGlzIGZpbGUgd2l0aCBhdXRvY29uZiB0byBwcm9kdWNlIGEgY29uZmlndXJl
IHNjcmlwdC4KLSBBQ19JTklUKGV0aHRvb2wsIDYuMywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZykK
K0BAIC0zLDcgKzMsNyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuNSwgbmV0ZGV2QHZnZXIua2VybmVs
Lm9yZykKICBBQ19QUkVSRVEoMi41MikKKyBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCiAgQUNf
Q09ORklHX1NSQ0RJUihbZXRodG9vbC5jXSkKIC1BTV9JTklUX0FVVE9NQUtFKFtnbnUgc3ViZGly
LW9iamVjdHNdKQogK0FNX0lOSVRfQVVUT01BS0UoW2dudSBzdWJkaXItb2JqZWN0cyBzZXJpYWwt
dGVzdHNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9v
bF82LjMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuNS5iYgpz
aW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sXzYuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRv
b2wvZXRodG9vbF82LjUuYmIKaW5kZXggNTA0ZTY0NTk2Ni4uZWY5MjVlMTZiOSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjUuYmIKQEAgLTExLDcgKzExLDcg
QEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L3NvZnR3YXJlL25ldHdvcmsvZXRodG9v
bC9ldGh0b29sLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxl
bF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM0
MmQzN2QzZmUxOWRhNzlkMDI3NmM0YzY5YzM0YzYxZjFhZDhmODdiMDY1MTRkNjY0YmYxZWViMjli
ZmQ1MjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWVkNDFjYTU4YjMxMjkxMjZmMTg0MjkxNzIw
NjRkMjE0MTkxZDdlN2VmNTJjNmUzZjZiMmZmNzUwMzcwNmMwMyIKIAogVVBTVFJFQU1fQ0hFQ0tf
VVJJID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvZXRodG9v
bC8iCiAKLS0gCjIuMzkuMgoK

--===============9104584561493538584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3777336 to 3814192 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 47818 to 47992 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1598742 to 1643234 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1362532 to 1389110 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/6.3-r0/uapi/linux -> /usr/src/debug/ethtool/6.5-r0/uapi/linux, directory renamed /usr/src/debug/ethtool/6.3-r0/netlink -> /usr/src/debug/ethtool/6.5-r0/netlink, directory renamed /usr/src/debug/ethtool/6.3-r0/uapi/linux/hdlc -> /usr/src/debug/ethtool/6.5-r0/uapi/linux/hdlc, removed "/usr/src/debug/ethtool/6.3-r0/list.h /usr/src/debug/ethtool/6.3-r0/json_print.h /usr/src/debug/ethtool/6.3-r0/tg3.c /usr/src/debug/ethtool/6.3-r0/dsa.c /usr/src/debug/ethtool/6.3-r0/json_print.c /usr/src/debug/ethtool/6.3-r0/stmmac.c /usr/src/debug/ethtool/6.3-r0/et131x.c /usr/src/debug/ethtool/6.3-r0/vmxnet3.c /usr/src/debug/ethtool/6.3-r0/ixgbe.c /usr/src/debug/ethtool/6.3-r0/fsl_enetc.c /usr/src/debug/ethtool/6.3-r0/de2104x.c /usr/src/debug/ethtool/6.3-r0/sfpdiag.c /usr/src/debug/ethtool/6.3-r0/tse.c /usr/src/debug/ethtool/6.3-r0/lan78xx.c /usr/src/debug/ethtool/6.3-r0/ixgb.c /usr/src/debug/ethtool/6.3-
 r0/bnxt.c /usr/src/debug/ethtool/6.3-r0/fjes.c /usr/src/debug/ethtool/6.3-r0/at76c50x-usb.c /usr/src/debug/ethtool/6.3-r0/fec.c /usr/src/debug/ethtool/6.3-r0/igc.c /usr/src/debug/ethtool/6.3-r0/json_writer.c /usr/src/debug/ethtool/6.3-r0/sfc.c /usr/src/debug/ethtool/6.3-r0/igb.c /usr/src/debug/ethtool/6.3-r0/sfpid.c /usr/src/debug/ethtool/6.3-r0/test-common.c /usr/src/debug/ethtool/6.3-r0/json_writer.h /usr/src/debug/ethtool/6.3-r0/e100.c /usr/src/debug/ethtool/6.3-r0/e1000.c /usr/src/debug/ethtool/6.3-r0/cmis.c /usr/src/debug/ethtool/6.3-r0/rxclass.c /usr/src/debug/ethtool/6.3-r0/qsfp.c /usr/src/debug/ethtool/6.3-r0/pcnet32.c /usr/src/debug/ethtool/6.3-r0/cpsw.c /usr/src/debug/ethtool/6.3-r0/cmis.h /usr/src/debug/ethtool/6.3-r0/vioc.c /usr/src/debug/ethtool/6.3-r0/amd8111e.c /usr/src/debug/ethtool/6.3-r0/natsemi.c /usr/src/debug/ethtool/6.3-r0/realtek.c /usr/src/debug/ethtool/6.3-r0/common.c /usr/src/debug/ethtool/6.3-r0/lan743x.c /usr/src/debug/ethtool/6.3-r0/ixgbevf.c /usr/src/de
 bug/ethtool/6.3-r0/ethtool.c /usr/src/debug/ethtool/6.3-r0/common.h /usr/src/debug/ethtool/6.3-r0/internal.h /usr/src/debug/ethtool/6.3-r0/marvell.c /usr/src/debug/ethtool/6.3-r0/ibm_emac.c /usr/src/debug/ethtool/6.3-r0/fec_8xx.c /usr/src/debug/ethtool/6.3-r0/sff-common.c /usr/src/debug/ethtool/6.3-r0/test-cmdline.c /usr/src/debug/ethtool/6.3-r0/smsc911x.c /usr/src/debug/ethtool/6.3-r0/sff-common.h", added "/usr/src/debug/ethtool/6.5-r0/json_print.h /usr/src/debug/ethtool/6.5-r0/tg3.c /usr/src/debug/ethtool/6.5-r0/dsa.c /usr/src/debug/ethtool/6.5-r0/json_print.c /usr/src/debug/ethtool/6.5-r0/stmmac.c /usr/src/debug/ethtool/6.5-r0/et131x.c /usr/src/debug/ethtool/6.5-r0/vmxnet3.c /usr/src/debug/ethtool/6.5-r0/ixgbe.c /usr/src/debug/ethtool/6.5-r0/fsl_enetc.c /usr/src/debug/ethtool/6.5-r0/de2104x.c /usr/src/debug/ethtool/6.5-r0/hns3.c /usr/src/debug/ethtool/6.5-r0/sfpdiag.c /usr/src/debug/ethtool/6.5-r0/tse.c /usr/src/debug/ethtool/6.5-r0/lan78xx.c /usr/src/debug/ethtool/6.5-r0/list.h 
 /usr/src/debug/ethtool/6.5-r0/ixgb.c /usr/src/debug/ethtool/6.5-r0/bnxt.c /usr/src/debug/ethtool/6.5-r0/fjes.c /usr/src/debug/ethtool/6.5-r0/at76c50x-usb.c /usr/src/debug/ethtool/6.5-r0/fec.c /usr/src/debug/ethtool/6.5-r0/igc.c /usr/src/debug/ethtool/6.5-r0/json_writer.c /usr/src/debug/ethtool/6.5-r0/sfc.c /usr/src/debug/ethtool/6.5-r0/igb.c /usr/src/debug/ethtool/6.5-r0/sfpid.c /usr/src/debug/ethtool/6.5-r0/test-common.c /usr/src/debug/ethtool/6.5-r0/json_writer.h /usr/src/debug/ethtool/6.5-r0/e100.c /usr/src/debug/ethtool/6.5-r0/e1000.c /usr/src/debug/ethtool/6.5-r0/cmis.c /usr/src/debug/ethtool/6.5-r0/rxclass.c /usr/src/debug/ethtool/6.5-r0/qsfp.c /usr/src/debug/ethtool/6.5-r0/pcnet32.c /usr/src/debug/ethtool/6.5-r0/cpsw.c /usr/src/debug/ethtool/6.5-r0/cmis.h /usr/src/debug/ethtool/6.5-r0/vioc.c /usr/src/debug/ethtool/6.5-r0/amd8111e.c /usr/src/debug/ethtool/6.5-r0/natsemi.c /usr/src/debug/ethtool/6.5-r0/realtek.c /usr/src/debug/ethtool/6.5-r0/common.c /usr/src/debug/ethtool/6.5-
 r0/lan743x.c /usr/src/debug/ethtool/6.5-r0/ixgbevf.c /usr/src/debug/ethtool/6.5-r0/ethtool.c /usr/src/debug/ethtool/6.5-r0/common.h /usr/src/debug/ethtool/6.5-r0/internal.h /usr/src/debug/ethtool/6.5-r0/marvell.c /usr/src/debug/ethtool/6.5-r0/ibm_emac.c /usr/src/debug/ethtool/6.5-r0/fec_8xx.c /usr/src/debug/ethtool/6.5-r0/sff-common.c /usr/src/debug/ethtool/6.5-r0/test-cmdline.c /usr/src/debug/ethtool/6.5-r0/smsc911x.c /usr/src/debug/ethtool/6.5-r0/sff-common.h"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 617200 to 637680 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 6.3 [default] to 6.5 [default]
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.3.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.5.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PV changed from "6.3" to "6.5"
packages/core2-32-poky-linux/ethtool: PKGV changed from 6.3 [default] to 6.5 [default]

--===============9104584561493538584==--

