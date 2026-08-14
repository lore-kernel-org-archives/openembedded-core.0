Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AE0C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 09:54:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9609.1786701252492862221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 02:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I9/ChnAL;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacf197759so13317145ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786701251; x=1787306051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHV/zmXjTUwUjEJt1sibfrXNXlMsWVP8CCn6lxY4rko=;
        b=I9/ChnAL+55Y4LI5kUBUo36oVoe5fs6zVpZ4pdj+1i3CpMPL2AD+xvrGmW+dMF11HX
         /Q+yJlJ1GXsivh+9yAp9jhKudtIbwa2aPZlGNmkTf2ZZ4la0EooXIp1cQOMmJnaCys/D
         P2m7cRC+D0RSHx4XuPgC5OHI8BCu375eDoLfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701251; x=1787306051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHV/zmXjTUwUjEJt1sibfrXNXlMsWVP8CCn6lxY4rko=;
        b=Zk9HNilnEMG93i7mWGfh8ouP/8W8KQKdifxcXx/yEswTPElq51lrzCGOqGzCQGYHBe
         duXWY/wqUNJbLFqHQC+9B2hy5QzIXoIuTgk9wLPdyL/4PwV70gBxUJ77tAGRNYYal4T0
         OmPWRyeb8Rm34w47E32flO1PWB7sZKt9d9j8xJBFrDEAe6PT/ufNVPb9bZ2bqa2tel1n
         Fdq3cKs9nFSxJtanaQDsIcd08bhPFRf2KvN5ww5oakhN2hKP7cbpmHbCfmARdKGlgCNL
         kA2qqfiqa2dcjEqJKRE6g6Vydo5m7fLr/X1Q3jOMCxfjYz6lAs0f2z/CFM+8mLumkZSP
         Pobg==
X-Gm-Message-State: AOJu0Yw41nXoCvW4aTQG2ELCAnD8wITeevCtknsWi9mpuSOXMaFzvTjI
	BeHKefJULjx1Fxf2GzMAaaP6xsrfNkJA7+wmaYLWy8AZrKRgof6xqMGJKGw3UCSr9A+opzIbvqr
	Khwr7gy4=
X-Gm-Gg: AR+sD11XGtbVJfSLZY9RrU2DC9i9c9sziCgZf4Lj6fBqzZbu2HHXs/aK6GccqTp8D3e
	g0KBFzapSch566s4FrFVrcf9VBd2NfBqaNpifQ1sDfahAsDPQzc0FxskL0AB5PuwvLX9BQTQxTq
	7yptRRF6G00UY0lNXT4tiM0dCZxqRg+aIBxLNXwab2iYzWcXXYrx8tEkxs9sbD1GWvgWg3kMO7e
	/ceA2ekX8DkWVf7ozKGR7zTsqk0yfXln2i+IlyQtgZ/r1NnlN7dxAPV5Kanp8opYu10U9JNi/Dm
	cFC3uwv0OnSNUOFKM7OMmMHekFCt+6CUB9zsM+cwXQS6+UYVUzmfhNfFudiMNOnY0hGuDBGW83C
	VUyp0sUL3iT+9yqr8nIlS2aNweQIR9t1OdJ7GyNvdB31fWNETFVZx+jK+/U6GgGgYM95pue3Djz
	EqB8YsMPKOHTjGiReD3xuk1BjqUaXcRkGlaMxQVnxvMJy5xyquNUHMu6clw2YX9EMmr0o4FPrBt
	HSo
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr5925250637.2.1786701251408;
        Fri, 14 Aug 2026 02:54:11 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:a7de:e349:c3d5:7c44:1c80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bda546sm2916336eec.6.2026.08.14.02.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:54:10 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 1/2] rpcbind: upgrade 1.2.8 -> 1.2.9
Date: Fri, 14 Aug 2026 15:23:55 +0530
Message-ID: <20260814095356.775418-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 09:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243428

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fix for CVE-2026-16277

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-16277
[2] https://security-tracker.debian.org/tracker/CVE-2026-16277

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00f9ac421f1a3c66d2d53b9bffb9a31111239198)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.43.0


