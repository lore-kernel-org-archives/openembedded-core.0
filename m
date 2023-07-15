Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDEBC25B7A
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.6039.1689456455862312928
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cR3wtuL+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101895b73ad00-a156cf73-2aa8-4d84-a3fc-7d442811b247-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9lLb0rYb9JOH+Q/+3fVJ6E0w0Hopt1XLrFOJmVGWiyw=;
	b=cR3wtuL+EbsPm5VGKiWPVIkjTB3ayu8vnmDyGUl6uVdQsYgT7MordEi0Sw5nVdx7
	5oAoNbofCX2jFqDzKCQSnOjyN0AzKKAIb3fcOaLqdMhuUI/Hf1EeIV2VOav14uwPtUP
	NLTsDACDu8+3g7vTsKuIRugFdLvN/4BQ3ik3z3hc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9lLb0rYb9JOH+Q/+3fVJ6E0w0Hopt1XLrFOJmVGWiyw=;
	b=BpQpdTj3Iot6Jgf/nSGNwaJJ+z1kohm5qJoYcwsKuYi4cUwHfx0b3HjNMY790bfg
	iAHV+T4uelHAXnjNHIQCPzHutrCv1JZkNiz6TalhZyvtC+yxq3ZYxbVmWli/4VQFfmJ
	/702Pm2PFHSy7HeSeUR6vyXSd2X0jUqHnOdNiqdQ=
Content-Type: multipart/mixed; boundary="===============5753588394011860564=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.4 SUCCEEDED
Message-ID: <010101895b73ad00-a156cf73-2aa8-4d84-a3fc-7d442811b247-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184374

--===============5753588394011860564==
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
From 1a9ff20b324fc21c543bc840a42f9834d17865cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 14:55:49 +0000
Subject: [PATCH] ethtool: upgrade 6.3 -> 6.4

---
 .../ethtool/ethtool/avoid_parallel_tests.patch            | 8 ++++----
 .../ethtool/{ethtool_6.3.bb => ethtool_6.4.bb}            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.3.bb => ethtool_6.4.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 5e9024834c..8f674b9f12 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 08f887f4bc65684397bf8ec30cc61d91d894deac Mon Sep 17 00:00:00 2001
+From 41a00c496e306a3568573fd4880992872ebd37ff Mon Sep 17 00:00:00 2001
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


--===============5753588394011860564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3765440 to 3774328 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 47818 to 47987 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1594874 to 1598981 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1362532 to 1366298 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.3.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.4.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/ethtool: PV changed from "6.3" to "6.4"

--===============5753588394011860564==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.3-6.4.patch"

RnJvbSAxYTlmZjIwYjMyNGZjMjFjNTQzYmM4NDBhNDJmOTgzNGQxNzg2NWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTQ6NTU6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuMyAtPiA2LjQKCi0tLQogLi4uL2V0aHRvb2wvZXRodG9vbC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAgICAgIHwgOCArKysrLS0tLQogLi4uL2V0aHRv
b2wve2V0aHRvb2xfNi4zLmJiID0+IGV0aHRvb2xfNi40LmJifSAgICAgICAgICAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wve2V0aHRvb2xfNi4zLmJiID0+IGV0aHRvb2xf
Ni40LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29s
L2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IDVlOTAy
NDgzNGMuLjhmNjc0YjlmMTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMDhmODg3ZjRiYzY1Njg0Mzk3YmY4ZWMzMGNjNjFkOTFkODk0ZGVh
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDFhMDBjNDk2ZTMwNmEzNTY4NTczZmQ0
ODgwOTkyODcyZWJkMzdmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZs
b3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAxNCAxODo1
OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRlc3RzIGNv
bmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC0xNSwxMiArMTUsMTIgQEAgVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4
IGMxZTAwMTIuLmM0NjAzOTggMTAwNjQ0CitpbmRleCAyOTJlYWUzLi5kY2ZjMTA2IDEwMDY0NAog
LS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0yLDcgKzIsNyBAQCBk
bmwgUHJvY2VzcyB0aGlzIGZpbGUgd2l0aCBhdXRvY29uZiB0byBwcm9kdWNlIGEgY29uZmlndXJl
IHNjcmlwdC4KLSBBQ19JTklUKGV0aHRvb2wsIDYuMywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZykK
K0BAIC0zLDcgKzMsNyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuNCwgbmV0ZGV2QHZnZXIua2VybmVs
Lm9yZykKICBBQ19QUkVSRVEoMi41MikKKyBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCiAgQUNf
Q09ORklHX1NSQ0RJUihbZXRodG9vbC5jXSkKIC1BTV9JTklUX0FVVE9NQUtFKFtnbnUgc3ViZGly
LW9iamVjdHNdKQogK0FNX0lOSVRfQVVUT01BS0UoW2dudSBzdWJkaXItb2JqZWN0cyBzZXJpYWwt
dGVzdHNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9v
bF82LjMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuNC5iYgpz
aW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sXzYuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRv
b2wvZXRodG9vbF82LjQuYmIKaW5kZXggNTA0ZTY0NTk2Ni4uZmUzMDEyMDg4YyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjQuYmIKQEAgLTExLDcgKzExLDcg
QEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L3NvZnR3YXJlL25ldHdvcmsvZXRodG9v
bC9ldGh0b29sLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxl
bF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM0
MmQzN2QzZmUxOWRhNzlkMDI3NmM0YzY5YzM0YzYxZjFhZDhmODdiMDY1MTRkNjY0YmYxZWViMjli
ZmQ1MjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmI4MjY1YzNlYmJmZDY5MjllYTFkZDM4YTll
MmU1ZmQ0NDE2Yzc0NDNkNmEwZjlkNDc0ZDlmZGU4OTAxNDU4OCIKIAogVVBTVFJFQU1fQ0hFQ0tf
VVJJID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvZXRodG9v
bC8iCiAKLS0gCjIuMzkuMgoK

--===============5753588394011860564==--

