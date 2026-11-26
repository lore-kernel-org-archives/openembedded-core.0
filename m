Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8435.1795671539281179625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 21:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PkrdwYZv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NmWh6btL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a2165d3a33-4f64bfe0-e52b-4cb1-88d8-cab783158f4c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795671538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eOaBBgHXON3tjadiiEqI2kEpbqQzwqu9vN1j0Ol7uD8=;
	b=PkrdwYZvFU53HB6U+9GLbYhmOWbgg2C2WgvO/ITl8hTDIMzKkwGVf2Fnml7i0u/l
	KlQO4TS22phszgJeq+eUYa3OJcHF8QZv9UBoGAOQiGeFWWglv/uv1dbIoBxmIhSsQHe
	hf1N9zbk2XjKYbTWlJJf83jgyJtzGA1oPIA7s3zI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795671538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eOaBBgHXON3tjadiiEqI2kEpbqQzwqu9vN1j0Ol7uD8=;
	b=NmWh6btLgFgpTHnPIIWzxo2iErP/osRE9c0CcOa3E+LqZR9V0HBPCMD8ZyYfFwYx
	yNdbCttUD/zluz26WDjOQVEUdiqAzok7Rw6KGusm9qbXaZSxJInkCHUUyAnGJWOciUd
	TOZ8Pnq09ej2dqUBsj1jO/oU5Y92SIRkJ8YDUBto=
Content-Type: multipart/mixed; boundary="===============2933659780826665839=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.3.2 SUCCEEDED
Message-ID: <010101a2165d3a33-4f64bfe0-e52b-4cb1-88d8-cab783158f4c-000000@us-west-2.amazonses.com>
Date: Thu, 26 Nov 2026 05:38:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.26-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 05:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251274

--===============2933659780826665839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.2.9-3.3.2.patch
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
From c89bb718766014741b6c6b0c0bd7eeac61b21ddb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 26 Nov 2026 05:25:50 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.2

3.3.2 (2026-11-25)
==================

Bugs fixed
----------

Other changes
-------------

3.3.1 (2026-11-01)
==================

Most of the bugs fixed in this release were regressions in 3.3.0.

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0 (2026-08-22)
==================

(Complete changelog for the 3.3.0 release, including pre-releases.)

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0b1 (2026-08-14)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0a1 (2026-06-24)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.2.10 (2026-0?-??)
===================

Bugs fixed
----------

3.2.9 (2026-07-24)
---
 ...place-not-predictable-build-path-prefix-with-hardc.patch | 6 +++---
 .../{python3-cython_3.2.9.bb => python3-cython_3.3.2.bb}    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb => python3-cython_3.3.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 573a53ee56..08ee5b7f4b 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
+From e4484635fb33398a4ce92d8a87a835c411d9110b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,10 +53,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 34f1b32..b09350b 100644
+index 72e14f2..0c681d2 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -899,7 +899,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.9.bb b/meta/recipes-devtools/python/python3-cython_3.3.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.2.bb
index 3457a91490..1ba33de79f 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.2.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "d249c9022ab13286b17bd66f30609e800c5f95efeecb06168990c7a66cecde6c"
+SRC_URI[sha256sum] = "e789d9fd939b74fb8c572fc2b689e3b14bd141ba95243693a546064c8179a1d3"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============2933659780826665839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.15/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.15/site-packages/cython-3.3.2.dist-info, removed "/usr/lib/python3.15/site-packages/Cython/__init__.pyi /usr/lib/python3.15/site-packages/Cython/Utility/Printing.c /usr/lib/python3.15/site-packages/Cython/Shadow.pyi", added "/usr/lib/python3.15/site-packages/Cython/__pycache__/LZSS.cpython-315.pyc /usr/lib/python3.15/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.15/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.15/site-packages/Cython/LZSS.py /usr/lib/python3.15/site-packages/Cython/LZSS.cpython-315-x86_64-linux-gnu.so /usr/lib/python3.15/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.15/site-packages/Cython/Includes/libc/stdbool.pxd /usr/lib/python3.15/site-packages/Cython/Compiler/StringEncoding.cpython-315-x86_64-linux-gnu.so /usr/lib/python3.15/site-packages/Cyth
 on/_shared.cpython-315-x86_64-linux-gnu.so /usr/lib/python3.15/site-packages/Cython/Utility/MatchCase.c /usr/lib/python3.15/site-packages/Cython/Includes/cpython/frozendict.pxd"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.15/site-packages/cython-3.2.9.dist-info moved to /usr/lib/python3.15/site-packages/cython-3.3.2.dist-info
  /usr/lib/python3.15/site-packages/Cython/Compiler/StringEncoding.cpython-315-x86_64-linux-gnu.so was added
  /usr/lib/python3.15/site-packages/Cython/Includes/cpython/frozendict.pxd was added
  /usr/lib/python3.15/site-packages/Cython/Includes/cpython/sentinel.pxd was added
  /usr/lib/python3.15/site-packages/Cython/Includes/libc/stdbool.pxd was added
  /usr/lib/python3.15/site-packages/Cython/LZSS.cpython-315-x86_64-linux-gnu.so was added
  /usr/lib/python3.15/site-packages/Cython/LZSS.py was added
  /usr/lib/python3.15/site-packages/Cython/__pycache__/LZSS.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/Cython/_shared.cpython-315-x86_64-linux-gnu.so was added
  /usr/lib/python3.15/site-packages/Cython/Utility/Exceptions_Cy.pyx was added
  /usr/lib/python3.15/site-packages/Cython/Utility/MatchCase.c was added
  /usr/lib/python3.15/site-packages/Cython/Utility/MatchCase_Cy.pyx was added
  /usr/lib/python3.15/site-packages/Cython/__init__.pyi was removed
  /usr/lib/python3.15/site-packages/Cython/Shadow.pyi was removed
  /usr/lib/python3.15/site-packages/Cython/Utility/Printing.c was removed

--===============2933659780826665839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-cython-changelog.txt"

3.3.2 (2026-11-25)
==================

Bugs fixed
----------

Other changes
-------------

3.3.1 (2026-11-01)
==================

Most of the bugs fixed in this release were regressions in 3.3.0.

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0 (2026-08-22)
==================

(Complete changelog for the 3.3.0 release, including pre-releases.)

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0b1 (2026-08-14)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0a1 (2026-06-24)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.2.10 (2026-0?-??)
===================

Bugs fixed
----------

3.2.9 (2026-07-24)

--===============2933659780826665839==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.9-3.3.2.patch"

RnJvbSBjODliYjcxODc2NjAxNDc0MWI2YzZiMGMwYmQ3ZWVhYzYxYjIxZGRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMDU6MjU6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjIuOSAtPiAzLjMuMgoKMy4zLjIgKDIwMjYtMTEtMjUp
Cj09PT09PT09PT09PT09PT09PQoKQnVncyBmaXhlZAotLS0tLS0tLS0tCgpPdGhlciBjaGFuZ2Vz
Ci0tLS0tLS0tLS0tLS0KCjMuMy4xICgyMDI2LTExLTAxKQo9PT09PT09PT09PT09PT09PT0KCk1v
c3Qgb2YgdGhlIGJ1Z3MgZml4ZWQgaW4gdGhpcyByZWxlYXNlIHdlcmUgcmVncmVzc2lvbnMgaW4g
My4zLjAuCgpGZWF0dXJlcyBhZGRlZAotLS0tLS0tLS0tLS0tLQoKQnVncyBmaXhlZAotLS0tLS0t
LS0tCgpPdGhlciBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0KCjMuMy4wICgyMDI2LTA4LTIyKQo9PT09
PT09PT09PT09PT09PT0KCihDb21wbGV0ZSBjaGFuZ2Vsb2cgZm9yIHRoZSAzLjMuMCByZWxlYXNl
LCBpbmNsdWRpbmcgcHJlLXJlbGVhc2VzLikKCkZlYXR1cmVzIGFkZGVkCi0tLS0tLS0tLS0tLS0t
CgpCdWdzIGZpeGVkCi0tLS0tLS0tLS0KCk90aGVyIGNoYW5nZXMKLS0tLS0tLS0tLS0tLQoKMy4z
LjBiMSAoMjAyNi0wOC0xNCkKPT09PT09PT09PT09PT09PT09PT0KCkZlYXR1cmVzIGFkZGVkCi0t
LS0tLS0tLS0tLS0tCgpCdWdzIGZpeGVkCi0tLS0tLS0tLS0KCk90aGVyIGNoYW5nZXMKLS0tLS0t
LS0tLS0tLQoKMy4zLjBhMSAoMjAyNi0wNi0yNCkKPT09PT09PT09PT09PT09PT09PT0KCkZlYXR1
cmVzIGFkZGVkCi0tLS0tLS0tLS0tLS0tCgpCdWdzIGZpeGVkCi0tLS0tLS0tLS0KCk90aGVyIGNo
YW5nZXMKLS0tLS0tLS0tLS0tLQoKMy4yLjEwICgyMDI2LTA/LT8/KQo9PT09PT09PT09PT09PT09
PT09CgpCdWdzIGZpeGVkCi0tLS0tLS0tLS0KCjMuMi45ICgyMDI2LTA3LTI0KQotLS0KIC4uLnBs
YWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoIHwg
NiArKystLS0KIC4uLi97cHl0aG9uMy1jeXRob25fMy4yLjkuYmIgPT4gcHl0aG9uMy1jeXRob25f
My4zLjIuYmJ9ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9u
My1jeXRob25fMy4yLjkuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4zLjIuYmJ9ICg5MyUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAx
LVJlcGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVw
bGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaApp
bmRleCA1NzNhNTNlZTU2Li4wOGVlNWI3ZjRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3QtcHJlZGljdGFibGUt
YnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3QtcHJlZGljdGFibGUt
YnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YTNiOWQ0MzAzYjZhYWY1ZWYyY2U5ZmZkMWJhNDJhOTNmOWNjNjhlMCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTQ0ODQ2MzVmYjMzMzk4YTRjZTkyZDhhODdhODM1YzQxMWQ5MTEwYiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTcgU2VwIDIwMjUgMDE6NDI6MDggLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gUmVwbGFjZSBub3QgcHJlZGljdGFibGUgYnVpbGQgcGF0aCBwcmVmaXggd2l0
aCBoYXJkY29kZQpAQCAtNTMsMTAgKzUzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEg
PGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9DeXRob24vQ29tcGlsZXIvTW9kdWxl
Tm9kZS5weSBiL0N5dGhvbi9Db21waWxlci9Nb2R1bGVOb2RlLnB5Ci1pbmRleCAzNGYxYjMyLi5i
MDkzNTBiIDEwMDY0NAoraW5kZXggNzJlMTRmMi4uMGM2ODFkMiAxMDA2NDQKIC0tLSBhL0N5dGhv
bi9Db21waWxlci9Nb2R1bGVOb2RlLnB5CiArKysgYi9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9k
ZS5weQotQEAgLTg3Nyw3ICs4NzcsOSBAQCBjbGFzcyBNb2R1bGVOb2RlKE5vZGVzLk5vZGUsIE5v
ZGVzLkJsb2NrTm9kZSk6CitAQCAtODk5LDcgKzg5OSw5IEBAIGNsYXNzIE1vZHVsZU5vZGUoTm9k
ZXMuTm9kZSwgTm9kZXMuQmxvY2tOb2RlKToKICAgICAgICAgIGNvZGUucHV0X2dlbmVyYXRlZF9i
eSgpCiAgICAgICAgICBpZiBtZXRhZGF0YToKICAgICAgICAgICAgICBjb2RlLnB1dGxuKCIvKiBC
RUdJTjogQ3l0aG9uIE1ldGFkYXRhIikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jeXRob25fMy4yLjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4yLjku
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25f
My4zLjIuYmIKaW5kZXggMzQ1N2E5MTQ5MC4uMWJhMzNkZTc5ZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuOS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMy4yLmJiCkBAIC03LDcg
KzcsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT02MWMzZWU4OTYxNTc1
ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQyNDljOTAyMmFi
MTMyODZiMTdiZDY2ZjMwNjA5ZTgwMGM1Zjk1ZWZlZWNiMDYxNjg5OTBjN2E2NmNlY2RlNmMiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTc4OWQ5ZmQ5MzliNzRmYjhjNTcyZmMyYjY4OWUzYjE0YmQx
NDFiYTk1MjQzNjkzYTU0NjA2NGM4MTc5YTFkMyIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMz
IGN5dGhvbgogCi0tIAoyLjQ3LjEKCg==

--===============2933659780826665839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.9" to "3.3.2"
packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.9.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.3.2.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27465256 to 27913960 (+2%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: FILELIST: added "/usr/lib/python3.15/site-packages/Cython/.debug/_shared.cpython-315-x86_64-linux-gnu.so /usr/lib/python3.15/site-packages/Cython/Compiler/.debug/StringEncoding.cpython-315-x86_64-linux-gnu.so /usr/lib/python3.15/site-packages/Cython/.debug/LZSS.cpython-315-x86_64-linux-gnu.so"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.9" to "3.3.2"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.9" to "3.3.2"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.9" to "3.3.2"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.9" to "3.3.2"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23866107 to 26250812 (+10%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Plex -> /usr/src/debug/python3-cython/3.3.2/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Runtime -> /usr/src/debug/python3-cython/3.3.2/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Tempita -> /usr/src/debug/python3-cython/3.3.2/Cython/Tempita, removed "/usr/src/debug/python3-cython/3.2.9/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.2.9/Cython/Utils.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.2.9/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FusedNode.c
 ", added "/usr/src/debug/python3-cython/3.3.2/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.3.2/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.3.2/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.3.2/Cython/Utils.c /usr/src/debug/python3-cython/3.3.2/Cython/_shared.c /usr/src/debug/python3-cython/3.3.2/Cython/LZSS.c /usr/src/debug/python3-cython/3.3.2/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.3.2/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.3.2/Cython/Compiler/StringEncoding.c /usr/src/debug/python3-cython/3.3.2/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.3.2/Cython/Compiler/FusedNode.c /usr/src/debug/python3-cython/3.3.2/Cython/Compiler/FlowControl.c"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.9" to "3.3.2"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.9" to "3.3.2"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15404129 to 16235424 (+5%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.15/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.15/site-packages/cython-3.3.2.dist-info, removed "/usr/lib/python3.15/site-packages/Cython/Utility/Printing.c /usr/lib/python3.15/site-packages/Cython/__init__.pyi /usr/lib/python3.15/site-packages/Cython/Shadow.pyi", added "/usr/lib/python3.15/site-packages/Cython/Compiler/StringEncoding.cpython-315-x86_64-linux-gnu.so /usr/lib/python3.15/site-packages/Cython/Includes/libc/stdbool.pxd /usr/lib/python3.15/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.15/site-packages/Cython/Utility/MatchCase.c /usr/lib/python3.15/site-packages/Cython/LZSS.cpython-315-x86_64-linux-gnu.so /usr/lib/python3.15/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.15/site-packages/Cython/__pycache__/LZSS.cpython-315.pyc /usr/lib/python3.15/site-packages/Cython/_shared.cpython-315-x86_64-linux-gnu.so /usr/lib/py
 thon3.15/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.15/site-packages/Cython/LZSS.py /usr/lib/python3.15/site-packages/Cython/Includes/cpython/frozendict.pxd"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.2 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.9" to "3.3.2"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.15/site-packages/cython-3.2.9.dist-info moved to /usr/lib/python3.15/site-packages/cython-3.3.2.dist-info
  /usr/lib/python3.15/site-packages/Cython/Compiler/StringEncoding.cpython-315-x86_64-linux-gnu.so was added
  /usr/lib/python3.15/site-packages/Cython/Includes/cpython/frozendict.pxd was added
  /usr/lib/python3.15/site-packages/Cython/Includes/cpython/sentinel.pxd was added
  /usr/lib/python3.15/site-packages/Cython/Includes/libc/stdbool.pxd was added
  /usr/lib/python3.15/site-packages/Cython/LZSS.cpython-315-x86_64-linux-gnu.so was added
  /usr/lib/python3.15/site-packages/Cython/LZSS.py was added
  /usr/lib/python3.15/site-packages/Cython/__pycache__/LZSS.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/Cython/_shared.cpython-315-x86_64-linux-gnu.so was added
  /usr/lib/python3.15/site-packages/Cython/Utility/Exceptions_Cy.pyx was added
  /usr/lib/python3.15/site-packages/Cython/Utility/MatchCase.c was added
  /usr/lib/python3.15/site-packages/Cython/Utility/MatchCase_Cy.pyx was added
  /usr/lib/python3.15/site-packages/Cython/__init__.pyi was removed
  /usr/lib/python3.15/site-packages/Cython/Shadow.pyi was removed
  /usr/lib/python3.15/site-packages/Cython/Utility/Printing.c was removed

--===============2933659780826665839==--
