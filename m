Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18515.1792905490579345140
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 22:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K4by+F1+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gf2x7utU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1717eac7b-7f26cd11-c9b6-4c8c-a5b9-4242c69d140c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792905489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=llEG/EV5OzM3PJhCEp/+0auRARpsivLRV6l+79cpMcY=;
	b=K4by+F1+tS0tsu3xmsDXpzygzjd2IP4yJq7j985A6pRD+SO+m1HYlFQt8wmWxd8I
	YX54MwV2CsCqsLbn8d0ERIFxGCvn/JuC5WOuXTEX/zHo8J+FvN984QRIbJemaHuT7q3
	jie20kbY2V78zcb1BijLYs1Aa+Sue0L/OXktBMSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792905489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=llEG/EV5OzM3PJhCEp/+0auRARpsivLRV6l+79cpMcY=;
	b=Gf2x7utUxCPkqYcsUpi+CYVI6pFykZwVvZha/k4+0Tz3nl97zC86xdlBnhz4/ioB
	woWYUZmKumrO3pFHqt99wFx2bumPcQTK34KJsin1xd1w36Wb9EJwHYCGAIadTGYols4
	G3RAneBWq2hoAJ1p7j0MeR2vOZEm3ZOO5ZO8CCeg=
Content-Type: multipart/mixed; boundary="===============5202387665943733805=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 4.2.0 SUCCEEDED
Message-ID: <010101a1717eac7b-7f26cd11-c9b6-4c8c-a5b9-4242c69d140c-000000@us-west-2.amazonses.com>
Date: Sun, 25 Oct 2026 05:18:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.25-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 05:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248600

--===============5202387665943733805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodome* to *4.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.24.1-4.2.0.patch
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
From 57d2d060e48a2b7631c525e0fec8e5fb597a4efb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 25 Oct 2026 05:08:08 +0000
Subject: [PATCH] python3-pycryptodome: upgrade 3.24.1 -> 4.2.0

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
 .../python/python3-pycryptodome_4.2.0.bb      | 47 +++++++++++++++++++
 3 files changed, 48 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb

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
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
new file mode 100644
index 0000000000..955cf2bbb0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
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
+SRC_URI[sha256sum] = "21d7fdba239d6ef863d3d08388801c683453a3bb4897c2b27f27847aad89bdf7"
+
+CVE_PRODUCT = "pycryptodome:pycryptodome"
-- 
2.47.1


--===============5202387665943733805==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.24.1-4.2.0.patch"

RnJvbSA1N2QyZDA2MGU0OGEyYjc2MzFjNTI1ZTBmZWM4ZTVmYjU5N2E0ZWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjUgT2N0IDIwMjYgMDU6MDg6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZTogdXBncmFkZSAzLjI0LjEgLT4gNC4yLjAKCjQuMi4wICgyNCBP
Y3RvYmVyIDIwMjYpCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgo0LjEuMCAoMTkgT2N0b2Jl
ciAyMDI2KQoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKUmVzb2x2ZWQgaXNzdWVzCi0tLS0t
LS0tLS0tLS0tLQoKNC4wLjEgKDE3IE9jdG9iZXIgMjAyNikKCk5ldyBmZWF0dXJlcwotLS0tLS0t
LS0tLS0KCjQuMC4wICgxNCBPY3RvYmVyIDIwMjYpCgpCcmVha2luZyBjaGFuZ2VzCi0tLS0tLS0t
LS0tLS0tLS0KCkRlcHJlY2F0aW9ucwotLS0tLS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0t
LS0tLS0tLS0tLS0KCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KLS0tCiAuLi4vcHl0aG9uL3B5
dGhvbi1weWNyeXB0b2RvbWUuaW5jICAgICAgICAgICAgfCAgMiArLQogLi4uL3B5dGhvbi9weXRo
b24zLXB5Y3J5cHRvZG9tZV8zLjI0LjEuYmIgICAgIHwgIDYgLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcHljcnlwdG9kb21lXzQuMi4wLmJiICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrCiAz
IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZV8zLjI0LjEuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzQuMi4wLmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHljcnlwdG9kb21lLmluYyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKaW5kZXggYTAxODE4
NzRjZC4uOGYyYjkwMjVkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24tcHljcnlwdG9kb21lLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbi1weWNyeXB0b2RvbWUuaW5jCkBAIC0zLDcgKzMsNyBAQCBERVNDUklQVElPTiA9
ICJQeUNyeXB0b2RvbWUgaXMgYSBzZWxmLWNvbnRhaW5lZCBQeXRob24gcGFja2FnZSBvZiBsb3ct
bGV2ZWxcCiAgY3J5cHRvZ3JhcGhpYyBwcmltaXRpdmVzLiIKIEhPTUVQQUdFID0gImh0dHA6Ly93
d3cucHljcnlwdG9kb21lLm9yZyIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIEFORCBVbmxpY2Vu
c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9MjkyNDJhNzA0
MTBhNGVlZmY0ODhhMjgxNjRlN2FiOTMiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnJzdDttZDU9YTUxNGI0YTdhZDI0Njc3YWU1MGYzYmVjYjAzNDA0ZTMiCiAKIGluaGVyaXQg
cHlwaQogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljcnlwdG9kb21lXzMuMjQuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwYWE1MzU1OWQ2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJiCisrKyAvZGV2L251bGwKQEAgLTEsNiAr
MCwwIEBACi1yZXF1aXJlIHB5dGhvbi1weWNyeXB0b2RvbWUuaW5jCi1pbmhlcml0IHB5dGhvbl9z
ZXR1cHRvb2xzX2J1aWxkX21ldGEKLQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNmOWU3NDQ0NGMw
ZWNiZWM3YWYyMzJhOTVkMjgyYzc0YjExNGQ1MzIxMmNlMDc1ZWQxN2I3ZmQ3ZGNhMzJiYjMiCi0K
LUNWRV9QUk9EVUNUID0gInB5Y3J5cHRvZG9tZTpweWNyeXB0b2RvbWUiCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzQuMi4wLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV80LjIu
MC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45NTVjZjJiYmIwCi0t
LSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Y3J5cHRvZG9tZV80LjIuMC5iYgpAQCAtMCwwICsxLDQ3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJ
TEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScu
CisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0
aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBp
ZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNz
YWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRh
dGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAt
LS0gTElDRU5TRS5yc3QKKyMgKysrIExJQ0VOU0UucnN0CisjIEBAIC0zLDYgKzMsMTAgQEAKKyMg
IAorIyAgSW4gZWl0aGVyIGNhc2UsIHRoZXJlIGFyZSBtaW5pbWFsIGlmIG5vIHJlc3RyaWN0aW9u
cyBvbiB0aGUgcmVkaXN0cmlidXRpb24sCisjICBtb2RpZmljYXRpb24gYW5kIHVzYWdlIG9mIHRo
ZSBzb2Z0d2FyZS4KKyMgKworIyArRmlsZXMgdGhhdCBkbyBub3QgaW5jbHVkZSB0aGUgbGljZW5z
ZSB0ZXh0IHJlZmVyIHRvIGl0IHdpdGggYW4gU1BEWCB0YWc6CisjICtgYFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBCU0QtMi1DbGF1c2VgYCBmb3IgdGhlIEJTRCBsaWNlbnNlIGJlbG93CisjICso
YGBTUERYLUZpbGVDb3B5cmlnaHRUZXh0YGAgZ2l2ZXMgdGhlIGNvcHlyaWdodCBub3RpY2UpLgor
IyAgCisjICBQdWJsaWMgZG9tYWluCisjICA9PT09PT09PT09PT09CisjIEBAIC01OSwzICs2Mywx
NiBAQAorIyAgQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZIE9GIExJQUJJTElUWSwgV0hFVEhFUiBJ
TiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwKKyMgIE9SIFRPUlQgKElOQ0xVRElORyBORUdM
SUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNFCisj
ICBPRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9G
IFNVQ0ggREFNQUdFLgorIyArCisjICtUaGlyZC1wYXJ0eSBjb2RlCisjICs9PT09PT09PT09PT09
PT09CisjICsKKyMgK1RoZSBkaXJlY3RvcnkgYGBzcmMvbWxkc2EtbmF0aXZlYGAgY29udGFpbnMg
Y29kZSBmcm9tIG1sZHNhLW5hdGl2ZQorIyArKGh0dHBzOi8vZ2l0aHViLmNvbS9wcS1jb2RlLXBh
Y2thZ2UvbWxkc2EtbmF0aXZlKSwgYXZhaWxhYmxlIHVuZGVyCisjICt0aGUgQXBhY2hlLTIuMCBs
aWNlbnNlIE9SIHRoZSBJU0MgbGljZW5zZSBPUiB0aGUgTUlUIGxpY2Vuc2UuCisjICtTZWUgYGBz
cmMvbWxkc2EtbmF0aXZlL0xJQ0VOU0VgYCBmb3IgdGhlIGZ1bGwgdGV4dCBvZiB0aGUgbGljZW5z
ZXMuCisjICsKKyMgK1RoZSBkaXJlY3RvcnkgYGBzcmMvbWxrZW0tbmF0aXZlYGAgY29udGFpbnMg
Y29kZSBmcm9tIG1sa2VtLW5hdGl2ZQorIyArKGh0dHBzOi8vZ2l0aHViLmNvbS9wcS1jb2RlLXBh
Y2thZ2UvbWxrZW0tbmF0aXZlKSwgYXZhaWxhYmxlIHVuZGVyCisjICt0aGUgQXBhY2hlLTIuMCBs
aWNlbnNlIE9SIHRoZSBJU0MgbGljZW5zZSBPUiB0aGUgTUlUIGxpY2Vuc2UuCisjICtTZWUgYGBz
cmMvbWxrZW0tbmF0aXZlL0xJQ0VOU0VgYCBmb3IgdGhlIGZ1bGwgdGV4dCBvZiB0aGUgbGljZW5z
ZXMuCisjIAorIworCityZXF1aXJlIHB5dGhvbi1weWNyeXB0b2RvbWUuaW5jCitpbmhlcml0IHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKKworU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIxZDdm
ZGJhMjM5ZDZlZjg2M2QzZDA4Mzg4ODAxYzY4MzQ1M2EzYmI0ODk3YzJiMjdmMjc4NDdhYWQ4OWJk
ZjciCisKK0NWRV9QUk9EVUNUID0gInB5Y3J5cHRvZG9tZTpweWNyeXB0b2RvbWUiCi0tIAoyLjQ3
LjEKCg==

--===============5202387665943733805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.24.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-4.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 2277640 to 4695880 (+106%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: FILELIST: removed "/usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ed448.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ec_ws.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_curve448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/.debug/_modexp.abi3.so", added "/usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_mlkem.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_mldsa.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/.debug/_chacha20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_mldsa_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_mlkem_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_keccak_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_k12.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/.debug/_Salsa2
 0_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/.debug/_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_SHA224_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_SHA256_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ec_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ec_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/.debug/_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_k12_avx2_bmi2.abi3.so"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2805378 to 1385312 (-51%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: FILELIST: removed "/usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/tomcrypt_des.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont2.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ed25519.h /usr/src/debug/python3-pycryptodome/3.24.1/src/ed25519.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ARC2.c /usr/src/debug/python3-pycryptodome/3.24.1/src/DES3.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/3.24.1/src/cpuid.c /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA384.c /usr/src/debug/python3-pycryptodome/3.24.1/src/multiply_64.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ed448.h /usr/src/debug/python3-pycryptodome/3.24.1/src/endianess.h /usr/src/debug/python3-pycryptodome/3.24.1/src/ed448.c /usr/src/debug/python3-pycryptodome/3.24.1/src/modexp_utils.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mod25519.c /usr/src/debug/python3-pycrypto
 dome/3.24.1/src/poly1305.c /usr/src/debug/python3-pycryptodome/3.24.1/src/modexp_utils.h /usr/src/debug/python3-pycryptodome/3.24.1/src/MD2.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/AESNI.c /usr/src/debug/python3-pycryptodome/3.24.1/src/common.h /usr/src/debug/python3-pycryptodome/3.24.1/src/ec.h /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ofb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/3.24.1/src/blowfish.c /usr/src/debug/python3-pycryptodome/3.24.1/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p521_table.h /usr/src/debug/python3-pycryptodome/3.24.1/src/p521_table.c /usr/src/debug/python3-pycryptodome/3.24.1/src/AES.c /usr/src/debug/python3-pycryptodome/3.24.1/src/DES.c /usr/src/debug/python3-pycryptodome/3.24.1/src/MD4.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont.c /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/tom
 crypt_macros.h /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/tomcrypt_cipher.h /usr/src/debug/python3-pycryptodome/3.24.1/src/mont.h /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/3.24.1/src/bignum.c /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA224.c /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA512.c /usr/src/debug/python3-pycryptodome/3.24.1/src/block_base.h /usr/src/debug/python3-pycryptodome/3.24.1/src/blowfish_eks.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ec_ws.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ocb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ARC4.c /usr/src/debug/python3-pycryptodome/3.24.1/src/blake2s.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/3.24.1/src/scrypt.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont1.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p256_table.h /usr/src/debug/python3-pycryptodome/3.24.1/src/blake2.c /u
 sr/src/debug/python3-pycryptodome/3.24.1/src/p256_table.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA1.c /usr/src/debug/python3-pycryptodome/3.24.1/src/curve25519.c /usr/src/debug/python3-pycryptodome/3.24.1/src/block_common.c /usr/src/debug/python3-pycryptodome/3.24.1/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/3.24.1/src/curve25519.h /usr/src/debug/python3-pycryptodome/3.24.1/src/MD5.c /usr/src/debug/python3-pycryptodome/3.24.1/src/blowfish_init.c /usr/src/debug/python3-pycryptodome/3.24.1/src/CAST.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p384_table.h /usr/src/debug/python3-pycryptodome/3.24.1/src/keccak.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p384_table.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont3.c /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/tomcrypt.h /usr/src/debug/python3-pycryptodome/3.24.1/src/curve448.h /usr/src/debug/python3-pycryptodome/3.24.1/src/multiply.h /usr/
 src/debug/python3-pycryptodome/3.24.1/src/strxor.c /usr/src/debug/python3-pycryptodome/3.24.1/src/curve448.c /usr/src/debug/python3-pycryptodome/3.24.1/src/modexp.c /usr/src/debug/python3-pycryptodome/3.24.1/src/chacha20.c /usr/src/debug/python3-pycryptodome/3.24.1/src/cast5.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ghash_clmul.c /usr/src/debug/python3-pycryptodome/3.24.1/src/siphash.c /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA256.c /usr/src/debug/python3-pycryptodome/3.24.1/src/Salsa20.c /usr/src/debug/python3-pycryptodome/3.24.1/src/blake2b.c", added "/usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/fips202/fips202.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ed25519_table.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/fips202/fips202.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem_fips202.h /usr/src/debug/python3-pycryptodome/4.2.0/src/nat_div.c /usr/src/debug/python3-pycryptodome/4.2.0/src/common.h /usr/src/debug/python3-py
 cryptodome/4.2.0/src/chacha20_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ARC2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/poly.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/indcpa.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/poly.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/fips202/fips202x4.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/fips202/fips202x4.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/verify.h /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_nat.h /usr/src/debug/python3-pycryptodome/4.2.0/src/SHA1.c /usr/src/debug/python3-pycryptodome/4.2.0/src/blake2b.c /usr/src/debug/python3-pycryptodome/4.2.0/src/pq_fips202.h /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_nat.c /usr/src/debug/python3-pycryptodome/4.2.0/src/SHA224.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/poly_kl.c /usr/src/debug/python3-pycryptodome/4.2.0/src/
 mldsa-native/src/context.h /usr/src/debug/python3-pycryptodome/4.2.0/src/block_base.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/poly_kl.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem.c /usr/src/debug/python3-pycryptodome/4.2.0/src/curve448.c /usr/src/debug/python3-pycryptodome/4.2.0/src/curve448.h /usr/src/debug/python3-pycryptodome/4.2.0/src/AES.c /usr/src/debug/python3-pycryptodome/4.2.0/src/DES.c /usr/src/debug/python3-pycryptodome/4.2.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodome/4.2.0/src/AESNI.c /usr/src/debug/python3-pycryptodome/4.2.0/src/keccak.c /usr/src/debug/python3-pycryptodome/4.2.0/src/siphash.h /usr/src/debug/python3-pycryptodome/4.2.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/4.2.0/src/nat_ct.h /usr/src/debug/python3-pycryptodome/4.2.0/src/nat_gcd.c /usr/src/debug/python3-pycryptodome/4.2.0/src/str
 xor.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/polyvec.c /usr/src/debug/python3-pycryptodome/4.2.0/src/blake2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ARC4.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/polyvec.h /usr/src/debug/python3-pycryptodome/4.2.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/4.2.0/src/des_tables.h /usr/src/debug/python3-pycryptodome/4.2.0/src/keccak_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ed448.c /usr/src/debug/python3-pycryptodome/4.2.0/src/blowfish_eks.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ed448.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/packing.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/poly_k.h /usr/src/debug/python3-pycryptodome/4.2.0/src/cpuid.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_field.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/fips202/fips202x4.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlk
 em-native/src/poly_k.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/rounding.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/fips202/fips202x4.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/sampling.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ed25519.h /usr/src/debug/python3-pycryptodome/4.2.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ed25519.c /usr/src/debug/python3-pycryptodome/4.2.0/src/k12_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/MD2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/SHA224_shani.c /usr/src/debug/python3-pycryptodome/4.2.0/src/SHA256_shani.c /usr/src/debug/python3-pycryptodome/4.2.0/src/k12.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_nat_bmi2_adx.c /usr/src/debug/python3-pycryptodome/4.2.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/4.2.0/src/Salsa20.c /usr/src/debug/python3-pycryptodome/4.2.0/src/keccak_x4_avx2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/bl
 ake2s.c /usr/src/debug/python3-pycryptodome/4.2.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodome/4.2.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/fips202/fips202.c /usr/src/debug/python3-pycryptodome/4.2.0/src/chacha20.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/fips202/keccakf1600.c /usr/src/debug/python3-pycryptodome/4.2.0/src/DES3.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/fips202/fips202.h /usr/src/debug/python3-pycryptodome/4.2.0/src/nat_mod.c /usr/src/debug/python3-pycryptodome/4.2.0/src/SHA512.c /usr/src/debug/python3-pycryptodome/4.2.0/src/curve25519.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/zetas.inc /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/compress.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_special.h /usr/src/debug/python3-pycryptodome/4.2.0/src/curve25519.h /usr/src/debug/py
 thon3-pycryptodome/4.2.0/src/mlkem-native/src/compress.h /usr/src/debug/python3-pycryptodome/4.2.0/src/cast5.c /usr/src/debug/python3-pycryptodome/4.2.0/src/Salsa20_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/4.2.0/src/block_common.c /usr/src/debug/python3-pycryptodome/4.2.0/src/nat_bmi2_adx.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa_fips202.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mod25519.c /usr/src/debug/python3-pycryptodome/4.2.0/src/nat_rows.c /usr/src/debug/python3-pycryptodome/4.2.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/4.2.0/src/MD4.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/polyvec_lazy.h /usr/src/debug/python3-pycryptodome/4.2.0/src/endianess.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/polyvec_lazy.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/sign.c /usr/src/d
 ebug/python3-pycryptodome/4.2.0/src/mldsa-native/src/ct.h /usr/src/debug/python3-pycryptodome/4.2.0/src/CAST.c /usr/src/debug/python3-pycryptodome/4.2.0/src/nat.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/zetas.inc /usr/src/debug/python3-pycryptodome/4.2.0/src/nat.c /usr/src/debug/python3-pycryptodome/4.2.0/src/scrypt.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mldsa-native/src/reduce.h /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/kem.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_common.h /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_nat_module.c /usr/src/debug/python3-pycryptodome/4.2.0/src/ec_common.c /usr/src/debug/python3-pycryptodome/4.2.0/src/SHA256.c /usr/src/debug/python3-pycryptodome/4.2.0/src/blowfish.c /usr/src/debug/python3-pycryptodome/4.2.0/src/MD5.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/poly.c /usr/src/debug/python3-pycryptodome/4.2.0/src/SHA384.c /usr/src/debug/python3-pycryptodome/4.2.0/src/
 nat_prime.c /usr/src/debug/python3-pycryptodome/4.2.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/fips202/keccakf1600.c /usr/src/debug/python3-pycryptodome/4.2.0/src/poly1305.c /usr/src/debug/python3-pycryptodome/4.2.0/src/salsa20_core.h /usr/src/debug/python3-pycryptodome/4.2.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/4.2.0/src/mlkem-native/src/poly.h"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 3156286 to 3819545 (+21%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py", added "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_MLDSA.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Signature/test_mldsa.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Signature/__pycache__/test_mldsa.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_M
 LKEM.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_oneshot_digest.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLDSA.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLKEM.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLDSA.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_nat.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_Hybrid.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash
 /__pycache__/test_shared_objects.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLKEM.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_objects.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_oneshot_digest.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_MLKEM.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Sel
 fTest/PublicKey/__pycache__/test_import_MLDSA.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_Hybrid.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.24.1" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.24.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3762246 to 4317146 (+15%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info, removed "/usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi /usr/lib/python3.14/site-packages/C
 rypto/PublicKey/RSA.pyi /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD160.pyi /usr/lib/python3.14/site-packages/Crypto/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/LICENSE.rst /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi /usr/lib/p
 ython3.14/site-packages/Crypto/Hash/SHA512.pyi /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA1.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi /usr/lib/python3.14/site-packages/Crypto/IO/PKCS8.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.py /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi /usr/lib/python3.14/si
 te-packages/Crypto/Cipher/_mode_cfb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi /usr/lib/python3.14/site-packages/Crypt
 o/Cipher/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_file_system.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_
 OAEP.pyi /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi /usr/lib/python3.14/site-packages/Crypto/Util/asn1.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi /usr/lib/python3.14/site-packages
 /Crypto/Hash/SHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/pss.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC2.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi", added "/usr/lib/python3.14/site-packages/Crypto/Hash/_kecca
 k_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerNat.cpython-314.pyc /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mldsa-native/LICENSE /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Signature/__pycache__/mldsa.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Cip
 her/__pycache__/_state_machine.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/Hybrid.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/Hybrid.py /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mlkem-native/LICENSE /usr/lib/python3.14/site-packages/Crypto/Util/_threads.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNat.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLKEM.py /usr/lib/python3.14/site-packages/Crypto/Signat
 ure/mldsa.py /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLDSA.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLKEM.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem.abi3.so /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/LICENSE.rst /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLDSA.py"
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/_state_machine.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_keccak_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNat.py was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerNat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/Hybrid.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLDSA.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLKEM.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/Hybrid.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLDSA.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLKEM.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_oneshot_digest.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_oneshot_digest.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_nat.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_Hybrid.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_MLDSA.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_MLKEM.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLDSA.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLKEM.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_Hybrid.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_MLDSA.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_MLKEM.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLDSA.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLKEM.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Signature/__pycache__/test_mldsa.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Signature/test_mldsa.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py was added
  /usr/lib/python3.14/site-packages/Crypto/Signature/mldsa.py was added
  /usr/lib/python3.14/site-packages/Crypto/Signature/__pycache__/mldsa.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_threads.py was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/LICENSE.rst was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mldsa-native was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mldsa-native/LICENSE was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mlkem-native was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mlkem-native/LICENSE was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cfb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_OAEP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD160.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PKCS8.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/RSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pss.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/asn1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_file_system.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/LICENSE.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/WHEEL was removed

--===============5202387665943733805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 2277640 to 4695880 (+106%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2805378 to 1385312 (-51%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_objects.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py /usr/lib/python3.14/site-packages/Crypto/SelfTe
 st/Signature/__pycache__/test_mldsa.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_Hybrid.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_MLDSA.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_oneshot_digest.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_Hybrid.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_nat.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_MLKEM.cpython-314.pyc /u
 sr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLDSA.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_MLKEM.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLKEM.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLKEM.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_oneshot_digest.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_MLDSA.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_shared_objec
 ts.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLDSA.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Signature/test_mldsa.py"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 3156286 to 3819545 (+21%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info, removed "/usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA512.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA1.pyi /usr/lib/python3.14/site-packa
 ges/Crypto/Hash/RIPEMD160.pyi /usr/lib/python3.14/site-packages/Crypto/IO/PKCS8.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/LICENSE.rst /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi /usr/lib/python3.14/site-package
 s/Crypto/Cipher/_mode_cfb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi /usr/lib/python3.14/site-packages/Crypto/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_OAEP.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi 
 /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/RSA.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.py /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi /usr/lib/python3.14/site-packages/Crypto/Util/asn1.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi /usr/lib/py
 thon3.14/site-packages/Crypto/Signature/pss.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi /usr/lib/python3.14/site-packages
 /Crypto/Util/py3compat.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi /usr/lib/python3.14/site-packag
 es/Crypto/Util/_file_system.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC2.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi", added "/usr/lib/python3.14/site-packages/Crypto/Math/_Integ
 erNat.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_keccak_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/Hybrid.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py /usr/lib/python3.14/site-packages/Crypto/Util/_threads.py /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/Hybrid.py /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.
 abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Signature/__pycache__/mldsa.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mldsa-native/LICENSE /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Signature/mldsa.py /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerNat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/_state_machine.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLKEM.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLDSA.py /usr/lib/python3.14
 /site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mlkem-native/LICENSE /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLKEM.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLDSA.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/LICENSE.rst"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3762246 to 4317146 (+15%)
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/_state_machine.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_keccak_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNat.py was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerNat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/Hybrid.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mldsa_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLDSA.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_mlkem_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/MLKEM.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/Hybrid.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLDSA.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/MLKEM.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_oneshot_digest.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_oneshot_digest.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_nat.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_Hybrid.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_MLDSA.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_MLKEM.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLDSA.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_MLKEM.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_Hybrid.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_MLDSA.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_MLKEM.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLDSA.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_MLKEM.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Signature/__pycache__/test_mldsa.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Signature/test_mldsa.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py was added
  /usr/lib/python3.14/site-packages/Crypto/Signature/mldsa.py was added
  /usr/lib/python3.14/site-packages/Crypto/Signature/__pycache__/mldsa.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_threads.py was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/LICENSE.rst was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mldsa-native was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mldsa-native/LICENSE was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mlkem-native was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/licenses/src/mlkem-native/LICENSE was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cfb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_OAEP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD160.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PKCS8.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/RSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pss.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/asn1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_file_system.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/LICENSE.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/WHEEL was removed

--===============5202387665943733805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

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

--===============5202387665943733805==--
