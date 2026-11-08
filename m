Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8304.1794115342733869472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 21:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Iz/+6w8n;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZSzPiqNi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1b99b8d2b-66851801-e4c7-4405-9008-9f9cc2c66994-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794115341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7c9T4C90xl9fcAOuCWoMT273PqQwhtY8FIM+Cp4jwkE=;
	b=Iz/+6w8nGHAUlHXmllkcaee0S+r2Gz7q70CYuXiw+NF3DUDvEP277MK0Db8R2wu5
	VBLbqlM8zZkbh1LVSV5OEth0++atFEHOauBOpMbRPsoTaORKGjIYIvjBOBh8lCuREYD
	2MB1DSspYsfXIeyX+p1LokvHhZOjeot0180qCK9M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794115341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7c9T4C90xl9fcAOuCWoMT273PqQwhtY8FIM+Cp4jwkE=;
	b=ZSzPiqNiNBz4oSuXtYAEhz4lC/SfY880AtUk+5QO06u+yMacUc5mC9bCRqfrAHaE
	1LuSpDxSmITkjZUuelvHSZZzqDau2tj1kFcJxWH8EfxBcwXFTkYPvjwZnSyAIAeR3aP
	ybP+7hx62SoMlYVYB1R7JyuZQJHiUqqBEsaInWZY=
Content-Type: multipart/mixed; boundary="===============3519064617118151970=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome,python3-pycryptodomex: upgrading to
 4.4.0,3.24.2 FAILED
Message-ID: <010101a1b99b8d2b-66851801-e4c7-4405-9008-9f9cc2c66994-000000@us-west-2.amazonses.com>
Date: Sun, 8 Nov 2026 05:22:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.08-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 05:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249746

--===============3519064617118151970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodome,python3-pycryptodomex* to *4.4.0,3.24.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch
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
From fa99ba835da15fe5e349a7a1de6aee4debe9ee00 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 8 Nov 2026 05:08:06 +0000
Subject: [PATCH] python3-pycryptodome,python3-pycryptodomex: upgrade 3.24.1 ->
 4.4.0,3.24.1 -> 3.24.2

4.4.0 (7 November 2026)

New features
------------

Resolved issues
---------------

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

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------
---
 .../python/python3-pycryptodome_3.24.1.bb     |  6 ---
 .../python/python3-pycryptodome_4.4.0.bb      | 47 +++++++++++++++++++
 ...4.1.bb => python3-pycryptodomex_3.24.2.bb} |  2 +-
 3 files changed, 48 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.24.1.bb => python3-pycryptodomex_3.24.2.bb} (76%)

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
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb
new file mode 100644
index 0000000000..3b95f803a3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb
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
+SRC_URI[sha256sum] = "eab7620c60c85f3fa251d026ec06e094f036d96187bebb9752e46fbcebabbb55"
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


--===============3519064617118151970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

4.4.0 (7 November 2026)

New features
------------

Resolved issues
---------------

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

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------

--===============3519064617118151970==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch"

RnJvbSBmYTk5YmE4MzVkYTE1ZmU1ZTM0OWE3YTFkZTZhZWU0ZGViZTllZTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOCBOb3YgMjAyNiAwNTowODowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21lLHB5dGhvbjMtcHljcnlwdG9kb21leDogdXBncmFkZSAzLjI0LjEg
LT4KIDQuNC4wLDMuMjQuMSAtPiAzLjI0LjIKCjQuNC4wICg3IE5vdmVtYmVyIDIwMjYpCgpOZXcg
ZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgpSZXNvbHZlZCBpc3N1ZXMKLS0tLS0tLS0tLS0tLS0tCgo0
LjMuMCAoMiBOb3ZlbWJlciAyMDI2KQoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKT3RoZXIg
Y2hhbmdlcwotLS0tLS0tLS0tLS0tCgpSZXNvbHZlZCBpc3N1ZXMKLS0tLS0tLS0tLS0tLS0tCgo0
LjIuMCAoMjQgT2N0b2JlciAyMDI2KQoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKNC4xLjAg
KDE5IE9jdG9iZXIgMjAyNikKCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KClJlc29sdmVkIGlz
c3VlcwotLS0tLS0tLS0tLS0tLS0KCjQuMC4xICgxNyBPY3RvYmVyIDIwMjYpCgpOZXcgZmVhdHVy
ZXMKLS0tLS0tLS0tLS0tCgo0LjAuMCAoMTQgT2N0b2JlciAyMDI2KQoKQnJlYWtpbmcgY2hhbmdl
cwotLS0tLS0tLS0tLS0tLS0tCgpEZXByZWNhdGlvbnMKLS0tLS0tLS0tLS0tCgpSZXNvbHZlZCBp
c3N1ZXMKLS0tLS0tLS0tLS0tLS0tCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgozLjI0LjIg
KDUgTm92ZW1iZXIgMjAyNikKVGhpcyByZWxlYXNlIGlzIG9ubHkgZm9yIGBgcHljcnlwdG9kb21l
eGBgLgoKUmVzb2x2ZWQgaXNzdWVzCi0tLS0tLS0tLS0tLS0tLQoKT3RoZXIgY2hhbmdlcwotLS0t
LS0tLS0tLS0tCgozLjI0LjIgKDUgTm92ZW1iZXIgMjAyNikKVGhpcyByZWxlYXNlIGlzIG9ubHkg
Zm9yIGBgcHljcnlwdG9kb21leGBgLgoKUmVzb2x2ZWQgaXNzdWVzCi0tLS0tLS0tLS0tLS0tLQoK
T3RoZXIgY2hhbmdlcwotLS0tLS0tLS0tLS0tCi0tLQogLi4uL3B5dGhvbi9weXRob24zLXB5Y3J5
cHRvZG9tZV8zLjI0LjEuYmIgICAgIHwgIDYgLS0tCiAuLi4vcHl0aG9uL3B5dGhvbjMtcHljcnlw
dG9kb21lXzQuNC4wLmJiICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrCiAuLi40LjEuYmIg
PT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMi5iYn0gfCAgMiArLQogMyBmaWxlcyBjaGFu
Z2VkLCA0OCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4x
LmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Y3J5cHRvZG9tZV80LjQuMC5iYgogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjEuYmIgPT4gcHl0aG9uMy1weWNyeXB0
b2RvbWV4XzMuMjQuMi5iYn0gKDc2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjQuMS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJiCmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwYWE1MzU1OWQ2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJiCisrKyAv
ZGV2L251bGwKQEAgLTEsNiArMCwwIEBACi1yZXF1aXJlIHB5dGhvbi1weWNyeXB0b2RvbWUuaW5j
Ci1pbmhlcml0IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKLQotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjNmOWU3NDQ0NGMwZWNiZWM3YWYyMzJhOTVkMjgyYzc0YjExNGQ1MzIxMmNlMDc1ZWQx
N2I3ZmQ3ZGNhMzJiYjMiCi0KLUNWRV9QUk9EVUNUID0gInB5Y3J5cHRvZG9tZTpweWNyeXB0b2Rv
bWUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlj
cnlwdG9kb21lXzQuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y3J5cHRvZG9tZV80LjQuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi4zYjk1ZjgwM2EzCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV80LjQuMC5iYgpAQCAtMCwwICsxLDQ3IEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5yc3QKKyMgKysrIExJQ0VOU0UucnN0CisjIEBA
IC0zLDYgKzMsMTAgQEAKKyMgIAorIyAgSW4gZWl0aGVyIGNhc2UsIHRoZXJlIGFyZSBtaW5pbWFs
IGlmIG5vIHJlc3RyaWN0aW9ucyBvbiB0aGUgcmVkaXN0cmlidXRpb24sCisjICBtb2RpZmljYXRp
b24gYW5kIHVzYWdlIG9mIHRoZSBzb2Z0d2FyZS4KKyMgKworIyArRmlsZXMgdGhhdCBkbyBub3Qg
aW5jbHVkZSB0aGUgbGljZW5zZSB0ZXh0IHJlZmVyIHRvIGl0IHdpdGggYW4gU1BEWCB0YWc6Cisj
ICtgYFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2VgYCBmb3IgdGhlIEJTRCBs
aWNlbnNlIGJlbG93CisjICsoYGBTUERYLUZpbGVDb3B5cmlnaHRUZXh0YGAgZ2l2ZXMgdGhlIGNv
cHlyaWdodCBub3RpY2UpLgorIyAgCisjICBQdWJsaWMgZG9tYWluCisjICA9PT09PT09PT09PT09
CisjIEBAIC01OSwzICs2MywxNiBAQAorIyAgQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZIE9GIExJ
QUJJTElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwKKyMgIE9SIFRP
UlQgKElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZ
IE9VVCBPRiBUSEUgVVNFCisjICBPRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0Yg
VEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyArCisjICtUaGlyZC1wYXJ0eSBjb2Rl
CisjICs9PT09PT09PT09PT09PT09CisjICsKKyMgK1RoZSBkaXJlY3RvcnkgYGBzcmMvbWxkc2Et
bmF0aXZlYGAgY29udGFpbnMgY29kZSBmcm9tIG1sZHNhLW5hdGl2ZQorIyArKGh0dHBzOi8vZ2l0
aHViLmNvbS9wcS1jb2RlLXBhY2thZ2UvbWxkc2EtbmF0aXZlKSwgYXZhaWxhYmxlIHVuZGVyCisj
ICt0aGUgQXBhY2hlLTIuMCBsaWNlbnNlIE9SIHRoZSBJU0MgbGljZW5zZSBPUiB0aGUgTUlUIGxp
Y2Vuc2UuCisjICtTZWUgYGBzcmMvbWxkc2EtbmF0aXZlL0xJQ0VOU0VgYCBmb3IgdGhlIGZ1bGwg
dGV4dCBvZiB0aGUgbGljZW5zZXMuCisjICsKKyMgK1RoZSBkaXJlY3RvcnkgYGBzcmMvbWxrZW0t
bmF0aXZlYGAgY29udGFpbnMgY29kZSBmcm9tIG1sa2VtLW5hdGl2ZQorIyArKGh0dHBzOi8vZ2l0
aHViLmNvbS9wcS1jb2RlLXBhY2thZ2UvbWxrZW0tbmF0aXZlKSwgYXZhaWxhYmxlIHVuZGVyCisj
ICt0aGUgQXBhY2hlLTIuMCBsaWNlbnNlIE9SIHRoZSBJU0MgbGljZW5zZSBPUiB0aGUgTUlUIGxp
Y2Vuc2UuCisjICtTZWUgYGBzcmMvbWxrZW0tbmF0aXZlL0xJQ0VOU0VgYCBmb3IgdGhlIGZ1bGwg
dGV4dCBvZiB0aGUgbGljZW5zZXMuCisjIAorIworCityZXF1aXJlIHB5dGhvbi1weWNyeXB0b2Rv
bWUuaW5jCitpbmhlcml0IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKKworU1JDX1VSSVtz
aGEyNTZzdW1dID0gImVhYjc2MjBjNjBjODVmM2ZhMjUxZDAyNmVjMDZlMDk0ZjAzNmQ5NjE4N2Jl
YmI5NzUyZTQ2ZmJjZWJhYmJiNTUiCisKK0NWRV9QUk9EVUNUID0gInB5Y3J5cHRvZG9tZTpweWNy
eXB0b2RvbWUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHljcnlwdG9kb21leF8zLjI0LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjIuYmIKc2ltaWxhcml0eSBpbmRleCA3NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9t
ZXhfMy4yNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHljcnlwdG9kb21leF8zLjI0LjIuYmIKaW5kZXggYjI0ZTA0N2ExOS4uMjllM2Q2MDBhNSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZXhfMy4yNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weWNyeXB0b2RvbWV4XzMuMjQuMi5iYgpAQCAtMSw3ICsxLDcgQEAKIHJlcXVpcmUgcHl0aG9u
LXB5Y3J5cHRvZG9tZS5pbmMKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDkwODE2NjZmZmM1OTk5NzZjMGI4YjI5Y2FmMmNmODIy
MTJjMGYwNWJlZDIzM2M4ZjhlZDUzZTRmNmUxZDM1NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJl
NGRiYzI5ZTI1NzUzNjVkMTVlMjcyZjc2OTMyOTEwNjI3NzY0OWFlYTA4MWUyMTE5Y2Y0M2Q2Njk1
MGY4ZjhmIgogCiBDVkVfUFJPRFVDVCA9ICJweWNyeXB0b2RvbWU6cHljcnlwdG9kb21lIHB5Y3J5
cHRvZG9tZTpweWNyeXB0b2RvbWV4IgogCi0tIAoyLjQ3LjEKCg==

--===============3519064617118151970==
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

--===============3519064617118151970==
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
DISTRO_VERSION       = "6.1.99+snapshot-5247d0d8862c3402ac061fede5844da4d5c4be4c"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:5247d0d8862c3402ac061fede5844da4d5c4be4c"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 543 Local 520 Mirrors 0 Missed 23 Current 205 (95% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 309 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 410 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 232 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_recipe_qa)
NOTE: recipe python3-cffi-2.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-cffi-2.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 453 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 457 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 300 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_fetch: Started
NOTE: Running setscene task 470 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 514 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_fetch: Succeeded
NOTE: Running task 336 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_unpack)
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 337 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_unpack: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_fetch: Started
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 521 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 522 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 338 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_unpack)
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_unpack: Started
NOTE: Running setscene task 557 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 562 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-native-3.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-native-3.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 664 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-native-3.14.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.14.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 501 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_recipe_qa_setscene)
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quilt-native-0.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe quilt-native-0.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1622 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_patch)
NOTE: Running task 1623 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_patch)
NOTE: Running task 1679 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1680 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_patch: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_patch: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1891 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_populate_lic)
NOTE: Running task 1892 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1893 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_populate_lic)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_populate_lic: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_configure)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_configure: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_compile)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_compile: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1896 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_configure)
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_configure: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_compile)
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_compile: Started
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_populate_lic: Failed
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pycryptodome-4.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1897 tasks of which 1880 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261108050722.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261108050722.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.4.0/temp/log.do_populate_lic.3707514
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pycryptodome-4.4.0-r0 do_populate_lic: QA Issue: python3-pycryptodome: The LIC_FILES_CHKSUM does not match for file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93
python3-pycryptodome: The new md5 checksum is a514b4a7ad24677ae50f3becb03404e3
python3-pycryptodome: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
The source code in PyCryptodome is partially in the public domain
and partially released under the BSD 2-Clause license.

In either case, there are minimal if no restrictions on the redistribution,
modification and usage of the software.

Files that do not include the license text refer to it with an SPDX tag:
``SPDX-License-Identifier: BSD-2-Clause`` for the BSD license below
(``SPDX-FileCopyrightText`` gives the copyright notice).

...

The directory ``src/mldsa-native`` contains code from mldsa-native
(https://github.com/pq-code-package/mldsa-native), available under
the Apache-2.0 license OR the ISC license OR the MIT license.
See ``src/mldsa-native/LICENSE`` for the full text of the licenses.

The directory ``src/mlkem-native`` contains code from mlkem-native
(https://github.com/pq-code-package/mlkem-native), available under
the Apache-2.0 license OR the ISC license OR the MIT license.
See ``src/mlkem-native/LICENSE`` for the full text of the licenses.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python3-pycryptodome: Check if the license information has changed in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.4.0/sources/pycryptodome-4.4.0/LICENSE.rst to verify that the LICENSE value "BSD-2-Clause AND Unlicense" remains valid [license-checksum]
ERROR: python3-pycryptodome-4.4.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.4.0/temp/log.do_populate_lic.3707514
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.4.0.bb:do_populate_lic) failed with exit code '1'

--===============3519064617118151970==--
