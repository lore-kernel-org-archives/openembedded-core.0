Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7D3CCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2362.1762384579487837860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uZgxpeNs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Pzpt+XyQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564ecf8e-a61d7ef3-c533-493c-b869-c863ae9ee5f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NYWfBlvjJ2964neTwwG2IzTJ0y0eUm5VfXFceYQVp7g=;
	b=uZgxpeNsVBWRL7rCXzsLHSQDB11PIU3R15/1vgFOXlL2O/NjbQK0oowMVKyQqSKu
	ndSUZwLj3sqLNcDr8ROv1iYYCtH0q0sbQbeeZwHsFPJX3SRAizuLX94uPzLY/wCONfo
	IS7BnbjKIcL2srF6W9PI1I2jrVdLqcRFpx1IE8UE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NYWfBlvjJ2964neTwwG2IzTJ0y0eUm5VfXFceYQVp7g=;
	b=Pzpt+XyQKpaMf7GV/l5XftTYR53b2qNCtELcnphqTM5V4su5cdG64o4SbI7Iv4qf
	qrJ+pCLUPp99D8NFoAqly6u3bH0AuDXk0WzukhwXGdhKMV1t5K15eEKrgg4h6jBaLN5
	adz7cJP+2ztvbauJ98H7/RTeqr6lHEj3qh+cvzwQ=
Content-Type: multipart/mixed; boundary="===============2141509705275638740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gtk-doc: upgrading to 1.35.1 SUCCEEDED
Message-ID: <0101019a564ecf8e-a61d7ef3-c533-493c-b869-c863ae9ee5f0-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225873

--===============2141509705275638740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk-doc* to *1.35.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk-doc-upgrade-1.34.0-1.35.1.patch
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
From 5e6b773cbc3436178de999813d08010644c6ab86 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 20:00:28 +0000
Subject: [PATCH] gtk-doc: upgrade 1.34.0 -> 1.35.1

---
 .../0001-Do-not-error-out-if-xsltproc-is-not-found.patch      | 4 ++--
 ...001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch | 2 +-
 meta/recipes-gnome/gtk-doc/files/conditionaltests.patch       | 4 ++--
 meta/recipes-gnome/gtk-doc/files/no-clobber.patch             | 2 +-
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch      | 2 +-
 .../gtk-doc/{gtk-doc_1.34.0.bb => gtk-doc_1.35.1.bb}          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.34.0.bb => gtk-doc_1.35.1.bb} (96%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
index ee1acda401..0782c74a31 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
@@ -1,4 +1,4 @@
-From 50d3b9d3ca0e1ff47c8e7559303855530e58839a Mon Sep 17 00:00:00 2001
+From 188aea7b9db654a4861d69cdbe9390ad4d11e366 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 7 Sep 2016 14:52:04 +0300
 Subject: [PATCH] Do not error out if xsltproc is not found.
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8725074..0491090 100644
+index f238de9..909771d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -37,7 +37,7 @@ dnl Check for xsltproc
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index f329539fa8..f86dd83ce8 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 64163565f8d6853b02e53308a6e6ba23d9d96299 Mon Sep 17 00:00:00 2001
+From c96907c2f6a8ca8eb9592b28e0de63a18ebd96bf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
index 55cae34b46..f56a19863b 100644
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
@@ -1,4 +1,4 @@
-From 9aa9230a305e964b2417daea2b51e43b2dee607c Mon Sep 17 00:00:00 2001
+From d140a99b8101bc42cb425140d9e51ae9d33ff2d0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 27 Jun 2017 21:00:58 +0100
 Subject: [PATCH] gtk-doc: Handle floating gtk-doc dependency
@@ -13,7 +13,7 @@ Upstream-Status: Pending
  1 file changed, 10 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 0491090..4270c88 100644
+index 909771d..9db9fbc 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -82,6 +82,11 @@ if test "x$GCC" = "xyes"; then
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index 90207d6c12..dc29b00ca4 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From fa5e31e02b9d3c6c5ec3cdc1f34dd6c179520fd0 Mon Sep 17 00:00:00 2001
+From 10c3d853908fbc92a710e9e2c1d70844311a05d5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 1b5c190f56..d2f4c05856 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From c11fba9bcb8d55568067e626bd959841c05081e5 Mon Sep 17 00:00:00 2001
+From a8846ec017503a450e6216797fcd8f4f9589ab64 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
similarity index 96%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
index 693ae427e0..c9ab7ff1e9 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
 
-SRC_URI[archive.sha256sum] = "b20b72b32a80bc18c7f975c9d4c16460c2276566a0b50f87d6852dff3aa7861c"
+SRC_URI[archive.sha256sum] = "611c9f24edd6d88a8ae9a79d73ab0dc63c89b81e90ecc31d6b9005c5f05b25e2"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.47.1


--===============2141509705275638740==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk-doc-upgrade-1.34.0-1.35.1.patch"

RnJvbSA1ZTZiNzczY2JjMzQzNjE3OGRlOTk5ODEzZDA4MDEwNjQ0YzZhYjg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMDowMDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
ay1kb2M6IHVwZ3JhZGUgMS4zNC4wIC0+IDEuMzUuMQoKLS0tCiAuLi4vMDAwMS1Eby1ub3QtZXJy
b3Itb3V0LWlmLXhzbHRwcm9jLWlzLW5vdC1mb3VuZC5wYXRjaCAgICAgIHwgNCArKy0tCiAuLi4w
MDEtRG8tbm90LWhhcmRvY29kZS1wYXRocy10by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNo
IHwgMiArLQogbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvY29uZGl0aW9uYWx0ZXN0
cy5wYXRjaCAgICAgICB8IDQgKystLQogbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMv
bm8tY2xvYmJlci5wYXRjaCAgICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1nbm9tZS9n
dGstZG9jL2ZpbGVzL3BrZy1jb25maWctbmF0aXZlLnBhdGNoICAgICAgfCAyICstCiAuLi4vZ3Rr
LWRvYy97Z3RrLWRvY18xLjM0LjAuYmIgPT4gZ3RrLWRvY18xLjM1LjEuYmJ9ICAgICAgICAgIHwg
MiArLQogNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2Mve2d0ay1kb2NfMS4zNC4wLmJiID0+IGd0
ay1kb2NfMS4zNS4xLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9n
dGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWVycm9yLW91dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91
bmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1l
cnJvci1vdXQtaWYteHNsdHByb2MtaXMtbm90LWZvdW5kLnBhdGNoCmluZGV4IGVlMWFjZGE0MDEu
LjA3ODJjNzRhMzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVz
LzAwMDEtRG8tbm90LWVycm9yLW91dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91bmQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtZXJyb3Itb3V0
LWlmLXhzbHRwcm9jLWlzLW5vdC1mb3VuZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTBk
M2I5ZDNjYTBlMWZmNDdjOGU3NTU5MzAzODU1NTMwZTU4ODM5YSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMTg4YWVhN2I5ZGI2NTRhNDg2MWQ2OWNkYmU5MzkwYWQ0ZDExZTM2NiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCA3IFNlcCAyMDE2IDE0OjUyOjA0ICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIERvIG5vdCBlcnJvciBvdXQgaWYgeHNsdHByb2MgaXMgbm90IGZvdW5kLgpA
QCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5k
ZXggODcyNTA3NC4uMDQ5MTA5MCAxMDA2NDQKK2luZGV4IGYyMzhkZTkuLjkwOTc3MWQgMTAwNjQ0
CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTM3LDcgKzM3LDcg
QEAgZG5sIENoZWNrIGZvciB4c2x0cHJvYwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtaGFyZG9jb2RlLXBhdGhzLXRvLXBlcmwtcHl0aG9u
LWluLXNjcmlwdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAx
LURvLW5vdC1oYXJkb2NvZGUtcGF0aHMtdG8tcGVybC1weXRob24taW4tc2NyaXB0cy5wYXRjaApp
bmRleCBmMzI5NTM5ZmE4Li5mODZkZDgzY2U4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25v
bWUvZ3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1oYXJkb2NvZGUtcGF0aHMtdG8tcGVybC1weXRo
b24taW4tc2NyaXB0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxl
cy8wMDAxLURvLW5vdC1oYXJkb2NvZGUtcGF0aHMtdG8tcGVybC1weXRob24taW4tc2NyaXB0cy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjQxNjM1NjVmOGQ2ODUzYjAyZTUzMzA4YTZlNmJh
MjNkOWQ5NjI5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzk2OTA3YzJmNmE4Y2E4
ZWI5NTkyYjI4ZTBkZTYzYTE4ZWJkOTZiZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAz
MSBBdWcgMjAxNiAxNjo0NDo0NiArMDMwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFyZG9j
b2RlIHBhdGhzIHRvIHBlcmwvcHl0aG9uIGluIHNjcmlwdHMuCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9jb25kaXRpb25hbHRlc3RzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvY29uZGl0aW9uYWx0ZXN0cy5wYXRjaAppbmRleCA1
NWNhZTM0YjQ2Li5mNTZhMTk4NjNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
LWRvYy9maWxlcy9jb25kaXRpb25hbHRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9ndGstZG9jL2ZpbGVzL2NvbmRpdGlvbmFsdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDlhYTkyMzBhMzA1ZTk2NGIyNDE3ZGFlYTJiNTFlNDNiMmRlZTYwN2MgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGQxNDBhOTliODEwMWJjNDJjYjQyNTE0MGQ5ZTUxYWU5ZDMzZmYy
ZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFR1ZSwgMjcgSnVuIDIwMTcgMjE6
MDA6NTggKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ3RrLWRvYzogSGFuZGxlIGZsb2F0aW5nIGd0
ay1kb2MgZGVwZW5kZW5jeQpAQCAtMTMsNyArMTMsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRp
bmcKICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29u
ZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAwNDkxMDkwLi40MjcwYzg4IDEwMDY0NAor
aW5kZXggOTA5NzcxZC4uOWRiOWZiYyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIv
Y29uZmlndXJlLmFjCiBAQCAtODIsNiArODIsMTEgQEAgaWYgdGVzdCAieCRHQ0MiID0gInh5ZXMi
OyB0aGVuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9uby1j
bG9iYmVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvbm8tY2xvYmJl
ci5wYXRjaAppbmRleCA5MDIwN2Q2YzEyLi5kYzI5YjAwY2E0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9uby1jbG9iYmVyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL25vLWNsb2JiZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGZhNWUzMWUwMmI5ZDNjNmM1ZWMzY2RjMWYzNGRkNmMxNzk1MjBmZDAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDEwYzNkODUzOTA4ZmJjOTJhNzEwZTllMmMxZDcwODQ0MzEx
YTA1ZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPgogRGF0ZTogV2VkLCAyMSBNYXIgMjAxOCAxNDo0NzoyOSArMDAwMAog
U3ViamVjdDogW1BBVENIXSBndGstZG9jOiBkb24ndCByZWdlbmVyYXRlIGd0ay1kb2MgaW4gZG9f
aW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvcGtn
LWNvbmZpZy1uYXRpdmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9w
a2ctY29uZmlnLW5hdGl2ZS5wYXRjaAppbmRleCAxYjVjMTkwZjU2Li5kMmY0YzA1ODU2IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9wa2ctY29uZmlnLW5hdGl2
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9wa2ctY29uZmln
LW5hdGl2ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzExZmJhOWJjYjhkNTU1NjgwNjdl
NjI2YmQ5NTk4NDFjMDUwODFlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTg4NDZl
YzAxNzUwM2E0NTBlNjIxNjc5N2ZjZDhmNGY5NTg5YWI2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBNb24s
IDUgU2VwIDIwMTYgMjI6MjU6NDQgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gVXNlIG5hdGl2ZSBw
a2ctY29uZmlnIHdoZW4gbG9va2luZyBmb3IgZ3RrLWRvYy4KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2NfMS4zNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21l
L2d0ay1kb2MvZ3RrLWRvY18xLjM1LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZ3RrLWRvY18xLjM0LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2NfMS4zNS4xLmJiCmluZGV4IDY5M2Fl
NDI3ZTAuLmM5YWI3ZmYxZTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9j
L2d0ay1kb2NfMS4zNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2d0ay1k
b2NfMS4zNS4xLmJiCkBAIC0yMSw3ICsyMSw3IEBAIFBBQ0tBR0VDT05GSUdbdGVzdHNdID0gIi0t
ZW5hYmxlLXRlc3RzLC0tZGlzYWJsZS10ZXN0cyxnbGliLTIuMCIKIAogQ0FDSEVEX0NPTkZJR1VS
RVZBUlMgKz0gImFjX2N2X3BhdGhfWFNMVFBST0M9eHNsdHByb2MiCiAKLVNSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gImIyMGI3MmIzMmE4MGJjMThjN2Y5NzVjOWQ0YzE2NDYwYzIyNzY1NjZh
MGI1MGY4N2Q2ODUyZGZmM2FhNzg2MWMiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI2
MTFjOWYyNGVkZDZkODhhOGFlOWE3OWQ3M2FiMGRjNjNjODliODFlOTBlY2MzMWQ2YjkwMDVjNWYw
NWIyNWUyIgogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtRG8tbm90LWhhcmRvY29kZS1wYXRocy10
by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
RG8tbm90LWVycm9yLW91dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91bmQucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vY29uZGl0aW9uYWx0ZXN0cy5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============2141509705275638740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dbg: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dbg: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dev: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dev: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-doc: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-doc: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-locale: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-locale: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-src: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-src: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-staticdev: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-staticdev: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc: PKGSIZE changed from 566546 to 566563 (+0%)
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc: SRC_URI changed from "https://download.gnome.org/sources//gtk-doc/1.34/gtk-doc-1.34.0.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch" to "https://download.gnome.org/sources//gtk-doc/1.35/gtk-doc-1.35.1.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch"
packages/x86-64-v3-poky-linux/gtk-doc: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc: PKGV changed from 1.34.0 [default] to 1.35.1 [default]

--===============2141509705275638740==--

