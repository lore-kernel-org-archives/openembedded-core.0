Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADEDC44508
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2960.1783577517275904708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MCODONgM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l2lRo15j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f45811931-e0c9c066-c8f2-49ec-9ede-a619324be899-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577516;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=X05ekOwPie5lEe6hz8sxF9nTXghjalTlE3L0MZELQc4=;
	b=MCODONgMIPTpXBChvoWLjN2vI4K9n0JBXptu3A6+uSO18qj6KYZj/udWGxkX77Vh
	SZkuw5p1oH0GlycmtoPdfLjlGAqQgOK1nYrsLHF53mI45PkQROu3wa0rcmqq+P8mEi6
	5ymlB2Fe5EAlDwzx8jmk6MSx+VNMChzv3Ip3b22Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577516;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=X05ekOwPie5lEe6hz8sxF9nTXghjalTlE3L0MZELQc4=;
	b=l2lRo15jtfEfSB41Nd7eW8jEZx/FY9mvn5EF/XqrhIsFAtJCV+0SC1De4IATZpGZ
	CvLZoyF1Z9yZZ/JUK//2pL9SeejTir6xrVpX+QYaiTCYKbLPlhfmHQoKfsBpD18PGud
	Wglg+OwZDACFt3s/vnAil2EmO6fexjDkh62lfD68=
Content-Type: multipart/mixed; boundary="===============4605322884468520607=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 7.1 SUCCEEDED
Message-ID: <0101019f45811931-e0c9c066-c8f2-49ec-9ede-a619324be899-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240531

--===============4605322884468520607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-7.0-7.1.patch
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
From 8456ba16fd48587ad782a067d9eddb0217935efe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:35:48 +0000
Subject: [PATCH] ethtool: upgrade 7.0 -> 7.1

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_7.0.bb => ethtool_7.1.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_7.0.bb => ethtool_7.1.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index dd64ef1a0b..aafc9ea715 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 3f6c7d7d311bc3abac02b4a18da7c49850fc4de4 Mon Sep 17 00:00:00 2001
+From 7fbdc5cec5c5f2b89fd183543c3d35b5f7cc5530 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 06e2086..bca01e5 100644
+index 71b998e..79eff82 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.0, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.1, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_7.0.bb b/meta/recipes-extended/ethtool/ethtool_7.1.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_7.0.bb
rename to meta/recipes-extended/ethtool/ethtool_7.1.bb
index eb5b646701..d215b27b0a 100644
--- a/meta/recipes-extended/ethtool/ethtool_7.0.bb
+++ b/meta/recipes-extended/ethtool/ethtool_7.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "1a17b13dba2aef3897bb66c6140d88dc19e807b7948de3773d37320daae5266c"
+SRC_URI[sha256sum] = "21cc520ae5d881f01b0dcd6d26de4d52a64b24840bc2150daf778a235442e61d"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.47.1


--===============4605322884468520607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 25203 to 25264 (+0%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 8699720 to 8728680 (+0%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 59081 to 60597 (+3%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 2465546 to 2473738 (+0%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 2438448 to 2447118 (+0%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/7.0/uapi/linux -> /usr/src/debug/ethtool/7.1/uapi/linux, directory renamed /usr/src/debug/ethtool/7.0/netlink -> /usr/src/debug/ethtool/7.1/netlink, directory renamed /usr/src/debug/ethtool/7.0 -> /usr/src/debug/ethtool/7.1, directory renamed /usr/src/debug/ethtool/7.0/uapi/linux/hdlc -> /usr/src/debug/ethtool/7.1/uapi/linux/hdlc
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGSIZE changed from 1032425 to 1036521 (+0%)
packages/x86-64-v3-poky-linux/ethtool/ethtool: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/ethtool: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-7.0.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-7.1.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/x86-64-v3-poky-linux/ethtool: PV changed from "7.0" to "7.1"

--===============4605322884468520607==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-7.0-7.1.patch"

RnJvbSA4NDU2YmExNmZkNDg1ODdhZDc4MmEwNjdkOWVkZGIwMjE3OTM1ZWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNTozNTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNy4wIC0+IDcuMQoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgICB8IDYgKysrLS0tCiAuLi4vZXRodG9v
bC97ZXRodG9vbF83LjAuYmIgPT4gZXRodG9vbF83LjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzcuMC5iYiA9PiBldGh0b29s
XzcuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCBkZDY0
ZWYxYTBiLi5hYWZjOWVhNzE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDNmNmM3ZDdkMzExYmMzYWJhYzAyYjRhMThkYTdjNDk4NTBmYzRk
ZTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdmYmRjNWNlYzVjNWYyYjg5ZmQxODM1
NDNjM2QzNWI1ZjdjYzU1MzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBG
bG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFdlZCwgMjggTWF5IDIwMTQgMTg6
NTk6NTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXRodG9vbDogdXNlIHNlcmlhbC10ZXN0cyBj
b25maWcgbmVlZGVkIGJ5IHB0ZXN0LgpAQCAtMTQsMTAgKzE0LDEwIEBAIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRl
eCAwNmUyMDg2Li5iY2EwMWU1IDEwMDY0NAoraW5kZXggNzFiOTk4ZS4uNzllZmY4MiAxMDA2NDQK
IC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMyw3ICszLDcgQEAg
QUNfSU5JVChldGh0b29sLCA3LjAsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCitAQCAtMyw3ICsz
LDcgQEAgQUNfSU5JVChldGh0b29sLCA3LjEsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCiAgQUNf
UFJFUkVRKDIuNTIpCiAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQogIEFDX0NPTkZJR19TUkNE
SVIoW2V0aHRvb2wuY10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sXzcuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xf
Ny4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9ldGh0b29sL2V0aHRvb2xfNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZXRodG9vbC9ldGh0b29sXzcuMS5iYgppbmRleCBlYjViNjQ2NzAxLi5kMjE1YjI3YjBhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzcuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzcuMS5iYgpAQCAtMTEs
NyArMTEsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29mdHdhcmUvbmV0d29y
ay9ldGh0b29sL2V0aHRvb2wtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMWExN2IxM2RiYTJhZWYzODk3YmI2NmM2MTQwZDg4ZGMxOWU4MDdiNzk0OGRlMzc3M2Qz
NzMyMGRhYWU1MjY2YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMWNjNTIwYWU1ZDg4MWYwMWIw
ZGNkNmQyNmRlNGQ1MmE2NGIyNDg0MGJjMjE1MGRhZjc3OGEyMzU0NDJlNjFkIgogCiBVUFNUUkVB
TV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29mdHdhcmUvbmV0d29y
ay9ldGh0b29sLyIKIAotLSAKMi40Ny4xCgo=

--===============4605322884468520607==--

