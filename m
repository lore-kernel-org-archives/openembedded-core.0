Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246C9C53212
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.75489.1722536824739205191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ko6H8xDV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lwYLq43u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101910f320ed5-59080ffb-945f-4f12-acd3-574ac762559a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536824;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ala7ZoBb8ebiD2oANfeMAZ+umVQI8VS+n7+MvY+CGV4=;
	b=Ko6H8xDVrwxKe6Wln6eU2tXG/Um8uuLgqO84CaWWn7CbHKRHGc6GB89V5RiLYsWR
	djkk/1W1L1JDdhVjKZquMuwAAjg+MEkQI4vKRKpqCk3A+WzJ9mTwDnGiuk8Vj/GwRDy
	5Agjb9yLSohBfcMKxkkuVQX9wLkeIxvgxrdHx6G4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536824;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ala7ZoBb8ebiD2oANfeMAZ+umVQI8VS+n7+MvY+CGV4=;
	b=lwYLq43u0AsBx55fDyVBGQIt6LTxNmkR9o5XS/hZLntYb1YjRoi0LFNNPr+wo+wM
	54hA1fvqMiShP4psIfn04uCgFfH+1xVDLNo3+Eon+WePY+g5ChkJxprnaEjtA19LWsM
	W/yRi3FEvARuAujLiQkvPlsoFIOoOPYNPcyFoBnk=
Content-Type: multipart/mixed; boundary="===============6624492785112725149=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.5.1 SUCCEEDED
Message-ID: <010101910f320ed5-59080ffb-945f-4f12-acd3-574ac762559a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202790

--===============6624492785112725149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.4.0-1.5.1.patch
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
From 4130dc30679e2887d28ea8b5197d9e35a096dabb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:05:10 +0000
Subject: [PATCH] meson: upgrade 1.4.0 -> 1.5.1

---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch    | 10 +++++-----
 ...module-do-not-manipulate-the-environment-when.patch |  8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch  |  4 ++--
 .../meson/{meson_1.4.0.bb => meson_1.5.1.bb}           |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.4.0.bb => meson_1.5.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 94129b2f25..04abb8b314 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c61c93f43b70ba0670d41e841bff9f2a7186cc2f Mon Sep 17 00:00:00 2001
+From 33bc81d5a262e0fa1a346ac1667a3679a17c0997 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 0e9cd23..b44e60c 100644
+index 86bad9b..9703315 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -276,8 +276,8 @@ class MachineInfo(HoldableObject):
+@@ -277,8 +277,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -26,10 +26,10 @@ index 0e9cd23..b44e60c 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index af69f64..248d6dd 100644
+index 5bccb90..6aa4b15 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -379,10 +379,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -387,10 +387,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 9f3f516a5c..b4671f591f 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From b4c0602a56d3517ab66b98a7dbb69defe77d29a3 Mon Sep 17 00:00:00 2001
+From 66e350bbbd65e56a0d19c75710f61503e15e24a2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index b9b17f8..a305afb 100644
+index 883a29a..52bfbf3 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -381,9 +381,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -399,9 +399,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -24,7 +24,7 @@ index b9b17f8..a305afb 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -392,8 +389,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -410,8 +407,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index fa5ea57d5b..5149d61af4 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 7f69bfabb87d311d7409ea6699f7dee8e9b3a95b Mon Sep 17 00:00:00 2001
+From 61430cf9a80e24eb33d72c6eae4e8d536d308e08 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,7 +12,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index b44e60c..c70e8cb 100644
+index 9703315..74f2477 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -28,6 +28,7 @@ from pathlib import Path
diff --git a/meta/recipes-devtools/meson/meson_1.4.0.bb b/meta/recipes-devtools/meson/meson_1.5.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.4.0.bb
rename to meta/recipes-devtools/meson/meson_1.5.1.bb
index a0c2ee633a..4f68a22fa9 100644
--- a/meta/recipes-devtools/meson/meson_1.4.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.5.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b330e25935b750138d"
+SRC_URI[sha256sum] = "567e533adf255de73a2de35049b99923caf872a455af9ce03e01077e0d384bed"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.44.0


--===============6624492785112725149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 12763 (+138%)
packages/core2-64-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info -> /usr/lib/python3.12/site-packages/meson-1.5.1.dist-info, removed "/usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py", added "/usr/lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/mformat.py /usr/lib/python3.12/site-packages/mesonbuild/options.py /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/_qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/machin
 efile.py /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/apple.py"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.5.1.dist-info
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/apple.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/machinefile.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/mformat.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/_qt.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/options.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py was removed

--===============6624492785112725149==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.4.0-1.5.1.patch"

RnJvbSA0MTMwZGMzMDY3OWUyODg3ZDI4ZWE4YjUxOTdkOWUzNWEwOTZkYWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDowNToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuNC4wIC0+IDEuNS4xCgotLS0KIC4uLi9tZXNvbi8wMDAxLU1ha2UtQ1BV
LWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCAgICB8IDEwICsrKysrLS0tLS0KIC4uLm1vZHVs
ZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaCB8ICA4ICsrKyst
LS0tCiAuLi4vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRj
aCAgfCAgNCArKy0tCiAuLi4vbWVzb24ve21lc29uXzEuNC4wLmJiID0+IG1lc29uXzEuNS4xLmJi
fSAgICAgICAgICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29u
XzEuNC4wLmJiID0+IG1lc29uXzEuNS4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1m
YXRhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2Ut
Q1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAppbmRleCA5NDEyOWIyZjI1Li4wNGFiYjhi
MzE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNjFjOTNmNDNiNzBiYTA2NzBkNDFlODQxYmZmOWYy
YTcxODZjYzJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzM2JjODFkNWEyNjJlMGZh
MWEzNDZhYzE2NjdhMzY3OWExN2MwOTk3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMyBKdWwgMjAx
OCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1pbHkgd2Fybmlu
Z3MgZmF0YWwKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8
cm9zcy5idXJ0b25AaW50ZWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZjb25maWcucHkg
Yi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotaW5kZXggMGU5Y2QyMy4uYjQ0ZTYwYyAxMDA2NDQK
K2luZGV4IDg2YmFkOWIuLjk3MDMzMTUgMTAwNjQ0CiAtLS0gYS9tZXNvbmJ1aWxkL2VudmNvbmZp
Zy5weQogKysrIGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKLUBAIC0yNzYsOCArMjc2LDggQEAg
Y2xhc3MgTWFjaGluZUluZm8oSG9sZGFibGVPYmplY3QpOgorQEAgLTI3Nyw4ICsyNzcsOCBAQCBj
bGFzcyBNYWNoaW5lSW5mbyhIb2xkYWJsZU9iamVjdCk6CiAgICAgICAgICAgICAgICAgICdidXQg
aXMgbWlzc2luZyB7fS4nLmZvcm1hdChtaW5pbXVtX2xpdGVyYWwgLSBzZXQobGl0ZXJhbCkpKQog
IAogICAgICAgICAgY3B1X2ZhbWlseSA9IGxpdGVyYWxbJ2NwdV9mYW1pbHknXQpAQCAtMjYsMTAg
KzI2LDEwIEBAIGluZGV4IDBlOWNkMjMuLmI0NGU2MGMgMTAwNjQ0CiAgICAgICAgICBlbmRpYW4g
PSBsaXRlcmFsWydlbmRpYW4nXQogICAgICAgICAgaWYgZW5kaWFuIG5vdCBpbiAoJ2xpdHRsZScs
ICdiaWcnKToKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5IGIvbWVzb25i
dWlsZC9lbnZpcm9ubWVudC5weQotaW5kZXggYWY2OWY2NC4uMjQ4ZDZkZCAxMDA2NDQKK2luZGV4
IDViY2NiOTAuLjZhYTRiMTUgMTAwNjQ0CiAtLS0gYS9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5
CiArKysgYi9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5Ci1AQCAtMzc5LDEwICszNzksOCBAQCBk
ZWYgZGV0ZWN0X2NwdV9mYW1pbHkoY29tcGlsZXJzOiBDb21waWxlcnNEaWN0KSAtPiBzdHI6CitA
QCAtMzg3LDEwICszODcsOCBAQCBkZWYgZGV0ZWN0X2NwdV9mYW1pbHkoY29tcGlsZXJzOiBDb21w
aWxlcnNEaWN0KSAtPiBzdHI6CiAgICAgICAgICBpZiBjb21waWxlcnMgYW5kIG5vdCBhbnlfY29t
cGlsZXJfaGFzX2RlZmluZShjb21waWxlcnMsICdfX21pcHM2NCcpOgogICAgICAgICAgICAgIHRy
aWFsID0gJ21pcHMnCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVu
dC13aGVuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0
aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaApp
bmRleCA5ZjNmNTE2YTVjLi5iNDY3MWY1OTFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbWVzb24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRo
ZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNv
bi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25t
ZW50LXdoZW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI0YzA2MDJhNTZkMzUxN2FiNjZi
OThhN2RiYjY5ZGVmZTc3ZDI5YTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY2ZTM1
MGJiYmQ2NWU1NmEwZDE5Yzc1NzEwZjYxNTAzZTE1ZTI0YTIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERh
dGU6IE1vbiwgMTkgTm92IDIwMTggMTQ6MjQ6MjYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcHl0
aG9uIG1vZHVsZTogZG8gbm90IG1hbmlwdWxhdGUgdGhlIGVudmlyb25tZW50IHdoZW4gY2FsbGlu
ZwpAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
NSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQvZGVwZW5kZW5jaWVzL3B5
dGhvbi5weSBiL21lc29uYnVpbGQvZGVwZW5kZW5jaWVzL3B5dGhvbi5weQotaW5kZXggYjliMTdm
OC4uYTMwNWFmYiAxMDA2NDQKK2luZGV4IDg4M2EyOWEuLjUyYmZiZjMgMTAwNjQ0CiAtLS0gYS9t
ZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKICsrKyBiL21lc29uYnVpbGQvZGVwZW5k
ZW5jaWVzL3B5dGhvbi5weQotQEAgLTM4MSw5ICszODEsNiBAQCBkZWYgcHl0aG9uX2ZhY3Rvcnko
ZW52OiAnRW52aXJvbm1lbnQnLCBmb3JfbWFjaGluZTogJ01hY2hpbmVDaG9pY2UnLAorQEAgLTM5
OSw5ICszOTksNiBAQCBkZWYgcHl0aG9uX2ZhY3RvcnkoZW52OiAnRW52aXJvbm1lbnQnLCBmb3Jf
bWFjaGluZTogJ01hY2hpbmVDaG9pY2UnLAogICAgICAgICAgICAgICAgICAgICAgZW1wdHkubmFt
ZSA9ICdweXRob24nCiAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZW1wdHkKICAKQEAgLTI0
LDcgKzI0LDcgQEAgaW5kZXggYjliMTdmOC4uYTMwNWFmYiAxMDA2NDQKICAgICAgICAgICAgICAg
ICAgdHJ5OgogICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFB5dGhvblBrZ0NvbmZpZ0RlcGVu
ZGVuY3kobmFtZSwgZW52LCBrd2FyZ3MsIGluc3RhbGxhdGlvbiwgVHJ1ZSkKICAgICAgICAgICAg
ICAgICAgZmluYWxseToKLUBAIC0zOTIsOCArMzg5LDcgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVu
djogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKK0BAIC00MTAs
OCArNDA3LDcgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21h
Y2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Mu
ZW52aXJvbltuYW1lXSA9IHZhbHVlCiAgICAgICAgICAgICAgICAgICAgICAgICAgZWxpZiBuYW1l
IGluIG9zLmVudmlyb246CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlbCBvcy5lbnZp
cm9uW25hbWVdCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJj
aC1yZWNpcGVzLWFnYWluLnBhdGNoCmluZGV4IGZhNWVhNTdkNWIuLjUxNDlkNjFhZjQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVp
bGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFn
YWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZjY5YmZhYmI4N2QzMTFkNzQwOWVhNjY5
OWY3ZGVlOGU5YjNhOTViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MTQzMGNmOWE4
MGUyNGViMzNkNzJjNmVhZTRlOGQ1MzZkMzA4ZTA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRlOiBUaHUsIDI2IEp1
bCAyMDE4IDE2OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgYnVpbGRpbmcg
YWxsYXJjaCByZWNpcGVzIGFnYWluCkBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IFBl
dGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZjb25m
aWcucHkgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotaW5kZXggYjQ0ZTYwYy4uYzcwZThjYiAx
MDA2NDQKK2luZGV4IDk3MDMzMTUuLjc0ZjI0NzcgMTAwNjQ0CiAtLS0gYS9tZXNvbmJ1aWxkL2Vu
dmNvbmZpZy5weQogKysrIGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKIEBAIC0yOCw2ICsyOCw3
IEBAIGZyb20gcGF0aGxpYiBpbXBvcnQgUGF0aApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29u
L21lc29uXzEuNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL21lc29uXzEuNS4xLmJiCmluZGV4IGEwYzJlZTYzM2EuLjRmNjhhMjJm
YTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS41LjEuYmIKQEAgLTE1
LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0v
bWVzb24tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtTWFrZS1DUFUtZmFt
aWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItU3VwcG9y
dC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggXAogICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOGZkNjYzMGMyNWMyN2YxNDg5YThhMDM5MmIzMTFhNjA0ODFh
M2MxNjFhYTY5OWIzMzBlMjU5MzViNzUwMTM4ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1Njdl
NTMzYWRmMjU1ZGU3M2EyZGUzNTA0OWI5OTkyM2NhZjg3MmE0NTVhZjljZTAzZTAxMDc3ZTBkMzg0
YmVkIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKIAog
aW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIGdpdGh1Yi1yZWxlYXNlcwotLSAK
Mi40NC4wCgo=

--===============6624492785112725149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.4.0/meson-1.4.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.5.1/meson-1.5.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PV changed from "1.4.0" to "1.5.1"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.4.0" to "1.5.1"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.4.0" to "1.5.1"
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 12763 (+138%)
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.4.0" to "1.5.1"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.4.0" to "1.5.1"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.4.0" to "1.5.1"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.4.0" to "1.5.1"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 7974950 to 8171349 (+2%)
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.4.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info -> /usr/lib/python3.12/site-packages/meson-1.5.1.dist-info, removed "/usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py", added "/usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/apple.py /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/machinefile.py /usr/lib/python3.12/site-packages/mesonbuild/mformat.py /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycach
 e__/_qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/options.py"
packages/core2-64-poky-linux/meson/meson: PV changed from "1.4.0" to "1.5.1"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.5.1.dist-info
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/apple.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/machinefile.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/mformat.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/_qt.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/options.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py was removed

--===============6624492785112725149==--

