Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EADBC27C40
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.819.1686887482731355763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hOXfzcni;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c25446a8-ab92bda6-9f34-464a-abf7-40aa19845f5f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qBnEL/js9XLtE9lK6WmXAzzEXdpLDURt3qUEC1VRTI8=;
	b=hOXfzcnidLK0AGWhHBYMPBY9DmU7slwjlkF9w8kG1CsiE4LNNYfSKnKQUTjtTNel
	tjTPnRjEXLLbKJd2SiturLoihhiIkofax8Xg34VzC2QhGxBKrCO/4TXRrXdrhqfNhEQ
	AHUtnQp3YW4sJxjnVWS5wtaWlbQs8zwA1BCgqL0c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qBnEL/js9XLtE9lK6WmXAzzEXdpLDURt3qUEC1VRTI8=;
	b=KrrEMlr1Ex7TqEyXQpSUDAnYYg1ob2NkGmpPZOmgFV0txd9syWzIDkQGoK4ISrlY
	bMqacuFDn76OvE5wStfuZXneh3M9qpyJsZCK8sCfwXUReC6Z59oPPGMcoQR03ZXxHdA
	8C0Q1szKT6tm1PwslrseAG7svPb1Fww8+EGFCdcc=
Content-Type: multipart/mixed; boundary="===============6205123102583953334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.6.3 SUCCEEDED
Message-ID: <01010188c25446a8-ab92bda6-9f34-464a-abf7-40aa19845f5f-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182921

--===============6205123102583953334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.6.2-4.6.3.patch
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
From ec0fcc35cf559fe2cf6ebebc1a9796c38e8721d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 14:08:23 +0000
Subject: [PATCH] python3-typing-extensions: upgrade 4.6.2 -> 4.6.3

---
 ....bb => python3-typing-extensions_4.6.3.bb} | 86 ++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.6.2.bb => python3-typing-extensions_4.6.3.bb} (17%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
similarity index 17%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
index be43fe4a64..ee480589f4 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
@@ -1,3 +1,85 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -2,12 +2,12 @@
+#  ==========================
+#  
+#  Python was created in the early 1990s by Guido van Rossum at Stichting
+# -Mathematisch Centrum (CWI, see http://www.cwi.nl) in the Netherlands
+# +Mathematisch Centrum (CWI, see https://www.cwi.nl) in the Netherlands
+#  as a successor of a language called ABC.  Guido remains Python's
+#  principal author, although it includes many contributions from others.
+#  
+#  In 1995, Guido continued his work on Python at the Corporation for
+# -National Research Initiatives (CNRI, see http://www.cnri.reston.va.us)
+# +National Research Initiatives (CNRI, see https://www.cnri.reston.va.us)
+#  in Reston, Virginia where he released several versions of the
+#  software.
+#  
+# @@ -19,7 +19,7 @@
+#  created specifically to own Python-related Intellectual Property.
+#  Zope Corporation was a sponsoring member of the PSF.
+#  
+# -All Python releases are Open Source (see http://www.opensource.org for
+# +All Python releases are Open Source (see https://opensource.org for
+#  the Open Source Definition).  Historically, most, but not all, Python
+#  releases have also been GPL-compatible; the table below summarizes
+#  the various releases.
+# @@ -59,6 +59,17 @@
+#  B. TERMS AND CONDITIONS FOR ACCESSING OR OTHERWISE USING PYTHON
+#  ===============================================================
+#  
+# +Python software and documentation are licensed under the
+# +Python Software Foundation License Version 2.
+# +
+# +Starting with Python 3.8.6, examples, recipes, and other code in
+# +the documentation are dual licensed under the PSF License Version 2
+# +and the Zero-Clause BSD license.
+# +
+# +Some software incorporated into Python is under different licenses.
+# +The licenses are listed with code falling under that license.
+# +
+# +
+#  PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
+#  --------------------------------------------
+#  
+# @@ -73,7 +84,7 @@
+#  distribute, and otherwise use Python alone or in any derivative version,
+#  provided, however, that PSF's License Agreement and PSF's notice of copyright,
+#  i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
+# -2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022 Python Software Foundation;
+# +2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023 Python Software Foundation;
+#  All Rights Reserved" are retained in Python alone or in any derivative version
+#  prepared by Licensee.
+#  
+# @@ -252,3 +263,17 @@
+#  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+#  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
+#  OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+# +
+# +ZERO-CLAUSE BSD LICENSE FOR CODE IN THE PYTHON DOCUMENTATION
+# +----------------------------------------------------------------------
+# +
+# +Permission to use, copy, modify, and/or distribute this software for any
+# +purpose with or without fee is hereby granted.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
+# +REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+# +AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
+# +INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
+# +LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
+# +OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+# +PERFORMANCE OF THIS SOFTWARE.
+# 
+#
+
 SUMMARY = "Backported and Experimental Type Hints for Python 3.7+"
 DESCRIPTION = "The typing_extensions module serves two related purposes:\
 \
@@ -10,12 +92,12 @@ HOMEPAGE = "https://github.com/python/typing_extensions"
 BUGTRACKER = "https://github.com/python/typing_extensions/issues"
 SECTIONS = "libs"
 LICENSE = "PSF-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "06006244c70ac8ee83fa8282cb188f697b8db25bc8b4df07be1873c43897060c"
+SRC_URI[sha256sum] = "d91d5919357fe7f681a9f2b5b4cb2a5f1ef0a1e9f59c4d8ff0d3491e05c0ffd5"
 
 inherit pypi python_flit_core
 
-- 
2.39.2


--===============6205123102583953334==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.6.2-4.6.3.patch"

RnJvbSBlYzBmY2MzNWNmNTU5ZmUyY2Y2ZWJlYmMxYTk3OTZjMzhlODcyMWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTQ6MDg6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXR5cGluZy1leHRlbnNpb25zOiB1cGdyYWRlIDQuNi4yIC0+IDQuNi4zCgotLS0KIC4u
Li5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNi4zLmJifSB8IDg2ICsrKysrKysr
KysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHlwaW5n
LWV4dGVuc2lvbnNfNC42LjIuYmIgPT4gcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjYuMy5i
Yn0gKDE3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdHlwaW5nLWV4dGVuc2lvbnNfNC42LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC42LjMuYmIKc2ltaWxhcml0eSBpbmRleCAx
NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cGlu
Zy1leHRlbnNpb25zXzQuNi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC42LjMuYmIKaW5kZXggYmU0M2ZlNGE2NC4u
ZWU0ODA1ODlmNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXR5cGluZy1leHRlbnNpb25zXzQuNi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjYuMy5iYgpAQCAtMSwzICsxLDg1
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAt
MiwxMiArMiwxMiBAQAorIyAgPT09PT09PT09PT09PT09PT09PT09PT09PT0KKyMgIAorIyAgUHl0
aG9uIHdhcyBjcmVhdGVkIGluIHRoZSBlYXJseSAxOTkwcyBieSBHdWlkbyB2YW4gUm9zc3VtIGF0
IFN0aWNodGluZworIyAtTWF0aGVtYXRpc2NoIENlbnRydW0gKENXSSwgc2VlIGh0dHA6Ly93d3cu
Y3dpLm5sKSBpbiB0aGUgTmV0aGVybGFuZHMKKyMgK01hdGhlbWF0aXNjaCBDZW50cnVtIChDV0ks
IHNlZSBodHRwczovL3d3dy5jd2kubmwpIGluIHRoZSBOZXRoZXJsYW5kcworIyAgYXMgYSBzdWNj
ZXNzb3Igb2YgYSBsYW5ndWFnZSBjYWxsZWQgQUJDLiAgR3VpZG8gcmVtYWlucyBQeXRob24ncwor
IyAgcHJpbmNpcGFsIGF1dGhvciwgYWx0aG91Z2ggaXQgaW5jbHVkZXMgbWFueSBjb250cmlidXRp
b25zIGZyb20gb3RoZXJzLgorIyAgCisjICBJbiAxOTk1LCBHdWlkbyBjb250aW51ZWQgaGlzIHdv
cmsgb24gUHl0aG9uIGF0IHRoZSBDb3Jwb3JhdGlvbiBmb3IKKyMgLU5hdGlvbmFsIFJlc2VhcmNo
IEluaXRpYXRpdmVzIChDTlJJLCBzZWUgaHR0cDovL3d3dy5jbnJpLnJlc3Rvbi52YS51cykKKyMg
K05hdGlvbmFsIFJlc2VhcmNoIEluaXRpYXRpdmVzIChDTlJJLCBzZWUgaHR0cHM6Ly93d3cuY25y
aS5yZXN0b24udmEudXMpCisjICBpbiBSZXN0b24sIFZpcmdpbmlhIHdoZXJlIGhlIHJlbGVhc2Vk
IHNldmVyYWwgdmVyc2lvbnMgb2YgdGhlCisjICBzb2Z0d2FyZS4KKyMgIAorIyBAQCAtMTksNyAr
MTksNyBAQAorIyAgY3JlYXRlZCBzcGVjaWZpY2FsbHkgdG8gb3duIFB5dGhvbi1yZWxhdGVkIElu
dGVsbGVjdHVhbCBQcm9wZXJ0eS4KKyMgIFpvcGUgQ29ycG9yYXRpb24gd2FzIGEgc3BvbnNvcmlu
ZyBtZW1iZXIgb2YgdGhlIFBTRi4KKyMgIAorIyAtQWxsIFB5dGhvbiByZWxlYXNlcyBhcmUgT3Bl
biBTb3VyY2UgKHNlZSBodHRwOi8vd3d3Lm9wZW5zb3VyY2Uub3JnIGZvcgorIyArQWxsIFB5dGhv
biByZWxlYXNlcyBhcmUgT3BlbiBTb3VyY2UgKHNlZSBodHRwczovL29wZW5zb3VyY2Uub3JnIGZv
cgorIyAgdGhlIE9wZW4gU291cmNlIERlZmluaXRpb24pLiAgSGlzdG9yaWNhbGx5LCBtb3N0LCBi
dXQgbm90IGFsbCwgUHl0aG9uCisjICByZWxlYXNlcyBoYXZlIGFsc28gYmVlbiBHUEwtY29tcGF0
aWJsZTsgdGhlIHRhYmxlIGJlbG93IHN1bW1hcml6ZXMKKyMgIHRoZSB2YXJpb3VzIHJlbGVhc2Vz
LgorIyBAQCAtNTksNiArNTksMTcgQEAKKyMgIEIuIFRFUk1TIEFORCBDT05ESVRJT05TIEZPUiBB
Q0NFU1NJTkcgT1IgT1RIRVJXSVNFIFVTSU5HIFBZVEhPTgorIyAgPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjICAKKyMgK1B5
dGhvbiBzb2Z0d2FyZSBhbmQgZG9jdW1lbnRhdGlvbiBhcmUgbGljZW5zZWQgdW5kZXIgdGhlCisj
ICtQeXRob24gU29mdHdhcmUgRm91bmRhdGlvbiBMaWNlbnNlIFZlcnNpb24gMi4KKyMgKworIyAr
U3RhcnRpbmcgd2l0aCBQeXRob24gMy44LjYsIGV4YW1wbGVzLCByZWNpcGVzLCBhbmQgb3RoZXIg
Y29kZSBpbgorIyArdGhlIGRvY3VtZW50YXRpb24gYXJlIGR1YWwgbGljZW5zZWQgdW5kZXIgdGhl
IFBTRiBMaWNlbnNlIFZlcnNpb24gMgorIyArYW5kIHRoZSBaZXJvLUNsYXVzZSBCU0QgbGljZW5z
ZS4KKyMgKworIyArU29tZSBzb2Z0d2FyZSBpbmNvcnBvcmF0ZWQgaW50byBQeXRob24gaXMgdW5k
ZXIgZGlmZmVyZW50IGxpY2Vuc2VzLgorIyArVGhlIGxpY2Vuc2VzIGFyZSBsaXN0ZWQgd2l0aCBj
b2RlIGZhbGxpbmcgdW5kZXIgdGhhdCBsaWNlbnNlLgorIyArCisjICsKKyMgIFBZVEhPTiBTT0ZU
V0FSRSBGT1VOREFUSU9OIExJQ0VOU0UgVkVSU0lPTiAyCisjICAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC03Myw3ICs4NCw3IEBACisjICBk
aXN0cmlidXRlLCBhbmQgb3RoZXJ3aXNlIHVzZSBQeXRob24gYWxvbmUgb3IgaW4gYW55IGRlcml2
YXRpdmUgdmVyc2lvbiwKKyMgIHByb3ZpZGVkLCBob3dldmVyLCB0aGF0IFBTRidzIExpY2Vuc2Ug
QWdyZWVtZW50IGFuZCBQU0YncyBub3RpY2Ugb2YgY29weXJpZ2h0LAorIyAgaS5lLiwgIkNvcHly
aWdodCAoYykgMjAwMSwgMjAwMiwgMjAwMywgMjAwNCwgMjAwNSwgMjAwNiwgMjAwNywgMjAwOCwg
MjAwOSwgMjAxMCwKKyMgLTIwMTEsIDIwMTIsIDIwMTMsIDIwMTQsIDIwMTUsIDIwMTYsIDIwMTcs
IDIwMTgsIDIwMTksIDIwMjAsIDIwMjEsIDIwMjIgUHl0aG9uIFNvZnR3YXJlIEZvdW5kYXRpb247
CisjICsyMDExLCAyMDEyLCAyMDEzLCAyMDE0LCAyMDE1LCAyMDE2LCAyMDE3LCAyMDE4LCAyMDE5
LCAyMDIwLCAyMDIxLCAyMDIyLCAyMDIzIFB5dGhvbiBTb2Z0d2FyZSBGb3VuZGF0aW9uOworIyAg
QWxsIFJpZ2h0cyBSZXNlcnZlZCIgYXJlIHJldGFpbmVkIGluIFB5dGhvbiBhbG9uZSBvciBpbiBh
bnkgZGVyaXZhdGl2ZSB2ZXJzaW9uCisjICBwcmVwYXJlZCBieSBMaWNlbnNlZS4KKyMgIAorIyBA
QCAtMjUyLDMgKzI2MywxNyBAQAorIyAgV0hBVFNPRVZFUiBSRVNVTFRJTkcgRlJPTSBMT1NTIE9G
IFVTRSwgREFUQSBPUiBQUk9GSVRTLCBXSEVUSEVSIElOIEFOCisjICBBQ1RJT04gT0YgQ09OVFJB
Q1QsIE5FR0xJR0VOQ0UgT1IgT1RIRVIgVE9SVElPVVMgQUNUSU9OLCBBUklTSU5HIE9VVAorIyAg
T0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBVU0UgT1IgUEVSRk9STUFOQ0UgT0YgVEhJUyBT
T0ZUV0FSRS4KKyMgKworIyArWkVSTy1DTEFVU0UgQlNEIExJQ0VOU0UgRk9SIENPREUgSU4gVEhF
IFBZVEhPTiBET0NVTUVOVEFUSU9OCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK1Blcm1pc3Np
b24gdG8gdXNlLCBjb3B5LCBtb2RpZnksIGFuZC9vciBkaXN0cmlidXRlIHRoaXMgc29mdHdhcmUg
Zm9yIGFueQorIyArcHVycG9zZSB3aXRoIG9yIHdpdGhvdXQgZmVlIGlzIGhlcmVieSBncmFudGVk
LgorIyArCisjICtUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiBBTkQgVEhFIEFVVEhP
UiBESVNDTEFJTVMgQUxMIFdBUlJBTlRJRVMgV0lUSAorIyArUkVHQVJEIFRPIFRISVMgU09GVFdB
UkUgSU5DTFVESU5HIEFMTCBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZCisj
ICtBTkQgRklUTkVTUy4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFIEFVVEhPUiBCRSBMSUFCTEUgRk9S
IEFOWSBTUEVDSUFMLCBESVJFQ1QsCisjICtJTkRJUkVDVCwgT1IgQ09OU0VRVUVOVElBTCBEQU1B
R0VTIE9SIEFOWSBEQU1BR0VTIFdIQVRTT0VWRVIgUkVTVUxUSU5HIEZST00KKyMgK0xPU1MgT0Yg
VVNFLCBEQVRBIE9SIFBST0ZJVFMsIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBO
RUdMSUdFTkNFIE9SCisjICtPVEhFUiBUT1JUSU9VUyBBQ1RJT04sIEFSSVNJTkcgT1VUIE9GIE9S
IElOIENPTk5FQ1RJT04gV0lUSCBUSEUgVVNFIE9SCisjICtQRVJGT1JNQU5DRSBPRiBUSElTIFNP
RlRXQVJFLgorIyAKKyMKKwogU1VNTUFSWSA9ICJCYWNrcG9ydGVkIGFuZCBFeHBlcmltZW50YWwg
VHlwZSBIaW50cyBmb3IgUHl0aG9uIDMuNysiCiBERVNDUklQVElPTiA9ICJUaGUgdHlwaW5nX2V4
dGVuc2lvbnMgbW9kdWxlIHNlcnZlcyB0d28gcmVsYXRlZCBwdXJwb3NlczpcCiBcCkBAIC0xMCwx
MiArOTIsMTIgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi90eXBpbmdf
ZXh0ZW5zaW9ucyIKIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi90eXBp
bmdfZXh0ZW5zaW9ucy9pc3N1ZXMiCiBTRUNUSU9OUyA9ICJsaWJzIgogTElDRU5TRSA9ICJQU0Yt
Mi4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZjE2YjMyMzkxNzk5
MmUwZjhhNmYwMDcxYmM5OTEzZTIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1mY2Y2YjI0OWMyNjQxNTQwMjE5YTcyN2YzNWQ4ZDJjMiIKIAogIyBUaGUgbmFtZSBvbiBQ
eVBpIGlzIHNsaWdodGx5IGRpZmZlcmVudC4KIFBZUElfUEFDS0FHRSA9ICJ0eXBpbmdfZXh0ZW5z
aW9ucyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA2MDA2MjQ0YzcwYWM4ZWU4M2ZhODI4MmNi
MTg4ZjY5N2I4ZGIyNWJjOGI0ZGYwN2JlMTg3M2M0Mzg5NzA2MGMiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDkxZDU5MTkzNTdmZTdmNjgxYTlmMmI1YjRjYjJhNWYxZWYwYTFlOWY1OWM0ZDhmZjBk
MzQ5MWUwNWMwZmZkNSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUKIAotLSAKMi4z
OS4yCgo=

--===============6205123102583953334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.6.2.tar.gz;downloadfilename=typing_extensions-4.6.2.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.6.3.tar.gz;downloadfilename=typing_extensions-4.6.3.tar.gz"
packages/core2-32-poky-linux/python3-typing-extensions: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 247599 to 248377 (+0%)
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.6.2" to "4.6.3"
Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.6.2.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.6.3.dist-info

--===============6205123102583953334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.6.2.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.6.3.dist-info

--===============6205123102583953334==--

