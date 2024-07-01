Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27340C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2190.1719853076849471928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WjEh7/g9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CiygE8pl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101906f3b4e9c-849a7c1d-51c2-4fe1-b1f9-7d888d81e9cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iPYbRUFUe9zwRBgERtQpabTA/XWtw7Xf5FT35JNpvIY=;
	b=WjEh7/g9IywnvuZD49uskCxrwFnrmgLkeYExuVO+jk3eNAWOCljf5eXFl8xStHNi
	s9dNsZ4IxRRsntnGi4skgCWbOsJa5Z9KT0J5JKplDa2RhX4NDAngV7SA9gkYhY1Psw6
	Y/wMjkllyPJZX9/KG13EFXR+rrIlslwTUGJJC9fw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iPYbRUFUe9zwRBgERtQpabTA/XWtw7Xf5FT35JNpvIY=;
	b=CiygE8plNuQ3n54Gl5xiTgNAcN4elztuH6wF4lLNMWqo9u1p5bvjn0fs7P/pMBr3
	kjbhgJcUN01Osx/wry4TkSaUP+Oj8j6D1R5a9QV0LKbLXo44XRcV2u6APWwUh3DPigR
	NxOY5C1J64t8kaYLEaqiIH7WU5+XstBogRJGF3io=
Content-Type: multipart/mixed; boundary="===============0401523182644712039=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 661 SUCCEEDED
Message-ID: <010101906f3b4e9c-849a7c1d-51c2-4fe1-b1f9-7d888d81e9cf-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201367

--===============0401523182644712039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *661* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-643-661.patch
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
From 4499bf7502787fccf1b827a28580bf55e72bc352 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 10:45:26 +0000
Subject: [PATCH] less: upgrade 643 -> 661

---
 .../less/{less_643.bb => less_661.bb}         | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_643.bb => less_661.bb} (66%)

diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_661.bb
similarity index 66%
rename from meta/recipes-extended/less/less_643.bb
rename to meta/recipes-extended/less/less_661.bb
index 67834bdd58..87d6a004b8 100644
--- a/meta/recipes-extended/less/less_643.bb
+++ b/meta/recipes-extended/less/less_661.bb
@@ -1,3 +1,25 @@
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
+# @@ -2,7 +2,7 @@
+#                            ------------
+#  
+#  Less
+# -Copyright (C) 1984-2023  Mark Nudelman
+# +Copyright (C) 1984-2024  Mark Nudelman
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions
+# 
+#
+
 SUMMARY = "Text file viewer similar to more"
 DESCRIPTION = "Less is a program similar to more, i.e. a terminal \
 based program for viewing text files and the output from other \
@@ -21,7 +43,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
+                    file://LICENSE;md5=ea7ea443692720f3015859945c0fb65d \
                     "
 DEPENDS = "ncurses"
 
@@ -29,7 +51,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
+SRC_URI[sha256sum] = "2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.44.0


--===============0401523182644712039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/less: PV changed from "643" to "661"
packages/core2-64-poky-linux/less: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-643.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-661.tar.gz file://run-ptest"
packages/core2-64-poky-linux/less/less-dbg: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less-dbg: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less-dbg: PKGSIZE changed from 728920 to 810704 (+11%)
packages/core2-64-poky-linux/less/less-dev: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less-dev: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less-doc: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less-doc: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less-doc: PKGSIZE changed from 101344 to 112278 (+11%)
packages/core2-64-poky-linux/less/less-locale: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less-locale: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less-ptest: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less-ptest: FILELIST: added "/usr/lib/less/ptest/lt/search-hist.lt"
packages/core2-64-poky-linux/less/less-ptest: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less-ptest: PKGSIZE changed from 7439076 to 9165941 (+23%)
packages/core2-64-poky-linux/less/less-src: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less-src: FILELIST: directory renamed /usr/src/debug/less/643/lesstest -> /usr/src/debug/less/661/lesstest, removed "/usr/src/debug/less/643/ttyin.c /usr/src/debug/less/643/decode.c /usr/src/debug/less/643/help.c /usr/src/debug/less/643/optfunc.c /usr/src/debug/less/643/cmdbuf.c /usr/src/debug/less/643/edit.c /usr/src/debug/less/643/opttbl.c /usr/src/debug/less/643/version.c /usr/src/debug/less/643/jump.c /usr/src/debug/less/643/pattern.c /usr/src/debug/less/643/output.c /usr/src/debug/less/643/funcs.h /usr/src/debug/less/643/brac.c /usr/src/debug/less/643/os.c /usr/src/debug/less/643/prompt.c /usr/src/debug/less/643/filename.c /usr/src/debug/less/643/forwback.c /usr/src/debug/less/643/ifile.c /usr/src/debug/less/643/line.c /usr/src/debug/less/643/search.c /usr/src/debug/less/643/tags.c /usr/src/debug/less/643/less.h /usr/src/debug/less/643/lesskey.c /usr/src/debug/less/643/linenum.c /usr/src/debug/less/643/lsystem.c /usr/src/debug/less/643/lessecho.
 c /usr/src/debug/less/643/lesskey_parse.c /usr/src/debug/less/643/lesskey.h /usr/src/debug/less/643/screen.c /usr/src/debug/less/643/ch.c /usr/src/debug/less/643/input.c /usr/src/debug/less/643/position.c /usr/src/debug/less/643/xbuf.c /usr/src/debug/less/643/charset.c /usr/src/debug/less/643/command.c /usr/src/debug/less/643/main.c /usr/src/debug/less/643/mark.c /usr/src/debug/less/643/xbuf.h /usr/src/debug/less/643/signal.c /usr/src/debug/less/643/option.c /usr/src/debug/less/643/cvt.c /usr/src/debug/less/643/option.h", added "/usr/src/debug/less/661/ttyin.c /usr/src/debug/less/661/decode.c /usr/src/debug/less/661/help.c /usr/src/debug/less/661/evar.c /usr/src/debug/less/661/optfunc.c /usr/src/debug/less/661/cmdbuf.c /usr/src/debug/less/661/edit.c /usr/src/debug/less/661/opttbl.c /usr/src/debug/less/661/version.c /usr/src/debug/less/661/jump.c /usr/src/debug/less/661/pattern.c /usr/src/debug/less/661/output.c /usr/src/debug/less/661/funcs.h /usr/src/debug/less/661/brac.c /usr/src/
 debug/less/661/os.c /usr/src/debug/less/661/prompt.c /usr/src/debug/less/661/filename.c /usr/src/debug/less/661/forwback.c /usr/src/debug/less/661/ifile.c /usr/src/debug/less/661/line.c /usr/src/debug/less/661/search.c /usr/src/debug/less/661/tags.c /usr/src/debug/less/661/less.h /usr/src/debug/less/661/lesskey.c /usr/src/debug/less/661/linenum.c /usr/src/debug/less/661/lsystem.c /usr/src/debug/less/661/lessecho.c /usr/src/debug/less/661/lesskey_parse.c /usr/src/debug/less/661/lesskey.h /usr/src/debug/less/661/screen.c /usr/src/debug/less/661/ch.c /usr/src/debug/less/661/input.c /usr/src/debug/less/661/position.c /usr/src/debug/less/661/xbuf.c /usr/src/debug/less/661/charset.c /usr/src/debug/less/661/command.c /usr/src/debug/less/661/main.c /usr/src/debug/less/661/mark.c /usr/src/debug/less/661/xbuf.h /usr/src/debug/less/661/signal.c /usr/src/debug/less/661/lang.h /usr/src/debug/less/661/option.c /usr/src/debug/less/661/cvt.c /usr/src/debug/less/661/option.h"
packages/core2-64-poky-linux/less/less-src: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less-src: PKGSIZE changed from 780526 to 862193 (+10%)
packages/core2-64-poky-linux/less/less-staticdev: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less-staticdev: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less: PV changed from "643" to "661"
packages/core2-64-poky-linux/less/less: PKGV changed from 643 [default] to 661 [default]
packages/core2-64-poky-linux/less/less: PKGSIZE changed from 259568 to 286472 (+10%)

--===============0401523182644712039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/less/less-dbg: PKGSIZE changed from 728920 to 810704 (+11%)
packages/core2-64-poky-linux/less/less-doc: PKGSIZE changed from 101344 to 112278 (+11%)
packages/core2-64-poky-linux/less/less-ptest: PKGSIZE changed from 7439076 to 9165941 (+23%)
packages/core2-64-poky-linux/less/less-ptest: FILELIST: added "/usr/lib/less/ptest/lt/search-hist.lt"
packages/core2-64-poky-linux/less/less-src: PKGSIZE changed from 780526 to 862193 (+10%)
packages/core2-64-poky-linux/less/less: PKGSIZE changed from 259568 to 286472 (+10%)

--===============0401523182644712039==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-643-661.patch"

RnJvbSA0NDk5YmY3NTAyNzg3ZmNjZjFiODI3YTI4NTgwYmY1NWU3MmJjMzUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxMDo0NToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxl
c3M6IHVwZ3JhZGUgNjQzIC0+IDY2MQoKLS0tCiAuLi4vbGVzcy97bGVzc182NDMuYmIgPT4gbGVz
c182NjEuYmJ9ICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGVzcy97bGVzc182NDMuYmIgPT4gbGVzc182NjEuYmJ9ICg2NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182NDMuYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY2MS5iYgpzaW1pbGFyaXR5IGluZGV4IDY2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY0My5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182NjEuYmIKaW5kZXggNjc4MzRiZGQ1OC4uODdk
NmEwMDRiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182NDMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182NjEuYmIKQEAgLTEsMyAr
MSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMg
QEAgLTIsNyArMiw3IEBACisjICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0t
LQorIyAgCisjICBMZXNzCisjIC1Db3B5cmlnaHQgKEMpIDE5ODQtMjAyMyAgTWFyayBOdWRlbG1h
bgorIyArQ29weXJpZ2h0IChDKSAxOTg0LTIwMjQgIE1hcmsgTnVkZWxtYW4KKyMgIAorIyAgUmVk
aXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3
aXRob3V0CisjICBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUg
Zm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgCisjCisKIFNVTU1BUlkgPSAiVGV4dCBmaWxlIHZpZXdl
ciBzaW1pbGFyIHRvIG1vcmUiCiBERVNDUklQVElPTiA9ICJMZXNzIGlzIGEgcHJvZ3JhbSBzaW1p
bGFyIHRvIG1vcmUsIGkuZS4gYSB0ZXJtaW5hbCBcCiBiYXNlZCBwcm9ncmFtIGZvciB2aWV3aW5n
IHRleHQgZmlsZXMgYW5kIHRoZSBvdXRwdXQgZnJvbSBvdGhlciBcCkBAIC0yMSw3ICs0Myw3IEBA
IFNFQ1RJT04gPSAiY29uc29sZS91dGlscyIKIAogTElDRU5TRSA9ICJHUEwtMy4wLW9yLWxhdGVy
IHwgQlNELTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
MWViYmQzZTM0MjM3YWYyNmRhNWRjMDhhNGU0NDA0NjQgXAotICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vTElDRU5TRTttZDU9MWIyNDQ2ZjVjODYzMmJmNjNhOTdkN2E0OTc1MGUxYzYgXAorICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRTttZDU9ZWE3ZWE0NDM2OTI3MjBmMzAxNTg1
OTk0NWMwZmI2NWQgXAogICAgICAgICAgICAgICAgICAgICAiCiBERVBFTkRTID0gIm5jdXJzZXMi
CiAKQEAgLTI5LDcgKzUxLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LmdyZWVud29vZHNvZnR3
YXJlLmNvbS8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyOTExYjU0
MzJjODM2ZmEwODRjOGEyZTY4ZjZjZDYzMTIzNzJjMDI2YTU4ZmFhYTk4ODYyNzMxYzhiNjA1MmU4
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiNWYwMTY3MjE2ZTNlZjBmZmNiMGMzMWMzNzRlMjg3
ZWIwMzVlNGUyMjNkNWRhZTMxNWMyNzgzYjZlNzM4ZWQiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwOi8vd3d3LmdyZWVud29vZHNvZnR3YXJlLmNvbS9sZXNzL2Rvd25sb2FkLmh0bWwiCiAK
LS0gCjIuNDQuMAoK

--===============0401523182644712039==--

