Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2BCD60065
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4671.1731964625253513889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=N8SqpIXA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cxzEXMII;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101934122dd10-5b360499-3127-4f2a-a12b-dcac99a79fc7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ab6HZYOxJ6Lg8K1aUUBcDrP1v3VSfOsp6dwfqKHdeFg=;
	b=N8SqpIXAzfcqa+oVzDqkgfEsV/JZwYhbJXn/N5L+hPvQlKhiGyhM4JkcbSvsf0Tu
	t1VJGa7zE6Hd7ImyP24PXWPmD4E8MZ44Vl7O/eeyfFC9o1u5Jo5vGuHh36yw+54vhlK
	X3KFv+fU0sXn3/3+GMZ3yNgK3/rOW8Wt6M8z6H2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ab6HZYOxJ6Lg8K1aUUBcDrP1v3VSfOsp6dwfqKHdeFg=;
	b=cxzEXMII3ELMUh3WKl3uZr5pazG6nlbsfaJV6TLRdk+9IfIWWkcoJEsvYeZMwwTC
	siQN73tpxpR3ZHFh1gQ3FNoF9ZreJSSamdpLERHgIsWh7/DMCCs5zoLjT9dsQJznqPT
	iKwFYP1ZznKK2zB75fzaCi3Hj2Z19G+ig24A9bNQ=
Content-Type: multipart/mixed; boundary="===============3433756236782058251=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 43.0.3 SUCCEEDED
Message-ID: <010101934122dd10-5b360499-3127-4f2a-a12b-dcac99a79fc7-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207273

--===============3433756236782058251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography* to *43.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-43.0.1-43.0.3.patch
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
From 3ba38551f3cbca0bd6b00bc065beae5aad60c958 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 20:18:02 +0000
Subject: [PATCH] python3-cryptography: upgrade 43.0.1 -> 43.0.3

---
 .../python/python3-cryptography-crates.inc                | 8 ++++----
 ...1-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 ...ptography_43.0.1.bb => python3-cryptography_43.0.3.bb} | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography_43.0.1.bb => python3-cryptography_43.0.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 319a47dabd..b30d96eea1 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -16,9 +16,9 @@ SRC_URI += " \
     crate://crates.io/libc/0.2.155 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/openssl/0.10.66 \
+    crate://crates.io/openssl/0.10.68 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.103 \
+    crate://crates.io/openssl-sys/0.9.104 \
     crate://crates.io/pem/3.0.4 \
     crate://crates.io/pkg-config/0.3.30 \
     crate://crates.io/portable-atomic/1.7.0 \
@@ -51,9 +51,9 @@ SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03
 SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[openssl-0.10.66.sha256sum] = "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
+SRC_URI[openssl-0.10.68.sha256sum] = "6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.103.sha256sum] = "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
+SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
 SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
 SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
 SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 253cab6005..4dcaa5d8d4 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 78d8747a8a2e483ea5a4c5bca9fbe9345f0195ed Mon Sep 17 00:00:00 2001
+From e12a40966069083ed0a3dd270d9271f9cd5a5941 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index e5b801d..985fc8c 100644
+index 03b178d..2ddcb48 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -117,7 +117,7 @@ exclude = [
diff --git a/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_43.0.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_43.0.3.bb
index af03d12a39..87dbfdab00 100644
--- a/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_43.0.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
+SRC_URI[sha256sum] = "315b9001266a492a6ff443b61238f956b214dbec9910a081ba5b6646a055a805"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.44.1


--===============3433756236782058251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-43.0.1.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info

--===============3433756236782058251==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-43.0.1-43.0.3.patch"

RnJvbSAzYmEzODU1MWYzY2JjYTBiZDZiMDBiYzA2NWJlYWU1YWFkNjBjOTU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjA6MTg6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeTogdXBncmFkZSA0My4wLjEgLT4gNDMuMC4zCgotLS0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICAgICAgICAgICAgICB8IDgg
KysrKy0tLS0KIC4uLjEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9w
dGlvbi5wYXRjaCB8IDQgKystLQogLi4ucHRvZ3JhcGh5XzQzLjAuMS5iYiA9PiBweXRob24zLWNy
eXB0b2dyYXBoeV80My4wLjMuYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1jcnlwdG9ncmFwaHlfNDMuMC4xLmJiID0+IHB5dGhvbjMtY3J5cHRvZ3JhcGh5
XzQzLjAuMy5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNyYXRlcy5pbmMKaW5kZXggMzE5YTQ3ZGFi
ZC4uYjMwZDk2ZWVhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVzLmluYwpAQCAtMTYsOSArMTYsOSBA
QCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE1NSBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtb2Zmc2V0LzAuOS4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9vbmNlX2NlbGwvMS4xOS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLzAu
MTAuNjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wvMC4xMC42OCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1tYWNyb3MvMC4xLjEgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL29wZW5zc2wtc3lzLzAuOS4xMDMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wt
c3lzLzAuOS4xMDQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BlbS8zLjAuNCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcGtnLWNvbmZpZy8wLjMuMzAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3BvcnRhYmxlLWF0b21pYy8xLjcuMCBcCkBAIC01MSw5ICs1MSw5IEBAIFNSQ19VUklbaW5kb2Mt
Mi4wLjUuc2hhMjU2c3VtXSA9ICJiMjQ4ZjUyMjRkMWQ2MDYwMDVlMDJjOTdmNWFhNGU4OGVlYjIz
MDQ4OGJjYzAzCiBTUkNfVVJJW2xpYmMtMC4yLjE1NS5zaGEyNTZzdW1dID0gIjk3YjM4ODhhNGFl
Y2Y3N2U4MTExNDVjYWRmNmVlZjU5MDFmNDc4MmM1Mzg4NjE5MWIyZjY5M2YyNDc2MTg0N2MiCiBT
UkNfVVJJW21lbW9mZnNldC0wLjkuMS5zaGEyNTZzdW1dID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5
NjA5MmY2Y2I0NDg2Nzc2MTFjZTQ0NDllOTcwY2VhZjQyNjk1MjAzZjIxOGEiCiBTUkNfVVJJW29u
Y2VfY2VsbC0xLjE5LjAuc2hhMjU2c3VtXSA9ICIzZmRiMTJiMjQ3NmI1OTVmOTM1OGM1MTYxYWE0
NjdjMjQzODg1OWNhYTEzNmRlYzg2YzI2ZmRkMmVmZTE3YjkyIgotU1JDX1VSSVtvcGVuc3NsLTAu
MTAuNjYuc2hhMjU2c3VtXSA9ICI5NTI5ZjQ3ODZiNzBhM2U4YzYxZTExMTc5YWYxN2FiNjE4OGFk
OGQwZGVkNzhjNTUyOTQ0MWVkMzlkNGJkOWMxIgorU1JDX1VSSVtvcGVuc3NsLTAuMTAuNjguc2hh
MjU2c3VtXSA9ICI2MTc0YmM0OGYxMDJkMjA4NzgzYzJjODRiZjkzMWJiNzU5MjdhNjE3ODY2ODcw
ZGU4YTRlYTg1NTk3Zjg3MWY1IgogU1JDX1VSSVtvcGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEyNTZz
dW1dID0gImE5NDg2NjZiNjM3YTBmNDY1ZTg1NjRjNzNlODlkNGRkZTAwZDcyZDRkNDczY2M5NzJm
MzkwZmMzZGNlZTdkOWMiCi1TUkNfVVJJW29wZW5zc2wtc3lzLTAuOS4xMDMuc2hhMjU2c3VtXSA9
ICI3ZjllOGRlZWU5MWRmNDBhOTQzYzcxYjkxN2U1ODc0Yjk1MWQzMmE4MDI1MjZjODU3MjFjZTNi
Nzc2YzkyOWQ2IgorU1JDX1VSSVtvcGVuc3NsLXN5cy0wLjkuMTA0LnNoYTI1NnN1bV0gPSAiNDVh
YmYzMDZjYmY5OWRlYmM4MTk1YjY2YjczNDY0OThkN2IxMGMyMTBkZTUwNDE4YjVjY2Q3Y2ViYTA4
Yzc0MSIKIFNSQ19VUklbcGVtLTMuMC40LnNoYTI1NnN1bV0gPSAiOGU0NTkzNjVlNTkwNzM2YTU0
YzNmYTU2MTk0N2M4NDgzNzUzNGI4ZTlhZjZmYzViZjc4MTMwN2U4MjY1OGZhZSIKIFNSQ19VUklb
cGtnLWNvbmZpZy0wLjMuMzAuc2hhMjU2c3VtXSA9ICJkMjMxYjIzMDkyN2I1ZTRhZDIwM2RiNTdi
YmNiZWUyODAyZjZiY2U2MjBiMWU0YTkwMjRhMDdkOTRlMjkwN2VjIgogU1JDX1VSSVtwb3J0YWJs
ZS1hdG9taWMtMS43LjAuc2hhMjU2c3VtXSA9ICJkYTU0NGVlMjE4ZjBkMjg3YTkxMWU5Yzk5YTM5
YThjOWJjOGZjYWQzY2I4ZGI1OTU5OTQwMDQ0ZWNmYzY3MjY1IgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVj
dC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRv
bWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAppbmRleCAyNTNjYWI2MDA1
Li40ZGNhYTVkOGQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1k
aXNhYmxlLW9wdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1k
aXNhYmxlLW9wdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzhkODc0N2E4YTJlNDgz
ZWE1YTRjNWJjYTlmYmU5MzQ1ZjAxOTVlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZTEyYTQwOTY2MDY5MDgzZWQwYTNkZDI3MGQ5MjcxZjljZDVhNTk0MSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiBEYXRl
OiBUdWUsIDE3IE1heSAyMDIyIDE3OjIyOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5cHJv
amVjdC50b21sOiByZW1vdmUgLS1iZW5jaG1hcmstZGlzYWJsZSBvcHRpb24KQEAgLTI2LDcgKzI2
LDcgQEAgU2lnbmVkLW9mZi1ieTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9weXByb2plY3QudG9tbCBiL3B5cHJvamVjdC50b21sCi1pbmRleCBlNWI4MDFkLi45
ODVmYzhjIDEwMDY0NAoraW5kZXggMDNiMTc4ZC4uMmRkY2I0OCAxMDA2NDQKIC0tLSBhL3B5cHJv
amVjdC50b21sCiArKysgYi9weXByb2plY3QudG9tbAogQEAgLTExNyw3ICsxMTcsNyBAQCBleGNs
dWRlID0gWwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeV80My4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5XzQzLjAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzQz
LjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeV80My4wLjMuYmIKaW5kZXggYWYwM2QxMmEzOS4uODdkYmZkYWIwMCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV80
My4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeV80My4wLjMuYmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICAgICAg
ICAgICAgICAgICAgICAiCiBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIyMDNlOTJhNzU3MTZkOGNmYjQ5MWRjNDdjNzllMTdkMGQ5MjA3Y2NmZmNiY2IzNWY1
OThmYmU0NjNhZTM0NDRkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMxNWI5MDAxMjY2YTQ5MmE2
ZmY0NDNiNjEyMzhmOTU2YjIxNGRiZWM5OTEwYTA4MWJhNWI2NjQ2YTA1NWE4MDUiCiAKIFNSQ19V
UkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJs
ZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAgZmlsZTovL2NoZWNrLW1lbWZyZWUucHkgXAot
LSAKMi40NC4xCgo=

--===============3433756236782058251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-43.0.1.tar.gz;downloadfilename=cryptography-43.0.1.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.16.2 crate://crates.io/asn1_derive/0.16.2 crate://crates.io/autocfg/1.3.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.1.6 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/openssl/0.10.66 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.103 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.30 crate://crates.io/portable-atomic/1.7.0 crate:/
 /crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.2 crate://crates.io/pyo3-build-config/0.22.2 crate://crates.io/pyo3-ffi/0.22.2 crate://crates.io/pyo3-macros/0.22.2 crate://crates.io/pyo3-macros-backend/0.22.2 crate://crates.io/quote/1.0.36 crate://crates.io/self_cell/1.0.4 crate://crates.io/syn/2.0.71 crate://crates.io/target-lexicon/0.12.15 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-43.0.3.tar.gz;downloadfilename=cryptography-43.0.3.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.16.2 crate://crates.io/asn1_derive/0.16.2 crate://crates.io/autocfg/1.3.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.1.6 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shar
 ed/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.30 crate://crates.io/portable-atomic/1.7.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.2 crate://crates.io/pyo3-build-config/0.22.2 crate://crates.io/pyo3-ffi/0.22.2 crate://crates.io/pyo3-macros/0.22.2 crate://crates.io/pyo3-macros-backend/0.22.2 crate://crates.io/quote/1.0.36 crate://crates.io/self_cell/1.0.4 crate://crates.io/syn/2.0.71 crate://crates.io/target-lexicon/0.12.15 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1048080 to 1047232 (-0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1678250 to 1678295 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "43.0.1" to "43.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 43.0.1 [default] to 43.0.3 [default]
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-43.0.1.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info

--===============3433756236782058251==--

