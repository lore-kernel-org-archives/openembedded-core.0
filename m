Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.1210.1602189564347882359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 13:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TdgVQv16;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d81so7760328wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1c9uhblNv35ndaa5v92jOXb9LyTSokX/BcorO9vG1I=;
        b=TdgVQv16YB8gUZpTiYsUMp+bqopL/Xf6vT595lmcV9LOwxgoy3cqr1m/qTSN18xwRW
         zhR7I9FIyN60PGrX9vT14y1oGnC5cixQTyuaWtjlF/DXO8Ik0z3xAPRHjyGGok7dxhcY
         1mzf1a/bDVoYceELUjTaRIQgCGvUsTczgavbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1c9uhblNv35ndaa5v92jOXb9LyTSokX/BcorO9vG1I=;
        b=YF22vVH0K2/6wuUlMZZ9sey32Jqt9tM3CAv/UO0etINGIg7Y3+A+1mdNPoUTl0BeZS
         1wP74xKRo8ESdfSh43gNMJh7Y/7e450zZDSlAVPUldqdUsLGCpmNzpTpsrtfsd7xl+bS
         lzu6Q8Hj/kTr96qK2RtwKaYAmJcrVqGh1F7ujvM8MG7JchWvvanUQub1HNLL1CTZkQkM
         p16YKFtPxLo/3Hl3LmGKPv8I8oTyBskTRmj8i/o/gwAFIYuzU9aE2xjACAkUpZIRVg8w
         7HQslmjekB4OCu3f41nseEGfyi0ejj4gIRMqaEKKrmv/b+6gSTXWp1P1FKegfXEguzJF
         WHgw==
X-Gm-Message-State: AOAM530J8q7Sz0tz9tUOpF+eHRmTRNxD/Slq6G96e6KvS6jQiH18KquC
	E8K0N0NaeFDwKTKa38vRz1mOXzY+0sUZzQ==
X-Google-Smtp-Source: ABdhPJyBJuFB4LuJd7tjcWhxc7W6CkUCJ55glib3JqbwB0M3aSC94kMGb03fO5X5IdD6HWC1o/IJuQ==
X-Received: by 2002:a1c:b6d5:: with SMTP id g204mr10682377wmf.65.1602189561361;
        Thu, 08 Oct 2020 13:39:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id g144sm8954511wmg.30.2020.10.08.13.39.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 13:39:20 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] pseudo: Update to account for patches merged on branch
Date: Thu,  8 Oct 2020 21:39:19 +0100
Message-Id: <20201008203920.3240279-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/abort_on_mismatch.patch      |  64 ----
 .../pseudo/files/add_ignore_paths.patch       | 298 ------------------
 .../pseudo/files/delete_mismatches.patch      |  51 ---
 .../pseudo/files/mayunlink.patch              |  37 ---
 .../pseudo/files/pathfix.patch                |  25 --
 .../pseudo/files/statxfix.patch               |  56 ----
 .../pseudo/files/track_link_fds.patch         | 155 ---------
 .../pseudo/files/xattr_fix.patch              |  40 ---
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  10 +-
 9 files changed, 1 insertion(+), 735 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/add_ignore_paths.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/delete_mismatches.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/mayunlink.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/pathfix.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/statxfix.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/track_link_fds.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_fix.patch

diff --git a/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch b/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch
deleted file mode 100644
index 1737269ec8d..00000000000
--- a/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Rather than mapping mismatched inode entries to paths, thrown an abort() 
-instead. Add a new result type to allow the server to pass back
-this instruction to the client.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/pseudo.c
-===================================================================
---- git.orig/pseudo.c
-+++ git/pseudo.c
-@@ -695,17 +695,15 @@ pseudo_op(pseudo_msg_t *msg, const char
- 						msg->path);
- 					pdb_did_unlink_file(path_by_ino, &by_ino, by_ino.deleting);
- 				} else {
--					int flags = 0;
--					if (msg->nlink > 1) {
--						flags = PDBGF_FILE | PDBGF_VERBOSE;
--					}
--					pseudo_debug(flags, "path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
-+					pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
- 						msg->nlink,
- 						msg->nlink == 1 ? "" : "s",
- 						(unsigned long long) msg_header.ino,
- 						path_by_ino ? path_by_ino : "no path",
- 						msg->path);
- 					found_ino = 0;
-+					msg->result = RESULT_ABORT;
-+					goto op_exit;
- 				}
- 			}
- 		} else {
-@@ -1025,6 +1023,7 @@ pseudo_op(pseudo_msg_t *msg, const char
- 		break;
- 	}
- 
-+op_exit:
- 	/* in the case of an exact match, we just used the pointer
- 	 * rather than allocating space.
- 	 */
-Index: git/pseudo_client.c
-===================================================================
---- git.orig/pseudo_client.c
-+++ git/pseudo_client.c
-@@ -1919,6 +1919,10 @@ pseudo_client_op(pseudo_op_t op, int acc
- #endif
- 		if (result) {
- 			pseudo_debug(PDBGF_OP, "(%d) %s", getpid(), pseudo_res_name(result->result));
-+			if (result->result == RESULT_ABORT) {
-+				pseudo_diag("abort()ing pseudi client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.\n");
-+				abort();
-+			}
- 			if (op == OP_STAT || op == OP_FSTAT) {
- 				pseudo_debug(PDBGF_OP, " mode 0%o uid %d:%d",
- 					(int) result->mode,
-Index: git/enums/res.in
-===================================================================
---- git.orig/enums/res.in
-+++ git/enums/res.in
-@@ -2,3 +2,4 @@ res: RESULT
- succeed
- fail
- error
-+abort
diff --git a/meta/recipes-devtools/pseudo/files/add_ignore_paths.patch b/meta/recipes-devtools/pseudo/files/add_ignore_paths.patch
deleted file mode 100644
index eddfdb8674b..00000000000
--- a/meta/recipes-devtools/pseudo/files/add_ignore_paths.patch
+++ /dev/null
@@ -1,298 +0,0 @@
-Currently, pseudo considers any path accessed whist its running to be
-a valid entry to track in its database. The way OpenEmbedded uses pseudo,
-there are paths we care about accesses to from a pseudo perspective and paths
-which we simply don't care about.
-
-This patch adds a PSEUDO_IGNORE_PATHS environment variable which is a comma
-separated list of path prefixes to ignore accesses to.
-
-To do this, we add some functions which can check a path argument or a file
-descriptor argument and use these in the pseudo wrappers where path or fd
-arguments are present. Where paths are being ignored, we skip straight to
-the underlying real function.
-
-Psuedo needs to keep track of the open fd mappings to files so we still need
-to allow those cases into the pseudo_op function. Specficially this means
-OP_CLOSE, OP_OPEN, OP_DUP and OP_CHDIR.
-
-Apart from OP_OPEN which could call the server, the other operations are client
-side only so passed through. We 'tag' the functions using these operations so
-that the path ignore code isn't triggered. For OP_OPEN we exit early and skip
-the server op. We also have a catch all in client_op to ensure any operatings
-we didn't manage to skip early still get skipped correctly.
-
-OP_CHROOT is a special case. Where ignored path prefixes are used as a chroot,
-for the lifetime of the chroot, the path is effectively dropped from the
-PSEUDO_IGNORE_PATHS list. Whilst slightly counter intuaitive, this turned out
-to be the most effective way to do things due to commands like useradd and
-their use of chroots.
-
-For sqlite3 and appropriate path filtering in OE, this took the database from
-45,000 entries to about 180. For dbus this was 88,000 down to 760. Given the
-number of client to server trips these numbers of paths involves, the win
-is seemingly worthwhile.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/pseudo_client.c
-===================================================================
---- git.orig/pseudo_client.c
-+++ git/pseudo_client.c
-@@ -1482,6 +1482,43 @@ base_path(int dirfd, const char *path, i
- 	return newpath;
- }
- 
-+int pseudo_client_ignore_fd(int fd) {
-+	if (fd >= 0 && fd <= nfds)
-+		return pseudo_client_ignore_path(fd_path(fd));
-+	return 0;
-+}
-+
-+int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
-+	char *env;
-+	if (path) {
-+		if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
-+			return 0;
-+		env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
-+		if (env) {
-+			char *p = env;
-+        	        while (*p) {
-+				char *next = strchr(p, ',');
-+				if (!next)
-+				    next = strchr(p, '\0');
-+				if ((next - p) && !strncmp(path, p, next - p)) {
-+		 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
-+					return 1;
-+				}
-+				if (next && *next != '\0')
-+					p = next+1;
-+				else
-+					break;
-+			}
-+			free(env);
-+		}
-+	}
-+	return 0;
-+}
-+
-+int pseudo_client_ignore_path(const char *path) {
-+	return pseudo_client_ignore_path_chroot(path, 1);
-+}
-+
- pseudo_msg_t *
- pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path, const PSEUDO_STATBUF *buf, ...) {
- 	pseudo_msg_t *result = 0;
-@@ -1522,6 +1559,16 @@ pseudo_client_op(pseudo_op_t op, int acc
- 		}
- 	}
- 
-+	if (op != OP_CHROOT && op != OP_CHDIR && op != OP_CLOSE && op != OP_DUP
-+			&& pseudo_client_ignore_path_chroot(path, 0)) {
-+		if (op == OP_OPEN) {
-+			pseudo_client_path(fd, path);
-+		}
-+		/* reenable wrappers */
-+		pseudo_magic();
-+		return result;
-+	}
-+
- #ifdef PSEUDO_XATTRDB
- 	if (buf) {
- 		struct stat64 bufcopy = *buf;
-Index: git/pseudo_util.c
-===================================================================
---- git.orig/pseudo_util.c
-+++ git/pseudo_util.c
-@@ -43,6 +43,7 @@ static struct pseudo_variables pseudo_en
- 	{ "PSEUDO_BINDIR", 13, NULL },
- 	{ "PSEUDO_LIBDIR", 13, NULL },
- 	{ "PSEUDO_LOCALSTATEDIR", 20, NULL },
-+	{ "PSEUDO_IGNORE_PATHS", 19, NULL },
- 	{ "PSEUDO_PASSWD", 13, NULL },
- 	{ "PSEUDO_CHROOT", 13, NULL },
- 	{ "PSEUDO_UIDS", 11, NULL },
-Index: git/pseudo_client.h
-===================================================================
---- git.orig/pseudo_client.h
-+++ git/pseudo_client.h
-@@ -7,6 +7,8 @@
-  *
-  */
- extern pseudo_msg_t *pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path, const PSEUDO_STATBUF *buf, ...);
-+extern int pseudo_client_ignore_path(const char *path);
-+extern int pseudo_client_ignore_fd(int fd);
- #if PSEUDO_STATBUF_64
- #define base_lstat real_lstat64
- #define base_fstat real_fstat64
-Index: git/ports/linux/wrapfuncs.in
-===================================================================
---- git.orig/ports/linux/wrapfuncs.in
-+++ git/ports/linux/wrapfuncs.in
-@@ -1,23 +1,23 @@
--int open(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
-+int open(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
- char *get_current_dir_name(void);
- int __xstat(int ver, const char *path, struct stat *buf);
- int __lxstat(int ver, const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW */
- int __fxstat(int ver, int fd, struct stat *buf);
- int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
- int __fxstatat(int ver, int dirfd, const char *path, struct stat *buf, int flags);
--int openat(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
--int __openat_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW */
-+int openat(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
-+int __openat_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
- int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknod */
- int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknodat */
- int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
- int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
--int fcntl(int fd, int cmd, ...{struct flock *lock});
-+int fcntl(int fd, int cmd, ...{struct flock *lock});  /* noignore_path=1 */
- # just so we know the inums of symlinks
- char *canonicalize_file_name(const char *filename);
- int eaccess(const char *path, int mode);
--int open64(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
--int openat64(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
--int __openat64_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW */
-+int open64(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
-+int openat64(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
-+int __openat64_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
- int creat64(const char *path, mode_t mode);
- int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat */
- int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW */
-@@ -29,9 +29,9 @@ int __xstat64(int ver, const char *path,
- int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
- int __fxstat64(int ver, int fd, struct stat64 *buf);
- int __fxstatat64(int ver, int dirfd, const char *path, struct stat64 *buf, int flags);
--FILE *fopen64(const char *path, const char *mode);
--int nftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int, struct FTW *), int nopenfd, int flag);
--FILE *freopen64(const char *path, const char *mode, FILE *stream);
-+FILE *fopen64(const char *path, const char *mode); /* noignore_path=1 */
-+int nftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int, struct FTW *), int nopenfd, int flag); /* noignore_path=1 */
-+FILE *freopen64(const char *path, const char *mode, FILE *stream);  /* noignore_path=1 */
- int ftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int), int nopenfd);
- int glob64(const char *pattern, int flags, int (*errfunc)(const char *, int), glob64_t *pglob);
- int scandir64(const char *path, struct dirent64 ***namelist, int (*filter)(const struct dirent64 *), int (*compar)());
-Index: git/templates/wrapfuncs.c
-===================================================================
---- git.orig/templates/wrapfuncs.c
-+++ git/templates/wrapfuncs.c
-@@ -60,9 +60,15 @@ ${maybe_async_skip}
- 		${rc_assign} (*real_${name})(${call_args});
- 	} else {
- 		${fix_paths}
--		/* exec*() use this to restore the sig mask */
--		pseudo_saved_sigmask = saved;
--		${rc_assign} wrap_$name(${call_args});
-+		if (${ignore_paths}) {
-+			/* call the real syscall */
-+			pseudo_debug(PDBGF_SYSCALL, "${name} ignored path, calling real syscall.\n");
-+			${rc_assign} (*real_${name})(${call_args});
-+		} else {
-+			/* exec*() use this to restore the sig mask */
-+			pseudo_saved_sigmask = saved;
-+			${rc_assign} wrap_$name(${call_args});
-+		}
- 	}
- 	${variadic_end}
- 	save_errno = errno;
-Index: git/ports/unix/wrapfuncs.in
-===================================================================
---- git.orig/ports/unix/wrapfuncs.in
-+++ git/ports/unix/wrapfuncs.in
-@@ -1,14 +1,14 @@
- int creat(const char *path, mode_t mode);
- char *getcwd(char *buf, size_t size);
- char *getwd(char *buf);
--int close(int fd);
-+int close(int fd);  /* noignore_path=1 */
- int fchmod(int fd, mode_t mode);
- int fchown(int fd, uid_t owner, gid_t group);
- int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
--int dup2(int oldfd, int newfd);
--int dup(int fd);
--int chdir(const char *path);
--int fchdir(int dirfd);
-+int dup2(int oldfd, int newfd); /* noignore_path=1 */
-+int dup(int fd); /* noignore_path=1 */
-+int chdir(const char *path); /* noignore_path=1 */
-+int fchdir(int dirfd); /* noignore_path=1 */
- int access(const char *path, int mode);
- FTS *fts_open(char * const *path_argv, int options, int (*compar)(const FTSENT **, const FTSENT **)); /* inode64=1 */
- int ftw(const char *path, int (*fn)(const char *, const struct stat *, int), int nopenfd);
-@@ -20,18 +20,18 @@ char *mktemp(char *template);
- long pathconf(const char *path, int name);
- char *realpath(const char *name, char *resolved_name); /* version="GLIBC_2.3" */
- int remove(const char *path); /* flags=AT_SYMLINK_NOFOLLOW */
--DIR *opendir(const char *path);
--int closedir(DIR *dirp);
-+DIR *opendir(const char *path); /* noignore_path=1 */
-+int closedir(DIR *dirp); /* noignore_path=1 */
- char *tempnam(const char *template, const char *pfx);
- char *tmpnam(char *s);
- int truncate(const char *path, off_t length);
- int utime(const char *path, const struct utimbuf *buf);
- int utimes(const char *path, const struct timeval *times);
- # needed because libc stdio does horrible things with inline asm syscalls
--FILE *fopen(const char *path, const char *mode);
--int fclose(FILE *fp);
--FILE *freopen(const char *path, const char *mode, FILE *stream);
--int chroot(const char *path);
-+FILE *fopen(const char *path, const char *mode); /* noignore_path=1 */
-+int fclose(FILE *fp);  /* noignore_path=1 */
-+FILE *freopen(const char *path, const char *mode, FILE *stream); /* noignore_path=1 */
-+int chroot(const char *path); /* noignore_path=1 */
- int acct(const char *path);
- int chmod(const char *path, mode_t mode);
- int chown(const char *path, uid_t owner, gid_t group);
-Index: git/makewrappers
-===================================================================
---- git.orig/makewrappers
-+++ git/makewrappers
-@@ -228,6 +228,8 @@ class Function:
-         self.real_func = None
-         self.paths_to_munge = []
-         self.specific_dirfds = {}
-+        self.fd_arg = False
-+        self.noignore_path = False
-         self.hand_wrapped = None
-         self.async_skip = None
-         # used for the copyright date when creating stub functions
-@@ -267,6 +269,11 @@ class Function:
-                 self.flags = '(flags & AT_SYMLINK_NOFOLLOW)'
-             elif arg.name.endswith('path'):
-                 self.paths_to_munge.append(arg.name)
-+            elif arg.name == 'fd':
-+                self.fd_arg = "fd"
-+            elif arg.name == 'filedes':
-+                self.fd_arg = "filedes"
-+
-     
-         # pick default values
-         if self.type == 'void':
-@@ -361,6 +368,25 @@ class Function:
-                 (path, prefix, self.dirfd, path, self.flags))
-         return "\n\t\t".join(fix_paths)
- 
-+    def ignore_paths(self):
-+        if self.noignore_path:
-+            return "0"
-+
-+        mainpath = None
-+        if "oldpath" in self.paths_to_munge:
-+            mainpath = "oldpath"
-+        elif "newpath" in self.paths_to_munge:
-+            mainpath = "newpath"
-+        elif "path" in self.paths_to_munge:
-+            mainpath = "path"
-+
-+        if mainpath:
-+            return "pseudo_client_ignore_path(%s)" % mainpath
-+        if self.fd_arg:
-+            return "pseudo_client_ignore_fd(%s)" % self.fd_arg
-+
-+        return "0"
-+
-     def real_predecl(self):
-         if self.real_func:
-             return self.decl().replace(self.name, self.real_func, 1) + ";"
diff --git a/meta/recipes-devtools/pseudo/files/delete_mismatches.patch b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
deleted file mode 100644
index 6c78d787c78..00000000000
--- a/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-When we see cases where the inode no longer matches the file path, pseudo 
-notices but currently reuses the database entry. This can happen where for
-example, a file is deleted and a new file created outside of pseudo where
-the inode number is reused.
-
-Change this to ignore the likely stale database entry instead. We're
-seeing bugs where inode reuse for deleted files causes permission corruption.
-(See bug #14057 for example). We don't want to delete the database entry
-as the permissions may need to be applied to that file (and testing shows
-we do need the path matching code which handles that).
-
-I appreciate this should never happen under the original design of pseudo
-where all file accesses are monitored by pseudo. The reality is to do that,
-we'd have to run pseudo:
-
-a) for all tasks
-b) as one pseudo database for all of TMPDIR
-
-Neither of these is realistically possible for performance reasons.
-
-I believe pseudo to be much better at catching all accesses than it
-might once have been. As such, these "fixups" are in the cases I've
-seen in the logs, always incorrect.
-
-It therefore makes more sense to ignore the database data rather than
-corrupt the file permissions or worse. Looking at the pseudo logs
-in my heavily reused build directories, the number of these
-errors is staggering. This issue would explain many weird bugs we've
-seen over the years.
-
-There is a risk that we could not map permissions in some case where
-we currently would. I have not seen evidence of this in any logs I've
-read though. This change, whilst going against the original design,
-is in my view the safer option for the project at this point given we
-don't use pseudo as originally designed and never will be able to.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/pseudo.c
-===================================================================
---- git.orig/pseudo.c
-+++ git/pseudo.c
-@@ -699,6 +701,7 @@ pseudo_op(pseudo_msg_t *msg, const char
- 						(unsigned long long) msg_header.ino,
- 						path_by_ino ? path_by_ino : "no path",
- 						msg->path);
-+					found_ino = 0;
- 				}
- 			}
- 		} else {
diff --git a/meta/recipes-devtools/pseudo/files/mayunlink.patch b/meta/recipes-devtools/pseudo/files/mayunlink.patch
deleted file mode 100644
index 9d54e40dd9b..00000000000
--- a/meta/recipes-devtools/pseudo/files/mayunlink.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Some operations may call unlink() on an open fd, then call fchown/fchmod/fstat
-on that fd. This would currently readd its entry to the database, which
-is necessary to preserve its permissions information however since that 
-file will be lost when it is closed, we don't want the DB entry to persist.
-Marking it as may_unlink means the code will know its likely been deleted 
-and ignore the entry later, giving improved behaviour that simple path
-mismatch warnings. We can use an nlink of zero to detect this.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/pseudo.c
-===================================================================
---- git.orig/pseudo.c
-+++ git/pseudo.c
-@@ -1100,6 +1100,21 @@ pseudo_op(pseudo_msg_t *msg, const char
- 		break;
- 	}
- 
-+	switch (msg->op) {
-+	case OP_FCHOWN:		/* FALLTHROUGH */
-+	case OP_FCHMOD:		/* FALLTHROUGH */
-+	case OP_FSTAT:
-+		if (!found_path && !found_ino && (msg->nlink == 0)) {
-+			/* If nlink is 0 for an fchown/fchmod/fstat, we probably have an fd which is 
-+			 * unlinked and we don't want to do inode/path matching against it. Marking it 
-+ 			 * as may unlink gives the right hints in the database to ensure we
-+			 * handle correctly whilst maintaining the permissions whilst the 
-+			 * file exists for the fd.  */
-+			pdb_may_unlink_file(msg, msg->client);
-+		}
-+		break;
-+	}
-+
- op_exit:
- 	/* in the case of an exact match, we just used the pointer
- 	 * rather than allocating space.
diff --git a/meta/recipes-devtools/pseudo/files/pathfix.patch b/meta/recipes-devtools/pseudo/files/pathfix.patch
deleted file mode 100644
index b3e63fa28fc..00000000000
--- a/meta/recipes-devtools/pseudo/files/pathfix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-We're seeing systems in the wild (e.g. ubuntu 20.04) which call
-with a dirfd set to the full filename and path set to "". Since
-this seems to be expected to work, handle it accordingly.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/pseudo_client.c
-===================================================================
---- git.orig/pseudo_client.c
-+++ git/pseudo_client.c
-@@ -1549,8 +1549,12 @@ base_path(int dirfd, const char *path, i
- 
- 	if (!path)
- 		return NULL;
--	if (!*path)
-+
-+	if (!*path) {
-+		if (dirfd != -1 && dirfd != AT_FDCWD)
-+			return fd_path(dirfd);
- 		return "";
-+	}
- 
- 	if (path[0] != '/') {
- 		if (dirfd != -1 && dirfd != AT_FDCWD) {
diff --git a/meta/recipes-devtools/pseudo/files/statxfix.patch b/meta/recipes-devtools/pseudo/files/statxfix.patch
deleted file mode 100644
index c47ff27f9f4..00000000000
--- a/meta/recipes-devtools/pseudo/files/statxfix.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-There is magic in the posts where specific variable names have specific
-magic. For that magic to work, "path" needs to be used not "pathname" as
-is currently there. Fix this, which fixes path issues on systems using 
-statx (Ubuntu 20.04 in particular).
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/ports/linux/statx/guts/statx.c
-===================================================================
---- git.orig/ports/linux/statx/guts/statx.c
-+++ git/ports/linux/statx/guts/statx.c
-@@ -5,14 +5,14 @@
-  * SPDX-License-Identifier: LGPL-2.1-only
-  *
-  * int
-- * statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) {
-+ * statx(int dirfd, const char *path, int flags, unsigned int mask, struct statx *statxbuf) {
-  *	int rc = -1;
-  */
- 	pseudo_msg_t *msg;
- 	PSEUDO_STATBUF buf;
- 	int save_errno;
- 
--	rc = real_statx(dirfd, pathname, flags, mask, statxbuf);
-+	rc = real_statx(dirfd, path, flags, mask, statxbuf);
- 	save_errno = errno;
- 	if (rc == -1) {
- 		return rc;
-@@ -25,16 +25,16 @@
- 	buf.st_mode = statxbuf->stx_mode;
- 	buf.st_rdev = makedev(statxbuf->stx_rdev_major, statxbuf->stx_rdev_minor);
- 	buf.st_nlink = statxbuf->stx_nlink;
--	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, pathname, &buf);
-+	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, path, &buf);
- 	if (msg && msg->result == RESULT_SUCCEED) {
--		pseudo_debug(PDBGF_FILE, "statx(path %s), flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
-+		pseudo_debug(PDBGF_FILE, "statx(path %s), flags %o, stat rc %d, stat uid %o\n", path, flags, rc, statxbuf->stx_uid);
- 		statxbuf->stx_uid = msg->uid;
- 		statxbuf->stx_gid = msg->gid;
- 		statxbuf->stx_mode = msg->mode;
- 		statxbuf->stx_rdev_major = major(msg->rdev);
- 		statxbuf->stx_rdev_minor = minor(msg->rdev);
- 	} else {
--		pseudo_debug(PDBGF_FILE, "statx(path %s) failed, flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
-+		pseudo_debug(PDBGF_FILE, "statx(path %s) failed, flags %o, stat rc %d, stat uid %o\n", path, flags, rc, statxbuf->stx_uid);
- 	}
- 	errno = save_errno;
- /*	return rc;
-Index: git/ports/linux/statx/wrapfuncs.in
-===================================================================
---- git.orig/ports/linux/statx/wrapfuncs.in
-+++ git/ports/linux/statx/wrapfuncs.in
-@@ -1 +1 @@
--int statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf);
-+int statx(int dirfd, const char *path, int flags, unsigned int mask, struct statx *statxbuf);
diff --git a/meta/recipes-devtools/pseudo/files/track_link_fds.patch b/meta/recipes-devtools/pseudo/files/track_link_fds.patch
deleted file mode 100644
index a3a9eb3f23f..00000000000
--- a/meta/recipes-devtools/pseudo/files/track_link_fds.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-Consider what happens if a program does:
-
-fd = fopen("A")
-link("A", "B")
-unlink("A")
-fchown(fd)
-
-Assuming we can't use the database, in order to handle this correctly, 
-we need to change the open fd to point at B when A us unlinked.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/ports/unix/guts/linkat.c
-===================================================================
---- git.orig/ports/unix/guts/linkat.c
-+++ git/ports/unix/guts/linkat.c
-@@ -116,6 +116,7 @@
- 	 * if the thing linked is a symlink.
- 	 */
- 	pseudo_client_op(OP_LINK, 0, -1, -1, newpath, &buf);
-+	pseudo_client_linked_paths(oldpath, newpath);
- 
- 	errno = save_errno;
- 
-Index: git/pseudo_client.c
-===================================================================
---- git.orig/pseudo_client.c
-+++ git/pseudo_client.c
-@@ -70,6 +70,8 @@ int pseudo_umask = 022;
- 
- static char **fd_paths = NULL;
- static int nfds = 0;
-+static char **linked_fd_paths = NULL;
-+static int linked_nfds = 0;
- static const char **passwd_paths = NULL;
- static int npasswd_paths = 0;
- #ifdef PSEUDO_PROFILING
-@@ -889,39 +891,70 @@ fd_path(int fd) {
- }
- 
- static void
--pseudo_client_path(int fd, const char *path) {
-+pseudo_client_path_set(int fd, const char *path, char ***patharray, int *len) {
- 	if (fd < 0)
- 		return;
- 
--	if (fd >= nfds) {
-+	if (fd >= *len) {
- 		int i;
- 		pseudo_debug(PDBGF_CLIENT, "expanding fds from %d to %d\n",
--			nfds, fd + 1);
--		fd_paths = realloc(fd_paths, (fd + 1) * sizeof(char *));
--		for (i = nfds; i < fd + 1; ++i)
--			fd_paths[i] = 0;
--		nfds = fd + 1;
-+			*len, fd + 1);
-+		(*patharray) = realloc((*patharray), (fd + 1) * sizeof(char *));
-+		for (i = *len; i < fd + 1; ++i)
-+			(*patharray)[i] = 0;
-+		*len = fd + 1;
- 	} else {
--		if (fd_paths[fd]) {
-+		if ((*patharray)[fd]) {
- 			pseudo_debug(PDBGF_CLIENT, "reopening fd %d [%s] -- didn't see close\n",
--				fd, fd_paths[fd]);
-+				fd, (*patharray)[fd]);
- 		}
- 		/* yes, it is safe to free null pointers. yay for C89 */
--		free(fd_paths[fd]);
--		fd_paths[fd] = 0;
-+		free((*patharray)[fd]);
-+		(*patharray)[fd] = 0;
- 	}
- 	if (path) {
--		fd_paths[fd] = strdup(path);
-+		(*patharray)[fd] = strdup(path);
-+	}
-+}
-+
-+static void
-+pseudo_client_path(int fd, const char *path) {
-+	pseudo_client_path_set(fd, path, &fd_paths, &nfds);
-+}
-+
-+void
-+pseudo_client_linked_paths(const char *oldpath, const char *newpath) {
-+	int fd;
-+	for (fd = 3; fd < nfds; ++fd) {
-+		if (fd_paths[fd] && !strcmp(oldpath, fd_paths[fd])) {
-+			pseudo_client_path_set(fd, newpath, &linked_fd_paths, &linked_nfds);
-+		}
- 	}
- }
- 
- static void
-+pseudo_client_unlinked_path(const char *path) {
-+	int fd;
-+	for (fd = 0; fd < linked_nfds; ++fd) {
-+		if (linked_fd_paths[fd] && fd_paths[fd] && !strcmp(path, fd_paths[fd])) {
-+			pseudo_client_path(fd, linked_fd_paths[fd]);
-+		}
-+	}
-+}
-+
-+
-+static void
- pseudo_client_close(int fd) {
- 	if (fd < 0 || fd >= nfds)
- 		return;
- 
- 	free(fd_paths[fd]);
- 	fd_paths[fd] = 0;
-+
-+	if (fd < linked_nfds) {
-+		free(linked_fd_paths[fd]);
-+		linked_fd_paths[fd] = 0;
-+	}
- }
- 
- /* spawn server */
-@@ -1860,6 +1893,12 @@ pseudo_client_op(pseudo_op_t op, int acc
- 			dirfd);
- 		pseudo_client_path(dirfd, fd_path(fd));
- 		break;
-+	case OP_UNLINK:
-+	case OP_DID_UNLINK:
-+		if (path)
-+			pseudo_client_unlinked_path(path);
-+		do_request = 1;
-+		break;
- 	/* operations for which we should use the magic uid/gid */
- 	case OP_CHMOD:
- 	case OP_CREAT:
-@@ -1882,8 +1921,6 @@ pseudo_client_op(pseudo_op_t op, int acc
- 	case OP_LINK:
- 	case OP_RENAME:
- 	case OP_STAT:
--	case OP_UNLINK:
--	case OP_DID_UNLINK:
- 	case OP_CANCEL_UNLINK:
- 	case OP_MAY_UNLINK:
- 	case OP_GET_XATTR:
-Index: git/pseudo_client.h
-===================================================================
---- git.orig/pseudo_client.h
-+++ git/pseudo_client.h
-@@ -9,6 +9,7 @@
- extern pseudo_msg_t *pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path, const PSEUDO_STATBUF *buf, ...);
- extern int pseudo_client_ignore_path(const char *path);
- extern int pseudo_client_ignore_fd(int fd);
-+extern void pseudo_client_linked_paths(const char *oldpath, const char *newpath);
- #if PSEUDO_STATBUF_64
- #define base_lstat real_lstat64
- #define base_fstat real_fstat64
diff --git a/meta/recipes-devtools/pseudo/files/xattr_fix.patch b/meta/recipes-devtools/pseudo/files/xattr_fix.patch
deleted file mode 100644
index 61d0030b103..00000000000
--- a/meta/recipes-devtools/pseudo/files/xattr_fix.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-
-In the xattr handling functions, if result is NULL, which it can be 
-with the path ignore code, there is a NULL pointer dereference and 
-segfault. Everywhere else checks result first, this appears to just 
-be an omission.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/ports/linux/xattr/pseudo_wrappers.c
-===================================================================
---- git.orig/ports/linux/xattr/pseudo_wrappers.c
-+++ git/ports/linux/xattr/pseudo_wrappers.c
-@@ -134,7 +134,7 @@ static ssize_t shared_getxattr(const cha
- 	pseudo_debug(PDBGF_XATTR, "getxattr(%s [fd %d], %s)\n",
- 		path ? path : "<no path>", fd, name);
- 	pseudo_msg_t *result = pseudo_client_op(OP_GET_XATTR, 0, fd, -1, path, &buf, name);
--	if (result->result != RESULT_SUCCEED) {
-+	if (!result || result->result != RESULT_SUCCEED) {
- 		errno = ENOATTR;
- 		return -1;
- 	}
-@@ -254,7 +254,7 @@ static int shared_setxattr(const char *p
- static ssize_t shared_listxattr(const char *path, int fd, char *list, size_t size) {
- 	RC_AND_BUF
- 	pseudo_msg_t *result = pseudo_client_op(OP_LIST_XATTR, 0, fd, -1, path, &buf);
--	if (result->result != RESULT_SUCCEED) {
-+	if (!result || result->result != RESULT_SUCCEED) {
- 		pseudo_debug(PDBGF_XATTR, "listxattr: no success.\n");
- 		errno = ENOATTR;
- 		return -1;
-@@ -276,7 +276,7 @@ static int shared_removexattr(const char
- 	RC_AND_BUF
- 	pseudo_msg_t *result = pseudo_client_op(OP_REMOVE_XATTR, 0, fd, -1, path, &buf, name);
- 
--	if (result->result != RESULT_SUCCEED) {
-+	if (!result || result->result != RESULT_SUCCEED) {
- 		/* docs say ENOATTR, but I don't have one */
- 		errno = ENOENT;
- 		return -1;
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c79fe92bc39..9b7ee1c18cd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,19 +2,11 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
-           file://delete_mismatches.patch \
-           file://add_ignore_paths.patch \
-           file://abort_on_mismatch.patch \
-           file://track_link_fds.patch \
-           file://xattr_fix.patch \
-           file://mayunlink.patch \
-           file://pathfix.patch \
-           file://statxfix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
 
-SRCREV = "d6b1b13c268d7246f0288d32d6b5eccc658cff4e"
+SRCREV = "07141f919dc8582460f984ed1d2fb73e05f82ef3"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

