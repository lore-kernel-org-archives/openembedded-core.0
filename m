Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7F196E64A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 07:36:51 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id s5so58411210qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 00:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c5R4hFyzro2pIr9lcjxELCMD2GpOchrcrXaEP+CqTJw=;
	b=DzvALngH6WW3ETgqknjuoTqOj7j3med1hAkx+8NJ/PmnI3PfvFzddbob7sXugIm+uv
	i+913pcB3pDDhBJ7CY/l+rTt+E2eS/UkJdIjMO6CFgANja7tBsT4VmLb+akVdUhQ8+cf
	dQKK4n5fES2T/YmSQbQ1kkbat/i6aY9F2rgZJLXCZXBmZRwr76nBpnAvSzTgY65bFbcu
	kj3wqMyrfA8Hi1XiDnQCLQ3XAOIdfHmvJo6vJKBpgZiDTqIaoaC8P3RG2fThcpXBVtaU
	EHbnxWgDJAnlDfCoaQacJlSSPX7b+XzhCGkzwrw+sJn39LRG4ScIo6rwN9bQBDIlu4X7
	uGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c5R4hFyzro2pIr9lcjxELCMD2GpOchrcrXaEP+CqTJw=;
	b=m1jGMMy9fuBR1qcmxEMrl9DG2ZWL3FswgB0zjJRE8NowBF1ia9B5ZMZL8YwTZ6cZEV
	wB8UWj8z/WkOEw46jXZ3Pm9vx2oy7CD6/Xwhu8ACaehoWo6QKpfo2hvLUAMV42X3WSda
	DDC+El8xNqO6D1vi8MpalGO2F14HOSEiAMLjMttrqY7uDTi2ME5oVmvVX/hDq+FPiL45
	L4uojcC1rARP6CO1pkVV7Ym0lJLaXeoiaGY/J9BXi6H4vcV0And/5tfXYhqmwN/VzZdP
	78SDgOhBSKvZoiQbD0KqlivcdWK1UlMdQSFnxn4MgW5VhUQFOu5j86m+HscVAYfBFTFO
	MoJg==
X-Gm-Message-State: AD7BkJK/f+ggxPYsr4ANUhNWjXNMiMehlJL7CZ63rU3fdoGVCtZeCweqeG93eUkyf7UUXA==
X-Received: by 10.55.78.11 with SMTP id c11mr27364677qkb.89.1458373011976;
	Sat, 19 Mar 2016 00:36:51 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	f128sm7693466qhf.30.2016.03.19.00.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Mar 2016 00:36:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org 
Date: Sat, 19 Mar 2016 07:36:43 +0000
Message-Id: <1458373003-13033-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1458373003-13033-1-git-send-email-raj.khem@gmail.com>
References: <1458373003-13033-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] world-broken: Add packages broken on musl
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
X-List-Received-Date: Sat, 19 Mar 2016 07:36:52 -0000

These 14 packages are failing aross all architectures
on musl targets.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/world-broken.inc | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index ab0c2dc..8c01669 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -2,4 +2,46 @@
 # Exclude known broken packages
 #
 
+# rt-tests needs PI mutex support in libc
+EXCLUDE_FROM_WORLD_pn-rt-tests_libc-musl = "1"
 
+# error: no member named 'sin_port' in 'struct sockaddr_in6'
+# this is due to libtirpc using ipv6 but portmap rpc expecting ipv4
+EXCLUDE_FROM_WORLD_pn-portmap_libc-musl = "1"
+EXCLUDE_FROM_WORLD_pn-unfs3_libc-musl = "1"
+
+# error: use of undeclared identifier '_STAT_VER'
+EXCLUDE_FROM_WORLD_pn-pseudo_libc-musl = "1"
+
+# error: Need to implement custom I/O
+EXCLUDE_FROM_WORLD_pn-libsolv_libc-musl = "1"
+
+# undefined reference to `pthread_tryjoin_np'
+EXCLUDE_FROM_WORLD_pn-btrfs-tools_libc-musl = "1"
+
+# error: error.h: No such file or directory
+EXCLUDE_FROM_WORLD_pn-prelink_libc-musl = "1"
+
+# error: use of undeclared identifier 'O_CREAT'
+EXCLUDE_FROM_WORLD_pn-libbsd_libc-musl = "1"
+
+# error: expected declaration specifiers before '__nonnull'
+EXCLUDE_FROM_WORLD_pn-lttng-ust_libc-musl = "1"
+
+# error: obstack.h: No such file or directory
+EXCLUDE_FROM_WORLD_pn-systemtap_libc-musl = "1"
+
+# error: a parameter list without types is only allowed in a function definition
+#            void (*_function)(sigval_t);
+EXCLUDE_FROM_WORLD_pn-qemu_libc-musl = "1"
+
+# glibc specific funcrions
+# error: storage size of 'mi' isn't known struct mallinfo mi
+EXCLUDE_FROM_WORLD_pn-valgrind_libc-musl = "1"
+
+# error: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Werror=format=]
+#   snprintf(buf, size, "%s", strerror_r(err, sbuf, sizeof(sbuf)));
+EXCLUDE_FROM_WORLD_pn-perf_libc-musl = "1"
+
+# error: 'RTLD_NEXT' was not declared in this scope
+EXCLUDE_FROM_WORLD_pn-gcc-sanitizers_libc-musl = "1"
-- 
1.8.3.1


