Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB97EC54EB8
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2154.1706810405264903285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CfNlL8pD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nrKDFmjo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d65d3f3f5-4e4ca967-8d2e-45a0-afa8-11a7dda6c26b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=r90pfK5f1mGfmx6vLxknFRTMK2mX25d+ma+E9b+R6Tg=;
	b=CfNlL8pDmeSy/EJEU4e1zcvxlP/qz/Uh+/NhIWRDuFuQUiu2sMvSIRiAwxC27Asw
	09POUmMUyTbUJemdrlHmd7qJtWEjVH94aUEMk5lWB6A+JXKJJfPvd+GpLykfhuUvaHi
	ah/thZcdBBKhmZ9CeM33hePl+R1Vlx4yR82e+8xc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=r90pfK5f1mGfmx6vLxknFRTMK2mX25d+ma+E9b+R6Tg=;
	b=nrKDFmjon7sY4ovF6AL6tNo9mRm7qlTOkcZdTQAQ/mVdP+h8ASlVyjZrwjX4NbG3
	G0h/yZ9QW1nC/bfNs3HdmZUQO1ELiNhQcFYTAdrAGG8WHrMfM+jcTlVe2ZEeSDS7NMm
	8ODJIOMYmjhcy/o/V49bMObxrL68Iv8OVyX3tC8o=
Content-Type: multipart/mixed; boundary="===============8502881254752834237=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.41 SUCCEEDED
Message-ID: <0101018d65d3f3f5-4e4ca967-8d2e-45a0-afa8-11a7dda6c26b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194639

--===============8502881254752834237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.41* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.40-2.41.patch
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
From 62913c310f03e269abad25a2a49b0b9933913186 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 09:04:50 +0000
Subject: [PATCH] repo: upgrade 2.40 -> 2.41

---
 meta/recipes-devtools/repo/repo/0001-python3-shebang.patch | 7 +++----
 meta/recipes-devtools/repo/{repo_2.40.bb => repo_2.41.bb}  | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/repo/{repo_2.40.bb => repo_2.41.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch b/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
index fba89a32d8..a3beb1cc7a 100644
--- a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
+++ b/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
@@ -1,4 +1,4 @@
-From b8e84b202cd302a7c99288d3835dc9c63071f8f2 Mon Sep 17 00:00:00 2001
+From af9098153447bebb21737dc64d59e247e7ad1a1a Mon Sep 17 00:00:00 2001
 From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
 Date: Tue, 14 Sep 2021 16:46:51 +0200
 Subject: [PATCH] python3 shebang
@@ -8,12 +8,13 @@ python to python3.
 
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
+
 ---
  repo | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/repo b/repo
-index b13e34c..205e0e5 100755
+index b598c32..73bbce1 100755
 --- a/repo
 +++ b/repo
 @@ -1,4 +1,4 @@
@@ -22,5 +23,3 @@ index b13e34c..205e0e5 100755
  #
  # Copyright (C) 2008 The Android Open Source Project
  #
---
-2.33.0
diff --git a/meta/recipes-devtools/repo/repo_2.40.bb b/meta/recipes-devtools/repo/repo_2.41.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.40.bb
rename to meta/recipes-devtools/repo/repo_2.41.bb
index e749ee1b76..4d614d9c5f 100644
--- a/meta/recipes-devtools/repo/repo_2.40.bb
+++ b/meta/recipes-devtools/repo/repo_2.41.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "4c80921d22c20a28d531c9e3e8a0ce4433c6509d"
+SRCREV = "4217a82bec7b95c1a0bc7b081a1764a6a6d6c59b"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.42.0


--===============8502881254752834237==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.40-2.41.patch"

RnJvbSA2MjkxM2MzMTBmMDNlMjY5YWJhZDI1YTJhNDliMGI5OTMzOTEzMTg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwOTowNDo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi40MCAtPiAyLjQxCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggfCA3ICsrKy0tLS0KIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9yZXBvL3tyZXBvXzIuNDAuYmIgPT4gcmVwb18yLjQxLmJifSAgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby97cmVwb18yLjQwLmJiID0+IHJlcG9fMi40MS5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvLzAwMDEt
cHl0aG9uMy1zaGViYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwby8w
MDAxLXB5dGhvbjMtc2hlYmFuZy5wYXRjaAppbmRleCBmYmE4OWEzMmQ4Li5hM2JlYjFjYzdhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvLzAwMDEtcHl0aG9uMy1z
aGViYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG8vMDAwMS1w
eXRob24zLXNoZWJhbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4ZTg0YjIwMmNkMzAy
YTdjOTkyODhkMzgzNWRjOWM2MzA3MWY4ZjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGFmOTA5ODE1MzQ0N2JlYmIyMTczN2RjNjRkNTllMjQ3ZTdhZDFhMWEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBKYXNwZXIgT3JzY2h1bGtvIDxKYXNwZXIuT3JzY2h1bGtvQGlyaXMt
c2Vuc2luZy5jb20+CiBEYXRlOiBUdWUsIDE0IFNlcCAyMDIxIDE2OjQ2OjUxICswMjAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHB5dGhvbjMgc2hlYmFuZwpAQCAtOCwxMiArOCwxMyBAQCBweXRob24gdG8g
cHl0aG9uMy4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9u
XQogU2lnbmVkLW9mZi1ieTogSmFzcGVyIE9yc2NodWxrbyA8SmFzcGVyLk9yc2NodWxrb0Bpcmlz
LXNlbnNpbmcuY29tPgorCiAtLS0KICByZXBvIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcmVwbyBiL3JlcG8KLWlu
ZGV4IGIxM2UzNGMuLjIwNWUwZTUgMTAwNzU1CitpbmRleCBiNTk4YzMyLi43M2JiY2UxIDEwMDc1
NQogLS0tIGEvcmVwbwogKysrIGIvcmVwbwogQEAgLTEsNCArMSw0IEBACkBAIC0yMiw1ICsyMywz
IEBAIGluZGV4IGIxM2UzNGMuLjIwNWUwZTUgMTAwNzU1CiAgIwogICMgQ29weXJpZ2h0IChDKSAy
MDA4IFRoZSBBbmRyb2lkIE9wZW4gU291cmNlIFByb2plY3QKICAjCi0tLQotMi4zMy4wCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQwLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDEuYmIKaW5kZXggZTc0OWVlMWI3
Ni4uNGQ2MTRkOWM1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVw
b18yLjQwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40MS5iYgpA
QCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0z
YjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2Vycml0
Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWlu
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uMy1zaGViYW5nLnBhdGNoIFwKICAgICAg
ICAgICAgIgotU1JDUkVWID0gIjRjODA5MjFkMjJjMjBhMjhkNTMxYzllM2U4YTBjZTQ0MzNjNjUw
OWQiCitTUkNSRVYgPSAiNDIxN2E4MmJlYzdiOTVjMWEwYmM3YjA4MWExNzY0YTZhNmQ2YzU5YiIK
IAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0
IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVwby5naXQiCiAKLS0gCjIu
NDIuMAoK

--===============8502881254752834237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.40 [default] to 2.41 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.40" to "2.41"
packages/core2-64-poky-linux/repo/repo: PKGSIZE changed from 48178 to 46973 (-3%)

--===============8502881254752834237==--

