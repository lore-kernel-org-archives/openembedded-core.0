Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D459DEEE278
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102979.1767267481135786650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qaSUuXv4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F8mNEMUv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b7959b412-6d5e2c32-85a2-4281-9fde-dbeb3eb4aa31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267480;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ggPZqnTomw2tkDxB2UPnwtxfQ1SgSyCzuOUvttcGLz8=;
	b=qaSUuXv4bLZphgYIcpAv9TtLQHq5XMfh4In6HzTXhtsgHDNbLKjqvTxBkiLuYMl1
	Tw5K9Gk0pXFuSsytkAXDJt1kjJ4B4bdNqyc5i36CIxulfLpFo8iAGLSiQaJJmJ4p5fE
	eiuvWzB3Nl24J+8sEqqmRdMd5AnXXb0PkNAAwlZ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267480;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ggPZqnTomw2tkDxB2UPnwtxfQ1SgSyCzuOUvttcGLz8=;
	b=F8mNEMUvqUxZtlD4ZcRUEF7tc3soUG6kZ8eN4I501xsTXGwyMZf4arNc2xz6ouAN
	cJw9sDD32lcyt1GUR5ZBpoSjQOdkaDI6OvN0ux6XAkCrStL6aEund8jyEiF6vFUAf7r
	CkR27VdWi+AEZqBJ/Y+DBc9YFM3EMdGxulqYu3r0=
Content-Type: multipart/mixed; boundary="===============2729731715462492891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-lib: upgrading to 1.2.15.1 SUCCEEDED
Message-ID: <0101019b7959b412-6d5e2c32-85a2-4281-9fde-dbeb3eb4aa31-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228800

--===============2729731715462492891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-lib* to *1.2.15.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-lib-upgrade-1.2.15-1.2.15.1.patch
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
From ab73c1516989c8585c9ded0b6210f33df95514a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 10:44:13 +0000
Subject: [PATCH] alsa-lib: upgrade 1.2.15 -> 1.2.15.1

---
 ...use-closefrom-instead-of-close_range.patch | 50 -------------------
 ...lsa-lib_1.2.15.bb => alsa-lib_1.2.15.1.bb} |  5 +-
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-closefrom-instead-of-close_range.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.bb => alsa-lib_1.2.15.1.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-closefrom-instead-of-close_range.patch b/meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-closefrom-instead-of-close_range.patch
deleted file mode 100644
index 815aca8019..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-closefrom-instead-of-close_range.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a068cf08ad67447893b707cddfce31c9cafee643 Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
-Date: Mon, 8 Dec 2025 23:46:17 -0500
-Subject: [PATCH] ucm: use closefrom instead of close_range
-
-From: Mike Gilbert <floppym@gentoo.org>
-
-closefrom is a library function with a fallback mechanism for when the
-kernel does not support the close_range syscall.
-
-Also check for the function properly instead of assuming it is available
-with _GNU_SOURCE defined.
-
-Closes: https://github.com/alsa-project/alsa-lib/pull/486
-Fixes: https://github.com/alsa-project/alsa-lib/issues/485
-Signed-off-by: Mike Gilbert <floppym@gentoo.org>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [a068cf08ad67447893b707cddfce31c9cafee643]
----
- configure.ac       | 1 +
- src/ucm/ucm_exec.c | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8f4bd0de..f4862f64 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,6 +52,7 @@ dnl Checks for library functions.
- AC_PROG_GCC_TRADITIONAL
- AC_CHECK_FUNCS([uselocale])
- AC_CHECK_FUNCS([eaccess])
-+AC_CHECK_DECLS([closefrom])
- 
- dnl Enable largefile support
- AC_SYS_LARGEFILE
-diff --git a/src/ucm/ucm_exec.c b/src/ucm/ucm_exec.c
-index b5a22023..713039b4 100644
---- a/src/ucm/ucm_exec.c
-+++ b/src/ucm/ucm_exec.c
-@@ -259,8 +259,8 @@ int uc_mgr_exec(const char *prog)
- 
- 		close(f);
- 
--#if defined(_GNU_SOURCE)
--		close_range(3, maxfd, 0);
-+#if HAVE_DECL_CLOSEFROM
-+		closefrom(3);
- #else
- 		for (f = 3; f < maxfd; f++)
- 			close(f);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
index 6ecdeefa46..f3dfd3f35d 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
-           file://0001-ucm-use-closefrom-instead-of-close_range.patch"
-SRC_URI[sha256sum] = "83770841585e766a60c99fd23f8c574c22643ae0cb1f2d20b793c3d84eb95a8d"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b91737a08bb03f566c"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============2729731715462492891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PKGSIZE changed from 150219 to 149254 (-1%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGSIZE changed from 4025800 to 4024288 (-0%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PKGSIZE changed from 506626 to 506634 (+0%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGSIZE changed from 3600810 to 3600495 (-0%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: FILELIST: directory renamed /usr/src/debug/alsa-lib/1.2.15/src/hwdep -> /usr/src/debug/alsa-lib/1.2.15.1/src/hwdep, directory renamed /usr/src/debug/alsa-lib/1.2.15/include/sound/uapi -> /usr/src/debug/alsa-lib/1.2.15.1/include/sound/uapi, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/control -> /usr/src/debug/alsa-lib/1.2.15.1/src/control, directory renamed /usr/src/debug/alsa-lib/1.2.15/src -> /usr/src/debug/alsa-lib/1.2.15.1/src, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/timer -> /usr/src/debug/alsa-lib/1.2.15.1/src/timer, directory renamed /usr/src/debug/alsa-lib/1.2.15/include -> /usr/src/debug/alsa-lib/1.2.15.1/include, directory renamed /usr/src/debug/alsa-lib/1.2.15/aserver -> /usr/src/debug/alsa-lib/1.2.15.1/aserver, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/ucm -> /usr/src/debug/alsa-lib/1.2.15.1/src/ucm, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/seq -> /usr/src/debug/alsa-lib/1.2.1
 5.1/src/seq, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/pcm -> /usr/src/debug/alsa-lib/1.2.15.1/src/pcm, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/rawmidi -> /usr/src/debug/alsa-lib/1.2.15.1/src/rawmidi, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/mixer -> /usr/src/debug/alsa-lib/1.2.15.1/src/mixer, directory renamed /usr/src/debug/alsa-lib/1.2.15/src/topology -> /usr/src/debug/alsa-lib/1.2.15.1/src/topology
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.15.tar.bz2 file://0001-ucm-use-closefrom-instead-of-close_range.patch" to "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.15.1.tar.bz2"
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]

--===============2729731715462492891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-lib-upgrade-1.2.15-1.2.15.1.patch"

RnJvbSBhYjczYzE1MTY5ODljODU4NWM5ZGVkMGI2MjEwZjMzZGY5NTUxNGEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMDo0NDoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtbGliOiB1cGdyYWRlIDEuMi4xNSAtPiAxLjIuMTUuMQoKLS0tCiAuLi51c2UtY2xvc2Vmcm9t
LWluc3RlYWQtb2YtY2xvc2VfcmFuZ2UucGF0Y2ggfCA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5sc2EtbGliXzEuMi4xNS5iYiA9PiBhbHNhLWxpYl8xLjIuMTUuMS5iYn0gfCAgNSArLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWItMS4yLjE1LzAw
MDEtdWNtLXVzZS1jbG9zZWZyb20taW5zdGVhZC1vZi1jbG9zZV9yYW5nZS5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Eve2Fsc2EtbGliXzEuMi4xNS5iYiA9PiBhbHNh
LWxpYl8xLjIuMTUuMS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9hbHNhL2Fsc2EtbGliLTEuMi4xNS8wMDAxLXVjbS11c2UtY2xvc2Vmcm9tLWluc3RlYWQt
b2YtY2xvc2VfcmFuZ2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2Et
bGliLTEuMi4xNS8wMDAxLXVjbS11c2UtY2xvc2Vmcm9tLWluc3RlYWQtb2YtY2xvc2VfcmFuZ2Uu
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDgxNWFjYTgwMTkuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYi0xLjIuMTUvMDAw
MS11Y20tdXNlLWNsb3NlZnJvbS1pbnN0ZWFkLW9mLWNsb3NlX3JhbmdlLnBhdGNoCisrKyAvZGV2
L251bGwKQEAgLTEsNTAgKzAsMCBAQAotRnJvbSBhMDY4Y2YwOGFkNjc0NDc4OTNiNzA3Y2RkZmNl
MzFjOWNhZmVlNjQzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogTWljaGFlbCBPcGRl
bmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20+Ci1EYXRlOiBNb24sIDgg
RGVjIDIwMjUgMjM6NDY6MTcgLTA1MDAKLVN1YmplY3Q6IFtQQVRDSF0gdWNtOiB1c2UgY2xvc2Vm
cm9tIGluc3RlYWQgb2YgY2xvc2VfcmFuZ2UKLQotRnJvbTogTWlrZSBHaWxiZXJ0IDxmbG9wcHlt
QGdlbnRvby5vcmc+Ci0KLWNsb3NlZnJvbSBpcyBhIGxpYnJhcnkgZnVuY3Rpb24gd2l0aCBhIGZh
bGxiYWNrIG1lY2hhbmlzbSBmb3Igd2hlbiB0aGUKLWtlcm5lbCBkb2VzIG5vdCBzdXBwb3J0IHRo
ZSBjbG9zZV9yYW5nZSBzeXNjYWxsLgotCi1BbHNvIGNoZWNrIGZvciB0aGUgZnVuY3Rpb24gcHJv
cGVybHkgaW5zdGVhZCBvZiBhc3N1bWluZyBpdCBpcyBhdmFpbGFibGUKLXdpdGggX0dOVV9TT1VS
Q0UgZGVmaW5lZC4KLQotQ2xvc2VzOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fs
c2EtbGliL3B1bGwvNDg2Ci1GaXhlczogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9h
bHNhLWxpYi9pc3N1ZXMvNDg1Ci1TaWduZWQtb2ZmLWJ5OiBNaWtlIEdpbGJlcnQgPGZsb3BweW1A
Z2VudG9vLm9yZz4KLVNpZ25lZC1vZmYtYnk6IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXgu
Y3o+Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFthMDY4Y2YwOGFkNjc0NDc4OTNiNzA3Y2Rk
ZmNlMzFjOWNhZmVlNjQzXQotLS0tCi0gY29uZmlndXJlLmFjICAgICAgIHwgMSArCi0gc3JjL3Vj
bS91Y21fZXhlYy5jIHwgNCArKy0tCi0gMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMKLWluZGV4IDhmNGJkMGRlLi5mNDg2MmY2NCAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwot
KysrIGIvY29uZmlndXJlLmFjCi1AQCAtNTIsNiArNTIsNyBAQCBkbmwgQ2hlY2tzIGZvciBsaWJy
YXJ5IGZ1bmN0aW9ucy4KLSBBQ19QUk9HX0dDQ19UUkFESVRJT05BTAotIEFDX0NIRUNLX0ZVTkNT
KFt1c2Vsb2NhbGVdKQotIEFDX0NIRUNLX0ZVTkNTKFtlYWNjZXNzXSkKLStBQ19DSEVDS19ERUNM
UyhbY2xvc2Vmcm9tXSkKLSAKLSBkbmwgRW5hYmxlIGxhcmdlZmlsZSBzdXBwb3J0Ci0gQUNfU1lT
X0xBUkdFRklMRQotZGlmZiAtLWdpdCBhL3NyYy91Y20vdWNtX2V4ZWMuYyBiL3NyYy91Y20vdWNt
X2V4ZWMuYwotaW5kZXggYjVhMjIwMjMuLjcxMzAzOWI0IDEwMDY0NAotLS0tIGEvc3JjL3VjbS91
Y21fZXhlYy5jCi0rKysgYi9zcmMvdWNtL3VjbV9leGVjLmMKLUBAIC0yNTksOCArMjU5LDggQEAg
aW50IHVjX21ncl9leGVjKGNvbnN0IGNoYXIgKnByb2cpCi0gCi0gCQljbG9zZShmKTsKLSAKLS0j
aWYgZGVmaW5lZChfR05VX1NPVVJDRSkKLS0JCWNsb3NlX3JhbmdlKDMsIG1heGZkLCAwKTsKLSsj
aWYgSEFWRV9ERUNMX0NMT1NFRlJPTQotKwkJY2xvc2Vmcm9tKDMpOwotICNlbHNlCi0gCQlmb3Ig
KGYgPSAzOyBmIDwgbWF4ZmQ7IGYrKykKLSAJCQljbG9zZShmKTsKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4yLjE1LmJiIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuMTUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4x
NS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIu
MTUuMS5iYgppbmRleCA2ZWNkZWVmYTQ2Li5mM2RmZDNmMzVkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4xLmJiCkBAIC05LDkgKzksOCBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hOTE2NDY3YjkxMDc2ZTYzMWRk
OGVkYjc0MjQ3NjljNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvc29ja2V0LmM7
bWQ1PTI4NTY3NWI0NWU4M2Y1NzFjNmE5NTdmZTRhYjc5YzkzO2JlZ2lubGluZT05O2VuZGxpbmU9
MjQgXAogICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxz
YS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvbGliLyR7QlB9LnRhci5iejIgXAotICAgICAgICAgICBm
aWxlOi8vMDAwMS11Y20tdXNlLWNsb3NlZnJvbS1pbnN0ZWFkLW9mLWNsb3NlX3JhbmdlLnBhdGNo
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgzNzcwODQxNTg1ZTc2NmE2MGM5OWZkMjNmOGM1NzRj
MjI2NDNhZTBjYjFmMmQyMGI3OTNjM2Q4NGViOTVhOGQiCitTUkNfVVJJID0gImh0dHBzOi8vd3d3
LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHViL2xpYi8ke0JQfS50YXIuYnoyIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjdmOTgzY2E4OWNhNDIwODcyY2ExNmU4YTlmOGY5N2ZiNjNkYjZjMWM2ZTI1
ODViOTE3MzdhMDhiYjAzZjU2NmMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCi0t
IAoyLjQ3LjEKCg==

--===============2729731715462492891==--

