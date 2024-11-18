Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00C0D60074
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4707.1731964656226154736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=anxk9Ihd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xq9/eO50;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101934123a4a4-f3097b5d-ae0b-4fc6-aa38-0d8b4fd5071f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964675;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D4wFT1cAaJ8QNqNaPFosDcmPt7ePso2G0lVAss9fiwc=;
	b=anxk9IhdgAGZMgy/ziQPoamJfr5uQO0nLwokHl78/WfPsVA3ai+LP6AYfKNLUIDW
	4SAkkzeDzcg0aftkLUMJDG18dGpy93l/5bBye3Qhynzzhawn+8OgEpGnd9PIQj5kGY7
	4CKwpDRRprp7UjTzveB2WbI2y93tDho8w1S97acQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964675;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D4wFT1cAaJ8QNqNaPFosDcmPt7ePso2G0lVAss9fiwc=;
	b=xq9/eO506zu6SHujDbcY+kVVUwsL3uyqi7nJK8euuU9S//6YHnVyhK/UWwZNgv3y
	QhbZKMRXHRQkQr1NmP/vXKJz4jprE19zskuZ2eVkmFbnFBTXMFd2tTXLz9ZfDI7AnIv
	LZgAAjq5QG/2bJl1Jx0nKe4gt34VagpOUNmzs+PE=
Content-Type: multipart/mixed; boundary="===============4898572732593134353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedumpfile: upgrading to 1.7.6 SUCCEEDED
Message-ID: <010101934123a4a4-f3097b5d-ae0b-4fc6-aa38-0d8b4fd5071f-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207343

--===============4898572732593134353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *makedumpfile* to *1.7.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-makedumpfile-upgrade-1.7.5-1.7.6.patch
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
From 4a2b78faa0555ec420d8463b1bf22e22fa6a696e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 04:29:53 +0000
Subject: [PATCH] makedumpfile: upgrade 1.7.5 -> 1.7.6

---
 .../0001-makedumpfile-replace-hardcode-CFLAGS.patch       | 8 ++++----
 .../{makedumpfile_1.7.5.bb => makedumpfile_1.7.6.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.5.bb => makedumpfile_1.7.6.bb} (97%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 96a996f616..534d0e51a9 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 6d16911316cb576db0239f607e60918a222e4436 Mon Sep 17 00:00:00 2001
+From 50e60521bdfbac4fe85b3851684b392ef339312a Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -24,7 +24,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 21 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 71d8548..22acdd5 100644
+index aa73252..76fcafd 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
@@ -111,7 +111,7 @@ index 71d8548..22acdd5 100644
  endif
  
  ifeq ($(DEBUG), on)
-@@ -104,14 +106,14 @@ LIBS := $(LIBS) $(call try-run,\
+@@ -106,14 +108,14 @@ SBINDIR ?= /usr/sbin
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -128,7 +128,7 @@ index 71d8548..22acdd5 100644
  	@sed -e "s/@DATE@/$(DATE)/" \
  	     -e "s/@VERSION@/$(VERSION)/" \
  	     $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
-@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+@@ -122,7 +124,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	     $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
  
  eppic_makedumpfile.so: extension_eppic.c
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
similarity index 97%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
index 85b44c4941..21847ece6b 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "c266469347d49287be38059d45e7aaa454db9cb2"
+SRCREV = "97a89484e2c960dd64933e1cea7a7248138f8a76"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.44.1


--===============4898572732593134353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-makedumpfile-upgrade-1.7.5-1.7.6.patch"

RnJvbSA0YTJiNzhmYWEwNTU1ZWM0MjBkODQ2M2IxYmYyMmUyMmZhNmE2OTZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMDQ6Mjk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YWtlZHVtcGZpbGU6IHVwZ3JhZGUgMS43LjUgLT4gMS43LjYKCi0tLQogLi4uLzAwMDEtbWFrZWR1
bXBmaWxlLXJlcGxhY2UtaGFyZGNvZGUtQ0ZMQUdTLnBhdGNoICAgICAgIHwgOCArKysrLS0tLQog
Li4uL3ttYWtlZHVtcGZpbGVfMS43LjUuYmIgPT4gbWFrZWR1bXBmaWxlXzEuNy42LmJifSAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlZHVtcGZpbGUve21ha2VkdW1wZmlsZV8x
LjcuNS5iYiA9PiBtYWtlZHVtcGZpbGVfMS43LjYuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9tYWtlZHVtcGZpbGUvbWFrZWR1bXBmaWxlLzAwMDEtbWFrZWR1bXBm
aWxlLXJlcGxhY2UtaGFyZGNvZGUtQ0ZMQUdTLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9t
YWtlZHVtcGZpbGUvbWFrZWR1bXBmaWxlLzAwMDEtbWFrZWR1bXBmaWxlLXJlcGxhY2UtaGFyZGNv
ZGUtQ0ZMQUdTLnBhdGNoCmluZGV4IDk2YTk5NmY2MTYuLjUzNGQwZTUxYTkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZS8wMDAxLW1ha2Vk
dW1wZmlsZS1yZXBsYWNlLWhhcmRjb2RlLUNGTEFHUy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
a2VybmVsL21ha2VkdW1wZmlsZS9tYWtlZHVtcGZpbGUvMDAwMS1tYWtlZHVtcGZpbGUtcmVwbGFj
ZS1oYXJkY29kZS1DRkxBR1MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZkMTY5MTEzMTZj
YjU3NmRiMDIzOWY2MDdlNjA5MThhMjIyZTQ0MzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDUwZTYwNTIxYmRmYmFjNGZlODViMzg1MTY4NGIzOTJlZjMzOTMxMmEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgog
RGF0ZTogU3VuLCAyNCBBcHIgMjAyMiAxNzoyNTozMyArMDgwMAogU3ViamVjdDogW1BBVENIXSBt
YWtlZHVtcGZpbGU6IHJlcGxhY2UgaGFyZGNvZGUgQ0ZMQUdTCkBAIC0yNCw3ICsyNCw3IEBAIFNp
Z25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXggNzFkODU0OC4uMjJhY2RkNSAxMDA2NDQKK2lu
ZGV4IGFhNzMyNTIuLjc2ZmNhZmQgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZp
bGUKIEBAIC04LDEyICs4LDYgQEAgaWZlcSAoJChzdHJpcCAkQ0MpLCkKQEAgLTExMSw3ICsxMTEs
NyBAQCBpbmRleCA3MWQ4NTQ4Li4yMmFjZGQ1IDEwMDY0NAogIGVuZGlmCiAgCiAgaWZlcSAoJChE
RUJVRyksIG9uKQotQEAgLTEwNCwxNCArMTA2LDE0IEBAIExJQlMgOj0gJChMSUJTKSAkKGNhbGwg
dHJ5LXJ1bixcCitAQCAtMTA2LDE0ICsxMDgsMTQgQEAgU0JJTkRJUiA/PSAvdXNyL3NiaW4KICBh
bGw6IG1ha2VkdW1wZmlsZQogIAogICQoT0JKX1BBUlQpOiAkKFNSQ19QQVJUKQpAQCAtMTI4LDcg
KzEyOCw3IEBAIGluZGV4IDcxZDg1NDguLjIyYWNkZDUgMTAwNjQ0CiAgCUBzZWQgLWUgInMvQERB
VEVALyQoREFURSkvIiBcCiAgCSAgICAgLWUgInMvQFZFUlNJT05ALyQoVkVSU0lPTikvIiBcCiAg
CSAgICAgJChWUEFUSCltYWtlZHVtcGZpbGUuOC5pbiA+ICQoVlBBVEgpbWFrZWR1bXBmaWxlLjgK
LUBAIC0xMjAsNyArMTIyLDcgQEAgbWFrZWR1bXBmaWxlOiAkKFNSQ19CQVNFKSAkKE9CSl9QQVJU
KSAkKE9CSl9BUkNIKQorQEAgLTEyMiw3ICsxMjQsNyBAQCBtYWtlZHVtcGZpbGU6ICQoU1JDX0JB
U0UpICQoT0JKX1BBUlQpICQoT0JKX0FSQ0gpCiAgCSAgICAgJChWUEFUSCltYWtlZHVtcGZpbGUu
Y29uZi41LmluID4gJChWUEFUSCltYWtlZHVtcGZpbGUuY29uZi41CiAgCiAgZXBwaWNfbWFrZWR1
bXBmaWxlLnNvOiBleHRlbnNpb25fZXBwaWMuYwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtl
cm5lbC9tYWtlZHVtcGZpbGUvbWFrZWR1bXBmaWxlXzEuNy41LmJiIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9tYWtlZHVtcGZpbGUvbWFrZWR1bXBmaWxlXzEuNy42LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1w
ZmlsZV8xLjcuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlZHVtcGZpbGUv
bWFrZWR1bXBmaWxlXzEuNy42LmJiCmluZGV4IDg1YjQ0YzQ5NDEuLjIxODQ3ZWNlNmIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZV8xLjcu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL21ha2VkdW1wZmlsZS9tYWtlZHVtcGZpbGVf
MS43LjYuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2FiYWFiYWE4ODJiYmUiCiBMSUNFTlNFID0gIkdQ
TC0yLjAtb25seSIKIAogU1JDQlJBTkNIID89ICJtYXN0ZXIiCi1TUkNSRVYgPSAiYzI2NjQ2OTM0
N2Q0OTI4N2JlMzgwNTlkNDVlN2FhYTQ1NGRiOWNiMiIKK1NSQ1JFViA9ICI5N2E4OTQ4NGUyYzk2
MGRkNjQ5MzNlMWNlYTdhNzI0ODEzOGY4YTc2IgogCiBERVBFTkRTID0gImJ6aXAyIHpsaWIgZWxm
dXRpbHMgeHoiCiBSREVQRU5EUzoke1BOfS10b29scyA9ICJwZXJsICR7UE59IgotLSAKMi40NC4x
Cgo=

--===============4898572732593134353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/makedumpfile: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile-dbg: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile-dbg: PKGSIZE changed from 1151528 to 1153280 (+0%)
packages/core2-64-poky-linux/makedumpfile/makedumpfile-dbg: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile-dev: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile-dev: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile-doc: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile-doc: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile-locale: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile-locale: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile-src: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile-src: PKGSIZE changed from 690716 to 691972 (+0%)
packages/core2-64-poky-linux/makedumpfile/makedumpfile-src: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile-staticdev: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile-staticdev: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile-tools: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile-tools: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/makedumpfile/makedumpfile: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/makedumpfile/makedumpfile: PKGV changed from 1.7.5 [default] to 1.7.6 [default]

--===============4898572732593134353==--

