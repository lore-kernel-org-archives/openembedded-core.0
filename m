Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CD8CEBF68
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12113.1763224714356595535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3T2CC3Pv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=s2q3q7gH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a8861f94d-da112ea4-5ad2-4d4e-acf1-e17a405b3fb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aaKN8enm3lTJwai3yAkxZ+Vfj4PMolMHzGhdGTW8jGQ=;
	b=3T2CC3PvceK9cMdAs9z31quUuegshWHEc5KGl8P7og1F6sq5QjSTLbXnj0pJk/Wl
	QsV6UaPj3q70E/zR9uQbuIeNpCLcagiLAu3M8dXR4Rl6iOvWhDYBO8t8aU9LX8eWcne
	9RC6J0FkvJZui5z0K3922s+TChbuUyrZ9yhIsDnw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aaKN8enm3lTJwai3yAkxZ+Vfj4PMolMHzGhdGTW8jGQ=;
	b=s2q3q7gHsnDSVRvX2sMOF03cVgG/9uVtAgxLsJOGbKltR/t7+Pv76GlNZWmshqwL
	lRy3w3xktcub1doyJODQhaAtBt5xoSMFQf4j6v9JLK//amSWLMafofJ9iKG+sda/0VH
	S5SmyOrwSTXeDdlZj7pFI5VRXu9zJDiJWCy4NTC8=
Content-Type: multipart/mixed; boundary="===============2888303860938887087=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.3.0 SUCCEEDED
Message-ID: <0101019a8861f94d-da112ea4-5ad2-4d4e-acf1-e17a405b3fb5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226319

--===============2888303860938887087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.2.4-10.3.0.patch
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
From cef017eaef06fbf5b8975a23544d929db8f7a7a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 07:44:53 +0000
Subject: [PATCH] dhcpcd: upgrade 10.2.4 -> 10.3.0

---
 .../dhcpcd/{dhcpcd_10.2.4.bb => dhcpcd_10.3.0.bb}             | 2 +-
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 4 ++--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.2.4.bb => dhcpcd_10.3.0.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
index bfb24aa58c..a9d55313ae 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "93df2b254caf9639f9ffb66e0fe2b584eeba6220"
+SRCREV = "385ff246cbdbd1627582999f7705bf9ef2ad0d7d"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 512e33aebf..54875d3f84 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From d1581ce103db0a5db0b1761907fff9ddd6b55a8a Mon Sep 17 00:00:00 2001
+From 62eda958ed6d5c23fe88672960b63d916f784a48 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 484b84f94a..683731369b 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
+From 3cad22fbb96e96d58c71bb867e7dd3a67ee1f513 Mon Sep 17 00:00:00 2001
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
index fd3fae7e7e..12ffdad8ae 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
+From 48b70b3a25ea290115c95ae5d5451792c4cce2a2 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index a60da137..3673de8b 100755
+index e9c08f18..3f0770b7 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=
-- 
2.47.1


--===============2888303860938887087==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.2.4-10.3.0.patch"

RnJvbSBjZWYwMTdlYWVmMDZmYmY1Yjg5NzVhMjM1NDRkOTI5ZGI4ZjdhN2E0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDc6NDQ6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMi40IC0+IDEwLjMuMAoKLS0tCiAuLi4vZGhjcGNkL3tkaGNwY2Rf
MTAuMi40LmJiID0+IGRoY3BjZF8xMC4zLjAuYmJ9ICAgICAgICAgICAgIHwgMiArLQogLi4uMjAt
cmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCB8
IDIgKy0KIC4uLjAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVs
dGlsaWIucGF0Y2ggfCA0ICsrLS0KIC4uLi8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZl
bnQtYnVpbGQtaXNzdWVzLnBhdGNoICAgICAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL3tkaGNwY2RfMTAuMi40LmJiID0+IGRoY3BjZF8xMC4zLjAuYmJ9ICg5NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEw
LjIuNC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4zLjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2QvZGhjcGNkXzEwLjIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjMuMC5iYgppbmRleCBiZmIyNGFhNThjLi5hOWQ1NTMx
M2FlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2Rf
MTAuMi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8x
MC4zLjAuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05l
dHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxl
LW11bHRpbGliLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiOTNkZjJiMjU0Y2Fm
OTYzOWY5ZmZiNjZlMGZlMmI1ODRlZWJhNjIyMCIKK1NSQ1JFViA9ICIzODVmZjI0NmNiZGJkMTYy
NzU4Mjk5OWY3NzA1YmY5ZWYyYWQwZDdkIgogCiAjIERvZXNuJ3QgdXNlIGF1dG9tYWtlIHNvIHdl
IGNhbid0IGRvIG91dC1vZi10cmVlIGJ1aWxkcwogaW5oZXJpdCBwa2djb25maWcgYXV0b3Rvb2xz
LWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJhZGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0
YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
ZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Yt
d29ya2luZy13aXRoLS5wYXRjaAppbmRleCA1MTJlMzNhZWJmLi41NDg3NWQzZjg0IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIwLXJlc29s
di5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29u
Zi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBkMTU4MWNlMTAzZGIwYTVkYjBiMTc2MTkwN2ZmZjlkZGQ2YjU1YThhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MmVkYTk1OGVkNmQ1YzIzZmU4ODY3Mjk2MGI2M2Q5
MTZmNzg0YTQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hl
bkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA5IE5vdiAyMDIyIDE2OjMzOjE4ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIDIwLXJlc29sdi5jb25mOiBpbXByb3ZlIHRoZSBzaXRhdGlvbiBvZiB3
b3JraW5nIHdpdGggc3lzdGVtZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFi
bGUtbXVsdGlsaWIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxl
cy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5w
YXRjaAppbmRleCA0ODRiODRmOTRhLi42ODM3MzEzNjliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1l
cnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVu
LWVuYWJsZS1tdWx0aWxpYi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTliMTM3NmM1OWIx
NWU3YjAzNjExNDI5MTg3ZDlkODkxNjcxNTRiNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gM2NhZDIyZmJiOTZlOTZkNThjNzFiYjg2N2U3ZGQzYTY3ZWUxZjUxMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4KIERh
dGU6IEZyaSwgMTAgTWFyIDIwMjMgMDM6NDg6NDYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZGhj
cGNkLjg6IEZpeCBjb25mbGljdCBlcnJvciB3aGVuIGVuYWJsZSBtdWx0aWxpYi4KQEAgLTI5LDcg
KzI5LDcgQEAgU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvc3JjL2RoY3BjZC44LmluIGIvc3JjL2RoY3BjZC44LmluCi1pbmRleCA5MWZkZGUy
Yy4uYjQ2N2RjM2IgMTAwNjQ0CitpbmRleCBlYmJmMDZjMC4uYzdmZmVlNmIgMTAwNjQ0CiAtLS0g
YS9zcmMvZGhjcGNkLjguaW4KICsrKyBiL3NyYy9kaGNwY2QuOC5pbgogQEAgLTgyNiw3ICs4MjYs
NyBAQCBDb25maWd1cmF0aW9uIGZpbGUgZm9yIGRoY3BjZC4KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8t
cHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Ro
Y3BjZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVz
LnBhdGNoCmluZGV4IGZkM2ZhZTdlN2UuLjEyZmZkYWQ4YWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8t
cHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlz
c3Vlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzJlYmMzMjExMmUwY2QyOTM5MGI0ZGM5
NTFiNjVlZmFlMzZkNjA3YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDhiNzBiM2Ey
NWVhMjkwMTE1Yzk1YWU1ZDU0NTE3OTJjNGNjZTJhMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEua3M4OUBnbWFpbC5jb20+CiBEYXRl
OiBTdW4sIDEzIEphbiAyMDE5IDAxOjUwOjUyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92
ZSBJTkNMVURFRElSIHRvIHByZXZlbnQgYnVpbGQgaXNzdWVzCkBAIC0xMSw3ICsxMSw3IEBAIFNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEua3M4OUBnbWFpbC5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1
cmUgYi9jb25maWd1cmUKLWluZGV4IGE2MGRhMTM3Li4zNjczZGU4YiAxMDA3NTUKK2luZGV4IGU5
YzA4ZjE4Li4zZjA3NzBiNyAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysrIGIvY29uZmlndXJl
CiBAQCAtMjYsNyArMjYsNiBAQCBCVUlMRD0KLS0gCjIuNDcuMQoK

--===============2888303860938887087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1345584 to 1354968 (+1%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.2.4" to "10.3.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.2.4" to "10.3.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 66829 to 67121 (+0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.2.4" to "10.3.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.2.4" to "10.3.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1120455 to 1121999 (+0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: FILELIST: directory renamed /usr/src/debug/dhcpcd/10.2.4/src -> /usr/src/debug/dhcpcd/10.3.0/src, directory renamed /usr/src/debug/dhcpcd/10.2.4/compat/crypt_openssl -> /usr/src/debug/dhcpcd/10.3.0/compat/crypt_openssl, directory renamed /usr/src/debug/dhcpcd/10.2.4/src/dev -> /usr/src/debug/dhcpcd/10.3.0/src/dev, removed "/usr/src/debug/dhcpcd/10.2.4/compat/endian.h /usr/src/debug/dhcpcd/10.2.4/compat/bitops.h /usr/src/debug/dhcpcd/10.2.4/compat/setproctitle.h /usr/src/debug/dhcpcd/10.2.4/compat/rbtree.h /usr/src/debug/dhcpcd/10.2.4/compat/consttime_memequal.h /usr/src/debug/dhcpcd/10.2.4/compat/setproctitle.c /usr/src/debug/dhcpcd/10.2.4/compat/_strtoi.h /usr/src/debug/dhcpcd/10.2.4/compat/pidfile.h /usr/src/debug/dhcpcd/10.2.4/compat/rb.c /usr/src/debug/dhcpcd/10.2.4/compat/strtoi.h /usr/src/debug/dhcpcd/10.2.4/compat/pidfile.c", added "/usr/src/debug/dhcpcd/10.3.0/compat/endian.h /usr/src/debug/dhcpcd/10.3.0/compat/bitops.h /usr/sr
 c/debug/dhcpcd/10.3.0/compat/setproctitle.h /usr/src/debug/dhcpcd/10.3.0/compat/consttime_memequal.h /usr/src/debug/dhcpcd/10.3.0/compat/setproctitle.c /usr/src/debug/dhcpcd/10.3.0/compat/_strtoi.h /usr/src/debug/dhcpcd/10.3.0/compat/pidfile.h /usr/src/debug/dhcpcd/10.3.0/vendor/rbtree.c /usr/src/debug/dhcpcd/10.3.0/compat/pidfile.c /usr/src/debug/dhcpcd/10.3.0/compat/strtoi.h /usr/src/debug/dhcpcd/10.3.0/vendor/rbtree.h"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.2.4" to "10.3.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.2.4" to "10.3.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 440855 to 444982 (+1%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PV changed from "10.2.4" to "10.3.0"
packages/x86-64-v3-poky-linux/dhcpcd: PKGV changed from 10.2.4 [default] to 10.3.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd: PV changed from "10.2.4" to "10.3.0"

--===============2888303860938887087==--

