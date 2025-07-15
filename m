Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F01FC83F3D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.12482.1752594935884226447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=I6D+kL+v;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OJs3ithh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980ecc6d4f-0c6384e8-38cb-49d5-b275-e5a853b9f13f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UuSBbAcDCXR9DaUaeuu3OyX9pZ3nyW+mqb3nB5RjVu4=;
	b=I6D+kL+vcrq8xVzyqN6QdF0cvQJ2qFC86h0+B179k932W78Dp1JPixJVPU8KEP92
	OYx94HkJzApqaq51OMz/vKAclOGedNPQtnDzOicZ/mkhhnVt8fEaz0pLS90OfsaiCVs
	vpafaehKvYd8Jcsf60kT9CUyevJshwidpz9aAvxc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UuSBbAcDCXR9DaUaeuu3OyX9pZ3nyW+mqb3nB5RjVu4=;
	b=OJs3ithhC5ac/eNfulG2Cmfjj42RxBlIUAgWymy0ZS+GzZ+doaQWrJbFL2BdXaoA
	lfCaT1xF7Anx6lsfr7cPttIO37aB7jy+iawWZuHVB5XXH46UZJBQl1fgItn+T0W5Fyx
	BJfOFfulte2hu8+jWIq+qrtnId2gb5CaGcCFs+dw=
Content-Type: multipart/mixed; boundary="===============7298944049129428262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] rt-tests,hwlatdetect: upgrading to 2.9,2.9 SUCCEEDED
Message-ID: <010101980ecc6d4f-0c6384e8-38cb-49d5-b275-e5a853b9f13f-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220322

--===============7298944049129428262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rt-tests,hwlatdetect* to *2.9,2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rt-tests-hwlatdetect-upgrade-2.8-2.9-2.8-2.9.patch
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
From 377c51ed0c288582d248bd4680481e5b7646d813 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 08:01:21 +0000
Subject: [PATCH] rt-tests,hwlatdetect: upgrade 2.8 -> 2.9,2.8 -> 2.9

---
 ...Allow-for-CC-and-AR-to-be-overridden.patch |  9 ++--
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 44 -------------------
 meta/recipes-rt/rt-tests/rt-tests.inc         |  4 +-
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |  8 ++--
 4 files changed, 10 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index fface76731..afd6be40c6 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From 7cf4cf097895bd4c3f3d3a6f783c766b3173cf1a Mon Sep 17 00:00:00 2001
+From d3000d5e451374f58b2b5649f7387761c7e640ef Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
 Signed-off-by: Randy Witt <randy.e.witt@intel.com>
 
 Upstream-Status: Inappropriate [other]
-
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 223a839..a735584 100644
+index e3d02cd..be3d48e 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -2,6 +2,6 @@
+@@ -2,8 +2,8 @@
+ include feature/test-feature.mak
+ 
  VERSION = 2.8
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
diff --git a/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 915f8baa61..0000000000
--- a/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e1f5f9379a68471c9f5fb0859e87dd84001b0b6f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Jan 2025 15:03:59 -0800
-Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
-
-Fixes builds with glibc/trunk
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-rt-users/20250128230838.2311298-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Clark Williams <williams@redhat.com>
-Cc: John Kacur <jkacur@redhat.com>
-Cc: rt-users <linux-rt-users@vger.kernel.org>
----
- src/include/rt-sched.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/include/rt-sched.h b/src/include/rt-sched.h
-index 80171c7..9cf0e3a 100644
---- a/src/include/rt-sched.h
-+++ b/src/include/rt-sched.h
-@@ -42,6 +42,8 @@
- #define __NR_sched_getattr		275
- #endif
- 
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
- 	uint32_t size;
- 	uint32_t sched_policy;
-@@ -68,4 +70,6 @@ int sched_getattr(pid_t pid,
- 		  unsigned int size,
- 		  unsigned int flags);
- 
-+#endif /* SCHED_ATTR_SIZE_VER0 */
-+
- #endif /* __RT_SCHED_H__ */
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index a2e8558c4c..f6a2969202 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "f5b910a90b6f5ab0ef6df392e009ffe1429d53af"
-PV = "2.8"
+SRCREV = "9166c3f0bb9c5d3e31dc80aff165a5073b5ac5be"
+PV = "2.9"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
index 5fa980dbdf..1565b8b451 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -9,11 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 require rt-tests.inc
 inherit ptest
 
-SRC_URI += " \
-            file://run-ptest \
-            file://rt_bmark.py \
-            file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch \
-            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
+SRC_URI += "file://run-ptest \
+           file://rt_bmark.py \
+           file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch \
            "
 
 # rt-tests needs PI mutex support in libc
-- 
2.47.1


--===============7298944049129428262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (0 cached, 941 parsed). 1929 targets, 50 skipped, 0 masked, 0 errors.
Removing 81 recipes from the core2-64 sysroot...done.
Removing 112 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'rt-tests'
rt-tests was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============7298944049129428262==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rt-tests-hwlatdetect-upgrade-2.8-2.9-2.8-2.9.patch"

RnJvbSAzNzdjNTFlZDBjMjg4NTgyZDI0OGJkNDY4MDQ4MWU1Yjc2NDZkODEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDg6MDE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dC10ZXN0cyxod2xhdGRldGVjdDogdXBncmFkZSAyLjggLT4gMi45LDIuOCAtPiAyLjkKCi0tLQog
Li4uQWxsb3ctZm9yLUNDLWFuZC1BUi10by1iZS1vdmVycmlkZGVuLnBhdGNoIHwgIDkgKystLQog
Li4uZWRfYXR0ci1Eby1ub3QtZGVmaW5lLWZvci1nbGliYy0yLjQxLnBhdGNoIHwgNDQgLS0tLS0t
LS0tLS0tLS0tLS0tLQogbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL3J0LXRlc3RzLmluYyAgICAg
ICAgIHwgIDQgKy0KIG1ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0c19naXQuYmIgICAg
ICB8ICA4ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL2ZpbGVz
LzAwMDEtc2NoZWRfYXR0ci1Eby1ub3QtZGVmaW5lLWZvci1nbGliYy0yLjQxLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL2ZpbGVzLzAwMDEtTWFrZWZpbGUtQWxs
b3ctZm9yLUNDLWFuZC1BUi10by1iZS1vdmVycmlkZGVuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXJ0
L3J0LXRlc3RzL2ZpbGVzLzAwMDEtTWFrZWZpbGUtQWxsb3ctZm9yLUNDLWFuZC1BUi10by1iZS1v
dmVycmlkZGVuLnBhdGNoCmluZGV4IGZmYWNlNzY3MzEuLmFmZDZiZTQwYzYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9maWxlcy8wMDAxLU1ha2VmaWxlLUFsbG93LWZvci1D
Qy1hbmQtQVItdG8tYmUtb3ZlcnJpZGRlbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtcnQvcnQt
dGVzdHMvZmlsZXMvMDAwMS1NYWtlZmlsZS1BbGxvdy1mb3ItQ0MtYW5kLUFSLXRvLWJlLW92ZXJy
aWRkZW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdjZjRjZjA5Nzg5NWJkNGMzZjNkM2E2
Zjc4M2M3NjZiMzE3M2NmMWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQzMDAwZDVl
NDUxMzc0ZjU4YjJiNTY0OWY3Mzg3NzYxYzdlNjQwZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSYW5keSBXaXR0IDxyYW5keS5lLndpdHRAaW50ZWwuY29tPgogRGF0ZTogRnJpLCAx
NiBPY3QgMjAyMCAxNjo1NDozMCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBNYWtlZmlsZTogQWxs
b3cgZm9yIENDIGFuZCBBUiB0byBiZSBvdmVycmlkZGVuCkBAIC05LDE2ICs5LDE3IEBAIGNvbW1p
dCA3NzYzY2YzMTZkNzg5NmZhMDViODE2YTQ2OTk4ZjA4MjdhYjZlNmViLgogU2lnbmVkLW9mZi1i
eTogUmFuZHkgV2l0dCA8cmFuZHkuZS53aXR0QGludGVsLmNvbT4KIAogVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlIFtvdGhlcl0KLQogLS0tCiAgTWFrZWZpbGUgfCA0ICsrLS0KICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXggMjIzYTgzOS4uYTczNTU4NCAxMDA2NDQKK2lu
ZGV4IGUzZDAyY2QuLmJlM2Q0OGUgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZp
bGUKLUBAIC0yLDYgKzIsNiBAQAorQEAgLTIsOCArMiw4IEBACisgaW5jbHVkZSBmZWF0dXJlL3Rl
c3QtZmVhdHVyZS5tYWsKKyAKICBWRVJTSU9OID0gMi44CiAtQ0MgPSAkKENST1NTX0NPTVBJTEUp
Z2NjCiAtQVIgPSAkKENST1NTX0NPTVBJTEUpYXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1y
dC9ydC10ZXN0cy9maWxlcy8wMDAxLXNjaGVkX2F0dHItRG8tbm90LWRlZmluZS1mb3ItZ2xpYmMt
Mi40MS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9maWxlcy8wMDAxLXNjaGVkX2F0
dHItRG8tbm90LWRlZmluZS1mb3ItZ2xpYmMtMi40MS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggOTE1ZjhiYWE2MS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtcnQv
cnQtdGVzdHMvZmlsZXMvMDAwMS1zY2hlZF9hdHRyLURvLW5vdC1kZWZpbmUtZm9yLWdsaWJjLTIu
NDEucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0NCArMCwwIEBACi1Gcm9tIGUxZjVmOTM3OWE2
ODQ3MWM5ZjVmYjA4NTllODdkZDg0MDAxYjBiNmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogVHVlLCAyOCBKYW4gMjAy
NSAxNTowMzo1OSAtMDgwMAotU3ViamVjdDogW1BBVENIXSBzY2hlZF9hdHRyOiBEbyBub3QgZGVm
aW5lIGZvciBnbGliYyA+PSAyLjQxCi0KLWdsaWJjIDIuNDErIGhhcyBhZGRlZCBbMV0gZGVmaW5p
dGlvbnMgZm9yIHNjaGVkX3NldGF0dHIgYW5kIHNjaGVkX2dldGF0dHIgZnVuY3Rpb25zCi1hbmQg
c3RydWN0IHNjaGVkX2F0dHIuIFRoZXJlZm9yZSwgaXQgbmVlZHMgdG8gYmUgY2hlY2tlZCBmb3Ig
aGVyZSBhcyB3ZWxsIGJlZm9yZQotZGVmaW5pbmcgc2NoZWRfYXR0cgotCi1EZWZpbmUgc2NoZWRf
YXR0ciBjb25kaXRpb25hbGx5IG9uIFNDSEVEX0FUVFJfU0laRV9WRVIwCi0KLUZpeGVzIGJ1aWxk
cyB3aXRoIGdsaWJjL3RydW5rCi0KLVsxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1n
bGliYy5naXQ7YT1jb21taXRkaWZmO2g9MjE1NzFjYTBkNzAzMDI5MDljZjcyNzA3YjJhNzczNmNm
MTIxOTBhMDtocD0yOThiYzQ4OGZkYzA0N2RhMzc0ODJmNDAwMzAyM2NiOWFkZWY3OGY4Ci0KLVVw
c3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
dC11c2Vycy8yMDI1MDEyODIzMDgzOC4yMzExMjk4LTEtcmFqLmtoZW1AZ21haWwuY29tL1QvI3Vd
Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotQ2M6IENsYXJr
IFdpbGxpYW1zIDx3aWxsaWFtc0ByZWRoYXQuY29tPgotQ2M6IEpvaG4gS2FjdXIgPGprYWN1ckBy
ZWRoYXQuY29tPgotQ2M6IHJ0LXVzZXJzIDxsaW51eC1ydC11c2Vyc0B2Z2VyLmtlcm5lbC5vcmc+
Ci0tLS0KLSBzcmMvaW5jbHVkZS9ydC1zY2hlZC5oIHwgNCArKysrCi0gMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2luY2x1ZGUvcnQtc2NoZWQuaCBi
L3NyYy9pbmNsdWRlL3J0LXNjaGVkLmgKLWluZGV4IDgwMTcxYzcuLjljZjBlM2EgMTAwNjQ0Ci0t
LS0gYS9zcmMvaW5jbHVkZS9ydC1zY2hlZC5oCi0rKysgYi9zcmMvaW5jbHVkZS9ydC1zY2hlZC5o
Ci1AQCAtNDIsNiArNDIsOCBAQAotICNkZWZpbmUgX19OUl9zY2hlZF9nZXRhdHRyCQkyNzUKLSAj
ZW5kaWYKLSAKLSsvKiBzY2hlZF9hdHRyIGlzIG5vdCBkZWZpbmVkIGluIGdsaWJjIDwgMi40MSAq
LwotKyNpZm5kZWYgU0NIRURfQVRUUl9TSVpFX1ZFUjAKLSBzdHJ1Y3Qgc2NoZWRfYXR0ciB7Ci0g
CXVpbnQzMl90IHNpemU7Ci0gCXVpbnQzMl90IHNjaGVkX3BvbGljeTsKLUBAIC02OCw0ICs3MCw2
IEBAIGludCBzY2hlZF9nZXRhdHRyKHBpZF90IHBpZCwKLSAJCSAgdW5zaWduZWQgaW50IHNpemUs
Ci0gCQkgIHVuc2lnbmVkIGludCBmbGFncyk7Ci0gCi0rI2VuZGlmIC8qIFNDSEVEX0FUVFJfU0la
RV9WRVIwICovCi0rCi0gI2VuZGlmIC8qIF9fUlRfU0NIRURfSF9fICovCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMvcnQtdGVzdHMuaW5jIGIvbWV0YS9yZWNpcGVzLXJ0L3J0
LXRlc3RzL3J0LXRlc3RzLmluYwppbmRleCBhMmU4NTU4YzRjLi5mNmEyOTY5MjAyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMvcnQtdGVzdHMuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0cy5pbmMKQEAgLTEsNSArMSw1IEBACi1TUkNSRVYgPSAi
ZjViOTEwYTkwYjZmNWFiMGVmNmRmMzkyZTAwOWZmZTE0MjlkNTNhZiIKLVBWID0gIjIuOCIKK1NS
Q1JFViA9ICI5MTY2YzNmMGJiOWM1ZDNlMzFkYzgwYWZmMTY1YTUwNzNiNWFjNWJlIgorUFYgPSAi
Mi45IgogUEUgPSAiMSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L3V0aWxzL3J0LXRlc3RzL3J0LXRlc3RzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0c19naXQuYmIgYi9t
ZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMvcnQtdGVzdHNfZ2l0LmJiCmluZGV4IDVmYTk4MGRiZGYu
LjE1NjViOGI0NTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0
c19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL3J0LXRlc3RzX2dpdC5iYgpA
QCAtOSwxMSArOSw5IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc1
MTQxOTI2MGFhOTU0NDk5ZjdhYmFhYmFhODgyYmJlIgogcmVxdWlyZSBydC10ZXN0cy5pbmMKIGlu
aGVyaXQgcHRlc3QKIAotU1JDX1VSSSArPSAiIFwKLSAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRl
c3QgXAotICAgICAgICAgICAgZmlsZTovL3J0X2JtYXJrLnB5IFwKLSAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLU1ha2VmaWxlLUFsbG93LWZvci1DQy1hbmQtQVItdG8tYmUtb3ZlcnJpZGRlbi5wYXRj
aCBcCi0gICAgICAgICAgICBmaWxlOi8vMDAwMS1zY2hlZF9hdHRyLURvLW5vdC1kZWZpbmUtZm9y
LWdsaWJjLTIuNDEucGF0Y2ggXAorU1JDX1VSSSArPSAiZmlsZTovL3J1bi1wdGVzdCBcCisgICAg
ICAgICAgIGZpbGU6Ly9ydF9ibWFyay5weSBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2Vm
aWxlLUFsbG93LWZvci1DQy1hbmQtQVItdG8tYmUtb3ZlcnJpZGRlbi5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAogIyBydC10ZXN0cyBuZWVkcyBQSSBtdXRleCBzdXBwb3J0IGluIGxpYmMKLS0gCjIu
NDcuMQoK

--===============7298944049129428262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGSIZE changed from 17229 to 17443 (+1%)
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/hwlatdetect: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/hwlatdetect: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests: SRC_URI changed from "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https file://run-ptest file://rt_bmark.py file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch" to "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https file://run-ptest file://rt_bmark.py file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch"
packages/core2-64-poky-linux/rt-tests: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests-dbg: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests-dbg: PKGSIZE changed from 1394728 to 1395480 (+0%)
packages/core2-64-poky-linux/rt-tests/rt-tests-dbg: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests-dev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests-dev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests-doc: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests-doc: PKGSIZE changed from 45637 to 45788 (+0%)
packages/core2-64-poky-linux/rt-tests/rt-tests-doc: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests-locale: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests-locale: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests-ptest: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests-ptest: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests-src: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests-src: PKGSIZE changed from 382468 to 381959 (-0%)
packages/core2-64-poky-linux/rt-tests/rt-tests-src: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests-staticdev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests-staticdev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/rt-tests/rt-tests: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/rt-tests/rt-tests: PV changed from "2.8" to "2.9"

--===============7298944049129428262==--

