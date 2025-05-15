Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A72C71134
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11050.1747312321005425656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rlF3uHj1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DCZTpeR6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010196d3ee28b5-a9bb9c09-22a1-443c-bbd4-17519ff0dbf7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yx8XgKyBkM/vpXb+g2DTZwtXJqAFaYA+g5i92dLOczk=;
	b=rlF3uHj1FG5r5nDdR5sec/iPFYi4dPZo2xiwWcJ0HjWIrZNIlUH8hgx0ocjStQKa
	zR4J7mp9WL3QLsz+TEBlAmi1zRrNC4wHtMyHr4eP1E9gUWJxOON0uelUJfdeaozE/EU
	Jhumrn/nA9YgAmPJL9V6FN/azknKCppS+ty3oJBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yx8XgKyBkM/vpXb+g2DTZwtXJqAFaYA+g5i92dLOczk=;
	b=DCZTpeR6c5tguhbaaPmV7cTjKTvYzC2wRaRofpLfG5yayxF+kNvyLRJC5uhiIL2l
	7L1CxqTGiQVUkmhfVY1mxrFTGEmEb6HXWo/bOKAsnmFYpdFSgZ0pNE1grjBIdeeD8bg
	zo8/tKo+GvkzCres/v/VuoYY7wZMTWRJK1156GmA=
Content-Type: multipart/mixed; boundary="===============7384363865386880257=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quota: upgrading to 4.10 SUCCEEDED
Message-ID: <01010196d3ee28b5-a9bb9c09-22a1-443c-bbd4-17519ff0dbf7-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216640

--===============7384363865386880257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *quota* to *4.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-quota-upgrade-4.09-4.10.patch
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
From eff72633c5a004bc1e807974f55b31974f3b93a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 09:22:47 +0000
Subject: [PATCH] quota: upgrade 4.09 -> 4.10

---
 .../quota/0001-Fix-building-on-musl.patch     | 228 ------------------
 .../quota/{quota_4.09.bb => quota_4.10.bb}    |   6 +-
 2 files changed, 2 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
 rename meta/recipes-extended/quota/{quota_4.09.bb => quota_4.10.bb} (89%)

diff --git a/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch b/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
deleted file mode 100644
index ce20f672cc..0000000000
--- a/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From e73c5b48e12c3f02e532864a1107cdc8a4feafc3 Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Sun, 14 Jul 2024 07:58:50 +0000
-Subject: [PATCH] Fix building on musl
-
-basename(3) is defined in libgen.h in MUSL. Include libgen.h where
-basename(3) is used.
-
-Upstream-Status: Backport [https://sourceforge.net/p/linuxquota/code/ci/e73c5b48e12c3f02e532864a1107cdc8a4feafc3/]
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
----
- convertquota.c |  1 +
- edquota.c      | 11 ++++++-----
- quota.c        |  1 +
- quota_nld.c    |  1 +
- quotacheck.c   |  1 +
- quotaon.c      |  1 +
- quotastats.c   |  1 +
- quotasync.c    |  1 +
- repquota.c     |  1 +
- rquota_svc.c   |  1 +
- setquota.c     |  1 +
- warnquota.c    |  1 +
- xqmstats.c     |  1 +
- 13 files changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/convertquota.c b/convertquota.c
-index 6c8a553..4eb05ed 100644
---- a/convertquota.c
-+++ b/convertquota.c
-@@ -14,6 +14,7 @@
- #include <fcntl.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include <endian.h>
- 
-diff --git a/edquota.c b/edquota.c
-index 20ca306..c5b27cf 100644
---- a/edquota.c
-+++ b/edquota.c
-@@ -20,6 +20,7 @@
- #include <stdlib.h>
- #include <fcntl.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "quotaops.h"
-@@ -38,7 +39,7 @@ char *progname;
- static int flags, quotatype;
- static int fmt = -1;
- static char *protoname;
--static char *dirname;
-+static char *dir_name;
- 
- static void usage(void)
- {
-@@ -138,7 +139,7 @@ static int parse_options(int argc, char **argv)
- 				  exit(1);
- 			  break;
- 		  case 'f':
--			  dirname = optarg;
-+			  dir_name = optarg;
- 			  break;
- 		  case 256:
- 			  flags |= FL_NUMNAMES;
-@@ -176,7 +177,7 @@ static void copy_prototype(int argc, char **argv, struct quota_handle **handles)
- 	protoprivs = getprivs(protoid, handles, 0);
- 	while (argc-- > 0) {
- 		id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
--		curprivs = getprivs(id, handles, !dirname);
-+		curprivs = getprivs(id, handles, !dir_name);
- 		if (!curprivs)
- 			die(1, _("Cannot get quota information for user %s\n"), *argv);
- 		argv++;
-@@ -223,7 +224,7 @@ int main(int argc, char **argv)
- 	argv += ret;
- 
- 	init_kernel_interface();
--	handles = create_handle_list(dirname ? 1 : 0, dirname ? &dirname : NULL, quotatype, fmt,
-+	handles = create_handle_list(dir_name ? 1 : 0, dir_name ? &dir_name : NULL, quotatype, fmt,
- 			(flags & FL_NO_MIXED_PATHS) ? 0 : IOI_NFS_MIXED_PATHS,
- 			(flags & FL_REMOTE) ? 0 : MS_LOCALONLY);
- 	if (!handles[0]) {
-@@ -296,7 +297,7 @@ int main(int argc, char **argv)
- 	else {
- 		for (; argc > 0; argc--, argv++) {
- 			id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
--			curprivs = getprivs(id, handles, !dirname);
-+			curprivs = getprivs(id, handles, !dir_name);
- 			if (!curprivs)
- 				die(1, _("Cannot get quota information for user %s.\n"), *argv);
- 			if (flags & FL_EDIT_TIMES) {
-diff --git a/quota.c b/quota.c
-index a60de12..66b0fa3 100644
---- a/quota.c
-+++ b/quota.c
-@@ -20,6 +20,7 @@
- #include <unistd.h>
- #include <limits.h>
- #include <ctype.h>
-+#include <libgen.h>
- #ifdef RPC
- #include <rpc/rpc.h>
- #include "rquota.h"
-diff --git a/quota_nld.c b/quota_nld.c
-index 58a62af..710b556 100644
---- a/quota_nld.c
-+++ b/quota_nld.c
-@@ -26,6 +26,7 @@
- #include <fcntl.h>
- #include <limits.h>
- #include <signal.h>
-+#include <libgen.h>
- #include <sys/stat.h>
- #include <asm/types.h>
- 
-diff --git a/quotacheck.c b/quotacheck.c
-index e2c3bbd..fa1d297 100644
---- a/quotacheck.c
-+++ b/quotacheck.c
-@@ -19,6 +19,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <errno.h>
-+#include <libgen.h>
- 
- #include <sys/stat.h>
- #include <sys/types.h>
-diff --git a/quotaon.c b/quotaon.c
-index 351c851..17b6bcc 100644
---- a/quotaon.c
-+++ b/quotaon.c
-@@ -13,6 +13,7 @@
- #include <string.h>
- #include <stdlib.h>
- #include <stdarg.h>
-+#include <libgen.h>
- 
- #include "quotaon.h"
- #include "quota.h"
-diff --git a/quotastats.c b/quotastats.c
-index a059812..4076a7d 100644
---- a/quotastats.c
-+++ b/quotastats.c
-@@ -24,6 +24,7 @@
- #include <errno.h>
- #include <string.h>
- #include <signal.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/quotasync.c b/quotasync.c
-index cad2a20..e90b24a 100644
---- a/quotasync.c
-+++ b/quotasync.c
-@@ -7,6 +7,7 @@
- #include <string.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/repquota.c b/repquota.c
-index e79fc4d..8e509bd 100644
---- a/repquota.c
-+++ b/repquota.c
-@@ -18,6 +18,7 @@
- #include <pwd.h>
- #include <grp.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/rquota_svc.c b/rquota_svc.c
-index 6e856bb..c17df13 100644
---- a/rquota_svc.c
-+++ b/rquota_svc.c
-@@ -34,6 +34,7 @@
- #include <signal.h>
- #include <errno.h>
- #include <netconfig.h>
-+#include <libgen.h>
- #ifdef HOSTS_ACCESS
- #include <tcpd.h>
- #include <netdb.h>
-diff --git a/setquota.c b/setquota.c
-index c517ab1..9e4b2fa 100644
---- a/setquota.c
-+++ b/setquota.c
-@@ -18,6 +18,7 @@
- #include <time.h>
- #include <ctype.h>
- #include <stdlib.h>
-+#include <libgen.h>
- 
- #if defined(RPC)
- #include "rquota.h"
-diff --git a/warnquota.c b/warnquota.c
-index 2882fee..6f63ce7 100644
---- a/warnquota.c
-+++ b/warnquota.c
-@@ -31,6 +31,7 @@
- #include <time.h>
- #include <getopt.h>
- #include <locale.h>
-+#include <libgen.h>
- #ifdef HAVE_NL_LANGINFO
- #include <langinfo.h>
- #endif
-diff --git a/xqmstats.c b/xqmstats.c
-index 59b1d66..345b060 100644
---- a/xqmstats.c
-+++ b/xqmstats.c
-@@ -8,6 +8,7 @@
- #include <stdio.h>
- #include <unistd.h>
- #include <string.h>
-+#include <libgen.h>
- #include "common.h"
- #include "pot.h"
- 
diff --git a/meta/recipes-extended/quota/quota_4.09.bb b/meta/recipes-extended/quota/quota_4.10.bb
similarity index 89%
rename from meta/recipes-extended/quota/quota_4.09.bb
rename to meta/recipes-extended/quota/quota_4.10.bb
index 8e4d4aed8b..ea278c2a0f 100644
--- a/meta/recipes-extended/quota/quota_4.09.bb
+++ b/meta/recipes-extended/quota/quota_4.10.bb
@@ -7,10 +7,8 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://0001-Fix-building-on-musl.patch \
-           "
-SRC_URI[sha256sum] = "9cdaca154bc92afc3117f0e5f5b3208dd5f84583af1cf061c39baa0a2bb142f9"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
+SRC_URI[sha256sum] = "a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.47.1


--===============7384363865386880257==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-quota-upgrade-4.09-4.10.patch"

RnJvbSBlZmY3MjYzM2M1YTAwNGJjMWU4MDc5NzRmNTViMzE5NzRmM2I5M2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDk6MjI6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
dW90YTogdXBncmFkZSA0LjA5IC0+IDQuMTAKCi0tLQogLi4uL3F1b3RhLzAwMDEtRml4LWJ1aWxk
aW5nLW9uLW11c2wucGF0Y2ggICAgIHwgMjI4IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3F1b3Rh
L3txdW90YV80LjA5LmJiID0+IHF1b3RhXzQuMTAuYmJ9ICAgIHwgICA2ICstCiAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjMyIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9xdW90YS9xdW90YS8wMDAxLUZpeC1idWlsZGluZy1v
bi1tdXNsLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3txdW90YV80
LjA5LmJiID0+IHF1b3RhXzQuMTAuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3F1b3RhL3F1b3RhLzAwMDEtRml4LWJ1aWxkaW5nLW9uLW11c2wucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEvcXVvdGEvMDAwMS1GaXgtYnVpbGRpbmctb24tbXVz
bC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggY2UyMGY2NzJjYy4uMDAwMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEvcXVvdGEvMDAwMS1GaXgtYnVp
bGRpbmctb24tbXVzbC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDIyOCArMCwwIEBACi1Gcm9t
IGU3M2M1YjQ4ZTEyYzNmMDJlNTMyODY0YTExMDdjZGM4YTRmZWFmYzMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBCcmFobWFqaXQgRGFzIDxicmFobWFqaXQueHl6QGdtYWlsLmNvbT4K
LURhdGU6IFN1biwgMTQgSnVsIDIwMjQgMDc6NTg6NTAgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0g
Rml4IGJ1aWxkaW5nIG9uIG11c2wKLQotYmFzZW5hbWUoMykgaXMgZGVmaW5lZCBpbiBsaWJnZW4u
aCBpbiBNVVNMLiBJbmNsdWRlIGxpYmdlbi5oIHdoZXJlCi1iYXNlbmFtZSgzKSBpcyB1c2VkLgot
Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2xp
bnV4cXVvdGEvY29kZS9jaS9lNzNjNWI0OGUxMmMzZjAyZTUzMjg2NGExMTA3Y2RjOGE0ZmVhZmMz
L10KLVNpZ25lZC1vZmYtYnk6IEJyYWhtYWppdCBEYXMgPGJyYWhtYWppdC54eXpAZ21haWwuY29t
PgotU2lnbmVkLW9mZi1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KLS0tLQotIGNvbnZlcnRx
dW90YS5jIHwgIDEgKwotIGVkcXVvdGEuYyAgICAgIHwgMTEgKysrKysrLS0tLS0KLSBxdW90YS5j
ICAgICAgICB8ICAxICsKLSBxdW90YV9ubGQuYyAgICB8ICAxICsKLSBxdW90YWNoZWNrLmMgICB8
ICAxICsKLSBxdW90YW9uLmMgICAgICB8ICAxICsKLSBxdW90YXN0YXRzLmMgICB8ICAxICsKLSBx
dW90YXN5bmMuYyAgICB8ICAxICsKLSByZXBxdW90YS5jICAgICB8ICAxICsKLSBycXVvdGFfc3Zj
LmMgICB8ICAxICsKLSBzZXRxdW90YS5jICAgICB8ICAxICsKLSB3YXJucXVvdGEuYyAgICB8ICAx
ICsKLSB4cW1zdGF0cy5jICAgICB8ICAxICsKLSAxMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvY29udmVydHF1b3RhLmMgYi9j
b252ZXJ0cXVvdGEuYwotaW5kZXggNmM4YTU1My4uNGViMDVlZCAxMDA2NDQKLS0tLSBhL2NvbnZl
cnRxdW90YS5jCi0rKysgYi9jb252ZXJ0cXVvdGEuYwotQEAgLTE0LDYgKzE0LDcgQEAKLSAjaW5j
bHVkZSA8ZmNudGwuaD4KLSAjaW5jbHVkZSA8ZXJybm8uaD4KLSAjaW5jbHVkZSA8Z2V0b3B0Lmg+
Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotIAotICNpbmNsdWRlIDxlbmRpYW4uaD4KLSAKLWRpZmYg
LS1naXQgYS9lZHF1b3RhLmMgYi9lZHF1b3RhLmMKLWluZGV4IDIwY2EzMDYuLmM1YjI3Y2YgMTAw
NjQ0Ci0tLS0gYS9lZHF1b3RhLmMKLSsrKyBiL2VkcXVvdGEuYwotQEAgLTIwLDYgKzIwLDcgQEAK
LSAjaW5jbHVkZSA8c3RkbGliLmg+Ci0gI2luY2x1ZGUgPGZjbnRsLmg+Ci0gI2luY2x1ZGUgPGdl
dG9wdC5oPgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAKLSAjaW5jbHVkZSAicG90LmgiCi0gI2lu
Y2x1ZGUgInF1b3Rhb3BzLmgiCi1AQCAtMzgsNyArMzksNyBAQCBjaGFyICpwcm9nbmFtZTsKLSBz
dGF0aWMgaW50IGZsYWdzLCBxdW90YXR5cGU7Ci0gc3RhdGljIGludCBmbXQgPSAtMTsKLSBzdGF0
aWMgY2hhciAqcHJvdG9uYW1lOwotLXN0YXRpYyBjaGFyICpkaXJuYW1lOwotK3N0YXRpYyBjaGFy
ICpkaXJfbmFtZTsKLSAKLSBzdGF0aWMgdm9pZCB1c2FnZSh2b2lkKQotIHsKLUBAIC0xMzgsNyAr
MTM5LDcgQEAgc3RhdGljIGludCBwYXJzZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICoqYXJndikK
LSAJCQkJICBleGl0KDEpOwotIAkJCSAgYnJlYWs7Ci0gCQkgIGNhc2UgJ2YnOgotLQkJCSAgZGly
bmFtZSA9IG9wdGFyZzsKLSsJCQkgIGRpcl9uYW1lID0gb3B0YXJnOwotIAkJCSAgYnJlYWs7Ci0g
CQkgIGNhc2UgMjU2OgotIAkJCSAgZmxhZ3MgfD0gRkxfTlVNTkFNRVM7Ci1AQCAtMTc2LDcgKzE3
Nyw3IEBAIHN0YXRpYyB2b2lkIGNvcHlfcHJvdG90eXBlKGludCBhcmdjLCBjaGFyICoqYXJndiwg
c3RydWN0IHF1b3RhX2hhbmRsZSAqKmhhbmRsZXMpCi0gCXByb3RvcHJpdnMgPSBnZXRwcml2cyhw
cm90b2lkLCBoYW5kbGVzLCAwKTsKLSAJd2hpbGUgKGFyZ2MtLSA+IDApIHsKLSAJCWlkID0gbmFt
ZTJpZCgqYXJndiwgcXVvdGF0eXBlLCAhIShmbGFncyAmIEZMX05VTU5BTUVTKSwgTlVMTCk7Ci0t
CQljdXJwcml2cyA9IGdldHByaXZzKGlkLCBoYW5kbGVzLCAhZGlybmFtZSk7Ci0rCQljdXJwcml2
cyA9IGdldHByaXZzKGlkLCBoYW5kbGVzLCAhZGlyX25hbWUpOwotIAkJaWYgKCFjdXJwcml2cykK
LSAJCQlkaWUoMSwgXygiQ2Fubm90IGdldCBxdW90YSBpbmZvcm1hdGlvbiBmb3IgdXNlciAlc1xu
IiksICphcmd2KTsKLSAJCWFyZ3YrKzsKLUBAIC0yMjMsNyArMjI0LDcgQEAgaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQotIAlhcmd2ICs9IHJldDsKLSAKLSAJaW5pdF9rZXJuZWxfaW50
ZXJmYWNlKCk7Ci0tCWhhbmRsZXMgPSBjcmVhdGVfaGFuZGxlX2xpc3QoZGlybmFtZSA/IDEgOiAw
LCBkaXJuYW1lID8gJmRpcm5hbWUgOiBOVUxMLCBxdW90YXR5cGUsIGZtdCwKLSsJaGFuZGxlcyA9
IGNyZWF0ZV9oYW5kbGVfbGlzdChkaXJfbmFtZSA/IDEgOiAwLCBkaXJfbmFtZSA/ICZkaXJfbmFt
ZSA6IE5VTEwsIHF1b3RhdHlwZSwgZm10LAotIAkJCShmbGFncyAmIEZMX05PX01JWEVEX1BBVEhT
KSA/IDAgOiBJT0lfTkZTX01JWEVEX1BBVEhTLAotIAkJCShmbGFncyAmIEZMX1JFTU9URSkgPyAw
IDogTVNfTE9DQUxPTkxZKTsKLSAJaWYgKCFoYW5kbGVzWzBdKSB7Ci1AQCAtMjk2LDcgKzI5Nyw3
IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKLSAJZWxzZSB7Ci0gCQlmb3IgKDsg
YXJnYyA+IDA7IGFyZ2MtLSwgYXJndisrKSB7Ci0gCQkJaWQgPSBuYW1lMmlkKCphcmd2LCBxdW90
YXR5cGUsICEhKGZsYWdzICYgRkxfTlVNTkFNRVMpLCBOVUxMKTsKLS0JCQljdXJwcml2cyA9IGdl
dHByaXZzKGlkLCBoYW5kbGVzLCAhZGlybmFtZSk7Ci0rCQkJY3VycHJpdnMgPSBnZXRwcml2cyhp
ZCwgaGFuZGxlcywgIWRpcl9uYW1lKTsKLSAJCQlpZiAoIWN1cnByaXZzKQotIAkJCQlkaWUoMSwg
XygiQ2Fubm90IGdldCBxdW90YSBpbmZvcm1hdGlvbiBmb3IgdXNlciAlcy5cbiIpLCAqYXJndik7
Ci0gCQkJaWYgKGZsYWdzICYgRkxfRURJVF9USU1FUykgewotZGlmZiAtLWdpdCBhL3F1b3RhLmMg
Yi9xdW90YS5jCi1pbmRleCBhNjBkZTEyLi42NmIwZmEzIDEwMDY0NAotLS0tIGEvcXVvdGEuYwot
KysrIGIvcXVvdGEuYwotQEAgLTIwLDYgKzIwLDcgQEAKLSAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0g
I2luY2x1ZGUgPGxpbWl0cy5oPgotICNpbmNsdWRlIDxjdHlwZS5oPgotKyNpbmNsdWRlIDxsaWJn
ZW4uaD4KLSAjaWZkZWYgUlBDCi0gI2luY2x1ZGUgPHJwYy9ycGMuaD4KLSAjaW5jbHVkZSAicnF1
b3RhLmgiCi1kaWZmIC0tZ2l0IGEvcXVvdGFfbmxkLmMgYi9xdW90YV9ubGQuYwotaW5kZXggNThh
NjJhZi4uNzEwYjU1NiAxMDA2NDQKLS0tLSBhL3F1b3RhX25sZC5jCi0rKysgYi9xdW90YV9ubGQu
YwotQEAgLTI2LDYgKzI2LDcgQEAKLSAjaW5jbHVkZSA8ZmNudGwuaD4KLSAjaW5jbHVkZSA8bGlt
aXRzLmg+Ci0gI2luY2x1ZGUgPHNpZ25hbC5oPgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAjaW5j
bHVkZSA8c3lzL3N0YXQuaD4KLSAjaW5jbHVkZSA8YXNtL3R5cGVzLmg+Ci0gCi1kaWZmIC0tZ2l0
IGEvcXVvdGFjaGVjay5jIGIvcXVvdGFjaGVjay5jCi1pbmRleCBlMmMzYmJkLi5mYTFkMjk3IDEw
MDY0NAotLS0tIGEvcXVvdGFjaGVjay5jCi0rKysgYi9xdW90YWNoZWNrLmMKLUBAIC0xOSw2ICsx
OSw3IEBACi0gI2luY2x1ZGUgPHVuaXN0ZC5oPgotICNpbmNsdWRlIDxzdGRsaWIuaD4KLSAjaW5j
bHVkZSA8ZXJybm8uaD4KLSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gCi0gI2luY2x1ZGUgPHN5cy9z
dGF0Lmg+Ci0gI2luY2x1ZGUgPHN5cy90eXBlcy5oPgotZGlmZiAtLWdpdCBhL3F1b3Rhb24uYyBi
L3F1b3Rhb24uYwotaW5kZXggMzUxYzg1MS4uMTdiNmJjYyAxMDA2NDQKLS0tLSBhL3F1b3Rhb24u
YwotKysrIGIvcXVvdGFvbi5jCi1AQCAtMTMsNiArMTMsNyBAQAotICNpbmNsdWRlIDxzdHJpbmcu
aD4KLSAjaW5jbHVkZSA8c3RkbGliLmg+Ci0gI2luY2x1ZGUgPHN0ZGFyZy5oPgotKyNpbmNsdWRl
IDxsaWJnZW4uaD4KLSAKLSAjaW5jbHVkZSAicXVvdGFvbi5oIgotICNpbmNsdWRlICJxdW90YS5o
IgotZGlmZiAtLWdpdCBhL3F1b3Rhc3RhdHMuYyBiL3F1b3Rhc3RhdHMuYwotaW5kZXggYTA1OTgx
Mi4uNDA3NmE3ZCAxMDA2NDQKLS0tLSBhL3F1b3Rhc3RhdHMuYwotKysrIGIvcXVvdGFzdGF0cy5j
Ci1AQCAtMjQsNiArMjQsNyBAQAotICNpbmNsdWRlIDxlcnJuby5oPgotICNpbmNsdWRlIDxzdHJp
bmcuaD4KLSAjaW5jbHVkZSA8c2lnbmFsLmg+Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotIAotICNp
bmNsdWRlICJwb3QuaCIKLSAjaW5jbHVkZSAiY29tbW9uLmgiCi1kaWZmIC0tZ2l0IGEvcXVvdGFz
eW5jLmMgYi9xdW90YXN5bmMuYwotaW5kZXggY2FkMmEyMC4uZTkwYjI0YSAxMDA2NDQKLS0tLSBh
L3F1b3Rhc3luYy5jCi0rKysgYi9xdW90YXN5bmMuYwotQEAgLTcsNiArNyw3IEBACi0gI2luY2x1
ZGUgPHN0cmluZy5oPgotICNpbmNsdWRlIDxlcnJuby5oPgotICNpbmNsdWRlIDxnZXRvcHQuaD4K
LSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gCi0gI2luY2x1ZGUgInBvdC5oIgotICNpbmNsdWRlICJj
b21tb24uaCIKLWRpZmYgLS1naXQgYS9yZXBxdW90YS5jIGIvcmVwcXVvdGEuYwotaW5kZXggZTc5
ZmM0ZC4uOGU1MDliZCAxMDA2NDQKLS0tLSBhL3JlcHF1b3RhLmMKLSsrKyBiL3JlcHF1b3RhLmMK
LUBAIC0xOCw2ICsxOCw3IEBACi0gI2luY2x1ZGUgPHB3ZC5oPgotICNpbmNsdWRlIDxncnAuaD4K
LSAjaW5jbHVkZSA8Z2V0b3B0Lmg+Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotIAotICNpbmNsdWRl
ICJwb3QuaCIKLSAjaW5jbHVkZSAiY29tbW9uLmgiCi1kaWZmIC0tZ2l0IGEvcnF1b3RhX3N2Yy5j
IGIvcnF1b3RhX3N2Yy5jCi1pbmRleCA2ZTg1NmJiLi5jMTdkZjEzIDEwMDY0NAotLS0tIGEvcnF1
b3RhX3N2Yy5jCi0rKysgYi9ycXVvdGFfc3ZjLmMKLUBAIC0zNCw2ICszNCw3IEBACi0gI2luY2x1
ZGUgPHNpZ25hbC5oPgotICNpbmNsdWRlIDxlcnJuby5oPgotICNpbmNsdWRlIDxuZXRjb25maWcu
aD4KLSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gI2lmZGVmIEhPU1RTX0FDQ0VTUwotICNpbmNsdWRl
IDx0Y3BkLmg+Ci0gI2luY2x1ZGUgPG5ldGRiLmg+Ci1kaWZmIC0tZ2l0IGEvc2V0cXVvdGEuYyBi
L3NldHF1b3RhLmMKLWluZGV4IGM1MTdhYjEuLjllNGIyZmEgMTAwNjQ0Ci0tLS0gYS9zZXRxdW90
YS5jCi0rKysgYi9zZXRxdW90YS5jCi1AQCAtMTgsNiArMTgsNyBAQAotICNpbmNsdWRlIDx0aW1l
Lmg+Ci0gI2luY2x1ZGUgPGN0eXBlLmg+Ci0gI2luY2x1ZGUgPHN0ZGxpYi5oPgotKyNpbmNsdWRl
IDxsaWJnZW4uaD4KLSAKLSAjaWYgZGVmaW5lZChSUEMpCi0gI2luY2x1ZGUgInJxdW90YS5oIgot
ZGlmZiAtLWdpdCBhL3dhcm5xdW90YS5jIGIvd2FybnF1b3RhLmMKLWluZGV4IDI4ODJmZWUuLjZm
NjNjZTcgMTAwNjQ0Ci0tLS0gYS93YXJucXVvdGEuYwotKysrIGIvd2FybnF1b3RhLmMKLUBAIC0z
MSw2ICszMSw3IEBACi0gI2luY2x1ZGUgPHRpbWUuaD4KLSAjaW5jbHVkZSA8Z2V0b3B0Lmg+Ci0g
I2luY2x1ZGUgPGxvY2FsZS5oPgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAjaWZkZWYgSEFWRV9O
TF9MQU5HSU5GTwotICNpbmNsdWRlIDxsYW5naW5mby5oPgotICNlbmRpZgotZGlmZiAtLWdpdCBh
L3hxbXN0YXRzLmMgYi94cW1zdGF0cy5jCi1pbmRleCA1OWIxZDY2Li4zNDViMDYwIDEwMDY0NAot
LS0tIGEveHFtc3RhdHMuYwotKysrIGIveHFtc3RhdHMuYwotQEAgLTgsNiArOCw3IEBACi0gI2lu
Y2x1ZGUgPHN0ZGlvLmg+Ci0gI2luY2x1ZGUgPHVuaXN0ZC5oPgotICNpbmNsdWRlIDxzdHJpbmcu
aD4KLSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gI2luY2x1ZGUgImNvbW1vbi5oIgotICNpbmNsdWRl
ICJwb3QuaCIKLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9xdW90YS9xdW90
YV80LjA5LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3RhXzQuMTAuYmIKc2lt
aWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3Rh
L3F1b3RhXzQuMDkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9xdW90YS9xdW90
YV80LjEwLmJiCmluZGV4IDhlNGQ0YWVkOGIuLmVhMjc4YzJhMGYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9xdW90YS9xdW90YV80LjA5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9xdW90YS9xdW90YV80LjEwLmJiCkBAIC03LDEwICs3LDggQEAgTElDRU5TRSA9ICJH
UEwtMi4wLW9yLWxhdGVyICYgTEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9ycXVvdGFfc2VydmVyLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0yMDttZDU9ZmU3ZTBk
N2UxMWM2ZjgyMGY4ZmE2MmE1YWY3MTIzMGYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
c3ZjX3NvY2tldC5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MTc7bWQ1PTI0ZDVhODc5MmRhNDU5MTA3
ODZlZWFjNzUwYmU4Y2ViIgogCi1TUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS9wcm9q
ZWN0L2xpbnV4cXVvdGEvcXVvdGEtdG9vbHMvJHtQVn0vcXVvdGEtJHtQVn0udGFyLmd6IFwKLSAg
ICAgICAgICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkaW5nLW9uLW11c2wucGF0Y2ggXAotICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWNkYWNhMTU0YmM5MmFmYzMxMTdmMGU1ZjVi
MzIwOGRkNWY4NDU4M2FmMWNmMDYxYzM5YmFhMGEyYmIxNDJmOSIKK1NSQ19VUkkgPSAiJHtTT1VS
Q0VGT1JHRV9NSVJST1J9L3Byb2plY3QvbGludXhxdW90YS9xdW90YS10b29scy8ke1BWfS9xdW90
YS0ke1BWfS50YXIuZ3oiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTA0YTBjYWZjYTI5YzE1YmU4
YjZhYzY2MGUwNjE4OGJjY2I4MDJjMTllZmUyZTdjMTllZDdmM2Q2NjdlY2Y1ZSIKIAogQ1ZFX1BS
T0RVQ1QgPSAibGludXhfZGlza3F1b3RhIgogCi0tIAoyLjQ3LjEKCg==

--===============7384363865386880257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1917 targets, 48 skipped, 0 masked, 0 errors.
Removing 83 recipes from the core2-64 sysroot...done.
Removing 88 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:af9d4362a2e70f6978a0bf04b02e95702ba749d2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 428 Local 412 Mirrors 0 Missed 16 Current 244 (96% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 321 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 340 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 346 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 382 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 821 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: Running setscene task 385 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 844 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_recipe_qa)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 414 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 416 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 417 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe quota-4.10-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 420 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 430 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 432 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_recipe_qa unihash changed to 1b589fff884c603321ed6f01b7ee0ed62bbfef670040d0a431850fb00c8cc44e
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 436 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 940 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 964 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 449 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Started
NOTE: Running setscene task 462 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe quota-4.10-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe quota-4.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 466 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 467 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 472 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 474 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 477 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 490 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 494 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 496 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 502 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 505 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 518 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 523 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1065 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_unpack)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_unpack: Started
NOTE: Running setscene task 530 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1125 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 535 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 536 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe quota-4.10-r0: task do_patch: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe quota-4.10-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1148 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_populate_lic)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe quota-4.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.10-r0: task do_populate_lic: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3/3.13.2/temp/log.do_packagedata_setscene.3161993
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_populate_lic: Succeeded
NOTE: recipe quota-4.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_populate_lic unihash changed to d86226f9d4a61a3c32c7982021a6467948b62c047116d9ab0ddac32314118ccd
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_deploy_source_date_epoch unihash changed to 9a099a348af47d049b45246edb490b633e09a60be03a9b70b5f922a02445bbd7
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 554 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 559 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 603 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 616 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 672 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1663 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1713 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1833 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-3.13.2-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1837 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Succeeded
NOTE: Running task 1855 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1856 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Succeeded
NOTE: Running task 1857 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1858 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_install)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1860 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package)
NOTE: Running task 1861 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1862 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_configure)
NOTE: recipe quota-4.10-r0: task do_configure: Started
NOTE: recipe quota-4.10-r0: task do_configure: Succeeded
NOTE: Running task 1864 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_compile)
NOTE: recipe quota-4.10-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package: Succeeded
NOTE: Running task 1865 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_packagedata unihash changed to 67ca6ba82937662640f4ad9970d6ab043fa04d9021c3e0b0900ccf426ff892ab
NOTE: Setscene tasks completed
NOTE: Running task 1866 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_create_spdx)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1867 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe quota-4.10-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| make  all-recursive
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10'
| Making all in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10/po'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10/po'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10'
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quota.o quota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaops.o quotaops.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio.o quotaio.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_v1.o quotaio_v1.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_v2.o quotaio_v2.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_tree.o quotaio_tree.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_rpc.o quotaio_rpc.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_xfs.o quotaio_xfs.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_meta.o quotaio_meta.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_generic.o quotaio_generic.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o bylabel.o bylabel.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o common.o common.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotasys.o quotasys.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o pot.o pot.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/re
 cipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota.o `test -f 'rquota.c' || echo './'`rquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/re
 cipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_client.o `test -f 'rquota_client.c' || echo './'`rquota_client.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/re
 cipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_clnt.o `test -f 'rquota_clnt.c' || echo './'`rquota_clnt.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotasync.o quotasync.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/
 pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck.o `test -f 'quotacheck.c' || echo './'`quotacheck.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/
 pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v1.o `test -f 'quotacheck_v1.c' || echo './'`quotacheck_v1.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/
 pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v2.o `test -f 'quotacheck_v2.c' || echo './'`quotacheck_v2.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/
 pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotaops.o `test -f 'quotaops.c' || echo './'`quotaops.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaon.o quotaon.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaon_xfs.o quotaon_xfs.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o repquota.o repquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o warnquota.o warnquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotastats.o quotastats.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o xqmstats.o xqmstats.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o edquota.o edquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o setquota.o setquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o convertquota.o convertquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o setproject.o setproject.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o rquota_server.o rquota_server.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o rquota_svc.o rquota_svc.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot
 -native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o svc_socket.o svc_socket.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/dbus-1.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/lib/dbus-1.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/libnl3 -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quota_nld-quota_nld.o `test -f 'quota_nld.c' || echo './'`quota_nld.c
| rm -f librpcclient.a
| x86_64-poky-linux-musl-gcc-ar cr librpcclient.a librpcclient_a-rquota.o librpcclient_a-rquota_client.o librpcclient_a-rquota_clnt.o
| x86_64-poky-linux-musl-gcc-ranlib librpcclient.a
| setproject.c: In function 'main':
| setproject.c:144:20: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
|   144 |         progname = basename(argv[0]);
|       |                    ^~~~~~~~
| setproject.c:144:18: error: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
|   144 |         progname = basename(argv[0]);
|       |                  ^
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/
 pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu   -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -Wl,-z,relro,-z,now -ltirpc -o xqmstats xqmstats.o common.o pot.o
| make[2]: *** [Makefile:1050: setproject.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10'
| make[1]: *** [Makefile:1413: all-recursive] Error 1
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/quota-4.10'
| make: *** [Makefile:790: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974, line 182
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974, line 166
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974, line 161
| 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974, line 156
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974, line 151
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974, line 195
NOTE: recipe quota-4.10-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1867 tasks of which 1841 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515092159.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515092159.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/log.do_compile.3175974
Summary: There were 72 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: quota-4.10-r0 do_compile: oe_runmake failed
ERROR: quota-4.10-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.3175974' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/log.do_compile.3175974
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_compile) failed with exit code '1'

--===============7384363865386880257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/quota: SRC_URI changed from "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.09/quota-4.09.tar.gz file://0001-Fix-building-on-musl.patch" to "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.10/quota-4.10.tar.gz"
packages/core2-64-poky-linux/quota: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-dbg: PKGSIZE changed from 3183776 to 3285216 (+3%)
packages/core2-64-poky-linux/quota/quota-dbg: FILELIST: added "/usr/sbin/.debug/setproject"
packages/core2-64-poky-linux/quota/quota-dbg: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-dbg: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-dev: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-dev: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-doc: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-doc: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-cs: PKGSIZE changed from 61583 to 61496 (-0%)
packages/core2-64-poky-linux/quota/quota-locale-cs: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-cs: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-de: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-de: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-fr: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-fr: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-pl: PKGSIZE changed from 62344 to 88646 (+42%)
packages/core2-64-poky-linux/quota/quota-locale-pl: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-pl: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-src: PKGSIZE changed from 421763 to 428461 (+2%)
packages/core2-64-poky-linux/quota/quota-src: FILELIST: removed "/usr/src/debug/quota/4.09/pot.h /usr/src/debug/quota/4.09/rquota_client.c /usr/src/debug/quota/4.09/rquota_server.c /usr/src/debug/quota/4.09/pot.c /usr/src/debug/quota/4.09/rquota_client.h /usr/src/debug/quota/4.09/common.h /usr/src/debug/quota/4.09/rquota.h /usr/src/debug/quota/4.09/dqblk_v2.h /usr/src/debug/quota/4.09/rquota.c /usr/src/debug/quota/4.09/common.c /usr/src/debug/quota/4.09/quotaio_xfs.c /usr/src/debug/quota/4.09/quota_nld.c /usr/src/debug/quota/4.09/bylabel.h /usr/src/debug/quota/4.09/dqblk_rpc.h /usr/src/debug/quota/4.09/quotaio_meta.c /usr/src/debug/quota/4.09/quotaio_xfs.h /usr/src/debug/quota/4.09/xqmstats.c /usr/src/debug/quota/4.09/bylabel.c /usr/src/debug/quota/4.09/dqblk_v1.h /usr/src/debug/quota/4.09/quota_tree.h /usr/src/debug/quota/4.09/warnquota.c /usr/src/debug/quota/4.09/quotaio.h /usr/src/debug/quota/4.09/quotaops.h /usr/src/debug/quota/4.09/rquota_svc.c /usr/src/debug/quota/4.09/quotaon.
 h /usr/src/debug/quota/4.09/quotaops.c /usr/src/debug/quota/4.09/quotaio.c /usr/src/debug/quota/4.09/svc_socket.c /usr/src/debug/quota/4.09/quotaon.c /usr/src/debug/quota/4.09/edquota.c /usr/src/debug/quota/4.09/quotaio_rpc.c /usr/src/debug/quota/4.09/convertquota.c /usr/src/debug/quota/4.09/quotaon_xfs.c /usr/src/debug/quota/4.09/quotacheck.h /usr/src/debug/quota/4.09/quota.c /usr/src/debug/quota/4.09/quotacheck.c /usr/src/debug/quota/4.09/quota.h /usr/src/debug/quota/4.09/quotaio_v1.c /usr/src/debug/quota/4.09/quotaio_generic.c /usr/src/debug/quota/4.09/quotacheck_v1.c /usr/src/debug/quota/4.09/quotacheck_v2.c /usr/src/debug/quota/4.09/quotaio_v2.h /usr/src/debug/quota/4.09/quotasync.c /usr/src/debug/quota/4.09/quotasys.h /usr/src/debug/quota/4.09/quotaio_generic.h /usr/src/debug/quota/4.09/quotaio_tree.c /usr/src/debug/quota/4.09/quotaio_v1.h /usr/src/debug/quota/4.09/dqblk_xfs.h /usr/src/debug/quota/4.09/quotaio_v2.c /usr/src/debug/quota/4.09/quotasys.c /usr/src/debug/quota/4.09
 /repquota.c /usr/src/debug/quota/4.09/rquota_clnt.c /usr/src/debug/quota/4.09/setquota.c /usr/src/debug/quota/4.09/quotastats.c", added "/usr/src/debug/quota/4.10/quota_nld.c /usr/src/debug/quota/4.10/quotaio.h /usr/src/debug/quota/4.10/quotaio_generic.h /usr/src/debug/quota/4.10/bylabel.c /usr/src/debug/quota/4.10/quota_tree.h /usr/src/debug/quota/4.10/quotaio.c /usr/src/debug/quota/4.10/quotaon_xfs.c /usr/src/debug/quota/4.10/bylabel.h /usr/src/debug/quota/4.10/quotaio_generic.c /usr/src/debug/quota/4.10/repquota.c /usr/src/debug/quota/4.10/setquota.c /usr/src/debug/quota/4.10/quotacheck.c /usr/src/debug/quota/4.10/quotaio_tree.c /usr/src/debug/quota/4.10/quotacheck.h /usr/src/debug/quota/4.10/dqblk_v1.h /usr/src/debug/quota/4.10/dqblk_v2.h /usr/src/debug/quota/4.10/setproject.c /usr/src/debug/quota/4.10/dqblk_xfs.h /usr/src/debug/quota/4.10/warnquota.c /usr/src/debug/quota/4.10/convertquota.c /usr/src/debug/quota/4.10/quota.c /usr/src/debug/quota/4.10/quotaio_xfs.h /usr/src/debug
 /quota/4.10/quotaio_v2.h /usr/src/debug/quota/4.10/svc_socket.c /usr/src/debug/quota/4.10/quota.h /usr/src/debug/quota/4.10/quotaio_xfs.c /usr/src/debug/quota/4.10/quotastats.c /usr/src/debug/quota/4.10/quotaio_v2.c /usr/src/debug/quota/4.10/quotaio_v1.h /usr/src/debug/quota/4.10/common.h /usr/src/debug/quota/4.10/rquota.h /usr/src/debug/quota/4.10/quotaio_v1.c /usr/src/debug/quota/4.10/rquota_clnt.c /usr/src/debug/quota/4.10/common.c /usr/src/debug/quota/4.10/rquota.c /usr/src/debug/quota/4.10/rquota_client.h /usr/src/debug/quota/4.10/quotasync.c /usr/src/debug/quota/4.10/pot.c /usr/src/debug/quota/4.10/quotaio_rpc.c /usr/src/debug/quota/4.10/quotaio_meta.c /usr/src/debug/quota/4.10/pot.h /usr/src/debug/quota/4.10/edquota.c /usr/src/debug/quota/4.10/quotaops.c /usr/src/debug/quota/4.10/dqblk_rpc.h /usr/src/debug/quota/4.10/quotaops.h /usr/src/debug/quota/4.10/xqmstats.c /usr/src/debug/quota/4.10/rquota_client.c /usr/src/debug/quota/4.10/quotacheck_v1.c /usr/src/debug/quota/4.10/quo
 tacheck_v2.c /usr/src/debug/quota/4.10/quotaon.c /usr/src/debug/quota/4.10/quotasys.h /usr/src/debug/quota/4.10/rquota_server.c /usr/src/debug/quota/4.10/quotaon.h /usr/src/debug/quota/4.10/quotasys.c /usr/src/debug/quota/4.10/rquota_svc.c"
packages/core2-64-poky-linux/quota/quota-src: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-src: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-staticdev: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-staticdev: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota: PKGSIZE changed from 994462 to 1041606 (+5%)
packages/core2-64-poky-linux/quota/quota: FILELIST: added "/usr/sbin/setproject"
packages/core2-64-poky-linux/quota/quota: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota: PV changed from "4.09" to "4.10"

--===============7384363865386880257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/quota/quota-locale-pl: PKGSIZE changed from 62344 to 88646 (+42%)
packages/core2-64-poky-linux/quota/quota: FILELIST: added "/usr/sbin/setproject"

--===============7384363865386880257==--

