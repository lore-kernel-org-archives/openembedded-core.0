Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B2DF42101
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19736.1776261873799480840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UJKxqUSU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EArBjiF0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d91753ddf-c2fe2292-c86a-4e20-96d7-c5872271aea9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1aWwLhFpROFoSAX9zzgzcTs2Ff2JGGt3GVVPC/OCIXE=;
	b=UJKxqUSUVinqkjsXy/Y8pAJYIlfRFBZaGc/FGTwjm+uZ11qUqh9Pf8TJYlXqXLgU
	bbPUCzK2nIkoj/sCwR5AhTfNGX7oASpSgtVl8fKpeTWvy+TIDD9z73RMHOrG+l+2LPd
	+cnoiBrEmzmJUbmF6BXf1oACKfowkds+wzohusGE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1aWwLhFpROFoSAX9zzgzcTs2Ff2JGGt3GVVPC/OCIXE=;
	b=EArBjiF0DqaawIYah5s4ANdCg6RK+bkZqzruD5XbYkMe5ikB0RMoq6iazL6uPSVE
	yj2VnYeA7K2hMnCNM8qGud/hr7qkmnCGgFPtEkwLtyixpqcFpj8U7g6zEvgu534I5ky
	tMsa+y0t6w9+7t+cVqyo2YTma7z6uR41YYmeAZ74=
Content-Type: multipart/mixed; boundary="===============9078901019035751962=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.3.1 SUCCEEDED
Message-ID: <0101019d91753ddf-c2fe2292-c86a-4e20-96d7-c5872271aea9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235215

--===============9078901019035751962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.3.0-10.3.1.patch
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
From 99a4eee876a1c62f0afaaf720fe1466bd06c7d9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:10:40 +0000
Subject: [PATCH] dhcpcd: upgrade 10.3.0 -> 10.3.1

---
 .../dhcpcd/{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb}             | 2 +-
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 4 ++--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index fca7d8b11d..c940d6806a 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "385ff246cbdbd1627582999f7705bf9ef2ad0d7d"
+SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 512e33aebf..541bfbca05 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From d1581ce103db0a5db0b1761907fff9ddd6b55a8a Mon Sep 17 00:00:00 2001
+From d4a49329af6888ff554994cef9d3bcc0ca3a3b36 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 484b84f94a..69624a8ee1 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
+From f8f489c435b4945be6f959f45b1596ce7eb39817 Mon Sep 17 00:00:00 2001
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
index fd3fae7e7e..9025afd82f 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
+From f6b76e8a5c10a83d13d1337fe2f8e06ecb875645 Mon Sep 17 00:00:00 2001
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


--===============9078901019035751962==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.3.0-10.3.1.patch"

RnJvbSA5OWE0ZWVlODc2YTFjNjJmMGFmYWFmNzIwZmUxNDY2YmQwNmM3ZDliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6MTA6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMy4wIC0+IDEwLjMuMQoKLS0tCiAuLi4vZGhjcGNkL3tkaGNwY2Rf
MTAuMy4wLmJiID0+IGRoY3BjZF8xMC4zLjEuYmJ9ICAgICAgICAgICAgIHwgMiArLQogLi4uMjAt
cmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCB8
IDIgKy0KIC4uLjAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVs
dGlsaWIucGF0Y2ggfCA0ICsrLS0KIC4uLi8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZl
bnQtYnVpbGQtaXNzdWVzLnBhdGNoICAgICAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL3tkaGNwY2RfMTAuMy4wLmJiID0+IGRoY3BjZF8xMC4zLjEuYmJ9ICg5NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEw
LjMuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4zLjEu
YmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2QvZGhjcGNkXzEwLjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjMuMS5iYgppbmRleCBmY2E3ZDhiMTFkLi5jOTQwZDY4
MDZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2Rf
MTAuMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8x
MC4zLjEuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05l
dHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxl
LW11bHRpbGliLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiMzg1ZmYyNDZjYmRi
ZDE2Mjc1ODI5OTlmNzcwNWJmOWVmMmFkMGQ3ZCIKK1NSQ1JFViA9ICI0MmZmNmQyNTQ4MjA5YWYz
MTg1NDczZTZjYjZmOWQyMzVjNDhiYmY0IgogCiAjIERvZXNuJ3QgdXNlIGF1dG9tYWtlIHNvIHdl
IGNhbid0IGRvIG91dC1vZi10cmVlIGJ1aWxkcwogaW5oZXJpdCBwa2djb25maWcgYXV0b3Rvb2xz
LWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJhZGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0
YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
ZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Yt
d29ya2luZy13aXRoLS5wYXRjaAppbmRleCA1MTJlMzNhZWJmLi41NDFiZmJjYTA1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIwLXJlc29s
di5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29u
Zi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBkMTU4MWNlMTAzZGIwYTVkYjBiMTc2MTkwN2ZmZjlkZGQ2YjU1YThhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNGE0OTMyOWFmNjg4OGZmNTU0OTk0Y2VmOWQzYmNj
MGNhM2EzYjM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hl
bkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA5IE5vdiAyMDIyIDE2OjMzOjE4ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIDIwLXJlc29sdi5jb25mOiBpbXByb3ZlIHRoZSBzaXRhdGlvbiBvZiB3
b3JraW5nIHdpdGggc3lzdGVtZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFi
bGUtbXVsdGlsaWIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxl
cy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5w
YXRjaAppbmRleCA0ODRiODRmOTRhLi42OTYyNGE4ZWUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1l
cnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVu
LWVuYWJsZS1tdWx0aWxpYi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTliMTM3NmM1OWIx
NWU3YjAzNjExNDI5MTg3ZDlkODkxNjcxNTRiNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZjhmNDg5YzQzNWI0OTQ1YmU2Zjk1OWY0NWIxNTk2Y2U3ZWIzOTgxNyBNb24gU2VwIDE3IDAw
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
LnBhdGNoCmluZGV4IGZkM2ZhZTdlN2UuLjkwMjVhZmQ4MmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8t
cHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlz
c3Vlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzJlYmMzMjExMmUwY2QyOTM5MGI0ZGM5
NTFiNjVlZmFlMzZkNjA3YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjZiNzZlOGE1
YzEwYTgzZDEzZDEzMzdmZTJmOGUwNmVjYjg3NTY0NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEua3M4OUBnbWFpbC5jb20+CiBEYXRl
OiBTdW4sIDEzIEphbiAyMDE5IDAxOjUwOjUyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92
ZSBJTkNMVURFRElSIHRvIHByZXZlbnQgYnVpbGQgaXNzdWVzCkBAIC0xMSw3ICsxMSw3IEBAIFNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEua3M4OUBnbWFpbC5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1
cmUgYi9jb25maWd1cmUKLWluZGV4IGE2MGRhMTM3Li4zNjczZGU4YiAxMDA3NTUKK2luZGV4IGU5
YzA4ZjE4Li4zZjA3NzBiNyAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysrIGIvY29uZmlndXJl
CiBAQCAtMjYsNyArMjYsNiBAQCBCVUlMRD0KLS0gCjIuNDcuMQoK

--===============9078901019035751962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.3.0 [default] to 10.3.1 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1359832 to 1358696 (-0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.3.0 [default] to 10.3.1 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.3.0 [default] to 10.3.1 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.3.0 [default] to 10.3.1 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: FILELIST: directory renamed /usr/src/debug/dhcpcd/10.3.0/src/dev -> /usr/src/debug/dhcpcd/10.3.1/src/dev, directory renamed /usr/src/debug/dhcpcd/10.3.0/compat/crypt_openssl -> /usr/src/debug/dhcpcd/10.3.1/compat/crypt_openssl, directory renamed /usr/src/debug/dhcpcd/10.3.0/compat -> /usr/src/debug/dhcpcd/10.3.1/compat, directory renamed /usr/src/debug/dhcpcd/10.3.0/vendor -> /usr/src/debug/dhcpcd/10.3.1/vendor, directory renamed /usr/src/debug/dhcpcd/10.3.0/src -> /usr/src/debug/dhcpcd/10.3.1/src
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.3.0 [default] to 10.3.1 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1121999 to 1122361 (+0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.3.0 [default] to 10.3.1 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.3.0 [default] to 10.3.1 [default]
packages/x86-64-v3-poky-linux/dhcpcd: PV changed from "10.3.0" to "10.3.1"
packages/x86-64-v3-poky-linux/dhcpcd: SRC_URI changed from "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.3.0 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch" to "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.3.1 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch"
packages/x86-64-v3-poky-linux/dhcpcd: PKGV changed from 10.3.0 [default] to 10.3.1 [default]

--===============9078901019035751962==--

