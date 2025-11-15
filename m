Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383BBCEBF79
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12113.1763224714356595535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rqpr197x;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JFuAzZMP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a88620faa-cb2adc6d-9846-4bbb-b612-771e2671ddc0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DAvkV2ukjSoM70CQ8ZWOvcx6nb+lTq7rqB4jy3eWjes=;
	b=rqpr197xi3IRDTUWhiyM/AQ+EMsHY8V7S/LKFbCIw6ZU0H9qT8NIkESivgTd4Wky
	0ly+mP2WEe3ei5Nl+UFFs0IaqHECkmcsCzt13ymTjQITPdG59hmyRtfRAA2yDQ/atZH
	pFOVdVNxbJVfTS6y5pBF0s1U8bbcMAT7hvdE7loM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DAvkV2ukjSoM70CQ8ZWOvcx6nb+lTq7rqB4jy3eWjes=;
	b=JFuAzZMPJEacNevrNMeiEXoIyMGJYyHYg53zOfeuhxT3S8WDD0PWqiRWr1DuD3Vx
	u5QduZEkdKVMKjRnvSHDuo0JCIv2aYdTxFDV8kN6/LjlZ/wHjkDIi0NSGkr0z4SHPrF
	3YAZbWw7h5XkLpiH6ZkvbMUnhvLW3rn2ATI6c7Gs=
Content-Type: multipart/mixed; boundary="===============6993417076691430081=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.51.2 SUCCEEDED
Message-ID: <0101019a88620faa-cb2adc6d-9846-4bbb-b612-771e2671ddc0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226335

--===============6993417076691430081==
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
From 3a2569f563351120e315eccc36ba9baf96a050b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:20:17 +0000
Subject: [PATCH] git: upgrade 2.51.0 -> 2.51.2

---
 ...config.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 4 ++--
 meta/recipes-devtools/git/git/fixsort.patch                   | 2 +-
 meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 61bf0e12dc..f55282fcca 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
+From e8aebf375140b67fb48baea10af2ac0088fe6768 Mon Sep 17 00:00:00 2001
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
index 7066e1808d..8c60bd5c21 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
+From 7b509d1e3f9acbbe0c35ef62f54cfa2ed8f9a740 Mon Sep 17 00:00:00 2001
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


--===============6993417076691430081==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.51.0-2.51.2.patch"

RnJvbSAzYTI1NjlmNTYzMzUxMTIwZTMxNWVjY2MzNmJhOWJhZjk2YTA1MGI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6MjA6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi41MS4wIC0+IDIuNTEuMgoKLS0tCiAuLi5jb25maWcubWFrLnVuYW1lLWRv
LW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoICAgICAgICAgICAgICAgICAgIHwg
MiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNTEuMC5iYiA9PiBnaXRfMi41
MS4yLmJifSAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQve2dpdF8yLjUxLjAu
YmIgPT4gZ2l0XzIuNTEuMi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1z
cGVjaWZpYy1idWlsZC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAx
LWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0
Y2gKaW5kZXggNjFiZjBlMTJkYy4uZjU1MjgyZmNjYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVM
LTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQv
Z2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1
aWxkLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzI1YzMwZGFjNGVhZmRkNDYzYzhmZmNm
ZTEyMTU4NThkNjQyYWI5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZThhZWJmMzc1
MTQwYjY3ZmI0OGJhZWExMGFmMmFjMDA4OGZlNjc2OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBNb24s
IDcgRmViIDIwMjIgMTA6MTM6MTUgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlnLm1hay51
bmFtZTogZG8gbm90IGZvcmNlIFJIRUwtNyBzcGVjaWZpYyBidWlsZCBzZXR0aW5ncwpAQCAtMTcs
NyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJp
dmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZy5tYWsudW5hbWUgYi9jb25maWcubWFrLnVuYW1lCi1pbmRleCBiMTJkNGUxLi5iNWI4
ZDgyIDEwMDY0NAoraW5kZXggMTY5MWM2YS4uMDBkMGY5MyAxMDA2NDQKIC0tLSBhL2NvbmZpZy5t
YWsudW5hbWUKICsrKyBiL2NvbmZpZy5tYWsudW5hbWUKIEBAIC02MywxMCArNjMsNiBAQCBpZmVx
ICgkKHVuYW1lX1MpLExpbnV4KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dp
dC9naXQvZml4c29ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNv
cnQucGF0Y2gKaW5kZXggNzA2NmUxODA4ZC4uOGM2MGJkNWMyMSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NWZh
NWMwZjg0OWZlNGExZTNjYjhlNmFmMDA4NmVmMDc0OGMyOGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA3YjUwOWQxZTNmOWFjYmJlMGMzNWVmNjJmNTRjZmEyZWQ4ZjlhNzQwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDE3IEZlYiAyMDIxIDE3OjU3OjEzICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2g6IEZpeCBkZXRlcm1p
bmlzbSBpc3N1ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41
MS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41MS4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIu
NTEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41MS4yLmJi
CmluZGV4IGFlYjhjNTRhYTAuLjE0ZDVhM2Q2MGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9naXQvZ2l0XzIuNTEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0
L2dpdF8yLjUxLjIuYmIKQEAgLTE3MCw0ICsxNzAsNCBAQCBFWFRSQV9PRUNPTkYgKz0gImFjX2N2
X3NucHJpbnRmX3JldHVybnNfYm9ndXM9bm8gXAogICAgICAgICAgICAgICAgICAiCiBFWFRSQV9P
RU1BS0UgKz0gIk5PX0dFVFRFWFQ9MSIKIAotU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAi
M2Q1MzE3OTlkMmNmMmNhYzhlMjk0ZWM2ZTMyMjllMDdiZmNhNjBkYzZjNzgzZmU2OWU3NzEyNzM4
YmVmNzI4MyIKK1NSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gIjliNDRjMmIzMzdlYzgzOGUx
MGFhZDQyNDM5ZDM5MDk2MzkwNDQ0OTcxMGQzMGM5ZTdlNGJhNDQ5ZjQ1ZGE5OGYiCi0tIAoyLjQ3
LjEKCg==

--===============6993417076691430081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/git/git-bash-completion: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PKGSIZE changed from 100103328 to 100185200 (+0%)
packages/x86-64-v3-poky-linux/git/git-dbg: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-dbg: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-dev: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-dev: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-doc: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-doc: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-locale: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-locale: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-perltools: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-perltools: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-src: PKGSIZE changed from 10048766 to 10062752 (+0%)
packages/x86-64-v3-poky-linux/git/git-src: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-src: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-staticdev: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-staticdev: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git-tk: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git-tk: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/git: PKGSIZE changed from 24761272 to 24785848 (+0%)
packages/x86-64-v3-poky-linux/git/git: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/git: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git/gitweb: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git/gitweb: PKGV changed from 2.51.0 [default] to 2.51.2 [default]
packages/x86-64-v3-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.51.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.51.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/x86-64-v3-poky-linux/git: PV changed from "2.51.0" to "2.51.2"
packages/x86-64-v3-poky-linux/git: PKGV changed from 2.51.0 [default] to 2.51.2 [default]

--===============6993417076691430081==--

