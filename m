Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E312CD8CBE
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1570.1780328136613517798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pol6WKmV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2U4aJ1ti;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d3a834-46659bdb-754e-4267-9e02-517548099c78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4eDIrCKEs/YzkQBVqQq+w54qc62HTnpKOgOsznird48=;
	b=Pol6WKmV01keSwLgrvt7l6Xv0fjhhwPT78XPE9ygdsyOU2MRrgAtFCRrVyvEqDM3
	F9sGiozQqvxCKM380PN0wlRpGipnCsu8MAff5Slkubihh2P9IDAVOcHR61YhWvrlBBh
	KiNPPS6LpUvIU/j8kYSkCSEHP6OmCqGvIGFonrNA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4eDIrCKEs/YzkQBVqQq+w54qc62HTnpKOgOsznird48=;
	b=2U4aJ1tit7ONGbYkirL7gXNz6ZsVTY2sxKVMTkD3QFqEjqBhG4qIAQ3YPfCZjQrF
	9dQ1WN7Sx50wom0RpFZUT4ek76Kndma8ja9YyfCuB1xhxjkalp9Te59/J1JFkZw2Uka
	eqIjyc52TPTxDjIMy9S00BZTpcq1+6bSa0lDq5t0=
Content-Type: multipart/mixed; boundary="===============3450650465644296234=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpcbind: upgrading to 1.2.9 SUCCEEDED
Message-ID: <0101019e83d3a834-46659bdb-754e-4267-9e02-517548099c78-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237913

--===============3450650465644296234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpcbind* to *1.2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rpcbind-upgrade-1.2.8-1.2.9.patch
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
From 899472f670cc212f7bd06ca198585dddcb335f51 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:50:00 +0000
Subject: [PATCH] rpcbind: upgrade 1.2.8 -> 1.2.9

---
 .../0001-systemd-use-EnvironmentFile.patch    |  7 ++----
 ...pcbind_add_option_to_fix_port_number.patch | 25 ++++++++-----------
 .../{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb}    |  2 +-
 3 files changed, 14 insertions(+), 20 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 28d83e74f5..e589a442fe 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -1,4 +1,4 @@
-From 87a9931e4aa97d7b6eb3b25f26444e30e45e3e41 Mon Sep 17 00:00:00 2001
+From dcf4bd6ba018d723c2a353b76f0b6a79744386d1 Mon Sep 17 00:00:00 2001
 From: Stefan Agner <stefan.agner@toradex.com>
 Date: Wed, 27 Aug 2025 11:30:48 +0800
 Subject: [PATCH] systemd: use EnvironmentFile
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6ede0af..d1ae5e4 100644
+index c46294c..1566386 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -86,5 +86,7 @@ AC_CHECK_HEADERS([nss.h])
@@ -42,6 +42,3 @@ index 771b944..5992098 100644
  ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS @warmstarts_opt@ -f
  
  [Install]
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
index 3205ff3086..32581bc178 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -1,4 +1,4 @@
-From 285c193dc94b53763ac8d6f91229eaab37d45fc6 Mon Sep 17 00:00:00 2001
+From 7acd08150dcfbb602919a766dc55487a4d502e68 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 27 Aug 2025 11:24:53 +0800
 Subject: [PATCH] add option to make users able to use fixed port number
@@ -38,18 +38,18 @@ index 15b70f9..4a6ffbc 100644
  .Fl h
  option is specified,
 diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index 1743dad..07a1c75 100644
+index 6d0d72d..2f10dac 100644
 --- a/src/rpcb_svc_com.c
 +++ b/src/rpcb_svc_com.c
-@@ -48,6 +48,7 @@
- #include <rpc/rpc.h>
+@@ -49,6 +49,7 @@
+ #include <rpc/rpc_com.h>
  #include <rpc/rpcb_prot.h>
  #include <rpc/svc_dg.h>
 +#include <rpc/rpc_com.h>
  #include <netconfig.h>
  #include <errno.h>
  #include <syslog.h>
-@@ -497,6 +498,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
+@@ -499,6 +500,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
  
  static struct rmtcallfd_list *rmthead;
  static struct rmtcallfd_list *rmttail;
@@ -57,7 +57,7 @@ index 1743dad..07a1c75 100644
  
  int
  create_rmtcall_fd(struct netconfig *nconf)
-@@ -504,6 +506,8 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -506,6 +508,8 @@ create_rmtcall_fd(struct netconfig *nconf)
  	int fd;
  	struct rmtcallfd_list *rmt;
  	SVCXPRT *xprt;
@@ -66,7 +66,7 @@ index 1743dad..07a1c75 100644
  
  	if ((fd = __rpc_nconf2fd(nconf)) == -1) {
  		if (debugging)
-@@ -512,6 +516,19 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -514,6 +518,19 @@ create_rmtcall_fd(struct netconfig *nconf)
  			nconf->nc_device, errno);
  		return (-1);
  	}
@@ -87,7 +87,7 @@ index 1743dad..07a1c75 100644
  	if (xprt == NULL) {
  		if (debugging)
 diff --git a/src/rpcbind.c b/src/rpcbind.c
-index bf7b499..7268907 100644
+index 4212377..7e7f79d 100644
 --- a/src/rpcbind.c
 +++ b/src/rpcbind.c
 @@ -112,6 +112,7 @@ int runasdaemon = 0;
@@ -98,7 +98,7 @@ index bf7b499..7268907 100644
  
  char **hosts = NULL;
  int nhosts = 0;
-@@ -959,7 +960,7 @@ parseargs(int argc, char *argv[])
+@@ -963,7 +964,7 @@ parseargs(int argc, char *argv[])
  {
  	int c;
  	oldstyle_local = 1;
@@ -107,7 +107,7 @@ index bf7b499..7268907 100644
  		switch (c) {
  		case 'a':
  			doabort = 1;	/* when debugging, do an abort on */
-@@ -977,6 +978,9 @@ parseargs(int argc, char *argv[])
+@@ -981,6 +982,9 @@ parseargs(int argc, char *argv[])
  			if (hosts[nhosts - 1] == NULL)
  				errx(1, "Out of memory");
  			break;
@@ -117,7 +117,7 @@ index bf7b499..7268907 100644
  		case 'i':
  			insecure = 1;
  			break;
-@@ -999,7 +1003,7 @@ parseargs(int argc, char *argv[])
+@@ -1003,7 +1007,7 @@ parseargs(int argc, char *argv[])
  			break;
  #endif
  		default:	/* error */
@@ -126,6 +126,3 @@ index bf7b499..7268907 100644
  			exit (1);
  		}
  	}
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
index bd8ba1e88a..692c421cd9 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] = "964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5"
+SRC_URI[sha256sum] = "ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives sourceforge-releases
 
-- 
2.47.1


--===============3450650465644296234==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpcbind-upgrade-1.2.8-1.2.9.patch"

RnJvbSA4OTk0NzJmNjcwY2MyMTJmN2JkMDZjYTE5ODU4NWRkZGNiMzM1ZjUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDo1MDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJw
Y2JpbmQ6IHVwZ3JhZGUgMS4yLjggLT4gMS4yLjkKCi0tLQogLi4uLzAwMDEtc3lzdGVtZC11c2Ut
RW52aXJvbm1lbnRGaWxlLnBhdGNoICAgIHwgIDcgKystLS0tCiAuLi5wY2JpbmRfYWRkX29wdGlv
bl90b19maXhfcG9ydF9udW1iZXIucGF0Y2ggfCAyNSArKysrKysrKy0tLS0tLS0tLS0tCiAuLi4v
e3JwY2JpbmRfMS4yLjguYmIgPT4gcnBjYmluZF8xLjIuOS5iYn0gICAgfCAgMiArLQogMyBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmluZC97cnBjYmluZF8xLjIuOC5iYiA9PiBycGNiaW5kXzEu
Mi45LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ycGNiaW5k
L3JwY2JpbmQvMDAwMS1zeXN0ZW1kLXVzZS1FbnZpcm9ubWVudEZpbGUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kLzAwMDEtc3lzdGVtZC11c2UtRW52aXJvbm1l
bnRGaWxlLnBhdGNoCmluZGV4IDI4ZDgzZTc0ZjUuLmU1ODlhNDQyZmUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9ycGNiaW5kL3JwY2JpbmQvMDAwMS1zeXN0ZW1kLXVzZS1FbnZp
cm9ubWVudEZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBj
YmluZC8wMDAxLXN5c3RlbWQtdXNlLUVudmlyb25tZW50RmlsZS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gODdhOTkzMWU0YWE5N2Q3YjZlYjNiMjVmMjY0NDRlMzBlNDVlM2U0MSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGNmNGJkNmJhMDE4ZDcyM2MyYTM1M2I3NmYwYjZhNzk3
NDQzODZkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFN0ZWZhbiBBZ25lciA8c3Rl
ZmFuLmFnbmVyQHRvcmFkZXguY29tPgogRGF0ZTogV2VkLCAyNyBBdWcgMjAyNSAxMTozMDo0OCAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBzeXN0ZW1kOiB1c2UgRW52aXJvbm1lbnRGaWxlCkBAIC0x
NCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJp
dmVyLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNmVk
ZTBhZi4uZDFhZTVlNCAxMDA2NDQKK2luZGV4IGM0NjI5NGMuLjE1NjYzODYgMTAwNjQ0CiAtLS0g
YS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTg2LDUgKzg2LDcgQEAgQUNf
Q0hFQ0tfSEVBREVSUyhbbnNzLmhdKQpAQCAtNDIsNiArNDIsMyBAQCBpbmRleCA3NzFiOTQ0Li41
OTkyMDk4IDEwMDY0NAogIEV4ZWNTdGFydD1AX3NiaW5kaXJAL3JwY2JpbmQgJFJQQ0JJTkRfT1BU
SU9OUyBAd2FybXN0YXJ0c19vcHRAIC1mCiAgCiAgW0luc3RhbGxdCi0tLSAKLTIuMzQuMQotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kL3JwY2JpbmRf
YWRkX29wdGlvbl90b19maXhfcG9ydF9udW1iZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvcnBjYmluZC9ycGNiaW5kL3JwY2JpbmRfYWRkX29wdGlvbl90b19maXhfcG9ydF9udW1iZXIu
cGF0Y2gKaW5kZXggMzIwNWZmMzA4Ni4uMzI1ODFiYzE3OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZC9ycGNiaW5kX2FkZF9vcHRpb25fdG9fZml4X3Bv
cnRfbnVtYmVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ycGNiaW5kL3JwY2Jp
bmQvcnBjYmluZF9hZGRfb3B0aW9uX3RvX2ZpeF9wb3J0X251bWJlci5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMjg1YzE5M2RjOTRiNTM3NjNhYzhkNmY5MTIyOWVhYWIzN2Q0NWZjNiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2FjZDA4MTUwZGNmYmI2MDI5MTlhNzY2ZGM1NTQ4
N2E0ZDUwMmU2OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJveSBMaSA8cm9uZ3Fp
bmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjcgQXVnIDIwMjUgMTE6MjQ6NTMgKzA4
MDAKIFN1YmplY3Q6IFtQQVRDSF0gYWRkIG9wdGlvbiB0byBtYWtlIHVzZXJzIGFibGUgdG8gdXNl
IGZpeGVkIHBvcnQgbnVtYmVyCkBAIC0zOCwxOCArMzgsMTggQEAgaW5kZXggMTViNzBmOS4uNGE2
ZmZiYyAxMDA2NDQKICAuRmwgaAogIG9wdGlvbiBpcyBzcGVjaWZpZWQsCiBkaWZmIC0tZ2l0IGEv
c3JjL3JwY2Jfc3ZjX2NvbS5jIGIvc3JjL3JwY2Jfc3ZjX2NvbS5jCi1pbmRleCAxNzQzZGFkLi4w
N2ExYzc1IDEwMDY0NAoraW5kZXggNmQwZDcyZC4uMmYxMGRhYyAxMDA2NDQKIC0tLSBhL3NyYy9y
cGNiX3N2Y19jb20uYwogKysrIGIvc3JjL3JwY2Jfc3ZjX2NvbS5jCi1AQCAtNDgsNiArNDgsNyBA
QAotICNpbmNsdWRlIDxycGMvcnBjLmg+CitAQCAtNDksNiArNDksNyBAQAorICNpbmNsdWRlIDxy
cGMvcnBjX2NvbS5oPgogICNpbmNsdWRlIDxycGMvcnBjYl9wcm90Lmg+CiAgI2luY2x1ZGUgPHJw
Yy9zdmNfZGcuaD4KICsjaW5jbHVkZSA8cnBjL3JwY19jb20uaD4KICAjaW5jbHVkZSA8bmV0Y29u
ZmlnLmg+CiAgI2luY2x1ZGUgPGVycm5vLmg+CiAgI2luY2x1ZGUgPHN5c2xvZy5oPgotQEAgLTQ5
Nyw2ICs0OTgsNyBAQCB4ZHJfb3BhcXVlX3Bhcm1zKFhEUiAqeGRycywgc3RydWN0IHJfcm10Y2Fs
bF9hcmdzICpjYXApCitAQCAtNDk5LDYgKzUwMCw3IEBAIHhkcl9vcGFxdWVfcGFybXMoWERSICp4
ZHJzLCBzdHJ1Y3Qgcl9ybXRjYWxsX2FyZ3MgKmNhcCkKICAKICBzdGF0aWMgc3RydWN0IHJtdGNh
bGxmZF9saXN0ICpybXRoZWFkOwogIHN0YXRpYyBzdHJ1Y3Qgcm10Y2FsbGZkX2xpc3QgKnJtdHRh
aWw7CkBAIC01Nyw3ICs1Nyw3IEBAIGluZGV4IDE3NDNkYWQuLjA3YTFjNzUgMTAwNjQ0CiAgCiAg
aW50CiAgY3JlYXRlX3JtdGNhbGxfZmQoc3RydWN0IG5ldGNvbmZpZyAqbmNvbmYpCi1AQCAtNTA0
LDYgKzUwNiw4IEBAIGNyZWF0ZV9ybXRjYWxsX2ZkKHN0cnVjdCBuZXRjb25maWcgKm5jb25mKQor
QEAgLTUwNiw2ICs1MDgsOCBAQCBjcmVhdGVfcm10Y2FsbF9mZChzdHJ1Y3QgbmV0Y29uZmlnICpu
Y29uZikKICAJaW50IGZkOwogIAlzdHJ1Y3Qgcm10Y2FsbGZkX2xpc3QgKnJtdDsKICAJU1ZDWFBS
VCAqeHBydDsKQEAgLTY2LDcgKzY2LDcgQEAgaW5kZXggMTc0M2RhZC4uMDdhMWM3NSAxMDA2NDQK
ICAKICAJaWYgKChmZCA9IF9fcnBjX25jb25mMmZkKG5jb25mKSkgPT0gLTEpIHsKICAJCWlmIChk
ZWJ1Z2dpbmcpCi1AQCAtNTEyLDYgKzUxNiwxOSBAQCBjcmVhdGVfcm10Y2FsbF9mZChzdHJ1Y3Qg
bmV0Y29uZmlnICpuY29uZikKK0BAIC01MTQsNiArNTE4LDE5IEBAIGNyZWF0ZV9ybXRjYWxsX2Zk
KHN0cnVjdCBuZXRjb25maWcgKm5jb25mKQogIAkJCW5jb25mLT5uY19kZXZpY2UsIGVycm5vKTsK
ICAJCXJldHVybiAoLTEpOwogIAl9CkBAIC04Nyw3ICs4Nyw3IEBAIGluZGV4IDE3NDNkYWQuLjA3
YTFjNzUgMTAwNjQ0CiAgCWlmICh4cHJ0ID09IE5VTEwpIHsKICAJCWlmIChkZWJ1Z2dpbmcpCiBk
aWZmIC0tZ2l0IGEvc3JjL3JwY2JpbmQuYyBiL3NyYy9ycGNiaW5kLmMKLWluZGV4IGJmN2I0OTku
LjcyNjg5MDcgMTAwNjQ0CitpbmRleCA0MjEyMzc3Li43ZTdmNzlkIDEwMDY0NAogLS0tIGEvc3Jj
L3JwY2JpbmQuYwogKysrIGIvc3JjL3JwY2JpbmQuYwogQEAgLTExMiw2ICsxMTIsNyBAQCBpbnQg
cnVuYXNkYWVtb24gPSAwOwpAQCAtOTgsNyArOTgsNyBAQCBpbmRleCBiZjdiNDk5Li43MjY4OTA3
IDEwMDY0NAogIAogIGNoYXIgKipob3N0cyA9IE5VTEw7CiAgaW50IG5ob3N0cyA9IDA7Ci1AQCAt
OTU5LDcgKzk2MCw3IEBAIHBhcnNlYXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAgLTk2
Myw3ICs5NjQsNyBAQCBwYXJzZWFyZ3MoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICB7CiAgCWlu
dCBjOwogIAlvbGRzdHlsZV9sb2NhbCA9IDE7CkBAIC0xMDcsNyArMTA3LDcgQEAgaW5kZXggYmY3
YjQ5OS4uNzI2ODkwNyAxMDA2NDQKICAJCXN3aXRjaCAoYykgewogIAkJY2FzZSAnYSc6CiAgCQkJ
ZG9hYm9ydCA9IDE7CS8qIHdoZW4gZGVidWdnaW5nLCBkbyBhbiBhYm9ydCBvbiAqLwotQEAgLTk3
Nyw2ICs5NzgsOSBAQCBwYXJzZWFyZ3MoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC05ODEs
NiArOTgyLDkgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgCQkJaWYgKGhv
c3RzW25ob3N0cyAtIDFdID09IE5VTEwpCiAgCQkJCWVycngoMSwgIk91dCBvZiBtZW1vcnkiKTsK
ICAJCQlicmVhazsKQEAgLTExNyw3ICsxMTcsNyBAQCBpbmRleCBiZjdiNDk5Li43MjY4OTA3IDEw
MDY0NAogIAkJY2FzZSAnaSc6CiAgCQkJaW5zZWN1cmUgPSAxOwogIAkJCWJyZWFrOwotQEAgLTk5
OSw3ICsxMDAzLDcgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtMTAw
Myw3ICsxMDA3LDcgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgCQkJYnJl
YWs7CiAgI2VuZGlmCiAgCQlkZWZhdWx0OgkvKiBlcnJvciAqLwpAQCAtMTI2LDYgKzEyNiwzIEBA
IGluZGV4IGJmN2I0OTkuLjcyNjg5MDcgMTAwNjQ0CiAgCQkJZXhpdCAoMSk7CiAgCQl9CiAgCX0K
LS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ycGNiaW5k
L3JwY2JpbmRfMS4yLjguYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5k
XzEuMi45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ycGNiaW5kL3JwY2JpbmRfMS4yLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ycGNiaW5kL3JwY2JpbmRfMS4yLjkuYmIKaW5kZXggYmQ4YmExZTg4YS4uNjkyYzQy
MWNkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZF8x
LjIuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kXzEuMi45
LmJiCkBAIC0xOCw3ICsxOCw3IEBAIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Jw
Y2JpbmQvcnBjYmluZC0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL3JwY2JpbmRf
YWRkX29wdGlvbl90b19maXhfcG9ydF9udW1iZXIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1zeXN0ZW1kLXVzZS1FbnZpcm9ubWVudEZpbGUucGF0Y2ggXAogICAgICAgICAgICIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI5NjQxMzJjMzg5OTE4ZTg5NjRkNzMzNDkzNmI2ZGQxMGVmMDI1
YjMwMGM2YjI5ZTY5M2JhMGYyOTU1MGUzZGU1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNlNWYx
YTg3YzU2NmVmMGIyODk3YTI4ZjUwYTc1YzFkYzIzZmVjNDEzYTQ2YTdmNDE4MzQyM2I2YjZhYTk5
MWIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHVwZGF0ZS1yYy5kIHN5c3RlbWQgcGtnY29uZmlnIHVw
ZGF0ZS1hbHRlcm5hdGl2ZXMgc291cmNlZm9yZ2UtcmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============3450650465644296234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rpcbind: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind: SRC_URI changed from "https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.8.tar.bz2 file://init.d file://rpcbind.conf file://rpcbind.tmpfiles file://rpcbind.systemd file://rpcbind_add_option_to_fix_port_number.patch file://0001-systemd-use-EnvironmentFile.patch" to "https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.9.tar.bz2 file://init.d file://rpcbind.conf file://rpcbind.tmpfiles file://rpcbind.systemd file://rpcbind_add_option_to_fix_port_number.patch file://0001-systemd-use-EnvironmentFile.patch"
packages/x86-64-v3-poky-linux/rpcbind: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PKGSIZE changed from 279496 to 279864 (+0%)
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dev: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dev: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-doc: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-doc: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-locale: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-locale: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: FILELIST: directory renamed /usr/src/debug/rpcbind/1.2.8/src -> /usr/src/debug/rpcbind/1.2.9/src
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PKGSIZE changed from 189409 to 189730 (+0%)
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-staticdev: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-staticdev: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind: PV changed from "1.2.8" to "1.2.9"

--===============3450650465644296234==--

