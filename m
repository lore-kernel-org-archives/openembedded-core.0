Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4613.1794032728821399918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 22:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oxgJIyBN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=giaekx/R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1b4aef6b2-298d2ba2-b8c3-49e3-b842-370e4955c545-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794032727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KTFEaenqyT+x3QenheuJNprmgnZNdSCAWGr+vPWHZXo=;
	b=oxgJIyBNbTVRVcal2JlJWuwVXyHhdBGgQaN6Z+5gl7CxEYvUjqtkHZhkjT1b/nl2
	5nM7THnJ2vs/jDo9XMkfykiHgXQ1AIWs3UNYaASLCaxEsE4/aZgU/S31ROkL9FCpwj/
	jaWayUlT8fmzs2sFTcnISW8b9JPTGGgIzpaDjlYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794032727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KTFEaenqyT+x3QenheuJNprmgnZNdSCAWGr+vPWHZXo=;
	b=giaekx/RB69Z4lp+S0MylzwOk9RI8te4S+C1Uob6QNPtm15nOgQ0cnebSeGWqQSL
	edGUSrl2+wSq1O95xVaTLP7Hwb1NgiBTK4KRtIkpNPRc6jR+Bmrkh0Q9PZbwN+3s4bd
	rNXGHSWaCw31HWizPVfbAUQlJ/sSxr7jg/J2/HmY=
Content-Type: multipart/mixed; boundary="===============1018625172823896756=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex,python3-pycryptodome: upgrading to
 3.24.2,4.3.0 FAILED
Message-ID: <010101a1b4aef6b2-298d2ba2-b8c3-49e3-b842-370e4955c545-000000@us-west-2.amazonses.com>
Date: Sat, 7 Nov 2026 06:25:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.07-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 06:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249721

--===============1018625172823896756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodomex,python3-pycryptodome* to *3.24.2,4.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch
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
From 0dc8623ea1460e2b82472f835f47bccc1525073d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 7 Nov 2026 05:14:33 +0000
Subject: [PATCH] python3-pycryptodomex,python3-pycryptodome: upgrade 3.24.1 ->
 3.24.2,3.24.1 -> 4.3.0

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------

4.3.0 (2 November 2026)

New features
------------

Other changes
-------------

Resolved issues
---------------

4.2.0 (24 October 2026)

New features
------------

4.1.0 (19 October 2026)

New features
------------

Resolved issues
---------------

4.0.1 (17 October 2026)

New features
------------

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------
---
 .../python/python-pycryptodome.inc            |  2 +-
 .../python/python3-pycryptodome_3.24.1.bb     |  6 ---
 .../python/python3-pycryptodome_4.3.0.bb      | 47 +++++++++++++++++++
 ...4.1.bb => python3-pycryptodomex_3.24.2.bb} |  2 +-
 4 files changed, 49 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.24.1.bb => python3-pycryptodomex_3.24.2.bb} (76%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index a0181874cd..8f2b9025dd 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "BSD-2-Clause AND Unlicense"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a514b4a7ad24677ae50f3becb03404e3"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
deleted file mode 100644
index 0aa53559d6..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-pycryptodome.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "3f9e74444c0ecbec7af232a95d282c74b114d53212ce075ed17b7fd7dca32bb3"
-
-CVE_PRODUCT = "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb
new file mode 100644
index 0000000000..699c9120d3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb
@@ -0,0 +1,47 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.rst
+# +++ LICENSE.rst
+# @@ -3,6 +3,10 @@
+#  
+#  In either case, there are minimal if no restrictions on the redistribution,
+#  modification and usage of the software.
+# +
+# +Files that do not include the license text refer to it with an SPDX tag:
+# +``SPDX-License-Identifier: BSD-2-Clause`` for the BSD license below
+# +(``SPDX-FileCopyrightText`` gives the copyright notice).
+#  
+#  Public domain
+#  =============
+# @@ -59,3 +63,16 @@
+#  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+#  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +
+# +Third-party code
+# +================
+# +
+# +The directory ``src/mldsa-native`` contains code from mldsa-native
+# +(https://github.com/pq-code-package/mldsa-native), available under
+# +the Apache-2.0 license OR the ISC license OR the MIT license.
+# +See ``src/mldsa-native/LICENSE`` for the full text of the licenses.
+# +
+# +The directory ``src/mlkem-native`` contains code from mlkem-native
+# +(https://github.com/pq-code-package/mlkem-native), available under
+# +the Apache-2.0 license OR the ISC license OR the MIT license.
+# +See ``src/mlkem-native/LICENSE`` for the full text of the licenses.
+# 
+#
+
+require python-pycryptodome.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "663fc5e1c4a3562d00c3a9b265fb94ef5f68c6085d982638b83e713af5487c06"
+
+CVE_PRODUCT = "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb
index b24e047a19..29e3d600a5 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356"
+SRC_URI[sha256sum] = "e4dbc29e2575365d15e272f769329106277649aea081e2119cf43d66950f8f8f"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome pycryptodome:pycryptodomex"
 
-- 
2.47.1


--===============1018625172823896756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

4.3.0 (2 November 2026)

New features
------------

Other changes
-------------

Resolved issues
---------------

4.2.0 (24 October 2026)

New features
------------

4.1.0 (19 October 2026)

New features
------------

Resolved issues
---------------

4.0.1 (17 October 2026)

New features
------------

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------

--===============1018625172823896756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pycryptodomex-changelog.txt"

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------

--===============1018625172823896756==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch"

RnJvbSAwZGM4NjIzZWExNDYwZTJiODI0NzJmODM1ZjQ3YmNjYzE1MjUwNzNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNyBOb3YgMjAyNiAwNToxNDozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21leCxweXRob24zLXB5Y3J5cHRvZG9tZTogdXBncmFkZSAzLjI0LjEg
LT4KIDMuMjQuMiwzLjI0LjEgLT4gNC4zLjAKCjMuMjQuMiAoNSBOb3ZlbWJlciAyMDI2KQpUaGlz
IHJlbGVhc2UgaXMgb25seSBmb3IgYGBweWNyeXB0b2RvbWV4YGAuCgpSZXNvbHZlZCBpc3N1ZXMK
LS0tLS0tLS0tLS0tLS0tCgpPdGhlciBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0KCjQuMy4wICgyIE5v
dmVtYmVyIDIwMjYpCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgpPdGhlciBjaGFuZ2VzCi0t
LS0tLS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0tLS0tLS0KCjQuMi4wICgyNCBP
Y3RvYmVyIDIwMjYpCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgo0LjEuMCAoMTkgT2N0b2Jl
ciAyMDI2KQoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKUmVzb2x2ZWQgaXNzdWVzCi0tLS0t
LS0tLS0tLS0tLQoKNC4wLjEgKDE3IE9jdG9iZXIgMjAyNikKCk5ldyBmZWF0dXJlcwotLS0tLS0t
LS0tLS0KCjQuMC4wICgxNCBPY3RvYmVyIDIwMjYpCgpCcmVha2luZyBjaGFuZ2VzCi0tLS0tLS0t
LS0tLS0tLS0KCkRlcHJlY2F0aW9ucwotLS0tLS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0t
LS0tLS0tLS0tLS0KCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KLS0tCiAuLi4vcHl0aG9uL3B5
dGhvbi1weWNyeXB0b2RvbWUuaW5jICAgICAgICAgICAgfCAgMiArLQogLi4uL3B5dGhvbi9weXRo
b24zLXB5Y3J5cHRvZG9tZV8zLjI0LjEuYmIgICAgIHwgIDYgLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcHljcnlwdG9kb21lXzQuMy4wLmJiICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrCiAu
Li40LjEuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMi5iYn0gfCAgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2Rv
bWVfMy4yNC4xLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV80LjMuMC5iYgogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjEuYmIgPT4gcHl0aG9u
My1weWNyeXB0b2RvbWV4XzMuMjQuMi5iYn0gKDc2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1weWNyeXB0b2RvbWUuaW5jIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24tcHljcnlwdG9kb21lLmluYwppbmRleCBhMDE4MTg3NGNk
Li44ZjJiOTAyNWRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbi1weWNyeXB0b2RvbWUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKQEAgLTMsNyArMyw3IEBAIERFU0NSSVBUSU9OID0gIlB5
Q3J5cHRvZG9tZSBpcyBhIHNlbGYtY29udGFpbmVkIFB5dGhvbiBwYWNrYWdlIG9mIGxvdy1sZXZl
bFwKICBjcnlwdG9ncmFwaGljIHByaW1pdGl2ZXMuIgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5w
eWNyeXB0b2RvbWUub3JnIgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UgQU5EIFVubGljZW5zZSIK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21kNT0yOTI0MmE3MDQxMGE0
ZWVmZjQ4OGEyODE2NGU3YWI5MyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
cnN0O21kNT1hNTE0YjRhN2FkMjQ2NzdhZTUwZjNiZWNiMDM0MDRlMyIKIAogaW5oZXJpdCBweXBp
CiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNy
eXB0b2RvbWVfMy4yNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y3J5cHRvZG9tZV8zLjI0LjEuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDBh
YTUzNTU5ZDYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5Y3J5cHRvZG9tZV8zLjI0LjEuYmIKKysrIC9kZXYvbnVsbApAQCAtMSw2ICswLDAg
QEAKLXJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKLWluaGVyaXQgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YQotCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Y5ZTc0NDQ0YzBlY2Jl
YzdhZjIzMmE5NWQyODJjNzRiMTE0ZDUzMjEyY2UwNzVlZDE3YjdmZDdkY2EzMmJiMyIKLQotQ1ZF
X1BST0RVQ1QgPSAicHljcnlwdG9kb21lOnB5Y3J5cHRvZG9tZSIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfNC4zLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzQuMy4wLmJi
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjY5OWM5MTIwZDMKLS0tIC9k
ZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlw
dG9kb21lXzQuMy4wLmJiCkBAIC0wLDAgKzEsNDcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBM
SUNFTlNFLnJzdAorIyArKysgTElDRU5TRS5yc3QKKyMgQEAgLTMsNiArMywxMCBAQAorIyAgCisj
ICBJbiBlaXRoZXIgY2FzZSwgdGhlcmUgYXJlIG1pbmltYWwgaWYgbm8gcmVzdHJpY3Rpb25zIG9u
IHRoZSByZWRpc3RyaWJ1dGlvbiwKKyMgIG1vZGlmaWNhdGlvbiBhbmQgdXNhZ2Ugb2YgdGhlIHNv
ZnR3YXJlLgorIyArCisjICtGaWxlcyB0aGF0IGRvIG5vdCBpbmNsdWRlIHRoZSBsaWNlbnNlIHRl
eHQgcmVmZXIgdG8gaXQgd2l0aCBhbiBTUERYIHRhZzoKKyMgK2BgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEJTRC0yLUNsYXVzZWBgIGZvciB0aGUgQlNEIGxpY2Vuc2UgYmVsb3cKKyMgKyhgYFNQ
RFgtRmlsZUNvcHlyaWdodFRleHRgYCBnaXZlcyB0aGUgY29weXJpZ2h0IG5vdGljZSkuCisjICAK
KyMgIFB1YmxpYyBkb21haW4KKyMgID09PT09PT09PT09PT0KKyMgQEAgLTU5LDMgKzYzLDE2IEBA
CisjICBDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkgT0YgTElBQklMSVRZLCBXSEVUSEVSIElOIENP
TlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLAorIyAgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VO
Q0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UKKyMgIE9G
IFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VD
SCBEQU1BR0UuCisjICsKKyMgK1RoaXJkLXBhcnR5IGNvZGUKKyMgKz09PT09PT09PT09PT09PT0K
KyMgKworIyArVGhlIGRpcmVjdG9yeSBgYHNyYy9tbGRzYS1uYXRpdmVgYCBjb250YWlucyBjb2Rl
IGZyb20gbWxkc2EtbmF0aXZlCisjICsoaHR0cHM6Ly9naXRodWIuY29tL3BxLWNvZGUtcGFja2Fn
ZS9tbGRzYS1uYXRpdmUpLCBhdmFpbGFibGUgdW5kZXIKKyMgK3RoZSBBcGFjaGUtMi4wIGxpY2Vu
c2UgT1IgdGhlIElTQyBsaWNlbnNlIE9SIHRoZSBNSVQgbGljZW5zZS4KKyMgK1NlZSBgYHNyYy9t
bGRzYS1uYXRpdmUvTElDRU5TRWBgIGZvciB0aGUgZnVsbCB0ZXh0IG9mIHRoZSBsaWNlbnNlcy4K
KyMgKworIyArVGhlIGRpcmVjdG9yeSBgYHNyYy9tbGtlbS1uYXRpdmVgYCBjb250YWlucyBjb2Rl
IGZyb20gbWxrZW0tbmF0aXZlCisjICsoaHR0cHM6Ly9naXRodWIuY29tL3BxLWNvZGUtcGFja2Fn
ZS9tbGtlbS1uYXRpdmUpLCBhdmFpbGFibGUgdW5kZXIKKyMgK3RoZSBBcGFjaGUtMi4wIGxpY2Vu
c2UgT1IgdGhlIElTQyBsaWNlbnNlIE9SIHRoZSBNSVQgbGljZW5zZS4KKyMgK1NlZSBgYHNyYy9t
bGtlbS1uYXRpdmUvTElDRU5TRWBgIGZvciB0aGUgZnVsbCB0ZXh0IG9mIHRoZSBsaWNlbnNlcy4K
KyMgCisjCisKK3JlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKK2luaGVyaXQgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YQorCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjYzZmM1ZTFj
NGEzNTYyZDAwYzNhOWIyNjVmYjk0ZWY1ZjY4YzYwODVkOTgyNjM4YjgzZTcxM2FmNTQ4N2MwNiIK
KworQ1ZFX1BST0RVQ1QgPSAicHljcnlwdG9kb21lOnB5Y3J5cHRvZG9tZSIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQu
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4
XzMuMjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDc2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQu
Mi5iYgppbmRleCBiMjRlMDQ3YTE5Li4yOWUzZDYwMGE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yNC4y
LmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5o
ZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIwOTA4MTY2NmZmYzU5OTk3NmMwYjhiMjljYWYyY2Y4MjIxMmMwZjA1YmVkMjMzYzhmOGVkNTNl
NGY2ZTFkMzU2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU0ZGJjMjllMjU3NTM2NWQxNWUyNzJm
NzY5MzI5MTA2Mjc3NjQ5YWVhMDgxZTIxMTljZjQzZDY2OTUwZjhmOGYiCiAKIENWRV9QUk9EVUNU
ID0gInB5Y3J5cHRvZG9tZTpweWNyeXB0b2RvbWUgcHljcnlwdG9kb21lOnB5Y3J5cHRvZG9tZXgi
CiAKLS0gCjIuNDcuMQoK

--===============1018625172823896756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2003 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-7f74981c5b1aad50a3923c2d25b8a11c89abd6f9"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7f74981c5b1aad50a3923c2d25b8a11c89abd6f9"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 352 Local 328 Mirrors 0 Missed 24 Current 396 (93% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 539 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 595 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 711 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1250 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_recipe_qa)
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-2.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 715 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-2.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1453 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_fetch)
NOTE: Running task 1455 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 732 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 733 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_fetch: Started
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_unpack)
NOTE: Running task 1461 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_unpack: Started
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 739 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1470 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_patch)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_unpack: Succeeded
NOTE: Running task 1471 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_patch)
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 742 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_patch: Succeeded
NOTE: Running task 1744 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1754 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1755 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1873 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_populate_lic)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1892 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_create_recipe_spdx)
NOTE: Running task 1893 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_populate_lic: Started
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_configure)
NOTE: Running task 1895 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_configure)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_configure: Started
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_configure: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.3.0.bb:do_compile)
NOTE: Running task 1897 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_compile)
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_compile: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_compile: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_populate_lic: Failed
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pycryptodome-4.3.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1897 tasks of which 1880 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261107051352.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261107051352.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodomex/3.24.2/temp/log.do_populate_lic.4166894
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pycryptodomex-3.24.2-r0 do_populate_lic: QA Issue: python3-pycryptodomex: The LIC_FILES_CHKSUM does not match for file://LICENSE.rst;md5=a514b4a7ad24677ae50f3becb03404e3
python3-pycryptodomex: The new md5 checksum is 29242a70410a4eeff488a28164e7ab93
python3-pycryptodomex: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
The source code in PyCryptodome is partially in the public domain
and partially released under the BSD 2-Clause license.

In either case, there are minimal if no restrictions on the redistribution,
modification and usage of the software.

Public domain
=============

All code originating from  PyCrypto is free and unencumbered software
...
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python3-pycryptodomex: Check if the license information has changed in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodomex/3.24.2/sources/pycryptodomex-3.24.2/LICENSE.rst to verify that the LICENSE value "BSD-2-Clause AND Unlicense" remains valid [license-checksum]
ERROR: python3-pycryptodomex-3.24.2-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodomex/3.24.2/temp/log.do_populate_lic.4166894
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_populate_lic) failed with exit code '1'

--===============1018625172823896756==--
