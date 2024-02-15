Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A933C54E9E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20163.1708018345245219721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DpjuO++Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dWPmcg2p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dadd3a635-66bc98da-db5d-4830-8d01-76d2fca8133e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xhjtehIEw/Eb2CFJJS2PIdM0O07+YcV5kY7Hcl7iOlo=;
	b=DpjuO++Q7X122KMUsaqeUZEIPjpcT1AiRZ9eC+Sb1wDAifjq+kkwSYfENTUoSLqq
	yKp3h8lcH5wADOCNqxP38JgZ/jR3GItxhIkOPVYw0Jy6iiBLvLWMQK0osib8ZACLsLE
	HflnZ4XhVUZdEptZ7pjaIyHR+HbreP5lyIi2qq8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xhjtehIEw/Eb2CFJJS2PIdM0O07+YcV5kY7Hcl7iOlo=;
	b=dWPmcg2ptJMrEKVv2AZElXY0cXjjBGiqnNKt8w+bhl9wTQL+1iouKXUe7AmLsBPA
	ooiCC8VUAM83Fbd0y1aA055TSvGIcC+kXIHj41DkmRhSOcNyx8Um6g8zdzr3WOFNtCe
	AuGTbOBG7SG/I5KmxlDEtodbl7b+AYGGdGsXNWII=
Content-Type: multipart/mixed; boundary="===============4960809680191359798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.06 FAILED
Message-ID: <0101018dadd3a635-66bc98da-db5d-4830-8d01-76d2fca8133e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195614

--===============4960809680191359798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.06* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-6.05.01-6.06.patch
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
From d31ddf5e37d4771171aaee911cdc7cb32c1917f0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 11:36:26 +0000
Subject: [PATCH] man-pages: upgrade 6.05.01 -> 6.06

---
 ...man-pages_6.05.01.bb => man-pages_6.06.bb} | 109 +++++++++++++++++-
 1 file changed, 105 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.05.01.bb => man-pages_6.06.bb} (28%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb b/meta/recipes-extended/man-pages/man-pages_6.06.bb
similarity index 28%
rename from meta/recipes-extended/man-pages/man-pages_6.05.01.bb
rename to meta/recipes-extended/man-pages/man-pages_6.06.bb
index f0eb1a6132..43f0d1fa54 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.06.bb
@@ -1,12 +1,113 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README
+# +++ README
+# @@ -17,6 +17,7 @@
+#  
+#  Files
+#     CONTRIBUTING
+# +   CONTRIBUTING.d/*
+#         Instructions for reporting bugs and contributing.
+#  
+#     INSTALL
+# @@ -35,15 +36,12 @@
+#         Change log.  Includes most relevant changes.  However, it's not
+#         as complete as the git(1) log.
+#  
+# -   Makefile, share/mk/*
+# +   GNUmakefile, share/mk/*
+#         Build system.  For help, consult the <INSTALL> file, and run
+#         'make help'.
+#  
+#     lsm
+#         Linux software map.  See also <https://lsm.qqx.org/>.
+# -
+# -   .mailmap
+# -       See gitmailmap(5).
+#  
+#     LICENSES/*.txt
+#         Licenses in use by the project.
+# @@ -62,20 +60,20 @@
+#         Default directory for files created by the build system.
+#  
+#  Versions
+# -   Tarballs
+# -       <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/>
+# +   Distribution
+# +       <https://kernel.org/pub/linux/docs/man-pages/>
+# +       <https://www.alejandro-colomar.es/share/dist/man-pages/>
+#  
+#     Git
+# -       <git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git>
+#         <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/>
+# -
+# -       A secondary git(1) repository can be found at:
+# -       <git://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git>
+# -       <http://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git/>
+# +       <https://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git/>
+#  
+#     Online man-pages
+#         PDF
+# -             <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/book/>
+# +             <https://kernel.org/pub/linux/docs/man-pages/book/>
+# +             <https://www.alejandro-colomar.es/share/dist/man-pages/>
+# +       HTML
+# +             <https://man7.org/linux/man-pages/index.html>
+#  
+#  History
+#     Tarballs
+# @@ -83,7 +81,7 @@
+#         <https://www.win.tue.nl/~aeb/ftpdocs/linux-local/manpages.archive/>
+#  
+#     Maintainers
+# -       Alejandro Colomar <alx@kernel.org> <http://www.alejandro-colomar.es/>
+# +       Alejandro Colomar <alx@kernel.org> <https://www.alejandro-colomar.es/>
+#               2020 - present (5.09 - HEAD)
+#         Michael Kerrisk <mtk.manpages@gmail.com> <https://man7.org/>
+#               2004 - 2021    (2.00 - 5.13)
+# @@ -107,7 +105,7 @@
+#         man-pages(7)
+#  
+#     Website
+# -       <http://www.kernel.org/doc/man-pages/index.html>.
+# +       <https://www.kernel.org/doc/man-pages/index.html>.
+#  
+#     Downstream packages
+#         Arch man-pages
+# --- LICENSES/BSD-2-Clause.txt
+# +++ LICENSES/BSD-2-Clause.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) <year> <owner> 
+# +Copyright (c) <year> <owner>
+#  
+#  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+#  
+# --- LICENSES/BSD-3-Clause.txt
+# +++ LICENSES/BSD-3-Clause.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) <year> <owner>. 
+# +Copyright (c) <year> <owner>.
+#  
+#  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+#  
+# 
+#
+
 SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=cbd51cd3dd298230df8ddd4637e65c37 \
-                    file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
-                    file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
+LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
+                    file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
+                    file://LICENSES/BSD-3-Clause.txt;md5=407426fcc1a243b7b2eff6e35c56aca9 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
                     file://LICENSES/GPL-1.0-or-later.txt;md5=e5b7c80002ef72ab868b43ce47b65125 \
                     file://LICENSES/GPL-2.0-only.txt;md5=3d26203303a722dedc6bf909d95ba815 \
@@ -16,7 +117,7 @@ LIC_FILES_CHKSUM = "file://README;md5=cbd51cd3dd298230df8ddd4637e65c37 \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "b2dd44ca0342b50923291f06bdba38c42438e10c04843ce1f731cf3f50631e0a"
+SRC_URI[sha256sum] = "006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568"
 
 inherit manpages
 
-- 
2.42.0


--===============4960809680191359798==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.05.01-6.06.patch"

RnJvbSBkMzFkZGY1ZTM3ZDQ3NzExNzFhYWVlOTExY2RjN2NiMzJjMTkxN2YwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTE6MzY6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YW4tcGFnZXM6IHVwZ3JhZGUgNi4wNS4wMSAtPiA2LjA2CgotLS0KIC4uLm1hbi1wYWdlc182LjA1
LjAxLmJiID0+IG1hbi1wYWdlc182LjA2LmJifSB8IDEwOSArKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL3ttYW4tcGFnZXNfNi4wNS4wMS5iYiA9PiBt
YW4tcGFnZXNfNi4wNi5iYn0gKDI4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA1LjAxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L21hbi1wYWdlcy9tYW4tcGFnZXNfNi4wNi5iYgpzaW1pbGFyaXR5IGluZGV4IDI4JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA1LjAxLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA2
LmJiCmluZGV4IGYwZWIxYTYxMzIuLjQzZjBkMWZhNTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDUuMDEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNi4wNi5iYgpAQCAtMSwxMiArMSwxMTMg
QEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRl
ZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBk
YXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdl
cyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMg
KGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMK
KyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBSRUFETUUKKyMgKysrIFJFQURNRQorIyBAQCAtMTcs
NiArMTcsNyBAQAorIyAgCisjICBGaWxlcworIyAgICAgQ09OVFJJQlVUSU5HCisjICsgICBDT05U
UklCVVRJTkcuZC8qCisjICAgICAgICAgSW5zdHJ1Y3Rpb25zIGZvciByZXBvcnRpbmcgYnVncyBh
bmQgY29udHJpYnV0aW5nLgorIyAgCisjICAgICBJTlNUQUxMCisjIEBAIC0zNSwxNSArMzYsMTIg
QEAKKyMgICAgICAgICBDaGFuZ2UgbG9nLiAgSW5jbHVkZXMgbW9zdCByZWxldmFudCBjaGFuZ2Vz
LiAgSG93ZXZlciwgaXQncyBub3QKKyMgICAgICAgICBhcyBjb21wbGV0ZSBhcyB0aGUgZ2l0KDEp
IGxvZy4KKyMgIAorIyAtICAgTWFrZWZpbGUsIHNoYXJlL21rLyoKKyMgKyAgIEdOVW1ha2VmaWxl
LCBzaGFyZS9tay8qCisjICAgICAgICAgQnVpbGQgc3lzdGVtLiAgRm9yIGhlbHAsIGNvbnN1bHQg
dGhlIDxJTlNUQUxMPiBmaWxlLCBhbmQgcnVuCisjICAgICAgICAgJ21ha2UgaGVscCcuCisjICAK
KyMgICAgIGxzbQorIyAgICAgICAgIExpbnV4IHNvZnR3YXJlIG1hcC4gIFNlZSBhbHNvIDxodHRw
czovL2xzbS5xcXgub3JnLz4uCisjIC0KKyMgLSAgIC5tYWlsbWFwCisjIC0gICAgICAgU2VlIGdp
dG1haWxtYXAoNSkuCisjICAKKyMgICAgIExJQ0VOU0VTLyoudHh0CisjICAgICAgICAgTGljZW5z
ZXMgaW4gdXNlIGJ5IHRoZSBwcm9qZWN0LgorIyBAQCAtNjIsMjAgKzYwLDIwIEBACisjICAgICAg
ICAgRGVmYXVsdCBkaXJlY3RvcnkgZm9yIGZpbGVzIGNyZWF0ZWQgYnkgdGhlIGJ1aWxkIHN5c3Rl
bS4KKyMgIAorIyAgVmVyc2lvbnMKKyMgLSAgIFRhcmJhbGxzCisjIC0gICAgICAgPGh0dHBzOi8v
bWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBhZ2VzLz4KKyMgKyAg
IERpc3RyaWJ1dGlvbgorIyArICAgICAgIDxodHRwczovL2tlcm5lbC5vcmcvcHViL2xpbnV4L2Rv
Y3MvbWFuLXBhZ2VzLz4KKyMgKyAgICAgICA8aHR0cHM6Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIu
ZXMvc2hhcmUvZGlzdC9tYW4tcGFnZXMvPgorIyAgCisjICAgICBHaXQKKyMgLSAgICAgICA8Z2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9kb2NzL21hbi1wYWdlcy9tYW4tcGFnZXMuZ2l0Pgor
IyAgICAgICAgIDxodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vZG9jcy9tYW4tcGFnZXMv
bWFuLXBhZ2VzLmdpdC8+CisjIC0KKyMgLSAgICAgICBBIHNlY29uZGFyeSBnaXQoMSkgcmVwb3Np
dG9yeSBjYW4gYmUgZm91bmQgYXQ6CisjIC0gICAgICAgPGdpdDovL3d3dy5hbGVqYW5kcm8tY29s
b21hci5lcy9zcmMvYWx4L2xpbnV4L21hbi1wYWdlcy9tYW4tcGFnZXMuZ2l0PgorIyAtICAgICAg
IDxodHRwOi8vd3d3LmFsZWphbmRyby1jb2xvbWFyLmVzL3NyYy9hbHgvbGludXgvbWFuLXBhZ2Vz
L21hbi1wYWdlcy5naXQvPgorIyArICAgICAgIDxodHRwczovL3d3dy5hbGVqYW5kcm8tY29sb21h
ci5lcy9zcmMvYWx4L2xpbnV4L21hbi1wYWdlcy9tYW4tcGFnZXMuZ2l0Lz4KKyMgIAorIyAgICAg
T25saW5lIG1hbi1wYWdlcworIyAgICAgICAgIFBERgorIyAtICAgICAgICAgICAgIDxodHRwczov
L21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1wYWdlcy9ib29rLz4K
KyMgKyAgICAgICAgICAgICA8aHR0cHM6Ly9rZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1w
YWdlcy9ib29rLz4KKyMgKyAgICAgICAgICAgICA8aHR0cHM6Ly93d3cuYWxlamFuZHJvLWNvbG9t
YXIuZXMvc2hhcmUvZGlzdC9tYW4tcGFnZXMvPgorIyArICAgICAgIEhUTUwKKyMgKyAgICAgICAg
ICAgICA8aHR0cHM6Ly9tYW43Lm9yZy9saW51eC9tYW4tcGFnZXMvaW5kZXguaHRtbD4KKyMgIAor
IyAgSGlzdG9yeQorIyAgICAgVGFyYmFsbHMKKyMgQEAgLTgzLDcgKzgxLDcgQEAKKyMgICAgICAg
ICA8aHR0cHM6Ly93d3cud2luLnR1ZS5ubC9+YWViL2Z0cGRvY3MvbGludXgtbG9jYWwvbWFucGFn
ZXMuYXJjaGl2ZS8+CisjICAKKyMgICAgIE1haW50YWluZXJzCisjIC0gICAgICAgQWxlamFuZHJv
IENvbG9tYXIgPGFseEBrZXJuZWwub3JnPiA8aHR0cDovL3d3dy5hbGVqYW5kcm8tY29sb21hci5l
cy8+CisjICsgICAgICAgQWxlamFuZHJvIENvbG9tYXIgPGFseEBrZXJuZWwub3JnPiA8aHR0cHM6
Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIuZXMvPgorIyAgICAgICAgICAgICAgIDIwMjAgLSBwcmVz
ZW50ICg1LjA5IC0gSEVBRCkKKyMgICAgICAgICBNaWNoYWVsIEtlcnJpc2sgPG10ay5tYW5wYWdl
c0BnbWFpbC5jb20+IDxodHRwczovL21hbjcub3JnLz4KKyMgICAgICAgICAgICAgICAyMDA0IC0g
MjAyMSAgICAoMi4wMCAtIDUuMTMpCisjIEBAIC0xMDcsNyArMTA1LDcgQEAKKyMgICAgICAgICBt
YW4tcGFnZXMoNykKKyMgIAorIyAgICAgV2Vic2l0ZQorIyAtICAgICAgIDxodHRwOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL21hbi1wYWdlcy9pbmRleC5odG1sPi4KKyMgKyAgICAgICA8aHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvbWFuLXBhZ2VzL2luZGV4Lmh0bWw+LgorIyAgCisjICAgICBEb3du
c3RyZWFtIHBhY2thZ2VzCisjICAgICAgICAgQXJjaCBtYW4tcGFnZXMKKyMgLS0tIExJQ0VOU0VT
L0JTRC0yLUNsYXVzZS50eHQKKyMgKysrIExJQ0VOU0VTL0JTRC0yLUNsYXVzZS50eHQKKyMgQEAg
LTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDx5ZWFyPiA8b3duZXI+IAorIyArQ29weXJp
Z2h0IChjKSA8eWVhcj4gPG93bmVyPgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGlu
IHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQgbW9kaWZpY2F0aW9uLCBh
cmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBt
ZXQ6CisjICAKKyMgLS0tIExJQ0VOU0VTL0JTRC0zLUNsYXVzZS50eHQKKyMgKysrIExJQ0VOU0VT
L0JTRC0zLUNsYXVzZS50eHQKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDx5
ZWFyPiA8b3duZXI+LiAKKyMgK0NvcHlyaWdodCAoYykgPHllYXI+IDxvd25lcj4uCisjICAKKyMg
IFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGgg
b3Igd2l0aG91dCBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUg
Zm9sbG93aW5nIGNvbmRpdGlvbnMgYXJlIG1ldDoKKyMgIAorIyAKKyMKKwogU1VNTUFSWSA9ICJM
aW51eCBtYW4tcGFnZXMiCiBERVNDUklQVElPTiA9ICJUaGUgTGludXggbWFuLXBhZ2VzIHByb2pl
Y3QgZG9jdW1lbnRzIHRoZSBMaW51eCBrZXJuZWwgYW5kIEMgbGlicmFyeSBpbnRlcmZhY2VzIHRo
YXQgYXJlIGVtcGxveWVkIGJ5IHVzZXIgcHJvZ3JhbXMiCiBTRUNUSU9OID0gImNvbnNvbGUvdXRp
bHMiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFu
LXBhZ2VzIgogTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyICYgR1BMLTIuMC1vbmx5ICYgR1BM
LTEuMC1vci1sYXRlciAmIEJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSAmIEJTRC00LUNsYXVz
ZSAmIE1JVCIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO21kNT1jYmQ1MWNk
M2RkMjk4MjMwZGY4ZGRkNDYzN2U2NWMzNyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9M
SUNFTlNFUy9CU0QtMi1DbGF1c2UudHh0O21kNT1kMGYyODBkMTA1OGU3N2U2NjI2NGE5YjllMTBl
NmM4OSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFUy9CU0QtMy1DbGF1c2Uu
dHh0O21kNT03MWY3MzllZjc1NTgxY2FlMzEyZThjNzExYmNkYWIxNiBcCitMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9SRUFETUU7bWQ1PTcyY2ZmMDZiNzk1NDIyMmMyNGQzOGJjMmM0MWIyMzRl
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0JTRC0yLUNsYXVzZS50eHQ7
bWQ1PTllMTY1OTRhMjI4MzAxMDg5ZDc1OWI0ZjE3OGRiOTFmIFwKKyAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0xJQ0VOU0VTL0JTRC0zLUNsYXVzZS50eHQ7bWQ1PTQwNzQyNmZjYzFhMjQzYjdi
MmVmZjZlMzVjNTZhY2E5IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0JT
RC00LUNsYXVzZS1VQy50eHQ7bWQ1PTFkYTNjZjhhZDUwY2Q4ZDVkMWRlM2NmYzUzMTk2ZDAxIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0dQTC0xLjAtb3ItbGF0ZXIudHh0
O21kNT1lNWI3YzgwMDAyZWY3MmFiODY4YjQzY2U0N2I2NTEyNSBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wLW9ubHkudHh0O21kNT0zZDI2MjAzMzAzYTcyMmRl
ZGM2YmY5MDlkOTViYTgxNSBcCkBAIC0xNiw3ICsxMTcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9SRUFETUU7bWQ1PWNiZDUxY2QzZGQyOTgyMzBkZjhkZGQ0NjM3ZTY1YzM3IFwKICAg
ICAgICAgICAgICAgICAgICAgIgogU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4
L2RvY3MvJHtCUE59LyR7QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImIyZGQ0
NGNhMDM0MmI1MDkyMzI5MWYwNmJkYmEzOGM0MjQzOGUxMGMwNDg0M2NlMWY3MzFjZjNmNTA2MzFl
MGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDA2OTA2ZTdiZTgxYTcxYzJkMzQ3ODA5NTk3YmNi
OTE0ODVmYTdmYTQ4OGFjZGFhNzllNjgxZGRmYTg5NDU2OCIKIAogaW5oZXJpdCBtYW5wYWdlcwog
Ci0tIAoyLjQyLjAKCg==

--===============4960809680191359798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1858 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ddfe374eab8ec901b9169ca04f4f84a7e077b53c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ddfe374eab8ec901b9169ca04f4f84a7e077b53c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 103 Local 91 Mirrors 0 Missed 12 Current 188 (88% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 776 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_recipe_qa)
NOTE: recipe man-pages-6.06-r0: task do_recipe_qa: Started
NOTE: recipe man-pages-6.06-r0: task do_recipe_qa: Succeeded
NOTE: Running task 866 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_fetch)
NOTE: recipe man-pages-6.06-r0: task do_fetch: Started
NOTE: recipe man-pages-6.06-r0: task do_fetch: Succeeded
NOTE: Running task 867 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_unpack)
NOTE: Running task 868 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-pages-6.06-r0: task do_unpack: Started
NOTE: recipe man-pages-6.06-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-pages-6.06-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe man-pages-6.06-r0: task do_unpack: Succeeded
NOTE: Running task 869 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_patch)
NOTE: Running task 870 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_collect_spdx_deps)
NOTE: recipe man-pages-6.06-r0: task do_patch: Started
NOTE: recipe man-pages-6.06-r0: task do_collect_spdx_deps: Started
NOTE: recipe man-pages-6.06-r0: task do_patch: Succeeded
NOTE: Running task 871 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_deploy_source_date_epoch)
NOTE: Running task 872 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_populate_lic)
NOTE: recipe man-pages-6.06-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe man-pages-6.06-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-pages-6.06-r0: task do_populate_lic: Started
NOTE: recipe man-pages-6.06-r0: task do_populate_lic: Succeeded
NOTE: recipe man-pages-6.06-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 873 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_configure)
NOTE: Running noexec task 874 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_compile)
NOTE: Running task 875 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_install)
NOTE: recipe man-pages-6.06-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 install prefix=/usr DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image
| fatal: not a git repository (or any of the parent directories): .git
| bash: locale: command not found
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man1/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man2/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man4/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man5/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man6/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man7/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man8/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man2type/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/a64l.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abort.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abs.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acos.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosf.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosh.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshf.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshl.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosl.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addmntent.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addseverity.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/adjtime.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/__after_morecore_hook.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_cancel.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_error.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_fsync.3
| install: cannot stat '/dev/stdin': No such file or directory
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_init.3
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/a64l.3] Error 1
| make: *** Waiting for unfinished jobs....
| install: cannot stat '/dev/stdin': No such file or directory
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abort.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acos.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abs.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshf.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| install: install: cannot stat '/dev/stdin'cannot stat '/dev/stdin': No such file or directory: No such file or directory
| 
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosf.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshl.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosh.3] Error 1
| install: cannot stat '/dev/stdin'install: cannot stat '/dev/stdin'make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addseverity.3] Error 1
| : No such file or directory
| : No such file or directory
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosl.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addmntent.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/adjtime.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/__after_morecore_hook.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_cancel.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_error.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_fsync.3] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.2349715:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.2349715, line 174
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.2349715, line 158
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.2349715, line 153
| 	#4: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.2349715, line 144
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.2349715, line 187
NOTE: recipe man-pages-6.06-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 875 tasks of which 864 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215113611.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215113611.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_install
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: man-pages-6.06-r0 do_install: oe_runmake failed
ERROR: man-pages-6.06-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.2349715', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/log.do_install.2349715
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_install) failed with exit code '1'

--===============4960809680191359798==--

