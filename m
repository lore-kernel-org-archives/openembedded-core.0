Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5714EF4383E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19751.1776261894615154095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jjA02mTq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Oyk+hbSE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d91758f6c-dba14654-08ae-48fe-8db8-a55b4e225d44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vl+Unb/WJtK++9XCm3YwkCCD+YJIFA27YrlD4g3adQQ=;
	b=jjA02mTqtYpWDPe+Fl0VcE6mu2kKZuvORFhja9vm8e3R47GJ2yFGnwOD/PmCg/A6
	u9EdvK+iuiRX2mFCcWO6bZ/k6huqNqL854B0CfhvxcIifhgvNzK8O6sQPT5ycTpnrH7
	h/gB4JUM0RawrGw+mUBqwSD8q0vAOrsnKMiRp2ww=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vl+Unb/WJtK++9XCm3YwkCCD+YJIFA27YrlD4g3adQQ=;
	b=Oyk+hbSEJ7FoJ5TVk5Wqso1y312B45KC6Hgg7897BLBAowCFEhJd2AdBUgg0wMI7
	uuklLVrtQmaiEr5Pc3twiA4G93AyyeDLxK+NBXjywWY8GdbueRaCKDs7PCKldRfEQot
	SGN5rKuI1IqTPbki/GnPLGEbJjRGhkRZvEOHj7SA=
Content-Type: multipart/mixed; boundary="===============0202437206441084211=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.78 SUCCEEDED
Message-ID: <0101019d91758f6c-dba14654-08ae-48fe-8db8-a55b4e225d44-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235299

--===============0202437206441084211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap* to *2.78* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-upgrade-2.77-2.78.patch
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
From 141fed551c5ac2e9b9972abdc068ef499ff5abff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 13:14:12 +0000
Subject: [PATCH] libcap: upgrade 2.77 -> 2.78

---
 ...tivesdk-libcap-Raise-the-size-of-arrays-containing.patch | 6 +++---
 .../libcap/{libcap_2.77.bb => libcap_2.78.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.77.bb => libcap_2.78.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 2cec20b4b1..c1d1a3a9f7 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 969d21aa2bf474d9c5c80a64de1a9fe0e17e31b2 Mon Sep 17 00:00:00 2001
+From cb8b05f0f53c0013ee79941200d628ad0872cc7a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
@@ -19,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcap/execable.h b/libcap/execable.h
-index a68ea24..60d3853 100644
+index c8ac2f2..98843e4 100644
 --- a/libcap/execable.h
 +++ b/libcap/execable.h
-@@ -34,7 +34,7 @@ extern const int _IO_stdin_used;
+@@ -50,7 +50,7 @@ extern const int _IO_stdin_used;
  const int _IO_stdin_used __attribute__((weak)) = 131073;
  #endif /* def __GLIBC__ */
  
diff --git a/meta/recipes-support/libcap/libcap_2.77.bb b/meta/recipes-support/libcap/libcap_2.78.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.77.bb
rename to meta/recipes-support/libcap/libcap_2.78.bb
index 9968cd5f50..449260f7dc 100644
--- a/meta/recipes-support/libcap/libcap_2.77.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52"
+SRC_URI[sha256sum] = "0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.47.1


--===============0202437206441084211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libcap.so.2.77 /usr/lib/libpsx.so.2.77", added "/usr/lib/libpsx.so.2.78 /usr/lib/libcap.so.2.78"
Changes to packages/x86-64-v3-poky-linux/libcap (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.77 to libcap.so.2.78
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.77 to libpsx.so.2.78
  /usr/lib/libcap.so.2.77 moved to /usr/lib/libcap.so.2.78
  /usr/lib/libpsx.so.2.77 moved to /usr/lib/libpsx.so.2.78
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.77 to libcap.so.2.78
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.77 to libpsx.so.2.78
  /lib/libcap.so.2.77 moved to /lib/libcap.so.2.78
  /usr/lib/libpsx.so.2.77 moved to /usr/lib/libpsx.so.2.78

--===============0202437206441084211==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-upgrade-2.77-2.78.patch"

RnJvbSAxNDFmZWQ1NTFjNWFjMmU5Yjk5NzJhYmRjMDY4ZWY0OTlmZjVhYmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTM6MTQ6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXA6IHVwZ3JhZGUgMi43NyAtPiAyLjc4CgotLS0KIC4uLnRpdmVzZGstbGliY2FwLVJhaXNl
LXRoZS1zaXplLW9mLWFycmF5cy1jb250YWluaW5nLnBhdGNoIHwgNiArKystLS0KIC4uLi9saWJj
YXAve2xpYmNhcF8yLjc3LmJiID0+IGxpYmNhcF8yLjc4LmJifSAgICAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL3tsaWJjYXBfMi43Ny5iYiA9PiBsaWJjYXBf
Mi43OC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAv
ZmlsZXMvMDAwMS1uYXRpdmVzZGstbGliY2FwLVJhaXNlLXRoZS1zaXplLW9mLWFycmF5cy1jb250
YWluaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEtbmF0
aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMtY29udGFpbmluZy5wYXRjaApp
bmRleCAyY2VjMjBiNGIxLi5jMWQxYTNhOWY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJjYXAvZmlsZXMvMDAwMS1uYXRpdmVzZGstbGliY2FwLVJhaXNlLXRoZS1zaXplLW9m
LWFycmF5cy1jb250YWluaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC9maWxlcy8wMDAxLW5hdGl2ZXNkay1saWJjYXAtUmFpc2UtdGhlLXNpemUtb2YtYXJyYXlzLWNv
bnRhaW5pbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk2OWQyMWFhMmJmNDc0ZDljNWM4
MGE2NGRlMWE5ZmUwZTE3ZTMxYjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNiOGIw
NWYwZjUzYzAwMTNlZTc5OTQxMjAwZDYyOGFkMDg3MmNjN2EgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBU
aHUsIDE0IE9jdCAyMDIxIDE1OjU3OjM2ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG5hdGl2ZXNk
ay1saWJjYXA6IFJhaXNlIHRoZSBzaXplIG9mIGFycmF5cyBjb250YWluaW5nIGRsCkBAIC0xOSwx
MCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2
ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvbGliY2FwL2V4ZWNhYmxlLmggYi9saWJjYXAvZXhlY2FibGUuaAotaW5k
ZXggYTY4ZWEyNC4uNjBkMzg1MyAxMDA2NDQKK2luZGV4IGM4YWMyZjIuLjk4ODQzZTQgMTAwNjQ0
CiAtLS0gYS9saWJjYXAvZXhlY2FibGUuaAogKysrIGIvbGliY2FwL2V4ZWNhYmxlLmgKLUBAIC0z
NCw3ICszNCw3IEBAIGV4dGVybiBjb25zdCBpbnQgX0lPX3N0ZGluX3VzZWQ7CitAQCAtNTAsNyAr
NTAsNyBAQCBleHRlcm4gY29uc3QgaW50IF9JT19zdGRpbl91c2VkOwogIGNvbnN0IGludCBfSU9f
c3RkaW5fdXNlZCBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSkgPSAxMzEwNzM7CiAgI2VuZGlmIC8qIGRl
ZiBfX0dMSUJDX18gKi8KICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC9saWJjYXBfMi43Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJjYXBfMi43
OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJjYXAvbGliY2FwXzIuNzcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmNhcC9saWJjYXBfMi43OC5iYgppbmRleCA5OTY4Y2Q1ZjUwLi40NDkyNjBmN2RjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvbGliY2FwXzIuNzcuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2xpYmNhcF8yLjc4LmJiCkBAIC0xNiw3ICsxNiw3IEBA
IFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9saWJzL3NlY3VyaXR5L2xpbnV4
LXByaXZzLyR7QlBOfTIvJHtCUE59LSR7CiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsg
PSAiIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUt
c2l6ZS1vZi1hcnJheXMtY29udGFpbmluZy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI4OTdiYzE4YjQ0YWZjMjZjNzBlNzhjZWFkM2RiYjMxZTE1NGFjYzI0YmVl
MDg1YTVhMDkwNzlhODhkYmY2ZjUyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBkNjIxZTU2MmZk
OTMyY2NmNjdiOTY2MGZiMDE4ZTQ2OGE2ODNkN2I4Mjc1NDFkZjI3ODEzMjI4Yzk5NmJiMTEiCiAK
IFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9s
aWJzL3NlY3VyaXR5L2xpbnV4LXByaXZzLyR7QlBOfTIvIgogCi0tIAoyLjQ3LjEKCg==

--===============0202437206441084211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libcap: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap: SRC_URI changed from "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.77.tar.xz" to "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.78.tar.xz"
packages/x86-64-v3-poky-linux/libcap: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-bin: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap-bin: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-dbg: FILELIST: removed "/usr/lib/.debug/libcap.so.2.77 /usr/lib/.debug/libpsx.so.2.77", added "/usr/lib/.debug/libcap.so.2.78 /usr/lib/.debug/libpsx.so.2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-dbg: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap-dbg: PKGSIZE changed from 353248 to 354872 (+0%)
packages/x86-64-v3-poky-linux/libcap/libcap-dbg: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-dev: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap-dev: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-doc: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap-doc: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-locale: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap-locale: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-src: FILELIST: directory renamed /usr/src/debug/libcap/2.77/libcap/include/sys -> /usr/src/debug/libcap/2.78/libcap/include/sys, directory renamed /usr/src/debug/libcap/2.77/libcap -> /usr/src/debug/libcap/2.78/libcap, directory renamed /usr/src/debug/libcap/2.77/psx/wrap -> /usr/src/debug/libcap/2.78/psx/wrap, directory renamed /usr/src/debug/libcap/2.77/psx -> /usr/src/debug/libcap/2.78/psx, directory renamed /usr/src/debug/libcap/2.77/libcap/include/uapi/linux -> /usr/src/debug/libcap/2.78/libcap/include/uapi/linux, directory renamed /usr/src/debug/libcap/2.77/pam_cap -> /usr/src/debug/libcap/2.78/pam_cap, directory renamed /usr/src/debug/libcap/2.77/progs -> /usr/src/debug/libcap/2.78/progs
packages/x86-64-v3-poky-linux/libcap/libcap-src: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap-src: PKGSIZE changed from 231457 to 232704 (+1%)
packages/x86-64-v3-poky-linux/libcap/libcap-src: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap-staticdev: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap-staticdev: PKGSIZE changed from 238622 to 241326 (+1%)
packages/x86-64-v3-poky-linux/libcap/libcap-staticdev: PV changed from "2.77" to "2.78"
packages/x86-64-v3-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libcap.so.2.77 /usr/lib/libpsx.so.2.77", added "/usr/lib/libpsx.so.2.78 /usr/lib/libcap.so.2.78"
packages/x86-64-v3-poky-linux/libcap/libcap: PKGV changed from 2.77 [default] to 2.78 [default]
packages/x86-64-v3-poky-linux/libcap/libcap: PV changed from "2.77" to "2.78"
Changes to packages/x86-64-v3-poky-linux/libcap (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.77 to libcap.so.2.78
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.77 to libpsx.so.2.78
  /usr/lib/libcap.so.2.77 moved to /usr/lib/libcap.so.2.78
  /usr/lib/libpsx.so.2.77 moved to /usr/lib/libpsx.so.2.78
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.77 to libcap.so.2.78
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.77 to libpsx.so.2.78
  /lib/libcap.so.2.77 moved to /lib/libcap.so.2.78
  /usr/lib/libpsx.so.2.77 moved to /usr/lib/libpsx.so.2.78

--===============0202437206441084211==--

