Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD4DCD98C5
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1559.1780328132630584587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lDPGjSqA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PpH01+3O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3a9e4-ed4d7f96-d969-410f-8480-e0bc2bcab7d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Ke9Un5UpIvDxjWdCxMY4LGbg0ZLTgZ1cvwRI2H4n54=;
	b=lDPGjSqAFy3oW9bOb4iU1W0eVfjLB64RDfWciXijzI6ZrTRMunoBkcYkWbIawtgm
	uMZkE2vhtle43Fs3l2xRDUsXw+03zW7c6zQnpJt+vy5xnLBP0lK3Ftne+TsAVQvMCyh
	1/srh/zkjWvkG1IUbGND/YiqIpxxeOhERBfmR3iA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Ke9Un5UpIvDxjWdCxMY4LGbg0ZLTgZ1cvwRI2H4n54=;
	b=PpH01+3OAet24mWkIF1XiRx39iSiotNW8hV1S6k0QgM+6m2Q9QIzXuqzdEzMCcFo
	fxX+lxDWup/YnsTH7CSk1sE74urvhGTUWs/1DPtLT2XMpJwlKm2gaAZatydHWsm915G
	srDzEc2A9QBXwQfbjpBjf8Cw14MpnVYthnrSdDzw=
Content-Type: multipart/mixed; boundary="===============3854031677153174049=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] which: upgrading to 2.25 SUCCEEDED
Message-ID: <0101019e83d3a9e4-ed4d7f96-d969-410f-8480-e0bc2bcab7d5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237914

--===============3854031677153174049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *which* to *2.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-which-upgrade-2.23-2.25.patch
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
From 44993c1552b9b58e41783157a467d58a31d04412 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:58:40 +0000
Subject: [PATCH] which: upgrade 2.23 -> 2.25

---
 ...opt-Fix-signature-of-getenv-function.patch |  2 +-
 .../{which-2.23 => which-2.25}/meson.build    |  0
 .../which/{which_2.23.bb => which_2.25.bb}    | 28 +++++++++++++++++--
 3 files changed, 26 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/which/{which-2.23 => which-2.25}/0001-getopt-Fix-signature-of-getenv-function.patch (96%)
 rename meta/recipes-extended/which/{which-2.23 => which-2.25}/meson.build (100%)
 rename meta/recipes-extended/which/{which_2.23.bb => which_2.25.bb} (48%)

diff --git a/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch b/meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
similarity index 96%
rename from meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
rename to meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
index c54368a084..8b2219d09b 100644
--- a/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
+++ b/meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
@@ -1,4 +1,4 @@
-From 83d2ed3fd203868a8f287d2ebedc7c304c74fbb4 Mon Sep 17 00:00:00 2001
+From e550e7ababb8bbbbb7eef0a7931c2fa3835afbfb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Mar 2025 17:56:19 -0700
 Subject: [PATCH] getopt: Fix signature of getenv function
diff --git a/meta/recipes-extended/which/which-2.23/meson.build b/meta/recipes-extended/which/which-2.25/meson.build
similarity index 100%
rename from meta/recipes-extended/which/which-2.23/meson.build
rename to meta/recipes-extended/which/which-2.25/meson.build
diff --git a/meta/recipes-extended/which/which_2.23.bb b/meta/recipes-extended/which/which_2.25.bb
similarity index 48%
rename from meta/recipes-extended/which/which_2.23.bb
rename to meta/recipes-extended/which/which_2.25.bb
index 0bbc3510d8..18ed9e6268 100644
--- a/meta/recipes-extended/which/which_2.23.bb
+++ b/meta/recipes-extended/which/which_2.25.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- which.c
+# +++ which.c
+# @@ -1,6 +1,6 @@
+#  /*
+#   * which v2.x -- print full path of executables
+# - * Copyright (C) 1999, 2003, 2007, 2008  Carlo Wood <carlo@gnu.org>
+# + * Copyright (C) 1999, 2003, 2007, 2008, 2024, 2026  Carlo Wood <carlo@gnu.org>
+#   *
+#   * This program is free software: you can redistribute it and/or modify
+#   * it under the terms of the GNU General Public License as published by
+# 
+#
+
 SUMMARY = "Displays the full path of shell commands"
 DESCRIPTION = "Which is a utility that prints out the full path of the \
 executables that bash(1) would execute when the passed \
@@ -7,8 +28,9 @@ SECTION = "libs"
 HOMEPAGE = "https://carlowood.github.io/which/"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://which.c;beginline=1;endline=17;md5=bcd173cbf5381e10d43be8d6ca6da3b5 \
+                    "
 
 inherit meson update-alternatives
 
@@ -17,7 +39,7 @@ SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
            file://0001-getopt-Fix-signature-of-getenv-function.patch \
            "
 
-SRC_URI[sha256sum] = "a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73"
+SRC_URI[sha256sum] = "1cb83e4f702e60b8211ab5ec4c2afbab1b1dec80209456a7d2faf7584ed225ea"
 
 do_configure:prepend() {
        cp ${UNPACKDIR}/meson.build ${S}
-- 
2.47.1


--===============3854031677153174049==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-which-upgrade-2.23-2.25.patch"

RnJvbSA0NDk5M2MxNTUyYjliNThlNDE3ODMxNTdhNDY3ZDU4YTMxZDA0NDEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDo1ODo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdo
aWNoOiB1cGdyYWRlIDIuMjMgLT4gMi4yNQoKLS0tCiAuLi5vcHQtRml4LXNpZ25hdHVyZS1vZi1n
ZXRlbnYtZnVuY3Rpb24ucGF0Y2ggfCAgMiArLQogLi4uL3t3aGljaC0yLjIzID0+IHdoaWNoLTIu
MjV9L21lc29uLmJ1aWxkICAgIHwgIDAKIC4uLi93aGljaC97d2hpY2hfMi4yMy5iYiA9PiB3aGlj
aF8yLjI1LmJifSAgICB8IDI4ICsrKysrKysrKysrKysrKysrLS0KIDMgZmlsZXMgY2hhbmdlZCwg
MjYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvd2hpY2gve3doaWNoLTIuMjMgPT4gd2hpY2gtMi4yNX0vMDAwMS1nZXRvcHQtRml4LXNp
Z25hdHVyZS1vZi1nZXRlbnYtZnVuY3Rpb24ucGF0Y2ggKDk2JSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvd2hpY2gve3doaWNoLTIuMjMgPT4gd2hpY2gtMi4yNX0vbWVzb24uYnVpbGQg
KDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3doaWNoL3t3aGljaF8yLjIzLmJi
ID0+IHdoaWNoXzIuMjUuYmJ9ICg0OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3doaWNoL3doaWNoLTIuMjMvMDAwMS1nZXRvcHQtRml4LXNpZ25hdHVyZS1vZi1nZXRlbnYt
ZnVuY3Rpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2hpY2gvd2hpY2gtMi4yNS8w
MDAxLWdldG9wdC1GaXgtc2lnbmF0dXJlLW9mLWdldGVudi1mdW5jdGlvbi5wYXRjaApzaW1pbGFy
aXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2hpY2gvd2hp
Y2gtMi4yMy8wMDAxLWdldG9wdC1GaXgtc2lnbmF0dXJlLW9mLWdldGVudi1mdW5jdGlvbi5wYXRj
aApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3doaWNoL3doaWNoLTIuMjUvMDAwMS1n
ZXRvcHQtRml4LXNpZ25hdHVyZS1vZi1nZXRlbnYtZnVuY3Rpb24ucGF0Y2gKaW5kZXggYzU0MzY4
YTA4NC4uOGIyMjE5ZDA5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3doaWNo
L3doaWNoLTIuMjMvMDAwMS1nZXRvcHQtRml4LXNpZ25hdHVyZS1vZi1nZXRlbnYtZnVuY3Rpb24u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3doaWNoL3doaWNoLTIuMjUvMDAwMS1n
ZXRvcHQtRml4LXNpZ25hdHVyZS1vZi1nZXRlbnYtZnVuY3Rpb24ucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDgzZDJlZDNmZDIwMzg2OGE4ZjI4N2QyZWJlZGM3YzMwNGM3NGZiYjQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU1NTBlN2FiYWJiOGJiYmJiN2VlZjBhNzkzMWMyZmEz
ODM1YWZiZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAyMiBNYXIgMjAyNSAxNzo1NjoxOSAtMDcwMAogU3Vi
amVjdDogW1BBVENIXSBnZXRvcHQ6IEZpeCBzaWduYXR1cmUgb2YgZ2V0ZW52IGZ1bmN0aW9uCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2hpY2gvd2hpY2gtMi4yMy9tZXNvbi5i
dWlsZCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC93aGljaC93aGljaC0yLjI1L21lc29uLmJ1aWxk
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
d2hpY2gvd2hpY2gtMi4yMy9tZXNvbi5idWlsZApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3doaWNoL3doaWNoLTIuMjUvbWVzb24uYnVpbGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC93aGljaC93aGljaF8yLjIzLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3do
aWNoL3doaWNoXzIuMjUuYmIKc2ltaWxhcml0eSBpbmRleCA0OCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3doaWNoL3doaWNoXzIuMjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC93aGljaC93aGljaF8yLjI1LmJiCmluZGV4IDBiYmMzNTEwZDguLjE4ZWQ5ZTYy
NjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93aGljaC93aGljaF8yLjIzLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC93aGljaC93aGljaF8yLjI1LmJiCkBAIC0xLDMg
KzEsMjQgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4g
dXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVh
c2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUg
Y2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRh
Zy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQu
JykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSB3aGljaC5jCisjICsrKyB3aGljaC5jCisj
IEBAIC0xLDYgKzEsNiBAQAorIyAgLyoKKyMgICAqIHdoaWNoIHYyLnggLS0gcHJpbnQgZnVsbCBw
YXRoIG9mIGV4ZWN1dGFibGVzCisjIC0gKiBDb3B5cmlnaHQgKEMpIDE5OTksIDIwMDMsIDIwMDcs
IDIwMDggIENhcmxvIFdvb2QgPGNhcmxvQGdudS5vcmc+CisjICsgKiBDb3B5cmlnaHQgKEMpIDE5
OTksIDIwMDMsIDIwMDcsIDIwMDgsIDIwMjQsIDIwMjYgIENhcmxvIFdvb2QgPGNhcmxvQGdudS5v
cmc+CisjICAgKgorIyAgICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU6IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgICAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjIAorIwor
CiBTVU1NQVJZID0gIkRpc3BsYXlzIHRoZSBmdWxsIHBhdGggb2Ygc2hlbGwgY29tbWFuZHMiCiBE
RVNDUklQVElPTiA9ICJXaGljaCBpcyBhIHV0aWxpdHkgdGhhdCBwcmludHMgb3V0IHRoZSBmdWxs
IHBhdGggb2YgdGhlIFwKIGV4ZWN1dGFibGVzIHRoYXQgYmFzaCgxKSB3b3VsZCBleGVjdXRlIHdo
ZW4gdGhlIHBhc3NlZCBcCkBAIC03LDggKzI4LDkgQEAgU0VDVElPTiA9ICJsaWJzIgogSE9NRVBB
R0UgPSAiaHR0cHM6Ly9jYXJsb3dvb2QuZ2l0aHViLmlvL3doaWNoLyIKIAogTElDRU5TRSA9ICJH
UEwtMy4wLW9yLWxhdGVyIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDRcCi0gICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly93aGljaC5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MTc7bWQ1PWE5OTYzNjkzYWYyMjcyZTdh
OGRmNmYyMzExNjRlN2EyIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQgXAorICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vd2hpY2guYztiZWdpbmxpbmU9MTtlbmRsaW5lPTE3O21kNT1iY2QxNzNjYmY1MzgxZTEw
ZDQzYmU4ZDZjYTZkYTNiNSBcCisgICAgICAgICAgICAgICAgICAgICIKIAogaW5oZXJpdCBtZXNv
biB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAKQEAgLTE3LDcgKzM5LDcgQEAgU1JDX1VSSSA9ICIke0dO
VV9NSVJST1J9L3doaWNoL3doaWNoLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWdldG9wdC1GaXgtc2lnbmF0dXJlLW9mLWdldGVudi1mdW5jdGlvbi5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEyYzU1ODIyNmZjNGQ5ZTRjZTMzMWJk
MmZkM2MzZjE3Zjk1NTExNWQyYzAwZTQ0NzYxOGE0ZWY5OTc4YTJhNzMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMWNiODNlNGY3MDJlNjBiODIxMWFiNWVjNGMyYWZiYWIxYjFkZWM4MDIwOTQ1NmE3
ZDJmYWY3NTg0ZWQyMjVlYSIKIAogZG9fY29uZmlndXJlOnByZXBlbmQoKSB7CiAgICAgICAgY3Ag
JHtVTlBBQ0tESVJ9L21lc29uLmJ1aWxkICR7U30KLS0gCjIuNDcuMQoK

--===============3854031677153174049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/which: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/which/which-2.23.tar.gz file://meson.build file://0001-getopt-Fix-signature-of-getenv-function.patch" to "https://ftpmirror.gnu.org/gnu/which/which-2.25.tar.gz file://meson.build file://0001-getopt-Fix-signature-of-getenv-function.patch"
packages/x86-64-v3-poky-linux/which: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-dbg: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-dbg: PKGSIZE changed from 76720 to 76232 (-1%)
packages/x86-64-v3-poky-linux/which/which-dbg: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-dev: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-dev: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-doc: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-doc: PKGSIZE changed from 3639 to 3643 (+0%)
packages/x86-64-v3-poky-linux/which/which-doc: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-locale: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-locale: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-src: FILELIST: directory renamed /usr/src/debug/which/2.23 -> /usr/src/debug/which/2.25
packages/x86-64-v3-poky-linux/which/which-src: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-src: PKGSIZE changed from 58660 to 59018 (+1%)
packages/x86-64-v3-poky-linux/which/which-src: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-staticdev: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-staticdev: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which: PKGV changed from 2.23 [default] to 2.25 [default]

--===============3854031677153174049==--

