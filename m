Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5F9C71147
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.27772.1748786127043424261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hKkUwOXa;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=X+e2yCXw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101972bc69e94-c0c07589-6726-4f34-bd87-1a3241907f61-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LAw7uQhulUqH+coayrk74lABTEug6eMPfSgEKOTmnIQ=;
	b=hKkUwOXaTX8q9B+4TrfAggcDdRpVjlJ8JcgZyArGsPVTZZvtN84TxuASavtBEWTT
	NoWKP7A8FwLLIy7yE9+m+RIDYYBBeFUPyYQ+WXrS8C8YQojBK3Xqns+sXvBQCtPGIfu
	tvwaAUilRs2pnvNcZT3ds80iFZFyxvRZXVr2S408=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LAw7uQhulUqH+coayrk74lABTEug6eMPfSgEKOTmnIQ=;
	b=X+e2yCXwRxKFvWW3HH0fifKjbPhP8BqK3+EieA4WfqCrEvjiXgcIF/i1Y6LCFA4E
	BfW40drVeIuT4XZeRYV94P2QstZsza3zHpQztoGpdh0hd9+CymmOa3dmMzDCK2DCwGB
	V85RbTmKhnq7PLdGPOug3RiBj8fLx5w+SXlmIYXs=
Content-Type: multipart/mixed; boundary="===============1619923285004165864=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.2.3 SUCCEEDED
Message-ID: <010101972bc69e94-c0c07589-6726-4f34-bd87-1a3241907f61-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217570

--===============1619923285004165864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.2.2-10.2.3.patch
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
From d9ac7e56f2817a97e2e2e31dad2de8d64bcfb307 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 07:53:00 +0000
Subject: [PATCH] dhcpcd: upgrade 10.2.2 -> 10.2.3

---
 .../dhcpcd/{dhcpcd_10.2.2.bb => dhcpcd_10.2.3.bb}         | 2 +-
 ...esolv.conf-improve-the-sitation-of-working-with-.patch | 8 ++++----
 ...dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 4 ++--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch  | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.2.2.bb => dhcpcd_10.2.3.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.3.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.3.bb
index f9dfd2e245..d2320a9467 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"
+SRCREV = "e20185bc09694db67c6d0b56dd58cfe5ee85c6d4"
 S = "${WORKDIR}/git"
 
 # Doesn't use automake so we can't do out-of-tree builds
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 4f687b0292..04bfc10172 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 33710a648a805d96abf49d5adf6ca55b89f9c858 Mon Sep 17 00:00:00 2001
+From d22c688291088d7c7d0c4964175bf6c657461409 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -27,7 +27,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/hooks/20-resolv.conf b/hooks/20-resolv.conf
-index 7c29e276..becc019f 100644
+index bd0b0df5..9c7721de 100644
 --- a/hooks/20-resolv.conf
 +++ b/hooks/20-resolv.conf
 @@ -11,8 +11,12 @@ nocarrier_roaming_dir="$state_dir/roaming"
@@ -59,7 +59,7 @@ index 7c29e276..becc019f 100644
  	fi
  	rm -f "$cf"
  }
-@@ -170,7 +179,7 @@ add_resolv_conf()
+@@ -179,7 +188,7 @@ add_resolv_conf()
  	for x in ${new_domain_name_servers}; do
  		conf="${conf}nameserver $x$NL"
  	done
@@ -68,7 +68,7 @@ index 7c29e276..becc019f 100644
  		[ -n "$ifmetric" ] && export IF_METRIC="$ifmetric"
  		printf %s "$conf" | "$resolvconf" -a "$ifname"
  		return $?
-@@ -186,7 +195,7 @@ add_resolv_conf()
+@@ -195,7 +204,7 @@ add_resolv_conf()
  
  remove_resolv_conf()
  {
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 484b84f94a..a83d808d29 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
+From 88cc22cf2b734640447b49ddc502574b181bf3fb Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,7 +29,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 91fdde2c..b467dc3b 100644
+index ebbf06c0..c7ffee6b 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
 @@ -826,7 +826,7 @@ Configuration file for dhcpcd.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index fd3fae7e7e..aff6cc54cc 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
+From 2c96e979608cc77395aea6fe70bade3d7a6fb399 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
-- 
2.47.1


--===============1619923285004165864==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.2.2-10.2.3.patch"

RnJvbSBkOWFjN2U1NmYyODE3YTk3ZTJlMmUzMWRhZDJkZThkNjRiY2ZiMzA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNzo1MzowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZDogdXBncmFkZSAxMC4yLjIgLT4gMTAuMi4zCgotLS0KIC4uLi9kaGNwY2Qve2RoY3BjZF8x
MC4yLjIuYmIgPT4gZGhjcGNkXzEwLjIuMy5iYn0gICAgICAgICB8IDIgKy0KIC4uLmVzb2x2LmNv
bmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCB8IDggKysrKy0t
LS0KIC4uLmRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5w
YXRjaCB8IDQgKystLQogLi4uLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWls
ZC1pc3N1ZXMucGF0Y2ggIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qv
e2RoY3BjZF8xMC4yLjIuYmIgPT4gZGhjcGNkXzEwLjIuMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMi4yLmJiIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjIuMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9k
aGNwY2RfMTAuMi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3Bj
ZC9kaGNwY2RfMTAuMi4zLmJiCmluZGV4IGY5ZGZkMmUyNDUuLmQyMzIwYTk0NjcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4yLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjIuMy5iYgpAQCAt
MTcsNyArMTcsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vTmV0d29ya0NvbmZpZ3Vy
YXRpb24vZGhjcGNkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICBmaWxlOi8v
MDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0
Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJmNjk4M2MxOGRiZjc5ODlmNDNhMjgzOGJl
ZWFmNjJhNTRjNTNmZjFkIgorU1JDUkVWID0gImUyMDE4NWJjMDk2OTRkYjY3YzZkMGI1NmRkNThj
ZmU1ZWU4NWM2ZDQiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiAjIERvZXNuJ3QgdXNlIGF1dG9t
YWtlIHNvIHdlIGNhbid0IGRvIG91dC1vZi10cmVlIGJ1aWxkcwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXBy
b3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1z
aXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCmluZGV4IDRmNjg3YjAyOTIuLjA0YmZjMTAx
NzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAw
MDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIw
LXJlc29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDMzNzEwYTY0OGE4MDVkOTZhYmY0OWQ1YWRmNmNhNTViODlm
OWM4NTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQyMmM2ODgyOTEwODhkN2M3ZDBj
NDk2NDE3NWJmNmM2NTc0NjE0MDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVu
IFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDkgTm92IDIwMjIgMTY6MzM6
MTggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gMjAtcmVzb2x2LmNvbmY6IGltcHJvdmUgdGhlIHNp
dGF0aW9uIG9mIHdvcmtpbmcgd2l0aCBzeXN0ZW1kCkBAIC0yNyw3ICsyNyw3IEBAIFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2hvb2tzLzIw
LXJlc29sdi5jb25mIGIvaG9va3MvMjAtcmVzb2x2LmNvbmYKLWluZGV4IDdjMjllMjc2Li5iZWNj
MDE5ZiAxMDA2NDQKK2luZGV4IGJkMGIwZGY1Li45Yzc3MjFkZSAxMDA2NDQKIC0tLSBhL2hvb2tz
LzIwLXJlc29sdi5jb25mCiArKysgYi9ob29rcy8yMC1yZXNvbHYuY29uZgogQEAgLTExLDggKzEx
LDEyIEBAIG5vY2Fycmllcl9yb2FtaW5nX2Rpcj0iJHN0YXRlX2Rpci9yb2FtaW5nIgpAQCAtNTks
NyArNTksNyBAQCBpbmRleCA3YzI5ZTI3Ni4uYmVjYzAxOWYgMTAwNjQ0CiAgCWZpCiAgCXJtIC1m
ICIkY2YiCiAgfQotQEAgLTE3MCw3ICsxNzksNyBAQCBhZGRfcmVzb2x2X2NvbmYoKQorQEAgLTE3
OSw3ICsxODgsNyBAQCBhZGRfcmVzb2x2X2NvbmYoKQogIAlmb3IgeCBpbiAke25ld19kb21haW5f
bmFtZV9zZXJ2ZXJzfTsgZG8KICAJCWNvbmY9IiR7Y29uZn1uYW1lc2VydmVyICR4JE5MIgogIAlk
b25lCkBAIC02OCw3ICs2OCw3IEBAIGluZGV4IDdjMjllMjc2Li5iZWNjMDE5ZiAxMDA2NDQKICAJ
CVsgLW4gIiRpZm1ldHJpYyIgXSAmJiBleHBvcnQgSUZfTUVUUklDPSIkaWZtZXRyaWMiCiAgCQlw
cmludGYgJXMgIiRjb25mIiB8ICIkcmVzb2x2Y29uZiIgLWEgIiRpZm5hbWUiCiAgCQlyZXR1cm4g
JD8KLUBAIC0xODYsNyArMTk1LDcgQEAgYWRkX3Jlc29sdl9jb25mKCkKK0BAIC0xOTUsNyArMjA0
LDcgQEAgYWRkX3Jlc29sdl9jb25mKCkKICAKICByZW1vdmVfcmVzb2x2X2NvbmYoKQogIHsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhj
cGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29u
ZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKaW5kZXggNDg0Yjg0Zjk0YS4u
YTgzZDgwOGQyOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qv
ZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGls
aWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAw
MS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGU5YjEzNzZjNTliMTVlN2IwMzYxMTQyOTE4N2Q5ZDg5MTY3
MTU0YjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg4Y2MyMmNmMmI3MzQ2NDA0NDdi
NDlkZGM1MDI1NzRiMTgxYmYzZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMZWkg
TWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+CiBEYXRlOiBGcmksIDEwIE1hciAyMDIzIDAz
OjQ4OjQ2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRoY3BjZC44OiBGaXggY29uZmxpY3QgZXJy
b3Igd2hlbiBlbmFibGUgbXVsdGlsaWIuCkBAIC0yOSw3ICsyOSw3IEBAIFNpZ25lZC1vZmYtYnk6
IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9kaGNwY2QuOC5p
biBiL3NyYy9kaGNwY2QuOC5pbgotaW5kZXggOTFmZGRlMmMuLmI0NjdkYzNiIDEwMDY0NAoraW5k
ZXggZWJiZjA2YzAuLmM3ZmZlZTZiIDEwMDY0NAogLS0tIGEvc3JjL2RoY3BjZC44LmluCiArKysg
Yi9zcmMvZGhjcGNkLjguaW4KIEBAIC04MjYsNyArODI2LDcgQEAgQ29uZmlndXJhdGlvbiBmaWxl
IGZvciBkaGNwY2QuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3Bj
ZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUt
SU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaAppbmRleCBmZDNmYWU3ZTdl
Li5hZmY2Y2M1NGNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3Bj
ZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVt
b3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGMyZWJjMzIxMTJlMGNkMjkzOTBiNGRjOTUxYjY1ZWZhZTM2ZDYwN2IgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJjOTZlOTc5NjA4Y2M3NzM5NWFlYTZmZTcwYmFkZTNk
N2E2ZmIzOTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTdGVmYW5vIENhcHBhIDxz
dGVmYW5vLmNhcHBhLmtzODlAZ21haWwuY29tPgogRGF0ZTogU3VuLCAxMyBKYW4gMjAxOSAwMTo1
MDo1MiArMDEwMAogU3ViamVjdDogW1BBVENIXSByZW1vdmUgSU5DTFVERURJUiB0byBwcmV2ZW50
IGJ1aWxkIGlzc3VlcwotLSAKMi40Ny4xCgo=

--===============1619923285004165864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.2.2" to "10.2.3"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1337496 to 1338008 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.2.2" to "10.2.3"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.2.2" to "10.2.3"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 66983 to 66829 (-0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.2.2" to "10.2.3"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.2.2" to "10.2.3"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1117821 to 1119955 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.2.2" to "10.2.3"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.2.2" to "10.2.3"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 436664 to 436759 (+0%)
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.2.2" to "10.2.3"

--===============1619923285004165864==--

