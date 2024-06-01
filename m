Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F03C27C5E
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42206.1717263217645949738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DUa6aX2Q;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=spyxdyjo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018fd4dd2ffd-a74d525a-8ae4-49ce-9bd7-7941b2677a42-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=/D4jaC9Oz6WIQ4dOP7Hsz6/N9LbLjZolpEyu6PXmyvo=;
	b=DUa6aX2QB7IxBeb0SadGroSEDIGQ5y4lVsTrdBK17yVKriVq4bObRESf3mVbDlML
	aS4O0cJVp0itasxznp0sxPy0/A+C+c3dWkJA7b5Ph61IFileCq/A+/fMyil8uXLZOOO
	93LgSmYvC1m8FYOS7UzgiT/mD0m8761o0hm6mRt4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=/D4jaC9Oz6WIQ4dOP7Hsz6/N9LbLjZolpEyu6PXmyvo=;
	b=spyxdyjoX4gJTlltB+MPpPo6bJ8FtnAsC/bdoxyS9b253C3LkjpN5E8tKx3aT7LA
	uW8mxiOhRVW1TciC+KPVIGMCE6+eQjAz8AdrA70+ue9Qm/Uew4iJEWlrjgfwj7AjiN1
	CT0LS/3L8M4WnUrBeSpHc7Lv0ffoRNxuLdtiB2jM=
Content-Type: multipart/mixed; boundary="===============3890015985154383290=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.8 SUCCEEDED
Message-ID: <0101018fd4dd2ffd-a74d525a-8ae4-49ce-9bd7-7941b2677a42-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200118

--===============3890015985154383290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.0.6-10.0.8.patch
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
From ba887149f474d4d5605d9c54c698ed2e0cb0e1df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 07:21:17 +0000
Subject: [PATCH] dhcpcd: upgrade 10.0.6 -> 10.0.8

---
 .../dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb}            | 2 +-
 ...0-resolv.conf-improve-the-sitation-of-working-with-.patch | 5 +----
 ...01-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 3 +--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch     | 5 ++---
 4 files changed, 5 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
index fd193b2cff..43de279cfd 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
+SRCREV = "a15ba1987c264eaa06c2655ddd0891aa5ac48c09"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 8d1ed6671a..a5d45fca0e 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From e1ab6968df2cda627b6e5f8d427d6e5a2cf82c18 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -77,6 +77,3 @@ index 7c29e276..becc019f 100644
  		"$resolvconf" -d "$ifname" -f
  	else
  		if [ -e "$resolv_conf_dir/$ifname" ]; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 461d04bd1d..f5efca432b 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 5d5ba8a2b8010db6bee68bd712f829cb737c9ac1 Mon Sep 17 00:00:00 2001
+From 2d0719808834a0c46f512a5c258c9fe320378857 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -24,7 +24,6 @@ versions.
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
-
 ---
  src/dhcpcd.8.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index c54942be4b..0537b89d1d 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From ec9fc4e6086e1dbe0ac2f94a8a088a571596a581 Mon Sep 17 00:00:00 2001
+From 7c4244b636b83c6500a9cdf18429be8c7fb50657 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -6,13 +6,12 @@ Subject: [PATCH] remove INCLUDEDIR to prevent build issues
 Upstream-Status: Pending
 
 Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
-
 ---
  configure | 5 -----
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 5237b0e2..7220718b 100755
+index 0a28a0cf..a81c73c1 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=
-- 
2.44.0


--===============3890015985154383290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1198864 to 1210776 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 64738 to 65145 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1095251 to 1105980 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 424332 to 428440 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.0.6" to "10.0.8"

--===============3890015985154383290==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.6-10.0.8.patch"

RnJvbSBiYTg4NzE0OWY0NzRkNGQ1NjA1ZDljNTRjNjk4ZWQyZTBjYjBlMWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwNzoyMToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZDogdXBncmFkZSAxMC4wLjYgLT4gMTAuMC44CgotLS0KIC4uLi9kaGNwY2Qve2RoY3BjZF8x
MC4wLjYuYmIgPT4gZGhjcGNkXzEwLjAuOC5iYn0gICAgICAgICAgICB8IDIgKy0KIC4uLjAtcmVz
b2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCB8IDUg
Ky0tLS0KIC4uLjAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0
aWxpYi5wYXRjaCB8IDMgKy0tCiAuLi4vMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50
LWJ1aWxkLWlzc3Vlcy5wYXRjaCAgICAgfCA1ICsrLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2Qve2RoY3BjZF8xMC4wLjYuYmIgPT4gZGhjcGNkXzEwLjAuOC5iYn0gKDk3JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAu
MC42LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjAuOC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2RoY3BjZC9kaGNwY2RfMTAuMC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMC44LmJiCmluZGV4IGZkMTkzYjJjZmYuLjQzZGUyNzlj
ZmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8x
MC4wLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEw
LjAuOC5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vTmV0
d29ya0NvbmZpZ3VyYXRpb24vZGhjcGNkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUt
bXVsdGlsaWIucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICIxYzhhZTU5ODM2ZmE4
N2I0YzYzYzU5ODA4N2YwNDYwZWMyMGVkODYyIgorU1JDUkVWID0gImExNWJhMTk4N2MyNjRlYWEw
NmMyNjU1ZGRkMDg5MWFhNWFjNDhjMDkiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBpbmhlcml0
IHBrZ2NvbmZpZyBhdXRvdG9vbHMtYnJva2Vuc2VwIHN5c3RlbWQgdXNlcmFkZApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYu
Y29uZi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXBy
b3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCmluZGV4IDhkMWVkNjY3MWEu
LmE1ZDQ1ZmNhMGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNk
L2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2lu
Zy13aXRoLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxl
cy8wMDAxLTIwLXJlc29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0
aC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAyYWNjNGQ4NzVlZTgxZTZmZDE5ZWY2NmQ2
OWM5ZjU1YjRiNGE3ZTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUxYWI2OTY4ZGYy
Y2RhNjI3YjZlNWY4ZDQyN2Q2ZTVhMmNmODJjMTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDkgTm92IDIw
MjIgMTY6MzM6MTggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gMjAtcmVzb2x2LmNvbmY6IGltcHJv
dmUgdGhlIHNpdGF0aW9uIG9mIHdvcmtpbmcgd2l0aCBzeXN0ZW1kCkBAIC03Nyw2ICs3NywzIEBA
IGluZGV4IDdjMjllMjc2Li5iZWNjMDE5ZiAxMDA2NDQKICAJCSIkcmVzb2x2Y29uZiIgLWQgIiRp
Zm5hbWUiIC1mCiAgCWVsc2UKICAJCWlmIFsgLWUgIiRyZXNvbHZfY29uZl9kaXIvJGlmbmFtZSIg
XTsgdGhlbgotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1l
bmFibGUtbXVsdGlsaWIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9m
aWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxp
Yi5wYXRjaAppbmRleCA0NjFkMDRiZDFkLi5mNWVmY2E0MzJiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGlj
dC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13
aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWQ1YmE4YTJi
ODAxMGRiNmJlZTY4YmQ3MTJmODI5Y2I3MzdjOWFjMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMmQwNzE5ODA4ODM0YTBjNDZmNTEyYTVjMjU4YzlmZTMyMDM3ODg1NyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4K
IERhdGU6IEZyaSwgMTAgTWFyIDIwMjMgMDM6NDg6NDYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZGhjcGNkLjg6IEZpeCBjb25mbGljdCBlcnJvciB3aGVuIGVuYWJsZSBtdWx0aWxpYi4KQEAgLTI0
LDcgKzI0LDYgQEAgdmVyc2lvbnMuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
b2Ugc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRz
dS5jb20+Ci0KIC0tLQogIHNyYy9kaGNwY2QuOC5pbiB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVu
dC1idWlsZC1pc3N1ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9m
aWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNo
CmluZGV4IGM1NDk0MmJlNGIuLjA1MzdiODlkMWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVu
dC1idWlsZC1pc3N1ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNw
Y2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWM5ZmM0ZTYwODZlMWRiZTBhYzJmOTRhOGEwODhh
NTcxNTk2YTU4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2M0MjQ0YjYzNmI4M2M2
NTAwYTljZGYxODQyOWJlOGM3ZmI1MDY1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEua3M4OUBnbWFpbC5jb20+CiBEYXRlOiBTdW4s
IDEzIEphbiAyMDE5IDAxOjUwOjUyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBJTkNM
VURFRElSIHRvIHByZXZlbnQgYnVpbGQgaXNzdWVzCkBAIC02LDEzICs2LDEyIEBAIFN1YmplY3Q6
IFtQQVRDSF0gcmVtb3ZlIElOQ0xVREVESVIgdG8gcHJldmVudCBidWlsZCBpc3N1ZXMKIFVwc3Ry
ZWFtLVN0YXR1czogUGVuZGluZwogCiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIENhcHBhIDxzdGVm
YW5vLmNhcHBhLmtzODlAZ21haWwuY29tPgotCiAtLS0KICBjb25maWd1cmUgfCA1IC0tLS0tCiAg
MSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUg
Yi9jb25maWd1cmUKLWluZGV4IDUyMzdiMGUyLi43MjIwNzE4YiAxMDA3NTUKK2luZGV4IDBhMjhh
MGNmLi5hODFjNzNjMSAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysrIGIvY29uZmlndXJlCiBA
QCAtMjYsNyArMjYsNiBAQCBCVUlMRD0KLS0gCjIuNDQuMAoK

--===============3890015985154383290==--

