Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0156ACDE000
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 05:40:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.685.1782279613197070786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 22:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=leaiyvV0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jrwdpRaM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ef824a682-dba30ed1-5b07-4df3-8c56-082db4a98675-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782279612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cIqbwItMFKNWIimCXD2HT6I/TQdoP3HZ3W9tUgoeSAc=;
	b=leaiyvV0vIv711LOg9+o7CvP+kglKg4NqzvPMM1Rx4cmKpKwFOjCd5e2D3LdlIlh
	vMpyNh/L0EYH4zJQMMBlD1IdaRXRMCv8IpQAQblchdYexM+Jzi9ZR/wPYKTwgCdnR7H
	oNgH6OgZ2/62GVKjETqP+iMbU16AtP12i52n6JMU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782279612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cIqbwItMFKNWIimCXD2HT6I/TQdoP3HZ3W9tUgoeSAc=;
	b=jrwdpRaMNaZNqKw0qxxjfHg+ec0d8ecM4fXuIPb/aW2OmZj/KTDb4Cmu99A+DkmM
	jBRK8mVpGKQ6pRAl+T1cZbLuiRHnp+OETydHxxabN9GTqyK6ngrdKKH8xqWHLwzuno+
	Xr5VVdwwT1KmYSGeL6Is2eiJgB7bfTt9D2TJZaa4=
Content-Type: multipart/mixed; boundary="===============6694212075875374963=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-spdx-python-model: upgrading to 0.0.6 SUCCEEDED
Message-ID: <0101019ef824a682-dba30ed1-5b07-4df3-8c56-082db4a98675-000000@us-west-2.amazonses.com>
Date: Wed, 24 Jun 2026 05:40:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.24-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 05:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239468

--===============6694212075875374963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-spdx-python-model* to *0.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-spdx-python-model-upgrade-0.0.5-0.0.6.patch
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
From 67713a5e059eac56464b760aac6943427420585c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 24 Jun 2026 05:25:27 +0000
Subject: [PATCH] python3-spdx-python-model: upgrade 0.0.5 -> 0.0.6

---
 ...pdate-shacl2code-to-1.1.0-and-add-ke.patch | 41 -------------------
 ....bb => python3-spdx-python-model_0.0.6.bb} |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
 rename meta/recipes-devtools/python/{python3-spdx-python-model_0.0.5.bb => python3-spdx-python-model_0.0.6.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
deleted file mode 100644
index d9dc0a03c8..0000000000
--- a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b623473f634aebeb30028cc746fb7a3da4fb2ce3 Mon Sep 17 00:00:00 2001
-From: Arthit Suriyawongkul <arthit@gmail.com>
-Date: Sat, 6 Jun 2026 02:44:48 +0100
-Subject: [PATCH] pyproject.toml: Update shacl2code to 1.1.0 and add keywords
- (#35)
-
-Signed-off-by: Arthit Suriyawongkul <arthit@gmail.com>
-Upstream-Status: Backport [https://github.com/spdx/spdx-python-model/commit/2d7b71a7c8e6270a1c8795cdeb4f3dcd9393b3a9]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- pyproject.toml | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index c8b3e56..df011e8 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -8,6 +8,14 @@ authors = [
-     {name = "Joshua Watt", email = "JPEWhacker@gmail.com"},
- ]
- readme = "README.md"
-+keywords = [
-+    "spdx",
-+    "sbom",
-+    "spdx3",
-+    "software-bill-of-materials",
-+    "shacl2code",
-+    "bindings",
-+]
- classifiers = [
-     "Development Status :: 4 - Beta",
-     "Intended Audience :: Developers",
-@@ -36,7 +44,7 @@ Issues = "https://github.com/spdx/spdx-python-model/issues"
- requires = [
-     "hatchling >= 1.27.0",
-     "hatch-build-scripts >= 0.0.4",
--    "shacl2code == 1.0.1",
-+    "shacl2code == 1.1.0",
- ]
- build-backend = "hatchling.build"
- 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
rename to meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
index 19d9bb815b..7e2502ced9 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
@@ -5,12 +5,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 PYPI_PACKAGE = "spdx_python_model"
-SRC_URI[sha256sum] = "4bcf7c6e5e2e8f0b787ed4eb8fb519e2ed776e820cb6d9eb93e44e98eb92ca2d"
+SRC_URI[sha256sum] = "f1938eb08d08218278122849bba123b8993a0171e9b4f5ea6af7aeb71f3204d7"
 
 SRC_URI += "https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
            https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
            https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
-           file://0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch \
            "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
-- 
2.47.1


--===============6694212075875374963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model: FILELIST: directory renamed /usr/lib/python3.14/site-packages/spdx_python_model-0.0.5.dist-info -> /usr/lib/python3.14/site-packages/spdx_python_model-0.0.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/spdx_python_model-0.0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/spdx_python_model-0.0.6.dist-info/licenses, added "/usr/lib/python3.14/site-packages/spdx_python_model/bindings/_reexport.pyi"
Changes to packages/x86-64-v3-poky-linux/python3-spdx-python-model (sysroot):
  /usr/lib/python3.14/site-packages/spdx_python_model-0.0.5.dist-info moved to /usr/lib/python3.14/site-packages/spdx_python_model-0.0.6.dist-info
  /usr/lib/python3.14/site-packages/spdx_python_model/bindings/_reexport.pyi was added

--===============6694212075875374963==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-spdx-python-model-upgrade-0.0.5-0.0.6.patch"

RnJvbSA2NzcxM2E1ZTA1OWVhYzU2NDY0Yjc2MGFhYzY5NDM0Mjc0MjA1ODVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjQgSnVuIDIwMjYgMDU6MjU6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwZHgtcHl0aG9uLW1vZGVsOiB1cGdyYWRlIDAuMC41IC0+IDAuMC42CgotLS0KIC4u
LnBkYXRlLXNoYWNsMmNvZGUtdG8tMS4xLjAtYW5kLWFkZC1rZS5wYXRjaCB8IDQxIC0tLS0tLS0t
LS0tLS0tLS0tLS0KIC4uLi5iYiA9PiBweXRob24zLXNwZHgtcHl0aG9uLW1vZGVsXzAuMC42LmJi
fSB8ICAzICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0MyBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BkeC1weXRob24tbW9kZWwvMDAwMS1weXByb2plY3QudG9tbC1VcGRhdGUtc2hhY2wyY29k
ZS10by0xLjEuMC1hbmQtYWRkLWtlLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy1zcGR4LXB5dGhvbi1tb2RlbF8wLjAuNS5iYiA9PiBweXRob24zLXNw
ZHgtcHl0aG9uLW1vZGVsXzAuMC42LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXB5dGhvbi1tb2RlbC8wMDAxLXB5cHJvamVj
dC50b21sLVVwZGF0ZS1zaGFjbDJjb2RlLXRvLTEuMS4wLWFuZC1hZGQta2UucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BkeC1weXRob24tbW9kZWwvMDAwMS1w
eXByb2plY3QudG9tbC1VcGRhdGUtc2hhY2wyY29kZS10by0xLjEuMC1hbmQtYWRkLWtlLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkOWRjMGEwM2M4Li4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXB5dGhvbi1tb2Rl
bC8wMDAxLXB5cHJvamVjdC50b21sLVVwZGF0ZS1zaGFjbDJjb2RlLXRvLTEuMS4wLWFuZC1hZGQt
a2UucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MSArMCwwIEBACi1Gcm9tIGI2MjM0NzNmNjM0
YWViZWIzMDAyOGNjNzQ2ZmI3YTNkYTRmYjJjZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBBcnRoaXQgU3VyaXlhd29uZ2t1bCA8YXJ0aGl0QGdtYWlsLmNvbT4KLURhdGU6IFNhdCwg
NiBKdW4gMjAyNiAwMjo0NDo0OCArMDEwMAotU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9t
bDogVXBkYXRlIHNoYWNsMmNvZGUgdG8gMS4xLjAgYW5kIGFkZCBrZXl3b3JkcwotICgjMzUpCi0K
LVNpZ25lZC1vZmYtYnk6IEFydGhpdCBTdXJpeWF3b25na3VsIDxhcnRoaXRAZ21haWwuY29tPgot
VXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3NwZHgvc3BkeC1w
eXRob24tbW9kZWwvY29tbWl0LzJkN2I3MWE3YzhlNjI3MGExYzg3OTVjZGViNGYzZGNkOTM5M2Iz
YTldCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
PgotLS0tCi0gcHlwcm9qZWN0LnRvbWwgfCAxMCArKysrKysrKystCi0gMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvcHlwcm9qZWN0
LnRvbWwgYi9weXByb2plY3QudG9tbAotaW5kZXggYzhiM2U1Ni4uZGYwMTFlOCAxMDA2NDQKLS0t
LSBhL3B5cHJvamVjdC50b21sCi0rKysgYi9weXByb2plY3QudG9tbAotQEAgLTgsNiArOCwxNCBA
QCBhdXRob3JzID0gWwotICAgICB7bmFtZSA9ICJKb3NodWEgV2F0dCIsIGVtYWlsID0gIkpQRVdo
YWNrZXJAZ21haWwuY29tIn0sCi0gXQotIHJlYWRtZSA9ICJSRUFETUUubWQiCi0ra2V5d29yZHMg
PSBbCi0rICAgICJzcGR4IiwKLSsgICAgInNib20iLAotKyAgICAic3BkeDMiLAotKyAgICAic29m
dHdhcmUtYmlsbC1vZi1tYXRlcmlhbHMiLAotKyAgICAic2hhY2wyY29kZSIsCi0rICAgICJiaW5k
aW5ncyIsCi0rXQotIGNsYXNzaWZpZXJzID0gWwotICAgICAiRGV2ZWxvcG1lbnQgU3RhdHVzIDo6
IDQgLSBCZXRhIiwKLSAgICAgIkludGVuZGVkIEF1ZGllbmNlIDo6IERldmVsb3BlcnMiLAotQEAg
LTM2LDcgKzQ0LDcgQEAgSXNzdWVzID0gImh0dHBzOi8vZ2l0aHViLmNvbS9zcGR4L3NwZHgtcHl0
aG9uLW1vZGVsL2lzc3VlcyIKLSByZXF1aXJlcyA9IFsKLSAgICAgImhhdGNobGluZyA+PSAxLjI3
LjAiLAotICAgICAiaGF0Y2gtYnVpbGQtc2NyaXB0cyA+PSAwLjAuNCIsCi0tICAgICJzaGFjbDJj
b2RlID09IDEuMC4xIiwKLSsgICAgInNoYWNsMmNvZGUgPT0gMS4xLjAiLAotIF0KLSBidWlsZC1i
YWNrZW5kID0gImhhdGNobGluZy5idWlsZCIKLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXB5dGhvbi1tb2RlbF8wLjAuNS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXB5dGhvbi1tb2RlbF8wLjAuNi5i
YgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc3BkeC1weXRob24tbW9kZWxfMC4wLjUuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXB5dGhvbi1tb2RlbF8wLjAuNi5i
YgppbmRleCAxOWQ5YmI4MTViLi43ZTI1MDJjZWQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BkeC1weXRob24tbW9kZWxfMC4wLjUuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwZHgtcHl0aG9uLW1vZGVsXzAu
MC42LmJiCkBAIC01LDEyICs1LDExIEBAIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2
OGY0MzI3IgogCiBQWVBJX1BBQ0tBR0UgPSAic3BkeF9weXRob25fbW9kZWwiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNGJjZjdjNmU1ZTJlOGYwYjc4N2VkNGViOGZiNTE5ZTJlZDc3NmU4MjBjYjZk
OWViOTNlNDRlOThlYjkyY2EyZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMTkzOGViMDhkMDgy
MTgyNzgxMjI4NDliYmExMjNiODk5M2EwMTcxZTliNGY1ZWE2YWY3YWViNzFmMzIwNGQ3IgogCiBT
UkNfVVJJICs9ICJodHRwczovL3NwZHgub3JnL3JkZi8zLjAuMS9zcGR4LWNvbnRleHQuanNvbmxk
O25hbWU9c3BkeDEgXAogICAgICAgICAgICBodHRwczovL3NwZHgub3JnL3JkZi8zLjAuMS9zcGR4
LWpzb24tc2VyaWFsaXplLWFubm90YXRpb25zLnR0bDtuYW1lPXNwZHgyIFwKICAgICAgICAgICAg
aHR0cHM6Ly9zcGR4Lm9yZy9yZGYvMy4wLjEvc3BkeC1tb2RlbC50dGw7bmFtZT1zcGR4MyBcCi0g
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXB5cHJvamVjdC50b21sLVVwZGF0ZS1zaGFjbDJjb2RlLXRv
LTEuMS4wLWFuZC1hZGQta2UucGF0Y2ggXAogICAgICAgICAgICAiCiAKIFNSQ19VUklbc3BkeDEu
c2hhMjU2c3VtXSA9ICJjNzJiMDkyOGYwOTRjODNlNWMxMjc3ODRlZGIxZWJjYTJhZjc0YTEwNGZj
YWNjMDA3YzMzMmIyM2NiYzc4OGJkIgotLSAKMi40Ny4xCgo=

--===============6694212075875374963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-spdx-python-model: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/spdx_python_model/spdx_python_model-0.0.5.tar.gz;downloadfilename=spdx_python_model-0.0.5.tar.gz https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 file://0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch" to "https://files.pythonhosted.org/packages/source/s/spdx_python_model/spdx_python_model-0.0.6.tar.gz;downloadfilename=spdx_python_model-0.0.6.tar.gz https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-dbg: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-dbg: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-dev: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-dev: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-doc: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-doc: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-locale: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-locale: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-src: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-src: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-staticdev: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model-staticdev: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model: PKGSIZE changed from 739564 to 751012 (+2%)
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model: PV changed from "0.0.5" to "0.0.6"
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model: PKGV changed from 0.0.5 [default] to 0.0.6 [default]
packages/x86-64-v3-poky-linux/python3-spdx-python-model/python3-spdx-python-model: FILELIST: directory renamed /usr/lib/python3.14/site-packages/spdx_python_model-0.0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/spdx_python_model-0.0.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/spdx_python_model-0.0.5.dist-info -> /usr/lib/python3.14/site-packages/spdx_python_model-0.0.6.dist-info, added "/usr/lib/python3.14/site-packages/spdx_python_model/bindings/_reexport.pyi"
Changes to packages/x86-64-v3-poky-linux/python3-spdx-python-model (sysroot):
  /usr/lib/python3.14/site-packages/spdx_python_model-0.0.5.dist-info moved to /usr/lib/python3.14/site-packages/spdx_python_model-0.0.6.dist-info
  /usr/lib/python3.14/site-packages/spdx_python_model/bindings/_reexport.pyi was added

--===============6694212075875374963==--

