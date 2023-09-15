Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03961EEE27A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.29681.1694804394224851634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OVhagk0v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cPVa41wM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a9a36bda4-53816a3b-6be0-4f4f-b1d0-ea393beb95fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=KGmpEy1RIZwAwu3dXAN7bkR55lzg21N2XgZtUiPeqFU=;
	b=OVhagk0vUcVNS/wO4fNf4RdXGzR7wOA3XX+SZQVdlAujBt51SA/DsoPYpQ2CHw3U
	dWsM+EA8Mkk4xP+m5vwFh7SEPX9BYo6BUegnzgdFRhGyXFIrVOZHfm/Rs/BKYGA4O8x
	dt/5bvCNEefAqIEkkSB8Syvlzx6Xit6yPiqNJJnw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=KGmpEy1RIZwAwu3dXAN7bkR55lzg21N2XgZtUiPeqFU=;
	b=cPVa41wM0b5yw567XnHO3SvHcf0eSdr/kciUU0+/lN1UyRj8XO50TaLe6g79LV0E
	REhgQ0EErU+Me/ooRuCzo5ntEhg/uOyt/E6lGkT/Wnm4ejcp5bZ6tR16urnlP8O9jVs
	jttg/OqdYVXlbtvNUERzu0CUaWKpb5xjimDX/AM8=
Content-Type: multipart/mixed; boundary="===============5054466736850064874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 68.2.2 SUCCEEDED
Message-ID: <0101018a9a36bda4-53816a3b-6be0-4f4f-b1d0-ea393beb95fd-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187716

--===============5054466736850064874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *68.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-68.2.1-68.2.2.patch
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
From bc77c8f01870ba87aeabddbefaab1cdb7b93a4ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 10:38:24 +0000
Subject: [PATCH] python3-setuptools: upgrade 68.2.1 -> 68.2.2

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_68.2.1.bb => python3-setuptools_68.2.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.2.1.bb => python3-setuptools_68.2.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 6b467184d7..9b17dba178 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From c4a48e6a75a5865a7c8d61a0f060aca9ba92477b Mon Sep 17 00:00:00 2001
+From 519e2845014f04b4c23b5cf8f92fc4e5dcf40f20 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_68.2.1.bb b/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.2.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
index e4aaa914a3..06957d7000 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.2.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "56ee14884fd8d0cd015411f4a13f40b4356775a0aefd9ebc1d3bfb9a1acb32f1"
+SRC_URI[sha256sum] = "4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.39.2


--===============5054466736850064874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-68.2.1.tar.gz;downloadfilename=setuptools-68.2.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-68.2.2.tar.gz;downloadfilename=setuptools-68.2.2.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4760547 to 4760385 (-0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "68.2.1" to "68.2.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 68.2.1 [default] to 68.2.2 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.2.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.2.2.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.2.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.2.2.dist-info

--===============5054466736850064874==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-68.2.1-68.2.2.patch"

RnJvbSBiYzc3YzhmMDE4NzBiYTg3YWVhYmRkYmVmYWFiMWNkYjdiOTNhNGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTA6Mzg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjguMi4xIC0+IDY4LjIuMgoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182OC4yLjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY4LjIuMi5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjguMi4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182OC4yLjIuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggNmI0NjcxODRkNy4uOWIxN2RiYTE3OCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBjNGE0OGU2YTc1YTU4NjVhN2M4ZDYxYTBmMDYwYWNhOWJhOTI0NzdiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1MTllMjg0NTAxNGYwNGI0YzIzYjVjZjhmOTJmYzRlNWRj
ZjQwZjIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjguMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjguMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY4LjIu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjguMi4yLmJiCmluZGV4IGU0YWFhOTE0YTMuLjA2OTU3ZDcwMDAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY4LjIuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
OC4yLjIuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5w
eS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNTZlZTE0ODg0ZmQ4ZDBjZDAxNTQxMWY0YTEzZjQwYjQzNTY3NzVhMGFlZmQ5ZWJjMWQz
YmZiOWExYWNiMzJmMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0YWMxNDc1Mjc2ZDJmMWM0ODY4
NDg3NDA4OWZlZmNkODNiZDcxNjJkZGFhZmI4MWZhYzg2NmJhMGRiMjgyYTg3IgogCiBERVBFTkRT
ICs9ICIke1BZVEhPTl9QTn0iCiAKLS0gCjIuMzkuMgoK

--===============5054466736850064874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.2.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.2.2.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.2.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.2.2.dist-info

--===============5054466736850064874==--

