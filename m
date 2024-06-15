Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39634C3DA60
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:30 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.18380.1718475799547750509
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J66idLI4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ixnCmOto;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101901d23b981-8a50534e-2c7d-4714-b7c7-c6612fa02352-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dIV+skHBETezdSrrybTXvswNNK6qwtPFx3N//8GVVQQ=;
	b=J66idLI49shWmQQJhu2XIxmdWkVef5/QIV6xeOZqTjjU/3Wn4iQKyvcsqWgOLmcT
	2RFjXlL0vBWs73bdbICNb6f0Se10PcRpRqIgCMC0AZ8JLJtvLTKeIEeLC1SZA+RAK7q
	Imb5ELA6CEYAeAb5P1uE2hQcc5UQJDmBwNLfV6NI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dIV+skHBETezdSrrybTXvswNNK6qwtPFx3N//8GVVQQ=;
	b=ixnCmOtoDScpoNwwTZRxkSvBvybq+ZDbIsdWiq3EHEh1i7bGkbEbgTPHOUA4jGYr
	RFQQNryrsYdiV78jJD20jvi0YPC+YhfwEEWmKBZYrWqCwZnHrnJlpyUr+ohEy7xhYuj
	ma393cOfICbsrVDPDqVIGuGzUhzaZvPmnVYePQcA=
Content-Type: multipart/mixed; boundary="===============8077406974901548943=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.4.1 SUCCEEDED
Message-ID: <010101901d23b981-8a50534e-2c7d-4714-b7c7-c6612fa02352-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200698

--===============8077406974901548943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.4.0-1.4.1.patch
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
From f4b91cebc2e05b585406589bed7d423a328da92a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 09:31:45 +0000
Subject: [PATCH] meson: upgrade 1.4.0 -> 1.4.1

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch   | 6 +++---
 ...thon-module-do-not-manipulate-the-environment-when.patch | 4 ++--
 .../meson/0002-Support-building-allarch-recipes-again.patch | 2 +-
 .../meson/{meson_1.4.0.bb => meson_1.4.1.bb}                | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.4.0.bb => meson_1.4.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 94129b2f25..f18825abab 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c61c93f43b70ba0670d41e841bff9f2a7186cc2f Mon Sep 17 00:00:00 2001
+From a776be8c83f1bc7e398646f9115160e71f6f4cfe Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 0e9cd23..b44e60c 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index af69f64..248d6dd 100644
+index 156d329..e443dd2 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -379,10 +379,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -380,10 +380,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 9f3f516a5c..ae28052a0a 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From b4c0602a56d3517ab66b98a7dbb69defe77d29a3 Mon Sep 17 00:00:00 2001
+From 2668f5c37aad007e3aa1aedd2b441d2dba4475e0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index b9b17f8..a305afb 100644
+index a0a22c1..6fc0453 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
 @@ -381,9 +381,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index fa5ea57d5b..2ee29c91b9 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 7f69bfabb87d311d7409ea6699f7dee8e9b3a95b Mon Sep 17 00:00:00 2001
+From a0076e99bd4a11a220464b23535366e148fbe719 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.4.0.bb b/meta/recipes-devtools/meson/meson_1.4.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.4.0.bb
rename to meta/recipes-devtools/meson/meson_1.4.1.bb
index 5db100ff1c..6686b99d31 100644
--- a/meta/recipes-devtools/meson/meson_1.4.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.4.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b330e25935b750138d"
+SRC_URI[sha256sum] = "1b8aad738a5f6ae64294cc8eaba9a82988c1c420204484ac02ef782e5bba5f49"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.44.0


--===============8077406974901548943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.1.dist-info

--===============8077406974901548943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.4.0/meson-1.4.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.4.1/meson-1.4.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 5354 (-0%)
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 7974951 to 7993533 (+0%)
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.1.dist-info

--===============8077406974901548943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.4.0-1.4.1.patch"

RnJvbSBmNGI5MWNlYmMyZTA1YjU4NTQwNjU4OWJlZDdkNDIzYTMyOGRhOTJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDk6MzE6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjQuMCAtPiAxLjQuMQoKLS0tCiAuLi4vbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggICB8IDYgKysrLS0tCiAuLi50aG9u
LW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaCB8IDQg
KystLQogLi4uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdh
aW4ucGF0Y2ggfCAyICstCiAuLi4vbWVzb24ve21lc29uXzEuNC4wLmJiID0+IG1lc29uXzEuNC4x
LmJifSAgICAgICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi97
bWVzb25fMS40LjAuYmIgPT4gbWVzb25fMS40LjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5p
bmdzLWZhdGFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEt
TWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCmluZGV4IDk0MTI5YjJmMjUuLmYx
ODgyNWFiYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8w
MDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0
YWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM2MWM5M2Y0M2I3MGJhMDY3MGQ0MWU4NDFi
ZmY5ZjJhNzE4NmNjMmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE3NzZiZThjODNm
MWJjN2UzOTg2NDZmOTExNTE2MGU3MWY2ZjRjZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAzIEp1
bCAyMDE4IDEzOjU5OjA5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgQ1BVIGZhbWlseSB3
YXJuaW5ncyBmYXRhbApAQCAtMjYsMTAgKzI2LDEwIEBAIGluZGV4IDBlOWNkMjMuLmI0NGU2MGMg
MTAwNjQ0CiAgICAgICAgICBlbmRpYW4gPSBsaXRlcmFsWydlbmRpYW4nXQogICAgICAgICAgaWYg
ZW5kaWFuIG5vdCBpbiAoJ2xpdHRsZScsICdiaWcnKToKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxk
L2Vudmlyb25tZW50LnB5IGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQotaW5kZXggYWY2OWY2
NC4uMjQ4ZDZkZCAxMDA2NDQKK2luZGV4IDE1NmQzMjkuLmU0NDNkZDIgMTAwNjQ0CiAtLS0gYS9t
ZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5CiArKysgYi9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5
Ci1AQCAtMzc5LDEwICszNzksOCBAQCBkZWYgZGV0ZWN0X2NwdV9mYW1pbHkoY29tcGlsZXJzOiBD
b21waWxlcnNEaWN0KSAtPiBzdHI6CitAQCAtMzgwLDEwICszODAsOCBAQCBkZWYgZGV0ZWN0X2Nw
dV9mYW1pbHkoY29tcGlsZXJzOiBDb21waWxlcnNEaWN0KSAtPiBzdHI6CiAgICAgICAgICBpZiBj
b21waWxlcnMgYW5kIG5vdCBhbnlfY29tcGlsZXJfaGFzX2RlZmluZShjb21waWxlcnMsICdfX21p
cHM2NCcpOgogICAgICAgICAgICAgIHRyaWFsID0gJ21pcHMnCiAgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1t
YW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUt
ZW52aXJvbm1lbnQtd2hlbi5wYXRjaAppbmRleCA5ZjNmNTE2YTVjLi5hZTI4MDUyYTBhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1weXRob24tbW9k
dWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90
LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGI0YzA2MDJhNTZkMzUxN2FiNjZiOThhN2RiYjY5ZGVmZTc3ZDI5YTMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDI2NjhmNWMzN2FhZDAwN2UzYWExYWVkZDJiNDQxZDJkYmE0NDc1
ZTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTkgTm92IDIwMTggMTQ6MjQ6MjYgKzAx
MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uIG1vZHVsZTogZG8gbm90IG1hbmlwdWxhdGUgdGhl
IGVudmlyb25tZW50IHdoZW4gY2FsbGluZwpAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNv
bmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkgYi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9w
eXRob24ucHkKLWluZGV4IGI5YjE3ZjguLmEzMDVhZmIgMTAwNjQ0CitpbmRleCBhMGEyMmMxLi42
ZmMwNDUzIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9kZXBlbmRlbmNpZXMvcHl0aG9uLnB5CiAr
KysgYi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKIEBAIC0zODEsOSArMzgxLDYg
QEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdN
YWNoaW5lQ2hvaWNlJywKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1h
bGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2gKaW5kZXggZmE1ZWE1N2Q1Yi4uMmVlMjljOTFiOSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDItU3VwcG9y
dC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lw
ZXMtYWdhaW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdmNjliZmFiYjg3ZDMxMWQ3NDA5
ZWE2Njk5ZjdkZWU4ZTliM2E5NWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEwMDc2
ZTk5YmQ0YTExYTIyMDQ2NGIyMzUzNTM2NmUxNDhmYmU3MTkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBQZXRlciBLamVsbGVyc3RlZHQgPHBrakBheGlzLmNvbT4KIERhdGU6IFRodSwg
MjYgSnVsIDIwMTggMTY6MzI6NDkgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gU3VwcG9ydCBidWls
ZGluZyBhbGxhcmNoIHJlY2lwZXMgYWdhaW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbl8xLjQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbl8xLjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS40LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMS5iYgppbmRleCA1ZGIxMDBmZjFjLi42Njg2Yjk5ZDMx
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS40LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuNC4xLmJiCkBAIC0xNSw3
ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21l
c29uLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZhbWls
eS13YXJuaW5ncy1mYXRhbC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBvcnQt
YnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjhmZDY2MzBjMjVjMjdmMTQ4OWE4YTAzOTJiMzExYTYwNDgxYTNj
MTYxYWE2OTliMzMwZTI1OTM1Yjc1MDEzOGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWI4YWFk
NzM4YTVmNmFlNjQyOTRjYzhlYWJhOWE4Mjk4OGMxYzQyMDIwNDQ4NGFjMDJlZjc4MmU1YmJhNWY0
OSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKIGlu
aGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKLS0gCjIu
NDQuMAoK

--===============8077406974901548943==--

