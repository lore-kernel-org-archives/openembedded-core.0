Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DDBC27C75
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.42221.1717263219084996612
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=URp9PLq3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EwVRlUs9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018fd4dd3780-31793762-c58c-4e6a-bc2b-011e9dbffa81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GsDJQ2cr721elshfVZF7IrBvxHMdSmISQkD8NMgPdq0=;
	b=URp9PLq3AI1ZLF4uR5+MFziXNkZ9OCv7HDl2ttFZuFamkOwSgglhOTiQfqx+YC2d
	Tvf/j63gFxtCkX5obsHyQqE2oXEEy68J1BEBDTb9JCw6SgKPMlA7fU2SLXFCVDchdMm
	WwAGxVkwdUWqZhFJMcJHXMZSvyg0Ivr6dT4QILEk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GsDJQ2cr721elshfVZF7IrBvxHMdSmISQkD8NMgPdq0=;
	b=EwVRlUs9qfAhPlPW1tCPq6IsWM2s/pt2phaIm3nm1nqposwvbf1+5+nZF3PD3rrc
	3o24YHG62xJepkLXEe7BH6iR2dVa7Uji25D77maN7QJIAH7qq90Dy9iaFNmRf/9j3MF
	/Spj2bUscEm4aFNHjCMQSMzXCcEotb4mEyLu8rdY=
Content-Type: multipart/mixed; boundary="===============3062369565975794235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.9 SUCCEEDED
Message-ID: <0101018fd4dd3780-31793762-c58c-4e6a-bc2b-011e9dbffa81-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200158

--===============3062369565975794235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.7-6.9.patch
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
From 8ed2e061b66597f8dd684ab6345759e3af3637aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 11:06:58 +0000
Subject: [PATCH] ethtool: upgrade 6.7 -> 6.9

---
 .../ethtool/ethtool/avoid_parallel_tests.patch             | 7 +++----
 .../ethtool/{ethtool_6.7.bb => ethtool_6.9.bb}             | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.7.bb => ethtool_6.9.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 69df8632f2..8ba1807dab 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 758fde7186730ee331a0ee6149276cd412766ee0 Mon Sep 17 00:00:00 2001
+From 64d1a74b651980152110118e22540dbf4b021431 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -9,16 +9,15 @@ serial-tests is required to generate those targets.
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
 (default automake behavior incompatible with ptest)
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c871558..8ea1eaa 100644
+index e494aac..42dd40f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.7, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.9, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.7.bb b/meta/recipes-extended/ethtool/ethtool_6.9.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.7.bb
rename to meta/recipes-extended/ethtool/ethtool_6.9.bb
index 33df0e0e80..1837b1ed1e 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.7.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "ace0e95a03b38208af4ebacb415244568ace44c5d5a279ea434844f900179c75"
+SRC_URI[sha256sum] = "0011fb1b20101879f2d01d39cd2bc1d9646990d07d64de893415404a3afc53ef"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.44.0


--===============3062369565975794235==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.7-6.9.patch"

RnJvbSA4ZWQyZTA2MWI2NjU5N2Y4ZGQ2ODRhYjYzNDU3NTllM2FmMzYzN2FhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxMTowNjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNi43IC0+IDYuOQoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgIHwgNyArKystLS0tCiAuLi4vZXRodG9v
bC97ZXRodG9vbF82LjcuYmIgPT4gZXRodG9vbF82LjkuYmJ9ICAgICAgICAgICAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wve2V0aHRvb2xfNi43LmJiID0+IGV0aHRvb2xf
Ni45LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29s
L2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IDY5ZGY4
NjMyZjIuLjhiYTE4MDdkYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNzU4ZmRlNzE4NjczMGVlMzMxYTBlZTYxNDkyNzZjZDQxMjc2NmVl
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjRkMWE3NGI2NTE5ODAxNTIxMTAxMThl
MjI1NDBkYmY0YjAyMTQzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZs
b3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAxNCAxODo1
OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRlc3RzIGNv
bmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC05LDE2ICs5LDE1IEBAIHNlcmlhbC10ZXN0cyBpcyBy
ZXF1aXJlZCB0byBnZW5lcmF0ZSB0aG9zZSB0YXJnZXRzLgogU2lnbmVkLW9mZi1ieTogVHVkb3Ig
RmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUKIChkZWZhdWx0IGF1dG9tYWtlIGJlaGF2aW9yIGluY29tcGF0aWJsZSB3aXRoIHB0ZXN0
KQotCiAtLS0KICBjb25maWd1cmUuYWMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMKLWluZGV4IGM4NzE1NTguLjhlYTFlYWEgMTAwNjQ0CitpbmRleCBlNDk0YWFjLi40
MmRkNDBmIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBA
IC0zLDcgKzMsNyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuNywgbmV0ZGV2QHZnZXIua2VybmVsLm9y
ZykKK0BAIC0zLDcgKzMsNyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuOSwgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZykKICBBQ19QUkVSRVEoMi41MikKICBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCiAg
QUNfQ09ORklHX1NSQ0RJUihbZXRodG9vbC5jXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi43LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0
aHRvb2wvZXRodG9vbF82LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjcuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi45LmJiCmluZGV4IDMzZGYwZTBlODAu
LjE4MzdiMWVkMWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0
aHRvb2xfNi43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xf
Ni45LmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9z
b2Z0d2FyZS9uZXR3b3JrL2V0aHRvb2wvZXRodG9vbC0ke1BWfS50YXIuZ3ogXAogICAgICAgICAg
ICBmaWxlOi8vYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJhY2UwZTk1YTAzYjM4MjA4YWY0ZWJhY2I0MTUyNDQ1NjhhY2U0
NGM1ZDVhMjc5ZWE0MzQ4NDRmOTAwMTc5Yzc1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAwMTFm
YjFiMjAxMDE4NzlmMmQwMWQzOWNkMmJjMWQ5NjQ2OTkwZDA3ZDY0ZGU4OTM0MTU0MDRhM2FmYzUz
ZWYiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9z
b2Z0d2FyZS9uZXR3b3JrL2V0aHRvb2wvIgogCi0tIAoyLjQ0LjAKCg==

--===============3062369565975794235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 24621 to 24728 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 4447336 to 4458416 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dev: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool-doc: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 48101 to 48871 (+2%)
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool-locale: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1709290 to 1713386 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool-src: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1401782 to 1427444 (+2%)
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool/ethtool: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool/ethtool: PKGV changed from 6.7 [default] to 6.9 [default]
packages/core2-64-poky-linux/ethtool: PV changed from "6.7" to "6.9"
packages/core2-64-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.7.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.9.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-64-poky-linux/ethtool: PKGV changed from 6.7 [default] to 6.9 [default]

--===============3062369565975794235==--

