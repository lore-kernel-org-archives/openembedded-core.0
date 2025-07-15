Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A860FC87FCD
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.12481.1752594935495008197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tauXMtuP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qYA57Z+a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101980ecc79e0-e5a3cca8-df03-4233-a657-7d805fa323d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mo6/lP3EOYdH0so+nCC+NQMSSBtfSwGXO2gdwRyxuEs=;
	b=tauXMtuPFCEkWtEx9QHYs/AGlf8Q6yaxeuVWo+XBZXcr6bS/Le1yksRKuXKHN5Bf
	PB4XQhonJJHQBwI1e6oG+m7X0X5kjXwtjZuEBZavVuD5ovb+sfcf5IADF+oKSvJQZzC
	emSW1YwJ4igryYkZGw2YNF8KE7KmPb/c8dmC/hrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mo6/lP3EOYdH0so+nCC+NQMSSBtfSwGXO2gdwRyxuEs=;
	b=qYA57Z+auNLKa38U/xNKq316gHmxVA7XCG/Rg0DhRJfej3tTB//ijpSUV3H2sdXH
	dzpj+yAZH+iREsYn6c5bmCGiZFKQSRqZ1PGXYzfl4Mu/9VTl64FY0Jg6LoXZJRqpm7g
	AGhh1xazLouQdrSTU56N7Dgw9E/nIIEUIJWtbPdM=
Content-Type: multipart/mixed; boundary="===============2813955426328913710=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.50.1 SUCCEEDED
Message-ID: <010101980ecc79e0-e5a3cca8-df03-4233-a657-7d805fa323d3-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220333

--===============2813955426328913710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.50.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.50.0-2.50.1.patch
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
From ac3e78b3fe4aa080820ccaf0bdc36988d18fe7fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 09:35:39 +0000
Subject: [PATCH] git: upgrade 2.50.0 -> 2.50.1

---
 ...config.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 4 ++--
 meta/recipes-devtools/git/git/fixsort.patch                   | 2 +-
 meta/recipes-devtools/git/{git_2.50.0.bb => git_2.50.1.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.50.0.bb => git_2.50.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 61bf0e12dc..a808ce41ce 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
+From c008d66a5d9af008595672e5f0497472e04aa693 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index b12d4e1..b5b8d82 100644
+index 3e26bb0..a063133 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 7066e1808d..429b88c1e2 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
+From 990d2fd0d96ea3062810be83ef5b4ce4fac93f2d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
diff --git a/meta/recipes-devtools/git/git_2.50.0.bb b/meta/recipes-devtools/git/git_2.50.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.50.0.bb
rename to meta/recipes-devtools/git/git_2.50.1.bb
index 2d28fd05fc..36401c58f1 100644
--- a/meta/recipes-devtools/git/git_2.50.0.bb
+++ b/meta/recipes-devtools/git/git_2.50.1.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "920f8ca563d16a7d4fdecb44349cbffbc5cb814a8b36c96028463478197050da"
+SRC_URI[tarball.sha256sum] = "522d1635f8b62b484b0ce24993818aad3cab8e11ebb57e196bda38a3140ea915"
-- 
2.47.1


--===============2813955426328913710==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.50.0-2.50.1.patch"

RnJvbSBhYzNlNzhiM2ZlNGFhMDgwODIwY2NhZjBiZGMzNjk4OGQxOGZlN2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDk6MzU6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi41MC4wIC0+IDIuNTAuMQoKLS0tCiAuLi5jb25maWcubWFrLnVuYW1lLWRv
LW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoICAgICAgICAgICAgICAgICAgIHwg
MiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNTAuMC5iYiA9PiBnaXRfMi41
MC4xLmJifSAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQve2dpdF8yLjUwLjAu
YmIgPT4gZ2l0XzIuNTAuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1z
cGVjaWZpYy1idWlsZC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAx
LWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0
Y2gKaW5kZXggNjFiZjBlMTJkYy4uYTgwOGNlNDFjZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVM
LTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQv
Z2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1
aWxkLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzI1YzMwZGFjNGVhZmRkNDYzYzhmZmNm
ZTEyMTU4NThkNjQyYWI5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzAwOGQ2NmE1
ZDlhZjAwODU5NTY3MmU1ZjA0OTc0NzJlMDRhYTY5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBNb24s
IDcgRmViIDIwMjIgMTA6MTM6MTUgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlnLm1hay51
bmFtZTogZG8gbm90IGZvcmNlIFJIRUwtNyBzcGVjaWZpYyBidWlsZCBzZXR0aW5ncwpAQCAtMTcs
NyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJp
dmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZy5tYWsudW5hbWUgYi9jb25maWcubWFrLnVuYW1lCi1pbmRleCBiMTJkNGUxLi5iNWI4
ZDgyIDEwMDY0NAoraW5kZXggM2UyNmJiMC4uYTA2MzEzMyAxMDA2NDQKIC0tLSBhL2NvbmZpZy5t
YWsudW5hbWUKICsrKyBiL2NvbmZpZy5tYWsudW5hbWUKIEBAIC02MywxMCArNjMsNiBAQCBpZmVx
ICgkKHVuYW1lX1MpLExpbnV4KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dp
dC9naXQvZml4c29ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNv
cnQucGF0Y2gKaW5kZXggNzA2NmUxODA4ZC4uNDI5Yjg4YzFlMiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NWZh
NWMwZjg0OWZlNGExZTNjYjhlNmFmMDA4NmVmMDc0OGMyOGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA5OTBkMmZkMGQ5NmVhMzA2MjgxMGJlODNlZjViNGNlNGZhYzkzZjJkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDE3IEZlYiAyMDIxIDE3OjU3OjEzICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2g6IEZpeCBkZXRlcm1p
bmlzbSBpc3N1ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41
MC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41MC4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIu
NTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41MC4xLmJi
CmluZGV4IDJkMjhmZDA1ZmMuLjM2NDAxYzU4ZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9naXQvZ2l0XzIuNTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0
L2dpdF8yLjUwLjEuYmIKQEAgLTE3MCw0ICsxNzAsNCBAQCBFWFRSQV9PRUNPTkYgKz0gImFjX2N2
X3NucHJpbnRmX3JldHVybnNfYm9ndXM9bm8gXAogICAgICAgICAgICAgICAgICAiCiBFWFRSQV9P
RU1BS0UgKz0gIk5PX0dFVFRFWFQ9MSIKIAotU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAi
OTIwZjhjYTU2M2QxNmE3ZDRmZGVjYjQ0MzQ5Y2JmZmJjNWNiODE0YThiMzZjOTYwMjg0NjM0Nzgx
OTcwNTBkYSIKK1NSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gIjUyMmQxNjM1ZjhiNjJiNDg0
YjBjZTI0OTkzODE4YWFkM2NhYjhlMTFlYmI1N2UxOTZiZGEzOGEzMTQwZWE5MTUiCi0tIAoyLjQ3
LjEKCg==

--===============2813955426328913710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 100134824 to 100139064 (+0%)
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9965639 to 9966688 (+0%)
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-src: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/git: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git: PKGV changed from 2.50.0 [default] to 2.50.1 [default]
packages/core2-64-poky-linux/git: PV changed from "2.50.0" to "2.50.1"
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.50.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.50.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"

--===============2813955426328913710==--

