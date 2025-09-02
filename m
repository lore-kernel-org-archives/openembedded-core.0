Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55950CA1012
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.89796.1756850187760647337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gmxqof0o;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hf2KKzlT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101990c6e6b04-e2be03a9-9bf3-421a-bfdb-79a10a72d19c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850187;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=thMBHkRCvLs7PiPCHs1kdno/3JSexYCu6AGpVudY1eQ=;
	b=gmxqof0oZ/9WIP0mzGALwcNS5oM8GOolZuGffwFKhV3edeCunIcEUJvb0ZTgxRz5
	byYGtwXnRgqUuue3J+ZmELHgMSXP9gxTeUYZJ7ywXzAh9tmjUbjhvPMXi8+mWJbDJee
	jnwM8056N5F8anEVyWR5n6ZngEHJIT19lpmy289Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850187;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=thMBHkRCvLs7PiPCHs1kdno/3JSexYCu6AGpVudY1eQ=;
	b=hf2KKzlTazLQMTzkxBhS1FERFiijJMwdW1tGsyxVlZQRZXzLtoZl+2oHjD4/+2Ae
	o7gRahHl/3trekt8Ic/tt9Af+qa5BFJCc2wdPlSMKJa3n5yCaF3FpRrhv8dJKCskTxC
	hJ3IfgUkHH7J1nJxQrGblp/PQt64UN6M4dMgmKuo=
Content-Type: multipart/mixed; boundary="===============3029115938531204363=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.51.0 SUCCEEDED
Message-ID: <010101990c6e6b04-e2be03a9-9bf3-421a-bfdb-79a10a72d19c-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222773

--===============3029115938531204363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.51.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.50.1-2.51.0.patch
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
From 086cbe7b1d7d7205b1be6317607502b5843d50fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 17:27:27 +0000
Subject: [PATCH] git: upgrade 2.50.1 -> 2.51.0

---
 ...config.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 4 ++--
 meta/recipes-devtools/git/git/fixsort.patch                   | 2 +-
 meta/recipes-devtools/git/{git_2.50.1.bb => git_2.51.0.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.50.1.bb => git_2.51.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 61bf0e12dc..fed25c62f6 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
+From a3aeab066f92c2c02e4b13404438c1d648bbda71 Mon Sep 17 00:00:00 2001
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
index 7066e1808d..eb7f1c7ed4 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
+From 8b3f16b2e794794d36f6187d0055b69e32b57d2c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
diff --git a/meta/recipes-devtools/git/git_2.50.1.bb b/meta/recipes-devtools/git/git_2.51.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.50.1.bb
rename to meta/recipes-devtools/git/git_2.51.0.bb
index 36401c58f1..aeb8c54aa0 100644
--- a/meta/recipes-devtools/git/git_2.50.1.bb
+++ b/meta/recipes-devtools/git/git_2.51.0.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "522d1635f8b62b484b0ce24993818aad3cab8e11ebb57e196bda38a3140ea915"
+SRC_URI[tarball.sha256sum] = "3d531799d2cf2cac8e294ec6e3229e07bfca60dc6c783fe69e7712738bef7283"
-- 
2.47.1


--===============3029115938531204363==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.50.1-2.51.0.patch"

RnJvbSAwODZjYmU3YjFkN2Q3MjA1YjFiZTYzMTc2MDc1MDJiNTg0M2Q1MGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNzoyNzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
dDogdXBncmFkZSAyLjUwLjEgLT4gMi41MS4wCgotLS0KIC4uLmNvbmZpZy5tYWsudW5hbWUtZG8t
bm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2ggICAgICAgICAgICAgICAgICAgfCAy
ICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi41MC4xLmJiID0+IGdpdF8yLjUx
LjAuYmJ9ICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNTAuMS5i
YiA9PiBnaXRfMi41MS4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9naXQvZ2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNw
ZWNpZmljLWJ1aWxkLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0LzAwMDEt
Y29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRj
aAppbmRleCA2MWJmMGUxMmRjLi5mZWQyNWM2MmY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwt
Ny1zcGVjaWZpYy1idWlsZC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9n
aXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVp
bGQtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjVjMzBkYWM0ZWFmZGQ0NjNjOGZmY2Zl
MTIxNTg1OGQ2NDJhYjkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhM2FlYWIwNjZm
OTJjMmMwMmU0YjEzNDA0NDM4YzFkNjQ4YmJkYTcxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
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
dC5wYXRjaAppbmRleCA3MDY2ZTE4MDhkLi5lYjdmMWM3ZWQ0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY1ZmE1
YzBmODQ5ZmU0YTFlM2NiOGU2YWYwMDg2ZWYwNzQ4YzI4ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDhiM2YxNmIyZTc5NDc5NGQzNmY2MTg3ZDAwNTViNjllMzJiNTdkMmMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMTcgRmViIDIwMjEgMTc6NTc6MTMgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDogRml4IGRldGVybWlu
aXNtIGlzc3VlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjUw
LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjUxLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41
MC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjUxLjAuYmIK
aW5kZXggMzY0MDFjNThmMS4uYWViOGM1NGFhMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC9naXRfMi41MC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQv
Z2l0XzIuNTEuMC5iYgpAQCAtMTcwLDQgKzE3MCw0IEBAIEVYVFJBX09FQ09ORiArPSAiYWNfY3Zf
c25wcmludGZfcmV0dXJuc19ib2d1cz1ubyBcCiAgICAgICAgICAgICAgICAgICIKIEVYVFJBX09F
TUFLRSArPSAiTk9fR0VUVEVYVD0xIgogCi1TUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICI1
MjJkMTYzNWY4YjYyYjQ4NGIwY2UyNDk5MzgxOGFhZDNjYWI4ZTExZWJiNTdlMTk2YmRhMzhhMzE0
MGVhOTE1IgorU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiM2Q1MzE3OTlkMmNmMmNhYzhl
Mjk0ZWM2ZTMyMjllMDdiZmNhNjBkYzZjNzgzZmU2OWU3NzEyNzM4YmVmNzI4MyIKLS0gCjIuNDcu
MQoK

--===============3029115938531204363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-bash-completion: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-dbg: PKGSIZE changed from 100161840 to 100104136 (-0%)
packages/x86-64-v3-poky-linux/git/git-dbg: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-dev: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-dev: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-doc: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-doc: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-locale: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-locale: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-perltools: PKGSIZE changed from 276251 to 277441 (+0%)
packages/x86-64-v3-poky-linux/git/git-perltools: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-perltools: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-src: PKGSIZE changed from 9966688 to 10048766 (+1%)
packages/x86-64-v3-poky-linux/git/git-src: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.50.1/sha256/block -> /usr/src/debug/git/2.51.0/sha256/block, directory renamed /usr/src/debug/git/2.50.1/reftable -> /usr/src/debug/git/2.51.0/reftable, directory renamed /usr/src/debug/git/2.50.1/compat/linux -> /usr/src/debug/git/2.51.0/compat/linux, directory renamed /usr/src/debug/git/2.50.1/trace2 -> /usr/src/debug/git/2.51.0/trace2, directory renamed /usr/src/debug/git/2.50.1/xdiff -> /usr/src/debug/git/2.51.0/xdiff, directory renamed /usr/src/debug/git/2.50.1/negotiator -> /usr/src/debug/git/2.51.0/negotiator, directory renamed /usr/src/debug/git/2.50.1/builtin -> /usr/src/debug/git/2.51.0/builtin, directory renamed /usr/src/debug/git/2.50.1/refs -> /usr/src/debug/git/2.51.0/refs, directory renamed /usr/src/debug/git/2.50.1/compat -> /usr/src/debug/git/2.51.0/compat, directory renamed /usr/src/debug/git/2.50.1/compiler-tricks -> /usr/src/debug/git/2.51.0/compiler-tricks, directory renam
 ed /usr/src/debug/git/2.50.1/ewah -> /usr/src/debug/git/2.51.0/ewah, directory renamed /usr/src/debug/git/2.50.1/sha1dc -> /usr/src/debug/git/2.51.0/sha1dc, removed "/usr/src/debug/git/2.50.1/commit-graph.h /usr/src/debug/git/2.50.1/object.c /usr/src/debug/git/2.50.1/credential.c /usr/src/debug/git/2.50.1/oidtree.c /usr/src/debug/git/2.50.1/archive.c /usr/src/debug/git/2.50.1/commit-graph.c /usr/src/debug/git/2.50.1/archive.h /usr/src/debug/git/2.50.1/credential.h /usr/src/debug/git/2.50.1/oidtree.h /usr/src/debug/git/2.50.1/blob.h /usr/src/debug/git/2.50.1/blob.c /usr/src/debug/git/2.50.1/copy.h /usr/src/debug/git/2.50.1/git.c /usr/src/debug/git/2.50.1/list-objects-filter-options.h /usr/src/debug/git/2.50.1/parse-options.c /usr/src/debug/git/2.50.1/write-or-die.c /usr/src/debug/git/2.50.1/list-objects-filter-options.c /usr/src/debug/git/2.50.1/parse-options.h /usr/src/debug/git/2.50.1/write-or-die.h /usr/src/debug/git/2.50.1/copy.c /usr/src/debug/git/2.50.1/refspec.h /usr/src/debug
 /git/2.50.1/fsmonitor.h /usr/src/debug/git/2.50.1/grep.h /usr/src/debug/git/2.50.1/refspec.c /usr/src/debug/git/2.50.1/grep.c /usr/src/debug/git/2.50.1/fsmonitor.c /usr/src/debug/git/2.50.1/http.c /usr/src/debug/git/2.50.1/daemon.c /usr/src/debug/git/2.50.1/http.h /usr/src/debug/git/2.50.1/merge-blobs.c /usr/src/debug/git/2.50.1/patch-ids.c /usr/src/debug/git/2.50.1/lockfile.h /usr/src/debug/git/2.50.1/packfile.h /usr/src/debug/git/2.50.1/tempfile.h /usr/src/debug/git/2.50.1/lockfile.c /usr/src/debug/git/2.50.1/packfile.c /usr/src/debug/git/2.50.1/tempfile.c /usr/src/debug/git/2.50.1/merge-blobs.h /usr/src/debug/git/2.50.1/patch-ids.h /usr/src/debug/git/2.50.1/git-compat-util.h /usr/src/debug/git/2.50.1/line-range.h /usr/src/debug/git/2.50.1/iterator.h /usr/src/debug/git/2.50.1/line-range.c /usr/src/debug/git/2.50.1/notes-utils.h /usr/src/debug/git/2.50.1/notes-utils.c /usr/src/debug/git/2.50.1/mem-pool.c /usr/src/debug/git/2.50.1/protocol.c /usr/src/debug/git/2.50.1/wt-status.h /us
 r/src/debug/git/2.50.1/transport-internal.h /usr/src/debug/git/2.50.1/alias.c /usr/src/debug/git/2.50.1/mem-pool.h /usr/src/debug/git/2.50.1/protocol.h /usr/src/debug/git/2.50.1/alloc.c /usr/src/debug/git/2.50.1/wt-status.c /usr/src/debug/git/2.50.1/gpg-interface.c /usr/src/debug/git/2.50.1/gpg-interface.h /usr/src/debug/git/2.50.1/serve.c /usr/src/debug/git/2.50.1/setup.c /usr/src/debug/git/2.50.1/reset.c /usr/src/debug/git/2.50.1/trace.c /usr/src/debug/git/2.50.1/blame.c /usr/src/debug/git/2.50.1/bloom.c /usr/src/debug/git/2.50.1/color.c /usr/src/debug/git/2.50.1/ctype.c /usr/src/debug/git/2.50.1/pager.c /usr/src/debug/git/2.50.1/parse.c /usr/src/debug/git/2.50.1/delta.h /usr/src/debug/git/2.50.1/loose.h /usr/src/debug/git/2.50.1/color.h /usr/src/debug/git/2.50.1/bloom.h /usr/src/debug/git/2.50.1/graph.h /usr/src/debug/git/2.50.1/notes.h /usr/src/debug/git/2.50.1/merge.h /usr/src/debug/git/2.50.1/entry.h /usr/src/debug/git/2.50.1/alias.h /usr/src/debug/git/2.50.1/alloc.h /usr/src/
 debug/git/2.50.1/refs.h /usr/src/debug/git/2.50.1/url.h /usr/src/debug/git/2.50.1/pack-bitmap-write.c /usr/src/debug/git/2.50.1/url.c /usr/src/debug/git/2.50.1/refs.c /usr/src/debug/git/2.50.1/pseudo-merge.h /usr/src/debug/git/2.50.1/object-file-convert.c /usr/src/debug/git/2.50.1/object-file-convert.h /usr/src/debug/git/2.50.1/pseudo-merge.c /usr/src/debug/git/2.50.1/exec-cmd.h /usr/src/debug/git/2.50.1/streaming.c /usr/src/debug/git/2.50.1/shallow.c /usr/src/debug/git/2.50.1/shallow.h /usr/src/debug/git/2.50.1/streaming.h /usr/src/debug/git/2.50.1/exec-cmd.c /usr/src/debug/git/2.50.1/fsck.h /usr/src/debug/git/2.50.1/versioncmp.c /usr/src/debug/git/2.50.1/progress.c /usr/src/debug/git/2.50.1/progress.h /usr/src/debug/git/2.50.1/versioncmp.h /usr/src/debug/git/2.50.1/fsck.c /usr/src/debug/git/2.50.1/imap-send.c /usr/src/debug/git/2.50.1/ls-refs.h /usr/src/debug/git/2.50.1/http-push.c /usr/src/debug/git/2.50.1/ls-refs.c /usr/src/debug/git/2.50.1/help.h /usr/src/debug/git/2.50.1/help.
 c /usr/src/debug/git/2.50.1/object-name.c /usr/src/debug/git/2.50.1/object-name.h /usr/src/debug/git/2.50.1/submodule.c /usr/src/debug/git/2.50.1/common-main.c /usr/src/debug/git/2.50.1/submodule.h /usr/src/debug/git/2.50.1/http-walker.c /usr/src/debug/git/2.50.1/rebase.c /usr/src/debug/git/2.50.1/merge-ort.h /usr/src/debug/git/2.50.1/diagnose.c /usr/src/debug/git/2.50.1/revision.c /usr/src/debug/git/2.50.1/run-command.c /usr/src/debug/git/2.50.1/transport.h /usr/src/debug/git/2.50.1/revision.h /usr/src/debug/git/2.50.1/diagnose.h /usr/src/debug/git/2.50.1/merge-ort.c /usr/src/debug/git/2.50.1/run-command.h /usr/src/debug/git/2.50.1/transport.c /usr/src/debug/git/2.50.1/server-info.c /usr/src/debug/git/2.50.1/server-info.h /usr/src/debug/git/2.50.1/dir-iterator.c /usr/src/debug/git/2.50.1/dir-iterator.h /usr/src/debug/git/2.50.1/connected.c /usr/src/debug/git/2.50.1/reflog-walk.c /usr/src/debug/git/2.50.1/archive-tar.c /usr/src/debug/git/2.50.1/reflog-walk.h /usr/src/debug/git/2.50.
 1/connected.h /usr/src/debug/git/2.50.1/dir.c /usr/src/debug/git/2.50.1/common-exit.c /usr/src/debug/git/2.50.1/dir.h /usr/src/debug/git/2.50.1/fmt-merge-msg.c /usr/src/debug/git/2.50.1/prompt.h /usr/src/debug/git/2.50.1/fmt-merge-msg.h /usr/src/debug/git/2.50.1/pack-mtimes.h /usr/src/debug/git/2.50.1/pack-mtimes.c /usr/src/debug/git/2.50.1/sequencer.h /usr/src/debug/git/2.50.1/sequencer.c /usr/src/debug/git/2.50.1/levenshtein.h /usr/src/debug/git/2.50.1/levenshtein.c /usr/src/debug/git/2.50.1/transport-helper.c /usr/src/debug/git/2.50.1/notes.c /usr/src/debug/git/2.50.1/apply.c /usr/src/debug/git/2.50.1/entry.c /usr/src/debug/git/2.50.1/graph.c /usr/src/debug/git/2.50.1/tree-diff.c /usr/src/debug/git/2.50.1/ident.c /usr/src/debug/git/2.50.1/kwset.c /usr/src/debug/git/2.50.1/unicode-width.h /usr/src/debug/git/2.50.1/loose.c /usr/src/debug/git/2.50.1/merge.c /usr/src/debug/git/2.50.1/bundle-uri.c /usr/src/debug/git/2.50.1/bundle-uri.h /usr/src/debug/git/2.50.1/repository.h /usr/src/d
 ebug/git/2.50.1/apply.h /usr/src/debug/git/2.50.1/blame.h /usr/src/debug/git/2.50.1/repository.c /usr/src/debug/git/2.50.1/diffcore.h /usr/src/debug/git/2.50.1/trace.h /usr/src/debug/git/2.50.1/khash.h /usr/src/debug/git/2.50.1/kwset.h /usr/src/debug/git/2.50.1/quote.h /usr/src/debug/git/2.50.1/ident.h /usr/src/debug/git/2.50.1/path-walk.h /usr/src/debug/git/2.50.1/tree-walk.h /usr/src/debug/git/2.50.1/path-walk.c /usr/src/debug/git/2.50.1/tree-walk.c /usr/src/debug/git/2.50.1/hex.h /usr/src/debug/git/2.50.1/hex.c /usr/src/debug/git/2.50.1/pack-check.c /usr/src/debug/git/2.50.1/combine-diff.c /usr/src/debug/git/2.50.1/path.c /usr/src/debug/git/2.50.1/path.h /usr/src/debug/git/2.50.1/wildmatch.h /usr/src/debug/git/2.50.1/prune-packed.c /usr/src/debug/git/2.50.1/prune-packed.h /usr/src/debug/git/2.50.1/add-patch.c /usr/src/debug/git/2.50.1/wildmatch.c /usr/src/debug/git/2.50.1/submodule-config.h /usr/src/debug/git/2.50.1/submodule-config.c /usr/src/debug/git/2.50.1/diff-no-index.c /us
 r/src/debug/git/2.50.1/pkt-line.c /usr/src/debug/git/2.50.1/pkt-line.h /usr/src/debug/git/2.50.1/fetch-negotiator.h /usr/src/debug/git/2.50.1/sane-ctype.h /usr/src/debug/git/2.50.1/fetch-negotiator.c /usr/src/debug/git/2.50.1/sha1dc_git.h /usr/src/debug/git/2.50.1/prompt.c /usr/src/debug/git/2.50.1/sha1dc_git.c /usr/src/debug/git/2.50.1/tag.h /usr/src/debug/git/2.50.1/tag.c /usr/src/debug/git/2.50.1/string-list.c /usr/src/debug/git/2.50.1/config-list.h /usr/src/debug/git/2.50.1/string-list.h /usr/src/debug/git/2.50.1/attr.c /usr/src/debug/git/2.50.1/attr.h /usr/src/debug/git/2.50.1/thread-utils.c /usr/src/debug/git/2.50.1/thread-utils.h /usr/src/debug/git/2.50.1/base85.h /usr/src/debug/git/2.50.1/bisect.h /usr/src/debug/git/2.50.1/branch.h /usr/src/debug/git/2.50.1/bundle.h /usr/src/debug/git/2.50.1/rebase.h /usr/src/debug/git/2.50.1/oidmap.h /usr/src/debug/git/2.50.1/oidset.h /usr/src/debug/git/2.50.1/pretty.h /usr/src/debug/git/2.50.1/config.h /usr/src/debug/git/2.50.1/strbuf.h /u
 sr/src/debug/git/2.50.1/parallel-checkout.c /usr/src/debug/git/2.50.1/cbtree.c /usr/src/debug/git/2.50.1/column.c /usr/src/debug/git/2.50.1/commit.c /usr/src/debug/git/2.50.1/config.c /usr/src/debug/git/2.50.1/scalar.c /usr/src/debug/git/2.50.1/oidmap.c /usr/src/debug/git/2.50.1/oidset.c /usr/src/debug/git/2.50.1/advice.c /usr/src/debug/git/2.50.1/base85.c /usr/src/debug/git/2.50.1/bisect.c /usr/src/debug/git/2.50.1/unix-socket.h /usr/src/debug/git/2.50.1/fsmonitor-settings.h /usr/src/debug/git/2.50.1/unix-socket.c /usr/src/debug/git/2.50.1/fsmonitor-settings.c /usr/src/debug/git/2.50.1/hook-list.h /usr/src/debug/git/2.50.1/pager.h /usr/src/debug/git/2.50.1/parse.h /usr/src/debug/git/2.50.1/list-objects.c /usr/src/debug/git/2.50.1/pack-objects.c /usr/src/debug/git/2.50.1/list-objects.h /usr/src/debug/git/2.50.1/pack-objects.h /usr/src/debug/git/2.50.1/chdir-notify.h /usr/src/debug/git/2.50.1/chdir-notify.c /usr/src/debug/git/2.50.1/reachable.c /usr/src/debug/git/2.50.1/abspath.h /us
 r/src/debug/git/2.50.1/http-fetch.c /usr/src/debug/git/2.50.1/abspath.c /usr/src/debug/git/2.50.1/reachable.h /usr/src/debug/git/2.50.1/builtin.h /usr/src/debug/git/2.50.1/version.h /usr/src/debug/git/2.50.1/protocol-caps.c /usr/src/debug/git/2.50.1/checkout.c /usr/src/debug/git/2.50.1/protocol-caps.h /usr/src/debug/git/2.50.1/version.c /usr/src/debug/git/2.50.1/checkout.h /usr/src/debug/git/2.50.1/hex-ll.h /usr/src/debug/git/2.50.1/symlinks.h /usr/src/debug/git/2.50.1/symlinks.c /usr/src/debug/git/2.50.1/simple-ipc.h /usr/src/debug/git/2.50.1/rebase-interactive.c /usr/src/debug/git/2.50.1/rebase-interactive.h /usr/src/debug/git/2.50.1/pack-bitmap.h /usr/src/debug/git/2.50.1/editor.h /usr/src/debug/git/2.50.1/oid-array.c /usr/src/debug/git/2.50.1/send-pack.h /usr/src/debug/git/2.50.1/oid-array.h /usr/src/debug/git/2.50.1/pack-bitmap.c /usr/src/debug/git/2.50.1/send-pack.c /usr/src/debug/git/2.50.1/remote-curl.c /usr/src/debug/git/2.50.1/diffcore-pickaxe.c /usr/src/debug/git/2.50.1/q
 uote.c /usr/src/debug/git/2.50.1/object-file.c /usr/src/debug/git/2.50.1/object-file.h /usr/src/debug/git/2.50.1/xdiff-interface.c /usr/src/debug/git/2.50.1/add-interactive.h /usr/src/debug/git/2.50.1/xdiff-interface.h /usr/src/debug/git/2.50.1/add-interactive.c /usr/src/debug/git/2.50.1/date.c /usr/src/debug/git/2.50.1/date.h /usr/src/debug/git/2.50.1/list-objects-filter.c /usr/src/debug/git/2.50.1/list-objects-filter.h /usr/src/debug/git/2.50.1/promisor-remote.c /usr/src/debug/git/2.50.1/tree.h /usr/src/debug/git/2.50.1/replace-object.h /usr/src/debug/git/2.50.1/tree.c /usr/src/debug/git/2.50.1/promisor-remote.h /usr/src/debug/git/2.50.1/replace-object.c /usr/src/debug/git/2.50.1/diff-delta.c /usr/src/debug/git/2.50.1/strmap.h /usr/src/debug/git/2.50.1/strvec.h /usr/src/debug/git/2.50.1/walker.h /usr/src/debug/git/2.50.1/advice.h /usr/src/debug/git/2.50.1/merge-ort-wrappers.h /usr/src/debug/git/2.50.1/reflog.h /usr/src/debug/git/2.50.1/ws.c /usr/src/debug/git/2.50.1/remote.h /usr/
 src/debug/git/2.50.1/rerere.h /usr/src/debug/git/2.50.1/trace2.h /usr/src/debug/git/2.50.1/ws.h /usr/src/debug/git/2.50.1/merge-ort-wrappers.c /usr/src/debug/git/2.50.1/hash.c /usr/src/debug/git/2.50.1/hex-ll.c /usr/src/debug/git/2.50.1/trace2.c /usr/src/debug/git/2.50.1/strbuf.c /usr/src/debug/git/2.50.1/hash.h /usr/src/debug/git/2.50.1/strmap.c /usr/src/debug/git/2.50.1/strvec.c /usr/src/debug/git/2.50.1/reflog.c /usr/src/debug/git/2.50.1/remote.c /usr/src/debug/git/2.50.1/log-tree.h /usr/src/debug/git/2.50.1/rerere.c /usr/src/debug/git/2.50.1/pretty.c /usr/src/debug/git/2.50.1/worktree.h /usr/src/debug/git/2.50.1/log-tree.c /usr/src/debug/git/2.50.1/worktree.c /usr/src/debug/git/2.50.1/userdiff.c /usr/src/debug/git/2.50.1/pathspec.h /usr/src/debug/git/2.50.1/range-diff.c /usr/src/debug/git/2.50.1/userdiff.h /usr/src/debug/git/2.50.1/pathspec.c /usr/src/debug/git/2.50.1/range-diff.h /usr/src/debug/git/2.50.1/read-cache-ll.h /usr/src/debug/git/2.50.1/linear-assignment.h /usr/src/de
 bug/git/2.50.1/editor.c /usr/src/debug/git/2.50.1/pack-revindex.c /usr/src/debug/git/2.50.1/linear-assignment.c /usr/src/debug/git/2.50.1/pack-revindex.h /usr/src/debug/git/2.50.1/archive-zip.c /usr/src/debug/git/2.50.1/split-index.h /usr/src/debug/git/2.50.1/tmp-objdir.h /usr/src/debug/git/2.50.1/split-index.c /usr/src/debug/git/2.50.1/tmp-objdir.c /usr/src/debug/git/2.50.1/fetch-pack.c /usr/src/debug/git/2.50.1/varint.h /usr/src/debug/git/2.50.1/fetch-pack.h /usr/src/debug/git/2.50.1/branch.c /usr/src/debug/git/2.50.1/bundle.c /usr/src/debug/git/2.50.1/decorate.c /usr/src/debug/git/2.50.1/diffcore-rename.c /usr/src/debug/git/2.50.1/diffcore-rotate.c /usr/src/debug/git/2.50.1/trailer.c /usr/src/debug/git/2.50.1/wrapper.c /usr/src/debug/git/2.50.1/trailer.h /usr/src/debug/git/2.50.1/wrapper.h /usr/src/debug/git/2.50.1/decorate.h /usr/src/debug/git/2.50.1/connect.c /usr/src/debug/git/2.50.1/convert.c /usr/src/debug/git/2.50.1/gettext.c /usr/src/debug/git/2.50.1/chunk-format.h /usr/sr
 c/debug/git/2.50.1/chunk-format.c /usr/src/debug/git/2.50.1/connect.h /usr/src/debug/git/2.50.1/convert.h /usr/src/debug/git/2.50.1/gettext.h /usr/src/debug/git/2.50.1/cache-tree.c /usr/src/debug/git/2.50.1/hashmap.c /usr/src/debug/git/2.50.1/mailmap.c /usr/src/debug/git/2.50.1/cache-tree.h /usr/src/debug/git/2.50.1/mailmap.h /usr/src/debug/git/2.50.1/hashmap.h /usr/src/debug/git/2.50.1/object-store.h /usr/src/debug/git/2.50.1/walker.c /usr/src/debug/git/2.50.1/object-store.c /usr/src/debug/git/2.50.1/shell.c /usr/src/debug/git/2.50.1/http-backend.c /usr/src/debug/git/2.50.1/sh-i18n--envsubst.c /usr/src/debug/git/2.50.1/midx.c /usr/src/debug/git/2.50.1/utf8.h /usr/src/debug/git/2.50.1/midx.h /usr/src/debug/git/2.50.1/utf8.c /usr/src/debug/git/2.50.1/notes-merge.h /usr/src/debug/git/2.50.1/notes-merge.c /usr/src/debug/git/2.50.1/commit-reach.h /usr/src/debug/git/2.50.1/commit-reach.c /usr/src/debug/git/2.50.1/unpack-trees.h /usr/src/debug/git/2.50.1/urlmatch.h /usr/src/debug/git/2.50
 .1/urlmatch.c /usr/src/debug/git/2.50.1/unpack-trees.c /usr/src/debug/git/2.50.1/pack.h /usr/src/debug/git/2.50.1/patch-delta.c /usr/src/debug/git/2.50.1/parallel-checkout.h /usr/src/debug/git/2.50.1/mailinfo.c /usr/src/debug/git/2.50.1/statinfo.c /usr/src/debug/git/2.50.1/fsmonitor-ll.h /usr/src/debug/git/2.50.1/mailinfo.h /usr/src/debug/git/2.50.1/statinfo.h /usr/src/debug/git/2.50.1/hook.c /usr/src/debug/git/2.50.1/hook.h /usr/src/debug/git/2.50.1/stable-qsort.c /usr/src/debug/git/2.50.1/common-init.h /usr/src/debug/git/2.50.1/prio-queue.h /usr/src/debug/git/2.50.1/fsmonitor-ipc.c /usr/src/debug/git/2.50.1/fsmonitor-ipc.h /usr/src/debug/git/2.50.1/common-init.c /usr/src/debug/git/2.50.1/prio-queue.c /usr/src/debug/git/2.50.1/diff-lib.c /usr/src/debug/git/2.50.1/git-zlib.c /usr/src/debug/git/2.50.1/varint.c /usr/src/debug/git/2.50.1/diffcore-break.c /usr/src/debug/git/2.50.1/diffcore-delta.c /usr/src/debug/git/2.50.1/diffcore-order.c /usr/src/debug/git/2.50.1/git-zlib.h /usr/src/d
 ebug/git/2.50.1/midx-write.c /usr/src/debug/git/2.50.1/pack-write.c /usr/src/debug/git/2.50.1/sigchain.c /usr/src/debug/git/2.50.1/diff.h /usr/src/debug/git/2.50.1/command-list.h /usr/src/debug/git/2.50.1/upload-pack.c /usr/src/debug/git/2.50.1/sigchain.h /usr/src/debug/git/2.50.1/diff.c /usr/src/debug/git/2.50.1/upload-pack.h /usr/src/debug/git/2.50.1/bulk-checkin.h /usr/src/debug/git/2.50.1/object.h /usr/src/debug/git/2.50.1/sparse-index.c /usr/src/debug/git/2.50.1/json-writer.h /usr/src/debug/git/2.50.1/json-writer.c /usr/src/debug/git/2.50.1/sparse-index.h /usr/src/debug/git/2.50.1/bulk-checkin.c /usr/src/debug/git/2.50.1/hash-lookup.h /usr/src/debug/git/2.50.1/name-hash.c /usr/src/debug/git/2.50.1/name-hash.h /usr/src/debug/git/2.50.1/hash-lookup.c /usr/src/debug/git/2.50.1/tar.h /usr/src/debug/git/2.50.1/serve.h /usr/src/debug/git/2.50.1/setup.h /usr/src/debug/git/2.50.1/line-log.h /usr/src/debug/git/2.50.1/shortlog.h /usr/src/debug/git/2.50.1/line-log.c /usr/src/debug/git/2.5
 0.1/preload-index.c /usr/src/debug/git/2.50.1/preload-index.h /usr/src/debug/git/2.50.1/resolve-undo.c /usr/src/debug/git/2.50.1/sub-process.c /usr/src/debug/git/2.50.1/resolve-undo.h /usr/src/debug/git/2.50.1/reset.h /usr/src/debug/git/2.50.1/sub-process.h /usr/src/debug/git/2.50.1/notes-cache.h /usr/src/debug/git/2.50.1/read-cache.c /usr/src/debug/git/2.50.1/read-cache.h /usr/src/debug/git/2.50.1/notes-cache.c /usr/src/debug/git/2.50.1/list.h /usr/src/debug/git/2.50.1/repo-settings.c /usr/src/debug/git/2.50.1/repo-settings.h /usr/src/debug/git/2.50.1/usage.c /usr/src/debug/git/2.50.1/diff-merges.c /usr/src/debug/git/2.50.1/match-trees.c /usr/src/debug/git/2.50.1/match-trees.h /usr/src/debug/git/2.50.1/diff-merges.h /usr/src/debug/git/2.50.1/sideband.h /usr/src/debug/git/2.50.1/delta-islands.c /usr/src/debug/git/2.50.1/delta-islands.h /usr/src/debug/git/2.50.1/sideband.c /usr/src/debug/git/2.50.1/csum-file.h /usr/src/debug/git/2.50.1/merge-ll.h /usr/src/debug/git/2.50.1/parse-optio
 ns-cb.c /usr/src/debug/git/2.50.1/environment.c /usr/src/debug/git/2.50.1/merge-ll.c /usr/src/debug/git/2.50.1/csum-file.c /usr/src/debug/git/2.50.1/environment.h /usr/src/debug/git/2.50.1/cbtree.h /usr/src/debug/git/2.50.1/column.h /usr/src/debug/git/2.50.1/commit.h /usr/src/debug/git/2.50.1/ref-filter.c /usr/src/debug/git/2.50.1/ref-filter.h", added "/usr/src/debug/git/2.51.0/tag.c /usr/src/debug/git/2.51.0/list.h /usr/src/debug/git/2.51.0/tag.h /usr/src/debug/git/2.51.0/git.c /usr/src/debug/git/2.51.0/merge-ort-wrappers.h /usr/src/debug/git/2.51.0/rebase-interactive.h /usr/src/debug/git/2.51.0/patch-delta.c /usr/src/debug/git/2.51.0/merge-ort-wrappers.c /usr/src/debug/git/2.51.0/rebase-interactive.c /usr/src/debug/git/2.51.0/prio-queue.h /usr/src/debug/git/2.51.0/prio-queue.c /usr/src/debug/git/2.51.0/csum-file.h /usr/src/debug/git/2.51.0/pkt-line.c /usr/src/debug/git/2.51.0/csum-file.c /usr/src/debug/git/2.51.0/pkt-line.h /usr/src/debug/git/2.51.0/reflog-walk.h /usr/src/debug/gi
 t/2.51.0/reflog-walk.c /usr/src/debug/git/2.51.0/object-file-convert.h /usr/src/debug/git/2.51.0/gpg-interface.c /usr/src/debug/git/2.51.0/object-file-convert.c /usr/src/debug/git/2.51.0/gpg-interface.h /usr/src/debug/git/2.51.0/diff.h /usr/src/debug/git/2.51.0/revision.h /usr/src/debug/git/2.51.0/wt-status.h /usr/src/debug/git/2.51.0/notes-merge.c /usr/src/debug/git/2.51.0/diff.c /usr/src/debug/git/2.51.0/notes-merge.h /usr/src/debug/git/2.51.0/wt-status.c /usr/src/debug/git/2.51.0/revision.c /usr/src/debug/git/2.51.0/color.h /usr/src/debug/git/2.51.0/mem-pool.h /usr/src/debug/git/2.51.0/protocol.h /usr/src/debug/git/2.51.0/mem-pool.c /usr/src/debug/git/2.51.0/protocol.c /usr/src/debug/git/2.51.0/lockfile.c /usr/src/debug/git/2.51.0/packfile.c /usr/src/debug/git/2.51.0/notes-utils.h /usr/src/debug/git/2.51.0/tempfile.c /usr/src/debug/git/2.51.0/linear-assignment.h /usr/src/debug/git/2.51.0/notes-utils.c /usr/src/debug/git/2.51.0/lockfile.h /usr/src/debug/git/2.51.0/packfile.h /usr/
 src/debug/git/2.51.0/tempfile.h /usr/src/debug/git/2.51.0/linear-assignment.c /usr/src/debug/git/2.51.0/list-objects-filter.c /usr/src/debug/git/2.51.0/list-objects-filter.h /usr/src/debug/git/2.51.0/daemon.c /usr/src/debug/git/2.51.0/hash-lookup.c /usr/src/debug/git/2.51.0/hash-lookup.h /usr/src/debug/git/2.51.0/url.c /usr/src/debug/git/2.51.0/url.h /usr/src/debug/git/2.51.0/streaming.c /usr/src/debug/git/2.51.0/object-file.c /usr/src/debug/git/2.51.0/common-init.h /usr/src/debug/git/2.51.0/streaming.h /usr/src/debug/git/2.51.0/common-init.c /usr/src/debug/git/2.51.0/object-file.h /usr/src/debug/git/2.51.0/command-list.h /usr/src/debug/git/2.51.0/archive-zip.c /usr/src/debug/git/2.51.0/patch-ids.h /usr/src/debug/git/2.51.0/trailer.h /usr/src/debug/git/2.51.0/copy.h /usr/src/debug/git/2.51.0/resolve-undo.h /usr/src/debug/git/2.51.0/wrapper.h /usr/src/debug/git/2.51.0/resolve-undo.c /usr/src/debug/git/2.51.0/wrapper.c /usr/src/debug/git/2.51.0/trailer.c /usr/src/debug/git/2.51.0/patc
 h-ids.c /usr/src/debug/git/2.51.0/bundle-uri.h /usr/src/debug/git/2.51.0/copy.c /usr/src/debug/git/2.51.0/merge-blobs.c /usr/src/debug/git/2.51.0/transport.c /usr/src/debug/git/2.51.0/merge-ort.c /usr/src/debug/git/2.51.0/merge-blobs.h /usr/src/debug/git/2.51.0/bundle-uri.c /usr/src/debug/git/2.51.0/merge-ort.h /usr/src/debug/git/2.51.0/sha1dc_git.h /usr/src/debug/git/2.51.0/transport.h /usr/src/debug/git/2.51.0/object-name.c /usr/src/debug/git/2.51.0/object-name.h /usr/src/debug/git/2.51.0/pack-check.c /usr/src/debug/git/2.51.0/sha1dc_git.c /usr/src/debug/git/2.51.0/diffcore-rename.c /usr/src/debug/git/2.51.0/diffcore-rotate.c /usr/src/debug/git/2.51.0/connect.c /usr/src/debug/git/2.51.0/convert.c /usr/src/debug/git/2.51.0/gettext.c /usr/src/debug/git/2.51.0/line-range.h /usr/src/debug/git/2.51.0/replace-object.c /usr/src/debug/git/2.51.0/convert.h /usr/src/debug/git/2.51.0/connect.h /usr/src/debug/git/2.51.0/gettext.h /usr/src/debug/git/2.51.0/replace-object.h /usr/src/debug/git/2
 .51.0/line-range.c /usr/src/debug/git/2.51.0/hashmap.h /usr/src/debug/git/2.51.0/mailmap.h /usr/src/debug/git/2.51.0/hashmap.c /usr/src/debug/git/2.51.0/mailmap.c /usr/src/debug/git/2.51.0/reachable.h /usr/src/debug/git/2.51.0/reachable.c /usr/src/debug/git/2.51.0/imap-send.c /usr/src/debug/git/2.51.0/hex-ll.c /usr/src/debug/git/2.51.0/hook.c /usr/src/debug/git/2.51.0/chdir-notify.c /usr/src/debug/git/2.51.0/diffcore-pickaxe.c /usr/src/debug/git/2.51.0/chdir-notify.h /usr/src/debug/git/2.51.0/hook.h /usr/src/debug/git/2.51.0/unpack-trees.c /usr/src/debug/git/2.51.0/unpack-trees.h /usr/src/debug/git/2.51.0/diff-no-index.c /usr/src/debug/git/2.51.0/pack-bitmap-write.c /usr/src/debug/git/2.51.0/advice.c /usr/src/debug/git/2.51.0/midx-write.c /usr/src/debug/git/2.51.0/pack-write.c /usr/src/debug/git/2.51.0/tree.c /usr/src/debug/git/2.51.0/diffcore-break.c /usr/src/debug/git/2.51.0/diffcore-delta.c /usr/src/debug/git/2.51.0/diffcore-order.c /usr/src/debug/git/2.51.0/tree.h /usr/src/debug
 /git/2.51.0/fsmonitor.c /usr/src/debug/git/2.51.0/midx.h /usr/src/debug/git/2.51.0/fsmonitor.h /usr/src/debug/git/2.51.0/midx.c /usr/src/debug/git/2.51.0/pager.h /usr/src/debug/git/2.51.0/parse.h /usr/src/debug/git/2.51.0/name-hash.h /usr/src/debug/git/2.51.0/name-hash.c /usr/src/debug/git/2.51.0/hex-ll.h /usr/src/debug/git/2.51.0/fsmonitor-ipc.c /usr/src/debug/git/2.51.0/fsmonitor-ipc.h /usr/src/debug/git/2.51.0/refs.h /usr/src/debug/git/2.51.0/refs.c /usr/src/debug/git/2.51.0/upload-pack.h /usr/src/debug/git/2.51.0/upload-pack.c /usr/src/debug/git/2.51.0/oid-array.c /usr/src/debug/git/2.51.0/hash.c /usr/src/debug/git/2.51.0/oid-array.h /usr/src/debug/git/2.51.0/hash.h /usr/src/debug/git/2.51.0/levenshtein.c /usr/src/debug/git/2.51.0/levenshtein.h /usr/src/debug/git/2.51.0/list-objects-filter-options.c /usr/src/debug/git/2.51.0/list-objects-filter-options.h /usr/src/debug/git/2.51.0/sequencer.c /usr/src/debug/git/2.51.0/unix-socket.c /usr/src/debug/git/2.51.0/sequencer.h /usr/src/d
 ebug/git/2.51.0/unix-socket.h /usr/src/debug/git/2.51.0/protocol-caps.h /usr/src/debug/git/2.51.0/protocol-caps.c /usr/src/debug/git/2.51.0/environment.h /usr/src/debug/git/2.51.0/exec-cmd.h /usr/src/debug/git/2.51.0/environment.c /usr/src/debug/git/2.51.0/exec-cmd.c /usr/src/debug/git/2.51.0/repo-settings.h /usr/src/debug/git/2.51.0/graph.h /usr/src/debug/git/2.51.0/reset.h /usr/src/debug/git/2.51.0/diagnose.h /usr/src/debug/git/2.51.0/repo-settings.c /usr/src/debug/git/2.51.0/merge.h /usr/src/debug/git/2.51.0/alias.h /usr/src/debug/git/2.51.0/alloc.h /usr/src/debug/git/2.51.0/diagnose.c /usr/src/debug/git/2.51.0/apply.h /usr/src/debug/git/2.51.0/blame.h /usr/src/debug/git/2.51.0/fsmonitor-settings.h /usr/src/debug/git/2.51.0/entry.c /usr/src/debug/git/2.51.0/ws.c /usr/src/debug/git/2.51.0/fsmonitor-settings.c /usr/src/debug/git/2.51.0/ws.h /usr/src/debug/git/2.51.0/progress.c /usr/src/debug/git/2.51.0/branch.c /usr/src/debug/git/2.51.0/varint.c /usr/src/debug/git/2.51.0/scalar.c /
 usr/src/debug/git/2.51.0/progress.h /usr/src/debug/git/2.51.0/strbuf.c /usr/src/debug/git/2.51.0/strmap.c /usr/src/debug/git/2.51.0/strvec.c /usr/src/debug/git/2.51.0/walker.c /usr/src/debug/git/2.51.0/rebase.c /usr/src/debug/git/2.51.0/object.c /usr/src/debug/git/2.51.0/run-command.h /usr/src/debug/git/2.51.0/iterator.h /usr/src/debug/git/2.51.0/setup.c /usr/src/debug/git/2.51.0/shell.c /usr/src/debug/git/2.51.0/run-command.c /usr/src/debug/git/2.51.0/alloc.c /usr/src/debug/git/2.51.0/apply.c /usr/src/debug/git/2.51.0/alias.c /usr/src/debug/git/2.51.0/blame.c /usr/src/debug/git/2.51.0/bloom.c /usr/src/debug/git/2.51.0/color.c /usr/src/debug/git/2.51.0/ctype.c /usr/src/debug/git/2.51.0/strmap.h /usr/src/debug/git/2.51.0/strvec.h /usr/src/debug/git/2.51.0/walker.h /usr/src/debug/git/2.51.0/rerere.h /usr/src/debug/git/2.51.0/branch.h /usr/src/debug/git/2.51.0/trace2.h /usr/src/debug/git/2.51.0/varint.h /usr/src/debug/git/2.51.0/pretty.h /usr/src/debug/git/2.51.0/pack-mtimes.c /usr/src
 /debug/git/2.51.0/prompt.h /usr/src/debug/git/2.51.0/dir-iterator.h /usr/src/debug/git/2.51.0/pack-mtimes.h /usr/src/debug/git/2.51.0/dir-iterator.c /usr/src/debug/git/2.51.0/archive-tar.c /usr/src/debug/git/2.51.0/path.h /usr/src/debug/git/2.51.0/http-push.c /usr/src/debug/git/2.51.0/oidmap.c /usr/src/debug/git/2.51.0/oidset.c /usr/src/debug/git/2.51.0/path.c /usr/src/debug/git/2.51.0/common-main.c /usr/src/debug/git/2.51.0/server-info.h /usr/src/debug/git/2.51.0/server-info.c /usr/src/debug/git/2.51.0/odb.c /usr/src/debug/git/2.51.0/odb.h /usr/src/debug/git/2.51.0/git-compat-util.h /usr/src/debug/git/2.51.0/write-or-die.c /usr/src/debug/git/2.51.0/write-or-die.h /usr/src/debug/git/2.51.0/match-trees.c /usr/src/debug/git/2.51.0/chunk-format.c /usr/src/debug/git/2.51.0/http.c /usr/src/debug/git/2.51.0/chunk-format.h /usr/src/debug/git/2.51.0/match-trees.h /usr/src/debug/git/2.51.0/http.h /usr/src/debug/git/2.51.0/dir.h /usr/src/debug/git/2.51.0/transport-internal.h /usr/src/debug/gi
 t/2.51.0/dir.c /usr/src/debug/git/2.51.0/object.h /usr/src/debug/git/2.51.0/oidmap.h /usr/src/debug/git/2.51.0/oidset.h /usr/src/debug/git/2.51.0/xdiff-interface.c /usr/src/debug/git/2.51.0/list-objects.c /usr/src/debug/git/2.51.0/pack-objects.c /usr/src/debug/git/2.51.0/xdiff-interface.h /usr/src/debug/git/2.51.0/list-objects.h /usr/src/debug/git/2.51.0/pack-objects.h /usr/src/debug/git/2.51.0/split-index.c /usr/src/debug/git/2.51.0/archive.h /usr/src/debug/git/2.51.0/oidtree.h /usr/src/debug/git/2.51.0/split-index.h /usr/src/debug/git/2.51.0/archive.c /usr/src/debug/git/2.51.0/oidtree.c /usr/src/debug/git/2.51.0/credential.h /usr/src/debug/git/2.51.0/credential.c /usr/src/debug/git/2.51.0/column.c /usr/src/debug/git/2.51.0/commit.c /usr/src/debug/git/2.51.0/config.c /usr/src/debug/git/2.51.0/graph.c /usr/src/debug/git/2.51.0/submodule-config.c /usr/src/debug/git/2.51.0/path-walk.c /usr/src/debug/git/2.51.0/tree-walk.c /usr/src/debug/git/2.51.0/path-walk.h /usr/src/debug/git/2.51.0
 /tree-walk.h /usr/src/debug/git/2.51.0/submodule-config.h /usr/src/debug/git/2.51.0/help.h /usr/src/debug/git/2.51.0/merge-ll.c /usr/src/debug/git/2.51.0/help.c /usr/src/debug/git/2.51.0/hook-list.h /usr/src/debug/git/2.51.0/merge-ll.h /usr/src/debug/git/2.51.0/common-exit.c /usr/src/debug/git/2.51.0/date.h /usr/src/debug/git/2.51.0/line-log.c /usr/src/debug/git/2.51.0/line-log.h /usr/src/debug/git/2.51.0/shortlog.h /usr/src/debug/git/2.51.0/date.c /usr/src/debug/git/2.51.0/sparse-index.h /usr/src/debug/git/2.51.0/sparse-index.c /usr/src/debug/git/2.51.0/sh-i18n--envsubst.c /usr/src/debug/git/2.51.0/pack-revindex.h /usr/src/debug/git/2.51.0/statinfo.c /usr/src/debug/git/2.51.0/mailinfo.c /usr/src/debug/git/2.51.0/wildmatch.h /usr/src/debug/git/2.51.0/pack-revindex.c /usr/src/debug/git/2.51.0/wildmatch.c /usr/src/debug/git/2.51.0/add-patch.c /usr/src/debug/git/2.51.0/mailinfo.h /usr/src/debug/git/2.51.0/statinfo.h /usr/src/debug/git/2.51.0/merge.c /usr/src/debug/git/2.51.0/config.h /
 usr/src/debug/git/2.51.0/urlmatch.h /usr/src/debug/git/2.51.0/urlmatch.c /usr/src/debug/git/2.51.0/delta.h /usr/src/debug/git/2.51.0/attr.c /usr/src/debug/git/2.51.0/delta-islands.h /usr/src/debug/git/2.51.0/delta-islands.c /usr/src/debug/git/2.51.0/attr.h /usr/src/debug/git/2.51.0/send-pack.c /usr/src/debug/git/2.51.0/connected.c /usr/src/debug/git/2.51.0/send-pack.h /usr/src/debug/git/2.51.0/connected.h /usr/src/debug/git/2.51.0/fetch-negotiator.c /usr/src/debug/git/2.51.0/sub-process.c /usr/src/debug/git/2.51.0/sub-process.h /usr/src/debug/git/2.51.0/fetch-negotiator.h /usr/src/debug/git/2.51.0/json-writer.c /usr/src/debug/git/2.51.0/ls-refs.h /usr/src/debug/git/2.51.0/json-writer.h /usr/src/debug/git/2.51.0/ls-refs.c /usr/src/debug/git/2.51.0/refspec.h /usr/src/debug/git/2.51.0/commit-reach.h /usr/src/debug/git/2.51.0/preload-index.c /usr/src/debug/git/2.51.0/refspec.c /usr/src/debug/git/2.51.0/pack.h /usr/src/debug/git/2.51.0/preload-index.h /usr/src/debug/git/2.51.0/commit-rea
 ch.c /usr/src/debug/git/2.51.0/diff-merges.h /usr/src/debug/git/2.51.0/ref-filter.h /usr/src/debug/git/2.51.0/sideband.c /usr/src/debug/git/2.51.0/http-walker.c /usr/src/debug/git/2.51.0/sideband.h /usr/src/debug/git/2.51.0/diff-merges.c /usr/src/debug/git/2.51.0/ref-filter.c /usr/src/debug/git/2.51.0/diff-lib.c /usr/src/debug/git/2.51.0/git-zlib.c /usr/src/debug/git/2.51.0/shallow.h /usr/src/debug/git/2.51.0/shallow.c /usr/src/debug/git/2.51.0/git-zlib.h /usr/src/debug/git/2.51.0/sigchain.h /usr/src/debug/git/2.51.0/sigchain.c /usr/src/debug/git/2.51.0/bulk-checkin.h /usr/src/debug/git/2.51.0/string-list.c /usr/src/debug/git/2.51.0/bulk-checkin.c /usr/src/debug/git/2.51.0/config-list.h /usr/src/debug/git/2.51.0/string-list.h /usr/src/debug/git/2.51.0/parse-options-cb.c /usr/src/debug/git/2.51.0/unicode-width.h /usr/src/debug/git/2.51.0/trace.h /usr/src/debug/git/2.51.0/khash.h /usr/src/debug/git/2.51.0/kwset.h /usr/src/debug/git/2.51.0/serve.h /usr/src/debug/git/2.51.0/setup.h /usr
 /src/debug/git/2.51.0/ident.h /usr/src/debug/git/2.51.0/notes.h /usr/src/debug/git/2.51.0/quote.h /usr/src/debug/git/2.51.0/entry.h /usr/src/debug/git/2.51.0/loose.h /usr/src/debug/git/2.51.0/trace.c /usr/src/debug/git/2.51.0/quote.c /usr/src/debug/git/2.51.0/ident.c /usr/src/debug/git/2.51.0/kwset.c /usr/src/debug/git/2.51.0/loose.c /usr/src/debug/git/2.51.0/pager.c /usr/src/debug/git/2.51.0/parse.c /usr/src/debug/git/2.51.0/notes.c /usr/src/debug/git/2.51.0/reset.c /usr/src/debug/git/2.51.0/serve.c /usr/src/debug/git/2.51.0/builtin.h /usr/src/debug/git/2.51.0/hex.h /usr/src/debug/git/2.51.0/version.h /usr/src/debug/git/2.51.0/add-interactive.c /usr/src/debug/git/2.51.0/blob.c /usr/src/debug/git/2.51.0/submodule.h /usr/src/debug/git/2.51.0/hex.c /usr/src/debug/git/2.51.0/version.c /usr/src/debug/git/2.51.0/add-interactive.h /usr/src/debug/git/2.51.0/blob.h /usr/src/debug/git/2.51.0/submodule.c /usr/src/debug/git/2.51.0/diffcore.h /usr/src/debug/git/2.51.0/range-diff.h /usr/src/debu
 g/git/2.51.0/range-diff.c /usr/src/debug/git/2.51.0/read-cache.c /usr/src/debug/git/2.51.0/repository.c /usr/src/debug/git/2.51.0/read-cache.h /usr/src/debug/git/2.51.0/tar.h /usr/src/debug/git/2.51.0/repository.h /usr/src/debug/git/2.51.0/http-fetch.c /usr/src/debug/git/2.51.0/notes-cache.c /usr/src/debug/git/2.51.0/parallel-checkout.c /usr/src/debug/git/2.51.0/userdiff.h /usr/src/debug/git/2.51.0/utf8.c /usr/src/debug/git/2.51.0/userdiff.c /usr/src/debug/git/2.51.0/parallel-checkout.h /usr/src/debug/git/2.51.0/notes-cache.h /usr/src/debug/git/2.51.0/utf8.h /usr/src/debug/git/2.51.0/combine-diff.c /usr/src/debug/git/2.51.0/promisor-remote.h /usr/src/debug/git/2.51.0/promisor-remote.c /usr/src/debug/git/2.51.0/stable-qsort.c /usr/src/debug/git/2.51.0/abspath.c /usr/src/debug/git/2.51.0/abspath.h /usr/src/debug/git/2.51.0/grep.h /usr/src/debug/git/2.51.0/fmt-merge-msg.h /usr/src/debug/git/2.51.0/grep.c /usr/src/debug/git/2.51.0/fmt-merge-msg.c /usr/src/debug/git/2.51.0/base85.h /usr/
 src/debug/git/2.51.0/bisect.h /usr/src/debug/git/2.51.0/parse-options.h /usr/src/debug/git/2.51.0/symlinks.h /usr/src/debug/git/2.51.0/simple-ipc.h /usr/src/debug/git/2.51.0/parse-options.c /usr/src/debug/git/2.51.0/symlinks.c /usr/src/debug/git/2.51.0/editor.c /usr/src/debug/git/2.51.0/http-backend.c /usr/src/debug/git/2.51.0/remote-curl.c /usr/src/debug/git/2.51.0/pathspec.h /usr/src/debug/git/2.51.0/pathspec.c /usr/src/debug/git/2.51.0/log-tree.c /usr/src/debug/git/2.51.0/worktree.c /usr/src/debug/git/2.51.0/thread-utils.h /usr/src/debug/git/2.51.0/log-tree.h /usr/src/debug/git/2.51.0/worktree.h /usr/src/debug/git/2.51.0/thread-utils.c /usr/src/debug/git/2.51.0/read-cache-ll.h /usr/src/debug/git/2.51.0/usage.c /usr/src/debug/git/2.51.0/decorate.h /usr/src/debug/git/2.51.0/versioncmp.h /usr/src/debug/git/2.51.0/checkout.c /usr/src/debug/git/2.51.0/fsck.h /usr/src/debug/git/2.51.0/decorate.c /usr/src/debug/git/2.51.0/versioncmp.c /usr/src/debug/git/2.51.0/checkout.h /usr/src/debug/
 git/2.51.0/fsck.c /usr/src/debug/git/2.51.0/commit-graph.c /usr/src/debug/git/2.51.0/commit-graph.h /usr/src/debug/git/2.51.0/tree-diff.c /usr/src/debug/git/2.51.0/sane-ctype.h /usr/src/debug/git/2.51.0/bundle.c /usr/src/debug/git/2.51.0/cbtree.c /usr/src/debug/git/2.51.0/trace2.c /usr/src/debug/git/2.51.0/reflog.c /usr/src/debug/git/2.51.0/remote.c /usr/src/debug/git/2.51.0/rerere.c /usr/src/debug/git/2.51.0/base85.c /usr/src/debug/git/2.51.0/reflog.h /usr/src/debug/git/2.51.0/remote.h /usr/src/debug/git/2.51.0/bisect.c /usr/src/debug/git/2.51.0/bundle.h /usr/src/debug/git/2.51.0/cbtree.h /usr/src/debug/git/2.51.0/column.h /usr/src/debug/git/2.51.0/commit.h /usr/src/debug/git/2.51.0/advice.h /usr/src/debug/git/2.51.0/rebase.h /usr/src/debug/git/2.51.0/strbuf.h /usr/src/debug/git/2.51.0/prune-packed.c /usr/src/debug/git/2.51.0/prune-packed.h /usr/src/debug/git/2.51.0/editor.h /usr/src/debug/git/2.51.0/cache-tree.c /usr/src/debug/git/2.51.0/transport-helper.c /usr/src/debug/git/2.51.
 0/cache-tree.h /usr/src/debug/git/2.51.0/pretty.c /usr/src/debug/git/2.51.0/prompt.c /usr/src/debug/git/2.51.0/diff-delta.c /usr/src/debug/git/2.51.0/pseudo-merge.h /usr/src/debug/git/2.51.0/bloom.h /usr/src/debug/git/2.51.0/pseudo-merge.c /usr/src/debug/git/2.51.0/fetch-pack.h /usr/src/debug/git/2.51.0/fetch-pack.c /usr/src/debug/git/2.51.0/pack-bitmap.c /usr/src/debug/git/2.51.0/pack-bitmap.h /usr/src/debug/git/2.51.0/tmp-objdir.c /usr/src/debug/git/2.51.0/tmp-objdir.h /usr/src/debug/git/2.51.0/fsmonitor-ll.h"
packages/x86-64-v3-poky-linux/git/git-src: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-staticdev: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-staticdev: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git-tk: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git-tk: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/git: PKGSIZE changed from 24669335 to 24761272 (+0%)
packages/x86-64-v3-poky-linux/git/git: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/git: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git/gitweb: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git/gitweb: PV changed from "2.50.1" to "2.51.0"
packages/x86-64-v3-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.50.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.51.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/x86-64-v3-poky-linux/git: PKGV changed from 2.50.1 [default] to 2.51.0 [default]
packages/x86-64-v3-poky-linux/git: PV changed from "2.50.1" to "2.51.0"

--===============3029115938531204363==--

