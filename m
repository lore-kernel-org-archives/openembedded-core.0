Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C484C5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7568.1786689404461381796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GBIu1Dls;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZWaWthfX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ffefcb8bd-bb5bfb0c-9e7a-4427-8f17-022fc1f00ac4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iqQrJ5T0iO+v3knsUBmYSkmo9wrax7q+ess/fHnwWi8=;
	b=GBIu1DlsKSRLDH3pL15ydxN4zwXnsuDqK2/t9ZVFZKle3juQhIWjPVXvdaqnVzyX
	XTHFKAfc6Hx3OA3xs8CmEDQwwlge1eq2wPVSyRc52rngeH9scNVekgDx5SRIishDgKF
	8ABU56A8UdVKqymjCNc5fmOjjDy1QH2oSOYd4sZM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iqQrJ5T0iO+v3knsUBmYSkmo9wrax7q+ess/fHnwWi8=;
	b=ZWaWthfXcn3cHkgSzasb5QaNvjaVHSR2kqfCoWyFjLKoqW9Rg/SdsUuJLdpCQ23x
	IsIV7Aq/vLaarO0vKYw5I6EpxTVHrzSHLVssuAX0/07FRVmyGKijsp/bRR6k7mvoceU
	nvTBo5l46qESK+LR5U7ZWDzSx7CAGO63rqSHbnH8=
Content-Type: multipart/mixed; boundary="===============2039255318235369277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.165.6 FAILED
Message-ID: <0101019ffefcb8bd-bb5bfb0c-9e7a-4427-8f17-022fc1f00ac4-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243413

--===============2039255318235369277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.165.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.165.2-6.165.6.patch
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
From 42171afecfc37b4daca4ca5842356bd3cedad604 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 14 Aug 2026 05:25:05 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.165.2 -> 6.165.6

---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...165.2.bb => python3-hypothesis_6.165.6.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.2.bb => python3-hypothesis_6.165.6.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
index efce454843..080e6ed7f4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,11 +12,11 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/pyo3/0.29.2 \
+    crate://crates.io/pyo3-build-config/0.29.2 \
+    crate://crates.io/pyo3-ffi/0.29.2 \
+    crate://crates.io/pyo3-macros/0.29.2 \
+    crate://crates.io/pyo3-macros-backend/0.29.2 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
@@ -41,11 +41,11 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[pyo3-0.29.2.sha256sum] = "4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b"
+SRC_URI[pyo3-build-config-0.29.2.sha256sum] = "f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9"
+SRC_URI[pyo3-ffi-0.29.2.sha256sum] = "e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327"
+SRC_URI[pyo3-macros-0.29.2.sha256sum] = "73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c"
+SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] = "571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.165.6.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.165.6.bb
index 0776519a10..2de6a9c069 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.165.6.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "680a1adf523ac792b46064f425b112ce6c08a7a8f50e65d08e029de6aa11df95"
+SRC_URI[sha256sum] = "35d6e462a7827fbce9e833efc48921d7879391dd1f742431da48ba71bafe2a59"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============2039255318235369277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.165.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.165.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.165.6.dist-info

--===============2039255318235369277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.165.2-6.165.6.patch"

RnJvbSA0MjE3MWFmZWNmYzM3YjRkYWNhNGNhNTg0MjM1NmJkM2NlZGFkNjA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTQgQXVnIDIwMjYgMDU6MjU6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjUuMiAtPiA2LjE2NS42CgotLS0KIC4uLi9w
eXRob24vcHl0aG9uMy1oeXBvdGhlc2lzLWNyYXRlcy5pbmMgICAgICB8IDIwICsrKysrKysrKy0t
LS0tLS0tLS0KIC4uLjE2NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2NS42LmJifSB8
ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2NS42LmJifSAoOTIlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3Ro
ZXNpcy1jcmF0ZXMuaW5jCmluZGV4IGVmY2U0NTQ4NDMuLjA4MGU2ZWQ3ZjQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzLWNyYXRlcy5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXMt
Y3JhdGVzLmluYwpAQCAtMTIsMTEgKzEyLDExIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHB2LWxpdGU4Ni8wLjIuMjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8y
LzEuMC4xMDYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yOS4wIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI5LjAgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3B5bzMtZmZpLzAuMjkuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNy
b3MvMC4yOS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAu
MjkuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjI5LjIgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjkuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHlvMy1mZmkvMC4yOS4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8w
LjI5LjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yOS4y
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuNDYgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3ItZWZpLzUuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYW5kLzAuOS40IFwK
QEAgLTQxLDExICs0MSwxMSBAQCBTUkNfVVJJW29uY2VfY2VsbC0xLjIxLjQuc2hhMjU2c3VtXSA9
ICI5ZjdjM2U0YmViMzNmODVkNDVhZTNlM2ExNzkyMTg1NzA2YzhlMTZkMAogU1JDX1VSSVtwb3J0
YWJsZS1hdG9taWMtMS4xMy4xLnNoYTI1NnN1bV0gPSAiYzMzYTk0NzE4OTZmMWM2OWNlY2VmOGQy
MGNiZTJmN2FjY2QxMjUyN2NlNjA4NDVmZjQ0YzE1M2JiMmEyMWI0OSIKIFNSQ19VUklbcHB2LWxp
dGU4Ni0wLjIuMjEuc2hhMjU2c3VtXSA9ICI4NWVhZTNjNGVkMmY1MGRjZmU3MjY0M2RhNGJlZmMz
MGRlYWRiNDU4YTliNTkwZDcyMGNkZTJmMmIxZTk3ZGE5IgogU1JDX1VSSVtwcm9jLW1hY3JvMi0x
LjAuMTA2LnNoYTI1NnN1bV0gPSAiOGZkMDBmMGJiMmU5MGQ4MWQxMDQ0YzJiMzI2MTdmNjhmY2I5
ZmEzYmI3NjQwYzIzZTljNzQ4ZTUzZmIzMDkzNCIKLVNSQ19VUklbcHlvMy0wLjI5LjAuc2hhMjU2
c3VtXSA9ICJjZDI3NDY1MGIyMWQ0YmZjMjZhMGE0NzU4Nzk2MmMxZWRiNDI1ZjY5Mjg3MzI0MzU1
Y2QwNDBjM2VhNjYwNzFjIgotU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjI5LjAuc2hhMjU2
c3VtXSA9ICJjNWUyYTdkMmYwZDAxMzM0MmYyOTVjMDQ4YWQxOTIzN2FkZDUxNTRhNTViMWM1YTI1
NGMwZWM5M2Q0MTA5MDc4IgotU1JDX1VSSVtweW8zLWZmaS0wLjI5LjAuc2hhMjU2c3VtXSA9ICJj
YTg1YzQ2N2RhMWJiYzhkODY2ZWVhNWRlZmY5Y2YyOWVhNWY3Nzg1MDU0YTE3ZGEzNmU2NWJkYTlj
MDU4NDViIgotU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjI5LjAuc2hhMjU2c3VtXSA9ICI5YWM1Mzc2
MmZkMDY1ZGFhMzE5NGRkMDkzMzdhMzhiZDc5M2ExODgxMDBmZDFhOTMwNGM0YWIzMTJkOTAxNzcx
IgotU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjkuMC5zaGEyNTZzdW1dID0gIjRjYTNh
MTU1NzM5OTc4MzE3MmRjNWJmMzljZmNhODM1MTU3NzMyNTMyY2JhNTZiNzFkMjI5MjE2MWU1M2Iz
NjIiCitTUkNfVVJJW3B5bzMtMC4yOS4yLnNoYTI1NnN1bV0gPSAiNDY4OGRkZWRmNDczZTMyNjYy
YjliMDY3NjcwMTI5YThhZmI4YzE4ZTM1MTQ4MmM3MGQ2MmJhNGE4ODE3MWU4YiIKK1NSQ19VUklb
cHlvMy1idWlsZC1jb25maWctMC4yOS4yLnNoYTI1NnN1bV0gPSAiZjQxMDI3ZTQxYjRiZDAzZjZl
NjBmOWY0MTdmZTI0YTYzNDFhNmJiNzQ0ZWRkNjJiNmY3MDlmMmE1MmVhMzBlOSIKK1NSQ19VUklb
cHlvMy1mZmktMC4yOS4yLnNoYTI1NnN1bV0gPSAiZTU5MWE5NTUyNmZlYWQwNjc0MzJjM2IzYTMz
ZmM3NDc3MGI4N2IxZTA0ZTczNjcxMDkwZDljMjA1NWEyYjMyNyIKK1NSQ19VUklbcHlvMy1tYWNy
b3MtMC4yOS4yLnNoYTI1NnN1bV0gPSAiNzMyMjU4NjhmYzFjZDg0ZWVmMmMzYzIzMGRkYjkxMjcz
YmYxZGU0NmFlYjhhNDI0OGRhNzZkMzJhMDkyNGExYyIKK1NSQ19VUklbcHlvMy1tYWNyb3MtYmFj
a2VuZC0wLjI5LjIuc2hhMjU2c3VtXSA9ICI1NzE1NzVhYTM3NDlmYTYyMTY3NTdkZDQ3ZDJhM2U3
ZWYzNjBmMzI5YTQwZjA2NjZhOWZiZDE0ODg5MDI0OTUyIgogU1JDX1VSSVtxdW90ZS0xLjAuNDYu
c2hhMjU2c3VtXSA9ICJkZmJjNDU3ZDBjN2EwNzU5YTYxNDU1MWIxMWE2NDA5ZTU5NTFmNmM3NTM3
YmUxZjFiNzY4MmI5YWU5MjMwMzY4IgogU1JDX1VSSVtyLWVmaS01LjMuMC5zaGEyNTZzdW1dID0g
IjY5Y2RiMzRjMTU4Y2ViMjg4ZGYxMWUxOGI0YmQzOWRlOTk0ZjY2NTdkODM4NDdiZGZmZGJkN2Yz
NDY3NTRiMGYiCiBTUkNfVVJJW3JhbmQtMC45LjQuc2hhMjU2c3VtXSA9ICI0NGM1YWYwNmJiMWI3
ZDMyMTZkOTE5MzJhZWQ1MjY1MTY0YmYzODRkYzg5Y2Q2YmEwNWNmNTlhMzVmNWY3NmVhIgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNf
Ni4xNjUuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhl
c2lzXzYuMTY1LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjUuMi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjUu
Ni5iYgppbmRleCAwNzc2NTE5YTEwLi4yZGU2YTljMDY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2NS4yLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY1LjYuYmIK
QEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkg
XAogICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4MGExYWRmNTIzYWM3OTJiNDYwNjRm
NDI1YjExMmNlNmMwOGE3YThmNTBlNjVkMDhlMDI5ZGU2YWExMWRmOTUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMzVkNmU0NjJhNzgyN2ZiY2U5ZTgzM2VmYzQ4OTIxZDc4NzkzOTFkZDFmNzQyNDMx
ZGE0OGJhNzFiYWZlMmE1OSIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1h
dHRycyBcCi0tIAoyLjQ3LjEKCg==

--===============2039255318235369277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.165.2.tar.gz;downloadfilename=hypothesis-6.165.2.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.0 crate://crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 cra
 te://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.165.6.tar.gz;downloadfilename=hypothesis-6.165.6.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crat
 es.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGSIZE changed from 109240 to 109344 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.165.2" to "6.165.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4521298 to 4528764 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.165.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.165.6.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.165.2 [default] to 6.165.6 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.165.6.dist-info

--===============2039255318235369277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4dfbc4fbb5d36332e1161fb27643951df1e1400f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:4dfbc4fbb5d36332e1161fb27643951df1e1400f"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 818 Local 585 Mirrors 0 Missed 233 Current 202 (71% match, 77% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 209 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 292 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 301 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 308 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 372 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 374 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.165.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 376 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 378 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-20260601-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 384 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 385 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 396 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 398 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 399 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 401 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.165.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 405 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 406 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 415 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 420 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 424 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 426 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 427 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 431 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 435 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 436 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 441 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 443 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 445 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 446 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 450 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 451 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 452 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 453 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 455 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 456 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 458 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 459 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 461 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 463 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 467 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 469 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 477 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 482 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 486 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 492 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 493 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 504 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 506 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 508 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 518 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 520 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 535 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 536 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 541 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 544 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 545 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 546 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 549 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 551 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 558 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 564 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 565 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 567 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 570 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 571 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 581 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 583 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 584 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 586 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 587 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 591 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 593 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 594 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 600 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 605 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 607 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 608 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 610 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe clang-cross-arm-git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 613 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 614 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 618 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-native-22.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 620 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 621 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe clang-cross-arm-git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 626 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 631 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 633 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 634 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe clang-cross-arm-git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 636 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 638 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 641 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-cross-arm-git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-native-22.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 645 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 646 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 658 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 659 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 663 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-native-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 665 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 667 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 689 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 692 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 694 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 697 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 699 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 701 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 706 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 707 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 710 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 717 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 719 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 720 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-native-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 723 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 728 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 734 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 737 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 742 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-native-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 747 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 753 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 760 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 761 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 764 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-native-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 770 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 775 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 779 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 784 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 797 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 801 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 807 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 819 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 838 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 846 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 856 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 872 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 877 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 884 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cmake-native-4.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 889 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 897 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 898 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 901 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 902 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ninja-native-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 904 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 905 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 906 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 914 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 919 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 921 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ninja-native-1.13.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 927 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-cross-arm-2.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 931 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 945 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ninja-native-1.13.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 954 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running task 434 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_recipe_qa_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 959 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 960 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 555 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: Running task 557 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_fetch)
NOTE: Running task 573 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 589 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 963 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 596 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: Running task 608 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 635 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 641 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 965 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 671 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: Running task 677 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 690 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.96.1.bb:do_fetch)
NOTE: recipe expat-2.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 691 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_unpack)
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe expat-2.8.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 969 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 971 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 692 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: Running task 693 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 694 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: Running setscene task 974 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.3-r0: task do_patch: Started
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 977 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 697 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 980 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 698 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 981 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 740 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: Running task 746 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Started
WARNING: bzip2-1.0.8-r0 do_fetch: Failed to fetch URL git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master;protocol=https;destsuffix=bzip2-tests/, attempting MIRRORS if available
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 757 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_generate_toolchain_file)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-native-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 993 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 994 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 996 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_deploy_source_date_epoch unihash changed to cc69b7c328a5c2452f37dae59311b9faa87842113cf966cca48f002e847354c3
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-native-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-native-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 946 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 970 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 983 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 986 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 789 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 790 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_unpack)
NOTE: Running task 791 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_fetch: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-native-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Started
NOTE: recipe meson-native-1.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-native-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 857 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 875 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 887 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: Running task 889 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe meson-native-1.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-native-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 898 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: Running task 901 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 903 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: Running setscene task 1017 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Started
WARNING: gmp-6.3.0-r0 do_fetch: Failed to fetch URL https://gmplib.org/download/gmp/gmp-6.3.0.tar.bz2, attempting MIRRORS if available
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe re2c-native-4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 904 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 910 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe re2c-native-4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 1020 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 911 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: Running task 912 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe re2c-native-4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe re2c-native-4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1039 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1051 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1052 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1053 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_patch)
NOTE: Running task 1054 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: Running task 1055 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_configure)
NOTE: Running task 1060 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: Running task 1062 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1063 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Started
NOTE: Running task 1067 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe expat-2.8.3-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1069 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1071 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1080 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1081 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1082 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1083 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch unihash changed to 27e6a83ce1d8edf8ff8153b0c37d7509763153032738ab6041155be4cc16d3b1
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
WARNING: acl-2.4.0-r0 do_fetch: Failed to fetch URL https://download.savannah.gnu.org/releases/acl/acl-2.4.0.tar.gz, attempting MIRRORS if available
NOTE: Setscene tasks completed
NOTE: Running task 1084 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_configure)
NOTE: Running task 1085 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: Running task 1086 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Failed
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Failed
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_configure: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_configure: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_configure: Succeeded
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1087 tasks of which 1031 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814052314.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814052314.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/bzip2/1.0.8/temp/log.do_fetch.3413604
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gmp/6.3.0/temp/log.do_fetch.3420408
Summary: There were 3 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: bzip2-1.0.8-r0 do_fetch: Fetcher failure: Fetch command ['git', '-c', 'gc.autoDetach=false', '-c', 'core.pager=cat', '-c', 'safe.bareRepository=all', '-c', 'clone.defaultRemoteName=origin', 'clone', '--bare', '--mirror', 'https://sourceware.org/git/bzip2-tests.git', '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/sourceware.org.git.bzip2-tests.git', '--progress'] failed with exit code 128, see logfile for output
ERROR: bzip2-1.0.8-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master;protocol=https;destsuffix=bzip2-tests/')
ERROR: gmp-6.3.0-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/gmp-6.3.0.tar.bz2.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://gmplib.org/download/gmp/gmp-6.3.0.tar.bz2', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: gmp-6.3.0-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://gmplib.org/download/gmp/gmp-6.3.0.tar.bz2')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/bzip2/1.0.8/temp/log.do_fetch.3413604
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gmp/6.3.0/temp/log.do_fetch.3420408
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch) failed with exit code '1'

--===============2039255318235369277==--

