Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FEAD60040
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4643.1731964601777918275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HPrV1zPF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RPD1Vsw5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101934122b268-37014f28-4ff0-4c32-a7f4-60c56bedc0a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964613;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4BWmnV3okwYuDiWYtfr3G/QgxCVaysxSg4fxO/siuOg=;
	b=HPrV1zPFlGmoTJID1ZlMrSaaFxE0I5cvJ/RCd1kGpks7hQ62O5rmmPsqfXBp3kDx
	99agd8Hbjg9do5J79aLK/HROk+KY5bWXQHtTpke4uF1SDa2d7s8MMHPWW0tqqzxjJXl
	dI6/U79IR2o4a+yajAueFj+cosjxrLm9rIyzmCg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964613;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4BWmnV3okwYuDiWYtfr3G/QgxCVaysxSg4fxO/siuOg=;
	b=RPD1Vsw5VySx94riE0N/SanaR8QXUyH+BGd+9kgFiVOHWJMdSBjcT03xBn7UCzt9
	YGpNLGgu9Oq4L+hx8ds5jrPqCFwGhV7TJqf/sN+8BdIHtR2pTxRVlL8CcU4jVLo/mWJ
	8wo1HvwpB/SEsycUqvqYMB65LlD10d3Uhsfeu8ao=
Content-Type: multipart/mixed; boundary="===============1683147300291155816=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debugedit: upgrading to 5.1 FAILED
Message-ID: <010101934122b268-37014f28-4ff0-4c32-a7f4-60c56bedc0a3-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207257

--===============1683147300291155816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debugedit* to *5.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-debugedit-upgrade-5.0-5.1.patch
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
From 8ebcde30a04e7ef034140254664a3c391d3ae27a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 08:27:56 +0000
Subject: [PATCH] debugedit: upgrade 5.0 -> 5.1

---
 .../{debugedit_5.0.bb => debugedit_5.1.bb}          |  6 ++++--
 .../0003-Makefile.am-do-not-update-manual.patch     | 13 +++++--------
 2 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.0.bb => debugedit_5.1.bb} (85%)

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
similarity index 85%
rename from meta/recipes-devtools/debugedit/debugedit_5.0.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 63ad7babd9..43098a1667 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
+SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
+           file://0003-Makefile.am-do-not-update-manual.patch \
+           "
 
 SRC_URI:append:libc-musl = "\
            file://0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
-SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
+SRC_URI[sha256sum] = "ee9b688b2ed8fa62551c54cb5dc31aaa05853e7dedbd9e1237c77894ea5e3626"
 
 DEPENDS = "elfutils"
 DEPENDS:append:libc-musl = " musl-legacy-error"
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
index de467f5365..d0414f739a 100644
--- a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
@@ -1,7 +1,7 @@
-From 4f0d7d2f4900ce8555e09854dc681278b7a3d9a9 Mon Sep 17 00:00:00 2001
+From b2715c3f4d28fab1c238086d9b5435e269b06301 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 23 Mar 2023 13:09:23 +0800
-Subject: [PATCH 3/3] Makefile.am: do not update manual
+Subject: [PATCH] Makefile.am: do not update manual
 
 The tarball ships these manuals, no need to re-generate them.
 We have local patches for debugedit.c and sepdebugcrcfix.c,
@@ -20,7 +20,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 30 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 98b2f20..f91deea 100644
+index c590edf..692e016 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -52,36 +52,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
@@ -58,8 +58,5 @@ index 98b2f20..f91deea 100644
 -	esac
 -
  noinst_HEADERS= tools/ansidecl.h \
- 		tools/hashtab.h \
- 		tools/md5.h \
--- 
-2.17.1
-
+ 		tools/hashtab.h
+ 
-- 
2.44.1


--===============1683147300291155816==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debugedit-upgrade-5.0-5.1.patch"

RnJvbSA4ZWJjZGUzMGEwNGU3ZWYwMzQxNDAyNTQ2NjRhM2MzOTFkM2FlMjdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDg6Mjc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJ1Z2VkaXQ6IHVwZ3JhZGUgNS4wIC0+IDUuMQoKLS0tCiAuLi4ve2RlYnVnZWRpdF81LjAuYmIg
PT4gZGVidWdlZGl0XzUuMS5iYn0gICAgICAgICAgfCAgNiArKysrLS0KIC4uLi8wMDAzLU1ha2Vm
aWxlLmFtLWRvLW5vdC11cGRhdGUtbWFudWFsLnBhdGNoICAgICB8IDEzICsrKysrLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L3tkZWJ1Z2VkaXRfNS4wLmJiID0+IGRl
YnVnZWRpdF81LjEuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RlYnVnZWRpdC9kZWJ1Z2VkaXRfNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVn
ZWRpdC9kZWJ1Z2VkaXRfNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1Z2VkaXQvZGVidWdlZGl0XzUuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9kZWJ1Z2VkaXRfNS4xLmJiCmluZGV4IDYz
YWQ3YmFiZDkuLjQzMDk4YTE2NjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
ZWJ1Z2VkaXQvZGVidWdlZGl0XzUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVi
dWdlZGl0L2RlYnVnZWRpdF81LjEuYmIKQEAgLTksMTQgKzksMTYgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NTk1MzBiZGYzMzY1OWIyOWU3M2Q0YWRiOWY5ZjY1NTIg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PTJkNTAyNWQ0YWEz
NDk1YmVmZWY4ZjE3MjA2YTViMGExIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJ
TkczO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4MGQ0N2ZhZTUwNCIKIAotU1JDX1VSSSA9ICJo
dHRwczovL3NvdXJjZXdhcmUub3JnL2Z0cC9kZWJ1Z2VkaXQvJHtQVn0vZGVidWdlZGl0LSR7UFZ9
LnRhci54eiIKK1NSQ19VUkkgPSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9mdHAvZGVidWdlZGl0
LyR7UFZ9L2RlYnVnZWRpdC0ke1BWfS50YXIueHogXAorICAgICAgICAgICBmaWxlOi8vMDAwMy1N
YWtlZmlsZS5hbS1kby1ub3QtdXBkYXRlLW1hbnVhbC5wYXRjaCBcCisgICAgICAgICAgICIKIAog
U1JDX1VSSTphcHBlbmQ6bGliYy1tdXNsID0gIlwKICAgICAgICAgICAgZmlsZTovLzAwMDItc2Vw
ZGVidWdjcmNmaXguYy1kby1ub3QtdXNlLTY0Yml0LXZhcmlhbnRzLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDMtTWFrZWZpbGUuYW0tZG8tbm90LXVwZGF0ZS1tYW51YWwucGF0Y2ggXAog
ICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlOWVjZDdkMzUwYmViYWUxZjE3
OGNlNjc3NmNhMTlhNjQ4YjZmZThmYTIyZjViMzA0NGIzOGQ3ODk5YWE1NTNlIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImVlOWI2ODhiMmVkOGZhNjI1NTFjNTRjYjVkYzMxYWFhMDU4NTNlN2RlZGJk
OWUxMjM3Yzc3ODk0ZWE1ZTM2MjYiCiAKIERFUEVORFMgPSAiZWxmdXRpbHMiCiBERVBFTkRTOmFw
cGVuZDpsaWJjLW11c2wgPSAiIG11c2wtbGVnYWN5LWVycm9yIgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9maWxlcy8wMDAzLU1ha2VmaWxlLmFtLWRvLW5vdC11
cGRhdGUtbWFudWFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9maWxl
cy8wMDAzLU1ha2VmaWxlLmFtLWRvLW5vdC11cGRhdGUtbWFudWFsLnBhdGNoCmluZGV4IGRlNDY3
ZjUzNjUuLmQwNDE0ZjczOWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1
Z2VkaXQvZmlsZXMvMDAwMy1NYWtlZmlsZS5hbS1kby1ub3QtdXBkYXRlLW1hbnVhbC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDMtTWFrZWZpbGUu
YW0tZG8tbm90LXVwZGF0ZS1tYW51YWwucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDRmMGQ3
ZDJmNDkwMGNlODU1NWUwOTg1NGRjNjgxMjc4YjdhM2Q5YTkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGIyNzE1YzNmNGQyOGZhYjFjMjM4MDg2ZDliNTQzNWUyNjliMDYzMDEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUaHUsIDIzIE1hciAyMDIzIDEzOjA5OjIzICswODAwCi1TdWJqZWN0OiBbUEFUQ0gg
My8zXSBNYWtlZmlsZS5hbTogZG8gbm90IHVwZGF0ZSBtYW51YWwKK1N1YmplY3Q6IFtQQVRDSF0g
TWFrZWZpbGUuYW06IGRvIG5vdCB1cGRhdGUgbWFudWFsCiAKIFRoZSB0YXJiYWxsIHNoaXBzIHRo
ZXNlIG1hbnVhbHMsIG5vIG5lZWQgdG8gcmUtZ2VuZXJhdGUgdGhlbS4KIFdlIGhhdmUgbG9jYWwg
cGF0Y2hlcyBmb3IgZGVidWdlZGl0LmMgYW5kIHNlcGRlYnVnY3JjZml4LmMsCkBAIC0yMCw3ICsy
MCw3IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMzAgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5h
bSBiL01ha2VmaWxlLmFtCi1pbmRleCA5OGIyZjIwLi5mOTFkZWVhIDEwMDY0NAoraW5kZXggYzU5
MGVkZi4uNjkyZTAxNiAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5h
bQogQEAgLTUyLDM2ICs1Miw2IEBAIHNlcGRlYnVnY3JjZml4X0xEQUREID0gQExJQkVMRl9MSUJT
QApAQCAtNTgsOCArNTgsNSBAQCBpbmRleCA5OGIyZjIwLi5mOTFkZWVhIDEwMDY0NAogLQllc2Fj
CiAtCiAgbm9pbnN0X0hFQURFUlM9IHRvb2xzL2Fuc2lkZWNsLmggXAotIAkJdG9vbHMvaGFzaHRh
Yi5oIFwKLSAJCXRvb2xzL21kNS5oIFwKLS0tIAotMi4xNy4xCi0KKyAJCXRvb2xzL2hhc2h0YWIu
aAorIAotLSAKMi40NC4xCgo=

--===============1683147300291155816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5889e7aef4a7c0b8c9d26b005f5a35e9b7cd92da"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 285 Local 273 Mirrors 0 Missed 12 Current 339 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1311 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_recipe_qa)
NOTE: recipe debugedit-5.1-r0: task do_recipe_qa: Started
NOTE: recipe debugedit-5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1720 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_fetch)
NOTE: recipe debugedit-5.1-r0: task do_fetch: Started
NOTE: recipe debugedit-5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1721 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_unpack)
NOTE: Running task 1722 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe debugedit-5.1-r0: task do_unpack: Started
NOTE: recipe debugedit-5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1723 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_patch)
NOTE: Running task 1724 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.1-r0: task do_patch: Started
NOTE: recipe debugedit-5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe debugedit-5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_patch: Succeeded
NOTE: Running task 1725 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1726 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_populate_lic)
NOTE: recipe debugedit-5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.1-r0: task do_populate_lic: Started
NOTE: recipe debugedit-5.1-r0: task do_populate_lic: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1727 of 1739 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_configure)
NOTE: recipe debugedit-5.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/auto
 make/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'zlib', 'binutils-cross-x86_64', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'cracklib', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'linux-libc-headers', 'acl', 'attr', 'curl', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.17
| Features: subsecond-mtime
| 
| Copyright (C) 2024 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
|   <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot/usr/share/aclocal/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/bin/autoconf --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/bin/autoheader --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../debugedit-5.1/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --disable-static
| configure: WARNING: unrecognized options: --disable-static
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking for sys/param.h... yes
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for gawk... (cached) gawk
| checking for a sed that does not truncate output... (cached) sed
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot... (cached) none
| checking whether ln -s works... yes
| checking for x86_64-poky-linux-ld... x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot
| checking for x86_64-poky-linux-readelf... x86_64-poky-linux-readelf
| checking for dwz... no
| configure: WARNING: dwz not installed
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot option to enable large file support... none needed
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for libelf... yes
| checking for libdw... yes
| checking for libxxhash >= 0.8.0... no
| configure: error: Package requirements (libxxhash >= 0.8.0) were not met:
| 
| No package 'libxxhash' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables XXHASH_CFLAGS
| and XXHASH_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.3158368:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.3158368, line 285
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.3158368, line 261
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.3158368, line 231
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.3158368, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.3158368, line 289
NOTE: recipe debugedit-5.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1727 tasks of which 1718 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116082639.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116082639.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/log.do_configure.3158368
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: debugedit-5.1-r0 do_configure: configure failed
ERROR: debugedit-5.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.3158368' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/log.do_configure.3158368
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_configure) failed with exit code '1'

--===============1683147300291155816==--

