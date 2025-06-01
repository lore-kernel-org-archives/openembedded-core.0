Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807ADC54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:44 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.27790.1748786127843611659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xWGfJR3o;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VtqkFRAo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101972bc6e1bd-5c38d40f-a014-4523-983c-18811d60de6b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uya8noiQqZCd2ppdGMGG/aaAU2/DlQPywAz65faV5Zw=;
	b=xWGfJR3oheBvzSLepqG8HZk+lrxdAeOalRtxBQqO5Gx6NPPpjTiZELjBXn9SAokS
	/beU8XsTYd+tC5DjmmB9OoZjVsnuM7OLt0hQYL1HlgijaTx4zoS8r/PPNhuhNBP1hBE
	HAoUyF5UA62a1/SjO5UQg8ostIl92T9vC9S/sQ5c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uya8noiQqZCd2ppdGMGG/aaAU2/DlQPywAz65faV5Zw=;
	b=VtqkFRAoViP6LjDxcRY9mKj/0YaMFDHkNoKSpYypiLyAN5PypfqCqxOBaHTjx8py
	+FNWc9DXPuKbtyNalkWlJ5xPWpp8w9T6dALfP/N2TrCGuG8PKm7/fDqbdvVJ4gCh7RN
	k2uyv9oy80axFIDAzFHqOmLZiWEi41a24C3VaraA=
Content-Type: multipart/mixed; boundary="===============2200869729911963124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libarchive: upgrading to 3.8.0 SUCCEEDED
Message-ID: <010101972bc6e1bd-5c38d40f-a014-4523-983c-18811d60de6b-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217631

--===============2200869729911963124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libarchive* to *3.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libarchive-upgrade-3.7.9-3.8.0.patch
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
From 156270765eddec35068d35a8cb9344db76e294f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 10:53:01 +0000
Subject: [PATCH] libarchive: upgrade 3.7.9 -> 3.8.0

---
 ...ibarchive_3.7.9.bb => libarchive_3.8.0.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.9.bb => libarchive_3.8.0.bb} (71%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.0.bb
similarity index 71%
rename from meta/recipes-extended/libarchive/libarchive_3.7.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.0.bb
index d70cdb3d83..adceacf16a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.0.bb
@@ -1,9 +1,31 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -20,7 +20,7 @@
+#     libarchive/mtree.5
+#  
+#  * The following source files are in the public domain:
+# -   libarchive/archive_getdate.c
+# +   libarchive/archive_parse_date.c
+#  
+#  * The following source files are triple-licensed with the ability to choose
+#    from CC0 1.0 Universal, OpenSSL or Apache 2.0 licenses:
+# 
+#
+
 SUMMARY = "Support for reading various archive formats"
 DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ce08437ff7f5e24d72e666313ae4084"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -31,7 +53,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
+SRC_URI[sha256sum] = "191b5b24811499d5c2e5efa3248975fa6daa5e6a227700cc7b8e54d6d7c06eef"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.47.1


--===============2200869729911963124==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.7.9-3.8.0.patch"

RnJvbSAxNTYyNzA3NjVlZGRlYzM1MDY4ZDM1YThjYjkzNDRkYjc2ZTI5NGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMDo1MzowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmFyY2hpdmU6IHVwZ3JhZGUgMy43LjkgLT4gMy44LjAKCi0tLQogLi4uaWJhcmNoaXZlXzMuNy45
LmJiID0+IGxpYmFyY2hpdmVfMy44LjAuYmJ9IHwgMjYgKysrKysrKysrKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUve2xpYmFyY2hpdmVfMy43LjkuYmIgPT4gbGli
YXJjaGl2ZV8zLjguMC5iYn0gKDcxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNy45LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDcxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNy45
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZl
XzMuOC4wLmJiCmluZGV4IGQ3MGNkYjNkODMuLmFkY2VhY2YxNmEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy43LjkuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguMC5iYgpAQCAtMSw5
ICsxLDMxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORwor
IyBAQCAtMjAsNyArMjAsNyBAQAorIyAgICAgbGliYXJjaGl2ZS9tdHJlZS41CisjICAKKyMgICog
VGhlIGZvbGxvd2luZyBzb3VyY2UgZmlsZXMgYXJlIGluIHRoZSBwdWJsaWMgZG9tYWluOgorIyAt
ICAgbGliYXJjaGl2ZS9hcmNoaXZlX2dldGRhdGUuYworIyArICAgbGliYXJjaGl2ZS9hcmNoaXZl
X3BhcnNlX2RhdGUuYworIyAgCisjICAqIFRoZSBmb2xsb3dpbmcgc291cmNlIGZpbGVzIGFyZSB0
cmlwbGUtbGljZW5zZWQgd2l0aCB0aGUgYWJpbGl0eSB0byBjaG9vc2UKKyMgICAgZnJvbSBDQzAg
MS4wIFVuaXZlcnNhbCwgT3BlblNTTCBvciBBcGFjaGUgMi4wIGxpY2Vuc2VzOgorIyAKKyMKKwog
U1VNTUFSWSA9ICJTdXBwb3J0IGZvciByZWFkaW5nIHZhcmlvdXMgYXJjaGl2ZSBmb3JtYXRzIgog
REVTQ1JJUFRJT04gPSAiQyBsaWJyYXJ5IGFuZCBjb21tYW5kLWxpbmUgdG9vbHMgZm9yIHJlYWRp
bmcgYW5kIHdyaXRpbmcgdGFyLCBjcGlvLCB6aXAsIElTTywgYW5kIG90aGVyIGFyY2hpdmUgZm9y
bWF0cyIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cubGliYXJjaGl2ZS5vcmcvIgogU0VDVElPTiA9
ICJkZXZlbCIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZDQ5OTgxNDI0N2FkYWVlMDhkODgwODA4NDFjYjU2NjUiCitMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03Y2UwODQzN2ZmN2Y1ZTI0ZDcyZTY2
NjMxM2FlNDA4NCIKIAogREVQRU5EUyA9ICJlMmZzcHJvZ3MtbmF0aXZlIgogCkBAIC0zMSw3ICs1
Myw3IEBAIEVYVFJBX09FQ09ORiArPSAiLS1lbmFibGUtbGFyZ2VmaWxlIC0td2l0aG91dC1pY29u
diIKIAogU1JDX1VSSSA9ICJodHRwczovL2xpYmFyY2hpdmUub3JnL2Rvd25sb2Fkcy9saWJhcmNo
aXZlLSR7UFZ9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFhOTA3MzJjNWE2YmRk
YTUyZmRhMmFkNDY4YWM5OGQ3NWJlOTgxYzE1ZGRlMjYzZDdiNWNmNmFmNjZmZDAwOWYiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMTkxYjViMjQ4MTE0OTlkNWMyZTVlZmEzMjQ4OTc1ZmE2ZGFhNWU2
YTIyNzcwMGNjN2I4ZTU0ZDZkN2MwNmVlZiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFs
dGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============2200869729911963124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libarchive/bsdcpio: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/bsdcpio: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/bsdtar: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/bsdtar: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive: SRC_URI changed from "https://libarchive.org/downloads/libarchive-3.7.9.tar.gz" to "https://libarchive.org/downloads/libarchive-3.8.0.tar.gz"
packages/core2-64-poky-linux/libarchive/libarchive-dbg: FILELIST: removed "/usr/lib/.debug/libarchive.so.13.7.9", added "/usr/lib/.debug/libarchive.so.13.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PKGSIZE changed from 2982584 to 3029672 (+2%)
packages/core2-64-poky-linux/libarchive/libarchive-dev: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-dev: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-dev: PKGSIZE changed from 88614 to 91830 (+4%)
packages/core2-64-poky-linux/libarchive/libarchive-doc: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-doc: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-doc: PKGSIZE changed from 373369 to 375428 (+1%)
packages/core2-64-poky-linux/libarchive/libarchive-locale: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-locale: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-src: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-src: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-staticdev: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-staticdev: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.7.9", added "/usr/lib/libarchive.so.13.8.0"
packages/core2-64-poky-linux/libarchive/libarchive: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive: PKGSIZE changed from 821428 to 841908 (+2%)
Changes to packages/core2-64-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so.13.7.9 moved to /usr/lib/libarchive.so.13.8.0
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so.13.7.9 moved to /usr/lib/libarchive.so.13.8.0

--===============2200869729911963124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.7.9", added "/usr/lib/libarchive.so.13.8.0"
Changes to packages/core2-64-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so.13.7.9 moved to /usr/lib/libarchive.so.13.8.0
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so.13.7.9 moved to /usr/lib/libarchive.so.13.8.0

--===============2200869729911963124==--

