Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0861CA0ED8
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.88810.1754057271036723123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DR+gxq52;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tzzIfpJd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019865f5e544-19e40fb7-c9ec-4760-9b64-2cdd1369dfaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6CDZPV8iPHGqqysW5Tfdq1aNeoVIfFxxbShzEDnyzSU=;
	b=DR+gxq52ejnORB7RBpKffym7/9gwYfT+/rN5NxcTHYH91ea0X/A2sgrJ8hWGGdpC
	hcTwqEGglPK3IsTjJl6o4Qm8f4ibACcDafKf1rMGTa61ENQkD2217fz2kRLx5+a0hcH
	7ED7nknzU2vNXEt2mg73CaA6iIXl4pDRy5e4XMoU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6CDZPV8iPHGqqysW5Tfdq1aNeoVIfFxxbShzEDnyzSU=;
	b=tzzIfpJdizDHcjChOes5ZWtcMdM17qrUdD3/GUJArrDneLXP9Mb8y+0oHMHSpMFu
	XtxhLGgC+C3ymQ43x2W68NG346zddkaoS17zqBkQbxS7dWpHnU1KEJKmJfGIMBVRRO/
	73zzVRHknDaEQuSBt11xTUasgyK6KKpRK7Zoo7E8=
Content-Type: multipart/mixed; boundary="===============0669614522154228766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.8.3 SUCCEEDED
Message-ID: <0101019865f5e544-19e40fb7-c9ec-4760-9b64-2cdd1369dfaa-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221270

--===============0669614522154228766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.8.2-1.8.3.patch
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
From 49b403700d0997144c735256b54b2fcd01b004ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:11:21 +0000
Subject: [PATCH] meson: upgrade 1.8.2 -> 1.8.3

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch     | 4 ++--
 ...python-module-do-not-manipulate-the-environment-when.patch | 2 +-
 .../meson/0002-Support-building-allarch-recipes-again.patch   | 2 +-
 .../recipes-devtools/meson/{meson_1.8.2.bb => meson_1.8.3.bb} | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.8.2.bb => meson_1.8.3.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 98ca08c2ca..f9ed744ea2 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c01e5e29953e0302988f2d60adc50ebfa0e5d670 Mon Sep 17 00:00:00 2001
+From 9a91c9d2eb8e25396be68cbb6ea1830402639609 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,7 +26,7 @@ index 43fad0c..27be871 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 2a9cf16..6b2bd6b 100644
+index c20390f..c8eabf0 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
 @@ -436,10 +436,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index f654447013..b67cd5dd4e 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 6c3734f533ee7ad493188c8fc17bb1c65b65f0bd Mon Sep 17 00:00:00 2001
+From 5a871ed48aee8f943df4eca2731a9498b6de8157 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ed35498c30..8265be459b 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From e123195e5990c3071385defd96dfab1211e98c08 Mon Sep 17 00:00:00 2001
+From dd797af634508edce05697e1d90b0bc6962d5a19 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.8.2.bb b/meta/recipes-devtools/meson/meson_1.8.3.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.8.2.bb
rename to meta/recipes-devtools/meson/meson_1.8.3.bb
index bfeaab0a79..e306471244 100644
--- a/meta/recipes-devtools/meson/meson_1.8.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af"
+SRC_URI[sha256sum] = "f118aa910fc0a137cc2dd0122232dbf82153d9a12fb5b0f5bb64896f6a157abf"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============0669614522154228766==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.8.2-1.8.3.patch"

RnJvbSA0OWI0MDM3MDBkMDk5NzE0NGM3MzUyNTZiNTRiMmZjZDAxYjAwNGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOToxMToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuOC4yIC0+IDEuOC4zCgotLS0KIC4uLi9tZXNvbi9tZXNvbi8wMDAxLU1h
a2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCAgICAgfCA0ICsrLS0KIC4uLnB5dGhv
bi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2ggfCAy
ICstCiAuLi4vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fp
bi5wYXRjaCAgIHwgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29uXzEuOC4y
LmJiID0+IG1lc29uXzEuOC4zLmJifSB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNv
bi97bWVzb25fMS44LjIuYmIgPT4gbWVzb25fMS44LjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdh
cm5pbmdzLWZhdGFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAw
MDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCmluZGV4IDk4Y2EwOGMyY2Eu
LmY5ZWQ3NDRlYTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNv
bi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3Mt
ZmF0YWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMwMWU1ZTI5OTUzZTAzMDI5ODhmMmQ2
MGFkYzUwZWJmYTBlNWQ2NzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlhOTFjOWQy
ZWI4ZTI1Mzk2YmU2OGNiYjZlYTE4MzA0MDI2Mzk2MDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAz
IEp1bCAyMDE4IDEzOjU5OjA5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgQ1BVIGZhbWls
eSB3YXJuaW5ncyBmYXRhbApAQCAtMjYsNyArMjYsNyBAQCBpbmRleCA0M2ZhZDBjLi4yN2JlODcx
IDEwMDY0NAogICAgICAgICAgZW5kaWFuID0gbGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlm
IGVuZGlhbiBub3QgaW4gKCdsaXR0bGUnLCAnYmlnJyk6CiBkaWZmIC0tZ2l0IGEvbWVzb25idWls
ZC9lbnZpcm9ubWVudC5weSBiL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkKLWluZGV4IDJhOWNm
MTYuLjZiMmJkNmIgMTAwNjQ0CitpbmRleCBjMjAzOTBmLi5jOGVhYmYwIDEwMDY0NAogLS0tIGEv
bWVzb25idWlsZC9lbnZpcm9ubWVudC5weQogKysrIGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5w
eQogQEAgLTQzNiwxMCArNDM2LDggQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczog
Q29tcGlsZXJzRGljdCkgLT4gc3RyOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52
aXJvbm1lbnQtd2hlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8w
MDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4u
cGF0Y2gKaW5kZXggZjY1NDQ0NzAxMy4uYjY3Y2Q1ZGQ0ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1
bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1l
bnZpcm9ubWVudC13aGVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YzM3MzRmNTMzZWU3
YWQ0OTMxODhjOGZjMTdiYjFjNjViNjVmMGJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA1YTg3MWVkNDhhZWU4Zjk0M2RmNGVjYTI3MzFhOTQ5OGI2ZGU4MTU3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBNb24sIDE5IE5vdiAyMDE4IDE0OjI0OjI2ICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHB5dGhvbiBtb2R1bGU6IGRvIG5vdCBtYW5pcHVsYXRlIHRoZSBlbnZpcm9ubWVudCB3aGVu
IGNhbGxpbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8w
MDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNo
LXJlY2lwZXMtYWdhaW4ucGF0Y2gKaW5kZXggZWQzNTQ5OGMzMC4uODI2NWJlNDU5YiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWls
ZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdh
aW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUxMjMxOTVlNTk5MGMzMDcxMzg1ZGVmZDk2
ZGZhYjEyMTFlOThjMDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRkNzk3YWY2MzQ1
MDhlZGNlMDU2OTdlMWQ5MGIwYmM2OTYyZDVhMTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBQZXRlciBLamVsbGVyc3RlZHQgPHBrakBheGlzLmNvbT4KIERhdGU6IFRodSwgMjYgSnVs
IDIwMTggMTY6MzI6NDkgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gU3VwcG9ydCBidWlsZGluZyBh
bGxhcmNoIHJlY2lwZXMgYWdhaW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi9tZXNvbl8xLjguMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8x
LjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbWVzb24vbWVzb25fMS44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbl8xLjguMy5iYgppbmRleCBiZmVhYWIwYTc5Li5lMzA2NDcxMjQ0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS44LjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuOC4zLmJiCkBAIC0xNSw3ICsxNSw3
IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21lc29uLSR7
UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJu
aW5ncy1mYXRhbC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBvcnQtYnVpbGRp
bmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImMxMDU4MTZkODE1OGM3NmI3MmFkY2I5ZmY2MDI5NzcxOTA5NmRhN2QwN2Y2
YjFmMDAwZmQ4YzAxM2NkMzg3YWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjExOGFhOTEwZmMw
YTEzN2NjMmRkMDEyMjIzMmRiZjgyMTUzZDlhMTJmYjViMGY1YmI2NDg5NmY2YTE1N2FiZiIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKIGluaGVyaXQg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKLS0gCjIuNDcuMQoK

--===============0669614522154228766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.8.2/meson-1.8.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.8.3/meson-1.8.3.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 8748389 to 8758687 (+0%)
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info

--===============0669614522154228766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info

--===============0669614522154228766==--

