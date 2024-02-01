Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81371C5478C
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2121.1706810407271984792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RUpO/8+X;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZM6F7qwH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3f568-79d6060f-0dcc-490e-8541-8b374a29266f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4e/Jc8p5SiHucX+m7z6ug30sV3n8gvsU83rRy7pmAWg=;
	b=RUpO/8+XzT0kmDzet6uCAppWQ6NzbOJKUlRCJF3d2EZ6iQ6wVMaRFcJc8yRCRGJF
	At1fyYIekxFLPsaAnvyEOMno1PODCAGPoWg57mNA6I96sYIoF5EjE17zvvYPCkehohI
	yUhBwRhEA373EPxnjDuwXazqoeAGfikiSQMU7AyM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4e/Jc8p5SiHucX+m7z6ug30sV3n8gvsU83rRy7pmAWg=;
	b=ZM6F7qwHxGUrTacn5sTNK5w7bn89wMXc+Oqo6yDRavX8KktikTWdN0u20+6zN+tW
	ADDTbf/StfB2z2JuRxuibO+L1HKvj8MS5kfxkp4tirrxN6MYRpmZxVZXIgszwStMEaf
	o4Y7oZ6smcN8iSh9/YjQ0/jyWF7dz3PKfhNeo83U=
Content-Type: multipart/mixed; boundary="===============6871355953457364618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.7 SUCCEEDED
Message-ID: <0101018d65d3f568-79d6060f-0dcc-490e-8541-8b374a29266f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194672

--===============6871355953457364618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.6-6.7.patch
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
From d281134f8947e125b299ed9aed96f67cc8bca823 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 10:43:28 +0000
Subject: [PATCH] ethtool: upgrade 6.6 -> 6.7

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.6.bb => ethtool_6.7.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.6.bb => ethtool_6.7.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 409c8de685..87aaf2253b 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 0c77437267601d40d7ce9efd87eb4b82a5675d2f Mon Sep 17 00:00:00 2001
+From 1f22d926406e9d601d378665c8047f324ac0b93d Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,10 +15,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 11efb99..b5ce018 100644
+index c871558..8ea1eaa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.5, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.7, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.6.bb b/meta/recipes-extended/ethtool/ethtool_6.7.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.6.bb
rename to meta/recipes-extended/ethtool/ethtool_6.7.bb
index ab824356c2..33df0e0e80 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.6.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "d4cdb4f7498781fb516e2b3d0eadab28691da3fd3e3445954e82d745de95fb96"
+SRC_URI[sha256sum] = "ace0e95a03b38208af4ebacb415244568ace44c5d5a279ea434844f900179c75"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.42.0


--===============6871355953457364618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.6-6.7.patch"

RnJvbSBkMjgxMTM0Zjg5NDdlMTI1YjI5OWVkOWFlZDk2ZjY3Y2M4YmNhODIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMDo0MzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNi42IC0+IDYuNwoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgICB8IDYgKysrLS0tCiAuLi4vZXRodG9v
bC97ZXRodG9vbF82LjYuYmIgPT4gZXRodG9vbF82LjcuYmJ9ICAgICAgICAgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzYuNi5iYiA9PiBldGh0b29s
XzYuNy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCA0MDlj
OGRlNjg1Li44N2FhZjIyNTNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDBjNzc0MzcyNjc2MDFkNDBkN2NlOWVmZDg3ZWI0YjgyYTU2NzVk
MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFmMjJkOTI2NDA2ZTlkNjAxZDM3ODY2
NWM4MDQ3ZjMyNGFjMGI5M2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBG
bG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFdlZCwgMjggTWF5IDIwMTQgMTg6
NTk6NTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXRodG9vbDogdXNlIHNlcmlhbC10ZXN0cyBj
b25maWcgbmVlZGVkIGJ5IHB0ZXN0LgpAQCAtMTUsMTAgKzE1LDEwIEBAIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRl
eCAxMWVmYjk5Li5iNWNlMDE4IDEwMDY0NAoraW5kZXggYzg3MTU1OC4uOGVhMWVhYSAxMDA2NDQK
IC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMyw3ICszLDcgQEAg
QUNfSU5JVChldGh0b29sLCA2LjUsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCitAQCAtMyw3ICsz
LDcgQEAgQUNfSU5JVChldGh0b29sLCA2LjcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCiAgQUNf
UFJFUkVRKDIuNTIpCiAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQogIEFDX0NPTkZJR19TUkNE
SVIoW2V0aHRvb2wuY10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sXzYuNi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xf
Ni43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9ldGh0b29sL2V0aHRvb2xfNi42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZXRodG9vbC9ldGh0b29sXzYuNy5iYgppbmRleCBhYjgyNDM1NmMyLi4zM2RmMGUwZTgwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuNi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuNy5iYgpAQCAtMTEs
NyArMTEsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29mdHdhcmUvbmV0d29y
ay9ldGh0b29sL2V0aHRvb2wtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDRjZGI0Zjc0OTg3ODFmYjUxNmUyYjNkMGVhZGFiMjg2OTFkYTNmZDNlMzQ0NTk1NGU4
MmQ3NDVkZTk1ZmI5NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhY2UwZTk1YTAzYjM4MjA4YWY0
ZWJhY2I0MTUyNDQ1NjhhY2U0NGM1ZDVhMjc5ZWE0MzQ4NDRmOTAwMTc5Yzc1IgogCiBVUFNUUkVB
TV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29mdHdhcmUvbmV0d29y
ay9ldGh0b29sLyIKIAotLSAKMi40Mi4wCgo=

--===============6871355953457364618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 4444176 to 4444992 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dev: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool-doc: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 47991 to 48101 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool-locale: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1709290 to 1705194 (-0%)
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool-src: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1400368 to 1401782 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool/ethtool: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool/ethtool: PKGSIZE changed from 671312 to 667216 (-1%)
packages/core2-64-poky-linux/ethtool/ethtool: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool: PV changed from "6.6" to "6.7"
packages/core2-64-poky-linux/ethtool: PKGV changed from 6.6 [default] to 6.7 [default]
packages/core2-64-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.6.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.7.tar.gz file://run-ptest file://avoid_parallel_tests.patch"

--===============6871355953457364618==--

