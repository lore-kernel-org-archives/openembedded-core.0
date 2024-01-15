Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6F2C4828F
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.88277.1705340029282008064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QXQNNPOF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bw3huPec;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d0e2fcd10-6d91cd9b-aadb-475a-bbb6-f91c7a00a793-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AacFmjs4Fw/iihiWuuJumvceLp4rI+75PdNlAMenK+g=;
	b=QXQNNPOFQQLG0p2eIS3sONqtGoudIoGXCGPFB5aAjFlmm8JwpVM+QlPpYwwetS42
	/M1EtjUCxlxoySlvTwtU5fVSWwKpant8og7LaP8ZqW6MZWg6iQrnKx7NHGFRzvYclKC
	H+MqPGL3Gk0691scMo5x9vr0pWXkIBm/bEgcwvic=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AacFmjs4Fw/iihiWuuJumvceLp4rI+75PdNlAMenK+g=;
	b=bw3huPecNkjxXJzMtg4el2Rq9n9ySiQj0oURKXbxfSgEDwP4xUtvUgwomBt+Kj76
	+Ot4i5K95VwLCMnR5PAm15zjcf8UBmiYxyTC/w6CDtwWq7am/GwNkJbUXhJjSYRp6tQ
	bwDBTl1U16P5nJ259XE8BU2Y6BTX2537+ATvHazM=
Content-Type: multipart/mixed; boundary="===============6777705268617923010=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cpio: upgrading to 2.15 SUCCEEDED
Message-ID: <0101018d0e2fcd10-6d91cd9b-aadb-475a-bbb6-f91c7a00a793-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193755

--===============6777705268617923010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cpio* to *2.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cpio-upgrade-2.14-2.15.patch
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
From 02c32b74b07a73c71465a2013c68b588a4ba9eae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 10:03:38 +0000
Subject: [PATCH] cpio: upgrade 2.14 -> 2.15

---
 .../cpio/{cpio_2.14.bb => cpio_2.15.bb}       |  3 +-
 ...e-needed-header-for-major-minor-macr.patch | 48 -------------------
 2 files changed, 1 insertion(+), 50 deletions(-)
 rename meta/recipes-extended/cpio/{cpio_2.14.bb => cpio_2.15.bb} (94%)
 delete mode 100644 meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
similarity index 94%
rename from meta/recipes-extended/cpio/cpio_2.14.bb
rename to meta/recipes-extended/cpio/cpio_2.15.bb
index 560038d2a6..55e9add5cd 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -7,12 +7,11 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-           file://0001-configure-Include-needed-header-for-major-minor-macr.patch \
            file://run-ptest \
            file://test.sh \
            "
 
-SRC_URI[sha256sum] = "145a340fd9d55f0b84779a44a12d5f79d77c99663967f8cfa168d7905ca52454"
+SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee4183455499e"
 
 inherit autotools gettext texinfo ptest
 
diff --git a/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch b/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
deleted file mode 100644
index 95ece0bbf3..0000000000
--- a/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8179be21e664cedb2e9d238cc2f6d04965e97275 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Thu, 11 May 2023 10:18:44 +0300
-Subject: [PATCH] configure: Include needed header for major/minor macros
-
-This helps in avoiding the warning about implicit function declaration
-which is elevated as error with newer compilers e.g. clang 16
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index de479e7..c601029 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,8 +43,22 @@ AC_TYPE_UID_T
- AC_CHECK_TYPE(gid_t, int)
- 
- AC_HEADER_DIRENT
--AX_COMPILE_CHECK_RETTYPE([major], [0])
--AX_COMPILE_CHECK_RETTYPE([minor], [0])
-+AX_COMPILE_CHECK_RETTYPE([major], [0], [
-+#include <sys/types.h>
-+#ifdef MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif])
-+AX_COMPILE_CHECK_RETTYPE([minor], [0], [
-+#include <sys/types.h>
-+#ifdef MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif])
- 
- AC_CHECK_FUNCS([fchmod fchown])
- # This is needed for mingw build
--- 
-2.34.1
-
-- 
2.42.0


--===============6777705268617923010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cpio/cpio-locale-da: PKGSIZE changed from 27611 to 31195 (+13%)
packages/core2-64-poky-linux/cpio/cpio-locale-de: PKGSIZE changed from 30096 to 33477 (+11%)
packages/core2-64-poky-linux/cpio/cpio-locale-ko: PKGSIZE changed from 30826 to 34250 (+11%)
packages/core2-64-poky-linux/cpio/cpio-locale-pl: PKGSIZE changed from 29735 to 33318 (+12%)
packages/core2-64-poky-linux/cpio/cpio-locale-ro: PKGSIZE changed from 31926 to 35904 (+12%)
packages/core2-64-poky-linux/cpio/cpio-locale-sr: PKGSIZE changed from 37941 to 42382 (+12%)
packages/core2-64-poky-linux/cpio/cpio-locale-zh-cn: PKGSIZE changed from 27031 to 30119 (+11%)
packages/core2-64-poky-linux/cpio: PACKAGES: added "cpio-locale-bg"

--===============6777705268617923010==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-cpio-upgrade-2.14-2.15.patch"

RnJvbSAwMmMzMmI3NGIwN2E3M2M3MTQ2NWEyMDEzYzY4YjU4OGE0YmE5ZWFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTA6MDM6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cGlvOiB1cGdyYWRlIDIuMTQgLT4gMi4xNQoKLS0tCiAuLi4vY3Bpby97Y3Bpb18yLjE0LmJiID0+
IGNwaW9fMi4xNS5iYn0gICAgICAgfCAgMyArLQogLi4uZS1uZWVkZWQtaGVhZGVyLWZvci1tYWpv
ci1taW5vci1tYWNyLnBhdGNoIHwgNDggLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2NwaW8ve2NwaW9fMi4xNC5iYiA9PiBjcGlvXzIuMTUuYmJ9ICg5NCUpCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2NwaW8vZmlsZXMvMDAwMS1jb25m
aWd1cmUtSW5jbHVkZS1uZWVkZWQtaGVhZGVyLWZvci1tYWpvci1taW5vci1tYWNyLnBhdGNoCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2NwaW8vY3Bpb18yLjE0LmJiIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2NwaW8vY3Bpb18yLjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jcGlvL2NwaW9fMi4xNC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2NwaW8vY3Bpb18yLjE1LmJiCmluZGV4IDU2MDAz
OGQyYTYuLjU1ZTlhZGQ1Y2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcGlv
L2NwaW9fMi4xNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Bpby9jcGlvXzIuMTUu
YmIKQEAgLTcsMTIgKzcsMTEgQEAgTElDRU5TRSA9ICJHUEwtMy4wLW9ubHkiCiBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1mMjdkZWZlMWU5NmMyZTFlY2Q0ZTBjOWJlODk2
Nzk0OSIKIAogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2NwaW8vY3Bpby0ke1BWfS50YXIuZ3og
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtSW5jbHVkZS1uZWVkZWQtaGVhZGVy
LWZvci1tYWpvci1taW5vci1tYWNyLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVz
dCBcCiAgICAgICAgICAgIGZpbGU6Ly90ZXN0LnNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMTQ1YTM0MGZkOWQ1NWYwYjg0Nzc5YTQ0YTEyZDVmNzlkNzdjOTk2NjM5
NjdmOGNmYTE2OGQ3OTA1Y2E1MjQ1NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZmE1MGVmOTgz
MTM3ZWVmYzBhMDJmZGI1MTUwOWQ2MjRiNWUzMjk1Yzk4MGFhMTI3Y2VlZTQxODM0NTU0OTllIgog
CiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0IHRleGluZm8gcHRlc3QKIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2NwaW8vZmlsZXMvMDAwMS1jb25maWd1cmUtSW5jbHVkZS1u
ZWVkZWQtaGVhZGVyLWZvci1tYWpvci1taW5vci1tYWNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2NwaW8vZmlsZXMvMDAwMS1jb25maWd1cmUtSW5jbHVkZS1uZWVkZWQtaGVhZGVyLWZv
ci1tYWpvci1taW5vci1tYWNyLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5
NWVjZTBiYmYzLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcGlvL2Zp
bGVzLzAwMDEtY29uZmlndXJlLUluY2x1ZGUtbmVlZGVkLWhlYWRlci1mb3ItbWFqb3ItbWlub3It
bWFjci5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ4ICswLDAgQEAKLUZyb20gODE3OWJlMjFl
NjY0Y2VkYjJlOWQyMzhjYzJmNmQwNDk2NWU5NzI3NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IFNlcmdleSBQb3pueWFrb2ZmIDxncmF5QGdudS5vcmc+Ci1EYXRlOiBUaHUsIDExIE1h
eSAyMDIzIDEwOjE4OjQ0ICswMzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogSW5jbHVk
ZSBuZWVkZWQgaGVhZGVyIGZvciBtYWpvci9taW5vciBtYWNyb3MKLQotVGhpcyBoZWxwcyBpbiBh
dm9pZGluZyB0aGUgd2FybmluZyBhYm91dCBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlvbgot
d2hpY2ggaXMgZWxldmF0ZWQgYXMgZXJyb3Igd2l0aCBuZXdlciBjb21waWxlcnMgZS5nLiBjbGFu
ZyAxNgotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotCi1V
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIGNvbmZpZ3VyZS5hYyB8IDE4ICsrKysrKysrKysrKysr
KystLQotIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQot
Ci1kaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBkZTQ3OWU3
Li5jNjAxMDI5IDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25maWd1cmUuYWMK
LUBAIC00Myw4ICs0MywyMiBAQCBBQ19UWVBFX1VJRF9UCi0gQUNfQ0hFQ0tfVFlQRShnaWRfdCwg
aW50KQotIAotIEFDX0hFQURFUl9ESVJFTlQKLS1BWF9DT01QSUxFX0NIRUNLX1JFVFRZUEUoW21h
am9yXSwgWzBdKQotLUFYX0NPTVBJTEVfQ0hFQ0tfUkVUVFlQRShbbWlub3JdLCBbMF0pCi0rQVhf
Q09NUElMRV9DSEVDS19SRVRUWVBFKFttYWpvcl0sIFswXSwgWwotKyNpbmNsdWRlIDxzeXMvdHlw
ZXMuaD4KLSsjaWZkZWYgTUFKT1JfSU5fTUtERVYKLSsjIGluY2x1ZGUgPHN5cy9ta2Rldi5oPgot
KyNlbmRpZgotKyNpZmRlZiBNQUpPUl9JTl9TWVNNQUNST1MKLSsjIGluY2x1ZGUgPHN5cy9zeXNt
YWNyb3MuaD4KLSsjZW5kaWZdKQotK0FYX0NPTVBJTEVfQ0hFQ0tfUkVUVFlQRShbbWlub3JdLCBb
MF0sIFsKLSsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Ci0rI2lmZGVmIE1BSk9SX0lOX01LREVWCi0r
IyBpbmNsdWRlIDxzeXMvbWtkZXYuaD4KLSsjZW5kaWYKLSsjaWZkZWYgTUFKT1JfSU5fU1lTTUFD
Uk9TCi0rIyBpbmNsdWRlIDxzeXMvc3lzbWFjcm9zLmg+Ci0rI2VuZGlmXSkKLSAKLSBBQ19DSEVD
S19GVU5DUyhbZmNobW9kIGZjaG93bl0pCi0gIyBUaGlzIGlzIG5lZWRlZCBmb3IgbWluZ3cgYnVp
bGQKLS0tIAotMi4zNC4xCi0KLS0gCjIuNDIuMAoK

--===============6777705268617923010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cpio/cpio-dbg: PKGSIZE changed from 1126048 to 1134864 (+1%)
packages/core2-64-poky-linux/cpio/cpio-dbg: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-dbg: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-dev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-dev: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-doc: PKGSIZE changed from 51057 to 51061 (+0%)
packages/core2-64-poky-linux/cpio/cpio-doc: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-doc: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-da: PKGSIZE changed from 27611 to 31195 (+13%)
packages/core2-64-poky-linux/cpio/cpio-locale-da: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-da: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-de: PKGSIZE changed from 30096 to 33477 (+11%)
packages/core2-64-poky-linux/cpio/cpio-locale-de: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-de: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-es: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-es: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-fi: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-fi: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-fr: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-fr: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-ga: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-ga: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-gl: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-gl: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-hr: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-hr: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-hu: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-hu: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-id: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-id: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-it: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-it: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-ja: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-ja: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-ka: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-ka: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-ko: PKGSIZE changed from 30826 to 34250 (+11%)
packages/core2-64-poky-linux/cpio/cpio-locale-ko: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-ko: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-nl: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-nl: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-pl: PKGSIZE changed from 29735 to 33318 (+12%)
packages/core2-64-poky-linux/cpio/cpio-locale-pl: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-pl: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-pt-br: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-pt-br: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-pt: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-pt: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-ro: PKGSIZE changed from 31926 to 35904 (+12%)
packages/core2-64-poky-linux/cpio/cpio-locale-ro: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-ro: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-ru: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-ru: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-sr: PKGSIZE changed from 37941 to 42382 (+12%)
packages/core2-64-poky-linux/cpio/cpio-locale-sr: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-sr: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-sv: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-sv: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-tr: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-tr: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-uk: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-uk: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-vi: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-vi: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-zh-cn: PKGSIZE changed from 27031 to 30119 (+11%)
packages/core2-64-poky-linux/cpio/cpio-locale-zh-cn: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-zh-cn: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-locale-zh-tw: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-locale-zh-tw: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-ptest: PKGSIZE changed from 200492 to 206377 (+3%)
packages/core2-64-poky-linux/cpio/cpio-ptest: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-ptest: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-rmt: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-rmt: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-src: PKGSIZE changed from 1620036 to 1753690 (+8%)
packages/core2-64-poky-linux/cpio/cpio-src: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-src: FILELIST: directory renamed /usr/src/debug/cpio/2.14/lib -> /usr/src/debug/cpio/2.15/lib, directory renamed /usr/src/debug/cpio/2.14/tests -> /usr/src/debug/cpio/2.15/tests, directory renamed /usr/src/debug/cpio/2.14/src -> /usr/src/debug/cpio/2.15/src, directory renamed /usr/src/debug/cpio/2.14/rmt -> /usr/src/debug/cpio/2.15/rmt, removed "/usr/src/debug/cpio/2.14/gnu/full-write.c /usr/src/debug/cpio/2.14/gnu/xalloc-die.c /usr/src/debug/cpio/2.14/gnu/sys-limits.h /usr/src/debug/cpio/2.14/gnu/full-write.h /usr/src/debug/cpio/2.14/gnu/argp-pv.c /usr/src/debug/cpio/2.14/gnu/xmalloc.c /usr/src/debug/cpio/2.14/gnu/unistd.h /usr/src/debug/cpio/2.14/gnu/strnlen1.c /usr/src/debug/cpio/2.14/gnu/strnlen1.h /usr/src/debug/cpio/2.14/gnu/closeout.h /usr/src/debug/cpio/2.14/gnu/closeout.c /usr/src/debug/cpio/2.14/gnu/quote.h /usr/src/debug/cpio/2.14/gnu/argp-version-etc.c /usr/src/debug/cpio/2.14/gnu/mbrtowc.c /usr/src/debug/cpio/2.14/gnu/dirent.h /usr/
 src/debug/cpio/2.14/gnu/argp-version-etc.h /usr/src/debug/cpio/2.14/gnu/stripslash.c /usr/src/debug/cpio/2.14/gnu/argp-pvh.c /usr/src/debug/cpio/2.14/gnu/progname.c /usr/src/debug/cpio/2.14/gnu/argp.h /usr/src/debug/cpio/2.14/gnu/progname.h /usr/src/debug/cpio/2.14/gnu/c-strcase.h /usr/src/debug/cpio/2.14/gnu/anytostr.c /usr/src/debug/cpio/2.14/gnu/safe-write.h /usr/src/debug/cpio/2.14/gnu/argmatch.c /usr/src/debug/cpio/2.14/gnu/inttostr.h /usr/src/debug/cpio/2.14/gnu/getopt1.c /usr/src/debug/cpio/2.14/gnu/argmatch.h /usr/src/debug/cpio/2.14/gnu/strftime.h /usr/src/debug/cpio/2.14/gnu/gettime.c /usr/src/debug/cpio/2.14/gnu/xgetcwd.c /usr/src/debug/cpio/2.14/gnu/ialloc.h /usr/src/debug/cpio/2.14/gnu/dirname.c /usr/src/debug/cpio/2.14/gnu/xalloc.h /usr/src/debug/cpio/2.14/gnu/xgetcwd.h /usr/src/debug/cpio/2.14/gnu/dirname.h /usr/src/debug/cpio/2.14/gnu/strtol.c /usr/src/debug/cpio/2.14/gnu/argp-help.c /usr/src/debug/cpio/2.14/gnu/hash.c /usr/src/debug/cpio/2.14/gnu/c-ctype.h /usr/src/
 debug/cpio/2.14/gnu/hash.h /usr/src/debug/cpio/2.14/gnu/getopt-core.h /usr/src/debug/cpio/2.14/gnu/getopt-ext.h /usr/src/debug/cpio/2.14/gnu/getopt_int.h /usr/src/debug/cpio/2.14/gnu/mbsrtowcs-impl.h /usr/src/debug/cpio/2.14/gnu/exitfail.c /usr/src/debug/cpio/2.14/gnu/exitfail.h /usr/src/debug/cpio/2.14/gnu/mbsrtowcs.c /usr/src/debug/cpio/2.14/gnu/mbsrtowcs-state.c /usr/src/debug/cpio/2.14/gnu/stdlib.h /usr/src/debug/cpio/2.14/gnu/parse-datetime.y /usr/src/debug/cpio/2.14/gnu/parse-datetime.c /usr/src/debug/cpio/2.14/gnu/parse-datetime.h /usr/src/debug/cpio/2.14/gnu/basename-lgpl.h /usr/src/debug/cpio/2.14/gnu/argp-eexst.c /usr/src/debug/cpio/2.14/gnu/argp-parse.c /usr/src/debug/cpio/2.14/gnu/basename-lgpl.c /usr/src/debug/cpio/2.14/gnu/time.h /usr/src/debug/cpio/2.14/gnu/obstack.c /usr/src/debug/cpio/2.14/gnu/obstack.h /usr/src/debug/cpio/2.14/gnu/safe-read.h /usr/src/debug/cpio/2.14/gnu/idx.h /usr/src/debug/cpio/2.14/gnu/safe-read.c /usr/src/debug/cpio/2.14/gnu/btowc.c /usr/src/de
 bug/cpio/2.14/gnu/fnmatch.c /usr/src/debug/cpio/2.14/gnu/time-internal.h /usr/src/debug/cpio/2.14/gnu/fnmatch.h /usr/src/debug/cpio/2.14/gnu/c-strcaseeq.h /usr/src/debug/cpio/2.14/gnu/close-stream.c /usr/src/debug/cpio/2.14/gnu/getcwd.c /usr/src/debug/cpio/2.14/gnu/quotearg.h /usr/src/debug/cpio/2.14/gnu/quotearg.c /usr/src/debug/cpio/2.14/gnu/close-stream.h /usr/src/debug/cpio/2.14/gnu/memchr.c /usr/src/debug/cpio/2.14/gnu/bitrotate.h /usr/src/debug/cpio/2.14/gnu/version-etc-fsf.c /usr/src/debug/cpio/2.14/gnu/hard-locale.h /usr/src/debug/cpio/2.14/gnu/setlocale_null.c /usr/src/debug/cpio/2.14/gnu/setlocale_null.h /usr/src/debug/cpio/2.14/gnu/hard-locale.c /usr/src/debug/cpio/2.14/gnu/time_rz.c /usr/src/debug/cpio/2.14/gnu/argp-fmtstream.h /usr/src/debug/cpio/2.14/gnu/fnmatch_loop.c /usr/src/debug/cpio/2.14/gnu/argp-fmtstream.c /usr/src/debug/cpio/2.14/gnu/timespec.h /usr/src/debug/cpio/2.14/gnu/string.h /usr/src/debug/cpio/2.14/gnu/dirname-lgpl.c /usr/src/debug/cpio/2.14/gnu/getopt
 .c /usr/src/debug/cpio/2.14/gnu/stat-time.h /usr/src/debug/cpio/2.14/gnu/localcharset.c /usr/src/debug/cpio/2.14/gnu/localcharset.h /usr/src/debug/cpio/2.14/gnu/version-etc.h /usr/src/debug/cpio/2.14/gnu/utimens.c /usr/src/debug/cpio/2.14/gnu/wchar.h /usr/src/debug/cpio/2.14/gnu/version-etc.c /usr/src/debug/cpio/2.14/gnu/utimens.h", added "/usr/src/debug/cpio/2.15/gnu/full-write.c /usr/src/debug/cpio/2.15/gnu/xalloc-die.c /usr/src/debug/cpio/2.15/gnu/sys-limits.h /usr/src/debug/cpio/2.15/gnu/mbrtoc32.c /usr/src/debug/cpio/2.15/gnu/full-write.h /usr/src/debug/cpio/2.15/gnu/argp-pv.c /usr/src/debug/cpio/2.15/gnu/xmalloc.c /usr/src/debug/cpio/2.15/gnu/unistd.h /usr/src/debug/cpio/2.15/gnu/strnlen1.c /usr/src/debug/cpio/2.15/gnu/strnlen1.h /usr/src/debug/cpio/2.15/gnu/closeout.h /usr/src/debug/cpio/2.15/gnu/closeout.c /usr/src/debug/cpio/2.15/gnu/quote.h /usr/src/debug/cpio/2.15/gnu/argp-version-etc.c /usr/src/debug/cpio/2.15/gnu/mbrtowc.c /usr/src/debug/cpio/2.15/gnu/dirent.h /usr/src/
 debug/cpio/2.15/gnu/argp-version-etc.h /usr/src/debug/cpio/2.15/gnu/stripslash.c /usr/src/debug/cpio/2.15/gnu/argp-pvh.c /usr/src/debug/cpio/2.15/gnu/progname.c /usr/src/debug/cpio/2.15/gnu/argp.h /usr/src/debug/cpio/2.15/gnu/fdutimensat.c /usr/src/debug/cpio/2.15/gnu/progname.h /usr/src/debug/cpio/2.15/gnu/c-strcase.h /usr/src/debug/cpio/2.15/gnu/anytostr.c /usr/src/debug/cpio/2.15/gnu/safe-write.h /usr/src/debug/cpio/2.15/gnu/futimens.c /usr/src/debug/cpio/2.15/gnu/argmatch.c /usr/src/debug/cpio/2.15/gnu/inttostr.h /usr/src/debug/cpio/2.15/gnu/getopt1.c /usr/src/debug/cpio/2.15/gnu/argmatch.h /usr/src/debug/cpio/2.15/gnu/strftime.h /usr/src/debug/cpio/2.15/gnu/uchar.h /usr/src/debug/cpio/2.15/gnu/gettime.c /usr/src/debug/cpio/2.15/gnu/xgetcwd.c /usr/src/debug/cpio/2.15/gnu/ialloc.h /usr/src/debug/cpio/2.15/gnu/dirname.c /usr/src/debug/cpio/2.15/gnu/xalloc.h /usr/src/debug/cpio/2.15/gnu/xgetcwd.h /usr/src/debug/cpio/2.15/gnu/dirname.h /usr/src/debug/cpio/2.15/gnu/strtol.c /usr/src/
 debug/cpio/2.15/gnu/argp-help.c /usr/src/debug/cpio/2.15/gnu/hash.c /usr/src/debug/cpio/2.15/gnu/c-ctype.h /usr/src/debug/cpio/2.15/gnu/hash.h /usr/src/debug/cpio/2.15/gnu/getopt-core.h /usr/src/debug/cpio/2.15/gnu/getopt-ext.h /usr/src/debug/cpio/2.15/gnu/getopt_int.h /usr/src/debug/cpio/2.15/gnu/mbsrtowcs-impl.h /usr/src/debug/cpio/2.15/gnu/exitfail.c /usr/src/debug/cpio/2.15/gnu/exitfail.h /usr/src/debug/cpio/2.15/gnu/mbsrtowcs.c /usr/src/debug/cpio/2.15/gnu/mbsrtowcs-state.c /usr/src/debug/cpio/2.15/gnu/stdlib.h /usr/src/debug/cpio/2.15/gnu/parse-datetime.y /usr/src/debug/cpio/2.15/gnu/parse-datetime.c /usr/src/debug/cpio/2.15/gnu/parse-datetime.h /usr/src/debug/cpio/2.15/gnu/basename-lgpl.h /usr/src/debug/cpio/2.15/gnu/argp-eexst.c /usr/src/debug/cpio/2.15/gnu/argp-parse.c /usr/src/debug/cpio/2.15/gnu/basename-lgpl.c /usr/src/debug/cpio/2.15/gnu/time.h /usr/src/debug/cpio/2.15/gnu/obstack.c /usr/src/debug/cpio/2.15/gnu/sys/stat.h /usr/src/debug/cpio/2.15/gnu/obstack.h /usr/src/
 debug/cpio/2.15/gnu/safe-read.h /usr/src/debug/cpio/2.15/gnu/idx.h /usr/src/debug/cpio/2.15/gnu/safe-read.c /usr/src/debug/cpio/2.15/gnu/btowc.c /usr/src/debug/cpio/2.15/gnu/fnmatch.c /usr/src/debug/cpio/2.15/gnu/time-internal.h /usr/src/debug/cpio/2.15/gnu/fnmatch.h /usr/src/debug/cpio/2.15/gnu/c-strcaseeq.h /usr/src/debug/cpio/2.15/gnu/quotearg.h /usr/src/debug/cpio/2.15/gnu/close-stream.c /usr/src/debug/cpio/2.15/gnu/getcwd.c /usr/src/debug/cpio/2.15/gnu/quotearg.c /usr/src/debug/cpio/2.15/gnu/close-stream.h /usr/src/debug/cpio/2.15/gnu/memchr.c /usr/src/debug/cpio/2.15/gnu/bitrotate.h /usr/src/debug/cpio/2.15/gnu/version-etc-fsf.c /usr/src/debug/cpio/2.15/gnu/hard-locale.h /usr/src/debug/cpio/2.15/gnu/setlocale_null.c /usr/src/debug/cpio/2.15/gnu/setlocale_null.h /usr/src/debug/cpio/2.15/gnu/hard-locale.c /usr/src/debug/cpio/2.15/gnu/time_rz.c /usr/src/debug/cpio/2.15/gnu/argp-fmtstream.h /usr/src/debug/cpio/2.15/gnu/fnmatch_loop.c /usr/src/debug/cpio/2.15/gnu/argp-fmtstream.c /
 usr/src/debug/cpio/2.15/gnu/timespec.h /usr/src/debug/cpio/2.15/gnu/string.h /usr/src/debug/cpio/2.15/gnu/dirname-lgpl.c /usr/src/debug/cpio/2.15/gnu/getopt.c /usr/src/debug/cpio/2.15/gnu/stat-time.h /usr/src/debug/cpio/2.15/gnu/localcharset.c /usr/src/debug/cpio/2.15/gnu/localcharset.h /usr/src/debug/cpio/2.15/gnu/version-etc.h /usr/src/debug/cpio/2.15/gnu/utimens.c /usr/src/debug/cpio/2.15/gnu/wchar.h /usr/src/debug/cpio/2.15/gnu/version-etc.c /usr/src/debug/cpio/2.15/gnu/utimens.h"
packages/core2-64-poky-linux/cpio/cpio-src: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio-staticdev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio-staticdev: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio/cpio: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio/cpio: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/cpio: SRC_URI changed from "https://ftp.gnu.org/gnu/cpio/cpio-2.14.tar.gz file://0001-configure-Include-needed-header-for-major-minor-macr.patch file://run-ptest file://test.sh" to "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz file://run-ptest file://test.sh"
packages/core2-64-poky-linux/cpio: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/cpio: PACKAGES: added "cpio-locale-bg"
packages/core2-64-poky-linux/cpio: PV changed from "2.14" to "2.15"

--===============6777705268617923010==--

