Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5513.1792563746982370412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nlU5wqsm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kobJ14gm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a15d2014a7-e99b50de-ec0f-4292-a3d6-35e0cec38668-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N8WMga7oBDenukjAY9wPEpyzihGzZ6A4m5syoMaszQo=;
	b=nlU5wqsmd+A9h3hcZOxTKZt9BoaFzPCc3/Hmf9cyhUCXxZl+jik4kHHIte0bkv1P
	9EAZS3FHzGi3gPfskypjL6UcCObDB4BO2heRBeCJ3RarB178KocfMSCSmhcz7+twVQs
	v0SJulA1jhgeIBTYAg2I/irhyiNbrGYPJUHwY1X0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N8WMga7oBDenukjAY9wPEpyzihGzZ6A4m5syoMaszQo=;
	b=kobJ14gm9HUuPSZCmq2UqBj4f9OKe49qNzQaw8PfxYukcjueKE8f6TMawARR78Vb
	Ezig8e7wioJx2L9yk0miOym5BmKJCOCc3c3Px6ZNuuGLg3JJy5ANgiQdcA7HCbNeS4/
	7QfQgAhkgEi12FWxoHsuvvqLdHucKOvi41C8CtCQ=
Content-Type: multipart/mixed; boundary="===============8267561206649009507=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.2.2 SUCCEEDED
Message-ID: <010101a15d2014a7-e99b50de-ec0f-4292-a3d6-35e0cec38668-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 06:22:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248354

--===============8267561206649009507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.2.1-26.2.2.patch
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
From 3d854dfc2eb7e8eaa63c41abcd213bf215cfc943 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 21 Oct 2026 05:29:02 +0000
Subject: [PATCH] python3-pip: upgrade 26.2.1 -> 26.2.2

26.2.2 (2026-10-20)
===================

Vendored Libraries
------------------

- Upgrade certifi to 2026.10.19
---
 .../python/python3-pip/no_shebang_mangling.patch          | 8 ++++----
 .../{python3-pip_26.2.1.bb => python3-pip_26.2.2.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.2.1.bb => python3-pip_26.2.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index e8b2982b2a..f388928230 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From e4e1fed9f8e3ff3e04467699f36599f76caa9487 Mon Sep 17 00:00:00 2001
+From ea75b7fc017f7a1a3a47e9e2bef21209f0f36a04 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index 195dc3f..a0e0d61 100644
+index ac9e909..1faa5b6 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -155,6 +155,8 @@ class ScriptMaker(object):
+@@ -157,6 +157,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -25,7 +25,7 @@ index 195dc3f..a0e0d61 100644
          if os.name != 'posix':
              simple_shebang = True
          elif getattr(sys, "cross_compiling", False):
-@@ -363,7 +365,7 @@ class ScriptMaker(object):
+@@ -367,7 +369,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_26.2.1.bb b/meta/recipes-devtools/python/python3-pip_26.2.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.2.2.bb
index 7f041f822e..c83c9e4468 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.2.bb
@@ -26,7 +26,7 @@ inherit pypi python_flit_core
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f"
+SRC_URI[sha256sum] = "3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f"
 
 CVE_PRODUCT = "pypa:pip"
 
-- 
2.47.1


--===============8267561206649009507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.2.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.2.2.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.2.1" to "26.2.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.2.1" to "26.2.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.2.1" to "26.2.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.2.1" to "26.2.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.2.1" to "26.2.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.2.1" to "26.2.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.2.1" to "26.2.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/li
 b/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip
 /_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/sit
 e-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests, added "/usr/lib/python3.14/s
 ite-packages/pip/_vendor/certifi/tests/test_certify.py /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/test_certify.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/__init__.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.2.1 [default] to 26.2.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10653168 to 10660488 (+0%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.2.1" to "26.2.2"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/test_certify.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/test_certify.py was added

--===============8267561206649009507==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.2.1-26.2.2.patch"

RnJvbSAzZDg1NGRmYzJlYjdlOGVhYTYzYzQxYWJjZDIxM2JmMjE1Y2ZjOTQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjYgMDU6Mjk6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyNi4yLjEgLT4gMjYuMi4yCgoyNi4yLjIgKDIwMjYtMTAtMjAp
Cj09PT09PT09PT09PT09PT09PT0KClZlbmRvcmVkIExpYnJhcmllcwotLS0tLS0tLS0tLS0tLS0t
LS0KCi0gVXBncmFkZSBjZXJ0aWZpIHRvIDIwMjYuMTAuMTkKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2ggICAgICAgICAgfCA4ICsrKystLS0tCiAu
Li4ve3B5dGhvbjMtcGlwXzI2LjIuMS5iYiA9PiBweXRob24zLXBpcF8yNi4yLjIuYmJ9ICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBpcF8yNi4yLjEu
YmIgPT4gcHl0aG9uMy1waXBfMjYuMi4yLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19t
YW5nbGluZy5wYXRjaAppbmRleCBlOGIyOTgyYjJhLi5mMzg4OTI4MjMwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xp
bmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9u
b19zaGViYW5nX21hbmdsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlNGUxZmVkOWY4
ZTNmZjNlMDQ0Njc2OTlmMzY1OTlmNzZjYWE5NDg3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBlYTc1YjdmYzAxN2Y3YTFhM2E0N2U5ZTJiZWYyMTIwOWYwZjM2YTA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIzIEZlYiAyMDIyIDEyOjI3OjA2ICswMDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtcGlwOiBEb24ndCBjaGFuZ2Ugc2hlYmFuZwpAQCAtMTMs
MTAgKzEzLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3BlY2lmaWMg
Y29uZmlnXQogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL3NyYy9waXAvX3ZlbmRvci9kaXN0bGliL3NjcmlwdHMucHkgYi9zcmMv
cGlwL192ZW5kb3IvZGlzdGxpYi9zY3JpcHRzLnB5Ci1pbmRleCAxOTVkYzNmLi5hMGUwZDYxIDEw
MDY0NAoraW5kZXggYWM5ZTkwOS4uMWZhYTViNiAxMDA2NDQKIC0tLSBhL3NyYy9waXAvX3ZlbmRv
ci9kaXN0bGliL3NjcmlwdHMucHkKICsrKyBiL3NyYy9waXAvX3ZlbmRvci9kaXN0bGliL3Njcmlw
dHMucHkKLUBAIC0xNTUsNiArMTU1LDggQEAgY2xhc3MgU2NyaXB0TWFrZXIob2JqZWN0KToKK0BA
IC0xNTcsNiArMTU3LDggQEAgY2xhc3MgU2NyaXB0TWFrZXIob2JqZWN0KToKICAgICAgICAgIFNl
ZSBhbHNvOiBodHRwOi8vd3d3LmluLXVsbS5kZS9+bWFzY2hlY2svdmFyaW91cy9zaGViYW5nLyNs
ZW5ndGgKICAgICAgICAgICAgICAgICAgICBodHRwczovL2hnLm1vemlsbGEub3JnL21vemlsbGEt
Y2VudHJhbC9maWxlL3RpcC9tYWNoCiAgICAgICAgICAiIiIKQEAgLTI1LDcgKzI1LDcgQEAgaW5k
ZXggMTk1ZGMzZi4uYTBlMGQ2MSAxMDA2NDQKICAgICAgICAgIGlmIG9zLm5hbWUgIT0gJ3Bvc2l4
JzoKICAgICAgICAgICAgICBzaW1wbGVfc2hlYmFuZyA9IFRydWUKICAgICAgICAgIGVsaWYgZ2V0
YXR0cihzeXMsICJjcm9zc19jb21waWxpbmciLCBGYWxzZSk6Ci1AQCAtMzYzLDcgKzM2NSw3IEBA
IGNsYXNzIFNjcmlwdE1ha2VyKG9iamVjdCk6CitAQCAtMzY3LDcgKzM2OSw3IEBAIGNsYXNzIFNj
cmlwdE1ha2VyKG9iamVjdCk6CiAgICAgICAgICAgICAgICAgIHJldHVybgogIAogICAgICAgICAg
ICAgIG1hdGNoID0gRklSU1RfTElORV9SRS5tYXRjaChmaXJzdF9saW5lLnJlcGxhY2UoYidcclxu
JywgYidcbicpKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXBpcF8yNi4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cGlwXzI2LjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2LjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4yLjIuYmIKaW5kZXggN2YwNDFm
ODIyZS4uYzgzYzllNDQ2OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBpcF8yNi4yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBpcF8yNi4yLjIuYmIKQEAgLTI2LDcgKzI2LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9mbGl0X2NvcmUKIAogU1JDX1VSSSArPSAiZmlsZTovL25vX3NoZWJhbmdfbWFuZ2xpbmcu
cGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNmFkNjY3ZTg5YTFmZTc4MDQ2YzhmMTMy
MzJiMjQ3MjAwZjUyNThkNzgyOGYzZjc4ODNkNjYwODc4ZTA4MTNmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjNhOGU1YzgwMDQ5Mjc4N2YzM2E0MTE0ZWY1NDQ0NDU0NmMzNDBkZjQyODk3NGViYmEx
N2UwZmQ0N2UxMWFmMmYiCiAKIENWRV9QUk9EVUNUID0gInB5cGE6cGlwIgogCi0tIAoyLjQ3LjEK
Cg==

--===============8267561206649009507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pip-changelog.txt"

26.2.2 (2026-10-20)
===================

Vendored Libraries
------------------

- Upgrade certifi to 2026.10.19

--===============8267561206649009507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/p
 ip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-pack
 ages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packa
 ges/pip-26.2.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli, added "/usr/lib/python3.14/s
 ite-packages/pip/_vendor/certifi/tests/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/test_certify.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/test_certify.py"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/__pycache__/test_certify.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/certifi/tests/test_certify.py was added

--===============8267561206649009507==--
