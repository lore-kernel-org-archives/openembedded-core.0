Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2362C73D46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 00:47:30 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id i5so6649977pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kWykT1FG3ZRvBgAUG58wPW5g1Rl0rJbZrCA4e5kmekg=;
	b=Aa9DkFWD26NoWIHZzC+BVQLWlfmxNoFU2Cr0I6stnnkYW6AEpwHZrejay/0HMFW/E/
	op6TQZH792GZkcfmtxYLPtoV4rqpVnYeTBVEVg9CiAnMA1nyeSigFD9r0gWLpMlGOvRY
	qISL2TuV1XMqcNxDcyLdNh9+quIedDO3isYARHTN4na7k1NxPLxKd45a0Nnpgx6uVo6O
	YCKy/Jo8x5/FyA6hS06a78sFdyeNtlrv1cItVowyYrCehROO3eCRzyFKs86bCSsrd1QE
	saJ2zLqeuenF4eXopKi906Kb02jf+0cXtLiVhmULOCopnrngqlYn9y+5Mci5dS2Kb4JG
	1AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kWykT1FG3ZRvBgAUG58wPW5g1Rl0rJbZrCA4e5kmekg=;
	b=btcXk3M/vjTQzph5rRB9XQ5sJixOw73czR9SrQ05ej2oerc4E30jFgk0/VLNLnsoHQ
	KsLD0/GsD87Z9NRJ2yyXIQdZgmR+CKxfNi7rkZvkxfIQI4pePkLivdprHZ+5FTb8c4vd
	bUg8prbRSdzpKo/31lK6HmsShRDunzZ5bgYExYmZTw2y90RYvYueDMVVBxeqURF0iOoN
	M38xXDZ7ehfKGWmPHm0emtUvn0MtqVm+ZgqtcIM7j/+27ofLUDJwvEGebbWWYaKDUW+4
	22PO2j6zeV5Uwlt4VXDXZAK1llEAuhW5U7wfyX1dia6o5WI7G8IhYZy8mRLghJMY53MU
	ATTg==
X-Gm-Message-State: AOPr4FVTSNhx+IrVsuLgK8DPqfy9Pa1Uc3tYTjJU5bUsGDKxZyvyISXexu92laKXxyGMZw==
X-Received: by 10.66.65.109 with SMTP id w13mr16180058pas.142.1461804451745;
	Wed, 27 Apr 2016 17:47:31 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id m12sm9636649pfi.5.2016.04.27.17.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 17:47:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 17:47:23 -0700
Message-Id: <1461804443-13094-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1461804443-13094-1-git-send-email-akuster808@gmail.com>
References: <1461804443-13094-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][PATCH 4/4] busybox: musl mips64 ip fix
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
X-List-Received-Date: Thu, 28 Apr 2016 00:47:31 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...lem_on_mips64_n64_big_endian_musl_systems.patch | 90 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch

diff --git a/meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch b/meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
new file mode 100644
index 0000000..41c5656
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
@@ -0,0 +1,90 @@
+From 4ab372d49a6e82b0bf097dedb96d26330c5f2d5f Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Sun, 24 Apr 2016 17:39:02 +0200
+Subject: [PATCH] ip: fix problem on mips64 n64 big endian musl systems
+
+Use designated initializers for struct msghdr.
+The struct layout is non-portable and musl libc does not match what busybox expects.
+
+Signed-off-by: Szabolcs Nagy <nsz@port70.net>
+Tested-by: Waldemar Brodkorb <wbx@openadk.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+
+https://git.busybox.net/busybox/commit/?id=4ab372d49a6e82b0bf097dedb96d26330c5f2d5f
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ networking/libiproute/libnetlink.c | 37 ++++++++++++++++++++++++-------------
+ 1 file changed, 24 insertions(+), 13 deletions(-)
+
+diff --git a/networking/libiproute/libnetlink.c b/networking/libiproute/libnetlink.c
+index c7533a4..cbb5daf 100644
+--- a/networking/libiproute/libnetlink.c
++++ b/networking/libiproute/libnetlink.c
+@@ -71,11 +71,15 @@ int FAST_FUNC rtnl_dump_request(struct rtnl_handle *rth, int type, void *req, in
+ 	struct nlmsghdr nlh;
+ 	struct sockaddr_nl nladdr;
+ 	struct iovec iov[2] = { { &nlh, sizeof(nlh) }, { req, len } };
++	/* Use designated initializers, struct layout is non-portable */
+ 	struct msghdr msg = {
+-		(void*)&nladdr, sizeof(nladdr),
+-		iov,  2,
+-		NULL, 0,
+-		0
++		.msg_name = (void*)&nladdr,
++		.msg_namelen = sizeof(nladdr),
++		.msg_iov = iov,
++		.msg_iovlen = 2,
++		.msg_control = NULL,
++		.msg_controllen = 0,
++		.msg_flags = 0
+ 	};
+ 
+ 	memset(&nladdr, 0, sizeof(nladdr));
+@@ -104,12 +108,15 @@ static int rtnl_dump_filter(struct rtnl_handle *rth,
+ 	while (1) {
+ 		int status;
+ 		struct nlmsghdr *h;
+-
++		/* Use designated initializers, struct layout is non-portable */
+ 		struct msghdr msg = {
+-			(void*)&nladdr, sizeof(nladdr),
+-			&iov, 1,
+-			NULL, 0,
+-			0
++			.msg_name = (void*)&nladdr,
++			.msg_namelen = sizeof(nladdr),
++			.msg_iov = &iov,
++			.msg_iovlen = 1,
++			.msg_control = NULL,
++			.msg_controllen = 0,
++			.msg_flags = 0
+ 		};
+ 
+ 		status = recvmsg(rth->fd, &msg, 0);
+@@ -211,11 +218,15 @@ int FAST_FUNC rtnl_talk(struct rtnl_handle *rtnl, struct nlmsghdr *n,
+ 	struct sockaddr_nl nladdr;
+ 	struct iovec iov = { (void*)n, n->nlmsg_len };
+ 	char   *buf = xmalloc(8*1024); /* avoid big stack buffer */
++	/* Use designated initializers, struct layout is non-portable */
+ 	struct msghdr msg = {
+-		(void*)&nladdr, sizeof(nladdr),
+-		&iov, 1,
+-		NULL, 0,
+-		0
++		.msg_name = (void*)&nladdr,
++		.msg_namelen = sizeof(nladdr),
++		.msg_iov = &iov,
++		.msg_iovlen = 1,
++		.msg_control = NULL,
++		.msg_controllen = 0,
++		.msg_flags = 0
+ 	};
+ 
+ 	memset(&nladdr, 0, sizeof(nladdr));
+-- 
+2.3.5
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 82fc64f..d3dc2a2 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2016-2148.patch \
            file://CVE-2016-2147.patch \
            file://CVE-2016-2147_2.patch \
+           file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.3.5


