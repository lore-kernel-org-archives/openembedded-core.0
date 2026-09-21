Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00C8C982F9
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:17 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43178.1789969207588697181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=n9rBwato;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wT4ZCMSm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0c27a8d82-cd780617-cbaa-4372-97d0-b5cae6a56896-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969206;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zp5jY78sBDM+cbD4opIUbCWcE6v4d/KjLIK/mjcFbJA=;
	b=n9rBwatoJvHs73Z1bNKBbHM9kA2s2bFHY1ZF0MmH1LCdmq3gKwKCHoevtLEBUlKu
	D6sdyDcFIfWt68SnIlRK8uFHKwIWNGVvPJCAmvEQUvQpTTDcYAF4DgciMMGXrjBfDLS
	JHhVDEYfjKqmauuRcL5lGE7/K1Q6yxAHWoEcfjtM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969206;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zp5jY78sBDM+cbD4opIUbCWcE6v4d/KjLIK/mjcFbJA=;
	b=wT4ZCMSmlJ5dBVCuJCM3sozRR4qGdaw6kPT7OHVEjfG0H1Tk2pfZgd7PJ3mZACry
	KMpg8THW1yyaC7Olu+dvrv0SRzdLgv/UmmraEfsUe1qV8xPyDOdyobu4tdGHx3EQexe
	SB3cDNgeyDohaghnLz7d8D/oTcD2IGYj7i9ti+1w=
Content-Type: multipart/mixed; boundary="===============2184766234628471024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.3.3 SUCCEEDED
Message-ID: <010101a0c27a8d82-cd780617-cbaa-4372-97d0-b5cae6a56896-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246277

--===============2184766234628471024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.3.2-3.3.3.patch
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
From 0ee663962ce2ae56ade7aafdb43e320278989d0f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 21 Sep 2026 05:10:47 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.3.2 -> 3.3.3

Source: CHANGES

Version 3.3.3 - September, 2026
-------------------------------
- Added support for Python 3.15.

- Fixed CI unit test jobs selecting a tox environment with no test commands.
  The matrix and fallback now select `py-unit`, as diagnosed and proposed by
  glaziermag in issue #662; submitted by Neal Lin et AI.

- Refactored recursive implementations in pyparsing, for improved performance and
  reduced memory usage.

  - repetition using a large upper bound with multiplication or slicing notation
    has replaced a recursive `Optional` expression with a modified `ZeroOrMore`
    expression, using a new `max` argument. PR #652, submitted by sudo.

  - `nested_expr` now uses an internal class that maintains its own stack for
    managing nesting levels.

  - `infix_notation` replaced its recursive implementation with a shunting-yard
    algorithm.

  These changes should not cause any regressions in existing code, and tests
  show significant performance improvements for some of the more complex examples.
  Railroad diagrams may render differently, since they now no longer rely on
  recursion using `Forward` expressions.
---
 .../{python3-pyparsing_3.3.2.bb => python3-pyparsing_3.3.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.3.2.bb => python3-pyparsing_3.3.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb b/meta/recipes-devtools/python/python3-pyparsing_3.3.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.3.3.bb
index 2565751f28..fbb0d64293 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.3.3.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c8a9625037eff2407f8456010875183"
 
-SRC_URI[sha256sum] = "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
+SRC_URI[sha256sum] = "928ae7e20211f3b6f3915a72f06a0cfd29ab9d24279dd6346b6b1a7146397d36"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============2184766234628471024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pyparsing-changelog.txt"

Changelog for python3-pyparsing: 3.3.2 -> 3.3.3
Source: CHANGES

Version 3.3.3 - September, 2026
-------------------------------
- Added support for Python 3.15.

- Fixed CI unit test jobs selecting a tox environment with no test commands.
  The matrix and fallback now select `py-unit`, as diagnosed and proposed by
  glaziermag in issue #662; submitted by Neal Lin et AI.

- Refactored recursive implementations in pyparsing, for improved performance and
  reduced memory usage.

  - repetition using a large upper bound with multiplication or slicing notation
    has replaced a recursive `Optional` expression with a modified `ZeroOrMore`
    expression, using a new `max` argument. PR #652, submitted by sudo.

  - `nested_expr` now uses an internal class that maintains its own stack for
    managing nesting levels.

  - `infix_notation` replaced its recursive implementation with a shunting-yard
    algorithm.

  These changes should not cause any regressions in existing code, and tests
  show significant performance improvements for some of the more complex examples.
  Railroad diagrams may render differently, since they now no longer rely on
  recursion using `Forward` expressions.

--===============2184766234628471024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.3.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.3.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyparsing: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing: PV changed from "3.3.2" to "3.3.3"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.3.2" to "3.3.3"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.3.2" to "3.3.3"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.3.2" to "3.3.3"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.3.2" to "3.3.3"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.3.2" to "3.3.3"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.3.2" to "3.3.3"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 1044093 to 1089519 (+4%)
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.3.2 [default] to 3.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyparsing-3.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyparsing-3.3.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyparsing-3.3.2.dist-info -> /usr/lib/python3.14/site-packages/pyparsing-3.3.3.dist-info
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.3.2" to "3.3.3"
Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.14/site-packages/pyparsing-3.3.2.dist-info moved to /usr/lib/python3.14/site-packages/pyparsing-3.3.3.dist-info

--===============2184766234628471024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.3.2-3.3.3.patch"

RnJvbSAwZWU2NjM5NjJjZTJhZTU2YWRlN2FhZmRiNDNlMzIwMjc4OTg5ZDBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMDU6MTA6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cGFyc2luZzogdXBncmFkZSAzLjMuMiAtPiAzLjMuMwoKU291cmNlOiBDSEFOR0VT
CgpWZXJzaW9uIDMuMy4zIC0gU2VwdGVtYmVyLCAyMDI2Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KLSBBZGRlZCBzdXBwb3J0IGZvciBQeXRob24gMy4xNS4KCi0gRml4ZWQgQ0kgdW5p
dCB0ZXN0IGpvYnMgc2VsZWN0aW5nIGEgdG94IGVudmlyb25tZW50IHdpdGggbm8gdGVzdCBjb21t
YW5kcy4KICBUaGUgbWF0cml4IGFuZCBmYWxsYmFjayBub3cgc2VsZWN0IGBweS11bml0YCwgYXMg
ZGlhZ25vc2VkIGFuZCBwcm9wb3NlZCBieQogIGdsYXppZXJtYWcgaW4gaXNzdWUgIzY2Mjsgc3Vi
bWl0dGVkIGJ5IE5lYWwgTGluIGV0IEFJLgoKLSBSZWZhY3RvcmVkIHJlY3Vyc2l2ZSBpbXBsZW1l
bnRhdGlvbnMgaW4gcHlwYXJzaW5nLCBmb3IgaW1wcm92ZWQgcGVyZm9ybWFuY2UgYW5kCiAgcmVk
dWNlZCBtZW1vcnkgdXNhZ2UuCgogIC0gcmVwZXRpdGlvbiB1c2luZyBhIGxhcmdlIHVwcGVyIGJv
dW5kIHdpdGggbXVsdGlwbGljYXRpb24gb3Igc2xpY2luZyBub3RhdGlvbgogICAgaGFzIHJlcGxh
Y2VkIGEgcmVjdXJzaXZlIGBPcHRpb25hbGAgZXhwcmVzc2lvbiB3aXRoIGEgbW9kaWZpZWQgYFpl
cm9Pck1vcmVgCiAgICBleHByZXNzaW9uLCB1c2luZyBhIG5ldyBgbWF4YCBhcmd1bWVudC4gUFIg
IzY1Miwgc3VibWl0dGVkIGJ5IHN1ZG8uCgogIC0gYG5lc3RlZF9leHByYCBub3cgdXNlcyBhbiBp
bnRlcm5hbCBjbGFzcyB0aGF0IG1haW50YWlucyBpdHMgb3duIHN0YWNrIGZvcgogICAgbWFuYWdp
bmcgbmVzdGluZyBsZXZlbHMuCgogIC0gYGluZml4X25vdGF0aW9uYCByZXBsYWNlZCBpdHMgcmVj
dXJzaXZlIGltcGxlbWVudGF0aW9uIHdpdGggYSBzaHVudGluZy15YXJkCiAgICBhbGdvcml0aG0u
CgogIFRoZXNlIGNoYW5nZXMgc2hvdWxkIG5vdCBjYXVzZSBhbnkgcmVncmVzc2lvbnMgaW4gZXhp
c3RpbmcgY29kZSwgYW5kIHRlc3RzCiAgc2hvdyBzaWduaWZpY2FudCBwZXJmb3JtYW5jZSBpbXBy
b3ZlbWVudHMgZm9yIHNvbWUgb2YgdGhlIG1vcmUgY29tcGxleCBleGFtcGxlcy4KICBSYWlscm9h
ZCBkaWFncmFtcyBtYXkgcmVuZGVyIGRpZmZlcmVudGx5LCBzaW5jZSB0aGV5IG5vdyBubyBsb25n
ZXIgcmVseSBvbgogIHJlY3Vyc2lvbiB1c2luZyBgRm9yd2FyZGAgZXhwcmVzc2lvbnMuCi0tLQog
Li4uL3tweXRob24zLXB5cGFyc2luZ18zLjMuMi5iYiA9PiBweXRob24zLXB5cGFyc2luZ18zLjMu
My5iYn0gIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXBhcnNp
bmdfMy4zLjIuYmIgPT4gcHl0aG9uMy1weXBhcnNpbmdfMy4zLjMuYmJ9ICg5MCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGFyc2luZ18zLjMu
Mi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4z
LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5cGFyc2luZ18zLjMuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGFyc2luZ18zLjMuMy5iYgppbmRleCAyNTY1
NzUxZjI4Li5mYmIwZDY0MjkzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMy4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4zLjMuYmIKQEAgLTEwLDcgKzEwLDcgQEAgQlVH
VFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYXJzaW5nL3B5cGFyc2luZy9pc3N1ZXMi
CiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTljOGE5NjI1MDM3ZWZmMjQwN2Y4NDU2MDEwODc1MTgzIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYzc3N2Y0ZDc2M2YxNDA2MzNkY2I2ZDhhM2VkYTk1M2JmN2EyMTRkYzRlZmY1OTg0MTNjMDcw
YmNkYzExN2NiYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MjhhZTdlMjAyMTFmM2I2ZjM5MTVh
NzJmMDZhMGNmZDI5YWI5ZDI0Mjc5ZGQ2MzQ2YjZiMWE3MTQ2Mzk3ZDM2IgogCiBpbmhlcml0IHB5
cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============2184766234628471024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyparsing-3.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyparsing-3.3.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyparsing-3.3.2.dist-info -> /usr/lib/python3.14/site-packages/pyparsing-3.3.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.14/site-packages/pyparsing-3.3.2.dist-info moved to /usr/lib/python3.14/site-packages/pyparsing-3.3.3.dist-info

--===============2184766234628471024==--

