Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6727C6E6B1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 09:13:49 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id w104so119717101qge.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7j49jakIm8qLgYvvdegIp00PZzwCmFK74oZ7fkXLU/c=;
	b=jc35wlAkxdqxA/L18HXhITYzo3ztTazCI5JOiXgOzFNOo3p7HX2cz+8RjMscIWY3+F
	gTlRWq0p82DfM/siVf5qwFXR62oQIcqZUUi4uxH19cffo7/5bUTMK+MjLhNzFSz2yGuu
	VyCVHIDQLgR2vABk+48xQbRyTisMoM8fpZagKSRBvpcRuC+QIybm5MvbAQQC1AFFec/n
	H+U+LQbOfCnKcvane2yT0vpJm07OIvS2EuBpzgpqVhhj/YOkw5eaH3ETggDopCmgNA6b
	5Ynmv43R4OZ+Nh8KE5OQ2xnGprcrGFIiIqN0yJWY/R9Z50ZNyvae4o3Dv8x2ZpaFQoJA
	wXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7j49jakIm8qLgYvvdegIp00PZzwCmFK74oZ7fkXLU/c=;
	b=INdSk4av0pqPBj9RXHQLSGNwXlpuKqcuireliD1Z8OpENyOJP5hIjH6rV5CghV+4iu
	sFKqHAUYA/eN7RuDu+C1hFYKsx1qYysSVpmj6DxEQZYhZVF1s9bBTfYtTsuu51nTxEtE
	Y0CIJssjxTIBEquZ4I1A48OxyU8iGH6h88XfBU5Ee5usI9HIBi+iqfJN4/Wqh2g4HmpD
	I6JCkh/bLNFrn8lpZg2u7uZgwOElFQXfickUwVVnKXUSfJsVHfewZvFVGv3rV+/kp1Ss
	ZkzkuamDCPhNp+UFMLEdEufWmJ302NA2fy03TGbTe8TkHvIg1h2lEaOhiS3mKo6ByEWh
	bSoQ==
X-Gm-Message-State: AD7BkJKUlMXHhLMPPutbIq8wNMv3vEf3B+Ai+2ta03TDYWzoy7qSXs1fkK6bp/XsHrjMcw==
X-Received: by 10.140.167.133 with SMTP id n127mr28438943qhn.73.1458378830520; 
	Sat, 19 Mar 2016 02:13:50 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id d64sm7827750qgd.9.2016.03.19.02.13.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Mar 2016 02:13:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Mar 2016 09:13:40 +0000
Message-Id: <1458378822-24897-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1458378822-24897-1-git-send-email-raj.khem@gmail.com>
References: <1458378822-24897-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH V2 2/4] world-broken: Add packages broken on musl
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
X-List-Received-Date: Sat, 19 Mar 2016 09:13:50 -0000

These 14 packages are failing aross all architectures
on musl targets.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/world-broken.inc | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index ab0c2dc..a5f6371 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -2,4 +2,48 @@
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
+EXCLUDE_FROM_WORLD_pn-lttng-tools_libc-musl = "1"
+
+# error: obstack.h: No such file or directory
+EXCLUDE_FROM_WORLD_pn-systemtap_libc-musl = "1"
+EXCLUDE_FROM_WORLD_pn-systemtap-uprobes_libc-musl = "1"
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


