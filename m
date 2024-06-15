Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C5C3DA4D
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18389.1718475800258853654
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dsrYRszy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AstRd8D2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101901d23bb02-8b5b5c09-f6da-43c5-a066-de6c9626ff3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7IbrENm1po1Ztq6jqdVLo3opbKhtk1Xw+KhkGn4fJOE=;
	b=dsrYRszyM5dDOscQEAyTclsRCsAUgvETf1GrNz0+8vOOsRz3C+BqPsMl1i4yTFwD
	/R4epe9c+03QAKbscDso21wJBY9ubqAKDvpBDkTIoxbZ8+WSC4Tk/pkwaDJZW2Pugcb
	RaHDg26VwU32Lsts9+X233tz+VitbwD6utHuWeIo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7IbrENm1po1Ztq6jqdVLo3opbKhtk1Xw+KhkGn4fJOE=;
	b=AstRd8D24SEDTuAjdmT156sfIr4W41bZ/9aC8iiBUcqgAXcRd+hZr/4TOUSAv/Cl
	TPaay54t0nGqdciloS+JR6XvJAA+98+zdE+NKkAByw5XXAXx1OpXd7ZWjBMaTsqE5uW
	ccL51xyE8ARYi9XkAadAmY3nlPXKiKp3Y+pgqRvU=
Content-Type: multipart/mixed; boundary="===============0824139490433212862=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.9 SUCCEEDED
Message-ID: <010101901d23bb02-8b5b5c09-f6da-43c5-a066-de6c9626ff3f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200713

--===============0824139490433212862==
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
From ba61b7f94dfacccfaf0ee7fd9b3e946d0b6341f0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 11:28:06 +0000
Subject: [PATCH] ethtool: upgrade 6.7 -> 6.9

---
 .../ethtool/ethtool/avoid_parallel_tests.patch             | 7 +++----
 .../ethtool/{ethtool_6.7.bb => ethtool_6.9.bb}             | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.7.bb => ethtool_6.9.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 69df8632f2..c3913c96e5 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 758fde7186730ee331a0ee6149276cd412766ee0 Mon Sep 17 00:00:00 2001
+From 4361d0a3eb421c797e2748b835d379d2a2b41949 Mon Sep 17 00:00:00 2001
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


--===============0824139490433212862==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.7-6.9.patch"

RnJvbSBiYTYxYjdmOTRkZmFjY2NmYWYwZWU3ZmQ5YjNlOTQ2ZDBiNjM0MWYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTE6Mjg6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuNyAtPiA2LjkKCi0tLQogLi4uL2V0aHRvb2wvZXRodG9vbC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAgICAgICB8IDcgKysrLS0tLQogLi4uL2V0aHRv
b2wve2V0aHRvb2xfNi43LmJiID0+IGV0aHRvb2xfNi45LmJifSAgICAgICAgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzYuNy5iYiA9PiBldGh0b29s
XzYuOS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCA2OWRm
ODYzMmYyLi5jMzkxM2M5NmU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDc1OGZkZTcxODY3MzBlZTMzMWEwZWU2MTQ5Mjc2Y2Q0MTI3NjZl
ZTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQzNjFkMGEzZWI0MjFjNzk3ZTI3NDhi
ODM1ZDM3OWQyYTJiNDE5NDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBG
bG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFdlZCwgMjggTWF5IDIwMTQgMTg6
NTk6NTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXRodG9vbDogdXNlIHNlcmlhbC10ZXN0cyBj
b25maWcgbmVlZGVkIGJ5IHB0ZXN0LgpAQCAtOSwxNiArOSwxNSBAQCBzZXJpYWwtdGVzdHMgaXMg
cmVxdWlyZWQgdG8gZ2VuZXJhdGUgdGhvc2UgdGFyZ2V0cy4KIFNpZ25lZC1vZmYtYnk6IFR1ZG9y
IEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJv
cHJpYXRlCiAoZGVmYXVsdCBhdXRvbWFrZSBiZWhhdmlvciBpbmNvbXBhdGlibGUgd2l0aCBwdGVz
dCkKLQogLS0tCiAgY29uZmlndXJlLmFjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29u
ZmlndXJlLmFjCi1pbmRleCBjODcxNTU4Li44ZWExZWFhIDEwMDY0NAoraW5kZXggZTQ5NGFhYy4u
NDJkZDQwZiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1A
QCAtMyw3ICszLDcgQEAgQUNfSU5JVChldGh0b29sLCA2LjcsIG5ldGRldkB2Z2VyLmtlcm5lbC5v
cmcpCitAQCAtMyw3ICszLDcgQEAgQUNfSU5JVChldGh0b29sLCA2LjksIG5ldGRldkB2Z2VyLmtl
cm5lbC5vcmcpCiAgQUNfUFJFUkVRKDIuNTIpCiAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQog
IEFDX0NPTkZJR19TUkNESVIoW2V0aHRvb2wuY10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuNy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9l
dGh0b29sL2V0aHRvb2xfNi45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi43LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuOS5iYgppbmRleCAzM2RmMGUwZTgw
Li4xODM3YjFlZDFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9l
dGh0b29sXzYuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29s
XzYuOS5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0v
c29mdHdhcmUvbmV0d29yay9ldGh0b29sL2V0aHRvb2wtJHtQVn0udGFyLmd6IFwKICAgICAgICAg
ICAgZmlsZTovL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYWNlMGU5NWEwM2IzODIwOGFmNGViYWNiNDE1MjQ0NTY4YWNl
NDRjNWQ1YTI3OWVhNDM0ODQ0ZjkwMDE3OWM3NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMDEx
ZmIxYjIwMTAxODc5ZjJkMDFkMzljZDJiYzFkOTY0Njk5MGQwN2Q2NGRlODkzNDE1NDA0YTNhZmM1
M2VmIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIv
c29mdHdhcmUvbmV0d29yay9ldGh0b29sLyIKIAotLSAKMi40NC4wCgo=

--===============0824139490433212862==
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

--===============0824139490433212862==--

