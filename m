Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D619C3DA53
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.174019.1692224342104083955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eoqScLaA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bqIM+DEs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a006e4c05-da2931a6-526a-47b3-ae19-4501f75e4401-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cQ/Jyxy52iyJck1mMmaQ8LqChl9aGoO9sUbatNB+Hag=;
	b=eoqScLaAAs9sIDkzh4yEOXRbuhgoqc6X2LMrSoDjnkPxd8i009NOTPMpeAYdDBeY
	i8CoLwC95W7rLkA025im7oB+XHLw6789gH2PjO3wXKlhlH7oHf0+Nn11kqrW57kpfVY
	qXKDVTqGbaEVSIBc6BEVXSvMR41+509AmQM9tnUI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cQ/Jyxy52iyJck1mMmaQ8LqChl9aGoO9sUbatNB+Hag=;
	b=bqIM+DEsB3mSSFk/JyC0vEQx7Q8GLZ2/bfA+McXmWH480bpz6rgJDnc/oGKBlRkn
	anBnSHbzoClI/80R6IkeIefEKp8LUcIMIeZ0CxlbE3Qxasg7Nd9TQfwkOxN4/qqDi4b
	e3zdBoFeS3yegPXdo+WHSV48Z5SLFU6tJMSymjrU=
Content-Type: multipart/mixed; boundary="===============7322188560551548868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.16.2 SUCCEEDED
Message-ID: <0101018a006e4c05-da2931a6-526a-47b3-ae19-4501f75e4401-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186162

--===============7322188560551548868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.16.1-4.16.2.patch
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
From 89a1af6586145960cbae2c43ee164b89c30c9db1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 03:12:53 +0000
Subject: [PATCH] dnf: upgrade 4.16.1 -> 4.16.2

---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch      | 7 ++++---
 meta/recipes-devtools/dnf/{dnf_4.16.1.bb => dnf_4.16.2.bb} | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.16.1.bb => dnf_4.16.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 21b50dee01..ffad70e404 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 5e07c16a506b19cbb107d5e99fca41d679b23b9a Mon Sep 17 00:00:00 2001
+From 9523c8268cd079caddc4d59570a329fc7da75497 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
@@ -10,15 +10,16 @@ already existing, and base-files creating it as a symlink).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  dnf/logging.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/logging.py b/dnf/logging.py
-index bd660470..a9d808b1 100644
+index ef0b25f3..94610af6 100644
 --- a/dnf/logging.py
 +++ b/dnf/logging.py
-@@ -94,7 +94,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
+@@ -118,7 +118,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
      def __init__(self, filename, mode='a', maxBytes=0, backupCount=0, encoding=None, delay=False):
          super(MultiprocessRotatingFileHandler, self).__init__(
              filename, mode, maxBytes, backupCount, encoding, delay)
diff --git a/meta/recipes-devtools/dnf/dnf_4.16.1.bb b/meta/recipes-devtools/dnf/dnf_4.16.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.16.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.16.2.bb
index 9134411fa9..ba3f9b6e08 100644
--- a/meta/recipes-devtools/dnf/dnf_4.16.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.16.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "94b7cc7956580405b219329541d6b40db6499cf1"
+SRCREV = "cb1b3615632058f4a1ca79a38734b8624eca8a32"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============7322188560551548868==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.16.1-4.16.2.patch"

RnJvbSA4OWExYWY2NTg2MTQ1OTYwY2JhZTJjNDNlZTE2NGI4OWMzMGM5ZGIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDM6MTI6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xNi4xIC0+IDQuMTYuMgoKLS0tCiAuLi4vZG5mL2RuZi8wMDAxLWRuZi13
cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCAgICAgIHwgNyArKysrLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL3tkbmZfNC4xNi4xLmJiID0+IGRuZl80LjE2LjIuYmJ9IHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi97ZG5mXzQuMTYuMS5iYiA9PiBkbmZfNC4xNi4y
LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gK
aW5kZXggMjFiNTBkZWUwMS4uZmZhZDcwZTQwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxv
Zy1sb2NrLXRvLXJvb3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVlMDdjMTZhNTA2YjE5
Y2JiMTA3ZDVlOTlmY2E0MWQ2NzliMjNiOWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDk1MjNjODI2OGNkMDc5Y2FkZGM0ZDU5NTcwYTMyOWZjN2RhNzU0OTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFR1ZSwgMjggQXByIDIwMjAgMTU6NTU6MDAgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gZG5mOiB3cml0ZSB0aGUgbG9nIGxvY2sgdG8gcm9vdApAQCAtMTAsMTUgKzEwLDE2IEBAIGFs
cmVhZHkgZXhpc3RpbmcsIGFuZCBiYXNlLWZpbGVzIGNyZWF0aW5nIGl0IGFzIGEgc3ltbGluayku
CiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgor
CiAtLS0KICBkbmYvbG9nZ2luZy5weSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2RuZi9sb2dnaW5nLnB5IGIvZG5m
L2xvZ2dpbmcucHkKLWluZGV4IGJkNjYwNDcwLi5hOWQ4MDhiMSAxMDA2NDQKK2luZGV4IGVmMGIy
NWYzLi45NDYxMGFmNiAxMDA2NDQKIC0tLSBhL2RuZi9sb2dnaW5nLnB5CiArKysgYi9kbmYvbG9n
Z2luZy5weQotQEAgLTk0LDcgKzk0LDcgQEAgY2xhc3MgTXVsdGlwcm9jZXNzUm90YXRpbmdGaWxl
SGFuZGxlcihsb2dnaW5nLmhhbmRsZXJzLlJvdGF0aW5nRmlsZUhhbmRsZXIpOgorQEAgLTExOCw3
ICsxMTgsNyBAQCBjbGFzcyBNdWx0aXByb2Nlc3NSb3RhdGluZ0ZpbGVIYW5kbGVyKGxvZ2dpbmcu
aGFuZGxlcnMuUm90YXRpbmdGaWxlSGFuZGxlcik6CiAgICAgIGRlZiBfX2luaXRfXyhzZWxmLCBm
aWxlbmFtZSwgbW9kZT0nYScsIG1heEJ5dGVzPTAsIGJhY2t1cENvdW50PTAsIGVuY29kaW5nPU5v
bmUsIGRlbGF5PUZhbHNlKToKICAgICAgICAgIHN1cGVyKE11bHRpcHJvY2Vzc1JvdGF0aW5nRmls
ZUhhbmRsZXIsIHNlbGYpLl9faW5pdF9fKAogICAgICAgICAgICAgIGZpbGVuYW1lLCBtb2RlLCBt
YXhCeXRlcywgYmFja3VwQ291bnQsIGVuY29kaW5nLCBkZWxheSkKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTYuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mXzQuMTYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE2LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbmYvZG5mXzQuMTYuMi5iYgppbmRleCA5MTM0NDExZmE5Li5iYTNmOWI2ZTA4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE2LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNi4yLmJiCkBAIC0xOSw3ICsxOSw3
IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9k
bmYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2
ZSA9ICJmaWxlOi8vMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2giCiAK
LVNSQ1JFViA9ICI5NGI3Y2M3OTU2NTgwNDA1YjIxOTMyOTU0MWQ2YjQwZGI2NDk5Y2YxIgorU1JD
UkVWID0gImNiMWIzNjE1NjMyMDU4ZjRhMWNhNzlhMzg3MzRiODYyNGVjYThhMzIiCiBVUFNUUkVB
TV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCi0tIAoyLjM5LjIKCg==

--===============7322188560551548868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-test-dep: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-test-main: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-test-main: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 955034 to 955331 (+0%)
packages/core2-32-poky-linux/dnf: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.16.1" to "4.16.2"

--===============7322188560551548868==--

