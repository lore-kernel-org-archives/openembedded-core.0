Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AA3C83F04
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1423.1751386820096998693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UVcrhuXQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MtQXwXqb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6ca0b64-80c4a12e-82c9-4590-9837-d6326c2d981e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vE8Lmn+PkjnCu5VUZiaU7/GV/wb6cVlXab6QZAPA1SI=;
	b=UVcrhuXQJBFuKHnKMn7ISPwG7pDJkxOr4RisDtbTkPdZ4l0w/6xwkqw8xjSSN7Xg
	5VPgSzntW1hADD4cm9TYx7qAacNZbyt+QBfGwdMpDK1ojsyroNmbgzIMhnEpJrIlvTW
	km0v4Bh3dz2U9sPvEtOZjgbZWvSWI1gRYW5wxpY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vE8Lmn+PkjnCu5VUZiaU7/GV/wb6cVlXab6QZAPA1SI=;
	b=MtQXwXqbEHqrjdJKbPWKJh6wl5JtwCdr35diCTyCs6vDuw33BTEp6krSVnuH+m7A
	P7oyTpmUuTVslZGrFDFPJ0wVRc2nR4EQbXuPuegQOER8O0+JlwT5FTS7KuFEABQngO+
	WqMvcmrXAh8VE9OMh8V9/p+YSpvYflG23jBVHHts=
Content-Type: multipart/mixed; boundary="===============4093572030150644641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.15 SUCCEEDED
Message-ID: <01010197c6ca0b64-80c4a12e-82c9-4590-9837-d6326c2d981e-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219657

--===============4093572030150644641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *6.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.14-6.15.patch
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
From 85afa4273ce2c50e61f005d08603e4656dfda257 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:38:23 +0000
Subject: [PATCH] ethtool: upgrade 6.14 -> 6.15

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.14.bb => ethtool_6.15.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.14.bb => ethtool_6.15.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 4affc332a9..11ab54a600 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 755cf01b02e6ec8c8acb79558cbad28e301519b3 Mon Sep 17 00:00:00 2001
+From 31750617e6853929cdc9e768927c10c98c7c2420 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index db71394..5e93135 100644
+index f5fdc8b..3eab387 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.14, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.15, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.14.bb b/meta/recipes-extended/ethtool/ethtool_6.15.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_6.14.bb
rename to meta/recipes-extended/ethtool/ethtool_6.15.bb
index 41164ac6ca..eb6b272d4a 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.15.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "3dbfc910513d1fef683f27ab12325cc88551abffae66d0ad3afe2a13317d2339"
+SRC_URI[sha256sum] = "5d21a75b54c5e617b8ac0fe161e2ef3a75ecdf569ab64831474882dd3ece6077"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.47.1


--===============4093572030150644641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-6.14-6.15.patch"

RnJvbSA4NWFmYTQyNzNjZTJjNTBlNjFmMDA1ZDA4NjAzZTQ2NTZkZmRhMjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDozODoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNi4xNCAtPiA2LjE1CgotLS0KIC4uLi9ldGh0b29sL2V0aHRvb2wvYXZv
aWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgICAgICAgICAgIHwgNiArKystLS0KIC4uLi9ldGh0
b29sL3tldGh0b29sXzYuMTQuYmIgPT4gZXRodG9vbF82LjE1LmJifSAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wve2V0aHRvb2xfNi4xNC5iYiA9PiBldGh0
b29sXzYuMTUuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0
aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKaW5kZXgg
NGFmZmMzMzJhOS4uMTFhYjU0YTYwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3NTVjZjAxYjAyZTZlYzhjOGFjYjc5NTU4Y2JhZDI4ZTMw
MTUxOWIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMTc1MDYxN2U2ODUzOTI5Y2Rj
OWU3Njg5MjdjMTBjOThjN2MyNDIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVk
b3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBXZWQsIDI4IE1heSAyMDE0
IDE4OjU5OjU0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV0aHRvb2w6IHVzZSBzZXJpYWwtdGVz
dHMgY29uZmlnIG5lZWRlZCBieSBwdGVzdC4KQEAgLTE0LDEwICsxNCwxMCBAQCBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwot
aW5kZXggZGI3MTM5NC4uNWU5MzEzNSAxMDA2NDQKK2luZGV4IGY1ZmRjOGIuLjNlYWIzODcgMTAw
NjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTMsNyArMyw3
IEBAIEFDX0lOSVQoZXRodG9vbCwgNi4xNCwgbmV0ZGV2QHZnZXIua2VybmVsLm9yZykKK0BAIC0z
LDcgKzMsNyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuMTUsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcp
CiAgQUNfUFJFUkVRKDIuNTIpCiAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQogIEFDX0NPTkZJ
R19TUkNESVIoW2V0aHRvb2wuY10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
ZXRodG9vbC9ldGh0b29sXzYuMTQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9l
dGh0b29sXzYuMTUuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjE0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuMTUuYmIKaW5kZXggNDExNjRhYzZjYS4uZWI2
YjI3MmQ0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9v
bF82LjE0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4x
NS5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29m
dHdhcmUvbmV0d29yay9ldGh0b29sL2V0aHRvb2wtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAg
ZmlsZTovL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiM2RiZmM5MTA1MTNkMWZlZjY4M2YyN2FiMTIzMjVjYzg4NTUxYWJm
ZmFlNjZkMGFkM2FmZTJhMTMzMTdkMjMzOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZDIxYTc1
YjU0YzVlNjE3YjhhYzBmZTE2MWUyZWYzYTc1ZWNkZjU2OWFiNjQ4MzE0NzQ4ODJkZDNlY2U2MDc3
IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29m
dHdhcmUvbmV0d29yay9ldGh0b29sLyIKIAotLSAKMi40Ny4xCgo=

--===============4093572030150644641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 5346264 to 8501512 (+59%)
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1793873 to 2399247 (+34%)
packages/core2-64-poky-linux/ethtool/ethtool: PKGSIZE changed from 704704 to 1003753 (+42%)

--===============4093572030150644641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 5346264 to 8501512 (+59%)
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dev: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 54878 to 55905 (+2%)
packages/core2-64-poky-linux/ethtool/ethtool-doc: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-locale: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1793873 to 2399247 (+34%)
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-src: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool/ethtool: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool/ethtool: PKGSIZE changed from 704704 to 1003753 (+42%)
packages/core2-64-poky-linux/ethtool/ethtool: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.14.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.15.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-64-poky-linux/ethtool: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/ethtool: PV changed from "6.14" to "6.15"

--===============4093572030150644641==--

