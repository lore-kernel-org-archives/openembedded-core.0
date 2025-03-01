Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC3EC35FF0
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7048.1740828319010136327
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ey0mwGaq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RHIEeusS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019551743f4a-beff060e-f6d5-4bc0-8810-2b38b90eca1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SHD6JKPFyKvXN9LmIewb5OR0fQ/BN70L2xU6Dd7JiFE=;
	b=Ey0mwGaqwqwMsgHCI++hRMWNVLfqmgqVfMA5ePb9D6NQ0ec6rEI/AYuUfUm9cf91
	9Hx1Vnw6O8kpSEAsUUuCIxF1xMxjN5aOdnLMDAt8234NOZzXfx4r/GNFpownzLADYJo
	Hu1b3KQf8JeVn/7r8BABpRsi6EFo3b6iqpLTU2Ek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SHD6JKPFyKvXN9LmIewb5OR0fQ/BN70L2xU6Dd7JiFE=;
	b=RHIEeusSKormmX9LhFMVeLHmtesGLv0JOCBzB97F7P7tbRx3hnfmfLdV6KW40CHz
	Xdeydj8N7/hn2bngh1hD1lj5gzMbTtnGHIR5aQXGGV879Zkteqp0gSqWBQmdOafoMmA
	euWnr4irKH37KEy6c6XcDkr/ug/aNHiIf0cLqTcA=
Content-Type: multipart/mixed; boundary="===============0636865253654632952=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 75.8.2 SUCCEEDED
Message-ID: <0101019551743f4a-beff060e-f6d5-4bc0-8810-2b38b90eca1a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212130

--===============0636865253654632952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *75.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-75.8.0-75.8.2.patch
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
From 055b910c9f0ee5f72a78e27759a996e7226029b9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 08:12:32 +0000
Subject: [PATCH] python3-setuptools: upgrade 75.8.0 -> 75.8.2

---
 ...istutils-sysconfig.py-make-it-possible-to-substite.patch | 4 ++--
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 ...n3-setuptools_75.8.0.bb => python3-setuptools_75.8.2.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_75.8.0.bb => python3-setuptools_75.8.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index f5f110d691..3f8ff2eee7 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From b84b849dc72d2523f18fdbbbd28a2cd975596d08 Mon Sep 17 00:00:00 2001
+From 737bcfaef99feb47db9b2c6d695930be7f165115 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index da1eecb..bb02a09 100644
+index ef3def8..577d320 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -122,6 +122,8 @@ def get_python_inc(plat_specific=False, prefix=None):
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index f320bf4e6f..ebb1e025bc 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 9441848a121912b6627c7188ab95595684c8306b Mon Sep 17 00:00:00 2001
+From 132537f9a85d1e0579d28c5229adda9c813448ee Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -20,10 +20,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 66fe68f..8647c20 100644
+index eb1b4c1..4fd8d14 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -673,6 +673,11 @@ class easy_install(Command):
+@@ -672,6 +672,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and _rmtree(tmpdir)
  
      def easy_install(self, spec, deps: bool = False) -> Distribution | None:
diff --git a/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb b/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_75.8.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
index 02e299d0be..e9e6e9b2b6 100644
--- a/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "c5afc8f407c626b8313a86e10311dd3f661c6cd9c09d4bf8c15c0e11f9f2b0e6"
+SRC_URI[sha256sum] = "4880473a969e5f23f2a2be3646b2dfd84af9028716d398e46192f84bc36900d2"
 
 DEPENDS += "python3"
 
-- 
2.44.1


--===============0636865253654632952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-75.8.0.tar.gz;downloadfilename=setuptools-75.8.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-75.8.2.tar.gz;downloadfilename=setuptools-75.8.2.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-64-poky-linux/python3-setuptools: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 452961 to 457747 (+1%)
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 8273782 to 8273743 (-0%)
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PV changed from "75.8.0" to "75.8.2"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 75.8.0 [default] to 75.8.2 [default]
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.13/site-packages/setuptools-75.8.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools-75.8.2.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools-75.8.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools-75.8.2.dist-info

--===============0636865253654632952==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-75.8.0-75.8.2.patch"

RnJvbSAwNTViOTEwYzlmMGVlNWY3MmE3OGUyNzc1OWE5OTZlNzIyNjAyOWI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwODoxMjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA3NS44LjAgLT4gNzUuOC4yCgotLS0KIC4uLmlzdHV0
aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIHwgNCAr
Ky0tCiAuLi4wMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaCB8IDYgKysrLS0tCiAuLi5uMy1zZXR1cHRvb2xzXzc1LjguMC5iYiA9PiBweXRob24z
LXNldHVwdG9vbHNfNzUuOC4yLmJifSB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtc2V0dXB0b29sc183NS44LjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzc1
LjguMi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQt
cG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQt
cG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gKaW5kZXggZjVmMTEwZDY5MS4uM2Y4ZmYyZWVlNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0
aXRlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1z
dWJzdGl0ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjg0Yjg0OWRjNzJkMjUyM2YxOGZk
YmJiZDI4YTJjZDk3NTU5NmQwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzM3YmNm
YWVmOTlmZWI0N2RiOWIyYzZkNjk1OTMwYmU3ZjE2NTExNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBX
ZWQsIDExIE1heSAyMDIyIDIxOjQxOjE0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIF9kaXN0dXRp
bHMvc3lzY29uZmlnLnB5OiBtYWtlIGl0IHBvc3NpYmxlIHRvIHN1YnN0aXRlIHRoZQpAQCAtMjAs
NyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJv
bml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weSBiL3Nl
dHVwdG9vbHMvX2Rpc3R1dGlscy9zeXNjb25maWcucHkKLWluZGV4IGRhMWVlY2IuLmJiMDJhMDkg
MTAwNjQ0CitpbmRleCBlZjNkZWY4Li41NzdkMzIwIDEwMDY0NAogLS0tIGEvc2V0dXB0b29scy9f
ZGlzdHV0aWxzL3N5c2NvbmZpZy5weQogKysrIGIvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2Nv
bmZpZy5weQogQEAgLTEyMiw2ICsxMjIsOCBAQCBkZWYgZ2V0X3B5dGhvbl9pbmMocGxhdF9zcGVj
aWZpYz1GYWxzZSwgcHJlZml4PU5vbmUpOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1m
ZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gt
Y29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKaW5kZXggZjMyMGJmNGU2Zi4uZWJiMWUwMjViYyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NDQxODQ4YTEyMTkxMmI2NjI3YzcxODhhYjk1NTk1
Njg0YzgzMDZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMzI1MzdmOWE4NWQxZTA1
NzlkMjhjNTIyOWFkZGE5YzgxMzQ0OGVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
SG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwg
MjAxOCAxMDoxMzozOCArMDgwMAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5v
dCBmZXRjaCBjb2RlIGJ5IGVhc3lfaW5zdGFsbApAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc2V0dXB0b29scy9jb21tYW5k
L2Vhc3lfaW5zdGFsbC5weSBiL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkKLWlu
ZGV4IDY2ZmU2OGYuLjg2NDdjMjAgMTAwNjQ0CitpbmRleCBlYjFiNGMxLi40ZmQ4ZDE0IDEwMDY0
NAogLS0tIGEvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5weQogKysrIGIvc2V0dXB0
b29scy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5weQotQEAgLTY3Myw2ICs2NzMsMTEgQEAgY2xhc3Mg
ZWFzeV9pbnN0YWxsKENvbW1hbmQpOgorQEAgLTY3Miw2ICs2NzIsMTEgQEAgY2xhc3MgZWFzeV9p
bnN0YWxsKENvbW1hbmQpOgogICAgICAgICAgICAgIG9zLnBhdGguZXhpc3RzKHRtcGRpcikgYW5k
IF9ybXRyZWUodG1wZGlyKQogIAogICAgICBkZWYgZWFzeV9pbnN0YWxsKHNlbGYsIHNwZWMsIGRl
cHM6IGJvb2wgPSBGYWxzZSkgLT4gRGlzdHJpYnV0aW9uIHwgTm9uZToKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzc1LjguMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzc1LjguMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183NS44LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzc1LjguMi5iYgppbmRleCAwMmUy
OTlkMGJlLi5lOWU2ZTliMmI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2V0dXB0b29sc183NS44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzUuOC4yLmJiCkBAIC0xMyw3ICsxMyw3IEBA
IFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lCiBTUkNfVVJJICs9ICIgXAogICAgICAgICAgICAgZmls
ZTovLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJz
dGl0ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM1YWZjOGY0MDdjNjI2YjgzMTNh
ODZlMTAzMTFkZDNmNjYxYzZjZDljMDlkNGJmOGMxNWMwZTExZjlmMmIwZTYiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNDg4MDQ3M2E5NjllNWYyM2YyYTJiZTM2NDZiMmRmZDg0YWY5MDI4NzE2ZDM5
OGU0NjE5MmY4NGJjMzY5MDBkMiIKIAogREVQRU5EUyArPSAicHl0aG9uMyIKIAotLSAKMi40NC4x
Cgo=

--===============0636865253654632952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.13/site-packages/setuptools-75.8.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools-75.8.2.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools-75.8.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools-75.8.2.dist-info

--===============0636865253654632952==--

