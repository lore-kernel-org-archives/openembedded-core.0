Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B157C5474D
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.131108.1723748335199775716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bsHDc1oP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=krH3xqcl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019157683bee-913f7485-e2b2-4735-ae29-bd0407db09f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FWqMUSylALYz6DI8RzdWZ/+U5BP5u5ZHApDBB5oItIE=;
	b=bsHDc1oP+uRqpiTmRsCQvNog+lflWUujl41vWfW+FMrYkIQKEJjrCrMcYVO7MNHV
	9KMMsvaUed6EjSor+A9WRZAXo3F3p314nOjtW2eBW3LsflubjQ61xtn3eT6b+t+01Lo
	uG7JIA9JD2JTxDHhh5L7FyiJeKwb03aYpoK/bjNQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FWqMUSylALYz6DI8RzdWZ/+U5BP5u5ZHApDBB5oItIE=;
	b=krH3xqcls7vquAShvh+j5lmI3rlzSx+B8NFd7zTAHEJ07SexSGiGY/XMiGbAqx30
	Yf+AJE32iiXouWZbfzFJXOzqucPjnQv7w7jfQrGPmUykwTWEF0p8FMFcI17+gJNOUOi
	X8NIK2kbChL6n8/vwtkyEXxewqLda8OXZhWgUBKw=
Content-Type: multipart/mixed; boundary="===============4721255312380953769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.10 SUCCEEDED
Message-ID: <0101019157683bee-913f7485-e2b2-4735-ae29-bd0407db09f9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203403

--===============4721255312380953769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *6.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.9-6.10.patch
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
From 9d4724d8160caf2ea02ba149434aa8a0e7be1100 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 13:14:58 +0000
Subject: [PATCH] ethtool: upgrade 6.9 -> 6.10

---
 .../ethtool/ethtool/avoid_parallel_tests.patch             | 7 +++----
 .../ethtool/{ethtool_6.9.bb => ethtool_6.10.bb}            | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.9.bb => ethtool_6.10.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index ad4aabaa96..cdb8546ab0 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 758fde7186730ee331a0ee6149276cd412766ee0 Mon Sep 17 00:00:00 2001
+From 78bbfbea735e6e0a3e6ac7fc741b385bfe526171 Mon Sep 17 00:00:00 2001
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
+index f6fe260..65a0566 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.9, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.10, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.9.bb b/meta/recipes-extended/ethtool/ethtool_6.10.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.9.bb
rename to meta/recipes-extended/ethtool/ethtool_6.10.bb
index 1837b1ed1e..8a7b2607f3 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.9.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "0011fb1b20101879f2d01d39cd2bc1d9646990d07d64de893415404a3afc53ef"
+SRC_URI[sha256sum] = "2b266c45c0fe00e5f5b462ee4e795879fa4247003bf73c5a07a2279d801be058"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.44.0


--===============4721255312380953769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 4460152 to 4471504 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dev: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 48871 to 48875 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-doc: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool-locale: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1713355 to 1725753 (+1%)
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1427444 to 1438921 (+1%)
packages/core2-64-poky-linux/ethtool/ethtool-src: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool/ethtool: PKGSIZE changed from 671312 to 679504 (+1%)
packages/core2-64-poky-linux/ethtool/ethtool: PV changed from "6.9" to "6.10"
packages/core2-64-poky-linux/ethtool/ethtool: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.9.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.10.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-64-poky-linux/ethtool: PKGV changed from 6.9 [default] to 6.10 [default]
packages/core2-64-poky-linux/ethtool: PV changed from "6.9" to "6.10"

--===============4721255312380953769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-6.9-6.10.patch"

RnJvbSA5ZDQ3MjRkODE2MGNhZjJlYTAyYmExNDk0MzRhYThhMGU3YmUxMTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTM6MTQ6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuOSAtPiA2LjEwCgotLS0KIC4uLi9ldGh0b29sL2V0aHRvb2wvYXZv
aWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgICAgICAgICAgfCA3ICsrKy0tLS0KIC4uLi9ldGh0
b29sL3tldGh0b29sXzYuOS5iYiA9PiBldGh0b29sXzYuMTAuYmJ9ICAgICAgICAgICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC97ZXRodG9vbF82LjkuYmIgPT4gZXRodG9v
bF82LjEwLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IGFk
NGFhYmFhOTYuLmNkYjg1NDZhYjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9l
dGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNzU4ZmRlNzE4NjczMGVlMzMxYTBlZTYxNDkyNzZjZDQxMjc2
NmVlMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzhiYmZiZWE3MzVlNmUwYTNlNmFj
N2ZjNzQxYjM4NWJmZTUyNjE3MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9y
IEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAxNCAx
ODo1OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRlc3Rz
IGNvbmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC05LDE2ICs5LDE1IEBAIHNlcmlhbC10ZXN0cyBp
cyByZXF1aXJlZCB0byBnZW5lcmF0ZSB0aG9zZSB0YXJnZXRzLgogU2lnbmVkLW9mZi1ieTogVHVk
b3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUKIChkZWZhdWx0IGF1dG9tYWtlIGJlaGF2aW9yIGluY29tcGF0aWJsZSB3aXRoIHB0
ZXN0KQotCiAtLS0KICBjb25maWd1cmUuYWMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9j
b25maWd1cmUuYWMKLWluZGV4IGM4NzE1NTguLjhlYTFlYWEgMTAwNjQ0CitpbmRleCBmNmZlMjYw
Li42NWEwNTY2IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMK
LUBAIC0zLDcgKzMsNyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuOSwgbmV0ZGV2QHZnZXIua2VybmVs
Lm9yZykKK0BAIC0zLDcgKzMsNyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuMTAsIG5ldGRldkB2Z2Vy
Lmtlcm5lbC5vcmcpCiAgQUNfUFJFUkVRKDIuNTIpCiAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRd
KQogIEFDX0NPTkZJR19TUkNESVIoW2V0aHRvb2wuY10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuOS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ldGh0b29sL2V0aHRvb2xfNi4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuOS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjEwLmJiCmluZGV4IDE4Mzdi
MWVkMWUuLjhhN2IyNjA3ZjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2xfNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0
aHRvb2xfNi4xMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01J
UlJPUn0vc29mdHdhcmUvbmV0d29yay9ldGh0b29sL2V0aHRvb2wtJHtQVn0udGFyLmd6IFwKICAg
ICAgICAgICAgZmlsZTovL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDAxMWZiMWIyMDEwMTg3OWYyZDAxZDM5Y2QyYmMx
ZDk2NDY5OTBkMDdkNjRkZTg5MzQxNTQwNGEzYWZjNTNlZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyYjI2NmM0NWMwZmUwMGU1ZjViNDYyZWU0ZTc5NTg3OWZhNDI0NzAwM2JmNzNjNWEwN2EyMjc5
ZDgwMWJlMDU4IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9wdWIvc29mdHdhcmUvbmV0d29yay9ldGh0b29sLyIKIAotLSAKMi40NC4wCgo=

--===============4721255312380953769==--

