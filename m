Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00E9C71AE6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:58:56 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 34so1681280pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PbMzHvJP1C8fGZtK9YR2PISVePlXVey96gQEi0oPb6Q=;
	b=bhA5b3xezsHoAfX0lF/8GfYSwF/Ty+seXWTXwHPySxEmcMETuG94TTfG8zQWAuuKpO
	n/sMBgLMzs3U5rZXQYYroTYf4ly3IrWC2J3TvzCmOqsr3CX1Whwocgq1y6bT5PV8iUC+
	SC+v9z5E88NNsbcnuT8jKIOKo/H3rI20x6/WscDEtgA558n48PS+SGn5MyjP7dE024dv
	lmdrA4q7TJKIPJ4sRc+HfJcqPM4BU4D/+8NWfU8tMDhtlxzNMgJLRd3c0609Hs8fHbpX
	T3Gtj0UyG0eeXGi19NiLFJIB8DnAVu2e6BIPF34WS/sD1RqJZPF+KfrFr5oyrboChKBK
	VTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PbMzHvJP1C8fGZtK9YR2PISVePlXVey96gQEi0oPb6Q=;
	b=PVDAjfbW7BMJ33W0xoiIep+3o9VHn7QGeSSB5fgdmA6cMZdQGreZowg43nR8RFQ+64
	8ZaTj9IV8d6/qsfCcipyWHnCJzBl9D5NNFrd+pTh5bPVWdXBqabzrkFPlgY6mt+0XaYw
	oJTT+9YjwPBQiAljmwqyn6YB9jZRrY1qVeJ+YIwCiLSavVGD1NK4cV6oeUNWjrTLkZmr
	GI8P7m++Wsv5fZAXYoHdVhTqR+aM05hk134Zb0A6QpKqQBCci6Yymgjx74LyXeuEwwjZ
	0Ap0t4Yi8xM7YnAeIP1zdoZ5mMz51oucEcrTmf81cTOt01ZSIthTa1uhoAnZW3GA/OrU
	GXpA==
X-Gm-Message-State: AN3rC/7TnYcgQp7L/BmqPxPNpztQ9KEy8BCZGnSdYqzfFiI/srtNvoh9
	SmtFQl0Vqz1NNMDY
X-Received: by 10.84.229.3 with SMTP id b3mr641515plk.190.1492567137871;
	Tue, 18 Apr 2017 18:58:57 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a190sm787128pgc.60.2017.04.18.18.58.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 18:58:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 18:58:38 -0700
Message-Id: <20170419015839.1294-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170419015839.1294-1-raj.khem@gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
Subject: [PATCH 4/5] rpcbind: Remove uneeded patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Apr 2017 01:58:57 -0000

We were carrying patches which are no longer
needed when building rpcbind for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpcbind/rpcbind/musl-sunrpc.patch              | 30 ----------------------
 .../rpcbind/rpcbind/remove-sys-queue.patch         | 22 ----------------
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |  8 ------
 3 files changed, 60 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch b/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
deleted file mode 100644
index 6fbc6364cb6..00000000000
--- a/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-The musl implementation of getaddrinfo and getservbyname does not
-aliases. As a workaround we use "sunprc" instead of "portmapper"
-
-ported from alpine linux
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: rpcbind-0.2.2/src/rpcbind.c
-===================================================================
---- rpcbind-0.2.2.orig/src/rpcbind.c
-+++ rpcbind-0.2.2/src/rpcbind.c
-@@ -491,7 +491,7 @@ init_transport(struct netconfig *nconf)
- 			if ((aicode = getaddrinfo(hosts[nhostsbak],
- 			    servname, &hints, &res)) != 0) {
- 			  if ((aicode = getaddrinfo(hosts[nhostsbak],
--						    "portmapper", &hints, &res)) != 0) {
-+						    "sunrpc", &hints, &res)) != 0) {
- 				syslog(LOG_ERR,
- 				    "cannot get local address for %s: %s",
- 				    nconf->nc_netid, gai_strerror(aicode));
-@@ -564,7 +564,7 @@ init_transport(struct netconfig *nconf)
- 		if ((strcmp(nconf->nc_netid, "local") != 0) &&
- 		    (strcmp(nconf->nc_netid, "unix") != 0)) {
- 			if ((aicode = getaddrinfo(NULL, servname, &hints, &res))!= 0) {
--			  if ((aicode = getaddrinfo(NULL, "portmapper", &hints, &res))!= 0) {
-+			  if ((aicode = getaddrinfo(NULL, "sunrpc", &hints, &res))!= 0) {
- 			  printf("cannot get local address for %s: %s",  nconf->nc_netid, gai_strerror(aicode));
- 			  syslog(LOG_ERR,
- 				    "cannot get local address for %s: %s",
diff --git a/meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch b/meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch
deleted file mode 100644
index 84fc974fdf1..00000000000
--- a/meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-musl does not provide this header and here is reasoning
-http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_sys.2Fqueue.h_not_included_.3F
-
-So include it only when __GLIBC__ is defined which is true for uclibc and glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: rpcbind-0.2.2/src/util.c
-===================================================================
---- rpcbind-0.2.2.orig/src/util.c
-+++ rpcbind-0.2.2/src/util.c
-@@ -41,7 +41,9 @@
- 
- #include <sys/types.h>
- #include <sys/socket.h>
-+#ifdef __GLIBC__
- #include <sys/queue.h>
-+#endif
- #include <net/if.h>
- #include <netinet/in.h>
- #include <ifaddrs.h>
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
index 4911fe51e83..d3ebcb3b254 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
@@ -12,18 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
-           file://remove-sys-queue.patch \
-           ${UCLIBCPATCHES} \
-           ${MUSLPATCHES} \
            file://rpcbind.conf \
            file://rpcbind.socket \
            file://rpcbind.service \
           "
-MUSLPATCHES_libc-musl = "file://musl-sunrpc.patch"
-
-UCLIBCPATCHES ?= ""
-MUSLPATCHES ?= ""
-
 SRC_URI[md5sum] = "cf10cd41ed8228fc54c316191c1f07fe"
 SRC_URI[sha256sum] = "074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66"
 
-- 
2.12.2


