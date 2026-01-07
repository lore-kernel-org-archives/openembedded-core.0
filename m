Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD5ECD5845
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3115.1767781879908022623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g8bZtXip;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781881; x=1799317881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Y8KoIDueTdiiOlEUL65ynOeTObBA+3pZWn3wCUzPBc=;
  b=g8bZtXipigxeduKbHvmRqGcEStZxjOSJiFTlvxIdbnxQE1aoyxbxEkhh
   H2Wv5WDh43Tz9lYfY+/1VFSpou97z3zLv/u/gRNOT5noXBaO+TTb7nxRr
   Z8CzFYxAQgrO7lEa5HcjwSMpEzn9i5m9Zt6nfJDXfa0D1OfRC/fLdXKx6
   Ej8foI53dEucFNIozxoQH4InlEvAhYNDkw7gXNPH8Sj0/Ac7bure4ArxX
   Nww47tHeaKfE9ehoRQXGkShFGBhcXwSk08AW0fMvJlJn8qL8uk8pWlqHU
   Xu0dcGKurO32ts77hQYusem6HeMNgSIvQtml7bHDr75SP39SyUZpKP3t8
   Q==;
X-CSE-ConnectionGUID: BAgiYHVHR/Wr62+hRyMgOQ==
X-CSE-MsgGUID: DG24234fTe+QLxZqzpUR2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="204045663"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="204045663"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 73D31C01B22
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2B4BD180A33A
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 58566101BB5E;
	Wed,  7 Jan 2026 10:31:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/15] dropbear: upgrade 2025.88 -> 2025.89
Date: Wed,  7 Jan 2026 18:30:50 +0800
Message-ID: <20260107103102.458-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228973

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-proxycmd-without-netcat.patch
removed since it's included in 2025.89

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-proxycmd-without-netcat.patch    | 74 -------------------
 ...ropbear_2025.88.bb => dropbear_2025.89.bb} |  3 +-
 2 files changed, 1 insertion(+), 76 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
 rename meta/recipes-core/dropbear/{dropbear_2025.88.bb => dropbear_2025.89.bb} (97%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
deleted file mode 100644
index 967b66322f..0000000000
--- a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 5cc0127000db5f7567b54d0495fb91a8e452fe09 Mon Sep 17 00:00:00 2001
-From: Konstantin Demin <rockdrilla@gmail.com>
-Date: Fri, 9 May 2025 22:39:35 +0300
-Subject: [PATCH] Fix proxycmd without netcat
-
-fixes e5a0ef27c2 "Execute multihop commands directly, no shell"
-
-Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
-
-Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/5cc0127000db5f7567b54d0495fb91a8e452fe09]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/cli-main.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/cli-main.c b/src/cli-main.c
-index 2fafa88..0a052a3 100644
---- a/src/cli-main.c
-+++ b/src/cli-main.c
-@@ -77,7 +77,11 @@ int main(int argc, char ** argv) {
- 	}
- 
- #if DROPBEAR_CLI_PROXYCMD
--	if (cli_opts.proxycmd || cli_opts.proxyexec) {
-+	if (cli_opts.proxycmd
-+#if DROPBEAR_CLI_MULTIHOP
-+		|| cli_opts.proxyexec
-+#endif
-+	) {
- 		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
- 		if (signal(SIGINT, kill_proxy_sighandler) == SIG_ERR ||
- 			signal(SIGTERM, kill_proxy_sighandler) == SIG_ERR ||
-@@ -110,11 +114,13 @@ static void shell_proxy_cmd(const void *user_data_cmd) {
- 	dropbear_exit("Failed to run '%s'\n", cmd);
- }
- 
-+#if DROPBEAR_CLI_MULTIHOP
- static void exec_proxy_cmd(const void *unused) {
- 	(void)unused;
- 	run_command(cli_opts.proxyexec[0], cli_opts.proxyexec, ses.maxfd);
- 	dropbear_exit("Failed to run '%s'\n", cli_opts.proxyexec[0]);
- }
-+#endif
- 
- static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- 	char * cmd_arg = NULL;
-@@ -145,9 +151,11 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- 		cmd_arg = m_malloc(shell_cmdlen);
- 		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
- 		exec_fn = shell_proxy_cmd;
-+#if DROPBEAR_CLI_MULTIHOP
- 	} else {
- 		/* No shell */
- 		exec_fn = exec_proxy_cmd;
-+#endif
- 	}
- 
- 	ret = spawn_command(exec_fn, cmd_arg, sock_out, sock_in, NULL, pid_out);
-@@ -159,6 +167,7 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- cleanup:
- 	m_free(cli_opts.proxycmd);
- 	m_free(cmd_arg);
-+#if DROPBEAR_CLI_MULTIHOP
- 	if (cli_opts.proxyexec) {
- 		char **a = NULL;
- 		for (a = cli_opts.proxyexec; *a; a++) {
-@@ -166,6 +175,7 @@ cleanup:
- 		}
- 		m_free(cli_opts.proxyexec);
- 	}
-+#endif
- }
- 
- static void kill_proxy_sighandler(int UNUSED(signo)) {
diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
similarity index 97%
rename from meta/recipes-core/dropbear/dropbear_2025.88.bb
rename to meta/recipes-core/dropbear/dropbear_2025.89.bb
index 72a886d907..957a0901fb 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -19,11 +19,10 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear@.service \
            file://dropbear.socket \
            file://dropbear.default \
-           file://0001-Fix-proxycmd-without-netcat.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"
+SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-- 
2.43.0


