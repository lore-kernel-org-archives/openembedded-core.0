Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BB0C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50703.1782540475701568073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KTqBqW5F;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NVoQzAoM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f07b1196d-52df4ccc-f232-4ff9-aca7-0f74edda597f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XIQyyCTUSgQFjPnO29C7+jcHX0WD/oT1/qG19RDbNVQ=;
	b=KTqBqW5F8BJXB63euYlVTzrbIa3I/IKeFv8GlDVw1yYDaNHBrbRle7DeH8ZASkzi
	i7yMCxNPossfpI0r/pgowqMsey9h3aYPp1kIqU3nuIyJGD40B8DMi4BSTJptwFNmNWe
	/JIMW5FtDfbEy0+8GgJySDHcEAoryFNGWNRsiU2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XIQyyCTUSgQFjPnO29C7+jcHX0WD/oT1/qG19RDbNVQ=;
	b=NVoQzAoMDXZLx5ioGa/YSKkb8f+glJApXJW3a69o9pKvfCGtbA77mEyT36rcYbFF
	zkdHhMp/nRDobXNIeuogIzM6wQs80W9v0wTdbiJ5Gz5xY65lleG9pymUKEMulN6z009
	1xViqQCtbxWKitGRQnC6I3pMGRry5qkrpLBVOOSs=
Content-Type: multipart/mixed; boundary="===============8906472837831290107=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.8.1.3 SUCCEEDED
Message-ID: <0101019f07b1196d-52df4ccc-f232-4ff9-aca7-0f74edda597f-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239675

--===============8906472837831290107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *socat* to *1.8.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-socat-upgrade-1.8.1.1-1.8.1.3.patch
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
From ba8ee94d55b51002e93d5f83a4fab4a1ab087830 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 27 Jun 2026 05:19:15 +0000
Subject: [PATCH] socat: upgrade 1.8.1.1 -> 1.8.1.3

---
 .../files/0001-fix-compile-procan.c-failed.patch      | 11 ++++-------
 .../socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb}      |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb} (94%)

diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
index ea00dfa0a9..9f44c9a070 100644
--- a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
+++ b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
@@ -1,4 +1,4 @@
-From c4c3d5f2d4dfe8167205e8d20b4cb7a197706c16 Mon Sep 17 00:00:00 2001
+From 15c33fde40777ddbc8eb51f8b424032f2dd77189 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Nov 2024 04:09:59 -0800
 Subject: [PATCH] fix compile procan.c failed
@@ -32,10 +32,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 631d31d..103d4d1 100644
+index 629cb7e..4368a3f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -110,7 +110,7 @@ socat: socat.o libxio.a
+@@ -112,7 +112,7 @@ socat: socat.o libxio.a
  	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ socat.o libxio.a $(CLIBS)
  
  procan.o: $(srcdir)/procan.c
@@ -44,7 +44,7 @@ index 631d31d..103d4d1 100644
  
  PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
  procan: $(PROCAN_OBJS)
-@@ -132,9 +132,9 @@ install: progs $(srcdir)/doc/socat.1
+@@ -134,9 +134,9 @@ install: progs $(srcdir)/doc/socat.1
  	mkdir -p $(DESTDIR)$(BINDEST)
  	$(INSTALL) -m 755 socat $(DESTDIR)$(BINDEST)/socat1
  	ln -sf socat1 $(DESTDIR)$(BINDEST)/socat
@@ -57,6 +57,3 @@ index 631d31d..103d4d1 100644
  	$(INSTALL) -m 755 procan $(DESTDIR)$(BINDEST)
  	$(INSTALL) -m 755 filan $(DESTDIR)$(BINDEST)
  	mkdir -p $(DESTDIR)$(MANDEST)/man1
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
similarity index 94%
rename from meta/recipes-connectivity/socat/socat_1.8.1.1.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.3.bb
index e662c79a75..636c75b117 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b"
+SRC_URI[sha256sum] = "25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a6639b1fb602418"
 
 inherit autotools
 
-- 
2.47.1


--===============8906472837831290107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/socat: SRC_URI changed from "http://www.dest-unreach.org/socat/download/socat-1.8.1.1.tar.bz2 file://0001-fix-compile-procan.c-failed.patch" to "http://www.dest-unreach.org/socat/download/socat-1.8.1.3.tar.bz2 file://0001-fix-compile-procan.c-failed.patch"
packages/x86-64-v3-poky-linux/socat: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat: PV changed from "1.8.1.1" to "1.8.1.3"
packages/x86-64-v3-poky-linux/socat/socat-dbg: PKGSIZE changed from 2091504 to 2091376 (-0%)
packages/x86-64-v3-poky-linux/socat/socat-dbg: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat/socat-dbg: PV changed from "1.8.1.1" to "1.8.1.3"
packages/x86-64-v3-poky-linux/socat/socat-dev: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat/socat-dev: PV changed from "1.8.1.1" to "1.8.1.3"
packages/x86-64-v3-poky-linux/socat/socat-doc: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat/socat-doc: PV changed from "1.8.1.1" to "1.8.1.3"
packages/x86-64-v3-poky-linux/socat/socat-locale: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat/socat-locale: PV changed from "1.8.1.1" to "1.8.1.3"
packages/x86-64-v3-poky-linux/socat/socat-src: PKGSIZE changed from 1309149 to 1309167 (+0%)
packages/x86-64-v3-poky-linux/socat/socat-src: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat/socat-src: FILELIST: directory renamed /usr/src/debug/socat/1.8.1.1 -> /usr/src/debug/socat/1.8.1.3
packages/x86-64-v3-poky-linux/socat/socat-src: PV changed from "1.8.1.1" to "1.8.1.3"
packages/x86-64-v3-poky-linux/socat/socat-staticdev: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat/socat-staticdev: PV changed from "1.8.1.1" to "1.8.1.3"
packages/x86-64-v3-poky-linux/socat/socat: PKGV changed from 1.8.1.1 [default] to 1.8.1.3 [default]
packages/x86-64-v3-poky-linux/socat/socat: PV changed from "1.8.1.1" to "1.8.1.3"

--===============8906472837831290107==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-socat-upgrade-1.8.1.1-1.8.1.3.patch"

RnJvbSBiYThlZTk0ZDU1YjUxMDAyZTkzZDVmODNhNGZhYjRhMWFiMDg3ODMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjcgSnVuIDIwMjYgMDU6MTk6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
b2NhdDogdXBncmFkZSAxLjguMS4xIC0+IDEuOC4xLjMKCi0tLQogLi4uL2ZpbGVzLzAwMDEtZml4
LWNvbXBpbGUtcHJvY2FuLmMtZmFpbGVkLnBhdGNoICAgICAgfCAxMSArKysrLS0tLS0tLQogLi4u
L3NvY2F0L3tzb2NhdF8xLjguMS4xLmJiID0+IHNvY2F0XzEuOC4xLjMuYmJ9ICAgICAgfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC97c29jYXRfMS44LjEuMS5iYiA9PiBz
b2NhdF8xLjguMS4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvc29jYXQvZmlsZXMvMDAwMS1maXgtY29tcGlsZS1wcm9jYW4uYy1mYWlsZWQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L2ZpbGVzLzAwMDEtZml4LWNvbXBpbGUt
cHJvY2FuLmMtZmFpbGVkLnBhdGNoCmluZGV4IGVhMDBkZmEwYTkuLjlmNDRjOWEwNzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc29jYXQvZmlsZXMvMDAwMS1maXgtY29t
cGlsZS1wcm9jYW4uYy1mYWlsZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9zb2NhdC9maWxlcy8wMDAxLWZpeC1jb21waWxlLXByb2Nhbi5jLWZhaWxlZC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYzRjM2Q1ZjJkNGRmZTgxNjcyMDVlOGQyMGI0Y2I3YTE5NzcwNmMx
NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTVjMzNmZGU0MDc3N2RkYmM4ZWI1MWY4
YjQyNDAzMmYyZGQ3NzE4OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjcgTm92IDIwMjQgMDQ6
MDk6NTkgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZml4IGNvbXBpbGUgcHJvY2FuLmMgZmFpbGVk
CkBAIC0zMiwxMCArMzIsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2VmaWxlLmluCi1pbmRl
eCA2MzFkMzFkLi4xMDNkNGQxIDEwMDY0NAoraW5kZXggNjI5Y2I3ZS4uNDM2OGEzZiAxMDA2NDQK
IC0tLSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5pbgotQEAgLTExMCw3ICsxMTAsNyBA
QCBzb2NhdDogc29jYXQubyBsaWJ4aW8uYQorQEAgLTExMiw3ICsxMTIsNyBAQCBzb2NhdDogc29j
YXQubyBsaWJ4aW8uYQogIAkkKENDKSAkKENGTEFHUykgJChMREZMQUdTKSAtbyAkQCBzb2NhdC5v
IGxpYnhpby5hICQoQ0xJQlMpCiAgCiAgcHJvY2FuLm86ICQoc3JjZGlyKS9wcm9jYW4uYwpAQCAt
NDQsNyArNDQsNyBAQCBpbmRleCA2MzFkMzFkLi4xMDNkNGQxIDEwMDY0NAogIAogIFBST0NBTl9P
QkpTPXByb2Nhbl9tYWluLm8gcHJvY2FuLm8gcHJvY2FuLWNkZWZzLm8gaG9zdGFuLm8gZXJyb3Iu
byBzeWNscy5vIHN5c3V0aWxzLm8gdXRpbHMubyB2c25wcmludGZfci5vIHNucHJpbnRlcnIubwog
IHByb2NhbjogJChQUk9DQU5fT0JKUykKLUBAIC0xMzIsOSArMTMyLDkgQEAgaW5zdGFsbDogcHJv
Z3MgJChzcmNkaXIpL2RvYy9zb2NhdC4xCitAQCAtMTM0LDkgKzEzNCw5IEBAIGluc3RhbGw6IHBy
b2dzICQoc3JjZGlyKS9kb2Mvc29jYXQuMQogIAlta2RpciAtcCAkKERFU1RESVIpJChCSU5ERVNU
KQogIAkkKElOU1RBTEwpIC1tIDc1NSBzb2NhdCAkKERFU1RESVIpJChCSU5ERVNUKS9zb2NhdDEK
ICAJbG4gLXNmIHNvY2F0MSAkKERFU1RESVIpJChCSU5ERVNUKS9zb2NhdApAQCAtNTcsNiArNTcs
MyBAQCBpbmRleCA2MzFkMzFkLi4xMDNkNGQxIDEwMDY0NAogIAkkKElOU1RBTEwpIC1tIDc1NSBw
cm9jYW4gJChERVNURElSKSQoQklOREVTVCkKICAJJChJTlNUQUxMKSAtbSA3NTUgZmlsYW4gJChE
RVNURElSKSQoQklOREVTVCkKICAJbWtkaXIgLXAgJChERVNURElSKSQoTUFOREVTVCkvbWFuMQot
LS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2Nh
dC9zb2NhdF8xLjguMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9zb2Nh
dF8xLjguMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvc29jYXQvc29jYXRfMS44LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9zb2NhdF8xLjguMS4zLmJiCmluZGV4IGU2NjJjNzlhNzUu
LjYzNmM3NWIxMTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc29jYXQv
c29jYXRfMS44LjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3Nv
Y2F0XzEuOC4xLjMuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LmRl
c3QtdW5yZWFjaC5vcmcvc29jYXQvZG93bmxvYWQvc29jYXQtJHtQVn0udGFyLmJ6MiBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLWZpeC1jb21waWxlLXByb2Nhbi5jLWZhaWxlZC5wYXRjaCBcCiAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZWJjNjM2YjdmNDI3MDUzZjk4ODA2Njk2NTIxNjUz
YTYxNGM3ZTA2NDY0OTEwMzUzY2JmNTRlMjMyN2FkYzFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjI1YmM2NDc2MjkyYjJlNjE0MjIwOTg5Yzc3YjBiNmZjYTg3YmIyNTI1ZDk3NDdiMzFhNjYzOWIx
ZmI2MDI0MTgiCiAKIGluaGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuNDcuMQoK

--===============8906472837831290107==--

