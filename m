Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EC1CC6B3D
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32819.1792043046616052953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X8zR4kDY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mKQhV3+X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a13e16d2bb-0dcc6105-c30e-4730-b6d6-bb895a26f297-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792043045;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LYOl0MUIJug0SA3NHULoGHtvzS864zTFn9vhav2ZQgQ=;
	b=X8zR4kDYozpmZoQpl6EeZWl307NdiqtmFQSIW1gxR+zm1jxzeKUhgeK6VBu4DI3Q
	rEeSoSG09X61uQHFYPIoBsqxLrpyQWw1u4nnXNk6FvkOQM9sCESouma1851MNCpKnOt
	e19pPbJOGmcS4OcchgB8rItvWVJDAjBRGJVZ17hs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792043045;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LYOl0MUIJug0SA3NHULoGHtvzS864zTFn9vhav2ZQgQ=;
	b=mKQhV3+X6SsjHWxYj1mGCnibwuq1GAXc+lYN4ZS0ngyha2QROfK4Vi1+RQOyVt2b
	7K4jKnePtNCs8FTjCC/eBp8i5XkM7l7GVgoH/xR8Uk7WUR8/2rHjsMAbHJkNY2tB5uF
	IYF3pcwPt1vXnhA3iKNEZh7Yo63edPuzge4g8GRQ=
Content-Type: multipart/mixed; boundary="===============3937513224660824271=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome,python3-pycryptodomex: upgrading to
 4.0.0,3.24.1 FAILED
Message-ID: <010101a13e16d2bb-0dcc6105-c30e-4730-b6d6-bb895a26f297-000000@us-west-2.amazonses.com>
Date: Thu, 15 Oct 2026 05:44:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247855

--===============3937513224660824271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodome,python3-pycryptodomex* to *4.0.0,3.24.1* has Failed(do_compile).

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
From e9832c4f1f262c86300e72e9616eb339b5f14338 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Oct 2026 05:09:53 +0000
Subject: [PATCH] python3-pycryptodome,python3-pycryptodomex: upgrade 3.23.0 ->
 4.0.0,3.23.0 -> 3.24.1

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------

3.24.1 (11 October 2026)

Resolved issues
---------------

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------

3.24.1 (11 October 2026)

Resolved issues
---------------

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------
---
 ....23.0.bb => python3-pycryptodome_4.0.0.bb} | 26 ++++++++++++++++++-
 ...3.0.bb => python3-pycryptodomex_3.24.1.bb} |  2 +-
 2 files changed, 26 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.23.0.bb => python3-pycryptodome_4.0.0.bb} (11%)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.23.0.bb => python3-pycryptodomex_3.24.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb
similarity index 11%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb
index 1b2a5edd38..cc3bf81e90 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb
@@ -1,6 +1,30 @@
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
+# 
+#
+
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
+SRC_URI[sha256sum] = "4ad4dd220fa22f99f5832847ccaea5bee39f140b8e4ea1a29aa77dc969c6490c"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
index e2120d9972..b24e047a19 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
+SRC_URI[sha256sum] = "09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome pycryptodome:pycryptodomex"
 
-- 
2.47.1


--===============3937513224660824271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pycryptodomex-changelog.txt"

3.24.1 (11 October 2026)

Resolved issues
---------------

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------

--===============3937513224660824271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------

3.24.1 (11 October 2026)

Resolved issues
---------------

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------

--===============3937513224660824271==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch"

RnJvbSBlOTgzMmM0ZjFmMjYyYzg2MzAwZTcyZTk2MTZlYjMzOWI1ZjE0MzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgT2N0IDIwMjYgMDU6MDk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZSxweXRob24zLXB5Y3J5cHRvZG9tZXg6IHVwZ3JhZGUgMy4yMy4w
IC0+CiA0LjAuMCwzLjIzLjAgLT4gMy4yNC4xCgo0LjAuMCAoMTQgT2N0b2JlciAyMDI2KQoKQnJl
YWtpbmcgY2hhbmdlcwotLS0tLS0tLS0tLS0tLS0tCgpEZXByZWNhdGlvbnMKLS0tLS0tLS0tLS0t
CgpSZXNvbHZlZCBpc3N1ZXMKLS0tLS0tLS0tLS0tLS0tCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0t
LS0tCgozLjI0LjEgKDExIE9jdG9iZXIgMjAyNikKClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0t
LS0tLS0KCjMuMjQuMCAoNCBPY3RvYmVyIDIwMjYpCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0t
LS0tCgpSZXNvbHZlZCBpc3N1ZXMKLS0tLS0tLS0tLS0tLS0tCgpPdGhlciBjaGFuZ2VzCi0tLS0t
LS0tLS0tLS0KCjMuMjQuMSAoMTEgT2N0b2JlciAyMDI2KQoKUmVzb2x2ZWQgaXNzdWVzCi0tLS0t
LS0tLS0tLS0tLQoKMy4yNC4wICg0IE9jdG9iZXIgMjAyNikKCk5ldyBmZWF0dXJlcwotLS0tLS0t
LS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0tLS0tLS0KCk90aGVyIGNoYW5nZXMK
LS0tLS0tLS0tLS0tLQotLS0KIC4uLi4yMy4wLmJiID0+IHB5dGhvbjMtcHljcnlwdG9kb21lXzQu
MC4wLmJifSB8IDI2ICsrKysrKysrKysrKysrKysrKy0KIC4uLjMuMC5iYiA9PiBweXRob24zLXB5
Y3J5cHRvZG9tZXhfMy4yNC4xLmJifSB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMy4wLmJiID0+IHB5dGhvbjMtcHljcnlwdG9k
b21lXzQuMC4wLmJifSAoMTElKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
e3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIzLjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4
XzMuMjQuMS5iYn0gKDc2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfNC4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCAx
MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5
cHRvZG9tZV8zLjIzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWNyeXB0b2RvbWVfNC4wLjAuYmIKaW5kZXggMWIyYTVlZGQzOC4uY2MzYmY4MWU5
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5
cHRvZG9tZV8zLjIzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Y3J5cHRvZG9tZV80LjAuMC5iYgpAQCAtMSw2ICsxLDMwIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRS5yc3QKKyMgKysrIExJQ0VOU0UucnN0CisjIEBAIC0zLDYgKzMsMTAg
QEAKKyMgIAorIyAgSW4gZWl0aGVyIGNhc2UsIHRoZXJlIGFyZSBtaW5pbWFsIGlmIG5vIHJlc3Ry
aWN0aW9ucyBvbiB0aGUgcmVkaXN0cmlidXRpb24sCisjICBtb2RpZmljYXRpb24gYW5kIHVzYWdl
IG9mIHRoZSBzb2Z0d2FyZS4KKyMgKworIyArRmlsZXMgdGhhdCBkbyBub3QgaW5jbHVkZSB0aGUg
bGljZW5zZSB0ZXh0IHJlZmVyIHRvIGl0IHdpdGggYW4gU1BEWCB0YWc6CisjICtgYFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2VgYCBmb3IgdGhlIEJTRCBsaWNlbnNlIGJlbG93
CisjICsoYGBTUERYLUZpbGVDb3B5cmlnaHRUZXh0YGAgZ2l2ZXMgdGhlIGNvcHlyaWdodCBub3Rp
Y2UpLgorIyAgCisjICBQdWJsaWMgZG9tYWluCisjICA9PT09PT09PT09PT09CisjIAorIworCiBy
ZXF1aXJlIHB5dGhvbi1weWNyeXB0b2RvbWUuaW5jCiBpbmhlcml0IHB5dGhvbl9zZXR1cHRvb2xz
X2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0NzcwMGE2NTcxODJkNjAzMzhi
YWIwOWZkYjI3NTE4Zjg4NTZhZWNkODBhZTRjNmJkZGRiNjdmZjVkYTQ0ZWYiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNGFkNGRkMjIwZmEyMmY5OWY1ODMyODQ3Y2NhZWE1YmVlMzlmMTQwYjhlNGVh
MWEyOWFhNzdkYzk2OWM2NDkwYyIKIAogQ1ZFX1BST0RVQ1QgPSAicHljcnlwdG9kb21lOnB5Y3J5
cHRvZG9tZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weWNyeXB0b2RvbWV4XzMuMjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21l
eF8zLjIzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weWNyeXB0b2RvbWV4XzMuMjQuMS5iYgppbmRleCBlMjEyMGQ5OTcyLi5iMjRlMDQ3YTE5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9k
b21leF8zLjIzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y3J5cHRvZG9tZXhfMy4yNC4xLmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWlyZSBweXRob24t
cHljcnlwdG9kb21lLmluYwogaW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MTkwOTc1OGYwMTBjODJiYzk5YjBhYmY0ZWExMjAxMmM5
ODk2MmZiZjA1ODNjMjE2NGY4Yjg0NTMzYzJlNGRhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA5
MDgxNjY2ZmZjNTk5OTc2YzBiOGIyOWNhZjJjZjgyMjEyYzBmMDViZWQyMzNjOGY4ZWQ1M2U0ZjZl
MWQzNTYiCiAKIENWRV9QUk9EVUNUID0gInB5Y3J5cHRvZG9tZTpweWNyeXB0b2RvbWUgcHljcnlw
dG9kb21lOnB5Y3J5cHRvZG9tZXgiCiAKLS0gCjIuNDcuMQoK

--===============3937513224660824271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.1.99+snapshot-6b2dcfdbe16055edc88f72dabf07e33f8163d8eb"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6b2dcfdbe16055edc88f72dabf07e33f8163d8eb"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 543 Local 520 Mirrors 0 Missed 23 Current 205 (95% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 225 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 338 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 232 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_recipe_qa)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cffi-2.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 447 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-2.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 453 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 300 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 466 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 477 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 511 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_fetch: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 336 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_fetch)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 337 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_unpack)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_unpack: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 338 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 522 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 555 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 563 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 566 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-native-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 661 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 500 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_create_recipe_spdx)
NOTE: Running task 501 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_populate_sysroot_setscene)
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
NOTE: Running task 1619 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_patch)
NOTE: Running task 1620 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_patch)
NOTE: Running task 1676 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1677 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_patch: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_patch: Started
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1889 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1890 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_populate_lic)
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1891 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_configure)
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1892 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_configure)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_configure: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_configure: Started
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1893 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb:do_compile)
NOTE: Running task 1894 of 1916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_compile)
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_compile: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_compile: Started
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_populate_lic: Failed
NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pycryptodome-4.0.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1894 tasks of which 1877 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261015050918.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261015050918.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.0.0/temp/log.do_populate_lic.1304547
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pycryptodome-4.0.0-r0 do_populate_lic: QA Issue: python3-pycryptodome: The LIC_FILES_CHKSUM does not match for file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93
python3-pycryptodome: The new md5 checksum is ddd4ccc573346f98658e0059890f9da8
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
python3-pycryptodome: Check if the license information has changed in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.0.0/sources/pycryptodome-4.0.0/LICENSE.rst to verify that the LICENSE value "BSD-2-Clause AND Unlicense" remains valid [license-checksum]
ERROR: python3-pycryptodome-4.0.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.0.0/temp/log.do_populate_lic.1304547
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.0.0.bb:do_populate_lic) failed with exit code '1'

--===============3937513224660824271==--

