Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A21C54EF2
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.20322.1708018344040892988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FbZYskLg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SGyNvVc9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd39cb2-dee8a0fb-cfd2-45bd-8dcd-0fc86a47f9b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lyn30+RqsPFd1wNwwuQQfYk+9xOMJfFmTNqzIMhot0o=;
	b=FbZYskLgoOBsdbLf6Ij+6B98foDx6ozqrELKgfD6E+06fFE9UspI+L71e9sipcXH
	avLOPzqZt/UWTCTiksIJFVdjWmt1Sw05xama4A+swAbViZ8HRxFl4Ykuxycr+NOstV7
	9ohEiDAMINzOs18FsaxPsIgeq7cWjxaC2AVj2ZDM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lyn30+RqsPFd1wNwwuQQfYk+9xOMJfFmTNqzIMhot0o=;
	b=SGyNvVc9d4GeLAHBJ2mVPI9UEoe0mmfRSNNdchu/GGglp6Si34Ssbecu+B/K0Iya
	vvsH0JYCoSAlb83Z5DeL+sHP95HMOoSY5/GP0GxHDxSOgaKYvhS2uFnwt38PjPWdhsZ
	FMxNWSl/e2tIE2299WbvXSbRFVXXVxSsdWwk29GQ=
Content-Type: multipart/mixed; boundary="===============4707482040271158863=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.12.5 SUCCEEDED
Message-ID: <0101018dadd39cb2-dee8a0fb-cfd2-45bd-8dcd-0fc86a47f9b0-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195561

--===============4707482040271158863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.12.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.11.5-2.12.5.patch
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
From 67e56e4d287a174de592270e2907299cb0d664b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:15:23 +0000
Subject: [PATCH] libxml2: upgrade 2.11.5 -> 2.12.5

---
 .../libxml/libxml2/install-tests.patch        |  8 +--
 .../{libxml2_2.11.5.bb => libxml2_2.12.5.bb}  | 50 +++++++++++++++++--
 2 files changed, 50 insertions(+), 8 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.12.5.bb} (69%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 14ccce5873..e1d5bf0402 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
+From c3aa7884fcde42ded54d61b7df7aa14e22cb29c4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 5bc4018..57d27af 100644
+index 0a49d37..1097c63 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS = \
- 	testlimits \
+@@ -27,6 +27,16 @@ check_PROGRAMS = \
+ 	testparser \
  	testrecurse
  
 +ptestdir=$(libexecdir)
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.12.5.bb
similarity index 69%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.5.bb
index 44336c25e1..36a80fff3f 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.5.bb
@@ -1,13 +1,55 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- Copyright
+# +++ Copyright
+# @@ -1,4 +1,4 @@
+# -Except where otherwise noted in the source code (e.g. the files hash.c,
+# +Except where otherwise noted in the source code (e.g. the files dict.c,
+#  list.c and the trio files, which are covered by a similar licence but
+#  with different Copyright notices) all the files are:
+#  
+# --- hash.c
+# +++ hash.c
+# @@ -1,10 +1,10 @@
+# - * Copyright (C) 2000,2012 Bjorn Reese and Daniel Veillard.
+#   *
+# - * Permission to use, copy, modify, and distribute this software for any
+# - * purpose with or without fee is hereby granted, provided that the above
+# - * copyright notice and this permission notice appear in all copies.
+# - *
+# - * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED
+# - * WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+# - * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE AUTHORS AND
+# - * CONTRIBUTORS ACCEPT NO RESPONSIBILITY IN ANY CONCEIVABLE MANNER.
+# + * See Copyright for the status of this software.
+# + */
+# +
+# +#define IN_LIBXML
+# +#include "libxml.h"
+# +
+# +#include <string.h>
+# +#include <limits.h>
+# +
+# 
+#
+
 SUMMARY = "XML C Parser Library and Toolkit"
 DESCRIPTION = "The XML Parser Library allows for manipulation of XML files.  Libxml2 exports Push and Pull type parser interfaces for both XML and HTML.  It can do DTD validation at parse time, on a parsed document instance or with an arbitrary DTD.  Libxml2 includes complete XPath, XPointer and Xinclude implementations.  It also has a SAX like interface, which is designed to be compatible with Expat."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
-                    file://hash.c;beginline=6;endline=15;md5=e77f77b12cb69e203d8b4090a0eee879 \
+LIC_FILES_CHKSUM = "file://Copyright;md5=fec7ecfe714722b2bb0aaff7d200c701 \
+                    file://hash.c;beginline=6;endline=15;md5=9af9349d0ead24569dc332f2116ef5f8 \
                     file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
-                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f"
+                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f \
+                    "
 
 DEPENDS = "zlib virtual/libiconv"
 
@@ -19,7 +61,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
+SRC_URI[archive.sha256sum] = "a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.42.0


--===============4707482040271158863==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.11.5-2.12.5.patch"

RnJvbSA2N2U1NmU0ZDI4N2ExNzRkZTU5MjI3MGUyOTA3Mjk5Y2IwZDY2NGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6MTU6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWwyOiB1cGdyYWRlIDIuMTEuNSAtPiAyLjEyLjUKCi0tLQogLi4uL2xpYnhtbC9saWJ4bWwy
L2luc3RhbGwtdGVzdHMucGF0Y2ggICAgICAgIHwgIDggKy0tCiAuLi4ve2xpYnhtbDJfMi4xMS41
LmJiID0+IGxpYnhtbDJfMi4xMi41LmJifSAgfCA1MCArKysrKysrKysrKysrKysrKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvcmUvbGlieG1sL3tsaWJ4bWwyXzIuMTEuNS5iYiA9PiBsaWJ4bWwyXzIuMTIu
NS5iYn0gKDY5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1s
Mi9pbnN0YWxsLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIv
aW5zdGFsbC10ZXN0cy5wYXRjaAppbmRleCAxNGNjY2U1ODczLi5lMWQ1YmYwNDAyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNmYzcxNjM1N2NlMTM3MmQ5NDE4ZGM4NmYyNDMxNWIz
NGQ5ODA4ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGMzYWE3ODg0ZmNkZTQyZGVk
NTRkNjFiN2RmN2FhMTRlMjJjYjI5YzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1vbiwgNSBEZWMgMjAyMiAx
NzowMjozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgeW9jdG8tc3BlY2lmaWMgaW5zdGFs
bC1wdGVzdCB0YXJnZXQKQEAgLTEzLDExICsxMywxMSBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5kZXggNWJj
NDAxOC4uNTdkMjdhZiAxMDA2NDQKK2luZGV4IDBhNDlkMzcuLjEwOTdjNjMgMTAwNjQ0CiAtLS0g
YS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KLUBAIC0yNiw2ICsyNiwxNiBAQCBjaGVj
a19QUk9HUkFNUyA9IFwKLSAJdGVzdGxpbWl0cyBcCitAQCAtMjcsNiArMjcsMTYgQEAgY2hlY2tf
UFJPR1JBTVMgPSBcCisgCXRlc3RwYXJzZXIgXAogIAl0ZXN0cmVjdXJzZQogIAogK3B0ZXN0ZGly
PSQobGliZXhlY2RpcikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4
bWwyXzIuMTEuNS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTIuNS5i
YgpzaW1pbGFyaXR5IGluZGV4IDY5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4
bWwvbGlieG1sMl8yLjExLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9s
aWJ4bWwyXzIuMTIuNS5iYgppbmRleCA0NDMzNmMyNWUxLi4zNmE4MGZmZjNmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjExLjUuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xMi41LmJiCkBAIC0xLDEzICsxLDU1IEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gQ29weXJpZ2h0CisjICsrKyBDb3B5cmlnaHQKKyMgQEAgLTEs
NCArMSw0IEBACisjIC1FeGNlcHQgd2hlcmUgb3RoZXJ3aXNlIG5vdGVkIGluIHRoZSBzb3VyY2Ug
Y29kZSAoZS5nLiB0aGUgZmlsZXMgaGFzaC5jLAorIyArRXhjZXB0IHdoZXJlIG90aGVyd2lzZSBu
b3RlZCBpbiB0aGUgc291cmNlIGNvZGUgKGUuZy4gdGhlIGZpbGVzIGRpY3QuYywKKyMgIGxpc3Qu
YyBhbmQgdGhlIHRyaW8gZmlsZXMsIHdoaWNoIGFyZSBjb3ZlcmVkIGJ5IGEgc2ltaWxhciBsaWNl
bmNlIGJ1dAorIyAgd2l0aCBkaWZmZXJlbnQgQ29weXJpZ2h0IG5vdGljZXMpIGFsbCB0aGUgZmls
ZXMgYXJlOgorIyAgCisjIC0tLSBoYXNoLmMKKyMgKysrIGhhc2guYworIyBAQCAtMSwxMCArMSwx
MCBAQAorIyAtICogQ29weXJpZ2h0IChDKSAyMDAwLDIwMTIgQmpvcm4gUmVlc2UgYW5kIERhbmll
bCBWZWlsbGFyZC4KKyMgICAqCisjIC0gKiBQZXJtaXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5
LCBhbmQgZGlzdHJpYnV0ZSB0aGlzIHNvZnR3YXJlIGZvciBhbnkKKyMgLSAqIHB1cnBvc2Ugd2l0
aCBvciB3aXRob3V0IGZlZSBpcyBoZXJlYnkgZ3JhbnRlZCwgcHJvdmlkZWQgdGhhdCB0aGUgYWJv
dmUKKyMgLSAqIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgYXBw
ZWFyIGluIGFsbCBjb3BpZXMuCisjIC0gKgorIyAtICogVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURF
RCBgYEFTIElTJycgQU5EIFdJVEhPVVQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRAorIyAtICogV0FS
UkFOVElFUywgSU5DTFVESU5HLCBXSVRIT1VUIExJTUlUQVRJT04sIFRIRSBJTVBMSUVEIFdBUlJB
TlRJRVMgT0YKKyMgLSAqIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuIFRIRSBBVVRIT1JTIEFORAorIyAtICogQ09OVFJJQlVUT1JTIEFDQ0VQVCBO
TyBSRVNQT05TSUJJTElUWSBJTiBBTlkgQ09OQ0VJVkFCTEUgTUFOTkVSLgorIyArICogU2VlIENv
cHlyaWdodCBmb3IgdGhlIHN0YXR1cyBvZiB0aGlzIHNvZnR3YXJlLgorIyArICovCisjICsKKyMg
KyNkZWZpbmUgSU5fTElCWE1MCisjICsjaW5jbHVkZSAibGlieG1sLmgiCisjICsKKyMgKyNpbmNs
dWRlIDxzdHJpbmcuaD4KKyMgKyNpbmNsdWRlIDxsaW1pdHMuaD4KKyMgKworIyAKKyMKKwogU1VN
TUFSWSA9ICJYTUwgQyBQYXJzZXIgTGlicmFyeSBhbmQgVG9vbGtpdCIKIERFU0NSSVBUSU9OID0g
IlRoZSBYTUwgUGFyc2VyIExpYnJhcnkgYWxsb3dzIGZvciBtYW5pcHVsYXRpb24gb2YgWE1MIGZp
bGVzLiAgTGlieG1sMiBleHBvcnRzIFB1c2ggYW5kIFB1bGwgdHlwZSBwYXJzZXIgaW50ZXJmYWNl
cyBmb3IgYm90aCBYTUwgYW5kIEhUTUwuICBJdCBjYW4gZG8gRFREIHZhbGlkYXRpb24gYXQgcGFy
c2UgdGltZSwgb24gYSBwYXJzZWQgZG9jdW1lbnQgaW5zdGFuY2Ugb3Igd2l0aCBhbiBhcmJpdHJh
cnkgRFRELiAgTGlieG1sMiBpbmNsdWRlcyBjb21wbGV0ZSBYUGF0aCwgWFBvaW50ZXIgYW5kIFhp
bmNsdWRlIGltcGxlbWVudGF0aW9ucy4gIEl0IGFsc28gaGFzIGEgU0FYIGxpa2UgaW50ZXJmYWNl
LCB3aGljaCBpcyBkZXNpZ25lZCB0byBiZSBjb21wYXRpYmxlIHdpdGggRXhwYXQuIgogSE9NRVBB
R0UgPSAiaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnhtbDIiCiBCVUdUUkFDS0VS
ID0gImh0dHA6Ly9idWd6aWxsYS5nbm9tZS5vcmcvYnVnbGlzdC5jZ2k/cHJvZHVjdD1saWJ4bWwy
IgogU0VDVElPTiA9ICJsaWJzIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9Db3B5cmlnaHQ7bWQ1PTIwNDQ0MTdlMmU1MDA2YjY1YThiOTA2N2I2ODNmY2YxIFwK
LSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2hhc2guYztiZWdpbmxpbmU9NjtlbmRsaW5lPTE1
O21kNT1lNzdmNzdiMTJjYjY5ZTIwM2Q4YjQwOTBhMGVlZTg3OSBcCitMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9Db3B5cmlnaHQ7bWQ1PWZlYzdlY2ZlNzE0NzIyYjJiYjBhYWZmN2QyMDBjNzAx
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL2hhc2guYztiZWdpbmxpbmU9NjtlbmRsaW5l
PTE1O21kNT05YWY5MzQ5ZDBlYWQyNDU2OWRjMzMyZjIxMTZlZjVmOCBcCiAgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9saXN0LmM7YmVnaW5saW5lPTQ7ZW5kbGluZT0xMzttZDU9YjljMjViMDIx
Y2NhZjI4N2U1MDA2MDYwMmQyMGYzYTcgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vdHJp
by5jO2JlZ2lubGluZT01O2VuZGxpbmU9MTQ7bWQ1PWNkNGY2MWUyN2Y4OGMxZDQzZGYxMTI5NjZi
MWNkMjhmIgorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vdHJpby5jO2JlZ2lubGluZT01O2Vu
ZGxpbmU9MTQ7bWQ1PWNkNGY2MWUyN2Y4OGMxZDQzZGYxMTI5NjZiMWNkMjhmIFwKKyAgICAgICAg
ICAgICAgICAgICAgIgogCiBERVBFTkRTID0gInpsaWIgdmlydHVhbC9saWJpY29udiIKIApAQCAt
MTksNyArNjEsNyBAQCBTUkNfVVJJICs9ICJodHRwOi8vd3d3LnczLm9yZy9YTUwvVGVzdC94bWx0
czIwMTMwOTIzLnRhcjtzdWJkaXI9JHtCUH07bmFtZT10ZXN0dAogICAgICAgICAgICBmaWxlOi8v
aW5zdGFsbC10ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNoaXZlLnNo
YTI1NnN1bV0gPSAiMzcyN2IwNzhjMzYwZWM2OWZhODY5ZGUxNGJkNmY3NWQ3ZWU4ZDM2OTg3YjA3
MWU2OTI4ZDQ3MjBhMjhkZjNhNiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImE5NzI3
OTY2OTZhZmQzODA3M2UwZjU5YzI4M2MzYTJmNWE1NjBiNTI2OGI0YmFiYzM5MWIyODYxNjY1MjZi
MjEiCiBTUkNfVVJJW3Rlc3R0YXIuc2hhMjU2c3VtXSA9ICJjNmIyZDQyZWU1MGI4YjIzNmU3MTFh
OTdkNjhlNmM0YjVjOGQ4M2U2OWEyYmU0NzIyMzc5ZjA4NzAyZWE3MjczIgogCiAjIERpc3B1dGVk
IGFzIGEgc2VjdXJpdHkgaXNzdWUsIGJ1dCBmaXhlZCBpbiBkMzlmNzgwCi0tIAoyLjQyLjAKCg==

--===============4707482040271158863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.11/libxml2-2.11.5.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.11.5;name=testtar file://run-ptest file://install-tests.patch" to "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.5.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.5;name=testtar file://run-ptest file://install-tests.patch"
packages/core2-64-poky-linux/libxml2: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 7445392 to 7513120 (+1%)
packages/core2-64-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.2.11.5", added "/usr/lib/.debug/libxml2.so.2.12.5 /usr/lib/libxml2/ptest/.debug/testparser"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGSIZE changed from 417112 to 415410 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dev: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGSIZE changed from 3132415 to 3119076 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2-doc: FILELIST: added "/usr/share/doc/libxml2/python/examples/setup_test.py"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-locale: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGSIZE changed from 16156913 to 16278948 (+1%)
packages/core2-64-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/test/errors/trailing-null-1.xml /usr/lib/libxml2/ptest/result/ns-ent.xml.rdr /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.ent /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.ent /usr/lib/libxml2/ptest/result/ns-ent.xml.rde /usr/lib/libxml2/ptest/test/valid/dtds/huge.ent /usr/lib/libxml2/ptest/result/noent/issue643.xml /usr/lib/libxml2/ptest/result/errors/attr6.xml.str /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html.sax /usr/lib/libxml2/ptest/result/ns-ent.xml.sax /usr/lib/libxml2/ptest/result/errors/empty.xml.err /usr/lib/libxml2/ptest/test/valid/huge.xml /usr/lib/libxml2/ptest/test/errors/quadratic-defattr.xml /usr/lib/libxml2/ptest/result/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.ent /usr/lib/libxml2/ptest/result/errors/name3.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.ent /usr/lib/libxml2/ptest/result
 /errors/invalid-start-tag-2.xml.ent /usr/lib/libxml2/ptest/test/errors/truncated-utf16.xml /usr/lib/libxml2/ptest/result/noent/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/result/errors/extra-content.xml.ent /usr/lib/libxml2/ptest/python/tests/setup_test.py /usr/lib/libxml2/ptest/result/errors/attr6.xml.ent /usr/lib/libxml2/ptest/testparser /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.ent /usr/lib/libxml2/ptest/result/errors/attr5.xml.err /usr/lib/libxml2/ptest/result/issue626.xml.rde /usr/lib/libxml2/ptest/result/issue643.xml.rde /usr/lib/libxml2/ptest/test/ns-ent.xml /usr/lib/libxml2/ptest/result/valid/huge.xml /usr/lib/libxml2/ptest/test/errors/extra-content.xml /usr/lib/libxml2/ptest/result/issue626.xml.rdr /usr/lib/libxml2/ptest/result/issue643.xml.rdr /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.str /usr/lib/libxml2/ptest/result/valid/pe-latin1.xml /usr/lib/libxml2/ptest/result/errors/name3.xml.ent /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.
 err /usr/lib/libxml2/ptest/test/issue626.xml /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.ent /usr/lib/libxml2/ptest/test/valid/dtds/pe-latin1.ent /usr/lib/libxml2/ptest/result/ns-ent.xml /usr/lib/libxml2/ptest/test/errors/unclosed-element.xml /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.err /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.err /usr/lib/libxml2/ptest/result/errors/attr5.xml.str /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-1.xml /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-2.xml /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.str /usr/lib/libxml2/ptest/test/valid/pe-latin1.xml /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.err /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.err /usr/lib/libxml2/ptest/result/errors/extra-content.xml.str /usr/lib/libxml2/pte
 st/result/issue626.xml /usr/lib/libxml2/ptest/result/issue643.xml /usr/lib/libxml2/ptest/test/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/result/noent/ns-ent.xml /usr/lib/libxml2/ptest/result/issue626.xml.sax /usr/lib/libxml2/ptest/result/issue643.xml.sax /usr/lib/libxml2/ptest/result/noent/issue626.xml.sax2 /usr/lib/libxml2/ptest/result/noent/issue643.xml.sax2 /usr/lib/libxml2/ptest/result/errors/empty.xml.ent /usr/lib/libxml2/ptest/result/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/result/errors/attr5.xml.ent /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.ent /usr/lib/libxml2/ptest/test/errors/trailing-null-2.xml /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.str /usr/lib/libxml2/ptest/result/issue626.xml.sax2 /usr/lib/libxml2/ptest/result/issue643.xml.sax2 /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.str /usr/lib/libxml2/ptest/test/HTML/xml-declaration-1.html /usr/lib/libxml2/ptest/result/noent/issue626.xml /usr/lib/libxml2/ptest/result/errors/attr6.
 xml.err /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.err /usr/lib/libxml2/ptest/result/errors/extra-content.xml.err /usr/lib/libxml2/ptest/test/issue643.xml /usr/lib/libxml2/ptest/result/errors/name3.xml.err /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html /usr/lib/libxml2/ptest/test/errors/name3.xml /usr/lib/libxml2/ptest/test/errors/attr5.xml /usr/lib/libxml2/ptest/test/errors/attr6.xml /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.dtd /usr/lib/libxml2/ptest/test/errors/empty.xml /usr/lib/libxml2/ptest/result/errors/empty.xml.str /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.str /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.err"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGSIZE changed from 1726474 to 1725364 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-python: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 7846177 to 7763131 (-1%)
packages/core2-64-poky-linux/libxml2/libxml2-src: FILELIST: directory renamed /usr/src/debug/libxml2/2.11.5/include/private -> /usr/src/debug/libxml2/2.12.5/include/private, directory renamed /usr/src/debug/libxml2/2.11.5/python -> /usr/src/debug/libxml2/2.12.5/python, directory renamed /usr/src/debug/libxml2/2.11.5/include/libxml -> /usr/src/debug/libxml2/2.12.5/include/libxml, removed "/usr/src/debug/libxml2/2.11.5/globals.c /usr/src/debug/libxml2/2.11.5/xpath.c /usr/src/debug/libxml2/2.11.5/testThreads.c /usr/src/debug/libxml2/2.11.5/error.c /usr/src/debug/libxml2/2.11.5/SAX2.c /usr/src/debug/libxml2/2.11.5/runxmlconf.c /usr/src/debug/libxml2/2.11.5/xinclude.c /usr/src/debug/libxml2/2.11.5/chvalid.c /usr/src/debug/libxml2/2.11.5/testdict.c /usr/src/debug/libxml2/2.11.5/schematron.c /usr/src/debug/libxml2/2.11.5/testapi.c /usr/src/debug/libxml2/2.11.5/HTMLtree.c /usr/src/debug/libxml2/2.11.5/xpointer.c /usr/src/debug/libxml2/2.11.5/parserInternals.c /usr/src/debug/libxml2/2.11.5/ha
 sh.c /usr/src/debug/libxml2/2.11.5/xmllint.c /usr/src/debug/libxml2/2.11.5/xmlschemas.c /usr/src/debug/libxml2/2.11.5/xmlunicode.c /usr/src/debug/libxml2/2.11.5/xmlcatalog.c /usr/src/debug/libxml2/2.11.5/list.c /usr/src/debug/libxml2/2.11.5/xlink.c /usr/src/debug/libxml2/2.11.5/nanohttp.c /usr/src/debug/libxml2/2.11.5/xmlIO.c /usr/src/debug/libxml2/2.11.5/uri.c /usr/src/debug/libxml2/2.11.5/dict.c /usr/src/debug/libxml2/2.11.5/catalog.c /usr/src/debug/libxml2/2.11.5/parser.c /usr/src/debug/libxml2/2.11.5/buf.c /usr/src/debug/libxml2/2.11.5/runtest.c /usr/src/debug/libxml2/2.11.5/entities.c /usr/src/debug/libxml2/2.11.5/HTMLparser.c /usr/src/debug/libxml2/2.11.5/relaxng.c /usr/src/debug/libxml2/2.11.5/pattern.c /usr/src/debug/libxml2/2.11.5/testchar.c /usr/src/debug/libxml2/2.11.5/runsuite.c /usr/src/debug/libxml2/2.11.5/testrecurse.c /usr/src/debug/libxml2/2.11.5/xmlsave.c /usr/src/debug/libxml2/2.11.5/xmlstring.c /usr/src/debug/libxml2/2.11.5/threads.c /usr/src/debug/libxml2/2.11.5
 /testModule.c /usr/src/debug/libxml2/2.11.5/testlimits.c /usr/src/debug/libxml2/2.11.5/xmlreader.c /usr/src/debug/libxml2/2.11.5/xmlregexp.c /usr/src/debug/libxml2/2.11.5/c14n.c /usr/src/debug/libxml2/2.11.5/xmlmemory.c /usr/src/debug/libxml2/2.11.5/xmlmodule.c /usr/src/debug/libxml2/2.11.5/xmlschemastypes.c /usr/src/debug/libxml2/2.11.5/encoding.c /usr/src/debug/libxml2/2.11.5/timsort.h /usr/src/debug/libxml2/2.11.5/tree.c /usr/src/debug/libxml2/2.11.5/xmlwriter.c /usr/src/debug/libxml2/2.11.5/valid.c", added "/usr/src/debug/libxml2/2.12.5/globals.c /usr/src/debug/libxml2/2.12.5/xpath.c /usr/src/debug/libxml2/2.12.5/testThreads.c /usr/src/debug/libxml2/2.12.5/SAX2.c /usr/src/debug/libxml2/2.12.5/error.c /usr/src/debug/libxml2/2.12.5/runxmlconf.c /usr/src/debug/libxml2/2.12.5/xinclude.c /usr/src/debug/libxml2/2.12.5/chvalid.c /usr/src/debug/libxml2/2.12.5/testdict.c /usr/src/debug/libxml2/2.12.5/schematron.c /usr/src/debug/libxml2/2.12.5/testapi.c /usr/src/debug/libxml2/2.12.5/HTMLt
 ree.c /usr/src/debug/libxml2/2.12.5/xpointer.c /usr/src/debug/libxml2/2.12.5/parserInternals.c /usr/src/debug/libxml2/2.12.5/hash.c /usr/src/debug/libxml2/2.12.5/xmllint.c /usr/src/debug/libxml2/2.12.5/xmlunicode.c /usr/src/debug/libxml2/2.12.5/xmlschemas.c /usr/src/debug/libxml2/2.12.5/xmlcatalog.c /usr/src/debug/libxml2/2.12.5/list.c /usr/src/debug/libxml2/2.12.5/xlink.c /usr/src/debug/libxml2/2.12.5/nanohttp.c /usr/src/debug/libxml2/2.12.5/xmlIO.c /usr/src/debug/libxml2/2.12.5/uri.c /usr/src/debug/libxml2/2.12.5/dict.c /usr/src/debug/libxml2/2.12.5/catalog.c /usr/src/debug/libxml2/2.12.5/parser.c /usr/src/debug/libxml2/2.12.5/buf.c /usr/src/debug/libxml2/2.12.5/runtest.c /usr/src/debug/libxml2/2.12.5/entities.c /usr/src/debug/libxml2/2.12.5/HTMLparser.c /usr/src/debug/libxml2/2.12.5/relaxng.c /usr/src/debug/libxml2/2.12.5/pattern.c /usr/src/debug/libxml2/2.12.5/testchar.c /usr/src/debug/libxml2/2.12.5/runsuite.c /usr/src/debug/libxml2/2.12.5/testrecurse.c /usr/src/debug/libxml2/2
 .12.5/xmlsave.c /usr/src/debug/libxml2/2.12.5/xmlstring.c /usr/src/debug/libxml2/2.12.5/threads.c /usr/src/debug/libxml2/2.12.5/testModule.c /usr/src/debug/libxml2/2.12.5/testlimits.c /usr/src/debug/libxml2/2.12.5/testparser.c /usr/src/debug/libxml2/2.12.5/xmlreader.c /usr/src/debug/libxml2/2.12.5/xmlregexp.c /usr/src/debug/libxml2/2.12.5/c14n.c /usr/src/debug/libxml2/2.12.5/xmlmemory.c /usr/src/debug/libxml2/2.12.5/xmlmodule.c /usr/src/debug/libxml2/2.12.5/xmlschemastypes.c /usr/src/debug/libxml2/2.12.5/encoding.c /usr/src/debug/libxml2/2.12.5/timsort.h /usr/src/debug/libxml2/2.12.5/tree.c /usr/src/debug/libxml2/2.12.5/xmlwriter.c /usr/src/debug/libxml2/2.12.5/valid.c"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGSIZE changed from 91040 to 95208 (+5%)
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2-utils: PV changed from "2.11.5" to "2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2: PKGSIZE changed from 1383977 to 1379977 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.5", added "/usr/lib/libxml2.so.2.12.5"
packages/core2-64-poky-linux/libxml2/libxml2: PKGV changed from 2.11.5 [default] to 2.12.5 [default]
packages/core2-64-poky-linux/libxml2/libxml2: PV changed from "2.11.5" to "2.12.5"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.5
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.5

--===============4707482040271158863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxml2/libxml2-doc: FILELIST: added "/usr/share/doc/libxml2/python/examples/setup_test.py"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.ent /usr/lib/libxml2/ptest/result/errors/attr6.xml.str /usr/lib/libxml2/ptest/result/issue626.xml.sax2 /usr/lib/libxml2/ptest/result/issue643.xml.sax2 /usr/lib/libxml2/ptest/result/issue626.xml.sax /usr/lib/libxml2/ptest/result/issue643.xml.sax /usr/lib/libxml2/ptest/test/issue643.xml /usr/lib/libxml2/ptest/result/issue626.xml /usr/lib/libxml2/ptest/result/issue643.xml /usr/lib/libxml2/ptest/test/errors/quadratic-defattr.xml /usr/lib/libxml2/ptest/result/errors/extra-content.xml.str /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-1.xml /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-2.xml /usr/lib/libxml2/ptest/python/tests/setup_test.py /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html.sax /usr/lib/libxml2/ptest/result/noent/issue626.xml.sax2 /usr/lib/libxml2/ptest/result/errors/attr5.xml.ent /usr/lib/libxml2/ptest/result/noent/issue643.xml
 .sax2 /usr/lib/libxml2/ptest/test/errors/trailing-null-1.xml /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html /usr/lib/libxml2/ptest/test/HTML/xml-declaration-1.html /usr/lib/libxml2/ptest/result/valid/huge.xml /usr/lib/libxml2/ptest/result/issue626.xml.rdr /usr/lib/libxml2/ptest/result/issue643.xml.rdr /usr/lib/libxml2/ptest/result/issue643.xml.rde /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.str /usr/lib/libxml2/ptest/result/issue626.xml.rde /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.str /usr/lib/libxml2/ptest/result/errors/attr5.xml.err /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.ent /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.ent /usr/lib/libxml2/ptest/test/issue626.xml /usr/lib/libxml2/ptest/result/errors/empty.xml.err /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.err /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.str /usr/lib/libxml2/ptest/test/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/t
 est/valid/pe-latin1.xml /usr/lib/libxml2/ptest/result/noent/issue626.xml /usr/lib/libxml2/ptest/result/errors/empty.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.ent /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.ent /usr/lib/libxml2/ptest/result/errors/name3.xml.ent /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.ent /usr/lib/libxml2/ptest/test/errors/attr5.xml /usr/lib/libxml2/ptest/test/errors/attr6.xml /usr/lib/libxml2/ptest/test/errors/empty.xml /usr/lib/libxml2/ptest/test/errors/name3.xml /usr/lib/libxml2/ptest/test/errors/extra-content.xml /usr/lib/libxml2/ptest/test/errors/truncated-utf16.xml /usr/lib/libxml2/ptest/test/ns-ent.xml /usr/lib/libxml2/ptest/result/errors/attr5.xml.str /usr/lib/libxml2/ptest/result/ns-ent.xml.rdr /usr/lib/libxml2/ptest/result/errors/name3.xml.err /usr/lib/libxml2/ptest/test/valid/dtds/pe-latin1.ent /usr/lib/libxml2/ptest/result/ns-ent.xm
 l.rde /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.err /usr/lib/libxml2/ptest/result/errors/attr6.xml.ent /usr/lib/libxml2/ptest/result/noent/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/test/errors/trailing-null-2.xml /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.err /usr/lib/libxml2/ptest/result/ns-ent.xml.sax /usr/lib/libxml2/ptest/result/errors/extra-content.xml.ent /usr/lib/libxml2/ptest/result/noent/ns-ent.xml /usr/lib/libxml2/ptest/result/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.ent /usr/lib/libxml2/ptest/testparser /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.ent /usr/lib/libxml2/ptest/result/errors/attr6.xml.err /usr/lib/libxml2/ptest/test/valid/dtds/huge.ent /usr/lib/libxml2/ptest/test/errors/unclosed-element.xml /usr/lib/libxml2/ptest/result/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/result/noent/issue643.xml /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.dtd /usr/lib/libxml2/ptest/result/valid/pe-latin
 1.xml /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.err /usr/lib/libxml2/ptest/result/errors/extra-content.xml.err /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.err /usr/lib/libxml2/ptest/result/errors/empty.xml.ent /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.err /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.err /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.str /usr/lib/libxml2/ptest/result/errors/name3.xml.str /usr/lib/libxml2/ptest/test/valid/huge.xml /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.str /usr/lib/libxml2/ptest/result/ns-ent.xml /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.str"
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.5", added "/usr/lib/libxml2.so.2.12.5"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.5
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.5
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.5

--===============4707482040271158863==--

