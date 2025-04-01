Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26161C3601E
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18073.1743511395133513718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=g+18fM9f;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IFlLTaQM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f160ac50-a7c265eb-e8b2-451c-b9ea-b20287a68b28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mgPZtpdYWkqLI3dvp20hLPqr1ruBCB9y9CBYbCcCS1o=;
	b=g+18fM9fn59Cz002Fg8wkUobljKmkEAufLlwI/obdT1GpUsjiMaWMaje2duGMorw
	e7vNuCaLHZcyLJ4uC/OQOMY9bZvElHMS0otuuwq8P77XQ0N2NT6w/TXE9VkanyfFokK
	0+hV8wJn9o/PmF1Ao//lLmHtKvtBE5iFQ8F45X7o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mgPZtpdYWkqLI3dvp20hLPqr1ruBCB9y9CBYbCcCS1o=;
	b=IFlLTaQMGodsCS4yNLtFVx6pIS7SOyFctZCK8aBurYhHj6SfbbGqgNohdaF10orq
	Y3hVZPtKBOFErUGCdQplGunoxXZhJSH6kxPUQFLuBDqCinX79b6HCZQXhQsjdRuACIp
	KjHBj+hM356hkbkISRc/VyqnjAQqa3UDoJcOtdVM=
Content-Type: multipart/mixed; boundary="===============5712943818102856822=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.24.0 SUCCEEDED
Message-ID: <01010195f160ac50-a7c265eb-e8b2-451c-b9ea-b20287a68b28-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214072

--===============5712943818102856822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0.24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.22.3-0.24.0.patch
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
From 52ebbc2145dc6a63c8cde7bce0020bedc9182db5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:19:50 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.22.3 -> 0.24.0

---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++++----------
 ...py_0.22.3.bb => python3-rpds-py_0.24.0.bb} |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.22.3.bb => python3-rpds-py_0.24.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 7022cbdcc8..df58e20862 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -13,16 +13,16 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.23.3 \
-    crate://crates.io/pyo3-build-config/0.23.3 \
-    crate://crates.io/pyo3-ffi/0.23.3 \
-    crate://crates.io/pyo3-macros/0.23.3 \
-    crate://crates.io/pyo3-macros-backend/0.23.3 \
-    crate://crates.io/python3-dll-a/0.2.11 \
+    crate://crates.io/pyo3/0.24.0 \
+    crate://crates.io/pyo3-build-config/0.24.0 \
+    crate://crates.io/pyo3-ffi/0.24.0 \
+    crate://crates.io/pyo3-macros/0.24.0 \
+    crate://crates.io/pyo3-macros-backend/0.24.0 \
+    crate://crates.io/python3-dll-a/0.2.12 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
     crate://crates.io/syn/2.0.69 \
-    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/target-lexicon/0.13.2 \
     crate://crates.io/triomphe/0.1.13 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unindent/0.2.3 \
@@ -39,16 +39,16 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.23.3.sha256sum] = "e484fd2c8b4cb67ab05a318f1fd6fa8f199fcc30819f08f07d200809dba26c15"
-SRC_URI[pyo3-build-config-0.23.3.sha256sum] = "dc0e0469a84f208e20044b98965e1561028180219e35352a2afaf2b942beff3b"
-SRC_URI[pyo3-ffi-0.23.3.sha256sum] = "eb1547a7f9966f6f1a0f0227564a9945fe36b90da5a93b3933fc3dc03fae372d"
-SRC_URI[pyo3-macros-0.23.3.sha256sum] = "fdb6da8ec6fa5cedd1626c886fc8749bdcbb09424a86461eb8cdf096b7c33257"
-SRC_URI[pyo3-macros-backend-0.23.3.sha256sum] = "38a385202ff5a92791168b1136afae5059d3ac118457bb7bc304c197c2d33e7d"
-SRC_URI[python3-dll-a-0.2.11.sha256sum] = "9b9e268ee1be609e93a13eb06839f68f67e5fe0fb4049834d261c2d5091c1b6d"
+SRC_URI[pyo3-0.24.0.sha256sum] = "7f1c6c3591120564d64db2261bec5f910ae454f01def849b9c22835a84695e86"
+SRC_URI[pyo3-build-config-0.24.0.sha256sum] = "e9b6c2b34cf71427ea37c7001aefbaeb85886a074795e35f161f5aecc7620a7a"
+SRC_URI[pyo3-ffi-0.24.0.sha256sum] = "5507651906a46432cdda02cd02dd0319f6064f1374c9147c45b978621d2c3a9c"
+SRC_URI[pyo3-macros-0.24.0.sha256sum] = "b0d394b5b4fd8d97d48336bb0dd2aebabad39f1d294edd6bcd2cccf2eefe6f42"
+SRC_URI[pyo3-macros-backend-0.24.0.sha256sum] = "fd72da09cfa943b1080f621f024d2ef7e2773df7badd51aa30a2be1f8caa7c8e"
+SRC_URI[python3-dll-a-0.2.12.sha256sum] = "9b66f9171950e674e64bad3456e11bb3cca108e5c34844383cfe277f45c8a7a8"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
 SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
-SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
 SRC_URI[triomphe-0.1.13.sha256sum] = "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb b/meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
index 8eeb954c89..730688876a 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "e32fee8ab45d3c2db6da19a5323bc3362237c8b653c70194414b892fd06a080d"
+SRC_URI[sha256sum] = "772cc1b2cd963e7e17e6cc55fe0371fb9c704d63e44cacec7b9b7f523b78919e"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============5712943818102856822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.22.3.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.24.0.dist-info

--===============5712943818102856822==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.22.3-0.24.0.patch"

RnJvbSA1MmViYmMyMTQ1ZGM2YTYzYzhjZGU3YmNlMDAyMGJlZGM5MTgyZGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOToxOTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnBkcy1weTogdXBncmFkZSAwLjIyLjMgLT4gMC4yNC4wCgotLS0KIC4uLi9weXRob24v
cHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMgICAgICAgICB8IDI4ICsrKysrKysrKy0tLS0tLS0t
LS0KIC4uLnB5XzAuMjIuMy5iYiA9PiBweXRob24zLXJwZHMtcHlfMC4yNC4wLmJifSB8ICAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnBkcy1weV8wLjIyLjMu
YmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMjQuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYwppbmRl
eCA3MDIyY2JkY2M4Li5kZjU4ZTIwODYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKQEAgLTEzLDE2ICsxMywx
NiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL29uY2VfY2VsbC8xLjE5
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjYuMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjg2IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLzAuMjMuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25m
aWcvMC4yMy4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjIzLjMgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjMuMyBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIzLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B5dGhvbjMtZGxsLWEvMC4yLjExIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjQu
MCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yNC4wIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjI0LjAgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3B5bzMtbWFjcm9zLzAuMjQuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNy
b3MtYmFja2VuZC8wLjI0LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5dGhvbjMtZGxsLWEv
MC4yLjEyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuMzYgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3JwZHMvMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAu
NjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29uLzAuMTIuMTQgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29uLzAuMTMuMiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdHJpb21waGUvMC4xLjEzIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2Rl
LWlkZW50LzEuMC4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pbmRlbnQvMC4yLjMgXApA
QCAtMzksMTYgKzM5LDE2IEBAIFNSQ19VUklbbWVtb2Zmc2V0LTAuOS4xLnNoYTI1NnN1bV0gPSAi
NDg4MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNlNDQ0CiBTUkNfVVJJW29uY2Vf
Y2VsbC0xLjE5LjAuc2hhMjU2c3VtXSA9ICIzZmRiMTJiMjQ3NmI1OTVmOTM1OGM1MTYxYWE0Njdj
MjQzODg1OWNhYTEzNmRlYzg2YzI2ZmRkMmVmZTE3YjkyIgogU1JDX1VSSVtwb3J0YWJsZS1hdG9t
aWMtMS42LjAuc2hhMjU2c3VtXSA9ICI3MTcwZWY5OTg4YmMxNjliYTE2ZGQzNmE3ZmEwNDFlNWM0
Y2JlYjZhMzViNzZkNGMwM2RhZGVkMzcxZWFlN2MwIgogU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAu
ODYuc2hhMjU2c3VtXSA9ICI1ZTcxOWU4ZGY2NjVkZjBkMWM4ZmJmZDIzODAxNTc0NDczNjE1MWQ0
NDQ1ZWMwODM2YjhlNjI4YWFlMTAzYjc3IgotU1JDX1VSSVtweW8zLTAuMjMuMy5zaGEyNTZzdW1d
ID0gImU0ODRmZDJjOGI0Y2I2N2FiMDVhMzE4ZjFmZDZmYThmMTk5ZmNjMzA4MTlmMDhmMDdkMjAw
ODA5ZGJhMjZjMTUiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjMuMy5zaGEyNTZzdW1d
ID0gImRjMGUwNDY5YTg0ZjIwOGUyMDA0NGI5ODk2NWUxNTYxMDI4MTgwMjE5ZTM1MzUyYTJhZmFm
MmI5NDJiZWZmM2IiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjMuMy5zaGEyNTZzdW1dID0gImViMTU0
N2E3Zjk5NjZmNmYxYTBmMDIyNzU2NGE5OTQ1ZmUzNmI5MGRhNWE5M2IzOTMzZmMzZGMwM2ZhZTM3
MmQiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjMuMy5zaGEyNTZzdW1dID0gImZkYjZkYThlYzZm
YTVjZWRkMTYyNmM4ODZmYzg3NDliZGNiYjA5NDI0YTg2NDYxZWI4Y2RmMDk2YjdjMzMyNTciCi1T
UkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yMy4zLnNoYTI1NnN1bV0gPSAiMzhhMzg1MjAy
ZmY1YTkyNzkxMTY4YjExMzZhZmFlNTA1OWQzYWMxMTg0NTdiYjdiYzMwNGMxOTdjMmQzM2U3ZCIK
LVNSQ19VUklbcHl0aG9uMy1kbGwtYS0wLjIuMTEuc2hhMjU2c3VtXSA9ICI5YjllMjY4ZWUxYmU2
MDllOTNhMTNlYjA2ODM5ZjY4ZjY3ZTVmZTBmYjQwNDk4MzRkMjYxYzJkNTA5MWMxYjZkIgorU1JD
X1VSSVtweW8zLTAuMjQuMC5zaGEyNTZzdW1dID0gIjdmMWM2YzM1OTExMjA1NjRkNjRkYjIyNjFi
ZWM1ZjkxMGFlNDU0ZjAxZGVmODQ5YjljMjI4MzVhODQ2OTVlODYiCitTUkNfVVJJW3B5bzMtYnVp
bGQtY29uZmlnLTAuMjQuMC5zaGEyNTZzdW1dID0gImU5YjZjMmIzNGNmNzE0MjdlYTM3YzcwMDFh
ZWZiYWViODU4ODZhMDc0Nzk1ZTM1ZjE2MWY1YWVjYzc2MjBhN2EiCitTUkNfVVJJW3B5bzMtZmZp
LTAuMjQuMC5zaGEyNTZzdW1dID0gIjU1MDc2NTE5MDZhNDY0MzJjZGRhMDJjZDAyZGQwMzE5ZjYw
NjRmMTM3NGM5MTQ3YzQ1Yjk3ODYyMWQyYzNhOWMiCitTUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjQu
MC5zaGEyNTZzdW1dID0gImIwZDM5NGI1YjRmZDhkOTdkNDgzMzZiYjBkZDJhZWJhYmFkMzlmMWQy
OTRlZGQ2YmNkMmNjY2YyZWVmZTZmNDIiCitTUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4y
NC4wLnNoYTI1NnN1bV0gPSAiZmQ3MmRhMDljZmE5NDNiMTA4MGY2MjFmMDI0ZDJlZjdlMjc3M2Rm
N2JhZGQ1MWFhMzBhMmJlMWY4Y2FhN2M4ZSIKK1NSQ19VUklbcHl0aG9uMy1kbGwtYS0wLjIuMTIu
c2hhMjU2c3VtXSA9ICI5YjY2ZjkxNzE5NTBlNjc0ZTY0YmFkMzQ1NmUxMWJiM2NjYTEwOGU1YzM0
ODQ0MzgzY2ZlMjc3ZjQ1YzhhN2E4IgogU1JDX1VSSVtxdW90ZS0xLjAuMzYuc2hhMjU2c3VtXSA9
ICIwZmE3NmFhZjM5MTAxYzQ1NzgzNmFlYzBjZTIzMTZkYmRjM2FiNzIzY2RkYTFjNmJkNGU2YWQ0
MjA4YWNhY2E3IgogU1JDX1VSSVtycGRzLTEuMS4wLnNoYTI1NnN1bV0gPSAiYTBlMTU1MTVkM2Nl
MzMxMzMyNGQ4NDI2MjllYTQ5MDVjMjVhMTNmODE5NTNlYWRiODhmODU1MTZmNTkyOTBhNCIKIFNS
Q19VUklbc3luLTIuMC42OS5zaGEyNTZzdW1dID0gIjIwMWZjZGEzODQ1YzIzZTgyMTJjZDQ2NmJm
ZWJmMGJkMjA2OTQ0OTBmYzAzNTZhZThlNDI4ZTA4MjRhOTE1YTYiCi1TUkNfVVJJW3RhcmdldC1s
ZXhpY29uLTAuMTIuMTQuc2hhMjU2c3VtXSA9ICJlMWZjNDAzODkxYTIxYmNmYjdjMzc4MzRiYTY2
YTU0N2E4ZjQwMjE0NmViYTcyNjViNWE2ZDg4MDU5YzlmZjJmIgorU1JDX1VSSVt0YXJnZXQtbGV4
aWNvbi0wLjEzLjIuc2hhMjU2c3VtXSA9ICJlNTAyZjc4Y2RiYjhiYTQ3MThmNTY2YzQxOGM1MmJj
NzI5MTI2ZmZkMTZiYWVlNWJhYTcxOGNmMjVkZDVhNjlhIgogU1JDX1VSSVt0cmlvbXBoZS0wLjEu
MTMuc2hhMjU2c3VtXSA9ICJlNjYzMWU0MmUxMGI0MGMwNjkwYmY5MmY0MDRlYmNmZTZlMWZkYjQ4
MDM5MWQxNWYxN2NjOGU5NmVlZWQ1MzY5IgogU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4xMi5z
aGEyNTZzdW1dID0gIjMzNTRiOWFjM2ZhZTFmZjY3NTVjYjZkYjUzNjgzYWRiNjYxNjM0ZjY3NTU3
OTQyZGVhNGZhY2ViZWMwZmVlNGIiCiBTUkNfVVJJW3VuaW5kZW50LTAuMi4zLnNoYTI1NnN1bV0g
PSAiYzdkZTdkNzNlMTc1NDQ4N2NiNTgzNjRlZTkwNmE0OTk5MzdhMGRmYWJkODZiY2I5ODBmYTk5
ZWM4YzhmYTJjZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1ycGRzLXB5XzAuMjIuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1ycGRzLXB5XzAuMjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjIyLjMuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMjQu
MC5iYgppbmRleCA4ZWViOTU0Yzg5Li43MzA2ODg4NzZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjIyLjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yNC4wLmJiCkBAIC00LDcg
KzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvcnBkcy1weS8iCiBM
SUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTc3
NjdmYTUzN2M0NTk2YzU0MTQxZjMyODgyYzRhOTg0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZTMyZmVlOGFiNDVkM2MyZGI2ZGExOWE1MzIzYmMzMzYyMjM3YzhiNjUzYzcwMTk0NDE0Yjg5MmZk
MDZhMDgwZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NzJjYzFiMmNkOTYzZTdlMTdlNmNjNTVm
ZTAzNzFmYjljNzA0ZDYzZTQ0Y2FjZWM3YjliN2Y1MjNiNzg5MTllIgogCiByZXF1aXJlICR7QlBO
fS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDcuMQoK

--===============5712943818102856822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rpds-py: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.22.3.tar.gz;downloadfilename=rpds_py-0.22.3.tar.gz crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/cc/1.0.90 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.23.3 crate://crates.io/pyo3-build-config/0.23.3 crate://crates.io/pyo3-ffi/0.23.3 crate://crates.io/pyo3-macros/0.23.3 crate://crates.io/pyo3-macros-backend/0.23.3 crate://crates.io/python3-dll-a/0.2.11 crate://crates.io/quote/1.0.36 crate://crates.io/rpds/1.1.0 crate://crates.io/syn/2.0.69 crate://crates.io/target-lexicon/0.12.14 crate://crates.io/triomphe/0.1.13 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unin
 dent/0.2.3" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.24.0.tar.gz;downloadfilename=rpds_py-0.24.0.tar.gz crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/cc/1.0.90 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.24.0 crate://crates.io/pyo3-build-config/0.24.0 crate://crates.io/pyo3-ffi/0.24.0 crate://crates.io/pyo3-macros/0.24.0 crate://crates.io/pyo3-macros-backend/0.24.0 crate://crates.io/python3-dll-a/0.2.12 crate://crates.io/quote/1.0.36 crate://crates.io/rpds/1.1.0 crate://crates.io/syn/2.0.69 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.13 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3"
packages/core2-64-poky-linux/python3-rpds-py: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 290512 to 291000 (+0%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGSIZE changed from 29948 to 29992 (+0%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.22.3" to "0.24.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 826890 to 831044 (+1%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.22.3 [default] to 0.24.0 [default]
Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.22.3.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.24.0.dist-info

--===============5712943818102856822==--

