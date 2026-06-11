Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74114CDB47D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50611.1781195502460528921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EW6NEzTV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CBjVtxHQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019eb7869da7-d597ea03-2338-427f-ad06-891ab6d99081-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sZurQ/SwTYuxd6GbpK1qI/TgNRSF/iUPJyU/x3M6+1g=;
	b=EW6NEzTViy71Th2N9BHavekdAm6p7++y1dShDaYGvXzeTsadxkA8O2BSXhM7Wmk9
	4TGpMHE9qjdjTkCdMZNkPA6tNd7b7bPB5QbstSntCfS/YfkpC5Xv912dPAh5ZaTOfXe
	SnH6NGBM/rKppubzNLdvZZLR1pbmnXcFX1RhdTvg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sZurQ/SwTYuxd6GbpK1qI/TgNRSF/iUPJyU/x3M6+1g=;
	b=CBjVtxHQURKbG5oJGxNsI2o+a89lYTwIw0zs5WomWOQPAL8scVJoSzFiI8LHemjZ
	/rF+bwdYZp0CIKUluPx1/aINyjj9H+XWDYG9A3tcShYokhl+KjLw/z0/5G1eDE+WqHg
	76ecHFXfm/hqodtfdMTAiRhBQOFN7oR0ZCD+4BA4=
Content-Type: multipart/mixed; boundary="===============2155866599150672669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpcbind: upgrading to 1.2.9 SUCCEEDED
Message-ID: <0101019eb7869da7-d597ea03-2338-427f-ad06-891ab6d99081-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238523

--===============2155866599150672669==
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
From 023bb1c7a8b1bf494e42024c99fba9d085d61cc5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:31:49 +0000
Subject: [PATCH] rpcbind: upgrade 1.2.8 -> 1.2.9

---
 .../0001-systemd-use-EnvironmentFile.patch    |  7 ++----
 ...pcbind_add_option_to_fix_port_number.patch | 25 ++++++++-----------
 .../{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb}    |  2 +-
 3 files changed, 14 insertions(+), 20 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 28d83e74f5..621cc34322 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -1,4 +1,4 @@
-From 87a9931e4aa97d7b6eb3b25f26444e30e45e3e41 Mon Sep 17 00:00:00 2001
+From 43908891b9344054e23a7d9f4d6fc5b34b2406cf Mon Sep 17 00:00:00 2001
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
index 3205ff3086..f0a4df04e4 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -1,4 +1,4 @@
-From 285c193dc94b53763ac8d6f91229eaab37d45fc6 Mon Sep 17 00:00:00 2001
+From fc77df5fed834dd1cffc8c58adb4a13a9b97f5cf Mon Sep 17 00:00:00 2001
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


--===============2155866599150672669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rpcbind: SRC_URI changed from "https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.8.tar.bz2 file://init.d file://rpcbind.conf file://rpcbind.tmpfiles file://rpcbind.systemd file://rpcbind_add_option_to_fix_port_number.patch file://0001-systemd-use-EnvironmentFile.patch" to "https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.9.tar.bz2 file://init.d file://rpcbind.conf file://rpcbind.tmpfiles file://rpcbind.systemd file://rpcbind_add_option_to_fix_port_number.patch file://0001-systemd-use-EnvironmentFile.patch"
packages/x86-64-v3-poky-linux/rpcbind: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dbg: PKGSIZE changed from 279496 to 279864 (+0%)
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dev: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-dev: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-doc: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-doc: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-locale: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-locale: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: FILELIST: directory renamed /usr/src/debug/rpcbind/1.2.8/src -> /usr/src/debug/rpcbind/1.2.9/src
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-src: PKGSIZE changed from 189409 to 189730 (+0%)
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-staticdev: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind-staticdev: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/x86-64-v3-poky-linux/rpcbind/rpcbind: PV changed from "1.2.8" to "1.2.9"
packages/x86-64-v3-poky-linux/rpcbind/rpcbind: PKGV changed from 1.2.8 [default] to 1.2.9 [default]

--===============2155866599150672669==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpcbind-upgrade-1.2.8-1.2.9.patch"

RnJvbSAwMjNiYjFjN2E4YjFiZjQ5NGU0MjAyNGM5OWZiYTlkMDg1ZDYxY2M1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6MzE6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
cGNiaW5kOiB1cGdyYWRlIDEuMi44IC0+IDEuMi45CgotLS0KIC4uLi8wMDAxLXN5c3RlbWQtdXNl
LUVudmlyb25tZW50RmlsZS5wYXRjaCAgICB8ICA3ICsrLS0tLQogLi4ucGNiaW5kX2FkZF9vcHRp
b25fdG9fZml4X3BvcnRfbnVtYmVyLnBhdGNoIHwgMjUgKysrKysrKystLS0tLS0tLS0tLQogLi4u
L3tycGNiaW5kXzEuMi44LmJiID0+IHJwY2JpbmRfMS4yLjkuYmJ9ICAgIHwgIDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQve3JwY2JpbmRfMS4yLjguYmIgPT4gcnBjYmluZF8x
LjIuOS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmlu
ZC9ycGNiaW5kLzAwMDEtc3lzdGVtZC11c2UtRW52aXJvbm1lbnRGaWxlLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZC8wMDAxLXN5c3RlbWQtdXNlLUVudmlyb25t
ZW50RmlsZS5wYXRjaAppbmRleCAyOGQ4M2U3NGY1Li42MjFjYzM0MzIyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kLzAwMDEtc3lzdGVtZC11c2UtRW52
aXJvbm1lbnRGaWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ycGNiaW5kL3Jw
Y2JpbmQvMDAwMS1zeXN0ZW1kLXVzZS1FbnZpcm9ubWVudEZpbGUucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDg3YTk5MzFlNGFhOTdkN2I2ZWIzYjI1ZjI2NDQ0ZTMwZTQ1ZTNlNDEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQzOTA4ODkxYjkzNDQwNTRlMjNhN2Q5ZjRkNmZjNWIz
NGIyNDA2Y2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTdGVmYW4gQWduZXIgPHN0
ZWZhbi5hZ25lckB0b3JhZGV4LmNvbT4KIERhdGU6IFdlZCwgMjcgQXVnIDIwMjUgMTE6MzA6NDgg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3lzdGVtZDogdXNlIEVudmlyb25tZW50RmlsZQpAQCAt
MTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRy
aXZlci5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDZl
ZGUwYWYuLmQxYWU1ZTQgMTAwNjQ0CitpbmRleCBjNDYyOTRjLi4xNTY2Mzg2IDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04Niw1ICs4Niw3IEBAIEFD
X0NIRUNLX0hFQURFUlMoW25zcy5oXSkKQEAgLTQyLDYgKzQyLDMgQEAgaW5kZXggNzcxYjk0NC4u
NTk5MjA5OCAxMDA2NDQKICBFeGVjU3RhcnQ9QF9zYmluZGlyQC9ycGNiaW5kICRSUENCSU5EX09Q
VElPTlMgQHdhcm1zdGFydHNfb3B0QCAtZgogIAogIFtJbnN0YWxsXQotLS0gCi0yLjM0LjEKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZC9ycGNiaW5k
X2FkZF9vcHRpb25fdG9fZml4X3BvcnRfbnVtYmVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3JwY2JpbmQvcnBjYmluZC9ycGNiaW5kX2FkZF9vcHRpb25fdG9fZml4X3BvcnRfbnVtYmVy
LnBhdGNoCmluZGV4IDMyMDVmZjMwODYuLmYwYTRkZjA0ZTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9ycGNiaW5kL3JwY2JpbmQvcnBjYmluZF9hZGRfb3B0aW9uX3RvX2ZpeF9w
b3J0X251bWJlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmluZC9ycGNi
aW5kL3JwY2JpbmRfYWRkX29wdGlvbl90b19maXhfcG9ydF9udW1iZXIucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDI4NWMxOTNkYzk0YjUzNzYzYWM4ZDZmOTEyMjllYWFiMzdkNDVmYzYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZjNzdkZjVmZWQ4MzRkZDFjZmZjOGM1OGFkYjRh
MTNhOWI5N2Y1Y2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3kgTGkgPHJvbmdx
aW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDExOjI0OjUzICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFkZCBvcHRpb24gdG8gbWFrZSB1c2VycyBhYmxlIHRvIHVz
ZSBmaXhlZCBwb3J0IG51bWJlcgpAQCAtMzgsMTggKzM4LDE4IEBAIGluZGV4IDE1YjcwZjkuLjRh
NmZmYmMgMTAwNjQ0CiAgLkZsIGgKICBvcHRpb24gaXMgc3BlY2lmaWVkLAogZGlmZiAtLWdpdCBh
L3NyYy9ycGNiX3N2Y19jb20uYyBiL3NyYy9ycGNiX3N2Y19jb20uYwotaW5kZXggMTc0M2RhZC4u
MDdhMWM3NSAxMDA2NDQKK2luZGV4IDZkMGQ3MmQuLjJmMTBkYWMgMTAwNjQ0CiAtLS0gYS9zcmMv
cnBjYl9zdmNfY29tLmMKICsrKyBiL3NyYy9ycGNiX3N2Y19jb20uYwotQEAgLTQ4LDYgKzQ4LDcg
QEAKLSAjaW5jbHVkZSA8cnBjL3JwYy5oPgorQEAgLTQ5LDYgKzQ5LDcgQEAKKyAjaW5jbHVkZSA8
cnBjL3JwY19jb20uaD4KICAjaW5jbHVkZSA8cnBjL3JwY2JfcHJvdC5oPgogICNpbmNsdWRlIDxy
cGMvc3ZjX2RnLmg+CiArI2luY2x1ZGUgPHJwYy9ycGNfY29tLmg+CiAgI2luY2x1ZGUgPG5ldGNv
bmZpZy5oPgogICNpbmNsdWRlIDxlcnJuby5oPgogICNpbmNsdWRlIDxzeXNsb2cuaD4KLUBAIC00
OTcsNiArNDk4LDcgQEAgeGRyX29wYXF1ZV9wYXJtcyhYRFIgKnhkcnMsIHN0cnVjdCByX3JtdGNh
bGxfYXJncyAqY2FwKQorQEAgLTQ5OSw2ICs1MDAsNyBAQCB4ZHJfb3BhcXVlX3Bhcm1zKFhEUiAq
eGRycywgc3RydWN0IHJfcm10Y2FsbF9hcmdzICpjYXApCiAgCiAgc3RhdGljIHN0cnVjdCBybXRj
YWxsZmRfbGlzdCAqcm10aGVhZDsKICBzdGF0aWMgc3RydWN0IHJtdGNhbGxmZF9saXN0ICpybXR0
YWlsOwpAQCAtNTcsNyArNTcsNyBAQCBpbmRleCAxNzQzZGFkLi4wN2ExYzc1IDEwMDY0NAogIAog
IGludAogIGNyZWF0ZV9ybXRjYWxsX2ZkKHN0cnVjdCBuZXRjb25maWcgKm5jb25mKQotQEAgLTUw
NCw2ICs1MDYsOCBAQCBjcmVhdGVfcm10Y2FsbF9mZChzdHJ1Y3QgbmV0Y29uZmlnICpuY29uZikK
K0BAIC01MDYsNiArNTA4LDggQEAgY3JlYXRlX3JtdGNhbGxfZmQoc3RydWN0IG5ldGNvbmZpZyAq
bmNvbmYpCiAgCWludCBmZDsKICAJc3RydWN0IHJtdGNhbGxmZF9saXN0ICpybXQ7CiAgCVNWQ1hQ
UlQgKnhwcnQ7CkBAIC02Niw3ICs2Niw3IEBAIGluZGV4IDE3NDNkYWQuLjA3YTFjNzUgMTAwNjQ0
CiAgCiAgCWlmICgoZmQgPSBfX3JwY19uY29uZjJmZChuY29uZikpID09IC0xKSB7CiAgCQlpZiAo
ZGVidWdnaW5nKQotQEAgLTUxMiw2ICs1MTYsMTkgQEAgY3JlYXRlX3JtdGNhbGxfZmQoc3RydWN0
IG5ldGNvbmZpZyAqbmNvbmYpCitAQCAtNTE0LDYgKzUxOCwxOSBAQCBjcmVhdGVfcm10Y2FsbF9m
ZChzdHJ1Y3QgbmV0Y29uZmlnICpuY29uZikKICAJCQluY29uZi0+bmNfZGV2aWNlLCBlcnJubyk7
CiAgCQlyZXR1cm4gKC0xKTsKICAJfQpAQCAtODcsNyArODcsNyBAQCBpbmRleCAxNzQzZGFkLi4w
N2ExYzc1IDEwMDY0NAogIAlpZiAoeHBydCA9PSBOVUxMKSB7CiAgCQlpZiAoZGVidWdnaW5nKQog
ZGlmZiAtLWdpdCBhL3NyYy9ycGNiaW5kLmMgYi9zcmMvcnBjYmluZC5jCi1pbmRleCBiZjdiNDk5
Li43MjY4OTA3IDEwMDY0NAoraW5kZXggNDIxMjM3Ny4uN2U3Zjc5ZCAxMDA2NDQKIC0tLSBhL3Ny
Yy9ycGNiaW5kLmMKICsrKyBiL3NyYy9ycGNiaW5kLmMKIEBAIC0xMTIsNiArMTEyLDcgQEAgaW50
IHJ1bmFzZGFlbW9uID0gMDsKQEAgLTk4LDcgKzk4LDcgQEAgaW5kZXggYmY3YjQ5OS4uNzI2ODkw
NyAxMDA2NDQKICAKICBjaGFyICoqaG9zdHMgPSBOVUxMOwogIGludCBuaG9zdHMgPSAwOwotQEAg
LTk1OSw3ICs5NjAsNyBAQCBwYXJzZWFyZ3MoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC05
NjMsNyArOTY0LDcgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgewogIAlp
bnQgYzsKICAJb2xkc3R5bGVfbG9jYWwgPSAxOwpAQCAtMTA3LDcgKzEwNyw3IEBAIGluZGV4IGJm
N2I0OTkuLjcyNjg5MDcgMTAwNjQ0CiAgCQlzd2l0Y2ggKGMpIHsKICAJCWNhc2UgJ2EnOgogIAkJ
CWRvYWJvcnQgPSAxOwkvKiB3aGVuIGRlYnVnZ2luZywgZG8gYW4gYWJvcnQgb24gKi8KLUBAIC05
NzcsNiArOTc4LDkgQEAgcGFyc2VhcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtOTgx
LDYgKzk4Miw5IEBAIHBhcnNlYXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQogIAkJCWlmICho
b3N0c1tuaG9zdHMgLSAxXSA9PSBOVUxMKQogIAkJCQllcnJ4KDEsICJPdXQgb2YgbWVtb3J5Iik7
CiAgCQkJYnJlYWs7CkBAIC0xMTcsNyArMTE3LDcgQEAgaW5kZXggYmY3YjQ5OS4uNzI2ODkwNyAx
MDA2NDQKICAJCWNhc2UgJ2knOgogIAkJCWluc2VjdXJlID0gMTsKICAJCQlicmVhazsKLUBAIC05
OTksNyArMTAwMyw3IEBAIHBhcnNlYXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAgLTEw
MDMsNyArMTAwNyw3IEBAIHBhcnNlYXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQogIAkJCWJy
ZWFrOwogICNlbmRpZgogIAkJZGVmYXVsdDoJLyogZXJyb3IgKi8KQEAgLTEyNiw2ICsxMjYsMyBA
QCBpbmRleCBiZjdiNDk5Li43MjY4OTA3IDEwMDY0NAogIAkJCWV4aXQgKDEpOwogIAkJfQogIAl9
Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcnBjYmlu
ZC9ycGNiaW5kXzEuMi44LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmlu
ZF8xLjIuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kXzEuMi44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvcnBjYmluZC9ycGNiaW5kXzEuMi45LmJiCmluZGV4IGJkOGJhMWU4OGEuLjY5MmM0
MjFjZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ycGNiaW5kL3JwY2JpbmRf
MS4yLjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3JwY2JpbmQvcnBjYmluZF8xLjIu
OS5iYgpAQCAtMTgsNyArMTgsNyBAQCBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS9y
cGNiaW5kL3JwY2JpbmQtJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9ycGNiaW5k
X2FkZF9vcHRpb25fdG9fZml4X3BvcnRfbnVtYmVyLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtc3lzdGVtZC11c2UtRW52aXJvbm1lbnRGaWxlLnBhdGNoIFwKICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOTY0MTMyYzM4OTkxOGU4OTY0ZDczMzQ5MzZiNmRkMTBlZjAy
NWIzMDBjNmIyOWU2OTNiYTBmMjk1NTBlM2RlNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjZTVm
MWE4N2M1NjZlZjBiMjg5N2EyOGY1MGE3NWMxZGMyM2ZlYzQxM2E0NmE3ZjQxODM0MjNiNmI2YWE5
OTFiIgogCiBpbmhlcml0IGF1dG90b29scyB1cGRhdGUtcmMuZCBzeXN0ZW1kIHBrZ2NvbmZpZyB1
cGRhdGUtYWx0ZXJuYXRpdmVzIHNvdXJjZWZvcmdlLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============2155866599150672669==--

