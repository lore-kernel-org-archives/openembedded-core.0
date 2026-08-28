Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C72C61DCD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:57:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.420.1787896671269309873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 22:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=l4GrWH5z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N8mqpBdz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a046f2282b-698750fc-6b87-415d-a181-ff0414056aa3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vFRdNrqQ/8a6N1w0foVfyhTiPgA7JI5LIshDFgZw8Io=;
	b=l4GrWH5z8HUTZaQks0MjXIzXSnC4HsaTJeirtxeW6aByFw8jCpMTAYBClOsKlSqC
	bpBoJO2RseLXailUb+5Dkc/4xjJpU1DOfqEFWJW3O33nAXnQh2JZTvM3pKjQzz933Nk
	Ebo3ePA90k4qv9qPcKlVX2cFO4Cqj8zGkYhpdGRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vFRdNrqQ/8a6N1w0foVfyhTiPgA7JI5LIshDFgZw8Io=;
	b=N8mqpBdzoPl+8ItGbx8Pdk85z8eRtSNszSWPw4EvXSa3guyOPPgvI6c5xIpXIiyi
	6J7Y4b+skz6/EiXU4qnPnrRJhz86+afrG9GcHe932urQQSRpnfOuLdIOyTSlv/jDqe6
	o5tTHq9PEDP0OBUbWrfU3BbL4fAy6AW+kiR3Cias=
Content-Type: multipart/mixed; boundary="===============5243616755679938960=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.6.0 SUCCEEDED
Message-ID: <010101a046f2282b-698750fc-6b87-415d-a181-ff0414056aa3-000000@us-west-2.amazonses.com>
Date: Fri, 28 Aug 2026 05:57:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244511

--===============5243616755679938960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.5.1-1.6.0.patch
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
From 7b21d98057ce518b5e3cf7f2f7cff239e7c95da7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 28 Aug 2026 05:36:35 +0000
Subject: [PATCH] python3-build: upgrade 1.5.1 -> 1.6.0

Source: CHANGELOG.rst

1.6.0 (2026-08-27)
- Pass ``--dependency-constraints-txt`` files through to the installer unmodified instead of re-parsing them into a
  deduplicated set of lines, fixing a case where a hashed requirement (e.g. from ``pip-compile --generate-hashes``) could
  have its ``--hash`` continuation line separated from its requirement line and silently dropped, depending on the
  interpreter's hash seed - by :user:`manfred-kaiser` (:issue:`1140`)
**********
 Removals
**********

- Remove ``exc_info`` parameter and attribute from ``BuildBackendException``. - by :user:`layday` (:issue:`1161`)

**************
 Deprecations
**************
- :issue:`1058`, :issue:`1060`, :issue:`1062`, :issue:`1093`, :issue:`1099`, :issue:`1107`, :issue:`1113`, :issue:`1117`, :issue:`1122`, :issue:`1124`, :issue:`1128`, :issue:`1132`
---
 .../python3-build/check-valid-dist.patch       | 18 ++++++++++++------
 ...3-build_1.5.1.bb => python3-build_1.6.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-build_1.5.1.bb => python3-build_1.6.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-build/check-valid-dist.patch b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
index dd6f256e26..82c31a49a4 100644
--- a/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
+++ b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
@@ -1,4 +1,7 @@
-Ignore invalid distributions when checking dependencies
+From a2a217409e01e3ebea88dce85d81dbe6b3c79187 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 12 Aug 2026 12:35:29 +0100
+Subject: [PATCH] Ignore invalid distributions when checking dependencies
 
 If there's an empty directory foo-1.2.dist-info/ on the search path then
 importlib will return that as a distribution called "foo".
@@ -12,12 +15,15 @@ the dist-info directory is empties but remains in the sysroot.
 
 Upstream-Status: Submitted [https://github.com/pypa/build/pull/1145]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/build/_util.py | 5 +++++
+ 1 file changed, 5 insertions(+)
 
-diff --git i/src/build/_util.py w/src/build/_util.py
-index c365003..ba047c7 100644
---- i/src/build/_util.py
-+++ w/src/build/_util.py
-@@ -67,6 +67,11 @@ def _check_dependency(
+diff --git a/src/build/_util.py b/src/build/_util.py
+index cce8f94..54bc02c 100644
+--- a/src/build/_util.py
++++ b/src/build/_util.py
+@@ -63,6 +63,11 @@ def _check_dependency(
          yield (*ancestral_req_strings, normalised_req_string)
          return
  
diff --git a/meta/recipes-devtools/python/python3-build_1.5.1.bb b/meta/recipes-devtools/python/python3-build_1.6.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-build_1.5.1.bb
rename to meta/recipes-devtools/python/python3-build_1.6.0.bb
index d572ca846f..acec9cd9ef 100644
--- a/meta/recipes-devtools/python/python3-build_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
 SRC_URI += "file://check-valid-dist.patch"
 
-SRC_URI[sha256sum] = "94e17f1db803ab22f46049376c44c8437c52090f0dfdf1adc43df56542d644fb"
+SRC_URI[sha256sum] = "bd2c8afc603e7a2e0ce70e2ea85f0a6d02043bafbd307f5bada0f98669eca5af"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============5243616755679938960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.5.1.dist-info -> /usr/lib/python3.14/site-packages/build-1.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.5.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.6.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.1.dist-info moved to /usr/lib/python3.14/site-packages/build-1.6.0.dist-info

--===============5243616755679938960==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.5.1-1.6.0.patch"

RnJvbSA3YjIxZDk4MDU3Y2U1MThiNWUzY2Y3ZjJmN2NmZjIzOWU3Yzk1ZGE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjggQXVnIDIwMjYgMDU6MzY6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJ1aWxkOiB1cGdyYWRlIDEuNS4xIC0+IDEuNi4wCgpTb3VyY2U6IENIQU5HRUxPRy5y
c3QKCjEuNi4wICgyMDI2LTA4LTI3KQotIFBhc3MgYGAtLWRlcGVuZGVuY3ktY29uc3RyYWludHMt
dHh0YGAgZmlsZXMgdGhyb3VnaCB0byB0aGUgaW5zdGFsbGVyIHVubW9kaWZpZWQgaW5zdGVhZCBv
ZiByZS1wYXJzaW5nIHRoZW0gaW50byBhCiAgZGVkdXBsaWNhdGVkIHNldCBvZiBsaW5lcywgZml4
aW5nIGEgY2FzZSB3aGVyZSBhIGhhc2hlZCByZXF1aXJlbWVudCAoZS5nLiBmcm9tIGBgcGlwLWNv
bXBpbGUgLS1nZW5lcmF0ZS1oYXNoZXNgYCkgY291bGQKICBoYXZlIGl0cyBgYC0taGFzaGBgIGNv
bnRpbnVhdGlvbiBsaW5lIHNlcGFyYXRlZCBmcm9tIGl0cyByZXF1aXJlbWVudCBsaW5lIGFuZCBz
aWxlbnRseSBkcm9wcGVkLCBkZXBlbmRpbmcgb24gdGhlCiAgaW50ZXJwcmV0ZXIncyBoYXNoIHNl
ZWQgLSBieSA6dXNlcjpgbWFuZnJlZC1rYWlzZXJgICg6aXNzdWU6YDExNDBgKQoqKioqKioqKioq
CiBSZW1vdmFscwoqKioqKioqKioqCgotIFJlbW92ZSBgYGV4Y19pbmZvYGAgcGFyYW1ldGVyIGFu
ZCBhdHRyaWJ1dGUgZnJvbSBgYEJ1aWxkQmFja2VuZEV4Y2VwdGlvbmBgLiAtIGJ5IDp1c2VyOmBs
YXlkYXlgICg6aXNzdWU6YDExNjFgKQoKKioqKioqKioqKioqKioKIERlcHJlY2F0aW9ucwoqKioq
KioqKioqKioqKgotIDppc3N1ZTpgMTA1OGAsIDppc3N1ZTpgMTA2MGAsIDppc3N1ZTpgMTA2MmAs
IDppc3N1ZTpgMTA5M2AsIDppc3N1ZTpgMTA5OWAsIDppc3N1ZTpgMTEwN2AsIDppc3N1ZTpgMTEx
M2AsIDppc3N1ZTpgMTExN2AsIDppc3N1ZTpgMTEyMmAsIDppc3N1ZTpgMTEyNGAsIDppc3N1ZTpg
MTEyOGAsIDppc3N1ZTpgMTEzMmAKLS0tCiAuLi4vcHl0aG9uMy1idWlsZC9jaGVjay12YWxpZC1k
aXN0LnBhdGNoICAgICAgIHwgMTggKysrKysrKysrKysrLS0tLS0tCiAuLi4zLWJ1aWxkXzEuNS4x
LmJiID0+IHB5dGhvbjMtYnVpbGRfMS42LjAuYmJ9IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3tweXRob24zLWJ1aWxkXzEuNS4xLmJiID0+IHB5dGhvbjMtYnVpbGRfMS42
LjAuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJ1aWxkL2NoZWNrLXZhbGlkLWRpc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYnVpbGQvY2hlY2stdmFsaWQtZGlzdC5wYXRjaAppbmRleCBkZDZm
MjU2ZTI2Li44MmMzMWE0OWE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtYnVpbGQvY2hlY2stdmFsaWQtZGlzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGQvY2hlY2stdmFsaWQtZGlzdC5wYXRjaApA
QCAtMSw0ICsxLDcgQEAKLUlnbm9yZSBpbnZhbGlkIGRpc3RyaWJ1dGlvbnMgd2hlbiBjaGVja2lu
ZyBkZXBlbmRlbmNpZXMKK0Zyb20gYTJhMjE3NDA5ZTAxZTNlYmVhODhkY2U4NWQ4MWRiZTZiM2M3
OTE4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBhcm0uY29tPgorRGF0ZTogV2VkLCAxMiBBdWcgMjAyNiAxMjozNToyOSArMDEwMAorU3Vi
amVjdDogW1BBVENIXSBJZ25vcmUgaW52YWxpZCBkaXN0cmlidXRpb25zIHdoZW4gY2hlY2tpbmcg
ZGVwZW5kZW5jaWVzCiAKIElmIHRoZXJlJ3MgYW4gZW1wdHkgZGlyZWN0b3J5IGZvby0xLjIuZGlz
dC1pbmZvLyBvbiB0aGUgc2VhcmNoIHBhdGggdGhlbgogaW1wb3J0bGliIHdpbGwgcmV0dXJuIHRo
YXQgYXMgYSBkaXN0cmlidXRpb24gY2FsbGVkICJmb28iLgpAQCAtMTIsMTIgKzE1LDE1IEBAIHRo
ZSBkaXN0LWluZm8gZGlyZWN0b3J5IGlzIGVtcHRpZXMgYnV0IHJlbWFpbnMgaW4gdGhlIHN5c3Jv
b3QuCiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcHlw
YS9idWlsZC9wdWxsLzExNDVdCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0
b25AYXJtLmNvbT4KKy0tLQorIHNyYy9idWlsZC9fdXRpbC5weSB8IDUgKysrKysKKyAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKLWRpZmYgLS1naXQgaS9zcmMvYnVpbGQvX3V0aWwu
cHkgdy9zcmMvYnVpbGQvX3V0aWwucHkKLWluZGV4IGMzNjUwMDMuLmJhMDQ3YzcgMTAwNjQ0Ci0t
LS0gaS9zcmMvYnVpbGQvX3V0aWwucHkKLSsrKyB3L3NyYy9idWlsZC9fdXRpbC5weQotQEAgLTY3
LDYgKzY3LDExIEBAIGRlZiBfY2hlY2tfZGVwZW5kZW5jeSgKK2RpZmYgLS1naXQgYS9zcmMvYnVp
bGQvX3V0aWwucHkgYi9zcmMvYnVpbGQvX3V0aWwucHkKK2luZGV4IGNjZThmOTQuLjU0YmMwMmMg
MTAwNjQ0CistLS0gYS9zcmMvYnVpbGQvX3V0aWwucHkKKysrKyBiL3NyYy9idWlsZC9fdXRpbC5w
eQorQEAgLTYzLDYgKzYzLDExIEBAIGRlZiBfY2hlY2tfZGVwZW5kZW5jeSgKICAgICAgICAgIHlp
ZWxkICgqYW5jZXN0cmFsX3JlcV9zdHJpbmdzLCBub3JtYWxpc2VkX3JlcV9zdHJpbmcpCiAgICAg
ICAgICByZXR1cm4KICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1idWlsZF8xLjUuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1idWlsZF8xLjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS41LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjYuMC5iYgppbmRl
eCBkNTcyY2E4NDZmLi5hY2VjOWNkOWVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS41LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNi4wLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zMTA0MzlhZjI4N2IwZmI0NzgwYjJhZDY5
MDdjMjU2YyIKIAogU1JDX1VSSSArPSAiZmlsZTovL2NoZWNrLXZhbGlkLWRpc3QucGF0Y2giCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NGUxN2YxZGI4MDNhYjIyZjQ2MDQ5Mzc2YzQ0Yzg0Mzdj
NTIwOTBmMGRmZGYxYWRjNDNkZjU2NTQyZDY0NGZiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJk
MmM4YWZjNjAzZTdhMmUwY2U3MGUyZWE4NWYwYTZkMDIwNDNiYWZiZDMwN2Y1YmFkYTBmOTg2Njll
Y2E1YWYiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============5243616755679938960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.5.1.tar.gz;downloadfilename=build-1.5.1.tar.gz file://check-valid-dist.patch" to "https://files.pythonhosted.org/packages/source/b/build/build-1.6.0.tar.gz;downloadfilename=build-1.6.0.tar.gz file://check-valid-dist.patch"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.5.1" to "1.6.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.5.1.dist-info -> /usr/lib/python3.14/site-packages/build-1.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.5.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.6.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 218716 to 218012 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.1.dist-info moved to /usr/lib/python3.14/site-packages/build-1.6.0.dist-info

--===============5243616755679938960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-build-changelog.txt"

Changelog for python3-build: 1.5.1 -> 1.6.0
Source: CHANGELOG.rst

1.6.0 (2026-08-27)
- Pass ``--dependency-constraints-txt`` files through to the installer unmodified instead of re-parsing them into a
  deduplicated set of lines, fixing a case where a hashed requirement (e.g. from ``pip-compile --generate-hashes``) could
  have its ``--hash`` continuation line separated from its requirement line and silently dropped, depending on the
  interpreter's hash seed - by :user:`manfred-kaiser` (:issue:`1140`)
**********
 Removals
**********

- Remove ``exc_info`` parameter and attribute from ``BuildBackendException``. - by :user:`layday` (:issue:`1161`)

**************
 Deprecations
**************
- :issue:`1058`, :issue:`1060`, :issue:`1062`, :issue:`1093`, :issue:`1099`, :issue:`1107`, :issue:`1113`, :issue:`1117`, :issue:`1122`, :issue:`1124`, :issue:`1128`, :issue:`1132`

--===============5243616755679938960==--

