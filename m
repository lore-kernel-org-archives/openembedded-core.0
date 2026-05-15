Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBC3CD5BAF
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34756.1778851226279965805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LKlyxc0M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kihAYKkF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcbc0bb-53ef7176-dacd-4352-80b1-ab120f1bec0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p6mON5hlmEr/ftp1tmUgj62wkWKawuYk1t4JbNlYpSQ=;
	b=LKlyxc0MxeprIpad826TrSbV2ARy/jejgLRjwHHw0X/+Z9sPZZ/f0IiDMglWcgcH
	oq+gSM4GkukYkK5xpWG1oKTgMPGZfuzh0AKr0ECpr9hZDDNCLFWG02uGND8myaeZd9P
	ILQsBnzeFFyX63Xl1uLGqASthCdF2wWjvTewuwkc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p6mON5hlmEr/ftp1tmUgj62wkWKawuYk1t4JbNlYpSQ=;
	b=kihAYKkFr8zxcR30IQu4aDJYRew7MPUHHEz4ej1F8eCJ4cMgVhk8uQxs43msLYEM
	TgPoYB6ao24zgLOjAIFz0+hX5djWd7V9wQzuZ8/v6lX2hLOrvPq25BjUlA41NnhSVeL
	7F5NVygnJO5DOsI9OuTllrpmOfDsNPWJWOQ+Mo+Q=
Content-Type: multipart/mixed; boundary="===============0108358519574999159=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.7.0 SUCCEEDED
Message-ID: <0101019e2bcbc0bb-53ef7176-dacd-4352-80b1-ab120f1bec0f-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237128

--===============0108358519574999159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.6.3-2.7.0.patch
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
From a05ce0c152e9f5087fedb95f085a740265e32640 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 09:09:13 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.6.3 -> 2.7.0

---
 ...ml-remove-setuptools-scm-upper-limit.patch | 30 -------------------
 ...lib3_2.6.3.bb => python3-urllib3_2.7.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
 rename meta/recipes-devtools/python/{python3-urllib3_2.6.3.bb => python3-urllib3_2.7.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch b/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
deleted file mode 100644
index 62c7e3d68d..0000000000
--- a/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7a4a7fddff72413bac190ad14bca8fca2d1461e3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
-Date: Wed, 1 Apr 2026 19:09:22 +0200
-Subject: [PATCH] Allow using setuptools_scm 10 (#4954)
-
-Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/166f66faa5ef23e255f654e8c6b66ad8590fe630]
-
-It works in Fedora, so I hope it will work upstream as well.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 45538a6e..d2607c78 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,7 +1,7 @@
- # This file is protected via CODEOWNERS
- 
- [build-system]
--requires = ["hatchling>=1.27.0,<2", "hatch-vcs>=0.4.0,<0.6.0", "setuptools-scm>=8,<10"]
-+requires = ["hatchling>=1.27.0,<2", "hatch-vcs>=0.4.0,<0.6.0", "setuptools-scm>=8,<11"]
- build-backend = "hatchling.build"
- 
- [project]
--- 
-2.53.0
-
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
index b8028efece..dcc6bbe27b 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
@@ -3,11 +3,9 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
+SRC_URI[sha256sum] = "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
 
-SRC_URI += "\
-    file://0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch \
-"
+SRC_URI += "${PYPI_SRC_URI}"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============0108358519574999159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-urllib3: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.6.3.tar.gz;downloadfilename=urllib3-2.6.3.tar.gz file://0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.7.0.tar.gz;downloadfilename=urllib3-2.7.0.tar.gz https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.7.0.tar.gz;downloadfilename=urllib3-2.7.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.6.3" to "2.7.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.6.3 [default] to 2.7.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 946711 to 944920 (-0%)
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.14/site-packages/urllib3-2.6.3.dist-info -> /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/urllib3-2.6.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.14/site-packages/urllib3-2.6.3.dist-info moved to /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/WHEEL was removed

--===============0108358519574999159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.14/site-packages/urllib3-2.6.3.dist-info -> /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/urllib3-2.6.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.14/site-packages/urllib3-2.6.3.dist-info moved to /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/WHEEL was removed

--===============0108358519574999159==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.6.3-2.7.0.patch"

RnJvbSBhMDVjZTBjMTUyZTlmNTA4N2ZlZGI5NWYwODVhNzQwMjY1ZTMyNjQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDk6MDk6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi42LjMgLT4gMi43LjAKCi0tLQogLi4ubWwtcmVtb3Zl
LXNldHVwdG9vbHMtc2NtLXVwcGVyLWxpbWl0LnBhdGNoIHwgMzAgLS0tLS0tLS0tLS0tLS0tLS0t
LQogLi4ubGliM18yLjYuMy5iYiA9PiBweXRob24zLXVybGxpYjNfMi43LjAuYmJ9IHwgIDYgKyst
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxs
aWIzLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLXNldHVwdG9vbHMtc2NtLXVwcGVyLWxpbWl0
LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxs
aWIzXzIuNi4zLmJiID0+IHB5dGhvbjMtdXJsbGliM18yLjcuMC5iYn0gKDgzJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliMy8wMDAxLXB5
cHJvamVjdC50b21sLXJlbW92ZS1zZXR1cHRvb2xzLXNjbS11cHBlci1saW1pdC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzLzAwMDEtcHlwcm9qZWN0
LnRvbWwtcmVtb3ZlLXNldHVwdG9vbHMtc2NtLXVwcGVyLWxpbWl0LnBhdGNoCmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCA2MmM3ZTNkNjhkLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzLzAwMDEtcHlwcm9qZWN0LnRvbWwt
cmVtb3ZlLXNldHVwdG9vbHMtc2NtLXVwcGVyLWxpbWl0LnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsMzAgKzAsMCBAQAotRnJvbSA3YTRhN2ZkZGZmNzI0MTNiYWMxOTBhZDE0YmNhOGZjYTJkMTQ2
MWUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP01pcm89MjBIcm9u
PUM0PThEb2s/PSA8bWlyb0Bocm9uY29rLmN6PgotRGF0ZTogV2VkLCAxIEFwciAyMDI2IDE5OjA5
OjIyICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIEFsbG93IHVzaW5nIHNldHVwdG9vbHNfc2NtIDEw
ICgjNDk1NCkKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29t
L3VybGxpYjMvdXJsbGliMy9jb21taXQvMTY2ZjY2ZmFhNWVmMjNlMjU1ZjY1NGU4YzZiNjZhZDg1
OTBmZTYzMF0KLQotSXQgd29ya3MgaW4gRmVkb3JhLCBzbyBJIGhvcGUgaXQgd2lsbCB3b3JrIHVw
c3RyZWFtIGFzIHdlbGwuCi0KLVNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+Ci0tLS0KLSBweXByb2plY3QudG9tbCB8IDIgKy0KLSAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3B5cHJv
amVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IDQ1NTM4YTZlLi5kMjYwN2M3OCAxMDA2
NDQKLS0tLSBhL3B5cHJvamVjdC50b21sCi0rKysgYi9weXByb2plY3QudG9tbAotQEAgLTEsNyAr
MSw3IEBACi0gIyBUaGlzIGZpbGUgaXMgcHJvdGVjdGVkIHZpYSBDT0RFT1dORVJTCi0gCi0gW2J1
aWxkLXN5c3RlbV0KLS1yZXF1aXJlcyA9IFsiaGF0Y2hsaW5nPj0xLjI3LjAsPDIiLCAiaGF0Y2gt
dmNzPj0wLjQuMCw8MC42LjAiLCAic2V0dXB0b29scy1zY20+PTgsPDEwIl0KLStyZXF1aXJlcyA9
IFsiaGF0Y2hsaW5nPj0xLjI3LjAsPDIiLCAiaGF0Y2gtdmNzPj0wLjQuMCw8MC42LjAiLCAic2V0
dXB0b29scy1zY20+PTgsPDExIl0KLSBidWlsZC1iYWNrZW5kID0gImhhdGNobGluZy5idWlsZCIK
LSAKLSBbcHJvamVjdF0KLS0tIAotMi41My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNi4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi43LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxp
YjNfMi42LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11cmxsaWIzXzIuNy4wLmJiCmluZGV4IGI4MDI4ZWZlY2UuLmRjYzZiYmUyN2IgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNi4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNy4w
LmJiCkBAIC0zLDExICszLDkgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3VybGxp
YjMvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS50eHQ7bWQ1PTUyZDI3M2EzMDU0Y2VkNTYxMjc1ZDRkMTUyNjBlY2RhIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMWI2MmI2ODg0OTQ0YTU3ZGJlMzIxNTA5YWI5NGZkNGQzYjMwNzA3
NWUwYzJlYWU5OTFhYzcxZWUxNWFkMzhlZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzFlMGVj
M2I2M2NlYjE0NjY3YzY3YmU2MGYyZjJjNDBhNTE4Y2IzOGIwM2FmNjBhYmM4MTNkYTI2NTA1ZjRj
IgogCi1TUkNfVVJJICs9ICJcCi0gICAgZmlsZTovLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3Zl
LXNldHVwdG9vbHMtc2NtLXVwcGVyLWxpbWl0LnBhdGNoIFwKLSIKK1NSQ19VUkkgKz0gIiR7UFlQ
SV9TUkNfVVJJfSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4x
Cgo=

--===============0108358519574999159==--

