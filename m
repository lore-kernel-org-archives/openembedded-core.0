Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0199BC28B24
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7169.1740828324885380526
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YgV89uLg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Mj8cbjnA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019551743079-2d6d3aa8-2243-4a6b-b75e-78fc1d8a2719-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RTFClkynF4Y93ly8dcrUnOqlc5JTsY+IAPVO3uBhT4M=;
	b=YgV89uLgV/c+INXHo6f41g9fstUq3zQ2Hd6/ZyVOIE9C1QnoFjxrNAeXmFQ9w0Wo
	B1zIZuxKn3ip2zGw3rBquGBQrHwsoI9ZaVq3nLc3RFzehYJQM3QAlw0Dz0+HFXw4N2x
	v6Zf4VUz5SoqmMnV2o1QKncenIxKdmRyRCYfG47M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RTFClkynF4Y93ly8dcrUnOqlc5JTsY+IAPVO3uBhT4M=;
	b=Mj8cbjnA0dNWynZpRnX4BpK6Pz+AYm5RXSc2JLAbhKeaHTsANozQ4//bIb9lW6EA
	sCJl3JWe5i/wrpMnwIa+EmekA7pVejP1lQyC0UzNKQ/rLuBODch+vw9t/5qXLj0culR
	4RHCIfDSM+Ey/le8w/U76lUaBBJODUMa+cWDxZjA=
Content-Type: multipart/mixed; boundary="===============3886100356542334085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.48 SUCCEEDED
Message-ID: <0101019551743079-2d6d3aa8-2243-4a6b-b75e-78fc1d8a2719-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212119

--===============3886100356542334085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mtools* to *4.0.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.47-4.0.48.patch
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
From 5faef1798c3822054a63a251639f6690a0b3c34f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 07:41:24 +0000
Subject: [PATCH] mtools: upgrade 4.0.47 -> 4.0.48

---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 6 +++---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.47.bb => mtools_4.0.48.bb}           | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.47.bb => mtools_4.0.48.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 2f3c452420..c2a46af967 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From d8e9cf472f49c8dbb3b0855145974d199a83e8a4 Mon Sep 17 00:00:00 2001
+From 734a02d05051b27bb5ce6eb147c898e6a53984da Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysincludes.h b/sysincludes.h
-index 6b322ff..48daecd 100644
+index 272b316..49ee5ae 100644
 --- a/sysincludes.h
 +++ b/sysincludes.h
-@@ -85,7 +85,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
+@@ -98,7 +98,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1b3c3e003d..47d63685db 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 4e51cf33fc34e8e82661b9bc3ab13858a2ffe43d Mon Sep 17 00:00:00 2001
+From 660f154d9b926ad2f2dc82be4154978539d9bfff Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -11,10 +11,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 436c94b..794f098 100644
+index 2433457..3972150 100644
 --- a/config.c
 +++ b/config.c
-@@ -868,14 +868,6 @@ void read_config(void)
+@@ -849,14 +849,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index fb7ba56eec..d6fb1f64ca 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
+From c6d9f9212e4ea423e33304fbf01728328b120045 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -10,7 +10,7 @@ Upstream-Status: Inappropriate [licensing]
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7b305b0..70c8c74 100644
+index d9cc6e3..1f8d93f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -39,7 +39,7 @@ index 7b305b0..70c8c74 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.ac b/configure.ac
-index 37f0d00..c93cfb5 100644
+index fa73f7b..c42a232 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -36,6 +36,33 @@ AC_PATH_PROG(INSTALL_INFO, install-info, "")
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.47.bb b/meta/recipes-devtools/mtools/mtools_4.0.48.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.47.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.48.bb
index 70d6579621..646735f3b3 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.47.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.48.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "31aa06078cc3f50591b95e71a909c56dd179d87e9cbdc07bf435e595bd7cc7ff"
+SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.44.1


--===============3886100356542334085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.47-4.0.48.patch"

RnJvbSA1ZmFlZjE3OThjMzgyMjA1NGE2M2EyNTE2MzlmNjY5MGEwYjNjMzRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNzo0MToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
b29sczogdXBncmFkZSA0LjAuNDcgLT4gNC4wLjQ4CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaCAgICAgIHwgNiArKystLS0KIC4uLi9t
dG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgICAgICAgIHwg
NiArKystLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtl
aW5mby5wYXRjaCAgIHwgNiArKystLS0KIC4uLi9tdG9vbHMve210b29sc180LjAuNDcuYmIgPT4g
bXRvb2xzXzQuMC40OC5iYn0gICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRvb2xzL3ttdG9vbHNfNC4wLjQ3LmJiID0+IG10b29sc180LjAuNDguYmJ9ICg5MyUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5V
U0VELnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5V
U0VELnBhdGNoCmluZGV4IDJmM2M0NTI0MjAuLmMyYTQ2YWY5NjcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGQ4ZTljZjQ3MmY0OWM4ZGJiM2IwODU1MTQ1OTc0ZDE5OWE4M2U4
YTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDczNGEwMmQwNTA1MWIyN2JiNWNlNmVi
MTQ3Yzg5OGU2YTUzOTg0ZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxMTo1NTo0MSAt
MDcwMAogU3ViamVjdDogW1BBVENIXSBVbmRlZmluZSBVTlVTRUQgbWFjcm9zIHdpdGggY2xhbmcK
QEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvc3lzaW5jbHVkZXMuaCBiL3N5c2luY2x1ZGVzLmgKLWluZGV4IDZiMzIy
ZmYuLjQ4ZGFlY2QgMTAwNjQ0CitpbmRleCAyNzJiMzE2Li40OWVlNWFlIDEwMDY0NAogLS0tIGEv
c3lzaW5jbHVkZXMuaAogKysrIGIvc3lzaW5jbHVkZXMuaAotQEAgLTg1LDcgKzg1LDcgQEAgYWNf
Y3ZfZnVuY19zZXRwZ3JwX3ZvaWQ9eWVzIC4uL210b29scy9jb25maWd1cmUgLS1idWlsZD1pMzg2
LWxpbnV4LWdudSAtLWhvc3Q9aTMKK0BAIC05OCw3ICs5OCw3IEBAIGFjX2N2X2Z1bmNfc2V0cGdy
cF92b2lkPXllcyAuLi9tdG9vbHMvY29uZmlndXJlIC0tYnVpbGQ9aTM4Ni1saW51eC1nbnUgLS1o
b3N0PWkzCiAgI2lmIGRlZmluZWQgX19HTlVDX18gJiYgZGVmaW5lZCBfX1NURENfXwogIC8qIGdj
YyAtdHJhZGl0aW9uYWwgZG9lc24ndCBoYXZlIFBBQ0tFRCwgVU5VU0VEIGFuZCBOT1JFVFVSTiAq
LwogICMgZGVmaW5lIFBBQ0tFRCBfX2F0dHJpYnV0ZV9fICgocGFja2VkKSkKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNv
bmZpZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxl
LWhhcmRjb2RlZC1jb25maWdzLnBhdGNoCmluZGV4IDFiM2MzZTAwM2QuLjQ3ZDYzNjg1ZGIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFy
ZGNvZGVkLWNvbmZpZ3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9t
dG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNGU1MWNmMzNmYzM0ZThlODI2NjFiOWJjM2FiMTM4NThhMmZmZTQzZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNjYwZjE1NGQ5YjkyNmFkMmYyZGM4MmJlNDE1NDk3ODUzOWQ5YmZm
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEVkIEJhcnRvc2ggPGVkLmJhcnRvc2hA
bGludXguaW50ZWwuY29tPgogRGF0ZTogVHVlLCAxMyBKdW4gMjAxNyAxNDo1NTo1MiArMDMwMAog
U3ViamVjdDogW1BBVENIXSBEaXNhYmxlZCByZWFkaW5nIGhvc3QgY29uZmlncy4KQEAgLTExLDEw
ICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3NoQGxpbnV4Lmlu
dGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZy5jIGIvY29uZmlnLmMKLWluZGV4IDQzNmM5NGIuLjc5NGYwOTggMTAwNjQ0CitpbmRl
eCAyNDMzNDU3Li4zOTcyMTUwIDEwMDY0NAogLS0tIGEvY29uZmlnLmMKICsrKyBiL2NvbmZpZy5j
Ci1AQCAtODY4LDE0ICs4NjgsNiBAQCB2b2lkIHJlYWRfY29uZmlnKHZvaWQpCitAQCAtODQ5LDE0
ICs4NDksNiBAQCB2b2lkIHJlYWRfY29uZmlnKHZvaWQpCiAgCW1lbWNweShkZXZpY2VzLCBjb25z
dF9kZXZpY2VzLAogIAkgICAgICAgbnJfY29uc3RfZGV2aWNlcypzaXplb2Yoc3RydWN0IGRldmlj
ZSkpOwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMv
bXRvb2xzLW1ha2VpbmZvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9v
bHMvbXRvb2xzLW1ha2VpbmZvLnBhdGNoCmluZGV4IGZiN2JhNTZlZWMuLmQ2ZmIxZjY0Y2EgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtl
aW5mby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9v
bHMtbWFrZWluZm8ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI1MTcxNThlOGZmYzZhNjY1
NTA2MDA3YjIwNzA4ZDZjMjU4OWNlYzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM2
ZDlmOTIxMmU0ZWE0MjNlMzMzMDRmYmYwMTcyODMyOGIxMjAwNDUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBNYXJjaW4gSnVzemtpZXdpY3ogPGhyd0BvcGVuZWRoYW5kLmNvbT4KIERh
dGU6IEZyaSwgOCBKdW4gMjAwNyAwODozNToxMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBtdG9v
bHM6IGltcG9ydGVkIGZyb20gT0UKQEAgLTEwLDcgKzEwLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtsaWNlbnNpbmddCiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9NYWtlZmls
ZS5pbgotaW5kZXggN2IzMDViMC4uNzBjOGM3NCAxMDA2NDQKK2luZGV4IGQ5Y2M2ZTMuLjFmOGQ5
M2YgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5pbgogKysrIGIvTWFrZWZpbGUuaW4KIEBAIC0yNiwx
MCArMjYsMTEgQEAgVVNFUkNGTEFHUyA9CkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IDdiMzA1YjAu
LjcwYzhjNzQgMTAwNjQ0CiAgcGRmOiBtdG9vbHMucGRmCiAgJS5wZGY6ICUudGV4aSBzeXNjb25m
ZGlyLnRleGkKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4
IDM3ZjBkMDAuLmM5M2NmYjUgMTAwNjQ0CitpbmRleCBmYTczZjdiLi5jNDJhMjMyIDEwMDY0NAog
LS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNiw2ICszNiwzMyBA
QCBBQ19QQVRIX1BST0coSU5TVEFMTF9JTkZPLCBpbnN0YWxsLWluZm8sICIiKQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ3LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ4LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40
Ny5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ4
LmJiCmluZGV4IDcwZDY1Nzk2MjEuLjY0NjczNWYzYjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40Ny5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbXRvb2xzL210b29sc180LjAuNDguYmIKQEAgLTI0LDcgKzI0LDcgQEAgUlJFQ09NTUVO
RFM6JHtQTn06bGliYy1nbGliYyA9ICJcCiAJZ2xpYmMtZ2NvbnYtaWJtODY2IFwKIAlnbGliYy1n
Y29udi1pYm04NjkgXAogCSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMWFhMDYwNzhjYzNmNTA1
OTFiOTVlNzFhOTA5YzU2ZGQxNzlkODdlOWNiZGMwN2JmNDM1ZTU5NWJkN2NjN2ZmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjAzYzI5YWFjODczNWRkNzE1NGE5ODlmYmMyOWVhZjJiNTA2MTIxYWUx
YzNhMzVjZDBiZjJhMDJlOTRkMjcxYTkiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9tdG9v
bHMvbXRvb2xzLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vbXRvb2xzLW1ha2Vp
bmZvLnBhdGNoIFwKLS0gCjIuNDQuMQoK

--===============3886100356542334085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.47.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.48.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools: PV changed from "4.0.47" to "4.0.48"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 880640 to 881472 (+0%)
packages/core2-64-poky-linux/mtools/mtools-dbg: PV changed from "4.0.47" to "4.0.48"
packages/core2-64-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools/mtools-dev: PV changed from "4.0.47" to "4.0.48"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 249195 to 210237 (-16%)
packages/core2-64-poky-linux/mtools/mtools-doc: FILELIST: removed "/usr/share/man/man1/mtools.1 /usr/share/man/man5/mtools.5"
packages/core2-64-poky-linux/mtools/mtools-doc: PV changed from "4.0.47" to "4.0.48"
packages/core2-64-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools/mtools-locale: PV changed from "4.0.47" to "4.0.48"
packages/core2-64-poky-linux/mtools/mtools-src: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools/mtools-src: PKGSIZE changed from 598928 to 602862 (+1%)
packages/core2-64-poky-linux/mtools/mtools-src: PV changed from "4.0.47" to "4.0.48"
packages/core2-64-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.47" to "4.0.48"
packages/core2-64-poky-linux/mtools/mtools: PKGV changed from 4.0.47 [default] to 4.0.48 [default]
packages/core2-64-poky-linux/mtools/mtools: PV changed from "4.0.47" to "4.0.48"

--===============3886100356542334085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mtools/mtools-doc: FILELIST: removed "/usr/share/man/man5/mtools.5 /usr/share/man/man1/mtools.1"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 249195 to 210237 (-16%)

--===============3886100356542334085==--

