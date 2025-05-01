Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EB6C3ABBC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1780.1746113612927889784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EaSKtFP/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GWmCZRex;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101968c7b49db-8c6a645c-e4b3-4d32-a29a-cb8261e5bc81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6v/g3aIZ1K9y/F5u/lt0qkvVbi5/g1JqL6vEwZIICqw=;
	b=EaSKtFP/iGfbGgQn0ziC06IiqYioVoDQl/Odmxma9joIFgPnjMELcIBfDIStbX6p
	v+Ht0GYunrZ9f+QlgDY73GzKRKeHppMB7tBpRnvhUnTaxywTUs+R1z5sWbgF2YSo8r1
	VOn6L2AtDVCznkxlCzFc2h0PRjGNLXhV9DzjTb7M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6v/g3aIZ1K9y/F5u/lt0qkvVbi5/g1JqL6vEwZIICqw=;
	b=GWmCZRexEpHb15HkAluXn30Z1A0MCh39c29fcfpuutPrxgXXkeFqp7iQWOa1xMKY
	dA6wsB8m/pXZUXj+OxFHT3VxX8OFnI1Po3KIIzh+lsuNrExtljk2E8+bF4/GJ1RSNoE
	aVOsqhY6+kg3q8SBHE77RgXLsJE9mVCpVPQ+n4VA=
Content-Type: multipart/mixed; boundary="===============3998793665141708683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.04.0 SUCCEEDED
Message-ID: <010101968c7b49db-8c6a645c-e4b3-4d32-a29a-cb8261e5bc81-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215790

--===============3998793665141708683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.04.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.03.0-2025.04.0.patch
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
From 1ae8667009e240a7c95a5c4d2a8a6fbbef9641fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 07:15:24 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.03.0 -> 2025.04.0

---
 meta/recipes-bsp/barebox/barebox-common.inc   |  4 +-
 meta/recipes-bsp/barebox/barebox-tools.bb     |  4 --
 ...ripts-dtc-clean-up-yamltree-from-dtc.patch | 60 -------------------
 3 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 7fd7a88d71..d6ea1eedfe 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.03.0"
+PV = "2025.04.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "0bf7118004e445bdd57feeef89ee9064982acc221e8a046c4a7994d3da6da2ec"
+SRC_URI[sha256sum] = "3124f3c2b69d9ce0512b2d40fa17cace9c356f65f005a63da0474387b8839c41"
diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index f6395beb7c..2a117bc9c0 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,10 +2,6 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
-SRC_URI += " \
-    file://0001-scripts-dtc-clean-up-yamltree-from-dtc.patch \
-"
-
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch b/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch
deleted file mode 100644
index fdab21ef72..0000000000
--- a/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 77afd065dc58e2f57066ef7f392c571f8136723d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 7 Apr 2025 14:45:27 +0000
-Subject: [PATCH] scripts/dtc: clean up yamltree from dtc
-
-Refer Linux commit [dt-bindings: kbuild: Use DTB files for validation][1],
-clean up yamltree from dtc to avoid compile failure while include <yaml.h>
-in non-standard path
-
-Since barebox actually doesn't do any dtb binding checks at the moment, just
-remove the test of /usr/include/yaml.h, hard-code the -DNO_YAML and remove
-yamltree.c from DTC_SOURCE
-
-[1] https://github.com/torvalds/linux/commit/ef8795f3f1ce
-
-Upstream-Status: Submitted [https://github.com/barebox/barebox/pull/37]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- scripts/dtc/Makefile             | 9 ---------
- scripts/dtc/update-dtc-source.sh | 2 +-
- 2 files changed, 1 insertion(+), 10 deletions(-)
-
-diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
-index 721e8e2b..da00319f 100644
---- a/scripts/dtc/Makefile
-+++ b/scripts/dtc/Makefile
-@@ -16,16 +16,7 @@ fdtget-objs    += fdtget.o $(libfdt-objs) util.o
- # Source files need to get at the userspace version of libfdt_env.h to compile
- HOST_EXTRACFLAGS += -I$(src)/libfdt
- 
--ifeq ($(wildcard /usr/include/yaml.h),)
--ifneq ($(CHECK_DTBS),)
--$(error dtc needs libyaml for DT schema validation support. \
--	Install the necessary libyaml development package.)
--endif
- HOST_EXTRACFLAGS += -DNO_YAML
--else
--dtc-objs	+= yamltree.o
--HOSTLDLIBS_dtc	:= -lyaml
--endif
- 
- # Generated files need one more search path to include headers in source tree
- HOSTCFLAGS_dtc-lexer.lex.o := -I$(src)
-diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
-index 141d3629..8aa5cd66 100755
---- a/scripts/dtc/update-dtc-source.sh
-+++ b/scripts/dtc/update-dtc-source.sh
-@@ -31,7 +31,7 @@ DTC_UPSTREAM_PATH=`pwd`/../dtc
- DTC_LINUX_PATH=`pwd`/scripts/dtc
- 
- DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
--		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c Makefile.dtc \
-+		srcpos.h treesource.c util.c util.h version_gen.h Makefile.dtc \
- 		dtc-lexer.l dtc-parser.y fdtget.c"
- LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
- 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
--- 
-2.48.1
-
-- 
2.47.1


--===============3998793665141708683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.03.0" to "2025.04.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.03.0" to "2025.04.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.03.0" to "2025.04.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.03.0" to "2025.04.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.03.0" to "2025.04.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.03.0" to "2025.04.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.03.0" to "2025.04.0"
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.03.0.tar.bz2 file://0001-scripts-dtc-clean-up-yamltree-from-dtc.patch" to "https://barebox.org/download/barebox-2025.04.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2025.03.0 [default] to 2025.04.0 [default]
packages/core2-64-poky-linux/barebox-tools: PV changed from "2025.03.0" to "2025.04.0"

--===============3998793665141708683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.03.0-2025.04.0.patch"

RnJvbSAxYWU4NjY3MDA5ZTI0MGE3Yzk1YTVjNGQyYThhNmZiYmVmOTY0MWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNzoxNToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4wMy4wIC0+IDIwMjUuMDQuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jICAgfCAgNCArLQogbWV0YS9yZWNp
cGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9vbHMuYmIgICAgIHwgIDQgLS0KIC4uLnJpcHRzLWR0
Yy1jbGVhbi11cC15YW1sdHJlZS1mcm9tLWR0Yy5wYXRjaCB8IDYwIC0tLS0tLS0tLS0tLS0tLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2NiBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvZmlsZXMvMDAwMS1zY3Jp
cHRzLWR0Yy1jbGVhbi11cC15YW1sdHJlZS1mcm9tLWR0Yy5wYXRjaAoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMt
YnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IDdmZDdhODhkNzEuLmQ2ZWExZWVk
ZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAt
Myw2ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAK
LVBWID0gIjIwMjUuMDMuMCIKK1BWID0gIjIwMjUuMDQuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9i
YXJlYm94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMGJmNzExODAwNGU0NDViZGQ1N2ZlZWVmODllZTkwNjQ5ODJhY2MyMjFlOGEwNDZj
NGE3OTk0ZDNkYTZkYTJlYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMTI0ZjNjMmI2OWQ5Y2Uw
NTEyYjJkNDBmYTE3Y2FjZTljMzU2ZjY1ZjAwNWE2M2RhMDQ3NDM4N2I4ODM5YzQxIgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9vbHMuYmIgYi9tZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC10b29scy5iYgppbmRleCBmNjM5NWJlYjdjLi4yYTEx
N2JjOWMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC10b29s
cy5iYgorKysgYi9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC10b29scy5iYgpAQCAt
MiwxMCArMiw2IEBAIFNVTU1BUlkgPSAiYmFyZWJveCBib290bG9hZGVyIHRvb2xzIgogCiByZXF1
aXJlIGJhcmVib3gtY29tbW9uLmluYwogCi1TUkNfVVJJICs9ICIgXAotICAgIGZpbGU6Ly8wMDAx
LXNjcmlwdHMtZHRjLWNsZWFuLXVwLXlhbWx0cmVlLWZyb20tZHRjLnBhdGNoIFwKLSIKLQogTElD
RU5TRSA9ICJHUEwtMi4wLW9ubHkiCiAKIERFUEVORFMgPSAiYmlzb24tbmF0aXZlIGZsZXgtbmF0
aXZlIGxpYnVzYjEiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvZmlsZXMv
MDAwMS1zY3JpcHRzLWR0Yy1jbGVhbi11cC15YW1sdHJlZS1mcm9tLWR0Yy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9maWxlcy8wMDAxLXNjcmlwdHMtZHRjLWNsZWFuLXVwLXlhbWx0
cmVlLWZyb20tZHRjLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmZGFiMjFl
ZjcyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9maWxlcy8wMDAx
LXNjcmlwdHMtZHRjLWNsZWFuLXVwLXlhbWx0cmVlLWZyb20tZHRjLnBhdGNoCisrKyAvZGV2L251
bGwKQEAgLTEsNjAgKzAsMCBAQAotRnJvbSA3N2FmZDA2NWRjNThlMmY1NzA2NmVmN2YzOTJjNTcx
ZjgxMzY3MjNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogSG9uZ3h1IEppYSA8aG9u
Z3h1LmppYUB3aW5kcml2ZXIuY29tPgotRGF0ZTogTW9uLCA3IEFwciAyMDI1IDE0OjQ1OjI3ICsw
MDAwCi1TdWJqZWN0OiBbUEFUQ0hdIHNjcmlwdHMvZHRjOiBjbGVhbiB1cCB5YW1sdHJlZSBmcm9t
IGR0YwotCi1SZWZlciBMaW51eCBjb21taXQgW2R0LWJpbmRpbmdzOiBrYnVpbGQ6IFVzZSBEVEIg
ZmlsZXMgZm9yIHZhbGlkYXRpb25dWzFdLAotY2xlYW4gdXAgeWFtbHRyZWUgZnJvbSBkdGMgdG8g
YXZvaWQgY29tcGlsZSBmYWlsdXJlIHdoaWxlIGluY2x1ZGUgPHlhbWwuaD4KLWluIG5vbi1zdGFu
ZGFyZCBwYXRoCi0KLVNpbmNlIGJhcmVib3ggYWN0dWFsbHkgZG9lc24ndCBkbyBhbnkgZHRiIGJp
bmRpbmcgY2hlY2tzIGF0IHRoZSBtb21lbnQsIGp1c3QKLXJlbW92ZSB0aGUgdGVzdCBvZiAvdXNy
L2luY2x1ZGUveWFtbC5oLCBoYXJkLWNvZGUgdGhlIC1ETk9fWUFNTCBhbmQgcmVtb3ZlCi15YW1s
dHJlZS5jIGZyb20gRFRDX1NPVVJDRQotCi1bMV0gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRz
L2xpbnV4L2NvbW1pdC9lZjg3OTVmM2YxY2UKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQg
W2h0dHBzOi8vZ2l0aHViLmNvbS9iYXJlYm94L2JhcmVib3gvcHVsbC8zN10KLQotU2lnbmVkLW9m
Zi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgotLS0tCi0gc2NyaXB0
cy9kdGMvTWFrZWZpbGUgICAgICAgICAgICAgfCA5IC0tLS0tLS0tLQotIHNjcmlwdHMvZHRjL3Vw
ZGF0ZS1kdGMtc291cmNlLnNoIHwgMiArLQotIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEwIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc2NyaXB0cy9kdGMvTWFrZWZpbGUg
Yi9zY3JpcHRzL2R0Yy9NYWtlZmlsZQotaW5kZXggNzIxZThlMmIuLmRhMDAzMTlmIDEwMDY0NAot
LS0tIGEvc2NyaXB0cy9kdGMvTWFrZWZpbGUKLSsrKyBiL3NjcmlwdHMvZHRjL01ha2VmaWxlCi1A
QCAtMTYsMTYgKzE2LDcgQEAgZmR0Z2V0LW9ianMgICAgKz0gZmR0Z2V0Lm8gJChsaWJmZHQtb2Jq
cykgdXRpbC5vCi0gIyBTb3VyY2UgZmlsZXMgbmVlZCB0byBnZXQgYXQgdGhlIHVzZXJzcGFjZSB2
ZXJzaW9uIG9mIGxpYmZkdF9lbnYuaCB0byBjb21waWxlCi0gSE9TVF9FWFRSQUNGTEFHUyArPSAt
SSQoc3JjKS9saWJmZHQKLSAKLS1pZmVxICgkKHdpbGRjYXJkIC91c3IvaW5jbHVkZS95YW1sLmgp
LCkKLS1pZm5lcSAoJChDSEVDS19EVEJTKSwpCi0tJChlcnJvciBkdGMgbmVlZHMgbGlieWFtbCBm
b3IgRFQgc2NoZW1hIHZhbGlkYXRpb24gc3VwcG9ydC4gXAotLQlJbnN0YWxsIHRoZSBuZWNlc3Nh
cnkgbGlieWFtbCBkZXZlbG9wbWVudCBwYWNrYWdlLikKLS1lbmRpZgotIEhPU1RfRVhUUkFDRkxB
R1MgKz0gLUROT19ZQU1MCi0tZWxzZQotLWR0Yy1vYmpzCSs9IHlhbWx0cmVlLm8KLS1IT1NUTERM
SUJTX2R0Ywk6PSAtbHlhbWwKLS1lbmRpZgotIAotICMgR2VuZXJhdGVkIGZpbGVzIG5lZWQgb25l
IG1vcmUgc2VhcmNoIHBhdGggdG8gaW5jbHVkZSBoZWFkZXJzIGluIHNvdXJjZSB0cmVlCi0gSE9T
VENGTEFHU19kdGMtbGV4ZXIubGV4Lm8gOj0gLUkkKHNyYykKLWRpZmYgLS1naXQgYS9zY3JpcHRz
L2R0Yy91cGRhdGUtZHRjLXNvdXJjZS5zaCBiL3NjcmlwdHMvZHRjL3VwZGF0ZS1kdGMtc291cmNl
LnNoCi1pbmRleCAxNDFkMzYyOS4uOGFhNWNkNjYgMTAwNzU1Ci0tLS0gYS9zY3JpcHRzL2R0Yy91
cGRhdGUtZHRjLXNvdXJjZS5zaAotKysrIGIvc2NyaXB0cy9kdGMvdXBkYXRlLWR0Yy1zb3VyY2Uu
c2gKLUBAIC0zMSw3ICszMSw3IEBAIERUQ19VUFNUUkVBTV9QQVRIPWBwd2RgLy4uL2R0YwotIERU
Q19MSU5VWF9QQVRIPWBwd2RgL3NjcmlwdHMvZHRjCi0gCi0gRFRDX1NPVVJDRT0iY2hlY2tzLmMg
ZGF0YS5jIGR0Yy5jIGR0Yy5oIGZsYXR0cmVlLmMgZnN0cmVlLmMgbGl2ZXRyZWUuYyBzcmNwb3Mu
YyBcCi0tCQlzcmNwb3MuaCB0cmVlc291cmNlLmMgdXRpbC5jIHV0aWwuaCB2ZXJzaW9uX2dlbi5o
IHlhbWx0cmVlLmMgTWFrZWZpbGUuZHRjIFwKLSsJCXNyY3Bvcy5oIHRyZWVzb3VyY2UuYyB1dGls
LmMgdXRpbC5oIHZlcnNpb25fZ2VuLmggTWFrZWZpbGUuZHRjIFwKLSAJCWR0Yy1sZXhlci5sIGR0
Yy1wYXJzZXIueSBmZHRnZXQuYyIKLSBMSUJGRFRfU09VUkNFPSJNYWtlZmlsZS5saWJmZHQgZmR0
LmMgZmR0LmggZmR0X2FkZHJlc3Nlcy5jIGZkdF9lbXB0eV90cmVlLmMgXAotIAkJZmR0X292ZXJs
YXkuYyBmZHRfcm8uYyBmZHRfcncuYyBmZHRfc3RyZXJyb3IuYyBmZHRfc3cuYyBcCi0tLSAKLTIu
NDguMQotCi0tIAoyLjQ3LjEKCg==

--===============3998793665141708683==--

