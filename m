Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11702CCF967
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5718.1693650551528939319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RJWUYWg0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=a+Vp1Wrh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a55708bd5-0455492e-282d-440e-a674-e592a97c4887-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eaFxwYFHN1xMjLpDBU8nEBOvVQlfObXtVbdTAMun4OY=;
	b=RJWUYWg0lbMSvdhLnWPsEwdLdztDThX99JnTAjRrVSrz/7KfMK0oCPolFIPRJNqA
	nKrqtqS3hTA1OeBIUhf2OcEfk79Eg9N4D6mkJ1H1x/XhItnE99MzK3Eomovb9jQtUZB
	lbSxPs1EiP3ujrlQWVG2qcQZQOD1Nw5cJuxfy01E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eaFxwYFHN1xMjLpDBU8nEBOvVQlfObXtVbdTAMun4OY=;
	b=a+Vp1Wrh454nhIRtyipwKitnMx/wcyR685LnhbPLEBaztkJ1jPSdyUULUScF1vrS
	otUIONLg3waydxWesOXWdtbvCL93Xq1KbmDbiPLXnKuCiE00VtOIYS+dRDbgy1qD/PU
	IzZnn+cAR3LtpZZQNXtX3mScZnyfjmlruPreIMcM=
Content-Type: multipart/mixed; boundary="===============7193125945345212368=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.4 SUCCEEDED
Message-ID: <0101018a55708bd5-0455492e-282d-440e-a674-e592a97c4887-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187086

--===============7193125945345212368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.3-6.4.patch
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
From 8d8163d44a57dfa299acc9e2e8f26eb66d180d94 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 20:04:33 +0000
Subject: [PATCH] ethtool: upgrade 6.3 -> 6.4

---
 .../ethtool/ethtool/avoid_parallel_tests.patch            | 8 ++++----
 .../ethtool/{ethtool_6.3.bb => ethtool_6.4.bb}            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.3.bb => ethtool_6.4.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 5e9024834c..7d710d3e63 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 08f887f4bc65684397bf8ec30cc61d91d894deac Mon Sep 17 00:00:00 2001
+From b826108eff243266312ff040a9b1c411edf232d1 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,12 +15,12 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c1e0012..c460398 100644
+index 292eae3..dcfc106 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 6.3, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.4, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
+ AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
 +AM_INIT_AUTOMAKE([gnu subdir-objects serial-tests])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.3.bb b/meta/recipes-extended/ethtool/ethtool_6.4.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.3.bb
rename to meta/recipes-extended/ethtool/ethtool_6.4.bb
index 504e645966..fe3012088c 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.3.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "342d37d3fe19da79d0276c4c69c34c61f1ad8f87b06514d664bf1eeb29bfd525"
+SRC_URI[sha256sum] = "fb8265c3ebbfd6929ea1dd38a9e2e5fd4416c7443d6a0f9d474d9fde89014588"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.39.2


--===============7193125945345212368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3777216 to 3786104 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 47818 to 47987 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1598742 to 1602849 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1362532 to 1366298 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 617200 to 621296 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.3.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.4.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PV changed from "6.3" to "6.4"

--===============7193125945345212368==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.3-6.4.patch"

RnJvbSA4ZDgxNjNkNDRhNTdkZmEyOTlhY2M5ZTJlOGYyNmViNjZkMTgwZDk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAyMDowNDozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNi4zIC0+IDYuNAoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgfCA4ICsrKystLS0tCiAuLi4vZXRodG9v
bC97ZXRodG9vbF82LjMuYmIgPT4gZXRodG9vbF82LjQuYmJ9ICAgICAgICAgICAgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC97ZXRodG9vbF82LjMuYmIgPT4gZXRodG9vbF82
LjQuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wv
ZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKaW5kZXggNWU5MDI0
ODM0Yy4uN2Q3MTBkM2U2MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRv
b2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAwOGY4ODdmNGJjNjU2ODQzOTdiZjhlYzMwY2M2MWQ5MWQ4OTRkZWFj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiODI2MTA4ZWZmMjQzMjY2MzEyZmYwNDBh
OWIxYzQxMWVkZjIzMmQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxv
cmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBXZWQsIDI4IE1heSAyMDE0IDE4OjU5
OjU0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV0aHRvb2w6IHVzZSBzZXJpYWwtdGVzdHMgY29u
ZmlnIG5lZWRlZCBieSBwdGVzdC4KQEAgLTE1LDEyICsxNSwxMiBAQCBVcHN0cmVhbS1TdGF0dXM6
IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXgg
YzFlMDAxMi4uYzQ2MDM5OCAxMDA2NDQKK2luZGV4IDI5MmVhZTMuLmRjZmMxMDYgMTAwNjQ0CiAt
LS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTIsNyArMiw3IEBAIGRu
bCBQcm9jZXNzIHRoaXMgZmlsZSB3aXRoIGF1dG9jb25mIHRvIHByb2R1Y2UgYSBjb25maWd1cmUg
c2NyaXB0LgotIEFDX0lOSVQoZXRodG9vbCwgNi4zLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnKQor
QEAgLTMsNyArMyw3IEBAIEFDX0lOSVQoZXRodG9vbCwgNi40LCBuZXRkZXZAdmdlci5rZXJuZWwu
b3JnKQogIEFDX1BSRVJFUSgyLjUyKQorIEFDX0NPTkZJR19NQUNST19ESVIoW200XSkKICBBQ19D
T05GSUdfU1JDRElSKFtldGh0b29sLmNdKQogLUFNX0lOSVRfQVVUT01BS0UoW2dudSBzdWJkaXIt
b2JqZWN0c10pCiArQU1fSU5JVF9BVVRPTUFLRShbZ251IHN1YmRpci1vYmplY3RzIHNlcmlhbC10
ZXN0c10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29s
XzYuMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi40LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2xfNi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sXzYuNC5iYgppbmRleCA1MDRlNjQ1OTY2Li5mZTMwMTIwODhjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuNC5iYgpAQCAtMTEsNyArMTEsNyBA
QCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29mdHdhcmUvbmV0d29yay9ldGh0b29s
L2V0aHRvb2wtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2F2b2lkX3BhcmFsbGVs
X3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzQy
ZDM3ZDNmZTE5ZGE3OWQwMjc2YzRjNjljMzRjNjFmMWFkOGY4N2IwNjUxNGQ2NjRiZjFlZWIyOWJm
ZDUyNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYjgyNjVjM2ViYmZkNjkyOWVhMWRkMzhhOWUy
ZTVmZDQ0MTZjNzQ0M2Q2YTBmOWQ0NzRkOWZkZTg5MDE0NTg4IgogCiBVUFNUUkVBTV9DSEVDS19V
UkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay9ldGh0b29s
LyIKIAotLSAKMi4zOS4yCgo=

--===============7193125945345212368==--

