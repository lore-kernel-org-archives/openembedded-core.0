Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44E5CD12BC
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2013.1711994602774075911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YbHvodAS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=inAfNhMN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e9ad482b2-3d0648af-0840-4363-aa1e-3f8e8db079b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dcUdyMbCtFL0K4TQzE5Y2AOq5l984ymLcx/y2I2occs=;
	b=YbHvodAS+7C/7e+A2CVLLCaK168S2mv9Cp8V186AWZ3ulBqRSYsYy3CNViwa6MLw
	m0G6WVLE36NNez5VPFeYCR+8lhx13s+aNGFW++7JGvIQNlGv2i9hGz/oYJzBShHVsVu
	31HYOfeTZpb4ymTRZ2EE0BDjFmdLH7vOUYYsW43o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dcUdyMbCtFL0K4TQzE5Y2AOq5l984ymLcx/y2I2occs=;
	b=inAfNhMNKoUXmBRuRFtyINSLE0ef2sZsw5dU2Kl0kkEXGOwJmRTh04UTdU84GTxY
	yWLQbeNLisuIU5HDy5KVp4gsy/TG+lzzkoO9yyu22Guh7zht2yXPqUq0fFqz7nMDS9V
	ZNBPNI0uMKwNLzX5uJUr0MxaCVUXzZ/1ct6qgHxM=
Content-Type: multipart/mixed; boundary="===============3629098730005360760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psmisc: upgrading to 23.7 SUCCEEDED
Message-ID: <0101018e9ad482b2-3d0648af-0840-4363-aa1e-3f8e8db079b8-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197779

--===============3629098730005360760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *psmisc* to *23.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-psmisc-upgrade-23.6-23.7.patch
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
From e290070148708f51f01d874a6a3b40e2e24c25d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 11:18:58 +0000
Subject: [PATCH] psmisc: upgrade 23.6 -> 23.7

---
 .../psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 6 +++---
 .../psmisc/{psmisc_23.6.bb => psmisc_23.7.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.6.bb => psmisc_23.7.bb} (85%)

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
index ca13bdbd15..8f0d2d8bd5 100644
--- a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
@@ -1,4 +1,4 @@
-From 115fcf1daff18aa2f2e130d63704f04031878db0 Mon Sep 17 00:00:00 2001
+From 6dcfb691908d4678614b52d07512796b1cbd75b2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 24 Mar 2016 15:46:14 +0000
 Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
@@ -13,7 +13,7 @@ Upstream-Status: Pending
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/src/peekfd.c b/src/peekfd.c
-index 5aa990a..7e8e3fc 100644
+index 36dff04..2b4b1dc 100644
 --- a/src/peekfd.c
 +++ b/src/peekfd.c
 @@ -30,8 +30,11 @@
@@ -28,7 +28,7 @@ index 5aa990a..7e8e3fc 100644
  #include <getopt.h>
  #include <ctype.h>
  #include <dirent.h>
-@@ -266,11 +269,11 @@ int main(int argc, char **argv)
+@@ -341,11 +344,11 @@ int main(int argc, char **argv)
  		if (WIFSTOPPED(status)) {
  #ifdef PPC
  			struct pt_regs regs;
diff --git a/meta/recipes-extended/psmisc/psmisc_23.6.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
similarity index 85%
rename from meta/recipes-extended/psmisc/psmisc_23.6.bb
rename to meta/recipes-extended/psmisc/psmisc_23.7.bb
index 2e55ad00bd..ea272cd92d 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.6.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "3098e641dc1ddb210186f53464255670b480377b"
+SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============3629098730005360760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/psmisc: PACKAGES: added "psmisc-locale-ka psmisc-locale-ko"

--===============3629098730005360760==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-psmisc-upgrade-23.6-23.7.patch"

RnJvbSBlMjkwMDcwMTQ4NzA4ZjUxZjAxZDg3NGE2YTNiNDBlMmUyNGMyNWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMToxODo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBz
bWlzYzogdXBncmFkZSAyMy42IC0+IDIzLjcKCi0tLQogLi4uL3BzbWlzYy8wMDAxLVVzZS1VSU5U
UFRSX01BWC1pbnN0ZWFkLW9mLV9fV09SRFNJWkUucGF0Y2ggfCA2ICsrKy0tLQogLi4uL3BzbWlz
Yy97cHNtaXNjXzIzLjYuYmIgPT4gcHNtaXNjXzIzLjcuYmJ9ICAgICAgICAgICAgICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3twc21pc2NfMjMuNi5iYiA9PiBwc21pc2Nf
MjMuNy5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHNtaXNj
L3BzbWlzYy8wMDAxLVVzZS1VSU5UUFRSX01BWC1pbnN0ZWFkLW9mLV9fV09SRFNJWkUucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3BzbWlzYy8wMDAxLVVzZS1VSU5UUFRSX01B
WC1pbnN0ZWFkLW9mLV9fV09SRFNJWkUucGF0Y2gKaW5kZXggY2ExM2JkYmQxNS4uOGYwZDJkOGJk
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy9wc21pc2MvMDAwMS1V
c2UtVUlOVFBUUl9NQVgtaW5zdGVhZC1vZi1fX1dPUkRTSVpFLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9wc21pc2MvcHNtaXNjLzAwMDEtVXNlLVVJTlRQVFJfTUFYLWluc3RlYWQt
b2YtX19XT1JEU0laRS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTE1ZmNmMWRhZmYxOGFh
MmYyZTEzMGQ2MzcwNGYwNDAzMTg3OGRiMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NmRjZmI2OTE5MDhkNDY3ODYxNGI1MmQwNzUxMjc5NmIxY2JkNzViMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUs
IDI0IE1hciAyMDE2IDE1OjQ2OjE0ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSBVSU5UUFRS
X01BWCBpbnN0ZWFkIG9mIF9fV09SRFNJWkUKQEAgLTEzLDcgKzEzLDcgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9wZWVrZmQuYyBiL3NyYy9wZWVrZmQuYwotaW5kZXgg
NWFhOTkwYS4uN2U4ZTNmYyAxMDA2NDQKK2luZGV4IDM2ZGZmMDQuLjJiNGIxZGMgMTAwNjQ0CiAt
LS0gYS9zcmMvcGVla2ZkLmMKICsrKyBiL3NyYy9wZWVrZmQuYwogQEAgLTMwLDggKzMwLDExIEBA
CkBAIC0yOCw3ICsyOCw3IEBAIGluZGV4IDVhYTk5MGEuLjdlOGUzZmMgMTAwNjQ0CiAgI2luY2x1
ZGUgPGdldG9wdC5oPgogICNpbmNsdWRlIDxjdHlwZS5oPgogICNpbmNsdWRlIDxkaXJlbnQuaD4K
LUBAIC0yNjYsMTEgKzI2OSwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCitA
QCAtMzQxLDExICszNDQsMTEgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogIAkJ
aWYgKFdJRlNUT1BQRUQoc3RhdHVzKSkgewogICNpZmRlZiBQUEMKICAJCQlzdHJ1Y3QgcHRfcmVn
cyByZWdzOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy9wc21pc2Nf
MjMuNi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21pc2MvcHNtaXNjXzIzLjcuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlz
Yy9wc21pc2NfMjMuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy9w
c21pc2NfMjMuNy5iYgppbmRleCAyZTU1YWQwMGJkLi5lYTI3MmNkOTJkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3BzbWlzY18yMy42LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9wc21pc2MvcHNtaXNjXzIzLjcuYmIKQEAgLTUsNSArNSw1IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTA2MzZlNzNmZjAyMTVlOGQ2NzJkYzRj
MzJjMzE3YmIzIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuY29tL3BzbWlzYy9wc21pc2MuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1V
c2UtVUlOVFBUUl9NQVgtaW5zdGVhZC1vZi1fX1dPUkRTSVpFLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDUkVWID0gIjMwOThlNjQxZGMxZGRiMjEwMTg2ZjUzNDY0MjU1NjcwYjQ4MDM3N2IiCitT
UkNSRVYgPSAiOTA5MWQ2ZGJjY2UzZDhmYjg3YWRmOTI0OWEyZWIzNDZkMjVhNTYyYyIKIFMgPSAi
JHtXT1JLRElSfS9naXQiCi0tIAoyLjQyLjAKCg==

--===============3629098730005360760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/psmisc/fuser-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/fuser-doc: PKGSIZE changed from 7585 to 7817 (+3%)
packages/core2-64-poky-linux/psmisc/fuser-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/fuser: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/fuser: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/killall-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/killall-doc: PKGSIZE changed from 5435 to 5456 (+0%)
packages/core2-64-poky-linux/psmisc/killall-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/killall: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/killall: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc: PACKAGES: added "psmisc-locale-ko psmisc-locale-ka"
packages/core2-64-poky-linux/psmisc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-dbg: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-dbg: PKGSIZE changed from 319600 to 320720 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-dbg: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-dev: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-dev: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-extras: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-extras: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-bg: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-bg: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ca: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ca: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-cs: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-cs: PKGSIZE changed from 18820 to 18667 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-cs: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-da: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-da: PKGSIZE changed from 17817 to 17551 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-da: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-de: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-de: PKGSIZE changed from 19007 to 18853 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-de: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-el: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-el: PKGSIZE changed from 20518 to 20607 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-el: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-eo: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-eo: PKGSIZE changed from 17801 to 17860 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-eo: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-es: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-es: PKGSIZE changed from 19187 to 19035 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-es: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-eu: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-eu: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-fi: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-fi: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-fr: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-fr: PKGSIZE changed from 19132 to 18979 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-fr: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-hr: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-hr: PKGSIZE changed from 18551 to 18391 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-hr: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-hu: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-hu: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-id: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-id: PKGSIZE changed from 18488 to 18104 (-2%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-id: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-it: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-it: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ja: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ja: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-nb: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-nb: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-nl: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-nl: PKGSIZE changed from 18155 to 18295 (+1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-nl: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-pl: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-pl: PKGSIZE changed from 18770 to 18618 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-pl: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt-br: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt-br: PKGSIZE changed from 18305 to 18167 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt-br: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt: PKGSIZE changed from 18161 to 18025 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ro: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ro: PKGSIZE changed from 19666 to 19506 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-ro: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ru: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ru: PKGSIZE changed from 23507 to 23424 (-0%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-ru: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-sr: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-sr: PKGSIZE changed from 22645 to 22443 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-sr: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-sv: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-sv: PKGSIZE changed from 18355 to 17974 (-2%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-sv: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-uk: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-uk: PKGSIZE changed from 23962 to 23815 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-uk: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-vi: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-vi: PKGSIZE changed from 20219 to 20359 (+1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-vi: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-cn: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-cn: PKGSIZE changed from 17755 to 17602 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-cn: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-tw: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-tw: PKGSIZE changed from 17868 to 17727 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-tw: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-src: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-src: PKGSIZE changed from 177702 to 178548 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-src: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-staticdev: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-staticdev: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/pstree-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/pstree-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/pstree: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/pstree: PV changed from "23.6" to "23.7"

--===============3629098730005360760==--

