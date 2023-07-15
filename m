Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C673C0015E
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.5932.1689456452991123417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LZvNsDGB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101895b73a212-499ac0e5-1b91-4700-8043-70d11e15eb1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456452;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/hb/QMNUYosQAC6Qo4t/yeKucLDkV2NLwF4ZOQSAYiA=;
	b=LZvNsDGBY0wjLskzo1llXvW43ct7w0m8zFCI/mxPoIIXt7OXR3Ybw+PLVkiqLq/y
	81UxVgztQgUcAO0XuAxDP1YN6yJmG50br8HDFV7Jo/pUzvCc//WepICTyiYP95pQDEp
	fuzk6UIs3i+G/5JLl4E4Q3dzzzxTbkxw0uYnmJZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456452;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/hb/QMNUYosQAC6Qo4t/yeKucLDkV2NLwF4ZOQSAYiA=;
	b=pWaSFIb2+nHV9qyT4lfva2Tkz+/ncCYsEydHlKJ0xDU0i8jFA3M8a1/Vk5iTwAC+
	texVWHrPuwtWQ74zl1HHbO1IQ46dOKswObgmPwi/GBCzEnFB7F7+rJzLvDPyOi9N/Nv
	5Apu4CHgpsbTsdy6lzQhImz/m6IZKSlS3ukoHrMY=
Content-Type: multipart/mixed; boundary="===============8478944402884889954=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools: upgrading to 2023.07.02 FAILED
Message-ID: <010101895b73a212-499ac0e5-1b91-4700-8043-70d11e15eb1d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184313

--===============8478944402884889954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot-tools* to *2023.07.02* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-u-boot-tools-upgrade-2023.04-2023.07.02.patch
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
From 6692ed427106130d6283f7c1c7b86c89a1c730ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 06:01:51 +0000
Subject: [PATCH] u-boot-tools: upgrade 2023.04 -> 2023.07.02

---
 ...mkimage-Use-PATH_MAX-for-path-length.patch | 40 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 ..._2023.04.bb => u-boot-tools_2023.07.02.bb} |  4 +-
 3 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2023.04.bb => u-boot-tools_2023.07.02.bb} (36%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch b/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
deleted file mode 100644
index 5c6708e666..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From dcd3d272975863128e25a4e25453cb6521cddc53 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 14 Jun 2023 16:09:59 +0800
-Subject: [PATCH] mkimage: Use PATH_MAX for path length
-
-Fixed when build xilinx_zynqmp in long directory ( >256):
-  |  /buildarea1/testtest/wr_build/wr1023test_secureboot/test1-what/test2-what/test3-what/test4-what/test5-what/test6-what/test7-what/test8-what/test9-what/test10-what/test11-what/test12-what/build/tmp-glibc/work/xilinx_zynqmp-wrs-linux/u-boot-xlnx/1_v2023.01-xilinx-v2023.1+gitAUTOINC+40a08d69e7-r0/build/fitImage-linux: Image file name (uboot-mkimage) too long, can't create tmpfile.
-  | Error: Bad parameters for FIT image type
-
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/99d430f344bfdb0641022fd3efa26c29c957df02]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tools/mkimage.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/mkimage.h b/tools/mkimage.h
-index f5ca65e2ed..d92a3ff811 100644
---- a/tools/mkimage.h
-+++ b/tools/mkimage.h
-@@ -17,6 +17,7 @@
- #include <sys/stat.h>
- #include <time.h>
- #include <unistd.h>
-+#include <limits.h>
- #include <u-boot/sha1.h>
- #include "fdt_host.h"
- #include "imagetool.h"
-@@ -44,7 +45,7 @@ static inline ulong map_to_sysmem(void *ptr)
- #define ALLOC_CACHE_ALIGN_BUFFER(type, name, size) type name[size]
- 
- #define MKIMAGE_TMPFILE_SUFFIX		".tmp"
--#define MKIMAGE_MAX_TMPFILE_LEN		256
-+#define MKIMAGE_MAX_TMPFILE_LEN		PATH_MAX
- #define MKIMAGE_DEFAULT_DTC_OPTIONS	"-I dts -O dtb -p 500"
- #define MKIMAGE_MAX_DTC_CMDLINE_LEN	2 * MKIMAGE_MAX_TMPFILE_LEN + 35
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8a2e9aef94..df20bc8159 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "fd4ed6b7e83ec3aea9a2ce21baea8ca9676f40dd"
+SRCREV = "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
similarity index 36%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
index b77a49af87..3ad1ae096a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
@@ -1,6 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
 
-SRC_URI += " \
-    file://0001-mkimage-Use-PATH_MAX-for-path-length.patch \
-"
+SRC_URI += " git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=u-boot-2023.07.y"
-- 
2.39.2


--===============8478944402884889954==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-tools-upgrade-2023.04-2023.07.02.patch"

RnJvbSA2NjkyZWQ0MjcxMDYxMzBkNjI4M2Y3YzFjN2I4NmM4OWExYzczMGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMDY6MDE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
LWJvb3QtdG9vbHM6IHVwZ3JhZGUgMjAyMy4wNCAtPiAyMDIzLjA3LjAyCgotLS0KIC4uLm1raW1h
Z2UtVXNlLVBBVEhfTUFYLWZvci1wYXRoLWxlbmd0aC5wYXRjaCB8IDQwIC0tLS0tLS0tLS0tLS0t
LS0tLS0KIG1ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jICAgICB8ICAy
ICstCiAuLi5fMjAyMy4wNC5iYiA9PiB1LWJvb3QtdG9vbHNfMjAyMy4wNy4wMi5iYn0gfCAgNCAr
LQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ic3AvdS1ib290L2ZpbGVzLzAwMDEtbWtpbWFn
ZS1Vc2UtUEFUSF9NQVgtZm9yLXBhdGgtbGVuZ3RoLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWJzcC91LWJvb3Qve3UtYm9vdC10b29sc18yMDIzLjA0LmJiID0+IHUtYm9vdC10b29sc18yMDIz
LjA3LjAyLmJifSAoMzYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L2Zp
bGVzLzAwMDEtbWtpbWFnZS1Vc2UtUEFUSF9NQVgtZm9yLXBhdGgtbGVuZ3RoLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWJzcC91LWJvb3QvZmlsZXMvMDAwMS1ta2ltYWdlLVVzZS1QQVRIX01BWC1mb3It
cGF0aC1sZW5ndGgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDVjNjcwOGU2
NjYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvZmlsZXMvMDAwMS1t
a2ltYWdlLVVzZS1QQVRIX01BWC1mb3ItcGF0aC1sZW5ndGgucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSw0MCArMCwwIEBACi1Gcm9tIGRjZDNkMjcyOTc1ODYzMTI4ZTI1YTRlMjU0NTNjYjY1MjFj
ZGRjNTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55
dUB3aW5kcml2ZXIuY29tPgotRGF0ZTogV2VkLCAxNCBKdW4gMjAyMyAxNjowOTo1OSArMDgwMAot
U3ViamVjdDogW1BBVENIXSBta2ltYWdlOiBVc2UgUEFUSF9NQVggZm9yIHBhdGggbGVuZ3RoCi0K
LUZpeGVkIHdoZW4gYnVpbGQgeGlsaW54X3p5bnFtcCBpbiBsb25nIGRpcmVjdG9yeSAoID4yNTYp
OgotICB8ICAvYnVpbGRhcmVhMS90ZXN0dGVzdC93cl9idWlsZC93cjEwMjN0ZXN0X3NlY3VyZWJv
b3QvdGVzdDEtd2hhdC90ZXN0Mi13aGF0L3Rlc3QzLXdoYXQvdGVzdDQtd2hhdC90ZXN0NS13aGF0
L3Rlc3Q2LXdoYXQvdGVzdDctd2hhdC90ZXN0OC13aGF0L3Rlc3Q5LXdoYXQvdGVzdDEwLXdoYXQv
dGVzdDExLXdoYXQvdGVzdDEyLXdoYXQvYnVpbGQvdG1wLWdsaWJjL3dvcmsveGlsaW54X3p5bnFt
cC13cnMtbGludXgvdS1ib290LXhsbngvMV92MjAyMy4wMS14aWxpbngtdjIwMjMuMStnaXRBVVRP
SU5DKzQwYTA4ZDY5ZTctcjAvYnVpbGQvZml0SW1hZ2UtbGludXg6IEltYWdlIGZpbGUgbmFtZSAo
dWJvb3QtbWtpbWFnZSkgdG9vIGxvbmcsIGNhbid0IGNyZWF0ZSB0bXBmaWxlLgotICB8IEVycm9y
OiBCYWQgcGFyYW1ldGVycyBmb3IgRklUIGltYWdlIHR5cGUKLQotVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydCBbaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vY29tbWl0Lzk5
ZDQzMGYzNDRiZmRiMDY0MTAyMmZkM2VmYTI2YzI5Yzk1N2RmMDJdCi0KLVNpZ25lZC1vZmYtYnk6
IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+Ci0tLS0KLSB0b29scy9ta2ltYWdl
LmggfCAzICsrLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKLQotZGlmZiAtLWdpdCBhL3Rvb2xzL21raW1hZ2UuaCBiL3Rvb2xzL21raW1hZ2UuaAotaW5k
ZXggZjVjYTY1ZTJlZC4uZDkyYTNmZjgxMSAxMDA2NDQKLS0tLSBhL3Rvb2xzL21raW1hZ2UuaAot
KysrIGIvdG9vbHMvbWtpbWFnZS5oCi1AQCAtMTcsNiArMTcsNyBAQAotICNpbmNsdWRlIDxzeXMv
c3RhdC5oPgotICNpbmNsdWRlIDx0aW1lLmg+Ci0gI2luY2x1ZGUgPHVuaXN0ZC5oPgotKyNpbmNs
dWRlIDxsaW1pdHMuaD4KLSAjaW5jbHVkZSA8dS1ib290L3NoYTEuaD4KLSAjaW5jbHVkZSAiZmR0
X2hvc3QuaCIKLSAjaW5jbHVkZSAiaW1hZ2V0b29sLmgiCi1AQCAtNDQsNyArNDUsNyBAQCBzdGF0
aWMgaW5saW5lIHVsb25nIG1hcF90b19zeXNtZW0odm9pZCAqcHRyKQotICNkZWZpbmUgQUxMT0Nf
Q0FDSEVfQUxJR05fQlVGRkVSKHR5cGUsIG5hbWUsIHNpemUpIHR5cGUgbmFtZVtzaXplXQotIAot
ICNkZWZpbmUgTUtJTUFHRV9UTVBGSUxFX1NVRkZJWAkJIi50bXAiCi0tI2RlZmluZSBNS0lNQUdF
X01BWF9UTVBGSUxFX0xFTgkJMjU2Ci0rI2RlZmluZSBNS0lNQUdFX01BWF9UTVBGSUxFX0xFTgkJ
UEFUSF9NQVgKLSAjZGVmaW5lIE1LSU1BR0VfREVGQVVMVF9EVENfT1BUSU9OUwkiLUkgZHRzIC1P
IGR0YiAtcCA1MDAiCi0gI2RlZmluZSBNS0lNQUdFX01BWF9EVENfQ01ETElORV9MRU4JMiAqIE1L
SU1BR0VfTUFYX1RNUEZJTEVfTEVOICsgMzUKLSAKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVz
LWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKaW5kZXggOGEyZTlhZWY5NC4uZGYyMGJjODE1
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKQEAgLTEyLDcg
KzEyLDcgQEAgUEUgPSAiMSIKIAogIyBXZSB1c2UgdGhlIHJldmlzaW9uIGluIG9yZGVyIHRvIGF2
b2lkIGhhdmluZyB0byBmZXRjaCBpdCBmcm9tIHRoZQogIyByZXBvIGR1cmluZyBwYXJzZQotU1JD
UkVWID0gImZkNGVkNmI3ZTgzZWMzYWVhOWEyY2UyMWJhZWE4Y2E5Njc2ZjQwZGQiCitTUkNSRVYg
PSAiODNjZGFiOGIyYzZlYTBmYzA4NjBmODQ0NGQwODMzNTNiNDdmMWQ1YyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290LmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFzdGVyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJv
b3QtdG9vbHNfMjAyMy4wNC5iYiBiL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29s
c18yMDIzLjA3LjAyLmJiCnNpbWlsYXJpdHkgaW5kZXggMzYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29sc18yMDIzLjA0LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtdG9vbHNfMjAyMy4wNy4wMi5iYgppbmRleCBiNzdhNDlh
Zjg3Li4zYWQxYWUwOTZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJv
b3QtdG9vbHNfMjAyMy4wNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3Qt
dG9vbHNfMjAyMy4wNy4wMi5iYgpAQCAtMSw2ICsxLDQgQEAKIHJlcXVpcmUgdS1ib290LWNvbW1v
bi5pbmMKIHJlcXVpcmUgdS1ib290LXRvb2xzLmluYwogCi1TUkNfVVJJICs9ICIgXAotICAgIGZp
bGU6Ly8wMDAxLW1raW1hZ2UtVXNlLVBBVEhfTUFYLWZvci1wYXRoLWxlbmd0aC5wYXRjaCBcCi0i
CitTUkNfVVJJICs9ICIgZ2l0Oi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPXUtYm9vdC0yMDIzLjA3LnkiCi0tIAoyLjM5LjIKCg==

--===============8478944402884889954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bd4b96d2144e6119cf63635d837ec91e4f54c2bc"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 18 Mirrors 0 Missed 9 Current 342 (66% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1083 of 1272 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb:do_fetch)
NOTE: recipe u-boot-tools-1_2023.07.02-r0: task do_fetch: Started
WARNING: u-boot-tools-1_2023.07.02-r0 do_fetch: Failed to fetch URL git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master, attempting MIRRORS if available
NOTE: recipe u-boot-tools-1_2023.07.02-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 1255 tasks of which 1254 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb:do_fetch
Summary: There were 2 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: u-boot-tools-1_2023.07.02-r0 do_fetch: Fetcher failure: Unable to find revision 83cdab8b2c6ea0fc0860f8444d083353b47f1d5c in branch master even from upstream
ERROR: u-boot-tools-1_2023.07.02-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/u-boot-tools/1_2023.07.02-r0/temp/log.do_fetch.3996304
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb:do_fetch) failed with exit code '1'

--===============8478944402884889954==--

