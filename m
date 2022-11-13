Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1B8C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:12:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.246.1668309118273762033
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YHA3lgcr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309116; i=@fujitsu.com;
	bh=ypGNVhCCApi9qYrrFkL3Z+kPO8UJ4ViKLUVECBVbS4I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YHA3lgcrqdYoqhBlprvNrNV7uFGaKQlYh1gI2grmM0nccZ00kAw7jJcUNmgNc0rMM
	 hwmBpBBiVvgWz74K9Rdv2mA1BJmh5w4dBSUS2HAFwwtn0vrCzosUPhUjtYwDZTJxcI
	 fiG/O/YLz0U3f1cVsu0SKIqCzJqo1IFdJhfGcIiTgUlcjAaeZ3GCCOjMbZ2d2A9sXz
	 NVX0ndt9DUvVH1U18mieHqvFFvTJD93g/OSIlGE3dJw6RZ0k+6uWYaSrL+xDVGjeB8
	 nVjMdVwrrcea+bZVjWUJOuMSVYcBbB8GLReJicFiTNHZWxr8tfj8aABdj42hNXStUK
	 ZAPAZjQ+1BKSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWbc6oSD
  ZYGMbs8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjF9zzWmggeyFS3vjrA2MD6W7GLk4hASeMAo
  sbxhLSOEc4lJ4u6RZywQzh5Gifb/c5m6GDk52ASkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwFri56xLbCA2i4CqxM+2frA4r4CTxMnt+1lBbAkBBYkpD98zQ8QFJU7OfMICMUdC4u
  CLF8wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFqcWlaUW6ZrpJRV
  lpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGYkqx0r0djNOW
  /dE7xCjJwaQkypt2PT9ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv78iCZCHBotT01Iq0zBxgX
  MCkJTh4lER4K+yA0rzFBYm5xZnpEKlTjPYcU2f/28/MsRxMzvzadoCZY9O+rgPMQix5+XmpUu
  K8CfFAbQIgbRmleXBDYXF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw79pooCk8mXklcLt
  fAZ3FBHTW98g8kLNKEhFSUg1MV9/vtM+VlE+ekPXJ/dk0w7nB8uv6swMVNgurF9sf+vzvos6d
  V4JB4iVXWcTe2VrNvyo09/TNu4fUm49IMySWcr/Qf1Vo3u/Bt6etXujOrvKP3zSb72Vp6aVu1
  VX4uuMiW+sJx98hJ9ae8tWRdSpYveZYwtvIKhdhMblL+08/l9rCuTI/ef3qa+rzLRYuTCz/Vm
  J7aElJSs7Kcst//Xvc5SfxvHnZ8aIk72VI+Xy389pdj5/17UtawXxBR+3goqq0C5ozM3NDHhi
  LaJ9XOXImS+fo4QMSiVrH+1ewMVxy3/pkl1a2rrrqZ6/p75KSVb/Gl145eSj9R/xDob0vRE2r
  1G8FBn5qFOTo15a5lPRQiaU4I9FQi7moOBEAibcwVV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1668309114!23850!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19660 invoked from network); 13 Nov 2022 03:11:55 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:11:55 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BE9D0142
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:11:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B1B6073
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:11:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:11:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sudo: upgrade 1.9.12 -> 1.9.12p1
Date: Sun, 13 Nov 2022 11:11:37 +0800
Message-ID: <1668309097-15231-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173181

From: Wang Mingyu <wangmy@fujitsu.com>

mips-fix.patch
removed since it's included in 1.9.12p1

Changelog:
=========
 *Sudo's configure script now does a better job of detecting when the
 -fstack-clash-protection compiler option does not work. GitHub issue #191.
 *Fixed CVE-2022-43995, a potential out-of-bounds write for passwords smaller
  than 8 characters when passwd authentication is enabled. This does not affect
  configurations that use other authentication methods such as PAM, AIX
  authentication or BSD authentication.
 *Fixed a build error with some configurations compiling host_port.c.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sudo/files/mips-fix.patch                 | 37 -------------------
 .../sudo/{sudo_1.9.12.bb => sudo_1.9.12p1.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/mips-fix.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.12.bb => sudo_1.9.12p1.bb} (95%)

diff --git a/meta/recipes-extended/sudo/files/mips-fix.patch b/meta/recipes-extended/sudo/files/mips-fix.patch
deleted file mode 100644
index fe9c652509..0000000000
--- a/meta/recipes-extended/sudo/files/mips-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7944494196d4a9b33e0ae64a7e20f86e19c336d3 Mon Sep 17 00:00:00 2001
-From: "Todd C. Miller" <Todd.Miller@sudo.ws>
-Date: Wed, 26 Oct 2022 16:35:30 -0600
-Subject: [PATCH] Fix compilation error on Linux/mips.
-
-Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/7944494196d4a9b33e0ae64a7e20f86e19c336d3]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/exec_ptrace.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
-index 81cd10bc2..208a75f88 100644
---- a/src/exec_ptrace.c
-+++ b/src/exec_ptrace.c
-@@ -282,16 +282,17 @@ set_sc_arg4(struct sudo_ptrace_regs *regs, unsigned long addr)
- static bool
- ptrace_getregs(int pid, struct sudo_ptrace_regs *regs, int compat)
- {
-+    struct iovec iov;
-     debug_decl(ptrace_getregs, SUDO_DEBUG_EXEC);
- 
-+    iov.iov_base = &regs->u;
-+    iov.iov_len = sizeof(regs->u);
-+
- # ifdef __mips__
-     /* PTRACE_GETREGSET has bugs with the MIPS o32 ABI at least. */
--    if (ptrace(PTRACE_GETREGS, pid, NULL, &regs->u) == -1)
-+    if (ptrace(PTRACE_GETREGS, pid, NULL, iov.iov_base) == -1)
- 	debug_return_bool(false);
- # else
--    struct iovec iov;
--    iov.iov_base = &regs->u;
--    iov.iov_len = sizeof(regs->u);
-     if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov) == -1)
- 	debug_return_bool(false);
- # endif /* __mips__ */
diff --git a/meta/recipes-extended/sudo/sudo_1.9.12.bb b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
similarity index 95%
rename from meta/recipes-extended/sudo/sudo_1.9.12.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p1.bb
index 15c6728f08..1495b67b8b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.12.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
@@ -4,12 +4,11 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
-           file://mips-fix.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "de15733888170c56834daafd34bf983db10fb21039742fcfc396bd32168d6362"
+SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1


