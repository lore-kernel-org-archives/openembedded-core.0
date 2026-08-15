Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEA1C5CFC1
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 05:30:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3717.1786771835297392554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 22:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VehesGh1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YyZszL1Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a003e68746-337690bf-3a7d-4fcf-a4a5-7226afbb22ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786771834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8JQeeICF7FyP6QXHRKjELJ82G95lZKpZ/Uh5fpLGqvs=;
	b=VehesGh1X8OYgLykdmuovYLPp24yuFD6s2v50VgbAQvp9giGNlFtg5JYVlJuJSpz
	OuFQO5vYsqC8NJfprNqApXxX8g47M1PhztN/BbT4oZNIY2yyK3Wpc27SENGk6hMErib
	MYxEDi5X03AVaJoQLdelqel+NJa8VBZjPGoMZFFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786771834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8JQeeICF7FyP6QXHRKjELJ82G95lZKpZ/Uh5fpLGqvs=;
	b=YyZszL1Yn332paE+BJCPKzVgVoqTQnaAY+RFd6L34uDBUFxr8xOM1dyhqDbHSxc8
	lDIwhKsKsbwBattyPk1u/RIJahMMyXJraz8LsKGrJnNJACmkA6J7lQx8fTUr8LgXDrz
	toiCKKCu0wAd5rTuzhh8PMdFr/Bb+cGi+r5igMpo=
Content-Type: multipart/mixed; boundary="===============6905374886265960012=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.165.9 FAILED
Message-ID: <010101a003e68746-337690bf-3a7d-4fcf-a4a5-7226afbb22ef-000000@us-west-2.amazonses.com>
Date: Sat, 15 Aug 2026 05:30:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243471

--===============6905374886265960012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.165.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.165.2-6.165.9.patch
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
From b8aa7a83fd21399d6818ca7fbd9517e09ca98e90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Aug 2026 05:11:09 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.165.2 -> 6.165.9

---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...165.2.bb => python3-hypothesis_6.165.9.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.2.bb => python3-hypothesis_6.165.9.bb} (92%)

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
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
index 0776519a10..197989521e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "680a1adf523ac792b46064f425b112ce6c08a7a8f50e65d08e029de6aa11df95"
+SRC_URI[sha256sum] = "a5d1fa312020b499c517e1217ef4440c56a9b52e20b47b420b48a583a81c412b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============6905374886265960012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.165.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.165.9.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.165.9.dist-info

--===============6905374886265960012==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.165.2-6.165.9.patch"

RnJvbSBiOGFhN2E4M2ZkMjEzOTlkNjgxOGNhN2ZiZDk1MTdlMDljYTk4ZTkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXVnIDIwMjYgMDU6MTE6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjUuMiAtPiA2LjE2NS45CgotLS0KIC4uLi9w
eXRob24vcHl0aG9uMy1oeXBvdGhlc2lzLWNyYXRlcy5pbmMgICAgICB8IDIwICsrKysrKysrKy0t
LS0tLS0tLS0KIC4uLjE2NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2NS45LmJifSB8
ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2NS45LmJifSAoOTIlKQoKZGlm
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
c2lzXzYuMTY1LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjUuMi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjUu
OS5iYgppbmRleCAwNzc2NTE5YTEwLi4xOTc5ODk1MjFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2NS4yLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY1LjkuYmIK
QEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkg
XAogICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4MGExYWRmNTIzYWM3OTJiNDYwNjRm
NDI1YjExMmNlNmMwOGE3YThmNTBlNjVkMDhlMDI5ZGU2YWExMWRmOTUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYTVkMWZhMzEyMDIwYjQ5OWM1MTdlMTIxN2VmNDQ0MGM1NmE5YjUyZTIwYjQ3YjQy
MGI0OGE1ODNhODFjNDEyYiIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1h
dHRycyBcCi0tIAoyLjQ3LjEKCg==

--===============6905374886265960012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.165.2.tar.gz;downloadfilename=hypothesis-6.165.2.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.0 crate://crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 cra
 te://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.165.9.tar.gz;downloadfilename=hypothesis-6.165.9.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crat
 es.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGSIZE changed from 109240 to 109344 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.165.2" to "6.165.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4521298 to 4532943 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.165.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.165.9.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.165.2 [default] to 6.165.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.165.2" to "6.165.9"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.165.9.dist-info

--===============6905374886265960012==
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
DISTRO_VERSION       = "6.0.99+snapshot-dd003e147db548d9c86821a08450d6461d061cea"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:dd003e147db548d9c86821a08450d6461d061cea"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 845 Local 727 Mirrors 0 Missed 118 Current 175 (86% match, 88% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 176 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 194 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 197 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 202 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_populate_lic_setscene)
NOTE: Running setscene task 219 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 260 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 274 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 286 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20260601-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 289 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 291 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ca-certificates-20260601-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 294 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 301 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 307 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 308 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 317 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 322 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 362 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 364 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 368 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 372 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 374 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 381 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 390 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 393 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 394 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 403 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 404 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 418 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 420 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 422 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 424 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 426 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 427 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 434 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 436 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 439 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 440 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 452 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 462 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 464 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 466 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 467 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 471 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 472 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 473 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 478 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 485 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 489 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 492 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 499 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 500 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.96.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_package_setscene)
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 518 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 520 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_setscene)
NOTE: Running setscene task 527 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_recipe_qa_setscene)
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 543 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 551 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 556 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 558 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 567 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 569 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 572 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 575 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 577 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 580 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 582 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.96.1-r0: task do_package_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 589 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 591 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 593 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 596 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 609 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 620 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 624 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 628 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 642 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 644 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 655 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 673 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 677 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 678 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 696 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 703 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 728 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 744 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_package_setscene: Succeeded
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_spdx_setscene)
NOTE: recipe ninja-native-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 757 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 765 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ninja-native-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-arm-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 789 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 792 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-arm-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 797 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_package_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 354 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.96.1.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 379 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: Running task 380 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running task 447 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: Running task 451 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: Running task 454 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: Running task 459 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running task 478 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_fetch: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 510 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_fetch)
NOTE: Running setscene task 826 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_package_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 827 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-native-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 831 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-native-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 834 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 532 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 533 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe automake-native-1.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 536 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_unpack)
NOTE: recipe automake-native-1.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 839 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_fetch: Started
NOTE: Running task 544 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 843 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe autoconf-native-2.73-r0: task do_create_spdx_setscene: Started
NOTE: Running task 551 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 562 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-native-2.73-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 675 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: Running task 681 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 682 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 689 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 701 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 702 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe libcxx-22.1.8-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 703 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: Running setscene task 861 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running setscene task 862 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running setscene task 863 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 864 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 712 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_package_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 713 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 721 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_package_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 722 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 735 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 736 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: Running task 737 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: Running task 746 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 747 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe compiler-rt-22.1.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 866 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 869 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe clang-cross-arm-git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: Running setscene task 870 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running task 758 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 772 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe clang-cross-arm-git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: Running setscene task 876 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 780 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 802 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe clang-cross-arm-git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: recipe clang-native-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 819 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: Running task 820 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_fetch)
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 877 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_recipe_qa_setscene: Started
WARNING: nettle-4.0-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/nettle/nettle-4.0.tar.gz, attempting MIRRORS if available
NOTE: recipe clang-cross-arm-git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_fetch)
NOTE: Running task 823 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: Running task 825 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe clang-cross-arm-git-r0: task do_fetch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_fetch: Succeeded
NOTE: Running task 826 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_unpack)
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_unpack: Started
NOTE: recipe clang-cross-arm-git-r0: task do_unpack: Succeeded
NOTE: Running task 827 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_patch)
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 835 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx)
NOTE: recipe clang-cross-arm-git-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_patch: Succeeded
NOTE: Running task 840 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe compiler-rt-22.1.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 878 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 879 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running setscene task 880 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: Running setscene task 881 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 882 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 898 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 900 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
WARNING: libmpc-1.4.1-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/mpc/mpc-1.4.1.tar.xz, attempting MIRRORS if available
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 912 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 921 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 922 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 937 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 938 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 943 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 948 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe clang-native-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 858 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 873 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-native-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-native-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 879 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 887 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: Running setscene task 958 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-native-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 961 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe re2c-native-4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 899 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: Running task 900 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: Running setscene task 963 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: recipe binutils-native-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 901 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-native-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 910 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_unpack)
NOTE: Running task 911 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe re2c-native-4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 913 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 914 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running setscene task 967 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe re2c-native-4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: Running setscene task 969 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe re2c-native-4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 924 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx)
NOTE: Running setscene task 972 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 973 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 974 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running noexec task 941 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_fetch)
NOTE: recipe libcxx-22.1.8-r0: task do_create_recipe_spdx: Started
NOTE: Running task 950 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_recipe_spdx)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 976 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 951 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_recipe_spdx)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 954 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_recipe_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 955 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcxx-22.1.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 958 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 982 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 964 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_create_recipe_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_recipe_qa_setscene)
NOTE: Running task 971 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.1.bb:do_fetch)
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-arm-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running setscene task 999 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-arm-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-arm-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-arm-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pkgconf-native-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe automake-native-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pkgconf-native-3.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe automake-native-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe autoconf-native-2.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe automake-native-1.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe automake-native-1.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1020 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_recipe_qa_setscene)
NOTE: recipe autoconf-native-2.73-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-native-2.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1440 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: Running task 1442 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: Running task 1443 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: Running task 1515 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: Running task 1517 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: Running task 1528 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_patch)
NOTE: Running task 1568 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_patch)
NOTE: Running task 1573 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1575 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 1577 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_patch: Succeeded
NOTE: Running task 1578 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: Running task 1581 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb:do_rust_gen_targets)
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1583 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1584 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_rust_gen_targets: Started
NOTE: Running task 1599 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1603 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1606 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: Running task 1607 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: Running task 1615 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running noexec task 1616 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 1617 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1618 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: Running task 1622 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1629 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1630 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.165.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1631 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: Running task 1662 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: Running task 1666 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1670 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
WARNING: gcc-source-16.1.0-16.1.0-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/gcc/gcc-16.1.0/gcc-16.1.0.tar.xz, attempting MIRRORS if available
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: Running task 1672 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_check_backend)
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1675 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1677 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_check_backend: Started
NOTE: Running task 1680 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_check_backend: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1681 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 1698 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1716 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: Running task 1717 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1734 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_unpack)
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 1ec2ed5ac824f1dcf0bd27c12d96284f8521221a32dd3e09740a40d2896c9a3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Running setscene task 1020 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1740 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 01601c830bf0505dffefe38b59daca3ab016e10d573425e9e20abf8724f20aa7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 322a6bfec5fd7eff119a23c9b56088b6965948220a08110f14f5cf6f871533fe to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '8ac91bcd16a65da4bb42415537e59a63508eea5b0e29565d8236dee6c32afa0b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '322a6bfec5fd7eff119a23c9b56088b6965948220a08110f14f5cf6f871533fe'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 8ac91bcd16a65da4bb42415537e59a63508eea5b0e29565d8236dee6c32afa0b -> 322a6bfec5fd7eff119a23c9b56088b6965948220a08110f14f5cf6f871533fe as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1742 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.1.bb:do_unpack)
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_unpack: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1743 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_patch)
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_patch: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1744 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_preconfigure)
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_preconfigure: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_preconfigure: Succeeded
NOTE: Running task 1780 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx)
NOTE: recipe clang-cross-arm-git-r0: task do_create_spdx: Started
NOTE: recipe clang-cross-arm-git-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1782 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.1.bb:do_patch)
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_patch: Started
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1784 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.1.bb:do_preconfigure)
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_preconfigure: Succeeded
NOTE: Running task 1937 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1942 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1943 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2005 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2047 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2048 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2049 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2106 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2137 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2138 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2153 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_create_spdx: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2154 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2155 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2156 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2157 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Running task 2159 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: Running task 2160 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_configure)
NOTE: Running task 2161 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: Running task 2162 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: Running task 2163 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2164 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx)
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2165 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe libcxx-22.1.8-r0: task do_create_spdx: Started
NOTE: recipe python3-3.14.7-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2166 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2167 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: Running task 2168 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: recipe libcxx-22.1.8-r0: task do_create_spdx: Succeeded
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2182 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package unihash changed to 42347bf1947e2f044140e293767c8df6e69eaedaa6bad855c3b57180d63ac17f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata became valid
NOTE: Running setscene task 1020 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2185 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2186 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: Running task 2187 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2188 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2189 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: Running task 2192 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2193 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2195 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 2196 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2197 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2199 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_compile)
NOTE: Running task 2201 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 2203 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: Running task 2205 of 2467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 8e063053a6e01b24502791529cd7220a85c2e7dd8a13f909978fc1eb752d7f93
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 1020 of 1020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: recipe json-c-0.19-r0: task do_package: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_configure: Succeeded
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 2206 tasks of which 2039 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260815050938.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260815050938.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.357987
Summary: There were 4 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.357987
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============6905374886265960012==--

