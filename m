Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0A6D10DA1
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.149801.1733047556866462461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cXHjDbup;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=D5nUWFSk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019381af1780-552d6f22-9ef0-458d-8d46-53d963a43a53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=REBDHQjYkIoVelNh6B/xy97Qi+oL6ZH5MsC6Be07xQw=;
	b=cXHjDbuprMRu1D04Ahm8KQYySO/Vdz1Wr1BDNtB/Bo3+Ny0ddcnVfDgjoMFW6pH9
	1JVNyP/tQ4jekN2sPRyOtopZDfpU4VoVEsz4QcsO+9GrEy5rr3qN/Hj/sqkwXBfbYmZ
	lKEyvo/7jfZ383/QIE36WzsOuqM/4kx01lLUyL8k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=REBDHQjYkIoVelNh6B/xy97Qi+oL6ZH5MsC6Be07xQw=;
	b=D5nUWFSklIHbLDnIrXHO/CES5S7bMjO+E9+jYVQEFaULyTa2BRtVvfuAuAPQUAcA
	Q9Vyvt+TJB024gJ0xPQmdrp62EmPYyWNEYZQ5iL+UKvSAMh0UAhhu8bNeiTgnQQ0Wca
	v2lUBm4Jv40DiM7JeDcT/bRQEGE3xmdjjVn4ESrI=
Content-Type: multipart/mixed; boundary="===============5347065796967017776=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.47.1 SUCCEEDED
Message-ID: <0101019381af1780-552d6f22-9ef0-458d-8d46-53d963a43a53-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208065

--===============5347065796967017776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.47.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.47.0-2.47.1.patch
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
From 3daea66f7ddc7bcd6ccaed15b5dc5bc6e15b6caa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 07:01:59 +0000
Subject: [PATCH] git: upgrade 2.47.0 -> 2.47.1

---
 ...config.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 2 +-
 meta/recipes-devtools/git/git/fixsort.patch                   | 4 ++--
 meta/recipes-devtools/git/{git_2.47.0.bb => git_2.47.1.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.47.0.bb => git_2.47.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index e5135928f0..fc514b535c 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 348811a6f818408a31551d0830dcfe31c55d06a8 Mon Sep 17 00:00:00 2001
+From 5702d4d02fdc343e5627f2492e0f6f59de9567d1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index d9a3672f1d..d47052f936 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,7 +1,7 @@
-From 83ae059943d3efd824978a759bcfd894ce5085d4 Mon Sep 17 00:00:00 2001
+From c0ebeb2e2df3fba12ab864a533150954f9eb935c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
-Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
+Subject: [PATCH] generate-configlist.sh: Fix determinism issue
 
 Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
diff --git a/meta/recipes-devtools/git/git_2.47.0.bb b/meta/recipes-devtools/git/git_2.47.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.47.0.bb
rename to meta/recipes-devtools/git/git_2.47.1.bb
index 67356874b5..8b5bfecd6a 100644
--- a/meta/recipes-devtools/git/git_2.47.0.bb
+++ b/meta/recipes-devtools/git/git_2.47.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "a84a7917e0ab608312834413f01fc01edc7844f9f9002ba69f3b4f4bcb8d937a"
+SRC_URI[tarball.sha256sum] = "f4c4e98667800585d218dfdf415eb72f73baa7abcac4569e2ce497970f8d6665"
-- 
2.44.1


--===============5347065796967017776==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.47.0-2.47.1.patch"

RnJvbSAzZGFlYTY2ZjdkZGM3YmNkNmNjYWVkMTViNWRjNWJjNmUxNWI2Y2FhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNzowMTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
dDogdXBncmFkZSAyLjQ3LjAgLT4gMi40Ny4xCgotLS0KIC4uLmNvbmZpZy5tYWsudW5hbWUtZG8t
bm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoICAgICAgICAgICAgICAgICAgIHwgNCAr
Ky0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi40Ny4wLmJiID0+IGdpdF8yLjQ3
LjEuYmJ9ICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNDcuMC5i
YiA9PiBnaXRfMi40Ny4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9naXQvZ2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNw
ZWNpZmljLWJ1aWxkLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0LzAwMDEt
Y29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRj
aAppbmRleCBlNTEzNTkyOGYwLi5mYzUxNGI1MzVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwt
Ny1zcGVjaWZpYy1idWlsZC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9n
aXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVp
bGQtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNDg4MTFhNmY4MTg0MDhhMzE1NTFkMDgz
MGRjZmUzMWM1NWQwNmE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1NzAyZDRkMDJm
ZGMzNDNlNTYyN2YyNDkyZTBmNmY1OWRlOTU2N2QxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IE1vbiwg
NyBGZWIgMjAyMiAxMDoxMzoxNSArMDEwMAogU3ViamVjdDogW1BBVENIXSBjb25maWcubWFrLnVu
YW1lOiBkbyBub3QgZm9yY2UgUkhFTC03IHNwZWNpZmljIGJ1aWxkIHNldHRpbmdzCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaAppbmRleCBkOWEzNjcyZjFkLi5k
NDcwNTJmOTM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhz
b3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0
Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDgzYWUwNTk5NDNkM2VmZDgyNDk3OGE3NTliY2ZkODk0
Y2U1MDg1ZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGMwZWJlYjJlMmRmM2ZiYTEy
YWI4NjRhNTMzMTUwOTU0ZjllYjkzNWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6
IFdlZCwgMTcgRmViIDIwMjEgMTc6NTc6MTMgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gW1BBVENI
XSBnZW5lcmF0ZS1jb25maWdsaXN0LnNoOiBGaXggZGV0ZXJtaW5pc20gaXNzdWUKK1N1YmplY3Q6
IFtQQVRDSF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDogRml4IGRldGVybWluaXNtIGlzc3VlCiAK
IEN1cnJlbnRseSBnaXQgYmluYXJpZXMgYXJlIG5vdCBlbnRpcmVseSByZXByb2R1Y2libGUsIGF0
IGxlYXN0IHBhcnRseQogZHVlIHRvIGNvbmZpZy1saXN0LmggZGlmZmVyaW5nIGluIG9yZGVyIGRl
cGVuZGluZyBvbiB0aGUgc3lzdGVtJ3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9naXQvZ2l0XzIuNDcuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDcu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2l0L2dpdF8yLjQ3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQv
Z2l0XzIuNDcuMS5iYgppbmRleCA2NzM1Njg3NGI1Li44YjViZmVjZDZhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dpdC9naXRfMi40Ny4xLmJiCkBAIC0xNjQsNCArMTY0LDQgQEAgRVhUUkFfT0VD
T05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5zX2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAg
ICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRURVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5z
aGEyNTZzdW1dID0gImE4NGE3OTE3ZTBhYjYwODMxMjgzNDQxM2YwMWZjMDFlZGM3ODQ0ZjlmOTAw
MmJhNjlmM2I0ZjRiY2I4ZDkzN2EiCitTUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICJmNGM0
ZTk4NjY3ODAwNTg1ZDIxOGRmZGY0MTVlYjcyZjczYmFhN2FiY2FjNDU2OWUyY2U0OTc5NzBmOGQ2
NjY1IgotLSAKMi40NC4xCgo=

--===============5347065796967017776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PKGSIZE changed from 93629 to 93627 (-0%)
packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 92205376 to 92199984 (-0%)
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9840724 to 9841580 (+0%)
packages/core2-64-poky-linux/git/git-src: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 24449877 to 24453653 (+0%)
packages/core2-64-poky-linux/git/git: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.47.0" to "2.47.1"
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.47.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.47.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-64-poky-linux/git: PKGV changed from 2.47.0 [default] to 2.47.1 [default]
packages/core2-64-poky-linux/git: PV changed from "2.47.0" to "2.47.1"

--===============5347065796967017776==--

