Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCA5CD3420
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2347.1762384575099218238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uOPzM+bF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=czB3Zrbs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564e86ee-54c8bebc-d046-401d-91d3-721a3e83d53c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r8hVSyR+xX0hkxN5QQwSWraLAzfWhbhZCMio1p4YOR8=;
	b=uOPzM+bFml4qwMc4/IKHX2EtiCfG2/hpZ8y57yqUyx3QZfCXJiSwzUhpJn17iYUo
	eaW9caNQuORE+499OjqHyoFTY1K++H5847BFsAR11FRMw+aQwBSY+SiUlX8dg8nVx0q
	LhBizH+FQ9TgdHdMFulyhBHuJONpFpX4q1dZYohQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r8hVSyR+xX0hkxN5QQwSWraLAzfWhbhZCMio1p4YOR8=;
	b=czB3ZrbsfhBuU3uUNcCeuF1vAZeDBiNrjJ76+PcBjcufMlLaNQElb1o++0SjpL78
	69xBpu7DfyBqgwr80cq1bXCCLebqwgFazHOKt4swsp9tAnEltjePztyFDQ1iM5LT+nZ
	JxsarhXsJ/9Bwg8ZNIws6XbI6GIllyloiCWe7qvI=
Content-Type: multipart/mixed; boundary="===============5260514928316303962=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.51.2 SUCCEEDED
Message-ID: <0101019a564e86ee-54c8bebc-d046-401d-91d3-721a3e83d53c-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225810

--===============5260514928316303962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.51.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.51.0-2.51.2.patch
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
From 14f508f0da61730c35f1bd1b91ea208222a029e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:07:41 +0000
Subject: [PATCH] git: upgrade 2.51.0 -> 2.51.2

---
 ...config.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 4 ++--
 meta/recipes-devtools/git/git/fixsort.patch                   | 2 +-
 meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 61bf0e12dc..4bc432c28a 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
+From d8936b5ea9096f500349444ddaa5f78c7a2dc4a6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index b12d4e1..b5b8d82 100644
+index 1691c6a..00d0f93 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 7066e1808d..263b68203c 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
+From 9f0bc924aee0133987a8b124a2d06166641da6e9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
diff --git a/meta/recipes-devtools/git/git_2.51.0.bb b/meta/recipes-devtools/git/git_2.51.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.51.0.bb
rename to meta/recipes-devtools/git/git_2.51.2.bb
index aeb8c54aa0..14d5a3d60e 100644
--- a/meta/recipes-devtools/git/git_2.51.0.bb
+++ b/meta/recipes-devtools/git/git_2.51.2.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "3d531799d2cf2cac8e294ec6e3229e07bfca60dc6c783fe69e7712738bef7283"
+SRC_URI[tarball.sha256sum] = "9b44c2b337ec838e10aad42439d390963904449710d30c9e7e4ba449f45da98f"
-- 
2.47.1


--===============5260514928316303962==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.51.0-2.51.2.patch"

RnJvbSAxNGY1MDhmMGRhNjE3MzBjMzVmMWJkMWI5MWVhMjA4MjIyYTAyOWUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjowNzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
dDogdXBncmFkZSAyLjUxLjAgLT4gMi41MS4yCgotLS0KIC4uLmNvbmZpZy5tYWsudW5hbWUtZG8t
bm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2ggICAgICAgICAgICAgICAgICAgfCAy
ICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi41MS4wLmJiID0+IGdpdF8yLjUx
LjIuYmJ9ICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNTEuMC5i
YiA9PiBnaXRfMi41MS4yLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9naXQvZ2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNw
ZWNpZmljLWJ1aWxkLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0LzAwMDEt
Y29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRj
aAppbmRleCA2MWJmMGUxMmRjLi40YmM0MzJjMjhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwt
Ny1zcGVjaWZpYy1idWlsZC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9n
aXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVp
bGQtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjVjMzBkYWM0ZWFmZGQ0NjNjOGZmY2Zl
MTIxNTg1OGQ2NDJhYjkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkODkzNmI1ZWE5
MDk2ZjUwMDM0OTQ0NGRkYWE1Zjc4YzdhMmRjNGE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IE1vbiwg
NyBGZWIgMjAyMiAxMDoxMzoxNSArMDEwMAogU3ViamVjdDogW1BBVENIXSBjb25maWcubWFrLnVu
YW1lOiBkbyBub3QgZm9yY2UgUkhFTC03IHNwZWNpZmljIGJ1aWxkIHNldHRpbmdzCkBAIC0xNyw3
ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2
ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
Y29uZmlnLm1hay51bmFtZSBiL2NvbmZpZy5tYWsudW5hbWUKLWluZGV4IGIxMmQ0ZTEuLmI1Yjhk
ODIgMTAwNjQ0CitpbmRleCAxNjkxYzZhLi4wMGQwZjkzIDEwMDY0NAogLS0tIGEvY29uZmlnLm1h
ay51bmFtZQogKysrIGIvY29uZmlnLm1hay51bmFtZQogQEAgLTYzLDEwICs2Myw2IEBAIGlmZXEg
KCQodW5hbWVfUyksTGludXgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0
L2dpdC9maXhzb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29y
dC5wYXRjaAppbmRleCA3MDY2ZTE4MDhkLi4yNjNiNjgyMDNjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY1ZmE1
YzBmODQ5ZmU0YTFlM2NiOGU2YWYwMDg2ZWYwNzQ4YzI4ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDlmMGJjOTI0YWVlMDEzMzk4N2E4YjEyNGEyZDA2MTY2NjQxZGE2ZTkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMTcgRmViIDIwMjEgMTc6NTc6MTMgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDogRml4IGRldGVybWlu
aXNtIGlzc3VlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjUx
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjUxLjIuYmIKc2ltaWxhcml0
eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41
MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjUxLjIuYmIK
aW5kZXggYWViOGM1NGFhMC4uMTRkNWEzZDYwZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC9naXRfMi41MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQv
Z2l0XzIuNTEuMi5iYgpAQCAtMTcwLDQgKzE3MCw0IEBAIEVYVFJBX09FQ09ORiArPSAiYWNfY3Zf
c25wcmludGZfcmV0dXJuc19ib2d1cz1ubyBcCiAgICAgICAgICAgICAgICAgICIKIEVYVFJBX09F
TUFLRSArPSAiTk9fR0VUVEVYVD0xIgogCi1TUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICIz
ZDUzMTc5OWQyY2YyY2FjOGUyOTRlYzZlMzIyOWUwN2JmY2E2MGRjNmM3ODNmZTY5ZTc3MTI3Mzhi
ZWY3MjgzIgorU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiOWI0NGMyYjMzN2VjODM4ZTEw
YWFkNDI0MzlkMzkwOTYzOTA0NDQ5NzEwZDMwYzllN2U0YmE0NDlmNDVkYTk4ZiIKLS0gCjIuNDcu
MQoK

--===============5260514928316303962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/git/git-bash-completion: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-dbg: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PKGSIZE changed from 100103256 to 100185264 (+0%)
packages/x86-64-v3-poky-linux/git/git-dev: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-dev: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-doc: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-doc: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-locale: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-locale: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-perltools: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-perltools: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-src: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-src: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-src: PKGSIZE changed from 10048766 to 10062752 (+0%)
packages/x86-64-v3-poky-linux/git/git-staticdev: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-staticdev: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-tk: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-tk: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git: PKGSIZE changed from 24761272 to 24785848 (+0%)
packages/x86-64-v3-poky-linux/git/gitweb: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/gitweb: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.51.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.51.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/x86-64-v3-poky-linux/git: PKGV changed from 2.51.0 [default] to 2.51.2 [default]

--===============5260514928316303962==--

