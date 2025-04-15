Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9A2C369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:32:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20164.1744723971462386219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PSxv8KR6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nBM2L2Ia;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019639a70a93-6dc71ed2-8191-45c8-a3b2-4c75d3917a37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723970;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UUvep5zOnyWxYw6ygWwvABhtLFO6LWMWpakw2JTnnq8=;
	b=PSxv8KR6ZoriRIczU51TytAJBaq996xsmk2S/5XWAfrjGDG1++tri7GrfGyEj9cC
	Fy0DeybYRKsZMOhRnkVQ+ooNUR8qpStnYp86Hf9j1FKvPGm/XerSUCwVNQZi5mzFCP/
	c9vyT8OMnYB9wlm1VWX+fTuPmr2MrRiM/ltpfE1s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723970;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UUvep5zOnyWxYw6ygWwvABhtLFO6LWMWpakw2JTnnq8=;
	b=nBM2L2IanHQFiTQ8SjmsUtSX2NKIcD/Uf9WPJqDvkWgNyr/Er2KKpZqZeD7e86Fl
	Isk5Kv4DZzRb+sr0IFByL7HMYkQVLGRiLZPA9bUEObHnwlFpXCpKpT8400Ta8zb3HzP
	yF4CDdHK1k5aK9FCg/8hstzb6DAak7TSj8tYVyc4=
Content-Type: multipart/mixed; boundary="===============7910205791637152059=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.8.3 SUCCEEDED
Message-ID: <0101019639a70a93-6dc71ed2-8191-45c8-a3b2-4c75d3917a37-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214857

--===============7910205791637152059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.8.2-2.8.3.patch
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
From b8e33b41635fd1ceb86c956407d261e888e49ffa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 06:40:35 +0000
Subject: [PATCH] nfs-utils: upgrade 2.8.2 -> 2.8.3

---
 ...0001-Fix-typecast-warning-with-clang.patch | 32 ---------------
 ...t-Makefile.am-Do-not-use-build-flags.patch |  7 +---
 ...mon.c-fix-a-formatting-error-with-cl.patch | 40 -------------------
 .../0004-Use-nogroup-for-nobody-group.patch   |  6 +--
 .../0005-find-OE-provided-Kerberos.patch      |  4 +-
 ...{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} |  4 +-
 6 files changed, 8 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
deleted file mode 100644
index f493a3051e..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0a64c5ad17786796d84390e480a38b4f762229ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Dec 2024 19:20:39 -0800
-Subject: [PATCH v2] Fix typecast warning with clang
-
-Fixes
-file.c:200:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=173463533411103&w=2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Benjamin Coddington <bcodding@redhat.com>
-Cc: Steve Dickson <steved@redhat.com>
----
-v2: Make base as const char pointer insread of trying type punning
-
- support/nsm/file.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/support/nsm/file.c b/support/nsm/file.c
-index de122b0f..68f99bf0 100644
---- a/support/nsm/file.c
-+++ b/support/nsm/file.c
-@@ -184,7 +184,8 @@ static char *
- nsm_make_temp_pathname(const char *pathname)
- {
- 	size_t size;
--	char *path, *base;
-+	char *path;
-+	const char *base;
- 	int len;
- 
- 	size = strlen(pathname) + sizeof(".new") + 1;
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
index 351407ddcd..3eb954d963 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
@@ -1,4 +1,4 @@
-From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
+From a521a20cb02c9fc17a281333b64126f23bbab78b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 24 Jul 2023 20:39:16 -0700
 Subject: [PATCH] locktest: Makefile.am: Do not use build flags
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index e8914655..2fd36971 100644
+index e891465..2fd3697 100644
 --- a/tools/locktest/Makefile.am
 +++ b/tools/locktest/Makefile.am
 @@ -2,8 +2,5 @@
@@ -31,6 +31,3 @@ index e8914655..2fd36971 100644
 -testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
  
  MAINTAINERCLEANFILES = Makefile.in
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
deleted file mode 100644
index a99ba284e0..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From cc59a7fe15b6ca2ee43cba0dc1d699323b36ffcc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 21 Mar 2025 10:42:56 +0100
-Subject: [PATCH] support/nfs/xcommon.c: fix a formatting error with clang
-
-Specifically, this happens:
-
-| xcommon.c:101:24: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-|   101 |      vfprintf (stderr, fmt2, args);
-|       |                        ^~~~
-
-A similar approach (print \n seprately) is already used elsewhere in
-the same file.
-
-Upstream-Status: Submitted [via email to steved@redhat.com,linux-nfs@vger.kernel.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- support/nfs/xcommon.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
-index 3989f0b..1d04dd1 100644
---- a/support/nfs/xcommon.c
-+++ b/support/nfs/xcommon.c
-@@ -94,13 +94,11 @@ xstrconcat4 (const char *s, const char *t, const char *u, const char *v) {
- void
- nfs_error (const char *fmt, ...) {
-      va_list args;
--     char *fmt2;
- 
--     fmt2 = xstrconcat2 (fmt, "\n");
-      va_start (args, fmt);
--     vfprintf (stderr, fmt2, args);
-+     vfprintf (stderr, fmt, args);
-+     fprintf (stderr, "\n");
-      va_end (args);
--     free (fmt2);
- }
- 
- /* Make a canonical pathname from PATH.  Returns a freshly malloced string.
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
index bbf44d5977..0974195cab 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From 856104fc40f73fb9c141052705c7a97a4e18e417 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -11,7 +11,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
-index 2a2f79a1..e6f3724f 100644
+index 2a2f79a..e6f3724 100644
 --- a/support/nfsidmap/idmapd.conf
 +++ b/support/nfsidmap/idmapd.conf
 @@ -41,7 +41,7 @@
@@ -24,7 +24,7 @@ index 2a2f79a1..e6f3724f 100644
  [Translation]
  
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index cd9a965f..3be805e9 100644
+index 5231f56..e1aa8a5 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
index 3241e8e859..7c6c30ac9c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From 488bc1cc3174767fa2746596cb2e21ea6a0c0f05 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
@@ -10,7 +10,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
-index f96f0fd4..ad85fdf2 100644
+index f96f0fd..ad85fdf 100644
 --- a/aclocal/kerberos5.m4
 +++ b/aclocal/kerberos5.m4
 @@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
index 1f3afa0560..9668ac0e86 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
@@ -22,13 +22,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfsserver \
            file://nfscommon \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
-           file://0001-Fix-typecast-warning-with-clang.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
-           file://0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch \
            "
 
-SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
+SRC_URI[sha256sum] = "11e7c5847a8423a72931c865bd9296e7fd56ff270a795a849183900961711725"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.47.1


--===============7910205791637152059==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.2-2.8.3.patch"

RnJvbSBiOGUzM2I0MTYzNWZkMWNlYjg2Yzk1NjQwN2QyNjFlODg4ZTQ5ZmZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDY6NDA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZnMtdXRpbHM6IHVwZ3JhZGUgMi44LjIgLT4gMi44LjMKCi0tLQogLi4uMDAwMS1GaXgtdHlwZWNh
c3Qtd2FybmluZy13aXRoLWNsYW5nLnBhdGNoIHwgMzIgLS0tLS0tLS0tLS0tLS0tCiAuLi50LU1h
a2VmaWxlLmFtLURvLW5vdC11c2UtYnVpbGQtZmxhZ3MucGF0Y2ggfCAgNyArLS0tCiAuLi5tb24u
Yy1maXgtYS1mb3JtYXR0aW5nLWVycm9yLXdpdGgtY2wucGF0Y2ggfCA0MCAtLS0tLS0tLS0tLS0t
LS0tLS0tCiAuLi4vMDAwNC1Vc2Utbm9ncm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNoICAgfCAg
NiArLS0KIC4uLi8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2ggICAgICB8ICA0
ICstCiAuLi57bmZzLXV0aWxzXzIuOC4yLmJiID0+IG5mcy11dGlsc18yLjguMy5iYn0gfCAgNCAr
LQogNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11
dGlscy8wMDAxLUZpeC10eXBlY2FzdC13YXJuaW5nLXdpdGgtY2xhbmcucGF0Y2gKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMv
MDAwMy1zdXBwb3J0LW5mcy14Y29tbW9uLmMtZml4LWEtZm9ybWF0dGluZy1lcnJvci13aXRoLWNs
LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMve25mcy11
dGlsc18yLjguMi5iYiA9PiBuZnMtdXRpbHNfMi44LjMuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtRml4LXR5
cGVjYXN0LXdhcm5pbmctd2l0aC1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDAxLUZpeC10eXBlY2FzdC13YXJuaW5nLXdpdGgtY2xh
bmcucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGY0OTNhMzA1MWUuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxz
LzAwMDEtRml4LXR5cGVjYXN0LXdhcm5pbmctd2l0aC1jbGFuZy5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDMyICswLDAgQEAKLUZyb20gMGE2NGM1YWQxNzc4Njc5NmQ4NDM5MGU0ODBhMzhiNGY3
NjIyMjlhZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+Ci1EYXRlOiBXZWQsIDE4IERlYyAyMDI0IDE5OjIwOjM5IC0wODAwCi1TdWJq
ZWN0OiBbUEFUQ0ggdjJdIEZpeCB0eXBlY2FzdCB3YXJuaW5nIHdpdGggY2xhbmcKLQotRml4ZXMK
LWZpbGUuYzoyMDA6ODogZXJyb3I6IGFzc2lnbmluZyB0byAnY2hhciAqJyBmcm9tICdjb25zdCBj
aGFyIConIGRpc2NhcmRzIHF1YWxpZmllcnMgWy1XZXJyb3IsLVdpbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlcy1kaXNjYXJkcy1xdWFsaWZpZXJzXQotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRl
ZCBbaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtbmZzJm09MTczNDYzNTMzNDExMTAzJnc9Ml0K
LVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1DYzogQmVuamFt
aW4gQ29kZGluZ3RvbiA8YmNvZGRpbmdAcmVkaGF0LmNvbT4KLUNjOiBTdGV2ZSBEaWNrc29uIDxz
dGV2ZWRAcmVkaGF0LmNvbT4KLS0tLQotdjI6IE1ha2UgYmFzZSBhcyBjb25zdCBjaGFyIHBvaW50
ZXIgaW5zcmVhZCBvZiB0cnlpbmcgdHlwZSBwdW5uaW5nCi0KLSBzdXBwb3J0L25zbS9maWxlLmMg
fCAzICsrLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
LQotZGlmZiAtLWdpdCBhL3N1cHBvcnQvbnNtL2ZpbGUuYyBiL3N1cHBvcnQvbnNtL2ZpbGUuYwot
aW5kZXggZGUxMjJiMGYuLjY4Zjk5YmYwIDEwMDY0NAotLS0tIGEvc3VwcG9ydC9uc20vZmlsZS5j
Ci0rKysgYi9zdXBwb3J0L25zbS9maWxlLmMKLUBAIC0xODQsNyArMTg0LDggQEAgc3RhdGljIGNo
YXIgKgotIG5zbV9tYWtlX3RlbXBfcGF0aG5hbWUoY29uc3QgY2hhciAqcGF0aG5hbWUpCi0gewot
IAlzaXplX3Qgc2l6ZTsKLS0JY2hhciAqcGF0aCwgKmJhc2U7Ci0rCWNoYXIgKnBhdGg7Ci0rCWNv
bnN0IGNoYXIgKmJhc2U7Ci0gCWludCBsZW47Ci0gCi0gCXNpemUgPSBzdHJsZW4ocGF0aG5hbWUp
ICsgc2l6ZW9mKCIubmV3IikgKyAxOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtbG9ja3Rlc3QtTWFrZWZpbGUuYW0tRG8tbm90
LXVzZS1idWlsZC1mbGFncy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0
aWxzL25mcy11dGlscy8wMDAxLWxvY2t0ZXN0LU1ha2VmaWxlLmFtLURvLW5vdC11c2UtYnVpbGQt
ZmxhZ3MucGF0Y2gKaW5kZXggMzUxNDA3ZGRjZC4uM2ViOTU0ZDk2MyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtbG9ja3Rlc3Qt
TWFrZWZpbGUuYW0tRG8tbm90LXVzZS1idWlsZC1mbGFncy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1NYWtlZmls
ZS5hbS1Eby1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5
ZWZhN2EwZDM3NjY1ZDliYjBmNDZkMjQwNzg4M2E1YWI0MmMyYjg0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBhNTIxYTIwY2IwMmM5ZmMxN2EyODEzMzNiNjQxMjZmMjNiYmFiNzhiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IE1vbiwgMjQgSnVsIDIwMjMgMjA6Mzk6MTYgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbG9ja3Rlc3Q6IE1ha2VmaWxlLmFtOiBEbyBub3QgdXNlIGJ1aWxkIGZsYWdzCkBAIC0xOSw3
ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS90b29scy9sb2Nr
dGVzdC9NYWtlZmlsZS5hbSBiL3Rvb2xzL2xvY2t0ZXN0L01ha2VmaWxlLmFtCi1pbmRleCBlODkx
NDY1NS4uMmZkMzY5NzEgMTAwNjQ0CitpbmRleCBlODkxNDY1Li4yZmQzNjk3IDEwMDY0NAogLS0t
IGEvdG9vbHMvbG9ja3Rlc3QvTWFrZWZpbGUuYW0KICsrKyBiL3Rvb2xzL2xvY2t0ZXN0L01ha2Vm
aWxlLmFtCiBAQCAtMiw4ICsyLDUgQEAKQEAgLTMxLDYgKzMxLDMgQEAgaW5kZXggZTg5MTQ2NTUu
LjJmZDM2OTcxIDEwMDY0NAogLXRlc3Rsa19MREZMQUdTPSQoTERGTEFHU19GT1JfQlVJTEQpCiAg
CiAgTUFJTlRBSU5FUkNMRUFORklMRVMgPSBNYWtlZmlsZS5pbgotLS0gCi0yLjQxLjAKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAw
MDMtc3VwcG9ydC1uZnMteGNvbW1vbi5jLWZpeC1hLWZvcm1hdHRpbmctZXJyb3Itd2l0aC1jbC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDAz
LXN1cHBvcnQtbmZzLXhjb21tb24uYy1maXgtYS1mb3JtYXR0aW5nLWVycm9yLXdpdGgtY2wucGF0
Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE5OWJhMjg0ZTAuLjAwMDAwMDAwMDAK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDMt
c3VwcG9ydC1uZnMteGNvbW1vbi5jLWZpeC1hLWZvcm1hdHRpbmctZXJyb3Itd2l0aC1jbC5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDQwICswLDAgQEAKLUZyb20gY2M1OWE3ZmUxNWI2Y2EyZWU0
M2NiYTBkYzFkNjk5MzIzYjM2ZmZjYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBGcmksIDIxIE1hciAy
MDI1IDEwOjQyOjU2ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHN1cHBvcnQvbmZzL3hjb21tb24u
YzogZml4IGEgZm9ybWF0dGluZyBlcnJvciB3aXRoIGNsYW5nCi0KLVNwZWNpZmljYWxseSwgdGhp
cyBoYXBwZW5zOgotCi18IHhjb21tb24uYzoxMDE6MjQ6IGVycm9yOiBmb3JtYXQgc3RyaW5nIGlz
IG5vdCBhIHN0cmluZyBsaXRlcmFsIFstV2Vycm9yLC1XZm9ybWF0LW5vbmxpdGVyYWxdCi18ICAg
MTAxIHwgICAgICB2ZnByaW50ZiAoc3RkZXJyLCBmbXQyLCBhcmdzKTsKLXwgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn4KLQotQSBzaW1pbGFyIGFwcHJvYWNoIChwcmludCBcbiBz
ZXByYXRlbHkpIGlzIGFscmVhZHkgdXNlZCBlbHNld2hlcmUgaW4KLXRoZSBzYW1lIGZpbGUuCi0K
LVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFt2aWEgZW1haWwgdG8gc3RldmVkQHJlZGhhdC5j
b20sbGludXgtbmZzQHZnZXIua2VybmVsLm9yZ10KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSBzdXBwb3J0L25mcy94Y29tbW9uLmMg
fCA2ICsrLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCi0KLWRpZmYgLS1naXQgYS9zdXBwb3J0L25mcy94Y29tbW9uLmMgYi9zdXBwb3J0L25mcy94
Y29tbW9uLmMKLWluZGV4IDM5ODlmMGIuLjFkMDRkZDEgMTAwNjQ0Ci0tLS0gYS9zdXBwb3J0L25m
cy94Y29tbW9uLmMKLSsrKyBiL3N1cHBvcnQvbmZzL3hjb21tb24uYwotQEAgLTk0LDEzICs5NCwx
MSBAQCB4c3RyY29uY2F0NCAoY29uc3QgY2hhciAqcywgY29uc3QgY2hhciAqdCwgY29uc3QgY2hh
ciAqdSwgY29uc3QgY2hhciAqdikgewotIHZvaWQKLSBuZnNfZXJyb3IgKGNvbnN0IGNoYXIgKmZt
dCwgLi4uKSB7Ci0gICAgICB2YV9saXN0IGFyZ3M7Ci0tICAgICBjaGFyICpmbXQyOwotIAotLSAg
ICAgZm10MiA9IHhzdHJjb25jYXQyIChmbXQsICJcbiIpOwotICAgICAgdmFfc3RhcnQgKGFyZ3Ms
IGZtdCk7Ci0tICAgICB2ZnByaW50ZiAoc3RkZXJyLCBmbXQyLCBhcmdzKTsKLSsgICAgIHZmcHJp
bnRmIChzdGRlcnIsIGZtdCwgYXJncyk7Ci0rICAgICBmcHJpbnRmIChzdGRlcnIsICJcbiIpOwot
ICAgICAgdmFfZW5kIChhcmdzKTsKLS0gICAgIGZyZWUgKGZtdDIpOwotIH0KLSAKLSAvKiBNYWtl
IGEgY2Fub25pY2FsIHBhdGhuYW1lIGZyb20gUEFUSC4gIFJldHVybnMgYSBmcmVzaGx5IG1hbGxv
Y2VkIHN0cmluZy4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0
aWxzL25mcy11dGlscy8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNC1Vc2Utbm9n
cm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNoCmluZGV4IGJiZjQ0ZDU5NzcuLjA5NzQxOTVjYWIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
cy8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5vZ3JvdXAtZm9y
LW5vYm9keS1ncm91cC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDAxOTEzYzVlYjBhYWQ5
MzNhOTNlZTk2NjI1MjkwNWNkNDZkNzc2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ODU2MTA0ZmM0MGY3M2ZiOWMxNDEwNTI3MDVjN2E5N2E0ZTE4ZTQxNyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IERhbmllbCBNY0dyZWdvciA8ZGFuaWVsLm1jZ3JlZ29yQHZlY2ltYS5j
b20+CiBEYXRlOiBUdWUsIDYgSnVuIDIwMjMgMTY6MDc6NTMgLTA2MDAKIFN1YmplY3Q6IFtQQVRD
SF0gVXNlICJub2dyb3VwIiBmb3Igbm9ib2R5IGdyb3VwCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBNY0dyZWdvciA8ZGFuaWVsLm1jZ3JlZ29yQHZlY2ltYS5jb20+CiAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9zdXBwb3J0L25mc2lkbWFwL2lkbWFwZC5jb25mIGIvc3VwcG9ydC9uZnNpZG1hcC9p
ZG1hcGQuY29uZgotaW5kZXggMmEyZjc5YTEuLmU2ZjM3MjRmIDEwMDY0NAoraW5kZXggMmEyZjc5
YS4uZTZmMzcyNCAxMDA2NDQKIC0tLSBhL3N1cHBvcnQvbmZzaWRtYXAvaWRtYXBkLmNvbmYKICsr
KyBiL3N1cHBvcnQvbmZzaWRtYXAvaWRtYXBkLmNvbmYKIEBAIC00MSw3ICs0MSw3IEBACkBAIC0y
NCw3ICsyNCw3IEBAIGluZGV4IDJhMmY3OWExLi5lNmYzNzI0ZiAxMDA2NDQKICBbVHJhbnNsYXRp
b25dCiAgCiBkaWZmIC0tZ2l0IGEvdXRpbHMvaWRtYXBkL2lkbWFwZC5jIGIvdXRpbHMvaWRtYXBk
L2lkbWFwZC5jCi1pbmRleCBjZDlhOTY1Zi4uM2JlODA1ZTkgMTAwNjQ0CitpbmRleCA1MjMxZjU2
Li5lMWFhOGE1IDEwMDY0NAogLS0tIGEvdXRpbHMvaWRtYXBkL2lkbWFwZC5jCiArKysgYi91dGls
cy9pZG1hcGQvaWRtYXBkLmMKIEBAIC04OSw3ICs4OSw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNS1maW5kLU9FLXByb3Zp
ZGVkLUtlcmJlcm9zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMv
bmZzLXV0aWxzLzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaAppbmRleCAzMjQx
ZThlODU5Li43YzZjMzBhYzljIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA1
LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGEy
YWYyNjZmMDEzNzIyYTY0YzVkMDRlMGZlMDk3Y2Q3MTEzOTNhNTMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDQ4OGJjMWNjMzE3NDc2N2ZhMjc0NjU5NmNiMmUyMWVhNmEwYzBmMDUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEYW5pZWwgTWNHcmVnb3IgPGRhbmllbC5tY2dy
ZWdvckB2ZWNpbWEuY29tPgogRGF0ZTogV2VkLCA4IE5vdiAyMDIzIDE2OjI0OjIwIC0wNjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGZpbmQgT0UgcHJvdmlkZWQgS2VyYmVyb3MKQEAgLTEwLDcgKzEwLDcg
QEAgU2lnbmVkLW9mZi1ieTogRGFuaWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1h
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvYWNsb2NhbC9rZXJiZXJvczUubTQgYi9hY2xvY2FsL2tlcmJlcm9zNS5t
NAotaW5kZXggZjk2ZjBmZDQuLmFkODVmZGYyIDEwMDY0NAoraW5kZXggZjk2ZjBmZC4uYWQ4NWZk
ZiAxMDA2NDQKIC0tLSBhL2FjbG9jYWwva2VyYmVyb3M1Lm00CiArKysgYi9hY2xvY2FsL2tlcmJl
cm9zNS5tNAogQEAgLTIyLDggKzIyLDggQEAgQUNfREVGVU4oW0FDX0tFUkJFUk9TX1Y1XSxbCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNf
Mi44LjIuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNf
Mi44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMi44LjMuYmIKaW5kZXggMWYz
YWZhMDU2MC4uOTY2OGFjMGU4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjguMy5iYgpAQCAtMjIsMTMgKzIyLDExIEBAIFNS
Q19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZnMtdXRpbHMvJHtQVn0v
bmZzLXV0aWxzLSR7UFZ9LnRhci54CiAgICAgICAgICAgIGZpbGU6Ly9uZnNzZXJ2ZXIgXAogICAg
ICAgICAgICBmaWxlOi8vbmZzY29tbW9uIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbG9ja3Rl
c3QtTWFrZWZpbGUuYW0tRG8tbm90LXVzZS1idWlsZC1mbGFncy5wYXRjaCBcCi0gICAgICAgICAg
IGZpbGU6Ly8wMDAxLUZpeC10eXBlY2FzdC13YXJuaW5nLXdpdGgtY2xhbmcucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwNC1Vc2Utbm9ncm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaCBc
Ci0gICAgICAgICAgIGZpbGU6Ly8wMDAzLXN1cHBvcnQtbmZzLXhjb21tb24uYy1maXgtYS1mb3Jt
YXR0aW5nLWVycm9yLXdpdGgtY2wucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJhMzliYmVhNzZhYzBhYjllNmU4Njk5Y2FmM2MzMDhiNmIzMTBjMjBkNDU4ZThm
YTg2MDYxOTZkMzU4ZTdmYjE1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjExZTdjNTg0N2E4NDIz
YTcyOTMxYzg2NWJkOTI5NmU3ZmQ1NmZmMjcwYTc5NWE4NDkxODM5MDA5NjE3MTE3MjUiCiAKICMg
T25seSBrZXJuZWwtbW9kdWxlLW5mc2QgaXMgcmVxdWlyZWQgaGVyZSAoYnV0IGNhbiBiZSBidWls
dC1pbikgIC0gdGhlIG5mc2QgbW9kdWxlIHdpbGwKICMgcHVsbCBpbiB0aGUgcmVtYWluZGVyIG9m
IHRoZSBkZXBlbmRlbmNpZXMuCi0tIAoyLjQ3LjEKCg==

--===============7910205791637152059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nfs-utils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.2/nfs-utils-2.8.2.tar.xz file://nfsserver file://nfscommon file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch file://0001-Fix-typecast-warning-with-clang.patch file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch file://0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch" to "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.3/nfs-utils-2.8.3.tar.xz file://nfsserver file://nfscommon file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch"
packages/core2-64-poky-linux/nfs-utils: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PKGSIZE changed from 365981 to 365917 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGSIZE changed from 3295024 to 3276800 (-1%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGSIZE changed from 202021 to 202496 (+0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PKGSIZE changed from 146315 to 146307 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGSIZE changed from 9645 to 11836 (+23%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: FILELIST: directory renamed /usr/src/debug/nfs-utils/2.8.2/support/reexport -> /usr/src/debug/nfs-utils/2.8.3/support/reexport, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/nfsrahead -> /usr/src/debug/nfs-utils/2.8.3/tools/nfsrahead, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/showmount -> /usr/src/debug/nfs-utils/2.8.3/utils/showmount, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/nfsconf -> /usr/src/debug/nfs-utils/2.8.3/tools/nfsconf, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/junction -> /usr/src/debug/nfs-utils/2.8.3/support/junction, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsref -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsref, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/exportfs -> /usr/src/debug/nfs-utils/2.8.3/utils/exportfs, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/export -> /usr/src/debug/nfs-utils/2.8.3/support/export, directory rename
 d /usr/src/debug/nfs-utils/2.8.2/systemd -> /usr/src/debug/nfs-utils/2.8.3/systemd, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/statd -> /usr/src/debug/nfs-utils/2.8.3/utils/statd, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/mountd -> /usr/src/debug/nfs-utils/2.8.3/utils/mountd, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/rpcdebug -> /usr/src/debug/nfs-utils/2.8.3/tools/rpcdebug, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/mount -> /usr/src/debug/nfs-utils/2.8.3/utils/mount, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/nsm -> /usr/src/debug/nfs-utils/2.8.3/support/nsm, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsstat -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsstat, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/include/nfs -> /usr/src/debug/nfs-utils/2.8.3/support/include/nfs, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/nfs -> /usr/src/debug/nfs-utils/2.8.3/support/nfs, directory renamed /us
 r/src/debug/nfs-utils/2.8.2/utils/nfsd -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsd, removed "/usr/src/debug/nfs-utils/2.8.2/support/misc/tcpwrapper.c /usr/src/debug/nfs-utils/2.8.2/support/misc/from_local.c /usr/src/debug/nfs-utils/2.8.2/support/misc/file.c /usr/src/debug/nfs-utils/2.8.2/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.2/support/include/nsm.h /usr/src/debug/nfs-utils/2.8.2/support/include/exportfs.h /usr/src/debug/nfs-utils/2.8.2/support/include/workqueue.h /usr/src/debug/nfs-utils/2.8.2/support/misc/mountpoint.c /usr/src/debug/nfs-utils/2.8.2/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.2/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.2/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.2/support/include/pseudoflavors.h /usr/src/debug/nfs-utils/2.8.2/support/include/xio.h /usr/src/debug/nfs-utils/2.8.2/support/include/version.h /usr/src/debug/nfs-utils/2.8.2/support/misc/nfsd_path.c /usr/src/debug/nfs-utils/2.8.2/support/include/nfslib.h 
 /usr/src/debug/nfs-utils/2.8.2/support/include/tcpwrapper.h /usr/src/debug/nfs-utils/2.8.2/support/include/xcommon.h /usr/src/debug/nfs-utils/2.8.2/support/include/junction.h /usr/src/debug/nfs-utils/2.8.2/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.2/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.2/support/include/nfsd_path.h /usr/src/debug/nfs-utils/2.8.2/support/include/conffile.h /usr/src/debug/nfs-utils/2.8.2/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.2/support/include/misc.h /usr/src/debug/nfs-utils/2.8.2/support/misc/xstat.c /usr/src/debug/nfs-utils/2.8.2/support/include/fsloc.h /usr/src/debug/nfs-utils/2.8.2/support/include/xstat.h", added "/usr/src/debug/nfs-utils/2.8.3/support/misc/tcpwrapper.c /usr/src/debug/nfs-utils/2.8.3/support/misc/from_local.c /usr/src/debug/nfs-utils/2.8.3/support/misc/file.c /usr/src/debug/nfs-utils/2.8.3/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.3/support/include/nsm.h /usr/src/debug/nfs-utils/2.8.3/suppor
 t/include/exportfs.h /usr/src/debug/nfs-utils/2.8.3/support/include/workqueue.h /usr/src/debug/nfs-utils/2.8.3/support/misc/mountpoint.c /usr/src/debug/nfs-utils/2.8.3/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.3/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.3/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.3/support/include/pseudoflavors.h /usr/src/debug/nfs-utils/2.8.3/support/include/xio.h /usr/src/debug/nfs-utils/2.8.3/support/include/version.h /usr/src/debug/nfs-utils/2.8.3/support/misc/nfsd_path.c /usr/src/debug/nfs-utils/2.8.3/support/include/nfslib.h /usr/src/debug/nfs-utils/2.8.3/support/include/tcpwrapper.h /usr/src/debug/nfs-utils/2.8.3/support/include/xcommon.h /usr/src/debug/nfs-utils/2.8.3/support/include/junction.h /usr/src/debug/nfs-utils/2.8.3/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.3/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.3/support/include/nfsd_path.h /usr/src/debug/nfs-utils/2.8.3/support/include/conffile.
 h /usr/src/debug/nfs-utils/2.8.3/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.3/support/include/misc.h /usr/src/debug/nfs-utils/2.8.3/support/include/fsloc.h"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGSIZE changed from 971475 to 968245 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PKGSIZE changed from 77810 to 77040 (-1%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PKGSIZE changed from 601860 to 597783 (-1%)

--===============7910205791637152059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGSIZE changed from 9645 to 11836 (+23%)

--===============7910205791637152059==--

