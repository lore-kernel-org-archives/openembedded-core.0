Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCA9C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 22:23:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10026.1669242197401503642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 14:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QbCL1xjf;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id x5so27465435wrt.7
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmmmZzmEhKy8qiAblU9DhThRgo9bNQTIOu1d6JKH4GA=;
        b=QbCL1xjfVFfNX8XJdg9gQUo88stPeS1Ju0fh2AQfrOzmXiDgJx5ozwwQ+DYimTQUPS
         s4Bb7QMCnqeoSvwhmQXRspzCGNlr8VkcFaAR3MPJ5+LHMOOET2qWqqLzgqpRS/bkQmpE
         57fO5VZzNOrfnsYrbDg3Zt+yw2ypilEz6kzsKWM5jVRDfPkXeCkeERQSoJyLF7hAN8O7
         KB9t0ko/wYno2uKd1e2Os535gXx/jGQpQ9uCD3UMEpgdpKWsHNk0CJ/QppZeC1kW6mnO
         RbkNGgfK55YYyXy8ismPJAX+ygoh+0f0HBvGA8DgVhPk4ztf0LDCcMkN9z3uBdfjRWKZ
         4+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmmmZzmEhKy8qiAblU9DhThRgo9bNQTIOu1d6JKH4GA=;
        b=Qbtie6Q9ms2jc6wOOMxw0lUiER2Rd5rQeEpy0rbQAC1QKudH8MA6i61sMiDIab15OQ
         GdAxSpvXZaUcy628FObaQCCPsL2caQ6ZNuV810Y3KIc9pkO6zRzrdfwxhtqS0LT/TtOM
         2DYSb1QzqM/lTAkCZjxOanqhmvycfu8iYd3HT4qodvAgCCXmw2itXytktV0wuBnQaRrn
         sHIfU3jWOmxEsz9i0Qjc6iMWRarcYqj2pxz3CH8+YFgqM1OUlv3jMnf5jjVFQqyIZZ9J
         EV/rTY6bm2rNlZPuSaJO3rNut6UcaVTHT7iX8DTs1GapA98iylGJ4XxdfSXT2e4T+bFs
         dQyQ==
X-Gm-Message-State: ANoB5plHqynvyOP423en8WjZXQkMYe7kiHpfGRJd3UZx2w0G/Z50aAlU
	zS1sZUe/wOQCS/olfJ0bF0EH4vsT1go=
X-Google-Smtp-Source: AA0mqf5sIzDXJYtj6uvKKBLbVYAad8qur+O7Lom000/WchY7qQ0cIVabhHP9jo2eZIcBUnV75CECjA==
X-Received: by 2002:adf:e3c3:0:b0:241:ccd8:f0f7 with SMTP id k3-20020adfe3c3000000b00241ccd8f0f7mr12771515wrm.393.1669242195524;
        Wed, 23 Nov 2022 14:23:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003c70191f267sm4087304wmp.39.2022.11.23.14.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 14:23:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] unfs: update 0.9.22 -> 0.10.0
Date: Wed, 23 Nov 2022 23:23:09 +0100
Message-Id: <20221123222309.2075813-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123222309.2075813-1-alex@linutronix.de>
References: <20221123222309.2075813-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 22:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173731

This is the first release in 13 years;
I have reviewed the accumulated patches, and dropped some of them
where purpose or issue being fixed is not clear. Specifically:

0001-Add-listen-action-for-a-tcp-socket.patch
0001-daemon.c-Libtirpc-porting-fixes.patch
fixed upstream in
https://github.com/unfs3/unfs3/commit/84ab475f93c0af437ece21770617603c508dee8c

0001-attr-fix-utime-for-symlink.patch
addresses an open issue in
https://github.com/unfs3/unfs3/issues/4
please rebase and re-submit as a PR if the problem is still present.

alternate_rpc_ports.patch
unnecessary as of
https://git.yoctoproject.org/poky/commit/?id=6bb9860ef7ba9c84fe9bd3a81aa6555f67ebd38e
Command line options introduced by the patch no longer used anywhere.

fix_compile_warning.patch
merged upstream.

fix_pid_race_parent_writes_child_pid.patch
rebased and re-submitted upstream.

no-yywrap.patch
dropped as backport.

relative_max_socket_path_len.patch
needs to be re-submitted by the original author, purpose and reproducer scenario unclear.

rename_fh_cache.patch
merged upstream.

tcp_no_delay.patch
purpose and use case for oe unclear.

unfs3_parallel_build.patch
fixed upstream in
https://github.com/unfs3/unfs3/commit/987d32ca12222aeb48d46b4e1c9d39bab38ad431
https://github.com/unfs3/unfs3/commit/a39a78995ca8c6f8dd22da93dd60b4a1f8d32728

Drop -N option from oeqa nfs helper and runqemu helper;
the option was provided by tcp_no_delay.patch
and is not needed for the tests or qemu.

Drop ad hoc libtirpc support; upstream supports it directly now.

Drop the check for portmap/rpcbind, it is unnecessary as of
https://git.yoctoproject.org/poky/commit/?id=6bb9860ef7ba9c84fe9bd3a81aa6555f67ebd38e

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/utils/nfs.py                    |   2 +-
 ...1-Add-listen-action-for-a-tcp-socket.patch |  54 ------
 .../0001-attr-fix-utime-for-symlink.patch     |  85 ----------
 ...-window-for-writing-of-the-pid-file.patch} |  25 ++-
 ...0001-daemon.c-Libtirpc-porting-fixes.patch |  37 ----
 .../unfs3/unfs3/alternate_rpc_ports.patch     | 158 ------------------
 .../unfs3/unfs3/fix_compile_warning.patch     |  25 ---
 .../unfs3/unfs3/no-yywrap.patch               |  14 --
 .../unfs3/relative_max_socket_path_len.patch  |  74 --------
 .../unfs3/unfs3/rename_fh_cache.patch         |  64 -------
 .../unfs3/unfs3/tcp_no_delay.patch            |  56 -------
 .../unfs3/unfs3/unfs3_parallel_build.patch    |  37 ----
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  27 +--
 scripts/runqemu-export-rootfs                 |  17 +-
 14 files changed, 22 insertions(+), 653 deletions(-)
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
 rename meta/recipes-devtools/unfs3/unfs3/{fix_pid_race_parent_writes_child_pid.patch => 0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch} (64%)
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch

diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index c1218656ce..b66ed42a58 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -30,7 +30,7 @@ def unfs_server(directory, logger = None):
 
         nenv = dict(os.environ)
         nenv['PATH'] = "{0}/sbin:{0}/usr/sbin:{0}/usr/bin:".format(unfs_sysroot) + nenv.get('PATH', '')
-        cmd = Command(["unfsd", "-d", "-p", "-N", "-e", exports.name, "-n", str(nfsport), "-m", str(mountport)],
+        cmd = Command(["unfsd", "-d", "-p", "-e", exports.name, "-n", str(nfsport), "-m", str(mountport)],
                 bg = True, env = nenv, output_log = logger)
         cmd.run()
         yield nfsport, mountport
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch b/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
deleted file mode 100644
index e9b9d3df46..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From b42ab8e1aca951dd06c113159491b3fd5cf06f2e Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Thu, 24 Oct 2019 09:39:04 +0800
-Subject: [PATCH] Add "listen" action for a tcp socket which does not call
- 'listen' after 'bind'
-
-It is found that /usr/bin/unfsd customus 100% cpu after starting qemu with 'nfs'
-option, and below lots of error messages shows when strace the process:
-
-poll([{fd=3, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=4, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},
-{fd=5, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=6, events =POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND}],
-4, 2000) = 2 ([{fd=4, revents=POLLHUP},{fd=6, revents=POLLHUP}])
-accept(4, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
-accept(6, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
-
-% time     seconds  usecs/call     calls    errors syscall
------- ----------- ----------- --------- --------- ----------------
- 70.87    0.005392           0    513886    513886 accept
- 29.13    0.002216           0    256943           poll
-  0.00    0.000000           0         4           read
-
-The root cause is that 'listen' is not called for the binded
-socket. The depended libtipc does not call 'listen' if found
-the incomming socket is binded, so 'accept' reports the error
-in the 'for' loop and cpu consumed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
----
- daemon.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/daemon.c b/daemon.c
-index 028a181..4c85903 100644
---- a/daemon.c
-+++ b/daemon.c
-@@ -814,6 +814,13 @@ static SVCXPRT *create_tcp_transport(unsigned int port)
- 	    fprintf(stderr, "Couldn't bind to tcp port %d\n", port);
- 	    exit(1);
- 	}
-+
-+	if (listen(sock, SOMAXCONN) < 0) {
-+	    perror("listen");
-+	    fprintf(stderr, "Couldn't listen on the address \n");
-+	    close(sock);
-+	    exit(1);
-+	}
-     }
- 
-     transp = svctcp_create(sock, 0, 0);
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
deleted file mode 100644
index 6957d102b8..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 3f4fcb62661059bad77a2e957b4621137797bc2f Mon Sep 17 00:00:00 2001
-From: Rui Wang <rui.wang@windriver.com>
-Date: Fri, 15 Jun 2018 14:19:10 +0800
-Subject: [PATCH] attr: fix utime for symlink
-
-unfs3 has an old defect that it can not change the timestamps of a
-symlink file because it only uses utime(), which will follow the
-symlink. This will not cause an error if the symlink points to an
-existent file. But under some special situation, such as installing
-a rpm package, rpm tool will create the symlink first and try to
-modify the timestamps of it, when the target file is non-existent.
-This will cause an ESTALE error. Making rpm tool ignore this error
-is a solution, but not the best one. An acceptable approach is
-Making unfs3 support lutimes(), which can modify the symlink file
-itself. Considering not every system support this function, so a
-function checking is necessary.
-
-Upstream-Status: Submitted [https://sourceforge.net/p/unfs3/bugs/12/]
-
-Signed-off-by: Rui Wang <rui.wang@windriver.com>
----
- attr.c         | 15 +++++++++++----
- backend_unix.h |  2 ++
- configure.ac   |  1 +
- 3 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/attr.c b/attr.c
-index 73e5c75..427d0e2 100644
---- a/attr.c
-+++ b/attr.c
-@@ -280,7 +280,7 @@ post_op_attr get_post_cached(struct svc_req * req)
- static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
- {
-     time_t new_atime, new_mtime;
--    struct utimbuf utim;
-+    struct timeval stamps[2];
-     int res;
-
-     /* set atime and mtime */
-@@ -302,10 +302,17 @@ static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
-	else			       /* DONT_CHANGE */
-	    new_mtime = buf.st_mtime;
-
--	utim.actime = new_atime;
--	utim.modtime = new_mtime;
-+	stamps[0].tv_sec = new_atime;
-+	stamps[0].tv_usec = 0;
-+	stamps[1].tv_sec = new_mtime;
-+	stamps[1].tv_usec = 0;
-+
-+#if HAVE_LUTIMES
-+	res = backend_lutimes(path, stamps);
-+#else
-+	res = backend_utimes(path, stamps);
-+#endif
-
--	res = backend_utime(path, &utim);
-	if (res == -1)
-	    return setattr_err();
-     }
-diff --git a/backend_unix.h b/backend_unix.h
-index fbc2af3..813ffd3 100644
---- a/backend_unix.h
-+++ b/backend_unix.h
-@@ -61,6 +61,8 @@
- #define backend_symlink symlink
- #define backend_truncate truncate
- #define backend_utime utime
-+#define backend_utimes utimes
-+#define backend_lutimes lutimes
- #define backend_statstruct struct stat
- #define backend_dirstream DIR
- #define backend_statvfsstruct struct statvfs
-diff --git a/configure.ac b/configure.ac
-index aeec598..ea7f167 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -37,6 +37,7 @@ AC_CHECK_FUNCS(setresuid setresgid)
- AC_CHECK_FUNCS(vsyslog)
- AC_CHECK_FUNCS(lchown)
- AC_CHECK_FUNCS(setgroups)
-+AC_CHECK_FUNCS(lutimes)
- UNFS3_SOLARIS_RPC
- UNFS3_PORTMAP_DEFINE
- UNFS3_COMPILE_WARNINGS
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch
similarity index 64%
rename from meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
rename to meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch
index 46b187e5f3..20bbee90a0 100644
--- a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch
@@ -1,4 +1,7 @@
-daemon.c: Fix race window for writing of the pid file
+From 212a947e776e7a25c1f2259615f461179bcb3663 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 23 Nov 2022 21:38:38 +0100
+Subject: [PATCH] daemon.c: Fix race window for writing of the pid file
 
 The parent process should write the pid file such that the pid file
 will can be checked immediately following exit of the fork from the
@@ -8,17 +11,18 @@ This allows external monitoring applications to watch the daemon
 without having to add sleep calls to wait for the pid file be written
 on a busy system.
 
+Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/28]
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
- daemon.c |   12 +++++++++---
+ daemon.c | 12 +++++++++---
  1 file changed, 9 insertions(+), 3 deletions(-)
 
+diff --git a/daemon.c b/daemon.c
+index ff53b7a..13b06a4 100644
 --- a/daemon.c
 +++ b/daemon.c
-@@ -153,7 +153,7 @@ int get_socket_type(struct svc_req *rqst
+@@ -166,7 +166,7 @@ int get_socket_type(struct svc_req *rqstp)
  /*
   * write current pid to a file
   */
@@ -27,7 +31,7 @@ Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
  {
      char buf[16];
      int fd, res, len;
-@@ -175,7 +175,7 @@ static void create_pid_file(void)
+@@ -188,7 +188,7 @@ static void create_pid_file(void)
      }
  #endif
  
@@ -36,7 +40,7 @@ Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
      len = strlen(buf);
  
      res = backend_pwrite(fd, buf, len, 0);
-@@ -970,6 +970,10 @@ int main(int argc, char **argv)
+@@ -1122,6 +1122,10 @@ int main(int argc, char **argv)
  	    fprintf(stderr, "could not fork into background\n");
  	    daemon_exit(0);
  	}
@@ -47,7 +51,7 @@ Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
      }
  #endif				       /* WIN32 */
  
-@@ -1006,8 +1010,10 @@ int main(int argc, char **argv)
+@@ -1161,8 +1165,10 @@ int main(int argc, char **argv)
  	/* no umask to not screw up create modes */
  	umask(0);
  
@@ -59,3 +63,6 @@ Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
  
  	/* initialize internal stuff */
  	fh_cache_init();
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
deleted file mode 100644
index 6eee6748f9..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c7a2a65d6c2a433312540c207860740d6e4e7629 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 11 Mar 2018 17:32:54 -0700
-Subject: [PATCH] daemon.c: Libtirpc porting fixes
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- daemon.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/daemon.c b/daemon.c
-index 22f30f6..028a181 100644
---- a/daemon.c
-+++ b/daemon.c
-@@ -117,7 +117,7 @@ void logmsg(int prio, const char *fmt, ...)
-  */
- struct in_addr get_remote(struct svc_req *rqstp)
- {
--    return (svc_getcaller(rqstp->rq_xprt))->sin_addr;
-+    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_addr;
- }
- 
- /*
-@@ -125,7 +125,7 @@ struct in_addr get_remote(struct svc_req *rqstp)
-  */
- short get_port(struct svc_req *rqstp)
- {
--    return (svc_getcaller(rqstp->rq_xprt))->sin_port;
-+    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_port;
- }
- 
- /*
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
deleted file mode 100644
index ff745d4774..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-Add ability to specify rcp port numbers
-
-In order to run more than one unfs server on a host system, you must
-be able to specify alternate rpc port numbers.
-
-Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
----
- daemon.c |   44 +++++++++++++++++++++++++++++++-------------
- mount.c  |    4 ++--
- 2 files changed, 33 insertions(+), 15 deletions(-)
-
---- a/daemon.c
-+++ b/daemon.c
-@@ -78,6 +78,8 @@ int opt_testconfig = FALSE;
- struct in_addr opt_bind_addr;
- int opt_readable_executables = FALSE;
- char *opt_pid_file = NULL;
-+int nfs_prog = NFS3_PROGRAM;
-+int mount_prog = MOUNTPROG;
- 
- /* Register with portmapper? */
- int opt_portmapper = TRUE;
-@@ -206,7 +208,7 @@ static void parse_options(int argc, char
- {
- 
-     int opt = 0;
--    char *optstring = "bcC:de:hl:m:n:prstTuwi:";
-+    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
- 
-     while (opt != -1) {
- 	opt = getopt(argc, argv, optstring);
-@@ -261,8 +263,24 @@ static void parse_options(int argc, char
- 		printf
- 		    ("\t-r          report unreadable executables as readable\n");
- 		printf("\t-T          test exports file and exit\n");
-+		printf("\t-x <port>   alternate NFS RPC port\n");
-+		printf("\t-y <port>   alternate MOUNTD RPC port\n");
- 		exit(0);
- 		break;
-+	    case 'x':
-+		nfs_prog = strtol(optarg, NULL, 10);
-+		if (nfs_prog == 0) {
-+		    fprintf(stderr, "Invalid NFS RPC port\n");
-+		    exit(1);
-+		}
-+		break;
-+	    case 'y':
-+		mount_prog = strtol(optarg, NULL, 10);
-+		if (mount_prog == 0) {
-+		    fprintf(stderr, "Invalid MOUNTD RPC port\n");
-+		    exit(1);
-+		}
-+		break;
- 	    case 'l':
- 		opt_bind_addr.s_addr = inet_addr(optarg);
- 		if (opt_bind_addr.s_addr == (unsigned) -1) {
-@@ -347,12 +365,12 @@ void daemon_exit(int error)
- #endif				       /* WIN32 */
- 
-     if (opt_portmapper) {
--	svc_unregister(MOUNTPROG, MOUNTVERS1);
--	svc_unregister(MOUNTPROG, MOUNTVERS3);
-+	svc_unregister(mount_prog, MOUNTVERS1);
-+	svc_unregister(mount_prog, MOUNTVERS3);
-     }
- 
-     if (opt_portmapper) {
--	svc_unregister(NFS3_PROGRAM, NFS_V3);
-+	svc_unregister(nfs_prog, NFS_V3);
-     }
- 
-     if (error == SIGSEGV)
-@@ -657,13 +675,13 @@ static void mountprog_3(struct svc_req *
- static void register_nfs_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
- {
-     if (opt_portmapper) {
--	pmap_unset(NFS3_PROGRAM, NFS_V3);
-+	pmap_unset(nfs_prog, NFS_V3);
-     }
- 
-     if (udptransp != NULL) {
- 	/* Register NFS service for UDP */
- 	if (!svc_register
--	    (udptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
-+	    (udptransp, nfs_prog, NFS_V3, nfs3_program_3,
- 	     opt_portmapper ? IPPROTO_UDP : 0)) {
- 	    fprintf(stderr, "%s\n",
- 		    "unable to register (NFS3_PROGRAM, NFS_V3, udp).");
-@@ -674,7 +692,7 @@ static void register_nfs_service(SVCXPRT
-     if (tcptransp != NULL) {
- 	/* Register NFS service for TCP */
- 	if (!svc_register
--	    (tcptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
-+	    (tcptransp, nfs_prog, NFS_V3, nfs3_program_3,
- 	     opt_portmapper ? IPPROTO_TCP : 0)) {
- 	    fprintf(stderr, "%s\n",
- 		    "unable to register (NFS3_PROGRAM, NFS_V3, tcp).");
-@@ -686,14 +704,14 @@ static void register_nfs_service(SVCXPRT
- static void register_mount_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
- {
-     if (opt_portmapper) {
--	pmap_unset(MOUNTPROG, MOUNTVERS1);
--	pmap_unset(MOUNTPROG, MOUNTVERS3);
-+	pmap_unset(mount_prog, MOUNTVERS1);
-+	pmap_unset(mount_prog, MOUNTVERS3);
-     }
- 
-     if (udptransp != NULL) {
- 	/* Register MOUNT service (v1) for UDP */
- 	if (!svc_register
--	    (udptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
-+	    (udptransp, mount_prog, MOUNTVERS1, mountprog_3,
- 	     opt_portmapper ? IPPROTO_UDP : 0)) {
- 	    fprintf(stderr, "%s\n",
- 		    "unable to register (MOUNTPROG, MOUNTVERS1, udp).");
-@@ -702,7 +720,7 @@ static void register_mount_service(SVCXP
- 
- 	/* Register MOUNT service (v3) for UDP */
- 	if (!svc_register
--	    (udptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
-+	    (udptransp, mount_prog, MOUNTVERS3, mountprog_3,
- 	     opt_portmapper ? IPPROTO_UDP : 0)) {
- 	    fprintf(stderr, "%s\n",
- 		    "unable to register (MOUNTPROG, MOUNTVERS3, udp).");
-@@ -713,7 +731,7 @@ static void register_mount_service(SVCXP
-     if (tcptransp != NULL) {
- 	/* Register MOUNT service (v1) for TCP */
- 	if (!svc_register
--	    (tcptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
-+	    (tcptransp, mount_prog, MOUNTVERS1, mountprog_3,
- 	     opt_portmapper ? IPPROTO_TCP : 0)) {
- 	    fprintf(stderr, "%s\n",
- 		    "unable to register (MOUNTPROG, MOUNTVERS1, tcp).");
-@@ -722,7 +740,7 @@ static void register_mount_service(SVCXP
- 
- 	/* Register MOUNT service (v3) for TCP */
- 	if (!svc_register
--	    (tcptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
-+	    (tcptransp, mount_prog, MOUNTVERS3, mountprog_3,
- 	     opt_portmapper ? IPPROTO_TCP : 0)) {
- 	    fprintf(stderr, "%s\n",
- 		    "unable to register (MOUNTPROG, MOUNTVERS3, tcp).");
---- a/mount.c
-+++ b/mount.c
-@@ -155,8 +155,8 @@ mountres3 *mountproc_mnt_3_svc(dirpath *
-     /* error out if not version 3 */
-     if (rqstp->rq_vers != 3) {
- 	logmsg(LOG_INFO,
--	       "%s attempted mount with unsupported protocol version",
--	       inet_ntoa(get_remote(rqstp)));
-+	       "%s attempted mount with unsupported protocol version: %i",
-+	       inet_ntoa(get_remote(rqstp)), rqstp->rq_vers);
- 	result.fhs_status = MNT3ERR_INVAL;
- 	return &result;
-     }
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
deleted file mode 100644
index aada014117..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-daemon.c: Check exit code of chdir()
-
-Stop the compile warning and fix the code to act on a chdir() failure.
-If this one does fail something is very, very wrong.
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
----
- daemon.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/daemon.c
-+++ b/daemon.c
-@@ -964,7 +964,8 @@ int main(int argc, char **argv)
- 	sigaction(SIGALRM, &act, NULL);
- 
- 	/* don't make directory we started in busy */
--	chdir("/");
-+	if(chdir("/") < 0)
-+	    daemon_exit(0);
- 
- 	/* detach from terminal */
- 	if (opt_detach) {
diff --git a/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch b/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
deleted file mode 100644
index e3496814d8..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport [https://github.com/unfs3/unfs3/commit/3fa0568e6ef96e045286afe18444bc28fe93962b]
-
-diff --git a/Config/exports.l b/Config/exports.l
-index 662603c..7e7c4fc 100644
---- a/Config/exports.l
-+++ b/Config/exports.l
-@@ -50,6 +50,7 @@ OLDNET {IP}"/"{IP}
- 
- %option nounput
- %option noinput
-+%option noyywrap
- 
- %%
- 
diff --git a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
deleted file mode 100644
index 219dd35aec..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-nfs.c: Allow max sa.sun_path for a localdomain socket with the user nfs-server
-
-There is a hard limit for the kernel of 108 characters for a
-localdomain socket name.  To avoid problems with the user nfs
-server it should maximize the number of characters by using
-a relative path on the server side.
-
-Previously the nfs-server used the absolute path name passed to
-the sa.sunpath arg for binding the socket and this has caused
-problems for both the X server and UST binaries which make
-heavy use of named sockets with long names.
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
----
- nfs.c |   29 +++++++++++++++++++++++++++--
- 1 file changed, 27 insertions(+), 2 deletions(-)
-
---- a/nfs.c
-+++ b/nfs.c
-@@ -672,6 +672,7 @@ SYMLINK3res *nfsproc3_symlink_3_svc(SYML
- }
- 
- #ifndef WIN32
-+static char pathbuf_tmp[NFS_MAXPATHLEN + NFS_MAXNAMLEN + 1];
- 
- /*
-  * create Unix socket
-@@ -680,17 +681,41 @@ static int mksocket(const char *path, mo
- {
-     int res, sock;
-     struct sockaddr_un addr;
-+    unsigned int len = strlen(path);
- 
-     sock = socket(PF_UNIX, SOCK_STREAM, 0);
--    addr.sun_family = AF_UNIX;
--    strcpy(addr.sun_path, path);
-     res = sock;
-     if (res != -1) {
-+	addr.sun_family = AF_UNIX;
-+	if (len < sizeof(addr.sun_path) -1) {
-+	    strcpy(addr.sun_path, path);
-+	} else {
-+	    char *ptr;
-+	    res = -1;
-+	    if (len >= sizeof(path))
-+		goto out;
-+	    strcpy(pathbuf_tmp, path);
-+	    ptr = strrchr(pathbuf_tmp,'/');
-+	    if (ptr) {
-+		*ptr = '\0';
-+		ptr++;
-+		if (chdir(pathbuf_tmp))
-+		    goto out;
-+	    } else {
-+		ptr = pathbuf_tmp;
-+	    }
-+	    if (strlen(ptr) >= sizeof(addr.sun_path))
-+		goto out;
-+	    strcpy(addr.sun_path, ptr);
-+	}
- 	umask(~mode);
- 	res =
- 	    bind(sock, (struct sockaddr *) &addr,
- 		 sizeof(addr.sun_family) + strlen(addr.sun_path));
- 	umask(0);
-+out:
-+	if (chdir("/"))
-+	    fprintf(stderr, "Internal failure to chdir /\n");
- 	close(sock);
-     }
-     return res;
diff --git a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
deleted file mode 100644
index e6d89530f8..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From: Jason Wessel <jason.wessel@windriver.com>
-Date: Sat, 23 Feb 2013 08:49:08 -0600
-Subject: [PATCH] fh_cache: fix statle nfs handle on rename problem
-
-The following test case fails with modern linunx kernels which cache
-the renamed inode.
-
-  % mkdir a;mkdir b;mv b a/;ls -l a
-  ls: a/b: Stale NFS file handle
-
-The issue is that nfserver was not updating the fh_cache with the new
-location of the inode, when it moves directories.
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
----
- fh_cache.c |   12 ++++++++++++
- fh_cache.h |    1 +
- nfs.c      |    2 ++
- 3 files changed, 15 insertions(+)
-
---- a/fh_cache.c
-+++ b/fh_cache.c
-@@ -199,6 +199,18 @@ static char *fh_cache_lookup(uint32 dev,
- }
- 
- /*
-+ * update a fh inode cache for an operation like rename
-+ */
-+void fh_cache_update(nfs_fh3 fh, char *path)
-+{
-+    unfs3_fh_t *obj = (void *) fh.data.data_val;
-+    backend_statstruct buf;
-+
-+    if (backend_lstat(path, &buf) != -1) {
-+	fh_cache_add(obj->dev, buf.st_ino, path);
-+    }
-+}
-+/*
-  * resolve a filename into a path
-  * cache-using wrapper for fh_decomp_raw
-  */
---- a/fh_cache.h
-+++ b/fh_cache.h
-@@ -19,5 +19,6 @@ unfs3_fh_t fh_comp(const char *path, str
- unfs3_fh_t *fh_comp_ptr(const char *path, struct svc_req *rqstp, int need_dir);
- 
- char *fh_cache_add(uint32 dev, uint64 ino, const char *path);
-+void fh_cache_update(nfs_fh3 fh, char *path);
- 
- #endif
---- a/nfs.c
-+++ b/nfs.c
-@@ -876,6 +876,8 @@ RENAME3res *nfsproc3_rename_3_svc(RENAME
- 	    res = backend_rename(from_obj, to_obj);
- 	    if (res == -1)
- 		result.status = rename_err();
-+	    /* Update the fh_cache with moved inode value */
-+	    fh_cache_update(argp->to.dir, to_obj);
- 	}
-     }
- 
diff --git a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
deleted file mode 100644
index b3521c63eb..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-daemon.c: Add option for tcp no delay
-
-Allow the NFS tcp sockets to conditionally use TCP_NODELAY
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
----
- daemon.c |    9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
---- a/daemon.c
-+++ b/daemon.c
-@@ -17,6 +17,7 @@
- #ifndef WIN32
- #include <sys/socket.h>
- #include <netinet/in.h>
-+#include <netinet/tcp.h>
- #include <arpa/inet.h>
- #include <syslog.h>
- #else				       /* WIN32 */
-@@ -75,6 +76,7 @@ unsigned int opt_mount_port = NFS_PORT;
- int opt_singleuser = FALSE;
- int opt_brute_force = FALSE;
- int opt_testconfig = FALSE;
-+int opt_tcp_nodelay = FALSE;
- struct in_addr opt_bind_addr;
- int opt_readable_executables = FALSE;
- char *opt_pid_file = NULL;
-@@ -208,7 +210,7 @@ static void parse_options(int argc, char
- {
- 
-     int opt = 0;
--    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
-+    char *optstring = "bcC:de:hl:m:Nn:prstTuwi:x:y:";
- 
-     while (opt != -1) {
- 	opt = getopt(argc, argv, optstring);
-@@ -295,6 +297,9 @@ static void parse_options(int argc, char
- 		    exit(1);
- 		}
- 		break;
-+	    case 'N':
-+		opt_tcp_nodelay = TRUE;
-+		break;
- 	    case 'n':
- 		opt_nfs_port = strtol(optarg, NULL, 10);
- 		if (opt_nfs_port == 0) {
-@@ -802,6 +807,8 @@ static SVCXPRT *create_tcp_transport(uns
- 	sin.sin_addr.s_addr = opt_bind_addr.s_addr;
- 	sock = socket(PF_INET, SOCK_STREAM, 0);
- 	setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (const char *) &on, sizeof(on));
-+	if (opt_tcp_nodelay)
-+	    setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, &on, sizeof(on));
- 	if (bind(sock, (struct sockaddr *) &sin, sizeof(struct sockaddr))) {
- 	    perror("bind");
- 	    fprintf(stderr, "Couldn't bind to tcp port %d\n", port);
diff --git a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
deleted file mode 100644
index 6f64dd5b3e..0000000000
--- a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Fix parallel build dependency issue
-
-If building with make -j2 the lib.a will not get built in time.
-
-Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
----
- Config/Makefile.in |    3 +++
- Makefile.in        |    3 ++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -29,7 +29,8 @@ DESTDIR =
- 
- VPATH = $(srcdir)
- 
--all: subdirs unfsd$(EXEEXT)
-+all: subdirs
-+	$(MAKE) unfsd$(EXEEXT)
- 
- unfsd$(EXEEXT): $(OBJS) $(CONFOBJ) $(EXTRAOBJ)
- 	$(CC) -o $@ $(OBJS) $(CONFOBJ) $(EXTRAOBJ) $(LDFLAGS)
---- a/Config/Makefile.in
-+++ b/Config/Makefile.in
-@@ -16,6 +16,9 @@ lib.a: $(OBJS)
- 	$(AR) crs lib.a $(OBJS)
- 
- y.tab.h y.tab.c: $(srcdir)/exports.y
-+y.tab.h: y.tab.c
-+
-+y.tab.c: $(srcdir)/exports.y
- 	$(YACC) -d $(srcdir)/exports.y
- 
- y.tab.o: y.tab.c $(srcdir)/exports.h $(top_srcdir)/nfs.h $(top_srcdir)/mount.h $(top_srcdir)/daemon.h
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 66016a2949..606c103a79 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -11,35 +11,16 @@ DEPENDS = "flex-native bison-native flex"
 DEPENDS += "libtirpc"
 DEPENDS:append:class-nativesdk = " flex-nativesdk"
 
-ASNEEDED = ""
-
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
-           file://unfs3_parallel_build.patch \
-           file://alternate_rpc_ports.patch \
-           file://fix_pid_race_parent_writes_child_pid.patch \
-           file://fix_compile_warning.patch \
-           file://rename_fh_cache.patch \
-           file://relative_max_socket_path_len.patch \
-           file://tcp_no_delay.patch \
-           file://0001-daemon.c-Libtirpc-porting-fixes.patch \
-           file://0001-attr-fix-utime-for-symlink.patch \
-           file://0001-Add-listen-action-for-a-tcp-socket.patch \
-           file://no-yywrap.patch \
+           file://0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch \
           "
-SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
+SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
 
-PV = "0.9.22+${SRCPV}"
+PV = "0.10.0"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools
+inherit autotools pkgconfig
 EXTRA_OECONF:append:class-native = " --sbindir=${bindir}"
-CFLAGS:append = " -I${STAGING_INCDIR}/tirpc"
-EXTRA_OECONF:append = " LIBS=-ltirpc"
-
-# Turn off these header detects else the inode search
-# will walk entire file systems and this is a real problem
-# if you have 2 TB of files to walk in your file system
-CACHED_CONFIGUREVARS = "ac_cv_header_mntent_h=no ac_cv_header_sys_mnttab_h=no"
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 384c091713..c1fff7fcb3 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -74,26 +74,11 @@ MOUNTD_PORT=${MOUNTD_PORT:=$[ 3048 + 2 * $NFS_INSTANCE ]}
 
 ## For debugging you would additionally add
 ## --debug all
-UNFSD_OPTS="-p -N -i $NFSPID -e $EXPORTS -n $NFSD_PORT -m $MOUNTD_PORT"
+UNFSD_OPTS="-p -i $NFSPID -e $EXPORTS -n $NFSD_PORT -m $MOUNTD_PORT"
 
 # See how we were called.
 case "$1" in
   start)
-	PORTMAP_RUNNING=`ps -ef | grep portmap | grep -v grep`
-	RPCBIND_RUNNING=`ps -ef | grep rpcbind | grep -v grep`
-	if [[ "x$PORTMAP_RUNNING" = "x" && "x$RPCBIND_RUNNING" = "x" ]]; then
-		echo "======================================================="
-		echo "Error: neither rpcbind nor portmap appear to be running"
-		echo "Please install and start one of these services first"
-		echo "======================================================="
-		echo "Tip: for recent Ubuntu hosts, run:"
-		echo "  sudo apt-get install rpcbind"
-		echo "Then add OPTIONS=\"-i -w\"  to /etc/default/rpcbind and run"
-		echo "  sudo service portmap restart"
-
-		exit 1
-	fi
-
 	echo "Creating exports file..."
 	echo "$NFS_EXPORT_DIR (rw,no_root_squash,no_all_squash,insecure)" > $EXPORTS
 
-- 
2.30.2


