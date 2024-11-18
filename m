Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A02FD6006F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4827.1731964638555133943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VeKtsxD+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KCxrf7Fi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193412312f7-2c0b840f-8a92-4d14-8fcf-ecfafc8cab06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ycHPMaxTLeX4GSyepJLNb6SRYOfy7LwUMHI1tArIXpM=;
	b=VeKtsxD+uCvaX9S0mYOvcQPeKNkVGHmFwR8/KoNFbhF9ejT+l/I1lYtZrqLlQVxe
	NwjL8I4khq45+0tTjrMdEYr1IsFlUShYP8Li+jXqysCHu3sLFL4CSEyKGszXgV4Vm8p
	eSa4mrqffeZh8/WzNeY6mxndLu/zqyWRLSzMJhc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ycHPMaxTLeX4GSyepJLNb6SRYOfy7LwUMHI1tArIXpM=;
	b=KCxrf7Fi6/aHT3feAzUEAMQ+96ndTV2OG9jUOT8QDHS2ouVJw2B+D57LsZjwkuNy
	l6DhAI1MVinj4w7KiX7G+lKIcPZW4hY8aLm0uomYfyfFE8ckOOlA09M0ESnmSfptk7P
	N9PQ9HX980j5DomSIt/+HhHEkIVeKpr5bj4y+0zk=
Content-Type: multipart/mixed; boundary="===============8645139909883097736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.21.0 SUCCEEDED
Message-ID: <01010193412312f7-2c0b840f-8a92-4d14-8fcf-ecfafc8cab06-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207292

--===============8645139909883097736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.20.0-0.21.0.patch
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
From 0d5b20b8f63943499f2563d936e9c2813c26a50d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 02:22:33 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.20.0 -> 0.21.0

---
 .../python/python3-rpds-py-crates.inc         | 26 +++++++++----------
 ...py_0.20.0.bb => python3-rpds-py_0.21.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.20.0.bb => python3-rpds-py_0.21.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index e6c1ef8add..fc954d69b8 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,7 +2,7 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/archery/1.2.0 \
+    crate://crates.io/archery/1.2.1 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/cc/1.0.90 \
     crate://crates.io/cfg-if/1.0.0 \
@@ -13,15 +13,14 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.2 \
-    crate://crates.io/pyo3-build-config/0.22.2 \
-    crate://crates.io/pyo3-ffi/0.22.2 \
-    crate://crates.io/pyo3-macros/0.22.2 \
-    crate://crates.io/pyo3-macros-backend/0.22.2 \
+    crate://crates.io/pyo3/0.22.6 \
+    crate://crates.io/pyo3-build-config/0.22.6 \
+    crate://crates.io/pyo3-ffi/0.22.6 \
+    crate://crates.io/pyo3-macros/0.22.6 \
+    crate://crates.io/pyo3-macros-backend/0.22.6 \
     crate://crates.io/python3-dll-a/0.2.10 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
-    crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/syn/2.0.69 \
     crate://crates.io/target-lexicon/0.12.14 \
     crate://crates.io/triomphe/0.1.13 \
@@ -29,7 +28,7 @@ SRC_URI += " \
     crate://crates.io/unindent/0.2.3 \
 "
 
-SRC_URI[archery-1.2.0.sha256sum] = "8967cd1cc9e9e1954f644e14fbd6042fe9a37da96c52a67e44a2ac18261f8561"
+SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[cc-1.0.90.sha256sum] = "8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
@@ -40,15 +39,14 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
-SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
-SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
-SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
-SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
+SRC_URI[pyo3-0.22.6.sha256sum] = "f402062616ab18202ae8319da13fa4279883a2b8a9d9f83f20dbade813ce1884"
+SRC_URI[pyo3-build-config-0.22.6.sha256sum] = "b14b5775b5ff446dd1056212d778012cbe8a0fbffd368029fd9e25b514479c38"
+SRC_URI[pyo3-ffi-0.22.6.sha256sum] = "9ab5bcf04a2cdcbb50c7d6105de943f543f9ed92af55818fd17b660390fc8636"
+SRC_URI[pyo3-macros-0.22.6.sha256sum] = "0fd24d897903a9e6d80b968368a34e1525aeb719d568dba8b3d4bfa5dc67d453"
+SRC_URI[pyo3-macros-backend-0.22.6.sha256sum] = "36c011a03ba1e50152b4b394b479826cad97e7a21eb52df179cd91ac411cbfbe"
 SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
-SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
 SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
 SRC_URI[triomphe-0.1.13.sha256sum] = "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
index dd483ed88e..e97459a444 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "d72a210824facfdaf8768cf2d7ca25a042c30320b3020de2fa04640920d4e121"
+SRC_URI[sha256sum] = "ed6378c9d66d0de903763e7706383d60c33829581f0adff47b6535f1802fa6db"
 
 require ${BPN}-crates.inc
 
-- 
2.44.1


--===============8645139909883097736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.20.0.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.21.0.dist-info

--===============8645139909883097736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.20.0-0.21.0.patch"

RnJvbSAwZDViMjBiOGY2Mzk0MzQ5OWYyNTYzZDkzNmU5YzI4MTNjMjZhNTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDI6MjI6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJwZHMtcHk6IHVwZ3JhZGUgMC4yMC4wIC0+IDAuMjEuMAoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCAyNiArKysrKysrKystLS0tLS0t
LS0tCiAuLi5weV8wLjIwLjAuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMjEuMC5iYn0gfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJwZHMtcHlfMC4yMC4w
LmJiID0+IHB5dGhvbjMtcnBkcy1weV8wLjIxLjAuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKaW5k
ZXggZTZjMWVmOGFkZC4uZmM5NTRkNjliOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCkBAIC0yLDcgKzIsNyBA
QAogCiAjIGZyb20gQ2FyZ28ubG9jawogU1JDX1VSSSArPSAiIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9hcmNoZXJ5LzEuMi4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNoZXJ5LzEuMi4x
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuMy4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jYy8xLjAuOTAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NmZy1pZi8xLjAuMCBc
CkBAIC0xMywxNSArMTMsMTQgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9vbmNlX2NlbGwvMS4xOS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9t
aWMvMS42LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC44NiBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjIyLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B5bzMtYnVpbGQtY29uZmlnLzAuMjIuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1m
ZmkvMC4yMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjIyLjIgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yMi4yIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjIuNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlv
My1idWlsZC1jb25maWcvMC4yMi42IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8w
LjIyLjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjIuNiBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIyLjYgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5dGhvbjMtZGxsLWEvMC4yLjEwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9xdW90ZS8xLjAuMzYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JwZHMvMS4xLjAgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3N0YXRpY19hc3NlcnRpb25zLzEuMS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zeW4vMi4wLjY5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90YXJnZXQtbGV4
aWNvbi8wLjEyLjE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmlvbXBoZS8wLjEuMTMgXApA
QCAtMjksNyArMjgsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Vu
aW5kZW50LzAuMi4zIFwKICIKIAotU1JDX1VSSVthcmNoZXJ5LTEuMi4wLnNoYTI1NnN1bV0gPSAi
ODk2N2NkMWNjOWU5ZTE5NTRmNjQ0ZTE0ZmJkNjA0MmZlOWEzN2RhOTZjNTJhNjdlNDRhMmFjMTgy
NjFmODU2MSIKK1NSQ19VUklbYXJjaGVyeS0xLjIuMS5zaGEyNTZzdW1dID0gImVhZTJlZDIxY2Q1
NTAyMWYwNTcwN2E4MDdhNWZjODU2OTVkYWZiOTg4MzI5MjFmNmNmYTA2ZGI2N2NhNWI4NjkiCiBT
UkNfVVJJW2F1dG9jZmctMS4zLjAuc2hhMjU2c3VtXSA9ICIwYzRiNGQwYmQyNWJkMGI3NDY4MWMw
YWQyMTQ5NzYxMGNlMWI3YzkxYjEwMjJjZDIxYzgwYzZmYmRkOTQ3NmIwIgogU1JDX1VSSVtjYy0x
LjAuOTAuc2hhMjU2c3VtXSA9ICI4Y2Q2NjA0YTgyYWNmMzAzOWYxMTQ0ZjU0YjhlYjM0ZTkxZmZi
YTYyMjA1MTE4OWU3MWI3ODE4MjJkNWVlMWY1IgogU1JDX1VSSVtjZmctaWYtMS4wLjAuc2hhMjU2
c3VtXSA9ICJiYWYxZGU0MzM5NzYxNTg4YmMwNjE5ZTNjYmMwMTIwZWU1ODJlYmI3NGI1M2I0ZWZi
Zjc5MTE3YmQyZGE0MGZkIgpAQCAtNDAsMTUgKzM5LDE0IEBAIFNSQ19VUklbbWVtb2Zmc2V0LTAu
OS4xLnNoYTI1NnN1bV0gPSAiNDg4MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNl
NDQ0CiBTUkNfVVJJW29uY2VfY2VsbC0xLjE5LjAuc2hhMjU2c3VtXSA9ICIzZmRiMTJiMjQ3NmI1
OTVmOTM1OGM1MTYxYWE0NjdjMjQzODg1OWNhYTEzNmRlYzg2YzI2ZmRkMmVmZTE3YjkyIgogU1JD
X1VSSVtwb3J0YWJsZS1hdG9taWMtMS42LjAuc2hhMjU2c3VtXSA9ICI3MTcwZWY5OTg4YmMxNjli
YTE2ZGQzNmE3ZmEwNDFlNWM0Y2JlYjZhMzViNzZkNGMwM2RhZGVkMzcxZWFlN2MwIgogU1JDX1VS
SVtwcm9jLW1hY3JvMi0xLjAuODYuc2hhMjU2c3VtXSA9ICI1ZTcxOWU4ZGY2NjVkZjBkMWM4ZmJm
ZDIzODAxNTc0NDczNjE1MWQ0NDQ1ZWMwODM2YjhlNjI4YWFlMTAzYjc3IgotU1JDX1VSSVtweW8z
LTAuMjIuMi5zaGEyNTZzdW1dID0gIjgzMWU4ZTgxOWExMzhjMzZlMjEyZjNhZjNmZDllZWZmZWQ2
YmYxNTEwYTgwNWFmMzViMGVkZWU1ZmZhNTk0MzMiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmln
LTAuMjIuMi5zaGEyNTZzdW1dID0gIjFlODczMGU1OTFiMTQ0OTJhODk0NWNkZmYzMmYwODkyNTBi
MDVmNWFjY2VjZjc0YWVkZGY5ZTgyNzJjZTFmYTgiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjIuMi5z
aGEyNTZzdW1dID0gIjVlOTdlOTE5ZDJkZjkyZWI4OGNhODBhMDM3OTY5ZjQ0ZTVlNzAzNTY1NTk2
NTQ5NjJjYmIzMzE2ZDAwMzAwYzYiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjIuMi5zaGEyNTZz
dW1dID0gImViNTc5ODMwMjJhZDQxZjllNjgzYTU5OWYyZmQxM2MzNjY0ZDcwNjNhM2FjNTcxNGNh
ZTRiN2JlZTdkM2YyMDYiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yMi4yLnNoYTI1
NnN1bV0gPSAiZWM0ODBjMGM1MWRkZWM4MTAxOTUzMTcwNWFjYWM1MWJjZGJlYWU1NjM1NTdjOTgy
YWE4MjYzYmI5Njg4MDM3MiIKK1NSQ19VUklbcHlvMy0wLjIyLjYuc2hhMjU2c3VtXSA9ICJmNDAy
MDYyNjE2YWIxODIwMmFlODMxOWRhMTNmYTQyNzk4ODNhMmI4YTlkOWY4M2YyMGRiYWRlODEzY2Ux
ODg0IgorU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjIyLjYuc2hhMjU2c3VtXSA9ICJiMTRi
NTc3NWI1ZmY0NDZkZDEwNTYyMTJkNzc4MDEyY2JlOGEwZmJmZmQzNjgwMjlmZDllMjViNTE0NDc5
YzM4IgorU1JDX1VSSVtweW8zLWZmaS0wLjIyLjYuc2hhMjU2c3VtXSA9ICI5YWI1YmNmMDRhMmNk
Y2JiNTBjN2Q2MTA1ZGU5NDNmNTQzZjllZDkyYWY1NTgxOGZkMTdiNjYwMzkwZmM4NjM2IgorU1JD
X1VSSVtweW8zLW1hY3Jvcy0wLjIyLjYuc2hhMjU2c3VtXSA9ICIwZmQyNGQ4OTc5MDNhOWU2ZDgw
Yjk2ODM2OGEzNGUxNTI1YWViNzE5ZDU2OGRiYThiM2Q0YmZhNWRjNjdkNDUzIgorU1JDX1VSSVtw
eW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjIuNi5zaGEyNTZzdW1dID0gIjM2YzAxMWEwM2JhMWU1MDE1
MmI0YjM5NGI0Nzk4MjZjYWQ5N2U3YTIxZWI1MmRmMTc5Y2Q5MWFjNDExY2JmYmUiCiBTUkNfVVJJ
W3B5dGhvbjMtZGxsLWEtMC4yLjEwLnNoYTI1NnN1bV0gPSAiYmQwYjc4MTcxYTkwZDgwOGIzMTlh
Y2ZhZDE2NmM0NzkwZDllOTc1OWJiYzE0YWM4MjczZmUxMzM2NzNkZDQxYiIKIFNSQ19VUklbcXVv
dGUtMS4wLjM2LnNoYTI1NnN1bV0gPSAiMGZhNzZhYWYzOTEwMWM0NTc4MzZhZWMwY2UyMzE2ZGJk
YzNhYjcyM2NkZGExYzZiZDRlNmFkNDIwOGFjYWNhNyIKIFNSQ19VUklbcnBkcy0xLjEuMC5zaGEy
NTZzdW1dID0gImEwZTE1NTE1ZDNjZTMzMTMzMjRkODQyNjI5ZWE0OTA1YzI1YTEzZjgxOTUzZWFk
Yjg4Zjg1NTE2ZjU5MjkwYTQiCi1TUkNfVVJJW3N0YXRpY19hc3NlcnRpb25zLTEuMS4wLnNoYTI1
NnN1bV0gPSAiYTJlYjkzNDliNjQ0NGIzMjY4NzJlMTQwZWIxY2Y1ZTdjNTIyMTU0ZDY5ZTdhMGZm
YjBmYjgxYzA2YjM3NTQzZiIKIFNSQ19VUklbc3luLTIuMC42OS5zaGEyNTZzdW1dID0gIjIwMWZj
ZGEzODQ1YzIzZTgyMTJjZDQ2NmJmZWJmMGJkMjA2OTQ0OTBmYzAzNTZhZThlNDI4ZTA4MjRhOTE1
YTYiCiBTUkNfVVJJW3RhcmdldC1sZXhpY29uLTAuMTIuMTQuc2hhMjU2c3VtXSA9ICJlMWZjNDAz
ODkxYTIxYmNmYjdjMzc4MzRiYTY2YTU0N2E4ZjQwMjE0NmViYTcyNjViNWE2ZDg4MDU5YzlmZjJm
IgogU1JDX1VSSVt0cmlvbXBoZS0wLjEuMTMuc2hhMjU2c3VtXSA9ICJlNjYzMWU0MmUxMGI0MGMw
NjkwYmY5MmY0MDRlYmNmZTZlMWZkYjQ4MDM5MWQxNWYxN2NjOGU5NmVlZWQ1MzY5IgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yMC4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yMS4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yMS4wLmJiCmluZGV4IGRkNDgzZWQ4
OGUuLmU5NzQ1OWE0NDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1ycGRzLXB5XzAuMjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcnBkcy1weV8wLjIxLjAuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTc3NjdmYTUzN2M0NTk2YzU0MTQxZjMyODgyYzRh
OTg0IgogCiBTUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0ZXN0IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDcyYTIxMDgyNGZhY2ZkYWY4NzY4Y2YyZDdjYTI1YTA0MmMzMDMyMGIzMDIwZGUyZmEw
NDY0MDkyMGQ0ZTEyMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZDYzNzhjOWQ2NmQwZGU5MDM3
NjNlNzcwNjM4M2Q2MGMzMzgyOTU4MWYwYWRmZjQ3YjY1MzVmMTgwMmZhNmRiIgogCiByZXF1aXJl
ICR7QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDQuMQoK

--===============8645139909883097736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.20.0.tar.gz;downloadfilename=rpds_py-0.20.0.tar.gz file://run-ptest crate://crates.io/archery/1.2.0 crate://crates.io/autocfg/1.3.0 crate://crates.io/cc/1.0.90 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.2 crate://crates.io/pyo3-build-config/0.22.2 crate://crates.io/pyo3-ffi/0.22.2 crate://crates.io/pyo3-macros/0.22.2 crate://crates.io/pyo3-macros-backend/0.22.2 crate://crates.io/python3-dll-a/0.2.10 crate://crates.io/quote/1.0.36 crate://crates.io/rpds/1.1.0 crate://crates.io/static_assertions/1.1.0 crate://crates.io/syn/2.0.69 crate://crates.io/target-lexicon/0.12.14 crate://crates.io/triomphe/0.1.13 cr
 ate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.21.0.tar.gz;downloadfilename=rpds_py-0.21.0.tar.gz file://run-ptest crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/cc/1.0.90 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.6 crate://crates.io/pyo3-build-config/0.22.6 crate://crates.io/pyo3-ffi/0.22.6 crate://crates.io/pyo3-macros/0.22.6 crate://crates.io/pyo3-macros-backend/0.22.6 crate://crates.io/python3-dll-a/0.2.10 crate://crates.io/quote/1.0.36 crate://crates.io/rpds/1.1.0 crate://crates.io/syn/2.0.69 crate://crates.io/target-lexicon/0.12.14 crate://crates.io/triomphe/0.1.13 crate://crates.io/unicode-ident/1.0.
 12 crate://crates.io/unindent/0.2.3"
packages/core2-64-poky-linux/python3-rpds-py: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 276632 to 280192 (+1%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGSIZE changed from 29493 to 29520 (+0%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.20.0" to "0.21.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 753984 to 758070 (+1%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.20.0" to "0.21.0"
Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.20.0.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.21.0.dist-info

--===============8645139909883097736==--

