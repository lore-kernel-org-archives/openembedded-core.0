Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD196D5C0CF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17178.1765872128910473755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nnp34qKK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KaIouSp1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262ebf4f-62f95943-594f-4f72-b29b-27edf4f21d89-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hp1VFQ/nUdxyEtA/C+mryoME7PgQTdJdwoMRfGNlbuc=;
	b=nnp34qKKfILTPVtnR6C2HGsccgsQqNBtj3qAP+g3t3sxDkdvYzpT6qvO/458frr3
	aIko2zXeIR2wKrnMIhUjx0D5J7dy+FAyQA23w9gyLbE6fyvqC+3D6iNL0XfLO0xmJM+
	Wk4byUGYR1K8cTEqkVYGg+Ai/mBivIp/tnobkW8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hp1VFQ/nUdxyEtA/C+mryoME7PgQTdJdwoMRfGNlbuc=;
	b=KaIouSp11Noq5g5XA3WBDa/TtYbY1VveFTpLSqhscJhjmPvjwQTFHkoYq6yQSBsD
	RxVDKMBUL/fUTI+waS/STGfbfm7DqKqqgbE6q/2gIQtEFGmA5ImmDVbk5S7tNY4GX4P
	kVaXjtfk++eArriQ6v1Dny2761kU0pLOD1ZPB0h8=
Content-Type: multipart/mixed; boundary="===============7899002994433448995=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gtk-doc: upgrading to 1.35.1 SUCCEEDED
Message-ID: <0101019b262ebf4f-62f95943-594f-4f72-b29b-27edf4f21d89-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227856

--===============7899002994433448995==
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
From 601cdb24d356c3be251c148031d726076cb2a94d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 03:53:47 +0000
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
index ee1acda401..575ca5d32f 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
@@ -1,4 +1,4 @@
-From 50d3b9d3ca0e1ff47c8e7559303855530e58839a Mon Sep 17 00:00:00 2001
+From 5d64ab3a7c18904231d611b1262d1289b7282930 Mon Sep 17 00:00:00 2001
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
index f329539fa8..600ea40f3d 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 64163565f8d6853b02e53308a6e6ba23d9d96299 Mon Sep 17 00:00:00 2001
+From 98fc3c6e6ac36a2351ee7ff260bf74a7866c8483 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
index 55cae34b46..81017f61ce 100644
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
@@ -1,4 +1,4 @@
-From 9aa9230a305e964b2417daea2b51e43b2dee607c Mon Sep 17 00:00:00 2001
+From e4d003318a87ff895b1fcdad1ba4ca3f4f730cf9 Mon Sep 17 00:00:00 2001
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
index 90207d6c12..a75c2bceb7 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From fa5e31e02b9d3c6c5ec3cdc1f34dd6c179520fd0 Mon Sep 17 00:00:00 2001
+From bcf24419dc1965086793b4ff66a2f9b06574f974 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 1b5c190f56..b1c6c25dc4 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From c11fba9bcb8d55568067e626bd959841c05081e5 Mon Sep 17 00:00:00 2001
+From 24ddd2afb4fcdb8b7c88af5caec0c18ec9e7ff4e Mon Sep 17 00:00:00 2001
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


--===============7899002994433448995==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk-doc-upgrade-1.34.0-1.35.1.patch"

RnJvbSA2MDFjZGIyNGQzNTZjM2JlMjUxYzE0ODAzMWQ3MjYwNzZjYjJhOTRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDM6NTM6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGstZG9jOiB1cGdyYWRlIDEuMzQuMCAtPiAxLjM1LjEKCi0tLQogLi4uLzAwMDEtRG8tbm90LWVy
cm9yLW91dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91bmQucGF0Y2ggICAgICB8IDQgKystLQogLi4u
MDAxLURvLW5vdC1oYXJkb2NvZGUtcGF0aHMtdG8tcGVybC1weXRob24taW4tc2NyaXB0cy5wYXRj
aCB8IDIgKy0KIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL2NvbmRpdGlvbmFsdGVz
dHMucGF0Y2ggICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVz
L25vLWNsb2JiZXIucGF0Y2ggICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZ25vbWUv
Z3RrLWRvYy9maWxlcy9wa2ctY29uZmlnLW5hdGl2ZS5wYXRjaCAgICAgIHwgMiArLQogLi4uL2d0
ay1kb2Mve2d0ay1kb2NfMS4zNC4wLmJiID0+IGd0ay1kb2NfMS4zNS4xLmJifSAgICAgICAgICB8
IDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL3tndGstZG9jXzEuMzQuMC5iYiA9PiBn
dGstZG9jXzEuMzUuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
Z3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1lcnJvci1vdXQtaWYteHNsdHByb2MtaXMtbm90LWZv
dW5kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3Qt
ZXJyb3Itb3V0LWlmLXhzbHRwcm9jLWlzLW5vdC1mb3VuZC5wYXRjaAppbmRleCBlZTFhY2RhNDAx
Li41NzVjYTVkMzJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxl
cy8wMDAxLURvLW5vdC1lcnJvci1vdXQtaWYteHNsdHByb2MtaXMtbm90LWZvdW5kLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWVycm9yLW91
dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91bmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUw
ZDNiOWQzY2EwZTFmZjQ3YzhlNzU1OTMwMzg1NTUzMGU1ODgzOWEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDVkNjRhYjNhN2MxODkwNDIzMWQ2MTFiMTI2MmQxMjg5YjcyODI5MzAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgNyBTZXAgMjAxNiAxNDo1MjowNCArMDMwMAogU3Vi
amVjdDogW1BBVENIXSBEbyBub3QgZXJyb3Igb3V0IGlmIHhzbHRwcm9jIGlzIG5vdCBmb3VuZC4K
QEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWlu
ZGV4IDg3MjUwNzQuLjA0OTEwOTAgMTAwNjQ0CitpbmRleCBmMjM4ZGU5Li45MDk3NzFkIDEwMDY0
NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNyw3ICszNyw3
IEBAIGRubCBDaGVjayBmb3IgeHNsdHByb2MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9t
ZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWhhcmRvY29kZS1wYXRocy10by1wZXJsLXB5dGhv
bi1pbi1zY3JpcHRzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAw
MS1Eby1ub3QtaGFyZG9jb2RlLXBhdGhzLXRvLXBlcmwtcHl0aG9uLWluLXNjcmlwdHMucGF0Y2gK
aW5kZXggZjMyOTUzOWZhOC4uNjAwZWE0MGYzZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdu
b21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtaGFyZG9jb2RlLXBhdGhzLXRvLXBlcmwtcHl0
aG9uLWluLXNjcmlwdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmls
ZXMvMDAwMS1Eby1ub3QtaGFyZG9jb2RlLXBhdGhzLXRvLXBlcmwtcHl0aG9uLWluLXNjcmlwdHMu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY0MTYzNTY1ZjhkNjg1M2IwMmU1MzMwOGE2ZTZi
YTIzZDlkOTYyOTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk4ZmMzYzZlNmFjMzZh
MjM1MWVlN2ZmMjYwYmY3NGE3ODY2Yzg0ODMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwg
MzEgQXVnIDIwMTYgMTY6NDQ6NDYgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGhhcmRv
Y29kZSBwYXRocyB0byBwZXJsL3B5dGhvbiBpbiBzY3JpcHRzLgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvY29uZGl0aW9uYWx0ZXN0cy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL2NvbmRpdGlvbmFsdGVzdHMucGF0Y2gKaW5kZXgg
NTVjYWUzNGI0Ni4uODEwMTdmNjFjZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0
ay1kb2MvZmlsZXMvY29uZGl0aW9uYWx0ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25v
bWUvZ3RrLWRvYy9maWxlcy9jb25kaXRpb25hbHRlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA5YWE5MjMwYTMwNWU5NjRiMjQxN2RhZWEyYjUxZTQzYjJkZWU2MDdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBlNGQwMDMzMThhODdmZjg5NWIxZmNkYWQxYmE0Y2EzZjRmNzMw
Y2Y5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDI3IEp1biAyMDE3IDIx
OjAwOjU4ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGd0ay1kb2M6IEhhbmRsZSBmbG9hdGluZyBn
dGstZG9jIGRlcGVuZGVuY3kKQEAgLTEzLDcgKzEzLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5k
aW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMDQ5MTA5MC4uNDI3MGM4OCAxMDA2NDQK
K2luZGV4IDkwOTc3MWQuLjlkYjlmYmMgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBi
L2NvbmZpZ3VyZS5hYwogQEAgLTgyLDYgKzgyLDExIEBAIGlmIHRlc3QgIngkR0NDIiA9ICJ4eWVz
IjsgdGhlbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvbm8t
Y2xvYmJlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL25vLWNsb2Ji
ZXIucGF0Y2gKaW5kZXggOTAyMDdkNmMxMi4uYTc1YzJiY2ViNyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvbm8tY2xvYmJlci5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9uby1jbG9iYmVyLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBmYTVlMzFlMDJiOWQzYzZjNWVjM2NkYzFmMzRkZDZjMTc5NTIwZmQwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiY2YyNDQxOWRjMTk2NTA4Njc5M2I0ZmY2NmEyZjliMDY1
NzRmOTc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3Mu
YnVydG9uQGludGVsLmNvbT4KIERhdGU6IFdlZCwgMjEgTWFyIDIwMTggMTQ6NDc6MjkgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gZ3RrLWRvYzogZG9uJ3QgcmVnZW5lcmF0ZSBndGstZG9jIGluIGRv
X2luc3RhbGwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL3Br
Zy1jb25maWctbmF0aXZlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMv
cGtnLWNvbmZpZy1uYXRpdmUucGF0Y2gKaW5kZXggMWI1YzE5MGY1Ni4uYjFjNmMyNWRjNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvcGtnLWNvbmZpZy1uYXRp
dmUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvcGtnLWNvbmZp
Zy1uYXRpdmUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMxMWZiYTliY2I4ZDU1NTY4MDY3
ZTYyNmJkOTU5ODQxYzA1MDgxZTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI0ZGRk
MmFmYjRmY2RiOGI3Yzg4YWY1Y2FlYzBjMThlYzllN2ZmNGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogTW9u
LCA1IFNlcCAyMDE2IDIyOjI1OjQ0ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSBuYXRpdmUg
cGtnLWNvbmZpZyB3aGVuIGxvb2tpbmcgZm9yIGd0ay1kb2MuCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ3RrLWRvYy9ndGstZG9jXzEuMzQuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9ndGstZG9jL2d0ay1kb2NfMS4zNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2NfMS4zNC4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9ndGstZG9jXzEuMzUuMS5iYgppbmRleCA2OTNh
ZTQyN2UwLi5jOWFiN2ZmMWU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRv
Yy9ndGstZG9jXzEuMzQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9ndGst
ZG9jXzEuMzUuMS5iYgpAQCAtMjEsNyArMjEsNyBAQCBQQUNLQUdFQ09ORklHW3Rlc3RzXSA9ICIt
LWVuYWJsZS10ZXN0cywtLWRpc2FibGUtdGVzdHMsZ2xpYi0yLjAiCiAKIENBQ0hFRF9DT05GSUdV
UkVWQVJTICs9ICJhY19jdl9wYXRoX1hTTFRQUk9DPXhzbHRwcm9jIgogCi1TUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICJiMjBiNzJiMzJhODBiYzE4YzdmOTc1YzlkNGMxNjQ2MGMyMjc2NTY2
YTBiNTBmODdkNjg1MmRmZjNhYTc4NjFjIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
NjExYzlmMjRlZGQ2ZDg4YThhZTlhNzlkNzNhYjBkYzYzYzg5YjgxZTkwZWNjMzFkNmI5MDA1YzVm
MDViMjVlMiIKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLURvLW5vdC1oYXJkb2NvZGUtcGF0aHMt
dG8tcGVybC1weXRob24taW4tc2NyaXB0cy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LURvLW5vdC1lcnJvci1vdXQtaWYteHNsdHByb2MtaXMtbm90LWZvdW5kLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovL2NvbmRpdGlvbmFsdGVzdHMucGF0Y2ggXAotLSAKMi40Ny4xCgo=

--===============7899002994433448995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)
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
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc: PKGV changed from 1.34.0 [default] to 1.35.1 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc: PKGSIZE changed from 566546 to 566563 (+0%)
packages/x86-64-v3-poky-linux/gtk-doc: PV changed from "1.34.0" to "1.35.1"
packages/x86-64-v3-poky-linux/gtk-doc: SRC_URI changed from "https://download.gnome.org/sources//gtk-doc/1.34/gtk-doc-1.34.0.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch" to "https://download.gnome.org/sources//gtk-doc/1.35/gtk-doc-1.35.1.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch"
packages/x86-64-v3-poky-linux/gtk-doc: PKGV changed from 1.34.0 [default] to 1.35.1 [default]

--===============7899002994433448995==--

