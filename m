Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0637C88CB9
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.88627.1754057268394555874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Gszi4dkq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Vyo9XXbN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019865f60123-98e2d378-c4bc-4aa4-adad-be193d8d79e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7eynTATtHdH5kyJtURXFULm+qsSBpRVTKCSxWCdgpTc=;
	b=Gszi4dkq4IMmb7QoH9BXQDHkRiZr9GOFlrmylCM51JWhBTrg97zatQl/lwYHZtds
	OXfphH8qOw1PyWl3nSdbksTp+Q5AolxIdco3tLxI0IKa/YRyFViKlahquBxKDYiBN0S
	nCLVDepXCBFtDOBALCaV4HRFq8CNjs91g3BCwkRk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7eynTATtHdH5kyJtURXFULm+qsSBpRVTKCSxWCdgpTc=;
	b=Vyo9XXbNDDtnFhAP2SZ4XfqD7HZ3foQ6nPbz9VSVBYCjxbk6YQBwveST/b9rcd9Y
	pk75w4NUjk/s3CIyOafzUI66NaxmjKQ8OkJbFpp1Ry1qKbxWg2Lj+DIn4vL8TwJldrN
	E9If0rs7okayxBotq0Sm+JFnkZBQglvr52WT7GKA=
Content-Type: multipart/mixed; boundary="===============6297865940027329383=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quota: upgrading to 4.10 FAILED
Message-ID: <0101019865f60123-98e2d378-c4bc-4aa4-adad-be193d8d79e3-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221298

--===============6297865940027329383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *quota* to *4.10* has Failed(do_compile).

Detailed error information:

do_compile failed



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
From 047cb30db130fe9d8a0ac584701eec2eeb1e96b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:38:09 +0000
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


--===============6297865940027329383==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-quota-upgrade-4.09-4.10.patch"

RnJvbSAwNDdjYjMwZGIxMzBmZTlkOGEwYWM1ODQ3MDFlZWMyZWViMWU5NmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDozODowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHF1
b3RhOiB1cGdyYWRlIDQuMDkgLT4gNC4xMAoKLS0tCiAuLi4vcXVvdGEvMDAwMS1GaXgtYnVpbGRp
bmctb24tbXVzbC5wYXRjaCAgICAgfCAyMjggLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vcXVvdGEv
e3F1b3RhXzQuMDkuYmIgPT4gcXVvdGFfNC4xMC5iYn0gICAgfCAgIDYgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyMzIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3RhLzAwMDEtRml4LWJ1aWxkaW5nLW9u
LW11c2wucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEve3F1b3RhXzQu
MDkuYmIgPT4gcXVvdGFfNC4xMC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvcXVvdGEvcXVvdGEvMDAwMS1GaXgtYnVpbGRpbmctb24tbXVzbC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9xdW90YS9xdW90YS8wMDAxLUZpeC1idWlsZGluZy1vbi1tdXNs
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBjZTIwZjY3MmNjLi4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9xdW90YS9xdW90YS8wMDAxLUZpeC1idWls
ZGluZy1vbi1tdXNsLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjI4ICswLDAgQEAKLUZyb20g
ZTczYzViNDhlMTJjM2YwMmU1MzI4NjRhMTEwN2NkYzhhNGZlYWZjMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IEJyYWhtYWppdCBEYXMgPGJyYWhtYWppdC54eXpAZ21haWwuY29tPgot
RGF0ZTogU3VuLCAxNCBKdWwgMjAyNCAwNzo1ODo1MCArMDAwMAotU3ViamVjdDogW1BBVENIXSBG
aXggYnVpbGRpbmcgb24gbXVzbAotCi1iYXNlbmFtZSgzKSBpcyBkZWZpbmVkIGluIGxpYmdlbi5o
IGluIE1VU0wuIEluY2x1ZGUgbGliZ2VuLmggd2hlcmUKLWJhc2VuYW1lKDMpIGlzIHVzZWQuCi0K
LVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc291cmNlZm9yZ2UubmV0L3AvbGlu
dXhxdW90YS9jb2RlL2NpL2U3M2M1YjQ4ZTEyYzNmMDJlNTMyODY0YTExMDdjZGM4YTRmZWFmYzMv
XQotU2lnbmVkLW9mZi1ieTogQnJhaG1haml0IERhcyA8YnJhaG1haml0Lnh5ekBnbWFpbC5jb20+
Ci1TaWduZWQtb2ZmLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgotLS0tCi0gY29udmVydHF1
b3RhLmMgfCAgMSArCi0gZWRxdW90YS5jICAgICAgfCAxMSArKysrKystLS0tLQotIHF1b3RhLmMg
ICAgICAgIHwgIDEgKwotIHF1b3RhX25sZC5jICAgIHwgIDEgKwotIHF1b3RhY2hlY2suYyAgIHwg
IDEgKwotIHF1b3Rhb24uYyAgICAgIHwgIDEgKwotIHF1b3Rhc3RhdHMuYyAgIHwgIDEgKwotIHF1
b3Rhc3luYy5jICAgIHwgIDEgKwotIHJlcHF1b3RhLmMgICAgIHwgIDEgKwotIHJxdW90YV9zdmMu
YyAgIHwgIDEgKwotIHNldHF1b3RhLmMgICAgIHwgIDEgKwotIHdhcm5xdW90YS5jICAgIHwgIDEg
KwotIHhxbXN0YXRzLmMgICAgIHwgIDEgKwotIDEzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9jb252ZXJ0cXVvdGEuYyBiL2Nv
bnZlcnRxdW90YS5jCi1pbmRleCA2YzhhNTUzLi40ZWIwNWVkIDEwMDY0NAotLS0tIGEvY29udmVy
dHF1b3RhLmMKLSsrKyBiL2NvbnZlcnRxdW90YS5jCi1AQCAtMTQsNiArMTQsNyBAQAotICNpbmNs
dWRlIDxmY250bC5oPgotICNpbmNsdWRlIDxlcnJuby5oPgotICNpbmNsdWRlIDxnZXRvcHQuaD4K
LSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gCi0gI2luY2x1ZGUgPGVuZGlhbi5oPgotIAotZGlmZiAt
LWdpdCBhL2VkcXVvdGEuYyBiL2VkcXVvdGEuYwotaW5kZXggMjBjYTMwNi4uYzViMjdjZiAxMDA2
NDQKLS0tLSBhL2VkcXVvdGEuYwotKysrIGIvZWRxdW90YS5jCi1AQCAtMjAsNiArMjAsNyBAQAot
ICNpbmNsdWRlIDxzdGRsaWIuaD4KLSAjaW5jbHVkZSA8ZmNudGwuaD4KLSAjaW5jbHVkZSA8Z2V0
b3B0Lmg+Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotIAotICNpbmNsdWRlICJwb3QuaCIKLSAjaW5j
bHVkZSAicXVvdGFvcHMuaCIKLUBAIC0zOCw3ICszOSw3IEBAIGNoYXIgKnByb2duYW1lOwotIHN0
YXRpYyBpbnQgZmxhZ3MsIHF1b3RhdHlwZTsKLSBzdGF0aWMgaW50IGZtdCA9IC0xOwotIHN0YXRp
YyBjaGFyICpwcm90b25hbWU7Ci0tc3RhdGljIGNoYXIgKmRpcm5hbWU7Ci0rc3RhdGljIGNoYXIg
KmRpcl9uYW1lOwotIAotIHN0YXRpYyB2b2lkIHVzYWdlKHZvaWQpCi0gewotQEAgLTEzOCw3ICsx
MzksNyBAQCBzdGF0aWMgaW50IHBhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQot
IAkJCQkgIGV4aXQoMSk7Ci0gCQkJICBicmVhazsKLSAJCSAgY2FzZSAnZic6Ci0tCQkJICBkaXJu
YW1lID0gb3B0YXJnOwotKwkJCSAgZGlyX25hbWUgPSBvcHRhcmc7Ci0gCQkJICBicmVhazsKLSAJ
CSAgY2FzZSAyNTY6Ci0gCQkJICBmbGFncyB8PSBGTF9OVU1OQU1FUzsKLUBAIC0xNzYsNyArMTc3
LDcgQEAgc3RhdGljIHZvaWQgY29weV9wcm90b3R5cGUoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBz
dHJ1Y3QgcXVvdGFfaGFuZGxlICoqaGFuZGxlcykKLSAJcHJvdG9wcml2cyA9IGdldHByaXZzKHBy
b3RvaWQsIGhhbmRsZXMsIDApOwotIAl3aGlsZSAoYXJnYy0tID4gMCkgewotIAkJaWQgPSBuYW1l
MmlkKCphcmd2LCBxdW90YXR5cGUsICEhKGZsYWdzICYgRkxfTlVNTkFNRVMpLCBOVUxMKTsKLS0J
CWN1cnByaXZzID0gZ2V0cHJpdnMoaWQsIGhhbmRsZXMsICFkaXJuYW1lKTsKLSsJCWN1cnByaXZz
ID0gZ2V0cHJpdnMoaWQsIGhhbmRsZXMsICFkaXJfbmFtZSk7Ci0gCQlpZiAoIWN1cnByaXZzKQot
IAkJCWRpZSgxLCBfKCJDYW5ub3QgZ2V0IHF1b3RhIGluZm9ybWF0aW9uIGZvciB1c2VyICVzXG4i
KSwgKmFyZ3YpOwotIAkJYXJndisrOwotQEAgLTIyMyw3ICsyMjQsNyBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCi0gCWFyZ3YgKz0gcmV0OwotIAotIAlpbml0X2tlcm5lbF9pbnRl
cmZhY2UoKTsKLS0JaGFuZGxlcyA9IGNyZWF0ZV9oYW5kbGVfbGlzdChkaXJuYW1lID8gMSA6IDAs
IGRpcm5hbWUgPyAmZGlybmFtZSA6IE5VTEwsIHF1b3RhdHlwZSwgZm10LAotKwloYW5kbGVzID0g
Y3JlYXRlX2hhbmRsZV9saXN0KGRpcl9uYW1lID8gMSA6IDAsIGRpcl9uYW1lID8gJmRpcl9uYW1l
IDogTlVMTCwgcXVvdGF0eXBlLCBmbXQsCi0gCQkJKGZsYWdzICYgRkxfTk9fTUlYRURfUEFUSFMp
ID8gMCA6IElPSV9ORlNfTUlYRURfUEFUSFMsCi0gCQkJKGZsYWdzICYgRkxfUkVNT1RFKSA/IDAg
OiBNU19MT0NBTE9OTFkpOwotIAlpZiAoIWhhbmRsZXNbMF0pIHsKLUBAIC0yOTYsNyArMjk3LDcg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQotIAllbHNlIHsKLSAJCWZvciAoOyBh
cmdjID4gMDsgYXJnYy0tLCBhcmd2KyspIHsKLSAJCQlpZCA9IG5hbWUyaWQoKmFyZ3YsIHF1b3Rh
dHlwZSwgISEoZmxhZ3MgJiBGTF9OVU1OQU1FUyksIE5VTEwpOwotLQkJCWN1cnByaXZzID0gZ2V0
cHJpdnMoaWQsIGhhbmRsZXMsICFkaXJuYW1lKTsKLSsJCQljdXJwcml2cyA9IGdldHByaXZzKGlk
LCBoYW5kbGVzLCAhZGlyX25hbWUpOwotIAkJCWlmICghY3VycHJpdnMpCi0gCQkJCWRpZSgxLCBf
KCJDYW5ub3QgZ2V0IHF1b3RhIGluZm9ybWF0aW9uIGZvciB1c2VyICVzLlxuIiksICphcmd2KTsK
LSAJCQlpZiAoZmxhZ3MgJiBGTF9FRElUX1RJTUVTKSB7Ci1kaWZmIC0tZ2l0IGEvcXVvdGEuYyBi
L3F1b3RhLmMKLWluZGV4IGE2MGRlMTIuLjY2YjBmYTMgMTAwNjQ0Ci0tLS0gYS9xdW90YS5jCi0r
KysgYi9xdW90YS5jCi1AQCAtMjAsNiArMjAsNyBAQAotICNpbmNsdWRlIDx1bmlzdGQuaD4KLSAj
aW5jbHVkZSA8bGltaXRzLmg+Ci0gI2luY2x1ZGUgPGN0eXBlLmg+Ci0rI2luY2x1ZGUgPGxpYmdl
bi5oPgotICNpZmRlZiBSUEMKLSAjaW5jbHVkZSA8cnBjL3JwYy5oPgotICNpbmNsdWRlICJycXVv
dGEuaCIKLWRpZmYgLS1naXQgYS9xdW90YV9ubGQuYyBiL3F1b3RhX25sZC5jCi1pbmRleCA1OGE2
MmFmLi43MTBiNTU2IDEwMDY0NAotLS0tIGEvcXVvdGFfbmxkLmMKLSsrKyBiL3F1b3RhX25sZC5j
Ci1AQCAtMjYsNiArMjYsNyBAQAotICNpbmNsdWRlIDxmY250bC5oPgotICNpbmNsdWRlIDxsaW1p
dHMuaD4KLSAjaW5jbHVkZSA8c2lnbmFsLmg+Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotICNpbmNs
dWRlIDxzeXMvc3RhdC5oPgotICNpbmNsdWRlIDxhc20vdHlwZXMuaD4KLSAKLWRpZmYgLS1naXQg
YS9xdW90YWNoZWNrLmMgYi9xdW90YWNoZWNrLmMKLWluZGV4IGUyYzNiYmQuLmZhMWQyOTcgMTAw
NjQ0Ci0tLS0gYS9xdW90YWNoZWNrLmMKLSsrKyBiL3F1b3RhY2hlY2suYwotQEAgLTE5LDYgKzE5
LDcgQEAKLSAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0gI2luY2x1ZGUgPHN0ZGxpYi5oPgotICNpbmNs
dWRlIDxlcnJuby5oPgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAKLSAjaW5jbHVkZSA8c3lzL3N0
YXQuaD4KLSAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Ci1kaWZmIC0tZ2l0IGEvcXVvdGFvbi5jIGIv
cXVvdGFvbi5jCi1pbmRleCAzNTFjODUxLi4xN2I2YmNjIDEwMDY0NAotLS0tIGEvcXVvdGFvbi5j
Ci0rKysgYi9xdW90YW9uLmMKLUBAIC0xMyw2ICsxMyw3IEBACi0gI2luY2x1ZGUgPHN0cmluZy5o
PgotICNpbmNsdWRlIDxzdGRsaWIuaD4KLSAjaW5jbHVkZSA8c3RkYXJnLmg+Ci0rI2luY2x1ZGUg
PGxpYmdlbi5oPgotIAotICNpbmNsdWRlICJxdW90YW9uLmgiCi0gI2luY2x1ZGUgInF1b3RhLmgi
Ci1kaWZmIC0tZ2l0IGEvcXVvdGFzdGF0cy5jIGIvcXVvdGFzdGF0cy5jCi1pbmRleCBhMDU5ODEy
Li40MDc2YTdkIDEwMDY0NAotLS0tIGEvcXVvdGFzdGF0cy5jCi0rKysgYi9xdW90YXN0YXRzLmMK
LUBAIC0yNCw2ICsyNCw3IEBACi0gI2luY2x1ZGUgPGVycm5vLmg+Ci0gI2luY2x1ZGUgPHN0cmlu
Zy5oPgotICNpbmNsdWRlIDxzaWduYWwuaD4KLSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gCi0gI2lu
Y2x1ZGUgInBvdC5oIgotICNpbmNsdWRlICJjb21tb24uaCIKLWRpZmYgLS1naXQgYS9xdW90YXN5
bmMuYyBiL3F1b3Rhc3luYy5jCi1pbmRleCBjYWQyYTIwLi5lOTBiMjRhIDEwMDY0NAotLS0tIGEv
cXVvdGFzeW5jLmMKLSsrKyBiL3F1b3Rhc3luYy5jCi1AQCAtNyw2ICs3LDcgQEAKLSAjaW5jbHVk
ZSA8c3RyaW5nLmg+Ci0gI2luY2x1ZGUgPGVycm5vLmg+Ci0gI2luY2x1ZGUgPGdldG9wdC5oPgot
KyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAKLSAjaW5jbHVkZSAicG90LmgiCi0gI2luY2x1ZGUgImNv
bW1vbi5oIgotZGlmZiAtLWdpdCBhL3JlcHF1b3RhLmMgYi9yZXBxdW90YS5jCi1pbmRleCBlNzlm
YzRkLi44ZTUwOWJkIDEwMDY0NAotLS0tIGEvcmVwcXVvdGEuYwotKysrIGIvcmVwcXVvdGEuYwot
QEAgLTE4LDYgKzE4LDcgQEAKLSAjaW5jbHVkZSA8cHdkLmg+Ci0gI2luY2x1ZGUgPGdycC5oPgot
ICNpbmNsdWRlIDxnZXRvcHQuaD4KLSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gCi0gI2luY2x1ZGUg
InBvdC5oIgotICNpbmNsdWRlICJjb21tb24uaCIKLWRpZmYgLS1naXQgYS9ycXVvdGFfc3ZjLmMg
Yi9ycXVvdGFfc3ZjLmMKLWluZGV4IDZlODU2YmIuLmMxN2RmMTMgMTAwNjQ0Ci0tLS0gYS9ycXVv
dGFfc3ZjLmMKLSsrKyBiL3JxdW90YV9zdmMuYwotQEAgLTM0LDYgKzM0LDcgQEAKLSAjaW5jbHVk
ZSA8c2lnbmFsLmg+Ci0gI2luY2x1ZGUgPGVycm5vLmg+Ci0gI2luY2x1ZGUgPG5ldGNvbmZpZy5o
PgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAjaWZkZWYgSE9TVFNfQUNDRVNTCi0gI2luY2x1ZGUg
PHRjcGQuaD4KLSAjaW5jbHVkZSA8bmV0ZGIuaD4KLWRpZmYgLS1naXQgYS9zZXRxdW90YS5jIGIv
c2V0cXVvdGEuYwotaW5kZXggYzUxN2FiMS4uOWU0YjJmYSAxMDA2NDQKLS0tLSBhL3NldHF1b3Rh
LmMKLSsrKyBiL3NldHF1b3RhLmMKLUBAIC0xOCw2ICsxOCw3IEBACi0gI2luY2x1ZGUgPHRpbWUu
aD4KLSAjaW5jbHVkZSA8Y3R5cGUuaD4KLSAjaW5jbHVkZSA8c3RkbGliLmg+Ci0rI2luY2x1ZGUg
PGxpYmdlbi5oPgotIAotICNpZiBkZWZpbmVkKFJQQykKLSAjaW5jbHVkZSAicnF1b3RhLmgiCi1k
aWZmIC0tZ2l0IGEvd2FybnF1b3RhLmMgYi93YXJucXVvdGEuYwotaW5kZXggMjg4MmZlZS4uNmY2
M2NlNyAxMDA2NDQKLS0tLSBhL3dhcm5xdW90YS5jCi0rKysgYi93YXJucXVvdGEuYwotQEAgLTMx
LDYgKzMxLDcgQEAKLSAjaW5jbHVkZSA8dGltZS5oPgotICNpbmNsdWRlIDxnZXRvcHQuaD4KLSAj
aW5jbHVkZSA8bG9jYWxlLmg+Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotICNpZmRlZiBIQVZFX05M
X0xBTkdJTkZPCi0gI2luY2x1ZGUgPGxhbmdpbmZvLmg+Ci0gI2VuZGlmCi1kaWZmIC0tZ2l0IGEv
eHFtc3RhdHMuYyBiL3hxbXN0YXRzLmMKLWluZGV4IDU5YjFkNjYuLjM0NWIwNjAgMTAwNjQ0Ci0t
LS0gYS94cW1zdGF0cy5jCi0rKysgYi94cW1zdGF0cy5jCi1AQCAtOCw2ICs4LDcgQEAKLSAjaW5j
bHVkZSA8c3RkaW8uaD4KLSAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0gI2luY2x1ZGUgPHN0cmluZy5o
PgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAjaW5jbHVkZSAiY29tbW9uLmgiCi0gI2luY2x1ZGUg
InBvdC5oIgotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3Rh
XzQuMDkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEvcXVvdGFfNC4xMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEv
cXVvdGFfNC4wOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3Rh
XzQuMTAuYmIKaW5kZXggOGU0ZDRhZWQ4Yi4uZWEyNzhjMmEwZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3RhXzQuMDkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3F1b3RhL3F1b3RhXzQuMTAuYmIKQEAgLTcsMTAgKzcsOCBAQCBMSUNFTlNFID0gIkdQ
TC0yLjAtb3ItbGF0ZXIgJiBMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL3JxdW90YV9zZXJ2ZXIuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTIwO21kNT1mZTdlMGQ3
ZTExYzZmODIwZjhmYTYyYTVhZjcxMjMwZiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9z
dmNfc29ja2V0LmM7YmVnaW5saW5lPTE7ZW5kbGluZT0xNzttZDU9MjRkNWE4NzkyZGE0NTkxMDc4
NmVlYWM3NTBiZThjZWIiCiAKLVNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Byb2pl
Y3QvbGludXhxdW90YS9xdW90YS10b29scy8ke1BWfS9xdW90YS0ke1BWfS50YXIuZ3ogXAotICAg
ICAgICAgICBmaWxlOi8vMDAwMS1GaXgtYnVpbGRpbmctb24tbXVzbC5wYXRjaCBcCi0gICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5Y2RhY2ExNTRiYzkyYWZjMzExN2YwZTVmNWIz
MjA4ZGQ1Zjg0NTgzYWYxY2YwNjFjMzliYWEwYTJiYjE0MmY5IgorU1JDX1VSSSA9ICIke1NPVVJD
RUZPUkdFX01JUlJPUn0vcHJvamVjdC9saW51eHF1b3RhL3F1b3RhLXRvb2xzLyR7UFZ9L3F1b3Rh
LSR7UFZ9LnRhci5neiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMDRhMGNhZmNhMjljMTViZThi
NmFjNjYwZTA2MTg4YmNjYjgwMmMxOWVmZTJlN2MxOWVkN2YzZDY2N2VjZjVlIgogCiBDVkVfUFJP
RFVDVCA9ICJsaW51eF9kaXNrcXVvdGEiCiAKLS0gCjIuNDcuMQoK

--===============6297865940027329383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/quota: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota: SRC_URI changed from "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.09/quota-4.09.tar.gz file://0001-Fix-building-on-musl.patch" to "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.10/quota-4.10.tar.gz"
packages/core2-64-poky-linux/quota: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-dbg: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-dbg: FILELIST: added "/usr/sbin/.debug/setproject"
packages/core2-64-poky-linux/quota/quota-dbg: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-dbg: PKGSIZE changed from 3183784 to 3285208 (+3%)
packages/core2-64-poky-linux/quota/quota-dev: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-dev: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-doc: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-doc: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-cs: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-cs: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-cs: PKGSIZE changed from 61583 to 61496 (-0%)
packages/core2-64-poky-linux/quota/quota-locale-de: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-de: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-fr: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-fr: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-pl: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-locale-pl: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-locale-pl: PKGSIZE changed from 62344 to 88646 (+42%)
packages/core2-64-poky-linux/quota/quota-src: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-src: FILELIST: removed "/usr/src/debug/quota/4.09/quotaio_rpc.c /usr/src/debug/quota/4.09/quotaon_xfs.c /usr/src/debug/quota/4.09/rquota_svc.c /usr/src/debug/quota/4.09/dqblk_xfs.h /usr/src/debug/quota/4.09/rquota_client.c /usr/src/debug/quota/4.09/rquota_server.c /usr/src/debug/quota/4.09/bylabel.h /usr/src/debug/quota/4.09/pot.c /usr/src/debug/quota/4.09/quota.c /usr/src/debug/quota/4.09/bylabel.c /usr/src/debug/quota/4.09/rquota_clnt.c /usr/src/debug/quota/4.09/rquota_client.h /usr/src/debug/quota/4.09/dqblk_rpc.h /usr/src/debug/quota/4.09/pot.h /usr/src/debug/quota/4.09/quota.h /usr/src/debug/quota/4.09/quota_nld.c /usr/src/debug/quota/4.09/quotaops.c /usr/src/debug/quota/4.09/common.h /usr/src/debug/quota/4.09/rquota.h /usr/src/debug/quota/4.09/common.c /usr/src/debug/quota/4.09/rquota.c /usr/src/debug/quota/4.09/quotaops.h /usr/src/debug/quota/4.09/quotasync.c /usr/src/debug/quota/4.09/dqblk_v2.h /usr/src/debug/quota/4.09/quotacheck.c /u
 sr/src/debug/quota/4.09/quotacheck.h /usr/src/debug/quota/4.09/dqblk_v1.h /usr/src/debug/quota/4.09/quotaon.h /usr/src/debug/quota/4.09/warnquota.c /usr/src/debug/quota/4.09/quotaio_xfs.h /usr/src/debug/quota/4.09/quotaio.h /usr/src/debug/quota/4.09/quotaon.c /usr/src/debug/quota/4.09/quotaio.c /usr/src/debug/quota/4.09/quotastats.c /usr/src/debug/quota/4.09/quotaio_generic.c /usr/src/debug/quota/4.09/quotaio_meta.c /usr/src/debug/quota/4.09/quotaio_generic.h /usr/src/debug/quota/4.09/svc_socket.c /usr/src/debug/quota/4.09/quota_tree.h /usr/src/debug/quota/4.09/edquota.c /usr/src/debug/quota/4.09/quotaio_tree.c /usr/src/debug/quota/4.09/quotaio_v2.h /usr/src/debug/quota/4.09/quotaio_v1.c /usr/src/debug/quota/4.09/xqmstats.c /usr/src/debug/quota/4.09/quotaio_v2.c /usr/src/debug/quota/4.09/repquota.c /usr/src/debug/quota/4.09/setquota.c /usr/src/debug/quota/4.09/quotaio_v1.h /usr/src/debug/quota/4.09/convertquota.c /usr/src/debug/quota/4.09/quotaio_xfs.c /usr/src/debug/quota/4.09/quot
 asys.c /usr/src/debug/quota/4.09/quotacheck_v1.c /usr/src/debug/quota/4.09/quotacheck_v2.c /usr/src/debug/quota/4.09/quotasys.h", added "/usr/src/debug/quota/4.10/quotaio_tree.c /usr/src/debug/quota/4.10/common.h /usr/src/debug/quota/4.10/rquota.h /usr/src/debug/quota/4.10/bylabel.c /usr/src/debug/quota/4.10/quotaio_v1.h /usr/src/debug/quota/4.10/common.c /usr/src/debug/quota/4.10/quotaio_rpc.c /usr/src/debug/quota/4.10/rquota.c /usr/src/debug/quota/4.10/quotaio_v1.c /usr/src/debug/quota/4.10/bylabel.h /usr/src/debug/quota/4.10/rquota_client.c /usr/src/debug/quota/4.10/rquota_server.c /usr/src/debug/quota/4.10/setproject.c /usr/src/debug/quota/4.10/quotacheck.h /usr/src/debug/quota/4.10/edquota.c /usr/src/debug/quota/4.10/svc_socket.c /usr/src/debug/quota/4.10/rquota_client.h /usr/src/debug/quota/4.10/quotacheck.c /usr/src/debug/quota/4.10/quota_tree.h /usr/src/debug/quota/4.10/quotasys.c /usr/src/debug/quota/4.10/rquota_clnt.c /usr/src/debug/quota/4.10/quotasys.h /usr/src/debug/quo
 ta/4.10/convertquota.c /usr/src/debug/quota/4.10/quotaio_generic.c /usr/src/debug/quota/4.10/rquota_svc.c /usr/src/debug/quota/4.10/quotasync.c /usr/src/debug/quota/4.10/quotaio_generic.h /usr/src/debug/quota/4.10/quotacheck_v1.c /usr/src/debug/quota/4.10/quotacheck_v2.c /usr/src/debug/quota/4.10/dqblk_xfs.h /usr/src/debug/quota/4.10/quotaio_xfs.h /usr/src/debug/quota/4.10/xqmstats.c /usr/src/debug/quota/4.10/quotaio_xfs.c /usr/src/debug/quota/4.10/repquota.c /usr/src/debug/quota/4.10/setquota.c /usr/src/debug/quota/4.10/dqblk_rpc.h /usr/src/debug/quota/4.10/quotaops.h /usr/src/debug/quota/4.10/dqblk_v2.h /usr/src/debug/quota/4.10/quotaops.c /usr/src/debug/quota/4.10/warnquota.c /usr/src/debug/quota/4.10/pot.h /usr/src/debug/quota/4.10/quota.h /usr/src/debug/quota/4.10/pot.c /usr/src/debug/quota/4.10/quota_nld.c /usr/src/debug/quota/4.10/quota.c /usr/src/debug/quota/4.10/dqblk_v1.h /usr/src/debug/quota/4.10/quotaio_v2.h /usr/src/debug/quota/4.10/quotaio.c /usr/src/debug/quota/4.10/q
 uotaio_meta.c /usr/src/debug/quota/4.10/quotaon.c /usr/src/debug/quota/4.10/quotastats.c /usr/src/debug/quota/4.10/quotaio.h /usr/src/debug/quota/4.10/quotaio_v2.c /usr/src/debug/quota/4.10/quotaon_xfs.c /usr/src/debug/quota/4.10/quotaon.h"
packages/core2-64-poky-linux/quota/quota-src: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota-src: PKGSIZE changed from 421763 to 428461 (+2%)
packages/core2-64-poky-linux/quota/quota-staticdev: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota-staticdev: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota: PKGV changed from 4.09 [default] to 4.10 [default]
packages/core2-64-poky-linux/quota/quota: FILELIST: added "/usr/sbin/setproject"
packages/core2-64-poky-linux/quota/quota: PV changed from "4.09" to "4.10"
packages/core2-64-poky-linux/quota/quota: PKGSIZE changed from 994462 to 1041606 (+5%)

--===============6297865940027329383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1934 targets, 50 skipped, 0 masked, 0 errors.
Removing 61 recipes from the core2-64 sysroot...done.
Removing 60 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-2e11a4ae98ccbc23e8cf00d088fbdf7e16d63183"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2e11a4ae98ccbc23e8cf00d088fbdf7e16d63183"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 401 Local 384 Mirrors 0 Missed 17 Current 257 (95% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 279 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_populate_lic_setscene)
NOTE: Running setscene task 325 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 334 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 338 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe quota-4.10-r0: task do_populate_lic_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe quota-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe quota-4.10-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 339 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 342 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 344 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe quota-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 957 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 959 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe quota-4.10-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 418 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 970 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running task 988 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: Running setscene task 425 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 428 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 990 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_patch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe quota-4.10-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 444 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 458 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 465 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1016 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 476 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 478 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1053 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1059 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 495 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 496 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1080 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 515 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1106 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1108 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 523 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 527 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1124 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 529 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1146 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 571 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running task 1173 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 604 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 606 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 614 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1305 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 4351a343a6ee20ced908fe194a9234e8c4ee62626eebc23d17b39fbcb395b181 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0312240b23be9516ab1834e11922da210e9778d2f6c7a1e9d2edd97d3ebbfa6f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4351a343a6ee20ced908fe194a9234e8c4ee62626eebc23d17b39fbcb395b181'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 0312240b23be9516ab1834e11922da210e9778d2f6c7a1e9d2edd97d3ebbfa6f -> 4351a343a6ee20ced908fe194a9234e8c4ee62626eebc23d17b39fbcb395b181 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1619 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1624 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1800 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1804 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 4351a343a6ee20ced908fe194a9234e8c4ee62626eebc23d17b39fbcb395b181 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '2cd98c95cd0e649548e1175ef635942584f8d8bd86c0dd3305a92d02255108d1', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4351a343a6ee20ced908fe194a9234e8c4ee62626eebc23d17b39fbcb395b181'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 2cd98c95cd0e649548e1175ef635942584f8d8bd86c0dd3305a92d02255108d1 -> 4351a343a6ee20ced908fe194a9234e8c4ee62626eebc23d17b39fbcb395b181 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Succeeded
NOTE: Running task 1818 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1819 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Succeeded
NOTE: Running task 1820 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1821 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Succeeded
NOTE: Running task 1822 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1823 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package)
NOTE: Running task 1824 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1825 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_configure)
NOTE: recipe quota-4.10-r0: task do_configure: Started
NOTE: recipe quota-4.10-r0: task do_configure: Succeeded
NOTE: Running task 1827 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_compile)
NOTE: recipe quota-4.10-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Succeeded
NOTE: Running task 1828 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata unihash changed to 74202ab210b203fdfb4bcf34f50e2104a39580987e20d9b4d360b1de35ab6202
NOTE: Setscene tasks completed
NOTE: Running task 1829 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_create_spdx)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1830 of 1841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe quota-4.10-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| make  all-recursive
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10'
| Making all in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10/po'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10/po'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10'
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quota.o quota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaops.o quotaops.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio.o quotaio.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_v1.o quotaio_v1.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_v2.o quotaio_v2.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_tree.o quotaio_tree.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_rpc.o quotaio_rpc.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_xfs.o quotaio_xfs.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_meta.o quotaio_meta.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaio_generic.o quotaio_generic.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o bylabel.o bylabel.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o common.o common.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotasys.o quotasys.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o pot.o pot.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-mu
 sl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota.o `test -f 'rquota.c' || echo './'`rquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-mu
 sl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_client.o `test -f 'rquota_client.c' || echo './'`rquota_client.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-mu
 sl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_clnt.o `test -f 'rquota_clnt.c' || echo './'`rquota_clnt.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotasync.o quotasync.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck.o `test -f 'quotacheck.c' || echo './'`quotacheck.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v1.o `test -f 'quotacheck_v1.c' || echo './'`quotacheck_v1.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v2.o `test -f 'quotacheck_v2.c' || echo './'`quotacheck_v2.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/ext2fs -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/et -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotaops.o `test -f 'quotaops.c' || echo './'`quotaops.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaon.o quotaon.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotaon_xfs.o quotaon_xfs.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o repquota.o repquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o warnquota.o warnquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quotastats.o quotastats.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o xqmstats.o xqmstats.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o edquota.o edquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o setquota.o setquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o convertquota.o convertquota.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o setproject.o setproject.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o rquota_server.o rquota_server.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o rquota_svc.o rquota_svc.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.1
 0/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o svc_socket.o svc_socket.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/dbus-1.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/lib/dbus-1.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/libnl3 -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10 
  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -c -o quota_nld-quota_nld.o `test -f 'quota_nld.c' || echo './'`quota_nld.c
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
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot -fPIC -Wall -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native
 =  -pipe -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu   -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10=/usr/src/debug/quota/4.10  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/recipe-sysroot-native=  -Wl,-z,relro,-z,now -ltirpc -o xqmstats xqmstats.o common.o pot.o
| make[2]: *** [Makefile:1050: setproject.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/sources/quota-4.10'
| make[1]: *** [Makefile:1413: all-recursive] Error 1
| make: *** [Makefile:790: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866, line 182
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866, line 166
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866, line 161
| 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866, line 156
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866, line 151
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866, line 195
NOTE: recipe quota-4.10-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1830 tasks of which 1798 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801103726.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801103726.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/log.do_compile.2195866
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: quota-4.10-r0 do_compile: oe_runmake failed
ERROR: quota-4.10-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/run.do_compile.2195866' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/quota/4.10/temp/log.do_compile.2195866
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_compile) failed with exit code '1'

--===============6297865940027329383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/quota/quota-locale-pl: PKGSIZE changed from 62344 to 88646 (+42%)
packages/core2-64-poky-linux/quota/quota: FILELIST: added "/usr/sbin/setproject"

--===============6297865940027329383==--

