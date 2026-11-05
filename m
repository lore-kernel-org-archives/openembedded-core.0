Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29111.1793863969865105276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NCXL1G6r;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=33210; q=dns/txt;
  s=iport01; t=1793863969; x=1795073569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wOTpbv3AdTP6WD1unTUmZvAqXwGHa7OAFVwPfNyOO1s=;
  b=NCXL1G6rKh0ILzE7/duqk1F5noKh7zo3cFQcVupJ7VzYzprWNB9aQZ+G
   iJRK6XXyWK6/SsvIYmIhy6GHkqOyhEFr2vTsO0+Y7CJ8VodOTdGZ+aw8y
   DpniHvr/j2ZrZNTRdSxtHNDHiaL4N/KHcC/8wEbgc3Tj1KMOPet60u1JS
   mvKnhuomqxWVGOmfKFdmvJ/9/tpp1kHLeDeSSF2NJOcBlioeGEXV645IW
   pL5AaBklRQsl1Ei8MUNp5ELAiW7N4aSiypjcIpQeeXFEiB/evKSdSuHKa
   lyVjETvHe/BNX78rIGjsKlgHQyWnNI5qN5NeJKh83xjp8SVkg4xhxrLU8
   A==;
X-CSE-ConnectionGUID: 7JlP35tCRZie8pIiNUlCNw==
X-CSE-MsgGUID: jbcpolYcS5+jls0khrF8zQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgDiL+xq/5T/Ja1aHgEBCxIMggULgld1YENJlkuBF?=
 =?us-ascii?q?p0OFIFqDwEBAQ9EDQQBAYISgnOOHwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAR0BDAsBGAEtLAECAQJaHQYhgwIBgnQDE?=
 =?us-ascii?q?bxZgXkzgQGDCh8BPwJDUNszAQsUAYE4hUCII10YAYR9JxsbgXKBFYJzdoEFg?=
 =?us-ascii?q?VwBAYEjBIZ/BIIigQyBWhgGbowMAoFShnFIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAG?=
 =?us-ascii?q?woYGA1IESw3FRkEPm4Hki+CHz0uBwEOIgw+EwEHAyFQNRsPHisQNSkUkk0TB?=
 =?us-ascii?q?wEBAQc5j12CIYE1n1wKKIN4jCSVOhozhASUGZJUC5h9glmBP4lylWkLXYRpg?=
 =?us-ascii?q?Wg8gUcLB3AVgyIJShkPjisDCwuDYIF/hkvGCyYyAgkzAQcCBw8CgXOEYYsfg?=
 =?us-ascii?q?R5gAQE?=
IronPort-Data: A9a23:ehnfRKkitrwiZ+5KJpvSvijo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXzyPPKqNNDbzeIh2Oo7n90ICuZfSnYJrTQs/pS83F1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdI6/t4sXH1lz
 84ZJWAVTxGluuad5q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIJoDaH5UPwRzwS
 mTu/W7yGhYeBdeklHmH9mn0he/Vs3PpYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:dP3wdagxkKa35ay4DKnq/m3htHBQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3Asyk0IWgIqKc8d5sJyWwSaKcBSTJuLV/Z9CyNP2S?=
 =?us-ascii?q?CO2dkGKW0SHmt/IhCjJ87?=
X-Talos-MUID: 9a23:w8e7iAjaGGCUCWtcfk/YhMMpNs1j+6OqOUs2zNYEv9LcNixqFWePtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544828272"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:32:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 8E6FF18000140;
	Thu,  5 Nov 2026 07:32:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3888ECC1611; Wed,  4 Nov 2026 23:32:48 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][master][PATCH] sudo: fix CVE-2026-82474
Date: Wed,  4 Nov 2026 23:32:45 -0800
Message-Id: <20261105073245.887852-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 07:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249453
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

The recipe enables Linux intercept support. Check execveat commands
and log subcommands instead of allowing this syscall unconditionally.
Resolve directory file descriptors and AT_EMPTY_PATH to paths for
sudoers policy checks.

Apply prerequisites [3] and [4] for proc_read_link() and fexecve paths.
Include follow-ups [5] and [6] to reject failed pathname rewrites and
correct relative-path moves. Keep the upstream source changes intact.

[1] https://github.com/sudo-project/sudo/commit/71fbe42dcd5a1c8f799540583a2dfb2ae6221edf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-82474
[3] https://github.com/sudo-project/sudo/commit/1a312af6348594df371e6088aeed99685977f575
[4] https://github.com/sudo-project/sudo/commit/e822b729da31baf9154946329a9d6ef569f0d182
[5] https://github.com/sudo-project/sudo/commit/d1121181a87b2b47b4dfbb2af42399fcc5f1e3cd
[6] https://github.com/sudo-project/sudo/commit/02b14c043825b52be6cd537b7f11bd5e7e10512e

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-82474-dependent_p1.patch   |  94 +++
 .../files/CVE-2026-82474-dependent_p2.patch   |  34 +
 .../files/CVE-2026-82474-regression_p1.patch  |  39 ++
 .../files/CVE-2026-82474-regression_p2.patch  |  33 +
 .../sudo/files/CVE-2026-82474.patch           | 617 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   5 +
 6 files changed, 822 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p1.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p2.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p1.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p2.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p1.patch b/meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p1.patch
new file mode 100644
index 00000000000..2e9d1e0a6d7
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p1.patch
@@ -0,0 +1,94 @@
+From 1a312af6348594df371e6088aeed99685977f575 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Thu, 19 Mar 2026 13:57:53 -0600
+Subject: [PATCH] get_execve_info: read /proc/self/fd/N link for pathname
+
+When fexecve(3) is used to execute a command and the kernel doesn't
+support execveat(2), glibc will use /proc/self/fd/N for the execve(2)
+pathname.  We need to resolve this link to the actual pathname used
+for intercept and log_subcmds.
+
+CVE: CVE-2026-82474
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/1a312af6348594df371e6088aeed99685977f575]
+
+(cherry picked from commit 1a312af6348594df371e6088aeed99685977f575)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/exec_ptrace.c | 31 +++++++++++++++++++++++--------
+ 1 file changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
+index e780dfd..5b901a7 100644
+--- a/src/exec_ptrace.c
++++ b/src/exec_ptrace.c
+@@ -951,9 +951,10 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
+ /*
+  * Read a link from /proc/PID and store the result in buf.
+  * Used to read the cwd and exe links in /proc/PID.
+- * Returns true on success, else false.
++ * Returns the number of bytes written to buf on success, else -1.
++ * Note: name and buf _may_ overlap.
+  */
+-static bool
++static ssize_t
+ proc_read_link(pid_t pid, const char *name, char *buf, size_t bufsize)
+ {
+     ssize_t len;
+@@ -962,14 +963,14 @@ proc_read_link(pid_t pid, const char *name, char *buf, size_t bufsize)
+ 
+     len = snprintf(path, sizeof(path), "/proc/%d/%s", (int)pid, name);
+     if (len > 0 && len < ssizeof(path)) {
+-	len = readlink(path, buf, bufsize - 1);
+-	if (len != -1) {
++	len = readlink(path, buf, bufsize);
++	if (len != -1 && (size_t)len != bufsize) {
+ 	    /* readlink(2) does not add the NUL for us. */
+ 	    buf[len] = '\0';
+-	    debug_return_bool(true);
++	    debug_return_ssize_t(len + 1);
+ 	}
+     }
+-    debug_return_bool(false);
++    debug_return_ssize_t(-1);
+ }
+ 
+ /*
+@@ -1011,6 +1012,20 @@ get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+ 		"unable to read execve pathname for process %d", (int)pid);
+ 	    goto bad;
+ 	}
++
++	/* For fexecve() the path may be in the form /proc/self/fd/N */
++	if (strncmp(argbuf, "/proc/self/fd/", 14) == 0) {
++	    const char *errstr;
++	    const char *fdstr = argbuf + 14;
++	    (void)sudo_strtonum(fdstr, 0, INT_MAX, &errstr);
++	    if (errstr == NULL) {
++		/* Rewrite argbuf with link target (if it is one). */
++		ssize_t len = proc_read_link(pid, fdstr, argbuf, bufsize);
++		if (len != -1)
++		    nread = len;
++	    }
++	}
++
+ 	/* Defer setting pathname until after all reallocations are done. */
+ 	off = (size_t)nread;
+     }
+@@ -1626,7 +1641,7 @@ ptrace_verify_post_exec(pid_t pid, struct sudo_ptrace_regs *regs,
+     }
+ 
+     /* Get the executable path. */
+-    if (!proc_read_link(pid, "exe", pathname, sizeof(pathname))) {
++    if (proc_read_link(pid, "exe", pathname, sizeof(pathname)) == -1) {
+ 	/* Missing /proc file system is not a fatal error. */
+ 	sudo_debug_printf(SUDO_DEBUG_ERROR, "%s: unable to read /proc/%d/exe",
+ 	    __func__, (int)pid);
+@@ -1768,7 +1783,7 @@ ptrace_intercept_execve(pid_t pid, struct intercept_closure *closure)
+     }
+ 
+     /* Get the current working directory and execve info. */
+-    if (!proc_read_link(pid, "cwd", cwd, sizeof(cwd)))
++    if (proc_read_link(pid, "cwd", cwd, sizeof(cwd)) == -1)
+ 	(void)strlcpy(cwd, "unknown", sizeof(cwd));
+     buf = get_execve_info(pid, &regs, &pathname, &argc, &argv,
+ 	&envc, &envp);
diff --git a/meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p2.patch b/meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p2.patch
new file mode 100644
index 00000000000..f48607a9572
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p2.patch
@@ -0,0 +1,34 @@
+From e822b729da31baf9154946329a9d6ef569f0d182 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Fri, 20 Mar 2026 05:50:47 -0600
+Subject: [PATCH] get_execve_info: pass correct name to proc_read_link()
+
+CVE: CVE-2026-82474
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/e822b729da31baf9154946329a9d6ef569f0d182]
+
+(cherry picked from commit e822b729da31baf9154946329a9d6ef569f0d182)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/exec_ptrace.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
+index 5b901a7..5b78702 100644
+--- a/src/exec_ptrace.c
++++ b/src/exec_ptrace.c
+@@ -1015,12 +1015,13 @@ get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+ 
+ 	/* For fexecve() the path may be in the form /proc/self/fd/N */
+ 	if (strncmp(argbuf, "/proc/self/fd/", 14) == 0) {
+-	    const char *errstr;
+ 	    const char *fdstr = argbuf + 14;
++	    const char *name = argbuf + 11;
++	    const char *errstr;
+ 	    (void)sudo_strtonum(fdstr, 0, INT_MAX, &errstr);
+ 	    if (errstr == NULL) {
+ 		/* Rewrite argbuf with link target (if it is one). */
+-		ssize_t len = proc_read_link(pid, fdstr, argbuf, bufsize);
++		ssize_t len = proc_read_link(pid, name, argbuf, bufsize);
+ 		if (len != -1)
+ 		    nread = len;
+ 	    }
diff --git a/meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p1.patch b/meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p1.patch
new file mode 100644
index 00000000000..84abcd65999
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p1.patch
@@ -0,0 +1,39 @@
+From d1121181a87b2b47b4dfbb2af42399fcc5f1e3cd Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Thu, 23 Apr 2026 09:39:35 -0600
+Subject: [PATCH] get_exec_info: error out if we run out of space rewriting
+ pathname
+
+Since proc_read_link() is destructive on error we could end up with
+missing NUL terminator in the rewritten pathname.
+Coverity CID 560390.
+
+CVE: CVE-2026-82474
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/d1121181a87b2b47b4dfbb2af42399fcc5f1e3cd]
+
+(cherry picked from commit d1121181a87b2b47b4dfbb2af42399fcc5f1e3cd)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/exec_ptrace.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
+index 82a5947..90d6a48 100644
+--- a/src/exec_ptrace.c
++++ b/src/exec_ptrace.c
+@@ -1120,8 +1120,13 @@ get_exec_info(pid_t pid, bool is_execveat, struct sudo_ptrace_regs *regs,
+ 	    if (errstr == NULL) {
+ 		/* Rewrite argbuf with link target (if it is one). */
+ 		ssize_t len = proc_read_link(pid, name, argbuf, bufsize);
+-		if (len != -1)
+-		    nread = len + 1;
++		if (len == -1) {
++		    sudo_debug_printf(
++			SUDO_DEBUG_ERROR|SUDO_DEBUG_LINENO|SUDO_DEBUG_ERRNO,
++			"unable to rewrite pathname for process %d", (int)pid);
++		    goto bad;
++		}
++		nread = len + 1;
+ 	    }
+ 	}
+ 
diff --git a/meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p2.patch b/meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p2.patch
new file mode 100644
index 00000000000..19a499bfef3
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p2.patch
@@ -0,0 +1,33 @@
+From 02b14c043825b52be6cd537b7f11bd5e7e10512e Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Sat, 25 Apr 2026 12:05:23 -0600
+Subject: [PATCH] Fix handling of relative paths in the execveat(2) intercept
+ support.
+
+The code to prepend the directory when fully-qualifying a relative
+path used the wrong length the memmove(3) call.
+
+Reported by and fix from Marius Momeu
+
+CVE: CVE-2026-82474
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/02b14c043825b52be6cd537b7f11bd5e7e10512e]
+
+(cherry picked from commit 02b14c043825b52be6cd537b7f11bd5e7e10512e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/exec_ptrace.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
+index 90d6a48..9521f18 100644
+--- a/src/exec_ptrace.c
++++ b/src/exec_ptrace.c
+@@ -1100,7 +1100,7 @@ get_exec_info(pid_t pid, bool is_execveat, struct sudo_ptrace_regs *regs,
+ 		    goto bad;
+ 		}
+ 		/* Prepend directory to relative pathname.  */
+-		memmove(argbuf + len + 1, argbuf, len + 1);
++		memmove(argbuf + len + 1, argbuf, nread);
+ 		memcpy(argbuf, dir, len);
+ 		argbuf[len] = '/';
+ 		nread += len + 1;
diff --git a/meta/recipes-extended/sudo/files/CVE-2026-82474.patch b/meta/recipes-extended/sudo/files/CVE-2026-82474.patch
new file mode 100644
index 00000000000..b51e73731ab
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2026-82474.patch
@@ -0,0 +1,617 @@
+From 71fbe42dcd5a1c8f799540583a2dfb2ae6221edf Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Fri, 20 Mar 2026 06:48:32 -0600
+Subject: [PATCH] Add intercept and log_subcmds support for execveat(2).
+
+Previously, sudo would always allow execveat(2) in intercept mode
+to support sudo's own use of fexecve(3) for the "fdexec" setting.
+Since sudoers is path-based, we must use /proc to resolve the file
+descriptor in execveat(2) to a path.
+
+Credit:
+ - XlabAI Team of Tencent Xuanwu Lab (xlabai@tencent.com)
+ - Atuin Automated Vulnerability Discovery Engine
+ - Guannan Wang, Zhanpeng Liu, Guancheng Li
+
+Also reported by:
+ - Nofil Qasim
+ - Quentin Chalabi
+
+CVE: CVE-2026-82474
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/71fbe42dcd5a1c8f799540583a2dfb2ae6221edf]
+
+(cherry picked from commit 71fbe42dcd5a1c8f799540583a2dfb2ae6221edf)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/exec_ptrace.c | 188 ++++++++++++++++++++++++++++++++++++----------
+ src/exec_ptrace.h |  54 ++++++++++---
+ 2 files changed, 192 insertions(+), 50 deletions(-)
+
+diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
+index 5b78702..92e8082 100644
+--- a/src/exec_ptrace.c
++++ b/src/exec_ptrace.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022 Todd C. Miller <Todd.Miller@sudo.ws>
++ * Copyright (c) 2022, 2026 Todd C. Miller <Todd.Miller@sudo.ws>
+  *
+  * Permission to use, copy, modify, and distribute this software for any
+  * purpose with or without fee is hereby granted, provided that the above
+@@ -115,7 +115,7 @@ set_syscallno(pid_t pid, struct sudo_ptrace_regs *regs, int syscallno)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg1(struct sudo_ptrace_regs *regs)
++get_sc_arg1(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     if (regs->compat) {
+ 	return compat_reg_arg1(regs->u.compat);
+@@ -135,7 +135,7 @@ set_sc_arg1(struct sudo_ptrace_regs *regs, unsigned long addr)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg2(struct sudo_ptrace_regs *regs)
++get_sc_arg2(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     if (regs->compat) {
+ 	return compat_reg_arg2(regs->u.compat);
+@@ -155,7 +155,7 @@ set_sc_arg2(struct sudo_ptrace_regs *regs, unsigned long addr)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg3(struct sudo_ptrace_regs *regs)
++get_sc_arg3(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     if (regs->compat) {
+ 	return compat_reg_arg3(regs->u.compat);
+@@ -164,7 +164,6 @@ get_sc_arg3(struct sudo_ptrace_regs *regs)
+     }
+ }
+ 
+-#  ifdef notyet
+ static inline void
+ set_sc_arg3(struct sudo_ptrace_regs *regs, unsigned long addr)
+ {
+@@ -176,7 +175,7 @@ set_sc_arg3(struct sudo_ptrace_regs *regs, unsigned long addr)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg4(struct sudo_ptrace_regs *regs)
++get_sc_arg4(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     if (regs->compat) {
+ 	return compat_reg_arg4(regs->u.compat);
+@@ -185,8 +184,9 @@ get_sc_arg4(struct sudo_ptrace_regs *regs)
+     }
+ }
+ 
++#  ifdef notyet
+ static inline void
+-set_sc_arg4(struct sudo_ptrace_regs *regs, unsigned long addr)
++set_sc_arg3(struct sudo_ptrace_regs *regs, unsigned long addr)
+ {
+     if (regs->compat) {
+ 	compat_reg_set_arg4(regs->u.compat, addr);
+@@ -196,6 +196,28 @@ set_sc_arg4(struct sudo_ptrace_regs *regs, unsigned long addr)
+ }
+ #  endif /* notyet */
+ 
++static inline unsigned long
++get_sc_arg5(pid_t pid, struct sudo_ptrace_regs *regs)
++{
++    if (regs->compat) {
++	return compat_reg_arg5(regs->u.compat);
++    } else {
++	return reg_arg5(regs->u.native);
++    }
++}
++
++#  ifdef notyet
++static inline void
++set_sc_arg5(struct sudo_ptrace_regs *regs, unsigned long addr)
++{
++    if (regs->compat) {
++	compat_reg_set_arg5(regs->u.compat, addr);
++    } else {
++	reg_set_arg5(regs->u.native, addr);
++    }
++}
++#  endif /* notyet */
++
+ # else /* SECCOMP_AUDIT_ARCH_COMPAT */
+ 
+ static inline unsigned long
+@@ -223,7 +245,7 @@ set_syscallno(pid_t pid, struct sudo_ptrace_regs *regs, int syscallno)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg1(struct sudo_ptrace_regs *regs)
++get_sc_arg1(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     return reg_arg1(regs->u.native);
+ }
+@@ -235,7 +257,7 @@ set_sc_arg1(struct sudo_ptrace_regs *regs, unsigned long addr)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg2(struct sudo_ptrace_regs *regs)
++get_sc_arg2(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     return reg_arg2(regs->u.native);
+ }
+@@ -247,12 +269,11 @@ set_sc_arg2(struct sudo_ptrace_regs *regs, unsigned long addr)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg3(struct sudo_ptrace_regs *regs)
++get_sc_arg3(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     return reg_arg3(regs->u.native);
+ }
+ 
+-#  ifdef notyet
+ static inline void
+ set_sc_arg3(struct sudo_ptrace_regs *regs, unsigned long addr)
+ {
+@@ -260,17 +281,33 @@ set_sc_arg3(struct sudo_ptrace_regs *regs, unsigned long addr)
+ }
+ 
+ static inline unsigned long
+-get_sc_arg4(struct sudo_ptrace_regs *regs)
++get_sc_arg4(pid_t pid, struct sudo_ptrace_regs *regs)
+ {
+     return reg_arg4(regs->u.native);
+ }
+ 
++#  ifdef notyet
+ static inline void
+ set_sc_arg4(struct sudo_ptrace_regs *regs, unsigned long addr)
+ {
+     reg_set_arg4(regs->u.native, addr);
+ }
+ #  endif /* notyet */
++
++static inline unsigned long
++get_sc_arg5(pid_t pid, struct sudo_ptrace_regs *regs)
++{
++    return reg_arg5(regs->u.native);
++}
++
++#  ifdef notyet
++static inline void
++set_sc_arg5(struct sudo_ptrace_regs *regs, unsigned long addr)
++{
++    reg_set_arg5(regs->u.native, addr);
++}
++#  endif /* notyet */
++
+ # endif /* SECCOMP_AUDIT_ARCH_COMPAT */
+ 
+ /*
+@@ -358,7 +395,7 @@ ptrace_readv_string(pid_t pid, unsigned long addr, char *buf, size_t bufsize)
+     const char *cp, *buf0 = buf;
+     struct iovec local, remote;
+     ssize_t nread;
+-    debug_decl(ptrace_read_string, SUDO_DEBUG_EXEC);
++    debug_decl(ptrace_readv_string, SUDO_DEBUG_EXEC);
+ 
+     /*
+      * Read the string via process_vm_readv(2) one page at a time.
+@@ -951,7 +988,8 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
+ /*
+  * Read a link from /proc/PID and store the result in buf.
+  * Used to read the cwd and exe links in /proc/PID.
+- * Returns the number of bytes written to buf on success, else -1.
++ * Returns the length of the link on success, else -1.
++ * NUL-terminates buf on success (not included in length).
+  * Note: name and buf _may_ overlap.
+  */
+ static ssize_t
+@@ -967,26 +1005,27 @@ proc_read_link(pid_t pid, const char *name, char *buf, size_t bufsize)
+ 	if (len != -1 && (size_t)len != bufsize) {
+ 	    /* readlink(2) does not add the NUL for us. */
+ 	    buf[len] = '\0';
+-	    debug_return_ssize_t(len + 1);
++	    debug_return_ssize_t(len);
+ 	}
+     }
+     debug_return_ssize_t(-1);
+ }
+ 
+ /*
+- * Read the filename, argv and envp of the execve(2) system call.
++ * Read execve(2) or execveat(2) system call arguments from pid.
+  * Returns a dynamically allocated buffer the parent is responsible for.
+  */
+ static char *
+-get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+-    int *argc_out, char ***argv_out, int *envc_out, char ***envp_out)
++get_exec_info(pid_t pid, bool is_execveat, struct sudo_ptrace_regs *regs,
++    char **pathname_out, int *argc_out, char ***argv_out, int *envc_out,
++    char ***envp_out)
+ {
+     char *argbuf, **argv, **envp, *pathname = NULL;
+     unsigned long argv_addr, envp_addr, path_addr;
+     size_t bufsize, off = 0;
+-    int i, argc, envc = 0;
++    int i, argc, dirfd = -1, flags = 0, envc = 0;
+     ssize_t nread;
+-    debug_decl(get_execve_info, SUDO_DEBUG_EXEC);
++    debug_decl(get_exec_info, SUDO_DEBUG_EXEC);
+ 
+     bufsize = PATH_MAX + arg_max;
+     argbuf = malloc(bufsize);
+@@ -995,13 +1034,22 @@ get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+ 	goto bad;
+     }
+ 
+-    /* execve(2) takes three arguments: pathname, argv, envp. */
+-    path_addr = get_sc_arg1(regs);
+-    argv_addr = get_sc_arg2(regs);
+-    envp_addr = get_sc_arg3(regs);
++    if (is_execveat) {
++	/* execveat(2) takes five arguments */
++	dirfd = get_sc_arg1(pid, regs) & 0xffffffff;
++	path_addr = get_sc_arg2(pid, regs);
++	argv_addr = get_sc_arg3(pid, regs);
++	envp_addr = get_sc_arg4(pid, regs);
++	flags = get_sc_arg5(pid, regs) & 0xffffffff;
++    } else {
++	/* execve(2) takes three arguments */
++	path_addr = get_sc_arg1(pid, regs);
++	argv_addr = get_sc_arg2(pid, regs);
++	envp_addr = get_sc_arg3(pid, regs);
++    }
+     sudo_debug_printf(SUDO_DEBUG_INFO,
+-	"%s: %d: path 0x%lx, argv 0x%lx, envp 0x%lx", __func__,
+-	(int)pid, path_addr, argv_addr, envp_addr);
++	"%s: %d: dirfd %d, path 0x%lx, argv 0x%lx, envp 0x%lx, flags: 0x%x",
++	__func__, (int)pid, dirfd, path_addr, argv_addr, envp_addr, flags);
+ 
+     /* Read the pathname, if not NULL. */
+     if (path_addr != 0) {
+@@ -1009,12 +1057,62 @@ get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+ 	if (nread == -1) {
+ 	    sudo_debug_printf(
+ 		SUDO_DEBUG_ERROR|SUDO_DEBUG_LINENO|SUDO_DEBUG_ERRNO,
+-		"unable to read execve pathname for process %d", (int)pid);
++		"unable to read execveat pathname for process %d", (int)pid);
+ 	    goto bad;
+ 	}
+ 
+-	/* For fexecve() the path may be in the form /proc/self/fd/N */
+-	if (strncmp(argbuf, "/proc/self/fd/", 14) == 0) {
++	/* Handle relative path and AT_EMPTY_PATH for execveat() */
++	if (is_execveat && argbuf[0] != '/') {
++	    if (argbuf[0] == '\0' && ISSET(flags, AT_EMPTY_PATH)) {
++		/* Used to implement fexecve(3) */
++		char name[64];
++		(void)snprintf(name, sizeof(name), "fd/%d", dirfd);
++		ssize_t len = proc_read_link(pid, name, argbuf, bufsize);
++		if (len == -1) {
++		    sudo_debug_printf(
++			SUDO_DEBUG_ERROR|SUDO_DEBUG_LINENO|SUDO_DEBUG_ERRNO,
++			"unable to read link /proc/%d/fd/%d", (int)pid, dirfd);
++		    goto bad;
++		}
++		nread = len + 1;
++	    } else {
++		/* Relative path, resolve dirfd to a path. */
++		char dir[PATH_MAX];
++		char name[64];
++
++		if (dirfd == AT_FDCWD) {
++		    (void)strlcpy(name, "cwd", sizeof(name));
++		} else {
++		    (void)snprintf(name, sizeof(name), "fd/%d", dirfd);
++		}
++		ssize_t len = proc_read_link(pid, name, dir, sizeof(dir));
++		if (len == -1) {
++		    sudo_debug_printf(
++			SUDO_DEBUG_ERROR|SUDO_DEBUG_LINENO|SUDO_DEBUG_ERRNO,
++			"unable to read link /proc/%d/%s", (int)pid, name);
++		    goto bad;
++		}
++		if ((size_t)(nread + len + 1) >= bufsize) {
++		    sudo_debug_printf(
++			SUDO_DEBUG_ERROR|SUDO_DEBUG_LINENO|SUDO_DEBUG_ERRNO,
++			"out of space storing path for process %d",
++			(int)pid);
++		    goto bad;
++		}
++		/* Prepend directory to relative pathname.  */
++		memmove(argbuf + len + 1, argbuf, len + 1);
++		memcpy(argbuf, dir, len);
++		argbuf[len] = '/';
++		nread += len + 1;
++	    }
++	}
++
++	/*
++	 * For fexecve() the path may be in the form /proc/self/fd/N
++	 * Used by glibc when the system doesn't support execveat(2).
++	 */
++	if (!ISSET(flags, AT_SYMLINK_NOFOLLOW) &&
++		strncmp(argbuf, "/proc/self/fd/", 14) == 0) {
+ 	    const char *fdstr = argbuf + 14;
+ 	    const char *name = argbuf + 11;
+ 	    const char *errstr;
+@@ -1023,7 +1121,7 @@ get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+ 		/* Rewrite argbuf with link target (if it is one). */
+ 		ssize_t len = proc_read_link(pid, name, argbuf, bufsize);
+ 		if (len != -1)
+-		    nread = len;
++		    nread = len + 1;
+ 	    }
+ 	}
+ 
+@@ -1037,7 +1135,7 @@ get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+     if (nread == -1) {
+ 	sudo_debug_printf(
+ 	    SUDO_DEBUG_ERROR|SUDO_DEBUG_LINENO|SUDO_DEBUG_ERRNO,
+-	    "unable to read execve argv for process %d", (int)pid);
++	    "unable to read argv for process %d", (int)pid);
+ 	goto bad;
+     }
+     off += (size_t)nread;
+@@ -1057,7 +1155,7 @@ get_execve_info(pid_t pid, struct sudo_ptrace_regs *regs, char **pathname_out,
+     if (nread == -1) {
+ 	sudo_debug_printf(
+ 	    SUDO_DEBUG_ERROR|SUDO_DEBUG_LINENO|SUDO_DEBUG_ERRNO,
+-	    "unable to read execve envp for process %d", (int)pid);
++	    "unable to read envp for process %d", (int)pid);
+ 	goto bad;
+     }
+ 
+@@ -1579,6 +1677,7 @@ check_argv:
+ 
+ /*
+  * Verify that the execve(2) argument we wrote match the contents of closure.
++ * TODO: test execveat(2) too.
+  * Returns true if they match, else false.
+  */
+ static bool
+@@ -1590,7 +1689,7 @@ verify_execve_args(pid_t pid, struct sudo_ptrace_regs *regs,
+     bool ret = false;
+     debug_decl(verify_execve_args, SUDO_DEBUG_EXEC);
+ 
+-    buf = get_execve_info(pid, regs, &pathname, &argc, &argv,
++    buf = get_exec_info(pid, false, regs, &pathname, &argc, &argv,
+ 	&envc, &envp);
+     if (buf != NULL) {
+ 	ret = execve_args_match(pathname, argc, argv, envc, envp, false, closure);
+@@ -1717,6 +1816,7 @@ ptrace_intercept_execve(pid_t pid, struct intercept_closure *closure)
+     bool path_mismatch = false;
+     bool argv_mismatch = false;
+     char cwd[PATH_MAX], *orig_argv0;
++    bool is_execveat = false;
+     unsigned long msg;
+     bool ret = false;
+     int i, oldcwd = -1;
+@@ -1751,8 +1851,8 @@ ptrace_intercept_execve(pid_t pid, struct intercept_closure *closure)
+ 	    /* Handled below. */
+ 	    break;
+ 	case COMPAT_execveat:
+-	    /* We don't currently check execveat(2). */
+-	    debug_return_bool(true);
++	    /* Handled below. */
++	    is_execveat = true;
+ 	    break;
+ 	default:
+ 	    sudo_warnx("%s: unexpected compat system call %d",
+@@ -1774,8 +1874,8 @@ ptrace_intercept_execve(pid_t pid, struct intercept_closure *closure)
+ 	case X32_execveat:
+ # endif
+ 	case __NR_execveat:
+-	    /* We don't currently check execveat(2). */
+-	    debug_return_bool(true);
++	    /* Handled below. */
++	    is_execveat = true;
+ 	    break;
+ 	default:
+ 	    sudo_warnx("%s: unexpected system call %d", __func__, syscallno);
+@@ -1786,7 +1886,7 @@ ptrace_intercept_execve(pid_t pid, struct intercept_closure *closure)
+     /* Get the current working directory and execve info. */
+     if (proc_read_link(pid, "cwd", cwd, sizeof(cwd)) == -1)
+ 	(void)strlcpy(cwd, "unknown", sizeof(cwd));
+-    buf = get_execve_info(pid, &regs, &pathname, &argc, &argv,
++    buf = get_exec_info(pid, is_execveat, &regs, &pathname, &argc, &argv,
+ 	&envc, &envp);
+     if (buf == NULL) {
+ 	sudo_debug_printf(SUDO_DEBUG_ERROR|SUDO_DEBUG_ERRNO,
+@@ -1910,7 +2010,11 @@ ptrace_intercept_execve(pid_t pid, struct intercept_closure *closure)
+ 
+ 	    if (argv_mismatch) {
+ 		/* Update argv address in the tracee to our new value. */
+-		set_sc_arg2(&regs, sp);
++		if (is_execveat) {
++		    set_sc_arg3(&regs, sp);
++		} else {
++		    set_sc_arg2(&regs, sp);
++		}
+ 
+ 		/* Skip over argv pointers (plus NULL) for string table. */
+ 		strtab += ((size_t)argc + 1 + regs.compat) * regs.wordsize;
+@@ -1923,7 +2027,11 @@ ptrace_intercept_execve(pid_t pid, struct intercept_closure *closure)
+ 	    }
+ 	    if (path_mismatch) {
+ 		/* Update pathname address in the tracee to our new value. */
+-		set_sc_arg1(&regs, strtab);
++		if (is_execveat) {
++		    set_sc_arg2(&regs, strtab);
++		} else {
++		    set_sc_arg1(&regs, strtab);
++		}
+ 
+ 		/* Write pathname to the string table. */
+ 		nwritten = ptrace_write_string(pid, strtab, closure->command);
+diff --git a/src/exec_ptrace.h b/src/exec_ptrace.h
+index 2da6233..6e86d65 100644
+--- a/src/exec_ptrace.h
++++ b/src/exec_ptrace.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022 Todd C. Miller <Todd.Miller@sudo.ws>
++ * Copyright (c) 2022-2026 Todd C. Miller <Todd.Miller@sudo.ws>
+  *
+  * Permission to use, copy, modify, and distribute this software for any
+  * purpose with or without fee is hereby granted, provided that the above
+@@ -87,6 +87,7 @@
+ # define reg_arg2(x)		(x).rsi
+ # define reg_arg3(x)		(x).rdx
+ # define reg_arg4(x)		(x).r10
++# define reg_arg5(x)		(x).r8
+ #elif defined(__aarch64__)
+ # define SECCOMP_AUDIT_ARCH	AUDIT_ARCH_AARCH64
+ # define sudo_pt_regs		struct user_pt_regs
+@@ -97,6 +98,7 @@
+ # define reg_arg2(x)		(x).regs[1]	/* x1 */
+ # define reg_arg3(x)		(x).regs[2]	/* x2 */
+ # define reg_arg4(x)		(x).regs[3]	/* x3 */
++# define reg_arg5(x)		(x).regs[4]	/* x4 */
+ # define reg_set_syscall(_r, _nr) do {					\
+     struct iovec _iov;							\
+     long _syscallno = (_nr);						\
+@@ -115,6 +117,7 @@
+ # define reg_arg2(x)		(x).ARM_r1
+ # define reg_arg3(x)		(x).ARM_r2
+ # define reg_arg4(x)		(x).ARM_r3
++# define reg_arg5(x)		(x).ARM_r4
+ # define reg_set_syscall(_r, _nr) do {					\
+     ptrace(PTRACE_SET_SYSCALL, pid, NULL, _nr);				\
+ } while (0)
+@@ -129,6 +132,7 @@
+ # define reg_arg2(x)		(x).gr[25]	/* r25 */
+ # define reg_arg3(x)		(x).gr[24]	/* r24 */
+ # define reg_arg4(x)		(x).gr[23]	/* r23 */
++# define reg_arg5(x)		(x).gr[22]	/* r22 */
+ #elif defined(__i386__)
+ # define SECCOMP_AUDIT_ARCH	AUDIT_ARCH_I386
+ # define sudo_pt_regs		struct user_regs_struct
+@@ -139,6 +143,7 @@
+ # define reg_arg2(x)		(x).ecx
+ # define reg_arg3(x)		(x).edx
+ # define reg_arg4(x)		(x).esi
++# define reg_arg5(x)		(x).edi
+ #elif defined(__mips__)
+ # if _MIPS_SIM == _MIPS_SIM_ABI32
+ #  /* Linux o32 style syscalls, 4000-4999. */
+@@ -204,15 +209,16 @@
+     else								\
+ 	(_r).regs[6] = _v; /* a2 */					\
+ } while (0)
+-/* XXX - reg_arg4 probably wrong for syscall() type calls on 032. */
++/*
++ * The o32 ABI uses registers a0 - a3 for the first 4 args, all others
++ * are on the stack.  We do not implement reg_set_arg4 or reg_set_arg5.
++ */
+ # define reg_arg4(x)		\
+-    ((x).regs[2] == __NR_O32_Linux ? (x).regs[8] : (x).regs[7])
+-# define reg_set_arg4(_r, _v) do {					\
+-    if ((_r).regs[2] == __NR_O32_Linux)					\
+-	(_r).regs[8] = _v; /* a4 */					\
+-    else								\
+-	(_r).regs[7] = _v; /* a3 */					\
+-} while (0)
++    ((x).regs[2] == __NR_O32_Linux ? \
++	(ptrace(PTRACE_PEEKDATA, pid, reg_sp(x) + 16, NULL)) : (x).regs[7])
++# define reg_arg5(x)		\
++    ptrace(PTRACE_PEEKDATA, pid, reg_sp(x) + \
++	((x).regs[2] == __NR_O32_Linux ? 20 : 16))
+ # define reg_set_syscall(_r, _nr) do {					\
+     if ((_r).regs[2] == __NR_O32_Linux)					\
+ 	(_r).regs[4] = _nr; /* a0 */					\
+@@ -237,6 +243,7 @@
+ # define reg_arg2(x)		(x).gpr[4]	/* r4 */
+ # define reg_arg3(x)		(x).gpr[5]	/* r5 */
+ # define reg_arg4(x)		(x).gpr[6]	/* r6 */
++# define reg_arg5(x)		(x).gpr[7]	/* r7 */
+ # define reg_set_retval(_r, _v) do {					\
+     if (((_r).trap & 0xfff0) == 0x3000) {				\
+ 	/* scv 0 system call, uses negative error code for result. */	\
+@@ -260,6 +267,7 @@
+ # define reg_arg2(x)		(x).a1
+ # define reg_arg3(x)		(x).a2
+ # define reg_arg4(x)		(x).a3
++# define reg_arg5(x)		(x).a4
+ #elif defined(__s390__)
+ /*
+  * Both the syscall number and return value are stored in r2 for
+@@ -277,7 +285,8 @@
+ # define reg_arg1(x)		(x).orig_gpr2	/* r2 */
+ # define reg_arg2(x)		(x).gprs[3]	/* r3 */
+ # define reg_arg3(x)		(x).gprs[4]	/* r4 */
+-# define reg_arg4(x)		(x).gprs[5]	/* r6 */
++# define reg_arg4(x)		(x).gprs[5]	/* r5 */
++# define reg_arg5(x)		(x).gprs[6]	/* r6 */
+ #else
+ # error "Do not know how to find your architecture's registers"
+ #endif
+@@ -322,6 +331,7 @@ struct i386_user_regs_struct {
+ # define compat_reg_arg2(x)		(x).ecx
+ # define compat_reg_arg3(x)		(x).edx
+ # define compat_reg_arg4(x)		(x).esi
++# define compat_reg_arg5(x)		(x).edi
+ #elif defined(__aarch64__)
+ struct arm_pt_regs {
+   unsigned int uregs[18];
+@@ -337,6 +347,7 @@ struct arm_pt_regs {
+ # define compat_reg_arg2(x)		(x).uregs[1]	/* r1 */
+ # define compat_reg_arg3(x)		(x).uregs[2]	/* r2 */
+ # define compat_reg_arg4(x)		(x).uregs[3]	/* r3 */
++# define compat_reg_arg5(x)		(x).uregs[4]	/* r4 */
+ # define compat_reg_set_syscall(_r, _nr) reg_set_syscall(_r, _nr)
+ #elif defined(__mips__)
+ # if _MIPS_SIM == _MIPS_SIM_ABI64
+@@ -374,6 +385,8 @@ struct arm_pt_regs {
+ # define compat_reg_set_arg3(_r, _v)	reg_set_arg3(_r, _v)
+ # define compat_reg_arg4(x)		reg_arg4(x)
+ # define compat_reg_set_arg4(_r, _v)	reg_set_arg4(_r, _v)
++# define compat_reg_arg5(x)		reg_arg5(x)
++# define compat_reg_set_arg5(_r, _v)	reg_set_arg5(_r, _v)
+ # define compat_reg_set_syscall(_r, _nr) reg_set_syscall(_r, _nr)
+ #elif defined(__powerpc64__)
+ struct ppc_pt_regs {
+@@ -407,6 +420,7 @@ struct ppc_pt_regs {
+ # define compat_reg_arg2(x)		(x).gpr[4]	/* r4 */
+ # define compat_reg_arg3(x)		(x).gpr[5]	/* r5 */
+ # define compat_reg_arg4(x)		(x).gpr[6]	/* r6 */
++# define compat_reg_arg5(x)		(x).gpr[7]	/* r7 */
+ # define compat_reg_set_retval(_r, _v)	reg_set_retval(_r, _v)
+ #endif
+ 
+@@ -475,6 +489,16 @@ struct ppc_pt_regs {
+     compat_reg_arg4(_r) = (_v);						\
+ } while (0)
+ #endif
++#ifndef reg_set_arg5
++# define reg_set_arg5(_r, _v) do {					\
++    reg_arg5(_r) = (_v);						\
++} while (0)
++#endif
++#ifndef compat_reg_set_arg5
++# define compat_reg_set_arg5(_r, _v) do {				\
++    compat_reg_arg5(_r) = (_v);						\
++} while (0)
++#endif
+ 
+ /* Set the syscall arguments the "normal" way by default. */
+ #ifndef reg_set_arg1
+@@ -517,6 +541,16 @@ struct ppc_pt_regs {
+     compat_reg_arg4(_r) = (_v);						\
+ } while (0)
+ #endif
++#ifndef reg_set_arg5
++# define reg_set_arg5(_r, _v) do {					\
++    reg_arg5(_r) = (_v);						\
++} while (0)
++#endif
++#ifndef compat_reg_set_arg5
++# define compat_reg_set_arg5(_r, _v) do {				\
++    compat_reg_arg5(_r) = (_v);						\
++} while (0)
++#endif
+ 
+ struct sudo_ptrace_regs {
+     union {
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 2b01684ee52..6e99c45f17b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -6,6 +6,11 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
 		   file://CVE-2026-35535.patch \
 		   file://0001-lib-iolog-use-accessor-for-ASN1_STRING-length.patch \
+           file://CVE-2026-82474-dependent_p1.patch \
+           file://CVE-2026-82474-dependent_p2.patch \
+           file://CVE-2026-82474.patch \
+           file://CVE-2026-82474-regression_p1.patch \
+           file://CVE-2026-82474-regression_p2.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.35.6
