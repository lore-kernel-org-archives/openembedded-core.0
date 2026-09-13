Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA462C88E64
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 05:20:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20300.1789276850955901759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 22:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CQZCF38L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MOPcNGQ0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0993606c0-83d9f0e8-74c8-4831-a8f2-ccee2c11db39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789276850;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p0UvqmWMLXqmBmvlW+Z6kKr3r/Esa92EQa/99Z7hCK8=;
	b=CQZCF38LEmwNIC9n+854mD1lDebA3pThLt5ZlQHRKvqwkhP/T/b/rnS4z308eqNj
	kdbS4cSRg1MijYr/g5SosK1nDOpoafNNyWaLKYhdBELL5Nk8bNh8aF2YwM5QPNN8q4Z
	lmkZlhQ36kKH217MMRyU0WypBoxiQrFkb43KJmqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789276850;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p0UvqmWMLXqmBmvlW+Z6kKr3r/Esa92EQa/99Z7hCK8=;
	b=MOPcNGQ0ddvXsAleyRDXvmJR5XOWnFsS/XvxTUjq3631j9tLEDL0S2UzBe7z0Oe8
	ToGl1x6bhnAnzSah1LGgPdGAKxEUESfz6NC774ODACj3OkhXaYtyeL12BmhzWp/ZDzl
	WULQtdJ5HHUKhYLpHjhep+CcnajcWVx9fghBuY0g=
Content-Type: multipart/mixed; boundary="===============3921217895694248798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpcbind: upgrading to 1.3.1 SUCCEEDED
Message-ID: <010101a0993606c0-83d9f0e8-74c8-4831-a8f2-ccee2c11db39-000000@us-west-2.amazonses.com>
Date: Sun, 13 Sep 2026 05:20:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.13-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 05:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245708

--===============3921217895694248798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpcbind* to *1.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rpcbind-upgrade-1.2.9-1.3.1.patch
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
From d2aa342fc0682b9199cd30934a3ccec0bf05d6b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 13 Sep 2026 05:08:09 +0000
Subject: [PATCH] rpcbind: upgrade 1.2.9 -> 1.3.1

---
 .../0001-systemd-use-EnvironmentFile.patch     |  2 +-
 ...rpcbind_add_option_to_fix_port_number.patch | 18 +++++++++---------
 .../{rpcbind_1.2.9.bb => rpcbind_1.3.1.bb}     |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.9.bb => rpcbind_1.3.1.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 621cc34322..539a492ec7 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -1,4 +1,4 @@
-From 43908891b9344054e23a7d9f4d6fc5b34b2406cf Mon Sep 17 00:00:00 2001
+From 69c128f5df9a24a8b05d4d2680361fa7d8711687 Mon Sep 17 00:00:00 2001
 From: Stefan Agner <stefan.agner@toradex.com>
 Date: Wed, 27 Aug 2025 11:30:48 +0800
 Subject: [PATCH] systemd: use EnvironmentFile
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
index f0a4df04e4..bf07379e4c 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -1,4 +1,4 @@
-From fc77df5fed834dd1cffc8c58adb4a13a9b97f5cf Mon Sep 17 00:00:00 2001
+From cfcfb89543b654c128708f81dc18458149398966 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 27 Aug 2025 11:24:53 +0800
 Subject: [PATCH] add option to make users able to use fixed port number
@@ -38,7 +38,7 @@ index 15b70f9..4a6ffbc 100644
  .Fl h
  option is specified,
 diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index 6d0d72d..2f10dac 100644
+index 2c007eb..4ea2002 100644
 --- a/src/rpcb_svc_com.c
 +++ b/src/rpcb_svc_com.c
 @@ -49,6 +49,7 @@
@@ -49,7 +49,7 @@ index 6d0d72d..2f10dac 100644
  #include <netconfig.h>
  #include <errno.h>
  #include <syslog.h>
-@@ -499,6 +500,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
+@@ -503,6 +504,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
  
  static struct rmtcallfd_list *rmthead;
  static struct rmtcallfd_list *rmttail;
@@ -57,7 +57,7 @@ index 6d0d72d..2f10dac 100644
  
  int
  create_rmtcall_fd(struct netconfig *nconf)
-@@ -506,6 +508,8 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -510,6 +512,8 @@ create_rmtcall_fd(struct netconfig *nconf)
  	int fd;
  	struct rmtcallfd_list *rmt;
  	SVCXPRT *xprt;
@@ -66,7 +66,7 @@ index 6d0d72d..2f10dac 100644
  
  	if ((fd = __rpc_nconf2fd(nconf)) == -1) {
  		if (debugging)
-@@ -514,6 +518,19 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -518,6 +522,19 @@ create_rmtcall_fd(struct netconfig *nconf)
  			nconf->nc_device, errno);
  		return (-1);
  	}
@@ -87,7 +87,7 @@ index 6d0d72d..2f10dac 100644
  	if (xprt == NULL) {
  		if (debugging)
 diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 4212377..7e7f79d 100644
+index c39df97..f94b813 100644
 --- a/src/rpcbind.c
 +++ b/src/rpcbind.c
 @@ -112,6 +112,7 @@ int runasdaemon = 0;
@@ -98,7 +98,7 @@ index 4212377..7e7f79d 100644
  
  char **hosts = NULL;
  int nhosts = 0;
-@@ -963,7 +964,7 @@ parseargs(int argc, char *argv[])
+@@ -964,7 +965,7 @@ parseargs(int argc, char *argv[])
  {
  	int c;
  	oldstyle_local = 1;
@@ -107,7 +107,7 @@ index 4212377..7e7f79d 100644
  		switch (c) {
  		case 'a':
  			doabort = 1;	/* when debugging, do an abort on */
-@@ -981,6 +982,9 @@ parseargs(int argc, char *argv[])
+@@ -982,6 +983,9 @@ parseargs(int argc, char *argv[])
  			if (hosts[nhosts - 1] == NULL)
  				errx(1, "Out of memory");
  			break;
@@ -117,7 +117,7 @@ index 4212377..7e7f79d 100644
  		case 'i':
  			insecure = 1;
  			break;
-@@ -1003,7 +1007,7 @@ parseargs(int argc, char *argv[])
+@@ -1004,7 +1008,7 @@ parseargs(int argc, char *argv[])
  			break;
  #endif
  		default:	/* error */
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb b/meta/recipes-extended/rpcbind/rpcbind_1.3.1.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.3.1.bb
index 000ffe3704..bc7330e294 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.3.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] = "ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b"
+SRC_URI[sha256sum] = "8e551b445f5172f8ef218845af342fb2a2d741b57ce8c777c781a01ea92f92a5"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives sourceforge-releases
 
-- 
2.47.1


--===============3921217895694248798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rpcbind: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind: SRC_URI changed from "https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.9.tar.bz2 file://init.d file://rpcbind.conf file://rpcbind.tmpfiles file://rpcbind.systemd file://rpcbind_add_option_to_fix_port_number.patch file://0001-systemd-use-EnvironmentFile.patch" to "https://downloads.sourceforge.net/rpcbind/rpcbind-1.3.1.tar.bz2 file://init.d file://rpcbind.conf file://rpcbind.tmpfiles file://rpcbind.systemd file://rpcbind_add_option_to_fix_port_number.patch file://0001-systemd-use-EnvironmentFile.patch"
packages/x86-64-v3-poky-linux/rpcbind: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PKGSIZE changed from 279840 to 248936 (-11%)
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dev: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dev: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-doc: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-doc: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-locale: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-locale: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: FILELIST: directory renamed /usr/src/debug/rpcbind/1.2.9/src -> /usr/src/debug/rpcbind/1.3.1/src
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PKGSIZE changed from 189730 to 190921 (+1%)
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-staticdev: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-staticdev: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind: PV changed from "1.2.9" to "1.3.1"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind: PKGV changed from 1.2.9 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind: PKGSIZE changed from 96166 to 87974 (-9%)

--===============3921217895694248798==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpcbind-upgrade-1.2.9-1.3.1.patch"

RnJvbSBkMmFhMzQyZmMwNjgyYjkxOTljZDMwOTM0YTNjY2VjMGJmMDVkNmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTMgU2VwIDIwMjYgMDU6MDg6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
cGNiaW5kOiB1cGdyYWRlIDEuMi45IC0+IDEuMy4xCgotLS0KIC4uLi8wMDAxLXN5c3RlbWQtdXNl
LUVudmlyb25tZW50RmlsZS5wYXRjaCAgICAgfCAgMiArLQogLi4ucnBjYmluZF9hZGRfb3B0aW9u
X3RvX2ZpeF9wb3J0X251bWJlci5wYXRjaCB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogLi4uL3ty
cGNiaW5kXzEuMi45LmJiID0+IHJwY2JpbmRfMS4zLjEuYmJ9ICAgICB8ICAyICstCiAzIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9ycGNiaW5kL3tycGNiaW5kXzEuMi45LmJiID0+IHJwY2JpbmRfMS4z
LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQv
cnBjYmluZC8wMDAxLXN5c3RlbWQtdXNlLUVudmlyb25tZW50RmlsZS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9ycGNiaW5kL3JwY2JpbmQvMDAwMS1zeXN0ZW1kLXVzZS1FbnZpcm9ubWVu
dEZpbGUucGF0Y2gKaW5kZXggNjIxY2MzNDMyMi4uNTM5YTQ5MmVjNyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZC8wMDAxLXN5c3RlbWQtdXNlLUVudmly
b25tZW50RmlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNi
aW5kLzAwMDEtc3lzdGVtZC11c2UtRW52aXJvbm1lbnRGaWxlLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA0MzkwODg5MWI5MzQ0MDU0ZTIzYTdkOWY0ZDZmYzViMzRiMjQwNmNmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2OWMxMjhmNWRmOWEyNGE4YjA1ZDRkMjY4MDM2MWZhN2Q4
NzExNjg3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU3RlZmFuIEFnbmVyIDxzdGVm
YW4uYWduZXJAdG9yYWRleC5jb20+CiBEYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDExOjMwOjQ4ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN5c3RlbWQ6IHVzZSBFbnZpcm9ubWVudEZpbGUKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ycGNiaW5kL3JwY2JpbmQvcnBjYmluZF9hZGRf
b3B0aW9uX3RvX2ZpeF9wb3J0X251bWJlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9y
cGNiaW5kL3JwY2JpbmQvcnBjYmluZF9hZGRfb3B0aW9uX3RvX2ZpeF9wb3J0X251bWJlci5wYXRj
aAppbmRleCBmMGE0ZGYwNGU0Li5iZjA3Mzc5ZTRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kL3JwY2JpbmRfYWRkX29wdGlvbl90b19maXhfcG9ydF9u
dW1iZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZC9y
cGNiaW5kX2FkZF9vcHRpb25fdG9fZml4X3BvcnRfbnVtYmVyLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBmYzc3ZGY1ZmVkODM0ZGQxY2ZmYzhjNThhZGI0YTEzYTliOTdmNWNmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZmNmYjg5NTQzYjY1NGMxMjg3MDhmODFkYzE4NDU4MTQ5
Mzk4OTY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5s
aUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyNyBBdWcgMjAyNSAxMToyNDo1MyArMDgwMAog
U3ViamVjdDogW1BBVENIXSBhZGQgb3B0aW9uIHRvIG1ha2UgdXNlcnMgYWJsZSB0byB1c2UgZml4
ZWQgcG9ydCBudW1iZXIKQEAgLTM4LDcgKzM4LDcgQEAgaW5kZXggMTViNzBmOS4uNGE2ZmZiYyAx
MDA2NDQKICAuRmwgaAogIG9wdGlvbiBpcyBzcGVjaWZpZWQsCiBkaWZmIC0tZ2l0IGEvc3JjL3Jw
Y2Jfc3ZjX2NvbS5jIGIvc3JjL3JwY2Jfc3ZjX2NvbS5jCi1pbmRleCA2ZDBkNzJkLi4yZjEwZGFj
IDEwMDY0NAoraW5kZXggMmMwMDdlYi4uNGVhMjAwMiAxMDA2NDQKIC0tLSBhL3NyYy9ycGNiX3N2
Y19jb20uYwogKysrIGIvc3JjL3JwY2Jfc3ZjX2NvbS5jCiBAQCAtNDksNiArNDksNyBAQApAQCAt
NDksNyArNDksNyBAQCBpbmRleCA2ZDBkNzJkLi4yZjEwZGFjIDEwMDY0NAogICNpbmNsdWRlIDxu
ZXRjb25maWcuaD4KICAjaW5jbHVkZSA8ZXJybm8uaD4KICAjaW5jbHVkZSA8c3lzbG9nLmg+Ci1A
QCAtNDk5LDYgKzUwMCw3IEBAIHhkcl9vcGFxdWVfcGFybXMoWERSICp4ZHJzLCBzdHJ1Y3Qgcl9y
bXRjYWxsX2FyZ3MgKmNhcCkKK0BAIC01MDMsNiArNTA0LDcgQEAgeGRyX29wYXF1ZV9wYXJtcyhY
RFIgKnhkcnMsIHN0cnVjdCByX3JtdGNhbGxfYXJncyAqY2FwKQogIAogIHN0YXRpYyBzdHJ1Y3Qg
cm10Y2FsbGZkX2xpc3QgKnJtdGhlYWQ7CiAgc3RhdGljIHN0cnVjdCBybXRjYWxsZmRfbGlzdCAq
cm10dGFpbDsKQEAgLTU3LDcgKzU3LDcgQEAgaW5kZXggNmQwZDcyZC4uMmYxMGRhYyAxMDA2NDQK
ICAKICBpbnQKICBjcmVhdGVfcm10Y2FsbF9mZChzdHJ1Y3QgbmV0Y29uZmlnICpuY29uZikKLUBA
IC01MDYsNiArNTA4LDggQEAgY3JlYXRlX3JtdGNhbGxfZmQoc3RydWN0IG5ldGNvbmZpZyAqbmNv
bmYpCitAQCAtNTEwLDYgKzUxMiw4IEBAIGNyZWF0ZV9ybXRjYWxsX2ZkKHN0cnVjdCBuZXRjb25m
aWcgKm5jb25mKQogIAlpbnQgZmQ7CiAgCXN0cnVjdCBybXRjYWxsZmRfbGlzdCAqcm10OwogIAlT
VkNYUFJUICp4cHJ0OwpAQCAtNjYsNyArNjYsNyBAQCBpbmRleCA2ZDBkNzJkLi4yZjEwZGFjIDEw
MDY0NAogIAogIAlpZiAoKGZkID0gX19ycGNfbmNvbmYyZmQobmNvbmYpKSA9PSAtMSkgewogIAkJ
aWYgKGRlYnVnZ2luZykKLUBAIC01MTQsNiArNTE4LDE5IEBAIGNyZWF0ZV9ybXRjYWxsX2ZkKHN0
cnVjdCBuZXRjb25maWcgKm5jb25mKQorQEAgLTUxOCw2ICs1MjIsMTkgQEAgY3JlYXRlX3JtdGNh
bGxfZmQoc3RydWN0IG5ldGNvbmZpZyAqbmNvbmYpCiAgCQkJbmNvbmYtPm5jX2RldmljZSwgZXJy
bm8pOwogIAkJcmV0dXJuICgtMSk7CiAgCX0KQEAgLTg3LDcgKzg3LDcgQEAgaW5kZXggNmQwZDcy
ZC4uMmYxMGRhYyAxMDA2NDQKICAJaWYgKHhwcnQgPT0gTlVMTCkgewogIAkJaWYgKGRlYnVnZ2lu
ZykKIGRpZmYgLS1naXQgYS9zcmMvcnBjYmluZC5jIGIvc3JjL3JwY2JpbmQuYwotaW5kZXggNDIx
MjM3Ny4uN2U3Zjc5ZCAxMDA2NDQKK2luZGV4IGMzOWRmOTcuLmY5NGI4MTMgMTAwNjQ0CiAtLS0g
YS9zcmMvcnBjYmluZC5jCiArKysgYi9zcmMvcnBjYmluZC5jCiBAQCAtMTEyLDYgKzExMiw3IEBA
IGludCBydW5hc2RhZW1vbiA9IDA7CkBAIC05OCw3ICs5OCw3IEBAIGluZGV4IDQyMTIzNzcuLjdl
N2Y3OWQgMTAwNjQ0CiAgCiAgY2hhciAqKmhvc3RzID0gTlVMTDsKICBpbnQgbmhvc3RzID0gMDsK
LUBAIC05NjMsNyArOTY0LDcgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCitA
QCAtOTY0LDcgKzk2NSw3IEBAIHBhcnNlYXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQogIHsK
ICAJaW50IGM7CiAgCW9sZHN0eWxlX2xvY2FsID0gMTsKQEAgLTEwNyw3ICsxMDcsNyBAQCBpbmRl
eCA0MjEyMzc3Li43ZTdmNzlkIDEwMDY0NAogIAkJc3dpdGNoIChjKSB7CiAgCQljYXNlICdhJzoK
ICAJCQlkb2Fib3J0ID0gMTsJLyogd2hlbiBkZWJ1Z2dpbmcsIGRvIGFuIGFib3J0IG9uICovCi1A
QCAtOTgxLDYgKzk4Miw5IEBAIHBhcnNlYXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAg
LTk4Miw2ICs5ODMsOSBAQCBwYXJzZWFyZ3MoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAJCQlp
ZiAoaG9zdHNbbmhvc3RzIC0gMV0gPT0gTlVMTCkKICAJCQkJZXJyeCgxLCAiT3V0IG9mIG1lbW9y
eSIpOwogIAkJCWJyZWFrOwpAQCAtMTE3LDcgKzExNyw3IEBAIGluZGV4IDQyMTIzNzcuLjdlN2Y3
OWQgMTAwNjQ0CiAgCQljYXNlICdpJzoKICAJCQlpbnNlY3VyZSA9IDE7CiAgCQkJYnJlYWs7Ci1A
QCAtMTAwMyw3ICsxMDA3LDcgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCitA
QCAtMTAwNCw3ICsxMDA4LDcgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAg
CQkJYnJlYWs7CiAgI2VuZGlmCiAgCQlkZWZhdWx0OgkvKiBlcnJvciAqLwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZF8xLjIuOS5iYiBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9ycGNiaW5kL3JwY2JpbmRfMS4zLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZF8xLjIu
OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZF8xLjMu
MS5iYgppbmRleCAwMDBmZmUzNzA0Li5iYzczMzBlMjk0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kXzEuMi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ycGNiaW5kL3JwY2JpbmRfMS4zLjEuYmIKQEAgLTE4LDcgKzE4LDcgQEAgU1JDX1VS
SSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vcnBjYmluZC9ycGNiaW5kLSR7UFZ9LnRhci5iejIg
XAogICAgICAgICAgICBmaWxlOi8vcnBjYmluZF9hZGRfb3B0aW9uX3RvX2ZpeF9wb3J0X251bWJl
ci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXN5c3RlbWQtdXNlLUVudmlyb25tZW50
RmlsZS5wYXRjaCBcCiAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNlNWYxYTg3
YzU2NmVmMGIyODk3YTI4ZjUwYTc1YzFkYzIzZmVjNDEzYTQ2YTdmNDE4MzQyM2I2YjZhYTk5MWIi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGU1NTFiNDQ1ZjUxNzJmOGVmMjE4ODQ1YWYzNDJmYjJh
MmQ3NDFiNTdjZThjNzc3Yzc4MWEwMWVhOTJmOTJhNSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBk
YXRlLXJjLmQgc3lzdGVtZCBwa2djb25maWcgdXBkYXRlLWFsdGVybmF0aXZlcyBzb3VyY2Vmb3Jn
ZS1yZWxlYXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============3921217895694248798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PKGSIZE changed from 279840 to 248936 (-11%)

--===============3921217895694248798==--

