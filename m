Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C498ACD13B7
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.44646.1711994601707058040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B1zxOZ+5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XDJUg2+/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e9ad4859c-b9184b7f-5e7d-41bb-9614-e4cf76a91feb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=7TeIHhHH18/hRuZfL+h5p0KoQr3soCIa4xVFaRd9GJM=;
	b=B1zxOZ+5FzbQPgR/pa5o2gnaECD2dmCGNbKj60ZNNuFNJdU05KqNC292nHhiQ4B5
	Z4ShMaaNtjM7KMQSfQG5U3jDS1sMWFfVQTTVGpHQg8IjtY1r/9SWdkPBQ+0rC8BPfM8
	EO/FRFjfmf0FGi81qmgukSkIIglWqLCrFt90f8/A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=7TeIHhHH18/hRuZfL+h5p0KoQr3soCIa4xVFaRd9GJM=;
	b=XDJUg2+/Yn53gxJp+hhGoIDBqod5u5Kn0Mo1otIk/ZjpI760Gt16SmrlB0LhsMEl
	n6BYm+ll+JmvgJFutZAqo+80CqKR9RGpE72dgG3bsPozJLP50JJJtn0zVu+zOy6/EKp
	nyh9sKWVv198BC7YqeMHd7HAuvHWdhVnal6z8ofo=
Content-Type: multipart/mixed; boundary="===============5250605655920528826=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mkfontscale: upgrading to 1.2.3 SUCCEEDED
Message-ID: <0101018e9ad4859c-b9184b7f-5e7d-41bb-9614-e4cf76a91feb-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197760

--===============5250605655920528826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mkfontscale* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mkfontscale-upgrade-1.2.2-1.2.3.patch
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
From a19573b97e355ef14f6406941f3554df4998fd78 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:31:59 +0000
Subject: [PATCH] mkfontscale: upgrade 1.2.2 -> 1.2.3

---
 ...ontscale_1.2.2.bb => mkfontscale_1.2.3.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.2.bb => mkfontscale_1.2.3.bb} (38%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
similarity index 38%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
index cd658ab219..4addbd2f46 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -18,7 +18,7 @@
+#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#  THE SOFTWARE.
+#  
+# -Copyright (c) 2008, Oracle and/or its affiliates. All rights reserved.
+# +Copyright (c) 2008, Oracle and/or its affiliates.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a
+#  copy of this software and associated documentation files (the "Software"),
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "A program to create an index of scalable font files for X"
@@ -15,7 +37,7 @@ RPROVIDES:${PN} += "mkfontdir"
 
 BBCLASSEXTEND = "native"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5a60c596d1b5f3dee9f005b703b3180d"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
+SRC_URI[sha256sum] = "2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e"
-- 
2.42.0


--===============5250605655920528826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mkfontscale: SRC_URI changed from "https://www.x.org/releases//individual/app/mkfontscale-1.2.2.tar.xz" to "https://www.x.org/releases//individual/app/mkfontscale-1.2.3.tar.xz"
packages/core2-64-poky-linux/mkfontscale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dbg: PKGSIZE changed from 92896 to 95528 (+3%)
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dbg: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dev: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-doc: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-locale: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-src: PKGSIZE changed from 72554 to 74994 (+3%)
packages/core2-64-poky-linux/mkfontscale/mkfontscale-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-src: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale: PV changed from "1.2.2" to "1.2.3"

--===============5250605655920528826==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mkfontscale-upgrade-1.2.2-1.2.3.patch"

RnJvbSBhMTk1NzNiOTdlMzU1ZWYxNGY2NDA2OTQxZjM1NTRkZjQ5OThmZDc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDozMTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1r
Zm9udHNjYWxlOiB1cGdyYWRlIDEuMi4yIC0+IDEuMi4zCgotLS0KIC4uLm9udHNjYWxlXzEuMi4y
LmJiID0+IG1rZm9udHNjYWxlXzEuMi4zLmJifSB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97bWtmb250c2NhbGVfMS4yLjIuYmIgPT4gbWtm
b250c2NhbGVfMS4yLjMuYmJ9ICgzOCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMzglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuMi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEu
Mi4zLmJiCmluZGV4IGNkNjU4YWIyMTkuLjRhZGRiZDJmNDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuMi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjMuYmIKQEAgLTEsMyArMSwy
NSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRh
dGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1
cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFu
Z2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgor
IyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQor
IworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAg
LTE4LDcgKzE4LDcgQEAKKyMgIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4KKyMgIFRIRSBTT0ZUV0FSRS4KKyMg
IAorIyAtQ29weXJpZ2h0IChjKSAyMDA4LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLiBB
bGwgcmlnaHRzIHJlc2VydmVkLgorIyArQ29weXJpZ2h0IChjKSAyMDA4LCBPcmFjbGUgYW5kL29y
IGl0cyBhZmZpbGlhdGVzLgorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBm
cmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQorIyAgY29weSBvZiB0aGlz
IHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdh
cmUiKSwKKyMgCisjCisKIHJlcXVpcmUgeG9yZy1hcHAtY29tbW9uLmluYwogCiBTVU1NQVJZID0g
IkEgcHJvZ3JhbSB0byBjcmVhdGUgYW4gaW5kZXggb2Ygc2NhbGFibGUgZm9udCBmaWxlcyBmb3Ig
WCIKQEAgLTE1LDcgKzM3LDcgQEAgUlBST1ZJREVTOiR7UE59ICs9ICJta2ZvbnRkaXIiCiAKIEJC
Q0xBU1NFWFRFTkQgPSAibmF0aXZlIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT05OWIxZTEyNjlhYmE1MTc5MTM5YjllNDM4MGZjMDkzNCIKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVhNjBjNTk2ZDFiNWYzZGVlOWYwMDViNzAzYjMxODBk
IgogCiBTUkNfVVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4YWUzZmI1YjFm
ZTc0MzZlMWY1NjUwNjBhY2FhM2UyOTE4ZmU3NDViMGU0OTc5YjU1OTM5Njg5MTRmZTJkNWM0Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjI5MjFjZGMzNDRmMWFjZWUwNGJjZDZlYTFlMjk1NjVjMTMw
ODI2MzAwNmUxMzRhOWVlMzhjZjljOWQ2ZmU3NWUiCi0tIAoyLjQyLjAKCg==

--===============5250605655920528826==--

