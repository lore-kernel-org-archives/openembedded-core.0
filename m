Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43392C54E90
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11031.1747312308582241436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0YaW8nz/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Fj8bYJ72;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010196d3edeed2-3749550f-fa6e-46f4-a744-7c67b671f751-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5K1swayLod585WcITS0fEyczaeHODYx5/0DxfRjZT3c=;
	b=0YaW8nz/QxoWyndZoIpvQVXw7ZgNy0oeKLydL1jNt5FWxO26DMNNRAllzeNYDzXw
	5TOaEHVUocTU1aNZSgMTUGdiz4NStwvAp4jrn0SVwg9PFhNN6LKlYYWATBu3DSW+cqS
	jNPXCMX4UAFL54vdfSLh0mrlyMO4+eznMD8W4z48=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5K1swayLod585WcITS0fEyczaeHODYx5/0DxfRjZT3c=;
	b=Fj8bYJ721O1gzGcywSBb76smcumUBaggzofMnHFK5dXJqCGO4ZxB2bHaWVHPPrA0
	NFWBcfqWTZaviByYQV6qo4nbZJuaIbYezT0AhrrnSjYlZSmKbKYy6Do1aGasesIw4Ms
	BJTbp6FGTb+WvohSAI0G0gN16kjzNMHzaqy3GFqs=
Content-Type: multipart/mixed; boundary="===============0145317191440079471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.8.3 SUCCEEDED
Message-ID: <01010196d3edeed2-3749550f-fa6e-46f4-a744-7c67b671f751-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216590

--===============0145317191440079471==
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
From 197f1311a34d321d6ac93aec4d745c89e4e5adfe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 06:47:17 +0000
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
index 351407ddcd..51aa000bac 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
@@ -1,4 +1,4 @@
-From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
+From 2d6e4783ce52f9d140cbfd1782b23ea92fe37a3f Mon Sep 17 00:00:00 2001
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
index bbf44d5977..66393a9953 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From 952cb072cab2f7f680246a51b6d102455e10cc96 Mon Sep 17 00:00:00 2001
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
index 3241e8e859..481498cb47 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From fede43b1440018d8f90820d182412f4f5e73aaca Mon Sep 17 00:00:00 2001
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


--===============0145317191440079471==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.2-2.8.3.patch"

RnJvbSAxOTdmMTMxMWEzNGQzMjFkNmFjOTNhZWM0ZDc0NWM4OWU0ZTVhZGZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDY6NDc6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
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
ZmxhZ3MucGF0Y2gKaW5kZXggMzUxNDA3ZGRjZC4uNTFhYTAwMGJhYyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtbG9ja3Rlc3Qt
TWFrZWZpbGUuYW0tRG8tbm90LXVzZS1idWlsZC1mbGFncy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1NYWtlZmls
ZS5hbS1Eby1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5
ZWZhN2EwZDM3NjY1ZDliYjBmNDZkMjQwNzg4M2E1YWI0MmMyYjg0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAyZDZlNDc4M2NlNTJmOWQxNDBjYmZkMTc4MmIyM2VhOTJmZTM3YTNmIE1v
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
cm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNoCmluZGV4IGJiZjQ0ZDU5NzcuLjY2MzkzYTk5NTMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
cy8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5vZ3JvdXAtZm9y
LW5vYm9keS1ncm91cC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDAxOTEzYzVlYjBhYWQ5
MzNhOTNlZTk2NjI1MjkwNWNkNDZkNzc2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
OTUyY2IwNzJjYWIyZjdmNjgwMjQ2YTUxYjZkMTAyNDU1ZTEwY2M5NiBNb24gU2VwIDE3IDAwOjAw
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
ZThlODU5Li40ODE0OThjYjQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA1
LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGEy
YWYyNjZmMDEzNzIyYTY0YzVkMDRlMGZlMDk3Y2Q3MTEzOTNhNTMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGZlZGU0M2IxNDQwMDE4ZDhmOTA4MjBkMTgyNDEyZjRmNWU3M2FhY2EgTW9u
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

--===============0145317191440079471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1917 targets, 48 skipped, 0 masked, 0 errors.
Removing 149 recipes from the core2-64 sysroot...done.
Removing 153 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8c1889471cf35f881def36851bc7e597a87dc9db"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 648 Local 604 Mirrors 0 Missed 44 Current 275 (93% match, 95% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 279 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 283 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 333 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 335 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_setscene)
NOTE: Running setscene task 343 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 358 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 359 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 360 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 375 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 391 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 394 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 403 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.8.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 422 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 425 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_packagedata_setscene: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 439 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 440 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 443 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 455 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 461 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 464 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.8.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 469 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 473 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 476 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 477 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 479 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 493 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 503 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 505 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 507 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 510 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 512 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 521 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 522 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 524 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 529 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 533 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 534 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 538 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 544 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 545 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 556 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 576 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 577 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 578 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 580 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 582 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 589 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 595 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 601 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 610 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 616 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 638 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 653 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 684 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 688 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 762 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_package_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 775 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 797 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 805 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 815 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 852 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 855 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 856 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 913 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 967 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_fetch)
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 861 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1057 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_write_config)
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_fetch: Started
NOTE: Running task 1064 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: Running task 1087 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1096 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_write_config: Started
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1153 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_unpack: Started
NOTE: Running task 1154 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_write_config: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1156 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: Running task 1157 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1237 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1295 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 1314 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: Running setscene task 873 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Started
NOTE: Running task 1380 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 1390 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1402 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1406 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: Running task 1418 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_recipe_qa)
NOTE: Running task 1420 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running task 1464 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_patch: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_recipe_qa: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_fetch: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1513 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe rpcbind-1.2.7-r0: task do_unpack: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_recipe_qa unihash changed to a88a16aa5295d15da745057be7b1939c806f8c63492ea162874a97cf25911fc5
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1592 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: Running task 1594 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_fetch)
NOTE: Running task 1596 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_patch)
NOTE: recipe nfs-utils-2.8.3-r0: task do_fetch: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1597 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_unpack)
NOTE: recipe rpcbind-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe nfs-utils-2.8.3-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Succeeded
NOTE: recipe nfs-utils-2.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1600 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_patch)
NOTE: recipe nfs-utils-2.8.3-r0: task do_patch: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_patch: Succeeded
NOTE: Running task 1601 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1602 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_populate_lic)
NOTE: recipe nfs-utils-2.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_populate_lic: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nfs-utils-2.8.3-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_deploy_source_date_epoch unihash changed to cc495fcf1159f308197e8a3f001d754eaf26bc3f141511e390b16cc763721d62
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_populate_lic unihash changed to 26d08844073ca981f7c054f50fba1c9409ac6d53074ea070dae7919dd5e47c4e
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 875 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 878 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1605 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 895 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 906 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 907 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.27+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 923 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1846 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2283 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2452 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx)
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Started
NOTE: Running task 2453 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure)
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2454 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_collect_spdx_deps)
NOTE: Running task 2455 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_collect_spdx_deps)
NOTE: Running task 2456 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2457 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_create_spdx)
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Started
NOTE: Running task 2458 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx)
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2460 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile)
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Succeeded
NOTE: Running task 2461 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2462 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install)
NOTE: recipe util-linux-2.40.4-r0: task do_install: Started
NOTE: recipe util-linux-2.40.4-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2464 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot)
NOTE: Running task 2465 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2466 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2467 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2468 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2469 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2470 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_configure)
NOTE: recipe nfs-utils-2.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2471 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_configure: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2473 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_compile)
NOTE: recipe nfs-utils-2.8.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2476 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package: Succeeded
NOTE: Running task 2477 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2479 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_install)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2480 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_install)
NOTE: recipe nfs-utils-2.8.3-r0: task do_install: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_install: Succeeded
NOTE: Running task 2481 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb:do_populate_sysroot)
NOTE: recipe nfs-utils-2.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe nfs-utils-2.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2540 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata: Failed
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2482 tasks of which 2417 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515064554.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515064554.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.4/temp/log.do_packagedata.3199372
Summary: There were 164 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-liblastlog2 went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ka went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ko went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ro went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chfn went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chsh went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-enosys went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-exch went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fadvise went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fcntl-lock went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lastlog2 went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsclocks went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsfd went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-pipesz went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setpgid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uclampset went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-waitpid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkpr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.4/temp/log.do_packagedata.3199372
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata) failed with exit code '1'

--===============0145317191440079471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nfs-utils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.2/nfs-utils-2.8.2.tar.xz file://nfsserver file://nfscommon file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch file://0001-Fix-typecast-warning-with-clang.patch file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch file://0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch" to "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.3/nfs-utils-2.8.3.tar.xz file://nfsserver file://nfscommon file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch"
packages/core2-64-poky-linux/nfs-utils: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PKGSIZE changed from 365981 to 365917 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGSIZE changed from 3286864 to 3268656 (-1%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGSIZE changed from 202021 to 202496 (+0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PKGSIZE changed from 146315 to 146307 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGSIZE changed from 9645 to 11836 (+23%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGSIZE changed from 985806 to 982576 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: FILELIST: directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsstat -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsstat, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/showmount -> /usr/src/debug/nfs-utils/2.8.3/utils/showmount, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/nfsconf -> /usr/src/debug/nfs-utils/2.8.3/tools/nfsconf, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/mountd -> /usr/src/debug/nfs-utils/2.8.3/utils/mountd, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/statd -> /usr/src/debug/nfs-utils/2.8.3/utils/statd, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsref -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsref, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/reexport -> /usr/src/debug/nfs-utils/2.8.3/support/reexport, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsd -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsd, directory renamed /usr/src/debug/nfs-utils
 /2.8.2/tools/rpcdebug -> /usr/src/debug/nfs-utils/2.8.3/tools/rpcdebug, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/nfsrahead -> /usr/src/debug/nfs-utils/2.8.3/tools/nfsrahead, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/include/nfs -> /usr/src/debug/nfs-utils/2.8.3/support/include/nfs, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/nsm -> /usr/src/debug/nfs-utils/2.8.3/support/nsm, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/junction -> /usr/src/debug/nfs-utils/2.8.3/support/junction, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/mount -> /usr/src/debug/nfs-utils/2.8.3/utils/mount, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/nfs -> /usr/src/debug/nfs-utils/2.8.3/support/nfs, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/export -> /usr/src/debug/nfs-utils/2.8.3/support/export, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/exportfs -> /usr/src/debug/nfs-utils/2.8.3/utils/exportfs, directory renam
 ed /usr/src/debug/nfs-utils/2.8.2/systemd -> /usr/src/debug/nfs-utils/2.8.3/systemd, removed "/usr/src/debug/nfs-utils/2.8.2/support/include/conffile.h /usr/src/debug/nfs-utils/2.8.2/support/include/xcommon.h /usr/src/debug/nfs-utils/2.8.2/support/include/nsm.h /usr/src/debug/nfs-utils/2.8.2/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.2/support/misc/tcpwrapper.c /usr/src/debug/nfs-utils/2.8.2/support/include/sm_inter.h /usr/src/debug/nfs-utils/2.8.2/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.2/support/include/xstat.h /usr/src/debug/nfs-utils/2.8.2/support/include/junction.h /usr/src/debug/nfs-utils/2.8.2/support/include/pseudoflavors.h /usr/src/debug/nfs-utils/2.8.2/support/misc/file.c /usr/src/debug/nfs-utils/2.8.2/support/misc/from_local.c /usr/src/debug/nfs-utils/2.8.2/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.2/support/include/mount.h /usr/src/debug/nfs-utils/2.8.2/support/include/version.h /usr/src/debug/nfs-utils/2.8.2/support/misc/mountpoint.c
  /usr/src/debug/nfs-utils/2.8.2/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.2/support/include/nfsd_path.h /usr/src/debug/nfs-utils/2.8.2/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.2/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.2/support/include/tcpwrapper.h /usr/src/debug/nfs-utils/2.8.2/support/misc/xstat.c /usr/src/debug/nfs-utils/2.8.2/support/include/xio.h /usr/src/debug/nfs-utils/2.8.2/support/include/fsloc.h /usr/src/debug/nfs-utils/2.8.2/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.2/support/misc/nfsd_path.c /usr/src/debug/nfs-utils/2.8.2/support/include/nfslib.h /usr/src/debug/nfs-utils/2.8.2/support/include/misc.h /usr/src/debug/nfs-utils/2.8.2/support/include/exportfs.h /usr/src/debug/nfs-utils/2.8.2/support/include/workqueue.h", added "/usr/src/debug/nfs-utils/2.8.3/support/include/conffile.h /usr/src/debug/nfs-utils/2.8.3/support/include/xcommon.h /usr/src/debug/nfs-utils/2.8.3/support/include/nsm.h /usr/src/debug/nfs-utils/2.8
 .3/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.3/support/misc/tcpwrapper.c /usr/src/debug/nfs-utils/2.8.3/support/include/sm_inter.h /usr/src/debug/nfs-utils/2.8.3/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.3/support/include/junction.h /usr/src/debug/nfs-utils/2.8.3/support/include/pseudoflavors.h /usr/src/debug/nfs-utils/2.8.3/support/misc/file.c /usr/src/debug/nfs-utils/2.8.3/support/misc/from_local.c /usr/src/debug/nfs-utils/2.8.3/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.3/support/include/mount.h /usr/src/debug/nfs-utils/2.8.3/support/include/version.h /usr/src/debug/nfs-utils/2.8.3/support/misc/mountpoint.c /usr/src/debug/nfs-utils/2.8.3/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.3/support/include/nfsd_path.h /usr/src/debug/nfs-utils/2.8.3/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.3/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.3/support/include/tcpwrapper.h /usr/src/debug/nfs-utils/2.8.3/support/include/xio.h 
 /usr/src/debug/nfs-utils/2.8.3/support/include/fsloc.h /usr/src/debug/nfs-utils/2.8.3/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.3/support/misc/nfsd_path.c /usr/src/debug/nfs-utils/2.8.3/support/include/nfslib.h /usr/src/debug/nfs-utils/2.8.3/support/include/misc.h /usr/src/debug/nfs-utils/2.8.3/support/include/exportfs.h /usr/src/debug/nfs-utils/2.8.3/support/include/workqueue.h"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PKGSIZE changed from 77810 to 77040 (-1%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PKGSIZE changed from 601860 to 601879 (+0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PV changed from "2.8.2" to "2.8.3"

--===============0145317191440079471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGSIZE changed from 9645 to 11836 (+23%)

--===============0145317191440079471==--

