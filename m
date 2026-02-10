Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB18EA3F33
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:50:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16299.1770717029494041649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K+RuVycm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65019b8557=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7p7D81920462
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:50:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=VMcOTVXdVq5aD4UA0f1dl/SGODqbDobeJRk8TCaFF1M=; b=K+RuVycmePJv
	6X1lttLotIVEMfmXNAlzBdq7h5gA6MOqGPNp/Nx0bKy0js2dlFbAnw5vOo3KkJ3E
	f3cILW/xu6d4eR3z77pd9LvJfv0sLuaOZkxN6DbbzrRrBzYdZnaSFOlu/dnDASc1
	+nDUbB3+IAjXY3BQ30sAEjY4IdNMg/fsrz+lT5su1rOuyKNJ76Tdtb/STuikY+CY
	2hU2TMHiAv4syinv1Yawcx2ThwUL3eJVmkLcY03oV1uEG5bj8CChSIzXDxeTjmjK
	RE2NGpM0s2h2OqNzpgal0RHxBSP/7ulkih8lnhIfPCwCQrbN/A5O4C9miMl3iCVu
	zA4VlUeCMA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj2rhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:50:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 01:50:28 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 01:50:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] dpkg: 1.22.21 -> 1.23.5
Date: Tue, 10 Feb 2026 17:50:24 +0800
Message-ID: <20260210095025.633860-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210095025.633860-1-hongxu.jia@windriver.com>
References: <20260210095025.633860-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: linc5n3a7v_N6jKhBkpm7i56W2kS3_Ra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MiBTYWx0ZWRfX9L/FSyOHT7/j
 b0+vJKLgDHiOlKSZS2bdtcrbJyl8WRcMZnNJDBSntZkFp7ToglxiRyIXEb0doV0dkGicE/m4nPy
 hGALsEM0J1aRBxtwHFSxipDc0eBrLtxOdw9AzklwHExzH9DYahwUJCQAGhQZP3cExzOp9cGgRAW
 ZQszqrVUh/xCCkTQ7hd4V8ZO2ZH9xPlH0UmwpgzrOiS3EXlhRaq5ZGWXEG+6SiSZsLW9AU65i9u
 x8x+JPeQ5h5w3DZPmt5jsorgZZgNOkW146V4++0SpzhXaDiLKc99UbuMkmysIZWchrPCQHew0Hd
 0LcbzGr3bapH7M+2PIl8p+0JFi6K4ohlN0Mjapd/nBRx7kv0taZEuOTPitETQmdGW0pnU3IZg10
 MNcuoi7yP5+rXthU20xSnEMfqwkFxqHTo/RKm+T7sxKU1Qful3B3EV0K6esC375l4AfK//hPr1P
 ZwRaZ7IPGm7qkj5rZlw==
X-Proofpoint-GUID: linc5n3a7v_N6jKhBkpm7i56W2kS3_Ra
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698aff64 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=pGLkceISAAAA:8
 a=IpJZQVW2AAAA:8 a=QyXUC8HyAAAA:8 a=xNf9USuDAAAA:8 a=qucxWgi4NhDXb2WO1bYA:9
 a=jXTMQygeckLRuJl0:21 a=FdTzh2GWekK77mhwV6Dw:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230873

Refresh patches:
- 0001-build.c-ignore-return-of-1-from-tar-cf.patch
- 0001-script.c-avoid-use-of-chroot.patch
- 0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
- 0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
- 0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
- arch_pm.patch
- remove-tar-no-timestamp.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ild.c-ignore-return-of-1-from-tar-cf.patch | 42 +++++++++-------
 .../0001-script.c-avoid-use-of-chroot.patch   | 35 +++++++++-----
 ...rs-kernel-version-which-has-characte.patch | 48 +++++++++++--------
 ...tion-doesn-t-work-properly-for-all-s.patch | 27 +++++++----
 ...c-Remove-usage-of-clamp-mtime-in-tar.patch | 37 ++++++++------
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch | 28 ++++++-----
 .../dpkg/dpkg/remove-tar-no-timestamp.patch   | 24 ++++++----
 .../dpkg/{dpkg_1.22.21.bb => dpkg_1.23.5.bb}  |  4 +-
 8 files changed, 148 insertions(+), 97 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.21.bb => dpkg_1.23.5.bb} (92%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 185bbb90f1..1660597422 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,6 +1,6 @@
-From 067992f2d0b0ff6ca114031636eb0e1eac791892 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
-Date: Tue, 16 Jun 2020 03:57:25 +0000
+From 5014728695639f33895feff9cabad199b0612c45 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@microsoft.com>
+Date: Sun, 8 Feb 2026 21:34:54 -0800
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
 
 When running do_package_write_deb, we have trees of hardlinked files
@@ -23,30 +23,36 @@ Upstream-Status: Inappropriate [OE specific]
 Original patch by RP 2015/3/27, rebased by Paul Eggleton
 
 Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
+
+Rebase to 1.23.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  src/deb/build.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 87bd4142e..e85fd7d0f 100644
+index f7a0156f1..67e758185 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -481,6 +481,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -526,6 +526,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
-   int pipe_filenames[2], pipe_tarball[2];
-   pid_t pid_tar, pid_comp;
-+  int rc;
+ 	int pipe_filenames[2], pipe_tarball[2];
+ 	pid_t pid_tar, pid_comp;
++	int rc;
  
-   /* Fork off a tar. We will feed it a list of filenames on stdin later. */
-   m_pipe(pipe_filenames);
-@@ -533,7 +534,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
-   /* All done, clean up wait for tar and <compress> to finish their job. */
-   close(pipe_filenames[1]);
-   subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
--  subproc_reap(pid_tar, "tar -cf", 0);
-+  rc = subproc_reap(pid_tar, "tar -cf", SUBPROC_RETERROR);
-+  if (rc && rc != 1)
-+    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
+ 	/* Fork off a tar. We will feed it a list of filenames on stdin
+ 	 * later. */
+@@ -591,7 +592,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+ 	 * job. */
+ 	close(pipe_filenames[1]);
+ 	subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
+-	subproc_reap(pid_tar, "tar -cf", 0);
++	rc = subproc_reap(pid_tar, "tar -cf", SUBPROC_RETERROR);
++	if (rc && rc != 1)
++		ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
  }
  
  static intmax_t
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
index d0459cd017..ffa10142dd 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
@@ -1,6 +1,6 @@
-From 5e5f06d396fe631990474ba6df83428987855365 Mon Sep 17 00:00:00 2001
+From 756513b01ba2d4f0ecfc95955dbe598591ad2d9e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Aug 2015 16:25:45 +0300
+Date: Sun, 8 Feb 2026 21:17:43 -0800
 Subject: [PATCH] script.c: avoid use of chroot
 
 Our pre/postinsts expect $D to be set when running in a sysroot and
@@ -17,22 +17,25 @@ KKang 2019/02/20
 Refresh to apply on top of v1.22.10.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
+Rebase to 1.23.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/main/script.c | 52 +++--------------------------------------------
- 1 file changed, 3 insertions(+), 49 deletions(-)
+ src/main/script.c | 56 +++--------------------------------------------
+ 1 file changed, 3 insertions(+), 53 deletions(-)
 
 diff --git a/src/main/script.c b/src/main/script.c
-index e9aee0bf9..181e7c710 100644
+index dd3f3a4bb..9782d0140 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
-@@ -97,57 +97,11 @@ static const char *
+@@ -99,60 +99,10 @@ static const char *
  maintscript_pre_exec(struct command *cmd)
  {
  	const char *instdir = dpkg_fsys_get_dir();
 -	const char *admindir = dpkg_db_get_dir();
 -	const char *changedir;
 -	size_t instdirlen = strlen(instdir);
- 
+-
 -	if (instdirlen > 0 && in_force(FORCE_SCRIPT_CHROOTLESS))
 -		changedir = instdir;
 -	else
@@ -54,12 +57,14 @@ index e9aee0bf9..181e7c710 100644
 -			         "directory with --force-not-root, consider "
 -			         "using --force-script-chrootless?"));
 -		else if (rc)
--			ohshite(_("failed to chroot to '%.250s'"), instdir);
+-			ohshite(_("failed to chroot to '%s'"), instdir);
 -	}
+-
 -	/* Switch to a known good directory to give the maintainer script
 -	 * a saner environment, also needed after the chroot(). */
 -	if (chdir(changedir))
--		ohshite(_("failed to chdir to '%.255s'"), changedir);
+-		ohshite(_("failed to chdir to '%s'"), changedir);
+-
 -	if (debug_has_flag(dbg_scripts)) {
 -		struct varbuf args = VARBUF_INIT;
 -		const char **argv = cmd->argv;
@@ -68,12 +73,13 @@ index e9aee0bf9..181e7c710 100644
 -			varbuf_add_char(&args, ' ');
 -			varbuf_add_str(&args, *argv);
 -		}
--		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
--		      varbuf_str(&args));
+-		debug(dbg_scripts, "fork/exec %s (%s )",
+-		      cmd->filename, varbuf_str(&args));
 -		varbuf_destroy(&args);
-+        if (*instdir) {
-+                setenv("D", instdir, 1);
++	if (*instdir) {
++		setenv("D", instdir, 1);
  	}
+-
 -	if (instdirlen == 0 || in_force(FORCE_SCRIPT_CHROOTLESS))
 -		return cmd->filename;
 -
@@ -86,3 +92,6 @@ index e9aee0bf9..181e7c710 100644
  }
  
  /**
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index a5c80773a5..a4f0eb7d82 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -1,6 +1,6 @@
-From 6e88e8b7b6924751112966f329525956735de9b4 Mon Sep 17 00:00:00 2001
+From 3d27ccbc3409c473a4acba56df15e6b7e71f83fb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Aug 2015 16:16:16 +0300
+Date: Sun, 8 Feb 2026 21:11:56 -0800
 Subject: [PATCH] Adapt to linux-wrs kernel version, which has character '_'
  inside. Remove the first-char-digit-check (as the 1.15.8.5 version does).
 
@@ -8,28 +8,38 @@ Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 Upstream-Status: Inappropriate [embedded specific]
+
+Rebase to 1.23.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  lib/dpkg/parsehelp.c | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index a999b5e78..7be0378ab 100644
+index 307b7705a..82713c008 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
-@@ -291,14 +291,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
-   ptr = rversion->version;
-   if (!*ptr)
-     return dpkg_put_error(err, _("version number is empty"));
--  if (!c_isdigit(*ptr++))
--    return dpkg_put_warn(err, _("version number does not start with digit"));
-   for (; *ptr; ptr++) {
--    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~:", *ptr) == NULL)
-+    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~:_", *ptr) == NULL)
-       return dpkg_put_warn(err, _("invalid character in version number"));
-   }
-   for (ptr = rversion->revision; *ptr; ptr++) {
--    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".+~", *ptr) == NULL)
-+    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
-       return dpkg_put_warn(err, _("invalid character in revision number"));
-   }
+@@ -303,18 +303,16 @@ parseversion(struct dpkg_version *rversion, const char *string,
+ 	ptr = rversion->version;
+ 	if (!*ptr)
+ 		return dpkg_put_error(err, _("version number is empty"));
+-	if (!c_isdigit(*ptr++))
+-		return dpkg_put_warn(err, _("version number does not start with digit"));
+ 	for (; *ptr; ptr++) {
+ 		if (!c_isdigit(*ptr) &&
+ 		    !c_isalpha(*ptr) &&
+-		    strchr(".-+~:", *ptr) == NULL)
++		    strchr(".-+~:_", *ptr) == NULL)
+ 			return dpkg_put_warn(err, _("invalid character in version number"));
+ 	}
+ 	for (ptr = rversion->revision; *ptr; ptr++) {
+ 		if (!c_isdigit(*ptr) &&
+ 		    !c_isalpha(*ptr) &&
+-		    strchr(".+~", *ptr) == NULL)
++		    strchr(".-+~_", *ptr) == NULL)
+ 			return dpkg_put_warn(err, _("invalid character in revision number"));
+ 	}
  
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
index e49d54152c..9e063fa961 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -1,27 +1,34 @@
-From 0fc90a3ed01a7fce34de925979460638b8a57402 Mon Sep 17 00:00:00 2001
+From 541260d2d954d53b2fddd20863cf473d53017de2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Aug 2015 16:27:45 +0300
+Date: Sun, 8 Feb 2026 21:21:43 -0800
 Subject: [PATCH] The lutimes function doesn't work properly for all systems.
 
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 Upstream-Status: Inappropriate [embedded specific]
+
+Rebase to 1.23.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  src/main/archives.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/main/archives.c b/src/main/archives.c
-index d7279e1f5..f9c6facc9 100644
+index b5c6f0356..6db2c712c 100644
 --- a/src/main/archives.c
 +++ b/src/main/archives.c
-@@ -490,8 +490,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
+@@ -526,9 +526,10 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
  
-   if (te->type == TAR_FILETYPE_SYMLINK) {
+ 	if (te->type == TAR_FILETYPE_SYMLINK) {
  #ifdef HAVE_LUTIMES
--    if (lutimes(path, tv) && errno != ENOSYS)
-+/*    if (lutimes(path, tv) && errno != ENOSYS)
-       ohshite(_("error setting timestamps of '%.255s'"), path);
+-		if (lutimes(path, tv) && errno != ENOSYS)
++/*		if (lutimes(path, tv) && errno != ENOSYS)
+ 			ohshite(_("error setting timestamps of '%s'"),
+ 			        path);
 +*/
  #endif
-   } else {
-     if (utimes(path, tv))
+ 	} else {
+ 		if (utimes(path, tv))
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index ded1707dfd..6d39e43c5f 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -1,7 +1,9 @@
-From 20ba7fd8939e97bec3d70a67c0aac76ddc67898d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Tue, 21 Feb 2017 11:23:27 -0600
+From 5c9c44274ecf0e704e1aadb1001d6df9f3ce403a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 8 Feb 2026 21:25:06 -0800
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
+ MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
+ Content-Transfer-Encoding: 8bit
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -22,20 +24,25 @@ Upstream-Status: Inappropriate [Configuration]
 Update patch context for dpkg 1.19.4.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase to 1.23.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/deb/build.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/deb/build.c | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index a418dd122..87bd4142e 100644
+index 259c6251c..f7a0156f1 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -504,7 +504,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
- 
-     command_init(&cmd, TAR, "tar -cf");
-     command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
--                           "--mtime", mtime, "--clamp-mtime", NULL);
-+                           "--mtime", mtime, NULL);
-     /* Mode might become a positional argument, pass it before -T. */
-     if (options->mode)
-       command_add_args(&cmd, "--mode", options->mode, NULL);
+@@ -553,7 +553,6 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+ 		                 "-cf", "-",
+ 		                 "--format=gnu",
+ 		                 "--mtime", mtime,
+-		                 "--clamp-mtime",
+ 		                 NULL);
+ 		/* Mode might become a positional argument, pass it
+ 		 * before -T. */
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index b5a29231dd..676e0956cc 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,6 +1,6 @@
-From 812dbb64f2805a3257ef9c9a61abbd10e0b3a08c Mon Sep 17 00:00:00 2001
+From 961482eef79e90f9be6f60f48a063b66221a8ea1 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
-Date: Mon, 26 Aug 2013 23:38:45 +0000
+Date: Sun, 8 Feb 2026 21:06:44 -0800
 Subject: [PATCH] dpkg: fix configuration issue for mips64
 
 configure cannot determine the proper cpu, os, or
@@ -11,21 +11,27 @@ release from upstream.  We remove that code.
 Upstream-Status: Inappropriate [not a debian architecture]
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
+
+Rebase to 1.23.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  scripts/Dpkg/Arch.pm | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
-index 0d352eeb9..4ef5fa307 100644
+index 3d9e3e975..05c6debc3 100644
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
-@@ -326,9 +326,6 @@ sub _load_tupletable()
- 		    (my $dt = $debtuple) =~ s/<cpu>/$_cpu/;
- 		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
+@@ -326,9 +326,6 @@ sub _load_tupletable
+                     (my $dt = $debtuple) =~ s/<cpu>/$_cpu/;
+                     (my $da = $debarch) =~ s/<cpu>/$_cpu/;
  
--		    next if exists $debarch_to_debtuple{$da}
--		         or exists $debtuple_to_debarch{$dt};
+-                    next if exists $debarch_to_debtuple{$da}
+-                         or exists $debtuple_to_debarch{$dt};
 -
- 		    $debarch_to_debtuple{$da} = $dt;
- 		    $debtuple_to_debarch{$dt} = $da;
- 		}
+                     $debarch_to_debtuple{$da} = $dt;
+                     $debtuple_to_debarch{$dt} = $da;
+                 }
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index d3a1a13098..754b4fef17 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,25 +1,31 @@
-From 7d69de114aa696cfb5e31b491a657ca6b6cbbbd5 Mon Sep 17 00:00:00 2001
+From a559247b71ce44978b7dc49a6fdb51167e22c0bf Mon Sep 17 00:00:00 2001
 From: Constantin Musca <constantinx.musca@intel.com>
-Date: Tue, 28 Aug 2012 17:02:40 +0300
+Date: Sun, 8 Feb 2026 21:03:30 -0800
 Subject: [PATCH] busybox-1.19.4 tar utility doesn't support
  --warning=no-timestamp
 
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 Upstream-Status: Inappropriate [configuration]
+
+Rebase to 1.23.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  src/deb/extract.c | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/src/deb/extract.c b/src/deb/extract.c
-index 08b281564..c35a182ee 100644
+index e0234726a..e153f72ab 100644
 --- a/src/deb/extract.c
 +++ b/src/deb/extract.c
-@@ -338,7 +338,6 @@ extracthalf(const char *debar, const char *dir,
+@@ -353,7 +353,6 @@ extracthalf(const char *debar, const char *dir,
  
-       command_add_arg(&cmd, "-f");
-       command_add_arg(&cmd, "-");
--      command_add_arg(&cmd, "--warning=no-timestamp");
+ 			command_add_arg(&cmd, "-f");
+ 			command_add_arg(&cmd, "-");
+-			command_add_arg(&cmd, "--warning=no-timestamp");
  
-       m_dup2(p2[0],0);
-       close(p2[0]);
+ 			m_dup2(p2[0], 0);
+ 			close(p2[0]);
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb
similarity index 92%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.23.5.bb
index 20f98d5d2d..1d8dd66efa 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.x;tag=${PV} \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main;tag=${PV} \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -19,4 +19,4 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "d72b038fd2113cb62972e4071db03dd1388394d8"
+SRCREV = "89f266325cc8b5b7fd1ee417b78d498ee189565b"
-- 
2.34.1


