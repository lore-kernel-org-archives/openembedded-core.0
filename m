Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6979C54ED5
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2092.1706810404757314788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FF0lAg8b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U2KtzoPE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3ebce-474194f3-5c92-4b49-8a76-fcfc687903be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S2Tk8TCjWnHBp3SZmrpAIvmgVHC7Z6/pZty4j95U0lY=;
	b=FF0lAg8bq7Dv+EB80L43Z6b8mTTzsilFsaxLx1NC2CCS0n9vTMFugqqs3FBeHDD7
	dN0aMXz7QZtIu/h0oU75G2su3swq/pEGqt++NeZAg9fEAHrUxpZMe+ZcncGEPf92fJ9
	dJWrilHHq0Oa6yXd7a/4m9WVWw8Z1jMjKQbStUlE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S2Tk8TCjWnHBp3SZmrpAIvmgVHC7Z6/pZty4j95U0lY=;
	b=U2KtzoPElNrkbkBKh1xI7aH0z5eWyiITwI8J0hmqCFbUWV72uXpydQFT4RQCflrR
	Jr99k6lhE5IF3th7i9ZO8m4a0IJKa/luo2qTafFn/YoEngL1CABXpHsZLno4U77v+i5
	pSy/KrD3aKetSOTrGMgRI0YdE+NVtWugUNvyvPfU=
Content-Type: multipart/mixed; boundary="===============5917431509272941958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.12.4 SUCCEEDED
Message-ID: <0101018d65d3ebce-474194f3-5c92-4b49-8a76-fcfc687903be-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194605

--===============5917431509272941958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.12.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.11.5-2.12.4.patch
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
From a22a1529f0c01f72a07ed832f741cc0f604ffa7c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 05:58:34 +0000
Subject: [PATCH] libxml2: upgrade 2.11.5 -> 2.12.4

---
 .../libxml/libxml2/install-tests.patch        |  8 +--
 .../{libxml2_2.11.5.bb => libxml2_2.12.4.bb}  | 50 +++++++++++++++++--
 2 files changed, 50 insertions(+), 8 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.12.4.bb} (69%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 14ccce5873..3d193e5092 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
+From c74e64df4c507bb57aad523c915e8ed59b806aaf Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.12.4.bb
similarity index 69%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.4.bb
index 44336c25e1..df29c42f07 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.4.bb
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
+SRC_URI[archive.sha256sum] = "497360e423cf0bd99eacdb7c6215dea92e6d6e89ee940393c2bae0e77cb9b7d0"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.42.0


--===============5917431509272941958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxml2/libxml2-doc: FILELIST: added "/usr/share/doc/libxml2/python/examples/setup_test.py"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.ent /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.ent /usr/lib/libxml2/ptest/test/issue626.xml /usr/lib/libxml2/ptest/result/issue626.xml /usr/lib/libxml2/ptest/result/issue643.xml /usr/lib/libxml2/ptest/result/errors/attr5.xml.err /usr/lib/libxml2/ptest/result/errors/extra-content.xml.ent /usr/lib/libxml2/ptest/result/errors/attr6.xml.ent /usr/lib/libxml2/ptest/test/issue643.xml /usr/lib/libxml2/ptest/test/errors/trailing-null-2.xml /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.str /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.str /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.err /usr/lib/libxml2/ptest/result/errors/name3.xml.err /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.err /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.err /usr/lib/libxml2/ptest/test/errors/quadratic-defattr.xml /u
 sr/lib/libxml2/ptest/result/errors/empty.xml.str /usr/lib/libxml2/ptest/test/errors/extra-content.xml /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html.sax /usr/lib/libxml2/ptest/result/noent/issue643.xml /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.dtd /usr/lib/libxml2/ptest/test/HTML/xml-declaration-1.html /usr/lib/libxml2/ptest/result/errors/attr6.xml.str /usr/lib/libxml2/ptest/result/errors/empty.xml.ent /usr/lib/libxml2/ptest/result/errors/extra-content.xml.str /usr/lib/libxml2/ptest/test/errors/unclosed-element.xml /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-1.xml /usr/lib/libxml2/ptest/result/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/test/errors/truncated-utf16.xml /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-2.xml /usr/lib/libxml2/ptest/test/valid/huge.xml /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.ent /usr/lib/libxml2/ptest/result/noent/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/testparser /usr/lib/libxml2/ptest/result/errors/unclos
 ed-element.xml.ent /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.ent /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.ent /usr/lib/libxml2/ptest/result/errors/attr6.xml.err /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.str /usr/lib/libxml2/ptest/result/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/test/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/result/errors/extra-content.xml.err /usr/lib/libxml2/ptest/result/errors/attr5.xml.ent /usr/lib/libxml2/ptest/test/valid/pe-latin1.xml /usr/lib/libxml2/ptest/result/ns-ent.xml.sax /usr/lib/libxml2/ptest/test/valid/dtds/pe-latin1.ent /usr/lib/libxml2/ptest/result/issue626.xml.rde /usr/lib/libxml2/ptest/result/issue643.xml.rde /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.str /usr/lib/libxml2/ptest/result/issue643.xml.rdr /usr/lib/libxml2/ptest/result/issue626.xml.rdr /usr/lib/libxml2/ptest/result/errors/name3.xml.ent /usr/lib/libxml2/ptest/result/ns-ent.xml.rdr /usr/lib/libxml2/ptest/result/noent
 /issue626.xml.sax2 /usr/lib/libxml2/ptest/result/noent/issue643.xml.sax2 /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.ent /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.err /usr/lib/libxml2/ptest/python/tests/setup_test.py /usr/lib/libxml2/ptest/result/noent/ns-ent.xml /usr/lib/libxml2/ptest/result/ns-ent.xml /usr/lib/libxml2/ptest/result/valid/huge.xml /usr/lib/libxml2/ptest/result/ns-ent.xml.rde /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.err /usr/lib/libxml2/ptest/result/noent/issue626.xml /usr/lib/libxml2/ptest/result/errors/attr5.xml.str /usr/lib/libxml2/ptest/test/errors/trailing-null-1.xml /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.str /usr/lib/libxml2/ptest/result/valid/pe-latin1.xml /usr/lib/libxml2/ptest/result/issue626.xml.sax /usr/lib/libxml2/ptest/result/issue643.xml.sax /usr/lib/libxml2/ptest/test/valid/dtds/huge.ent /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.ent /usr/lib/libxml2/ptest/test/errors/attr6.xml
  /usr/lib/libxml2/ptest/test/errors/name3.xml /usr/lib/libxml2/ptest/test/errors/attr5.xml /usr/lib/libxml2/ptest/test/errors/empty.xml /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.err /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.err /usr/lib/libxml2/ptest/result/issue626.xml.sax2 /usr/lib/libxml2/ptest/result/issue643.xml.sax2 /usr/lib/libxml2/ptest/result/errors/name3.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.str /usr/lib/libxml2/ptest/test/ns-ent.xml /usr/lib/libxml2/ptest/result/errors/empty.xml.err /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html"
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.5", added "/usr/lib/libxml2.so.2.12.4"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.4
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.4

--===============5917431509272941958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.11.5-2.12.4.patch"

RnJvbSBhMjJhMTUyOWYwYzAxZjcyYTA3ZWQ4MzJmNzQxY2MwZjYwNGZmYTdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNTo1ODozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xMS41IC0+IDIuMTIuNAoKLS0tCiAuLi4vbGlieG1sL2xpYnhtbDIv
aW5zdGFsbC10ZXN0cy5wYXRjaCAgICAgICAgfCAgOCArLS0KIC4uLi97bGlieG1sMl8yLjExLjUu
YmIgPT4gbGlieG1sMl8yLjEyLjQuYmJ9ICB8IDUwICsrKysrKysrKysrKysrKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwve2xpYnhtbDJfMi4xMS41LmJiID0+IGxpYnhtbDJfMi4xMi40
LmJifSAoNjklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwy
L2luc3RhbGwtdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9p
bnN0YWxsLXRlc3RzLnBhdGNoCmluZGV4IDE0Y2NjZTU4NzMuLjNkMTkzZTUwOTIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2ZjNzE2MzU3Y2UxMzcyZDk0MThkYzg2ZjI0MzE1YjM0
ZDk4MDhkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzc0ZTY0ZGY0YzUwN2JiNTdh
YWQ1MjNjOTE1ZThlZDU5YjgwNmFhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogTW9uLCA1IERlYyAyMDIyIDE3
OjAyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFkZCB5b2N0by1zcGVjaWZpYyBpbnN0YWxs
LXB0ZXN0IHRhcmdldApAQCAtMTMsMTEgKzEzLDExIEBAIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVy
dG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCA1YmM0
MDE4Li41N2QyN2FmIDEwMDY0NAoraW5kZXggMGE0OWQzNy4uMTA5N2M2MyAxMDA2NDQKIC0tLSBh
L01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQotQEAgLTI2LDYgKzI2LDE2IEBAIGNoZWNr
X1BST0dSQU1TID0gXAotIAl0ZXN0bGltaXRzIFwKK0BAIC0yNyw2ICsyNywxNiBAQCBjaGVja19Q
Uk9HUkFNUyA9IFwKKyAJdGVzdHBhcnNlciBcCiAgCXRlc3RyZWN1cnNlCiAgCiArcHRlc3RkaXI9
JChsaWJleGVjZGlyKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnht
bDJfMi4xMS41LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xMi40LmJi
CnNpbWlsYXJpdHkgaW5kZXggNjklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnht
bC9saWJ4bWwyXzIuMTEuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDJfMi4xMi40LmJiCmluZGV4IDQ0MzM2YzI1ZTEuLmRmMjljNDJmMDcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTEuNS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjEyLjQuYmIKQEAgLTEsMTMgKzEsNTUgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBDb3B5cmlnaHQKKyMgKysrIENvcHlyaWdodAorIyBAQCAtMSw0
ICsxLDQgQEAKKyMgLUV4Y2VwdCB3aGVyZSBvdGhlcndpc2Ugbm90ZWQgaW4gdGhlIHNvdXJjZSBj
b2RlIChlLmcuIHRoZSBmaWxlcyBoYXNoLmMsCisjICtFeGNlcHQgd2hlcmUgb3RoZXJ3aXNlIG5v
dGVkIGluIHRoZSBzb3VyY2UgY29kZSAoZS5nLiB0aGUgZmlsZXMgZGljdC5jLAorIyAgbGlzdC5j
IGFuZCB0aGUgdHJpbyBmaWxlcywgd2hpY2ggYXJlIGNvdmVyZWQgYnkgYSBzaW1pbGFyIGxpY2Vu
Y2UgYnV0CisjICB3aXRoIGRpZmZlcmVudCBDb3B5cmlnaHQgbm90aWNlcykgYWxsIHRoZSBmaWxl
cyBhcmU6CisjICAKKyMgLS0tIGhhc2guYworIyArKysgaGFzaC5jCisjIEBAIC0xLDEwICsxLDEw
IEBACisjIC0gKiBDb3B5cmlnaHQgKEMpIDIwMDAsMjAxMiBCam9ybiBSZWVzZSBhbmQgRGFuaWVs
IFZlaWxsYXJkLgorIyAgICoKKyMgLSAqIFBlcm1pc3Npb24gdG8gdXNlLCBjb3B5LCBtb2RpZnks
IGFuZCBkaXN0cmlidXRlIHRoaXMgc29mdHdhcmUgZm9yIGFueQorIyAtICogcHVycG9zZSB3aXRo
IG9yIHdpdGhvdXQgZmVlIGlzIGhlcmVieSBncmFudGVkLCBwcm92aWRlZCB0aGF0IHRoZSBhYm92
ZQorIyAtICogY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBhcHBl
YXIgaW4gYWxsIGNvcGllcy4KKyMgLSAqCisjIC0gKiBUSElTIFNPRlRXQVJFIElTIFBST1ZJREVE
IGBgQVMgSVMnJyBBTkQgV0lUSE9VVCBBTlkgRVhQUkVTUyBPUiBJTVBMSUVECisjIC0gKiBXQVJS
QU5USUVTLCBJTkNMVURJTkcsIFdJVEhPVVQgTElNSVRBVElPTiwgVEhFIElNUExJRUQgV0FSUkFO
VElFUyBPRgorIyAtICogTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRS4gVEhFIEFVVEhPUlMgQU5ECisjIC0gKiBDT05UUklCVVRPUlMgQUNDRVBUIE5P
IFJFU1BPTlNJQklMSVRZIElOIEFOWSBDT05DRUlWQUJMRSBNQU5ORVIuCisjICsgKiBTZWUgQ29w
eXJpZ2h0IGZvciB0aGUgc3RhdHVzIG9mIHRoaXMgc29mdHdhcmUuCisjICsgKi8KKyMgKworIyAr
I2RlZmluZSBJTl9MSUJYTUwKKyMgKyNpbmNsdWRlICJsaWJ4bWwuaCIKKyMgKworIyArI2luY2x1
ZGUgPHN0cmluZy5oPgorIyArI2luY2x1ZGUgPGxpbWl0cy5oPgorIyArCisjIAorIworCiBTVU1N
QVJZID0gIlhNTCBDIFBhcnNlciBMaWJyYXJ5IGFuZCBUb29sa2l0IgogREVTQ1JJUFRJT04gPSAi
VGhlIFhNTCBQYXJzZXIgTGlicmFyeSBhbGxvd3MgZm9yIG1hbmlwdWxhdGlvbiBvZiBYTUwgZmls
ZXMuICBMaWJ4bWwyIGV4cG9ydHMgUHVzaCBhbmQgUHVsbCB0eXBlIHBhcnNlciBpbnRlcmZhY2Vz
IGZvciBib3RoIFhNTCBhbmQgSFRNTC4gIEl0IGNhbiBkbyBEVEQgdmFsaWRhdGlvbiBhdCBwYXJz
ZSB0aW1lLCBvbiBhIHBhcnNlZCBkb2N1bWVudCBpbnN0YW5jZSBvciB3aXRoIGFuIGFyYml0cmFy
eSBEVEQuICBMaWJ4bWwyIGluY2x1ZGVzIGNvbXBsZXRlIFhQYXRoLCBYUG9pbnRlciBhbmQgWGlu
Y2x1ZGUgaW1wbGVtZW50YXRpb25zLiAgSXQgYWxzbyBoYXMgYSBTQVggbGlrZSBpbnRlcmZhY2Us
IHdoaWNoIGlzIGRlc2lnbmVkIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBFeHBhdC4iCiBIT01FUEFH
RSA9ICJodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbGlieG1sMiIKIEJVR1RSQUNLRVIg
PSAiaHR0cDovL2J1Z3ppbGxhLmdub21lLm9yZy9idWdsaXN0LmNnaT9wcm9kdWN0PWxpYnhtbDIi
CiBTRUNUSU9OID0gImxpYnMiCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NvcHlyaWdodDttZDU9MjA0NDQxN2UyZTUwMDZiNjVhOGI5MDY3YjY4M2ZjZjEgXAot
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vaGFzaC5jO2JlZ2lubGluZT02O2VuZGxpbmU9MTU7
bWQ1PWU3N2Y3N2IxMmNiNjllMjAzZDhiNDA5MGEwZWVlODc5IFwKK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NvcHlyaWdodDttZDU9ZmVjN2VjZmU3MTQ3MjJiMmJiMGFhZmY3ZDIwMGM3MDEg
XAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vaGFzaC5jO2JlZ2lubGluZT02O2VuZGxpbmU9
MTU7bWQ1PTlhZjkzNDlkMGVhZDI0NTY5ZGMzMzJmMjExNmVmNWY4IFwKICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL2xpc3QuYztiZWdpbmxpbmU9NDtlbmRsaW5lPTEzO21kNT1iOWMyNWIwMjFj
Y2FmMjg3ZTUwMDYwNjAyZDIwZjNhNyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly90cmlv
LmM7YmVnaW5saW5lPTU7ZW5kbGluZT0xNDttZDU9Y2Q0ZjYxZTI3Zjg4YzFkNDNkZjExMjk2NmIx
Y2QyOGYiCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly90cmlvLmM7YmVnaW5saW5lPTU7ZW5k
bGluZT0xNDttZDU9Y2Q0ZjYxZTI3Zjg4YzFkNDNkZjExMjk2NmIxY2QyOGYgXAorICAgICAgICAg
ICAgICAgICAgICAiCiAKIERFUEVORFMgPSAiemxpYiB2aXJ0dWFsL2xpYmljb252IgogCkBAIC0x
OSw3ICs2MSw3IEBAIFNSQ19VUkkgKz0gImh0dHA6Ly93d3cudzMub3JnL1hNTC9UZXN0L3htbHRz
MjAxMzA5MjMudGFyO3N1YmRpcj0ke0JQfTtuYW1lPXRlc3R0CiAgICAgICAgICAgIGZpbGU6Ly9p
bnN0YWxsLXRlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICIzNzI3YjA3OGMzNjBlYzY5ZmE4NjlkZTE0YmQ2Zjc1ZDdlZThkMzY5ODdiMDcx
ZTY5MjhkNDcyMGEyOGRmM2E2IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNDk3MzYw
ZTQyM2NmMGJkOTllYWNkYjdjNjIxNWRlYTkyZTZkNmU4OWVlOTQwMzkzYzJiYWUwZTc3Y2I5Yjdk
MCIKIFNSQ19VUklbdGVzdHRhci5zaGEyNTZzdW1dID0gImM2YjJkNDJlZTUwYjhiMjM2ZTcxMWE5
N2Q2OGU2YzRiNWM4ZDgzZTY5YTJiZTQ3MjIzNzlmMDg3MDJlYTcyNzMiCiAKICMgRGlzcHV0ZWQg
YXMgYSBzZWN1cml0eSBpc3N1ZSwgYnV0IGZpeGVkIGluIGQzOWY3ODAKLS0gCjIuNDIuMAoK

--===============5917431509272941958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 92 recipes from the core2-64 sysroot...done.
Removing 100 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-704ba8e8fdd25a4c407f2cf700bc67d4677683ff"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:704ba8e8fdd25a4c407f2cf700bc67d4677683ff"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 477 Local 428 Mirrors 0 Missed 49 Current 194 (89% match, 92% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 209 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 210 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 211 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 213 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 214 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 219 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 220 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 221 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 228 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 231 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 235 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 236 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 237 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 239 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 240 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 241 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 245 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 256 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 257 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 265 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 268 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 271 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 272 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 276 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 280 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 283 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 288 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 295 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 298 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 299 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 303 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 320 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 329 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 333 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 349 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 358 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 359 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 360 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 363 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 367 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 369 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 370 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 371 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk_setscene)
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 379 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 389 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 391 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 393 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 394 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 398 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 399 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 400 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_setscene: Started
NOTE: Running setscene task 402 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 406 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 476 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 482 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 489 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 342 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 346 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: Running task 347 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_recipe_qa)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 362 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 371 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.12.4-r0: task do_recipe_qa: Started
NOTE: Running task 374 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Started
NOTE: Running setscene task 499 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 500 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 512 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: Running setscene task 513 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: Running setscene task 514 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 515 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 516 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 381 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 382 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 389 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 533 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Started
NOTE: recipe shadow-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.12.4-r0: task do_fetch: Started
NOTE: Running setscene task 534 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 394 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe libxml2-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 402 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 410 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 455 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_setscene: Succeeded
NOTE: Running task 475 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 545 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 477 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 478 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe shadow-4.14.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 482 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_unpack)
NOTE: Running task 909 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: Running task 913 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_patch)
NOTE: Running task 918 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_unpack)
NOTE: Running task 924 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: Running task 929 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_unpack)
NOTE: Running task 932 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 952 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 960 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1038 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: recipe shadow-4.14.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: Running task 1075 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe libxml2-2.12.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Started
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: recipe shadow-4.14.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1077 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 1083 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1086 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 1093 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_patch)
NOTE: recipe coreutils-9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1094 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_patch)
NOTE: recipe libxml2-2.12.4-r0: task do_patch: Started
NOTE: recipe coreutils-9.4-r0: task do_patch: Started
NOTE: recipe libxml2-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1096 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_populate_lic)
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 1097 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1098 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe coreutils-9.4-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.12.4-r0: task do_populate_lic: Started
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libxml2-2.12.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_populate_lic unihash changed to 9853df9cc456c751ab6d30cfd66e8861a33958cf3c42cfd7970b4814c0bf1b58
NOTE: recipe libxml2-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 556 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 567 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/openssl/3.2.0/temp/log.do_packagedata_setscene.1070246
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_package_setscene)
NOTE: Running setscene task 592 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_package_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 594 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 610 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1173 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 30073ab42c1a1c17236616e0670cd8b089881e37675c1384f4a2309afcd092ab to hashserv.yocto.io:8686 ({'taskhash': '4f4389bfc22e89486bb2f5b7e0d703c94cd50c71dc62efcbc75fe99bcee26d92', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '30073ab42c1a1c17236616e0670cd8b089881e37675c1384f4a2309afcd092ab'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4f4389bfc22e89486bb2f5b7e0d703c94cd50c71dc62efcbc75fe99bcee26d92 -> 30073ab42c1a1c17236616e0670cd8b089881e37675c1384f4a2309afcd092ab as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_patch: Started
NOTE: recipe binutils-2.41-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 625 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 626 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 666 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1329 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1555 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata)
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1738 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1746 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: recipe libxml2-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1747 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_configure)
NOTE: recipe libxml2-2.12.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.12.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.12.4-r0: task do_configure: Started
NOTE: recipe libxml2-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 1748 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1749 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_compile)
NOTE: recipe libxml2-2.12.4-r0: task do_compile: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1750 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1751 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe libxml2-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1753 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_install)
NOTE: recipe libxml2-2.12.4-r0: task do_install: Started
NOTE: recipe libxml2-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 1754 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1756 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1757 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1758 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1759 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot unihash changed to 68e11717912cc9905e59b60e4a3653c265d92fd84b06fd14e0d4d8f009a21d32
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot as unihash 179537396252b4f4869f69638114d1e843a593648730e38e3df28bde0dfe8f09 to hashserv.yocto.io:8686 ({'taskhash': '59bafaa0b35d518f10380f9e0af1703a1fd7e7c5921d953c1e8ce965d6b1d883', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '59bafaa0b35d518f10380f9e0af1703a1fd7e7c5921d953c1e8ce965d6b1d883'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot unihash 59bafaa0b35d518f10380f9e0af1703a1fd7e7c5921d953c1e8ce965d6b1d883 unchanged by server
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx as unihash 8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c to hashserv.yocto.io:8686 ({'taskhash': 'ac6c033a8cee43476073c6b56ac4bbdcf2684b0b481b6f56bd32012f475e9ddb', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx unihash changed ac6c033a8cee43476073c6b56ac4bbdcf2684b0b481b6f56bd32012f475e9ddb -> 8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot became valid
NOTE: Running setscene task 671 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running task 1760 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1761 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.39.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1763 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.14.2-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_configure)
NOTE: recipe util-linux-2.39.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1765 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_configure: Started
NOTE: Running task 1766 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_compile)
NOTE: recipe libcap-2.69-r0: task do_compile: Started
NOTE: recipe libcap-2.69-r0: task do_compile: Succeeded
NOTE: Running task 1767 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_install)
NOTE: recipe libcap-2.69-r0: task do_install: Started
NOTE: recipe libcap-2.69-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1770 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1771 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_package)
NOTE: Running task 1772 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1773 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.12.4-r0: task do_package: Started
NOTE: Running task 1774 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_configure)
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure: Started
NOTE: recipe coreutils-9.4-r0: task do_configure: Started
NOTE: recipe libxml2-2.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package unihash changed to 292d1b1ab6b5d005525dcda15d940ce09bf96409a5d255477daeda0f65f522af
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx as unihash c4b4f0ced2c8154d55d2dcf0bc2256e2990ff25f435a9760b71a943952c397cd to hashserv.yocto.io:8686 ({'taskhash': '9af436cb712496e277105d750b8ca4fdb7c5a4cbafd8d40c25f29c8b3b2c3e93', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'c4b4f0ced2c8154d55d2dcf0bc2256e2990ff25f435a9760b71a943952c397cd'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx unihash changed 9af436cb712496e277105d750b8ca4fdb7c5a4cbafd8d40c25f29c8b3b2c3e93 -> c4b4f0ced2c8154d55d2dcf0bc2256e2990ff25f435a9760b71a943952c397cd as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx as unihash 8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c to hashserv.yocto.io:8686 ({'taskhash': '4123ec21a6db584fadd91f8e2209944d2d5d11a85902fc6244148092d48f984a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx unihash changed 4123ec21a6db584fadd91f8e2209944d2d5d11a85902fc6244148092d48f984a -> 8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata became valid
NOTE: Running setscene task 668 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1776 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package)
NOTE: recipe libcap-2.69-r0: task do_package: Started
NOTE: recipe libcap-2.69-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package unihash changed to 8a1aa304a2f361a00c812d3e274ae3db0bafbd1fb5f1de463b764ba7c348a7f7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: Running setscene task 668 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.14.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1780 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_compile)
NOTE: recipe shadow-4.14.2-r0: task do_compile: Started
NOTE: recipe shadow-4.14.2-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_install)
NOTE: recipe shadow-4.14.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1782 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1783 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_compile)
NOTE: recipe shadow-4.14.2-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Started
NOTE: recipe shadow-4.14.2-r0: task do_package: Started
NOTE: recipe shadow-4.14.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_package unihash changed to 7703554dc28f5e6d8ea85e77e9c06856bfe80ef2da93a4838f0cea4098c113d4
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx as unihash 8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c to hashserv.yocto.io:8686 ({'taskhash': 'a95baa3f0b02f64bfa91f6d7ad2647869a018feb2a2be222ca66e9b8b582b66f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx unihash changed a95baa3f0b02f64bfa91f6d7ad2647869a018feb2a2be222ca66e9b8b582b66f -> 8aab689d890407a2468155aecedb6af4af5dcb7a774f7842a1547eedb979c18c as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata became valid
NOTE: Running setscene task 671 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.39.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1799 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.39.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1800 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_compile)
NOTE: recipe libxml2-2.12.4-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_compile: Started
NOTE: Running task 1801 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_packagedata)
NOTE: recipe libxml2-2.12.4-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1802 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_create_spdx)
NOTE: Running task 1803 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_package_write_ipk)
NOTE: Running task 1804 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_package_write_deb)
NOTE: Running task 1805 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_package_write_rpm)
NOTE: Running task 1806 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_package_qa)
NOTE: recipe libxml2-2.12.4-r0: task do_package_write_ipk: Started
NOTE: recipe libxml2-2.12.4-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.12.4-r0: task do_package_write_deb: Started
NOTE: recipe libxml2-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.12.4-r0: task do_package_qa: Started
NOTE: recipe libxml2-2.12.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1807 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_create_runtime_spdx)
NOTE: recipe libxml2-2.12.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libxml2-2.12.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1808 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1809 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_install)
NOTE: recipe libgcrypt-1.10.3-r0: task do_install: Started
NOTE: recipe libxml2-2.12.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_install: Succeeded
NOTE: Running task 1810 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.3-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1811 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot)
NOTE: Running task 1812 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1813 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe util-linux-2.39.3-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.12.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_package: Succeeded
NOTE: Running task 1816 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata)
NOTE: recipe util-linux-2.39.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1817 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_install)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.39.3-r0: task do_install: Started
NOTE: recipe libxml2-2.12.4-r0: task do_package_qa: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata unihash changed to 8aaffe4d35c580614ae86e27eed6a7ef2302be92736d1bac4fc74dde1af8cbe4
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.39.3-r0: task do_install: Succeeded
NOTE: Running task 1818 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.39.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1819 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package)
NOTE: recipe util-linux-2.39.3-r0: task do_package: Started
NOTE: recipe libxml2-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1820 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1821 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_compile)
NOTE: recipe coreutils-9.4-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1822 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1824 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot)
NOTE: Running task 1825 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1826 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.39.3-r0: task do_package: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package unihash changed to 4ef3ff04b2265a5ea7e7e4a908bb65725ac5d3b944a5b1b066c9c2669feffedb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata became valid
NOTE: Running setscene task 671 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1827 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_configure: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Running task 1829 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata unihash changed to 8ffa5ce4add838eb0ed194fcdb860d2f10b6fb84ba248b1659e8513bef568f4e
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.4-r0: task do_compile: Succeeded
NOTE: Running task 1830 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1831 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_install)
NOTE: recipe coreutils-9.4-r0: task do_install: Started
NOTE: recipe coreutils-9.4-r0: task do_install: Succeeded
NOTE: Running task 1832 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1833 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1834 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_compile: Started
NOTE: recipe coreutils-9.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1835 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package)
NOTE: recipe coreutils-9.4-r0: task do_package: Started
NOTE: recipe coreutils-9.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package unihash changed to 76b7fa4fd9c1bf732307371646532a0f760eb9e5a331911f594c29aa0d185c06
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk became valid
NOTE: Running setscene task 668 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 669 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 671 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1839 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.189-r0: task do_compile: Succeeded
NOTE: Running task 1840 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm unihash changed to 62630c2531669570b84325080c73ab4ffb5d09650b9938e68767e9d3739755a3
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1841 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_install: Succeeded
NOTE: Running task 1842 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1843 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot)
NOTE: Running task 1844 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1845 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1846 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_configure: Succeeded
NOTE: Running task 1847 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Succeeded
NOTE: Running task 1848 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata unihash changed to c501369f3bda3d5da163e603443192b74269c929bf3fe66297ca6b5b0be88762
NOTE: Setscene tasks completed
NOTE: recipe binutils-2.41-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1849 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_install)
NOTE: recipe binutils-2.41-r0: task do_install: Started
NOTE: recipe binutils-2.41-r0: task do_install: Succeeded
NOTE: Running task 1850 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package)
NOTE: recipe binutils-2.41-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_package: Succeeded
NOTE: Running task 1851 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata)
NOTE: recipe binutils-2.41-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata unihash changed to 646aef3910fee8d538d94ad894e812ac7a25fd3b40b3be9974ee029f62519276
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm became valid
NOTE: Running setscene task 669 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 670 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 671 of 671 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 1855 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1855 tasks of which 1725 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.2.1-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: openssl-3.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5917431509272941958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxml2: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.11/libxml2-2.11.5.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.11.5;name=testtar file://run-ptest file://install-tests.patch" to "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.4.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.4;name=testtar file://run-ptest file://install-tests.patch"
packages/core2-64-poky-linux/libxml2: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 7445400 to 7513352 (+1%)
packages/core2-64-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.2.11.5", added "/usr/lib/.debug/libxml2.so.2.12.4 /usr/lib/libxml2/ptest/.debug/testparser"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGSIZE changed from 417112 to 415410 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dev: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGSIZE changed from 3132415 to 3119076 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2-doc: FILELIST: added "/usr/share/doc/libxml2/python/examples/setup_test.py"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-locale: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGSIZE changed from 16156913 to 16278948 (+1%)
packages/core2-64-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/test/errors/truncated-utf16.xml /usr/lib/libxml2/ptest/test/errors/quadratic-defattr.xml /usr/lib/libxml2/ptest/result/errors/extra-content.xml.err /usr/lib/libxml2/ptest/test/errors/trailing-null-1.xml /usr/lib/libxml2/ptest/result/errors/name3.xml.err /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.err /usr/lib/libxml2/ptest/result/errors/empty.xml.str /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.str /usr/lib/libxml2/ptest/test/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/test/valid/huge.xml /usr/lib/libxml2/ptest/result/issue626.xml.sax2 /usr/lib/libxml2/ptest/result/issue643.xml.sax2 /usr/lib/libxml2/ptest/test/errors/attr6.xml /usr/lib/libxml2/ptest/test/errors/attr5.xml /usr/lib/libxml2/ptest/test/errors/empty.xml /usr/lib/libxml2/ptest/test/errors/name3.xml /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html.sax /usr/lib/libxml2/ptest/result/noent/issue626.x
 ml /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.dtd /usr/lib/libxml2/ptest/result/ns-ent.xml /usr/lib/libxml2/ptest/result/errors/attr6.xml.str /usr/lib/libxml2/ptest/test/issue643.xml /usr/lib/libxml2/ptest/result/errors/empty.xml.ent /usr/lib/libxml2/ptest/test/valid/dtds/pe-latin1.ent /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.ent /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.str /usr/lib/libxml2/ptest/result/issue626.xml.rde /usr/lib/libxml2/ptest/result/issue643.xml.rde /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.str /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.str /usr/lib/libxml2/ptest/test/valid/pe-latin1.xml /usr/lib/libxml2/ptest/result/issue626.xml.rdr /usr/lib/libxml2/ptest/result/issue643.xml.rdr /usr/lib/libxml2/ptest/result/errors/attr5.xml.ent /usr/lib/libxml2/ptest/result/ns-ent.xml.rdr /usr/lib/libxml2/ptest/testparser /usr/lib/libxml2/ptest/result/errors/truncated-utf16.xml.ent /usr/lib/libxml2/pt
 est/result/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/result/errors/extra-content.xml.ent /usr/lib/libxml2/ptest/result/errors/name3.xml.ent /usr/lib/libxml2/ptest/result/ns-ent.xml.rde /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.ent /usr/lib/libxml2/ptest/test/issue626.xml /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.str /usr/lib/libxml2/ptest/result/issue626.xml.sax /usr/lib/libxml2/ptest/result/issue643.xml.sax /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.err /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.err /usr/lib/libxml2/ptest/result/errors/attr6.xml.err /usr/lib/libxml2/ptest/result/noent/ns-ent.xml.sax2 /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-1.xml /usr/lib/libxml2/ptest/test/errors/invalid-start-tag-2.xml /usr/lib/libxml2/ptest/result/issue626.xml /usr/lib/libxml2/ptest/result/issue643.xml /usr/lib/libxml2/ptest/test/errors/extra-content.xml /usr/lib/libxml2/ptest/test/valid/dtds/pe-val-latin1.ent /usr/lib/libxml
 2/ptest/test/valid/dtds/huge.ent /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.ent /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.ent /usr/lib/libxml2/ptest/result/errors/attr5.xml.str /usr/lib/libxml2/ptest/result/noent/issue643.xml /usr/lib/libxml2/ptest/test/errors/unclosed-element.xml /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-1.xml.err /usr/lib/libxml2/ptest/result/errors/invalid-start-tag-2.xml.err /usr/lib/libxml2/ptest/result/errors/extra-content.xml.str /usr/lib/libxml2/ptest/result/errors/name3.xml.str /usr/lib/libxml2/ptest/result/noent/ns-ent.xml /usr/lib/libxml2/ptest/result/errors/unclosed-element.xml.err /usr/lib/libxml2/ptest/result/errors/empty.xml.err /usr/lib/libxml2/ptest/result/HTML/xml-declaration-1.html /usr/lib/libxml2/ptest/python/tests/setup_test.py /usr/lib/libxml2/ptest/test/errors/trailing-null-2.xml /usr/lib/libxml2/ptest/result/ns-ent.xml.sax /usr/lib/libxml2/ptest/result/errors/attr6.xml.ent /usr/lib/libxml2/pt
 est/result/valid/pe-latin1.xml /usr/lib/libxml2/ptest/result/noent/issue626.xml.sax2 /usr/lib/libxml2/ptest/result/noent/issue643.xml.sax2 /usr/lib/libxml2/ptest/result/errors/quadratic-defattr.xml.err /usr/lib/libxml2/ptest/result/valid/pe-val-latin1.xml /usr/lib/libxml2/ptest/test/HTML/xml-declaration-1.html /usr/lib/libxml2/ptest/result/valid/huge.xml /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.str /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.str /usr/lib/libxml2/ptest/result/errors/trailing-null-1.xml.ent /usr/lib/libxml2/ptest/result/errors/trailing-null-2.xml.ent /usr/lib/libxml2/ptest/test/ns-ent.xml /usr/lib/libxml2/ptest/result/errors/attr5.xml.err"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGSIZE changed from 1726474 to 1725364 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-python: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 7846177 to 7763012 (-1%)
packages/core2-64-poky-linux/libxml2/libxml2-src: FILELIST: directory renamed /usr/src/debug/libxml2/2.11.5/include/private -> /usr/src/debug/libxml2/2.12.4/include/private, directory renamed /usr/src/debug/libxml2/2.11.5/include/libxml -> /usr/src/debug/libxml2/2.12.4/include/libxml, directory renamed /usr/src/debug/libxml2/2.11.5/python -> /usr/src/debug/libxml2/2.12.4/python, removed "/usr/src/debug/libxml2/2.11.5/threads.c /usr/src/debug/libxml2/2.11.5/tree.c /usr/src/debug/libxml2/2.11.5/xlink.c /usr/src/debug/libxml2/2.11.5/testModule.c /usr/src/debug/libxml2/2.11.5/testlimits.c /usr/src/debug/libxml2/2.11.5/xmlschemastypes.c /usr/src/debug/libxml2/2.11.5/xmlcatalog.c /usr/src/debug/libxml2/2.11.5/xmlschemas.c /usr/src/debug/libxml2/2.11.5/xmlunicode.c /usr/src/debug/libxml2/2.11.5/xmlreader.c /usr/src/debug/libxml2/2.11.5/testrecurse.c /usr/src/debug/libxml2/2.11.5/SAX2.c /usr/src/debug/libxml2/2.11.5/chvalid.c /usr/src/debug/libxml2/2.11.5/testapi.c /usr/src/debug/libxml2/2.1
 1.5/parserInternals.c /usr/src/debug/libxml2/2.11.5/xmlIO.c /usr/src/debug/libxml2/2.11.5/xpointer.c /usr/src/debug/libxml2/2.11.5/hash.c /usr/src/debug/libxml2/2.11.5/xmllint.c /usr/src/debug/libxml2/2.11.5/HTMLparser.c /usr/src/debug/libxml2/2.11.5/entities.c /usr/src/debug/libxml2/2.11.5/xpath.c /usr/src/debug/libxml2/2.11.5/c14n.c /usr/src/debug/libxml2/2.11.5/testchar.c /usr/src/debug/libxml2/2.11.5/runxmlconf.c /usr/src/debug/libxml2/2.11.5/dict.c /usr/src/debug/libxml2/2.11.5/xmlsave.c /usr/src/debug/libxml2/2.11.5/xmlmodule.c /usr/src/debug/libxml2/2.11.5/xmlmemory.c /usr/src/debug/libxml2/2.11.5/testdict.c /usr/src/debug/libxml2/2.11.5/pattern.c /usr/src/debug/libxml2/2.11.5/timsort.h /usr/src/debug/libxml2/2.11.5/valid.c /usr/src/debug/libxml2/2.11.5/catalog.c /usr/src/debug/libxml2/2.11.5/nanohttp.c /usr/src/debug/libxml2/2.11.5/xmlwriter.c /usr/src/debug/libxml2/2.11.5/parser.c /usr/src/debug/libxml2/2.11.5/xinclude.c /usr/src/debug/libxml2/2.11.5/relaxng.c /usr/src/debu
 g/libxml2/2.11.5/HTMLtree.c /usr/src/debug/libxml2/2.11.5/testThreads.c /usr/src/debug/libxml2/2.11.5/error.c /usr/src/debug/libxml2/2.11.5/encoding.c /usr/src/debug/libxml2/2.11.5/buf.c /usr/src/debug/libxml2/2.11.5/runsuite.c /usr/src/debug/libxml2/2.11.5/list.c /usr/src/debug/libxml2/2.11.5/xmlregexp.c /usr/src/debug/libxml2/2.11.5/uri.c /usr/src/debug/libxml2/2.11.5/runtest.c /usr/src/debug/libxml2/2.11.5/globals.c /usr/src/debug/libxml2/2.11.5/xmlstring.c /usr/src/debug/libxml2/2.11.5/schematron.c", added "/usr/src/debug/libxml2/2.12.4/threads.c /usr/src/debug/libxml2/2.12.4/tree.c /usr/src/debug/libxml2/2.12.4/xlink.c /usr/src/debug/libxml2/2.12.4/testModule.c /usr/src/debug/libxml2/2.12.4/testlimits.c /usr/src/debug/libxml2/2.12.4/testparser.c /usr/src/debug/libxml2/2.12.4/xmlschemastypes.c /usr/src/debug/libxml2/2.12.4/xmlcatalog.c /usr/src/debug/libxml2/2.12.4/xmlschemas.c /usr/src/debug/libxml2/2.12.4/xmlunicode.c /usr/src/debug/libxml2/2.12.4/xmlreader.c /usr/src/debug/li
 bxml2/2.12.4/testrecurse.c /usr/src/debug/libxml2/2.12.4/SAX2.c /usr/src/debug/libxml2/2.12.4/chvalid.c /usr/src/debug/libxml2/2.12.4/testapi.c /usr/src/debug/libxml2/2.12.4/parserInternals.c /usr/src/debug/libxml2/2.12.4/xmlIO.c /usr/src/debug/libxml2/2.12.4/xpointer.c /usr/src/debug/libxml2/2.12.4/hash.c /usr/src/debug/libxml2/2.12.4/xmllint.c /usr/src/debug/libxml2/2.12.4/HTMLparser.c /usr/src/debug/libxml2/2.12.4/entities.c /usr/src/debug/libxml2/2.12.4/xpath.c /usr/src/debug/libxml2/2.12.4/c14n.c /usr/src/debug/libxml2/2.12.4/testchar.c /usr/src/debug/libxml2/2.12.4/runxmlconf.c /usr/src/debug/libxml2/2.12.4/dict.c /usr/src/debug/libxml2/2.12.4/xmlsave.c /usr/src/debug/libxml2/2.12.4/xmlmodule.c /usr/src/debug/libxml2/2.12.4/xmlmemory.c /usr/src/debug/libxml2/2.12.4/testdict.c /usr/src/debug/libxml2/2.12.4/pattern.c /usr/src/debug/libxml2/2.12.4/timsort.h /usr/src/debug/libxml2/2.12.4/valid.c /usr/src/debug/libxml2/2.12.4/catalog.c /usr/src/debug/libxml2/2.12.4/nanohttp.c /usr/
 src/debug/libxml2/2.12.4/xmlwriter.c /usr/src/debug/libxml2/2.12.4/parser.c /usr/src/debug/libxml2/2.12.4/xinclude.c /usr/src/debug/libxml2/2.12.4/relaxng.c /usr/src/debug/libxml2/2.12.4/HTMLtree.c /usr/src/debug/libxml2/2.12.4/testThreads.c /usr/src/debug/libxml2/2.12.4/error.c /usr/src/debug/libxml2/2.12.4/encoding.c /usr/src/debug/libxml2/2.12.4/buf.c /usr/src/debug/libxml2/2.12.4/runsuite.c /usr/src/debug/libxml2/2.12.4/list.c /usr/src/debug/libxml2/2.12.4/xmlregexp.c /usr/src/debug/libxml2/2.12.4/uri.c /usr/src/debug/libxml2/2.12.4/runtest.c /usr/src/debug/libxml2/2.12.4/globals.c /usr/src/debug/libxml2/2.12.4/xmlstring.c /usr/src/debug/libxml2/2.12.4/schematron.c"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGSIZE changed from 91040 to 95208 (+5%)
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-utils: PV changed from "2.11.5" to "2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2: PKGSIZE changed from 1383977 to 1379977 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.5", added "/usr/lib/libxml2.so.2.12.4"
packages/core2-64-poky-linux/libxml2/libxml2: PKGV changed from 2.11.5 [default] to 2.12.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2: PV changed from "2.11.5" to "2.12.4"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.4
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.5 to libxml2.so.2.12.4
  /usr/lib/libxml2.so.2.11.5 moved to /usr/lib/libxml2.so.2.12.4

--===============5917431509272941958==--

