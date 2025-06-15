Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7094C83F15
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8889.1749993282768626427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vYiRnKiS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pXf+JXHg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019773ba8a67-fdfd501f-3861-4dff-b3ff-bc369309668e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=95PWXoOUvRw1QeX1bt4NN8PmH+nRrhjE36M2pJVNHDI=;
	b=vYiRnKiSbl4J50FUsuKAiNkIkANdgcINSC09TWzGYnrv1g38IhsIcMCc2P49UZA7
	vuuUtfo2DdrI9jt058yHT6dXEcBWl6vbfaSirJnHUM51cQoScZKaUrV/8HV/fAWRbQH
	FH0YMSM9yVzeidf0CIrvob8MT4XPAoeRE93XnWD0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=95PWXoOUvRw1QeX1bt4NN8PmH+nRrhjE36M2pJVNHDI=;
	b=pXf+JXHgtlHwU6Tb+mW1aSjp2TRKWhyv1j6PgTEHZLWynkHTyxUZQKXfMajQNbjM
	9iFKw4+9nLzTyzrjZbsNDfQa4g9C699HclqEwCaiJLxs9YLfxLgGAk1P9WnperjdT9i
	tR3pE4IEYlPAjbjImN1yA6xmAEZxzdgzxDG6snQM=
Content-Type: multipart/mixed; boundary="===============8441307895348932012=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libarchive: upgrading to 3.8.0 SUCCEEDED
Message-ID: <0101019773ba8a67-fdfd501f-3861-4dff-b3ff-bc369309668e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218704

--===============8441307895348932012==
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
From 1ad5f62b184e5b90a0aa2cd12c5769fc1443f26a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 09:52:39 +0000
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


--===============8441307895348932012==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.7.9-3.8.0.patch"

RnJvbSAxYWQ1ZjYyYjE4NGU1YjkwYTBhYTJjZDEyYzU3NjlmYzE0NDNmMjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDk6NTI6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhcmNoaXZlOiB1cGdyYWRlIDMuNy45IC0+IDMuOC4wCgotLS0KIC4uLmliYXJjaGl2ZV8zLjcu
OS5iYiA9PiBsaWJhcmNoaXZlXzMuOC4wLmJifSB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL3tsaWJhcmNoaXZlXzMuNy45LmJiID0+IGxp
YmFyY2hpdmVfMy44LjAuYmJ9ICg3MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuOS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy44LjAuYmIKc2ltaWxhcml0eSBpbmRleCA3MSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcu
OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2
ZV8zLjguMC5iYgppbmRleCBkNzBjZGIzZDgzLi5hZGNlYWNmMTZhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNy45LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy44LjAuYmIKQEAgLTEs
OSArMSwzMSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcK
KyMgQEAgLTIwLDcgKzIwLDcgQEAKKyMgICAgIGxpYmFyY2hpdmUvbXRyZWUuNQorIyAgCisjICAq
IFRoZSBmb2xsb3dpbmcgc291cmNlIGZpbGVzIGFyZSBpbiB0aGUgcHVibGljIGRvbWFpbjoKKyMg
LSAgIGxpYmFyY2hpdmUvYXJjaGl2ZV9nZXRkYXRlLmMKKyMgKyAgIGxpYmFyY2hpdmUvYXJjaGl2
ZV9wYXJzZV9kYXRlLmMKKyMgIAorIyAgKiBUaGUgZm9sbG93aW5nIHNvdXJjZSBmaWxlcyBhcmUg
dHJpcGxlLWxpY2Vuc2VkIHdpdGggdGhlIGFiaWxpdHkgdG8gY2hvb3NlCisjICAgIGZyb20gQ0Mw
IDEuMCBVbml2ZXJzYWwsIE9wZW5TU0wgb3IgQXBhY2hlIDIuMCBsaWNlbnNlczoKKyMgCisjCisK
IFNVTU1BUlkgPSAiU3VwcG9ydCBmb3IgcmVhZGluZyB2YXJpb3VzIGFyY2hpdmUgZm9ybWF0cyIK
IERFU0NSSVBUSU9OID0gIkMgbGlicmFyeSBhbmQgY29tbWFuZC1saW5lIHRvb2xzIGZvciByZWFk
aW5nIGFuZCB3cml0aW5nIHRhciwgY3BpbywgemlwLCBJU08sIGFuZCBvdGhlciBhcmNoaXZlIGZv
cm1hdHMiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmxpYmFyY2hpdmUub3JnLyIKIFNFQ1RJT04g
PSAiZGV2ZWwiCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWQ0OTk4MTQyNDdhZGFlZTA4ZDg4MDgwODQxY2I1NjY1IgorTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9N2NlMDg0MzdmZjdmNWUyNGQ3MmU2
NjYzMTNhZTQwODQiCiAKIERFUEVORFMgPSAiZTJmc3Byb2dzLW5hdGl2ZSIKIApAQCAtMzEsNyAr
NTMsNyBAQCBFWFRSQV9PRUNPTkYgKz0gIi0tZW5hYmxlLWxhcmdlZmlsZSAtLXdpdGhvdXQtaWNv
bnYiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9saWJhcmNoaXZlLm9yZy9kb3dubG9hZHMvbGliYXJj
aGl2ZS0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYTkwNzMyYzVhNmJk
ZGE1MmZkYTJhZDQ2OGFjOThkNzViZTk4MWMxNWRkZTI2M2Q3YjVjZjZhZjY2ZmQwMDlmIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjE5MWI1YjI0ODExNDk5ZDVjMmU1ZWZhMzI0ODk3NWZhNmRhYTVl
NmEyMjc3MDBjYzdiOGU1NGQ2ZDdjMDZlZWYiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHVwZGF0ZS1h
bHRlcm5hdGl2ZXMgcGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============8441307895348932012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libarchive/bsdcpio: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/bsdcpio: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/bsdtar: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/bsdtar: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive: SRC_URI changed from "https://libarchive.org/downloads/libarchive-3.7.9.tar.gz" to "https://libarchive.org/downloads/libarchive-3.8.0.tar.gz"
packages/core2-64-poky-linux/libarchive: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-dbg: FILELIST: removed "/usr/lib/.debug/libarchive.so.13.7.9", added "/usr/lib/.debug/libarchive.so.13.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PKGSIZE changed from 2982584 to 3029672 (+2%)
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-dev: PKGSIZE changed from 88614 to 91830 (+4%)
packages/core2-64-poky-linux/libarchive/libarchive-dev: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-dev: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-doc: PKGSIZE changed from 373369 to 375428 (+1%)
packages/core2-64-poky-linux/libarchive/libarchive-doc: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-doc: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-locale: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-locale: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-src: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-src: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive-staticdev: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive-staticdev: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
packages/core2-64-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.7.9", added "/usr/lib/libarchive.so.13.8.0"
packages/core2-64-poky-linux/libarchive/libarchive: PKGSIZE changed from 821428 to 841908 (+2%)
packages/core2-64-poky-linux/libarchive/libarchive: PV changed from "3.7.9" to "3.8.0"
packages/core2-64-poky-linux/libarchive/libarchive: PKGV changed from 3.7.9 [default] to 3.8.0 [default]
Changes to packages/core2-64-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so.13.7.9 moved to /usr/lib/libarchive.so.13.8.0
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.9 to libarchive.so.13.8.0
  /usr/lib/libarchive.so.13.7.9 moved to /usr/lib/libarchive.so.13.8.0

--===============8441307895348932012==
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

--===============8441307895348932012==--

