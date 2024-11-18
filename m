Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72ADD62077
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.4855.1731964658820751129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FTftJ6y0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Csp17iyc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019341237d59-5c361d35-0d8a-4c3a-b11b-a181019d2272-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964665;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RGHUODJafu8E1iiPtnR13MREMXVa14YRybfqk6faw1E=;
	b=FTftJ6y0gEuZ/Y9Er2jtRbnjiHAm2ilM905EV5JU+vLSKSAS8PjVcHAUWKNJuSWK
	/MiQ4ltc90aZJAHSNrht4gqx0QbPUxQOQlBFSgakVa7PCDUX5ww4ysDsqcNYm0fyW+3
	aS3eF/8D8X55hYekPmzhkfBp1ztT1okNe95WNxrw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964665;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RGHUODJafu8E1iiPtnR13MREMXVa14YRybfqk6faw1E=;
	b=Csp17iycmZ6Kmc6fBISDh0407K4+zqmmA1UTh95UuGeechL4CBEpTagTv4K/w4dj
	UH9vlgrK9iDHsfU+PGADOmB2OaW7tnUAWu3VpxFQW+SOosGUUtm5seRIAvANkyVjBT4
	oAiuo+l9NjuOlTIeBbD3jAfyen6I9HHshM7tF8fo=
Content-Type: multipart/mixed; boundary="===============3924163220742550069=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] virglrenderer: upgrading to 1.1.0 FAILED
Message-ID: <0101019341237d59-5c361d35-0d8a-4c3a-b11b-a181019d2272-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207330

--===============3924163220742550069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.0.1-1.1.0.patch
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
From 6e982db2f2ba890f015c744b283f7202845ef9be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 00:02:00 +0000
Subject: [PATCH] virglrenderer: upgrade 1.0.1 -> 1.1.0

---
 ...001-meson.build-use-python3-directly-for-python.patch | 9 ++++-----
 ...-Fix-int-conversion-fatal-build-error-with-GCC-.patch | 6 +-----
 .../{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb}   | 2 +-
 3 files changed, 6 insertions(+), 11 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb} (96%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 3e12495970..f9080d53c5 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From dec8cca59124d7f8796b54902482ceb295a71b51 Mon Sep 17 00:00:00 2001
+From 9677f66a240a0513623aa26b47233b49193d0402 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -8,16 +8,15 @@ its configuration).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 9f91ff2f..2391f89d 100644
+index 10be099e..3bb6eec7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -74,7 +74,7 @@ flags = [
+@@ -77,7 +77,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
@@ -25,4 +24,4 @@ index 9f91ff2f..2391f89d 100644
 +prog_python = 'python3'
  
  not_found = dependency('', required: false)
- libdrm_dep = dependency('libdrm', version : '>=2.4.50', required: get_option('drm').enabled() or get_option('venus'))
+ gbm_dep = not_found
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
index 9c49ee512a..67dc4989b5 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
@@ -1,4 +1,4 @@
-From 464deabe4d1bfce6b8f414ab0945d9a62b66ddd4 Mon Sep 17 00:00:00 2001
+From bb129aac12c5aa6e2dd371244b042baa82aff014 Mon Sep 17 00:00:00 2001
 From: Purushottam Choudhary <purushottam27.kumar@lge.com>
 Date: Tue, 8 Oct 2024 11:47:21 +0530
 Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
@@ -19,7 +19,6 @@ Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/
 Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
 Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
 ---
-
  src/vrend_winsys_egl.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
@@ -36,6 +35,3 @@ index 9d9f410c..8750f6b2 100644
  #endif
     } else {
  #ifdef ENABLE_GBM
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
similarity index 96%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
index 87f25a3461..3a099dd305 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
+SRCREV = "1aeaf5e10a9c89096e96d09599aa419d5c50712f"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
-- 
2.44.1


--===============3924163220742550069==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.0.1-1.1.0.patch"

RnJvbSA2ZTk4MmRiMmYyYmE4OTBmMDE1Yzc0NGIyODNmNzIwMjg0NWVmOWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMDA6MDI6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDEuMC4xIC0+IDEuMS4wCgotLS0KIC4uLjAwMS1tZXNvbi5i
dWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIHwgOSArKysrLS0tLS0K
IC4uLi1GaXgtaW50LWNvbnZlcnNpb24tZmF0YWwtYnVpbGQtZXJyb3Itd2l0aC1HQ0MtLnBhdGNo
IHwgNiArLS0tLS0KIC4uLi97dmlyZ2xyZW5kZXJlcl8xLjAuMS5iYiA9PiB2aXJnbHJlbmRlcmVy
XzEuMS4wLmJifSAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVy
L3t2aXJnbHJlbmRlcmVyXzEuMC4xLmJiID0+IHZpcmdscmVuZGVyZXJfMS4xLjAuYmJ9ICg5NiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xy
ZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVy
LzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaApp
bmRleCAzZTEyNDk1OTcwLi5mOTA4MGQ1M2M1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5
dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhv
bjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGVjOGNj
YTU5MTI0ZDdmODc5NmI1NDkwMjQ4MmNlYjI5NWE3MWI1MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOTY3N2Y2NmEyNDBhMDUxMzYyM2FhMjZiNDcyMzNiNDkxOTNkMDQwMiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogTW9uLCA2IEphbiAyMDIwIDEyOjQ0OjQyICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiB1c2UgJ3B5dGhvbjMnIGRpcmVjdGx5IGZvciBweXRob24K
QEAgLTgsMTYgKzgsMTUgQEAgaXRzIGNvbmZpZ3VyYXRpb24pLgogCiBVcHN0cmVhbS1TdGF0dXM6
IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgbWVzb24uYnVpbGQg
fCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCA5ZjkxZmYyZi4u
MjM5MWY4OWQgMTAwNjQ0CitpbmRleCAxMGJlMDk5ZS4uM2JiNmVlYzcgMTAwNjQ0CiAtLS0gYS9t
ZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC03NCw3ICs3NCw3IEBAIGZsYWdzID0g
WworQEAgLTc3LDcgKzc3LDcgQEAgZmxhZ3MgPSBbCiAgCiAgYWRkX3Byb2plY3RfYXJndW1lbnRz
KGNjLmdldF9zdXBwb3J0ZWRfYXJndW1lbnRzKGZsYWdzKSwgbGFuZ3VhZ2UgOiAnYycpCiAgCkBA
IC0yNSw0ICsyNCw0IEBAIGluZGV4IDlmOTFmZjJmLi4yMzkxZjg5ZCAxMDA2NDQKICtwcm9nX3B5
dGhvbiA9ICdweXRob24zJwogIAogIG5vdF9mb3VuZCA9IGRlcGVuZGVuY3koJycsIHJlcXVpcmVk
OiBmYWxzZSkKLSBsaWJkcm1fZGVwID0gZGVwZW5kZW5jeSgnbGliZHJtJywgdmVyc2lvbiA6ICc+
PTIuNC41MCcsIHJlcXVpcmVkOiBnZXRfb3B0aW9uKCdkcm0nKS5lbmFibGVkKCkgb3IgZ2V0X29w
dGlvbigndmVudXMnKSkKKyBnYm1fZGVwID0gbm90X2ZvdW5kCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtdnJlbmQtRml4
LWludC1jb252ZXJzaW9uLWZhdGFsLWJ1aWxkLWVycm9yLXdpdGgtR0NDLS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1G
aXgtaW50LWNvbnZlcnNpb24tZmF0YWwtYnVpbGQtZXJyb3Itd2l0aC1HQ0MtLnBhdGNoCmluZGV4
IDljNDllZTUxMmEuLjY3ZGM0OTg5YjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1GaXgtaW50LWNvbnZlcnNp
b24tZmF0YWwtYnVpbGQtZXJyb3Itd2l0aC1HQ0MtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1GaXgtaW50LWNv
bnZlcnNpb24tZmF0YWwtYnVpbGQtZXJyb3Itd2l0aC1HQ0MtLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA0NjRkZWFiZTRkMWJmY2U2YjhmNDE0YWIwOTQ1ZDlhNjJiNjZkZGQ0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYjEyOWFhYzEyYzVhYTZlMmRkMzcxMjQ0YjA0MmJhYTgy
YWZmMDE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUHVydXNob3R0YW0gQ2hvdWRo
YXJ5IDxwdXJ1c2hvdHRhbTI3Lmt1bWFyQGxnZS5jb20+CiBEYXRlOiBUdWUsIDggT2N0IDIwMjQg
MTE6NDc6MjEgKzA1MzAKIFN1YmplY3Q6IFtQQVRDSF0gdnJlbmQ6IEZpeCBpbnQtY29udmVyc2lv
biBmYXRhbCBidWlsZCBlcnJvciB3aXRoIEdDQy0xNApAQCAtMTksNyArMTksNiBAQCBVcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wv
dmlyZ2xyZW5kZXJlci8tLwogU2lnbmVkLW9mZi1ieTogUHVydXNob3R0YW0gQ2hvdWRoYXJ5IDxw
dXJ1c2hvdHRhbTI3Lmt1bWFyQGxnZS5jb20+CiBQYXJ0LW9mOiA8aHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVuZGVyZXIvLS9tZXJnZV9yZXF1ZXN0cy8xNDQwPgog
LS0tCi0KICBzcmMvdnJlbmRfd2luc3lzX2VnbC5jIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCkBAIC0zNiw2ICszNSwzIEBAIGluZGV4IDlk
OWY0MTBjLi44NzUwZjZiMiAxMDA2NDQKICAjZW5kaWYKICAgICB9IGVsc2UgewogICNpZmRlZiBF
TkFCTEVfR0JNCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjEuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92
aXJnbHJlbmRlcmVyXzEuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvdmly
Z2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMS4wLmJiCmluZGV4IDg3ZjI1YTM0NjEuLjNhMDk5
ZGQzMDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zp
cmdscmVuZGVyZXJfMS4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjEuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDRU5TRSA9ICJN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jODFjMDhlZWVmZDk0
MThmY2E4Zjg4MzA5YTc2ZGIxMCIKIAogREVQRU5EUyA9ICJsaWJkcm0gbGliZXBveHkgdmlydHVh
bC9lZ2wgdmlydHVhbC9saWJnYm0iCi1TUkNSRVYgPSAiNjkwNjgwZTVmMGY5NTJlMjI0MjRmY2Ex
NTM4YzFiMjQ0NTdhMDg2OCIKK1NSQ1JFViA9ICIxYWVhZjVlMTBhOWM4OTA5NmU5NmQwOTU5OWFh
NDE5ZDVjNTA3MTJmIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Zp
cmdsL3ZpcmdscmVuZGVyZXIuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5
dGhvbi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVy
c2lvbi1mYXRhbC1idWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2ggXAotLSAKMi40NC4xCgo=

--===============3924163220742550069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fcec5b5e08899a6b71e9830d17467cb26b738ef5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 265 Local 253 Mirrors 0 Missed 12 Current 422 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 450 of 687 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running task 1220 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_recipe_qa)
NOTE: Running task 1225 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 687 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_recipe_qa unihash changed to 9db1db42f64c81cc085b3be85bf1362a985a4b578f0b94cfc8e4b248a1a21856
NOTE: Running task 1263 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 687 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 687 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1372 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 687 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1916 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1925 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_patch)
NOTE: Running task 1926 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1927 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1928 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_populate_lic unihash changed to b8992058d765b831b1b2287de4f85b08dfdecc2e91d5ae959a552eb0bc92b489
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch unihash changed to 95233f5abf27ce4e35a1aeea1931097f927c301d541324ff580142c0ee89f435
NOTE: Setscene tasks completed
NOTE: Running task 1929 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure)
NOTE: recipe virglrenderer-1.1.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot', '/srv
 /pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'texinfo-dummy-native', 'xz', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'gdbm', 'libffi', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 
 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddrm-msm-experimental=false -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.6.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/git
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/build
| Build type: cross build
| 
| ../git/meson.build:24:0: ERROR: Unknown options: "drm-msm-experimental"
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1638840:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1638840, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1638840, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1638840, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1638840, line 183
NOTE: recipe virglrenderer-1.1.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1929 tasks of which 1919 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118000059.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118000059.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/log.do_configure.1638840
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.1.0-r0 do_configure: meson failed
ERROR: virglrenderer-1.1.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1638840' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/log.do_configure.1638840
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure) failed with exit code '1'

--===============3924163220742550069==--

