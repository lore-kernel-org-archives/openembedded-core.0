Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456AFC48293
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.63616.1702649864517494938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=geFoe2RQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KwWE4w8g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c6dd71f0f-ed0e741c-8225-4c51-a99b-8550825557ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649864;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=9FpVY89I5joU9nrOEzVi+h5+RwyOv7D7BlAgOp2cBlw=;
	b=geFoe2RQhwDQ/LrvauT83+FQDRqxdCXLFkz+eVxlmJdLPJusyQIehNSFoeRncfr7
	n+DBU3Y+wC3LHcWnAzcsOv5m+k7FovWRZSsbfHQxvhtxRW8wVfk3VzceicKGEYD8X+3
	vNs2QxzXb0hSbl02jDDntb8HW0N/31X/oPBP/DX0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649864;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=9FpVY89I5joU9nrOEzVi+h5+RwyOv7D7BlAgOp2cBlw=;
	b=KwWE4w8g4Ee0K5pZpzCtCTZR6OdBrRdSySmkaTOl3QvuvWhse9WVbcfrgGxiJeaa
	ydfnau3JwmE+x9OAAR96PQ+2b1mZs34akmqogSIs/mVvVVSIzQe4zm5M8fMBzMnsWtP
	PW3KCL0FYqPlK2SV9XT8cHzhaTmOAihynheAzW+U=
Content-Type: multipart/mixed; boundary="===============0747545629771826373=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.40 SUCCEEDED
Message-ID: <0101018c6dd71f0f-ed0e741c-8225-4c51-a99b-8550825557ef-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192476

--===============0747545629771826373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.40* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.39-2.40.patch
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
From df547f0aa122c8666d926e5d966231fe16a96f54 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 08:44:23 +0000
Subject: [PATCH] repo: upgrade 2.39 -> 2.40

---
 meta/recipes-devtools/repo/repo/0001-python3-shebang.patch | 7 +++----
 meta/recipes-devtools/repo/{repo_2.39.bb => repo_2.40.bb}  | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/repo/{repo_2.39.bb => repo_2.40.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch b/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
index fba89a32d8..45a94ed258 100644
--- a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
+++ b/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
@@ -1,4 +1,4 @@
-From b8e84b202cd302a7c99288d3835dc9c63071f8f2 Mon Sep 17 00:00:00 2001
+From 67dac528bdc065c16cb19c2e6c1f80703e52fd52 Mon Sep 17 00:00:00 2001
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
+index 2dd9dd9..f5a4041 100755
 --- a/repo
 +++ b/repo
 @@ -1,4 +1,4 @@
@@ -22,5 +23,3 @@ index b13e34c..205e0e5 100755
  #
  # Copyright (C) 2008 The Android Open Source Project
  #
---
-2.33.0
diff --git a/meta/recipes-devtools/repo/repo_2.39.bb b/meta/recipes-devtools/repo/repo_2.40.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.39.bb
rename to meta/recipes-devtools/repo/repo_2.40.bb
index a0633a5cbb..e749ee1b76 100644
--- a/meta/recipes-devtools/repo/repo_2.39.bb
+++ b/meta/recipes-devtools/repo/repo_2.40.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "b99272c601bc5f466c3cfc782bb852c2c967ad27"
+SRCREV = "4c80921d22c20a28d531c9e3e8a0ce4433c6509d"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.42.0


--===============0747545629771826373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo: PKGV changed from 2.39 [default] to 2.40 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.39 [default] to 2.40 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.39 [default] to 2.40 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.39 [default] to 2.40 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.39 [default] to 2.40 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.39 [default] to 2.40 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.39 [default] to 2.40 [default]
packages/core2-64-poky-linux/repo/repo: PKGSIZE changed from 48604 to 48178 (-1%)
packages/core2-64-poky-linux/repo/repo: PV changed from "2.39" to "2.40"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.39 [default] to 2.40 [default]

--===============0747545629771826373==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.39-2.40.patch"

RnJvbSBkZjU0N2YwYWExMjJjODY2NmQ5MjZlNWQ5NjYyMzFmZTE2YTk2ZjU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDg6NDQ6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuMzkgLT4gMi40MAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by9yZXBvLzAwMDEtcHl0aG9uMy1zaGViYW5nLnBhdGNoIHwgNyArKystLS0tCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcmVwby97cmVwb18yLjM5LmJiID0+IHJlcG9fMi40MC5iYn0gIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8ve3JlcG9fMi4zOS5iYiA9PiByZXBvXzIuNDAuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwby8wMDAx
LXB5dGhvbjMtc2hlYmFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG8v
MDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2gKaW5kZXggZmJhODlhMzJkOC4uNDVhOTRlZDI1OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwby8wMDAxLXB5dGhvbjMt
c2hlYmFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvLzAwMDEt
cHl0aG9uMy1zaGViYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiOGU4NGIyMDJjZDMw
MmE3Yzk5Mjg4ZDM4MzVkYzljNjMwNzFmOGYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA2N2RhYzUyOGJkYzA2NWMxNmNiMTljMmU2YzFmODA3MDNlNTJmZDUyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSmFzcGVyIE9yc2NodWxrbyA8SmFzcGVyLk9yc2NodWxrb0Bpcmlz
LXNlbnNpbmcuY29tPgogRGF0ZTogVHVlLCAxNCBTZXAgMjAyMSAxNjo0Njo1MSArMDIwMAogU3Vi
amVjdDogW1BBVENIXSBweXRob24zIHNoZWJhbmcKQEAgLTgsMTIgKzgsMTMgQEAgcHl0aG9uIHRv
IHB5dGhvbjMuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmlndXJhdGlv
bl0KIFNpZ25lZC1vZmYtYnk6IEphc3BlciBPcnNjaHVsa28gPEphc3Blci5PcnNjaHVsa29AaXJp
cy1zZW5zaW5nLmNvbT4KKwogLS0tCiAgcmVwbyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3JlcG8gYi9yZXBvCi1p
bmRleCBiMTNlMzRjLi4yMDVlMGU1IDEwMDc1NQoraW5kZXggMmRkOWRkOS4uZjVhNDA0MSAxMDA3
NTUKIC0tLSBhL3JlcG8KICsrKyBiL3JlcG8KIEBAIC0xLDQgKzEsNCBAQApAQCAtMjIsNSArMjMs
MyBAQCBpbmRleCBiMTNlMzRjLi4yMDVlMGU1IDEwMDc1NQogICMKICAjIENvcHlyaWdodCAoQykg
MjAwOCBUaGUgQW5kcm9pZCBPcGVuIFNvdXJjZSBQcm9qZWN0CiAgIwotLS0KLTIuMzMuMApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjM5LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zOS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQwLmJiCmluZGV4IGEwNjMzYTVj
YmIuLmU3NDllZTFiNzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3Jl
cG9fMi4zOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDAuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiBTUkNfVVJJID0gImdpdDovL2dlcnJp
dC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFp
biBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXB5dGhvbjMtc2hlYmFuZy5wYXRjaCBcCiAgICAg
ICAgICAgICIKLVNSQ1JFViA9ICJiOTkyNzJjNjAxYmM1ZjQ2NmMzY2ZjNzgyYmI4NTJjMmM5Njdh
ZDI3IgorU1JDUkVWID0gIjRjODA5MjFkMjJjMjBhMjhkNTMxYzllM2U4YTBjZTQ0MzNjNjUwOWQi
CiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdp
dCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0tIAoy
LjQyLjAKCg==

--===============0747545629771826373==--

