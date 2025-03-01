Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F81AC35FEF
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7164.1740828318892089703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bgOauCAS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bhDbFH7N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019551742341-1f5babf8-5157-4304-99b8-77c6055ddf4a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QpCJjKwgCF1br6S7odAZkGN0+HDW7n6z6ETQzD8fLy8=;
	b=bgOauCASIJ8gyw0DiVfk5iBRNH1JkTpCFqPAUavDB+Du4pltTCkEXuRLVMmLjd58
	CPMMqtiGWzoe5Kbub95U6y0pl+EKP5vA4Iphi0yexgfQUllLDBZqt+LfJVoDr3mXz6x
	u2aYX1Pb4NXw6HQP7Jxf2hdxaWsyxDh1/5iZ6O2g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QpCJjKwgCF1br6S7odAZkGN0+HDW7n6z6ETQzD8fLy8=;
	b=bhDbFH7NjYRgYgTz1JsSGa4mnu9MckkTjuT1KQ9m2GP7SlTLvNimhw/BpLIrEtu/
	o9Bd85lkBiKwtHBA40B/w3WubyrToM3Q2Q2b3T6Ja0JM1bcmpE9mL5ZW2ZWNdnsgCWL
	PeVVADal5pslpPJwUwartABPk7nIWfFb/dODkvXo=
Content-Type: multipart/mixed; boundary="===============5380145903006147594=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.14 SUCCEEDED
Message-ID: <0101019551742341-1f5babf8-5157-4304-99b8-77c6055ddf4a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212107

--===============5380145903006147594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysvinit* to *3.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysvinit-upgrade-3.13-3.14.patch
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
From 6638532a26e3ca1cdf45e5ce3795fd248b1a58cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 07:09:40 +0000
Subject: [PATCH] sysvinit: upgrade 3.13 -> 3.14

---
 meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch           | 4 ++--
 .../sysvinit/{sysvinit_3.13.bb => sysvinit_3.14.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_3.13.bb => sysvinit_3.14.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
index ece870c269..3383165430 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -1,4 +1,4 @@
-From 19a8777c81bc451d65a4071528e4715e19941e0a Mon Sep 17 00:00:00 2001
+From 5b14182641901799a1711e79558f62ab81803f75 Mon Sep 17 00:00:00 2001
 From: Jeff Dike <jdike@x86_64.user-mode-linux.org>
 Date: Wed, 14 Jul 2010 14:35:52 -0400
 Subject: [PATCH] sysvinit - Remove sulogin dependency on /usr/lib*/libcrypt.a
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 2 insertions(+), 10 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 4ce4889..1611c1c 100644
+index 6d9f01c..b12a233 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -97,16 +97,8 @@ else
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.13.bb b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_3.13.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.14.bb
index d935b0edfd..521eda0bfb 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.13.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "cbaeabddc35a6511b87c87452ee5e87c678a26329c7d7d17fb69a2b42a314d86"
+SRC_URI[sha256sum] = "c90874b8c054a35991fb8c4d30c443ed1e9b1815ff6165c7b483f558be4e4b53"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.44.1


--===============5380145903006147594==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysvinit-upgrade-3.13-3.14.patch"

RnJvbSA2NjM4NTMyYTI2ZTNjYTFjZGY0NWU1Y2UzNzk1ZmQyNDhiMWE1OGNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNzowOTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3Zpbml0OiB1cGdyYWRlIDMuMTMgLT4gMy4xNAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9zeXN2
aW5pdC9zeXN2aW5pdC9jcnlwdC1saWIucGF0Y2ggICAgICAgICAgIHwgNCArKy0tCiAuLi4vc3lz
dmluaXQve3N5c3Zpbml0XzMuMTMuYmIgPT4gc3lzdmluaXRfMy4xNC5iYn0gICAgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQve3N5c3Zpbml0XzMuMTMuYmIgPT4gc3lz
dmluaXRfMy4xNC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN2
aW5pdC9zeXN2aW5pdC9jcnlwdC1saWIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN2aW5p
dC9zeXN2aW5pdC9jcnlwdC1saWIucGF0Y2gKaW5kZXggZWNlODcwYzI2OS4uMzM4MzE2NTQzMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQvY3J5cHQtbGli
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0L2NyeXB0LWxp
Yi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTlhODc3N2M4MWJjNDUxZDY1YTQwNzE1Mjhl
NDcxNWUxOTk0MWUwYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWIxNDE4MjY0MTkw
MTc5OWExNzExZTc5NTU4ZjYyYWI4MTgwM2Y3NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEplZmYgRGlrZSA8amRpa2VAeDg2XzY0LnVzZXItbW9kZS1saW51eC5vcmc+CiBEYXRlOiBX
ZWQsIDE0IEp1bCAyMDEwIDE0OjM1OjUyIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN5c3Zpbml0
IC0gUmVtb3ZlIHN1bG9naW4gZGVwZW5kZW5jeSBvbiAvdXNyL2xpYiovbGliY3J5cHQuYQpAQCAt
MTQsNyArMTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRp
b25dCiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9zcmMvTWFrZWZpbGUgYi9zcmMvTWFrZWZpbGUKLWluZGV4IDRjZTQ4ODku
LjE2MTFjMWMgMTAwNjQ0CitpbmRleCA2ZDlmMDFjLi5iMTJhMjMzIDEwMDY0NAogLS0tIGEvc3Jj
L01ha2VmaWxlCiArKysgYi9zcmMvTWFrZWZpbGUKIEBAIC05NywxNiArOTcsOCBAQCBlbHNlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdF8zLjEzLmJiIGIv
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRfMy4xNC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdF8z
LjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdF8zLjE0
LmJiCmluZGV4IGQ5MzViMGVkZmQuLjUyMWVkYTBiZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0XzMuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
c3lzdmluaXQvc3lzdmluaXRfMy4xNC5iYgpAQCAtMTgsNyArMTgsNyBAQCBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIueHogXAogICAgICAgICAg
ICBmaWxlOi8vYm9vdGxvZ2QuaW5pdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMV9ib290bG9nZCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjYmFlYWJkZGMzNWE2NTExYjg3
Yzg3NDUyZWU1ZTg3YzY3OGEyNjMyOWM3ZDdkMTdmYjY5YTJiNDJhMzE0ZDg2IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImM5MDg3NGI4YzA1NGEzNTk5MWZiOGM0ZDMwYzQ0M2VkMWU5YjE4MTVmZjYx
NjVjN2I0ODNmNTU4YmU0ZTRiNTMiCiAKIFMgPSAiJHtXT1JLRElSfS9zeXN2aW5pdC0ke1BWfSIK
IAotLSAKMi40NC4xCgo=

--===============5380145903006147594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysvinit: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit: SRC_URI changed from "https://github.com/slicer69/sysvinit/releases//download/3.13/sysvinit-3.13.tar.xz file://crypt-lib.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd" to "https://github.com/slicer69/sysvinit/releases//download/3.14/sysvinit-3.14.tar.xz file://crypt-lib.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd"
packages/core2-64-poky-linux/sysvinit/sysvinit-dbg: PKGSIZE changed from 627632 to 630016 (+0%)
packages/core2-64-poky-linux/sysvinit/sysvinit-dbg: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-dbg: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-dev: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-dev: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-doc: PKGSIZE changed from 78276 to 78372 (+0%)
packages/core2-64-poky-linux/sysvinit/sysvinit-doc: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-doc: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-locale: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-locale: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-pidof: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-pidof: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-src: PKGSIZE changed from 270597 to 272613 (+1%)
packages/core2-64-poky-linux/sysvinit/sysvinit-src: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-src: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-staticdev: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-staticdev: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-sulogin: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-sulogin: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit: PKGSIZE changed from 264487 to 265255 (+0%)
packages/core2-64-poky-linux/sysvinit/sysvinit: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit: PKGV changed from 3.13 [default] to 3.14 [default]

--===============5380145903006147594==--

