Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0409C5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 10:43:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35434.1749379398945834651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 03:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82543c27de=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AaXsF011162
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jun 2025 10:43:18 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2gx4h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 10:43:17 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 8 Jun 2025 03:43:16 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 8 Jun 2025 03:43:16 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/1] rpm: 4.20.0 -> 4.20.1
Date: Sun, 8 Jun 2025 03:43:10 -0700
Message-ID: <ac979fa2e300f8fb8e4f60fddcad4d299741ab33.1749379320.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749379320.git.liezhi.yang@windriver.com>
References: <cover.1749379320.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA4MiBTYWx0ZWRfX3RfwdGd4NnFo +49oisH09srpMTSMJ4yo2+wjv2bAbVVCKbJapi4RMvjnaXekWBKnW/yyZjanuCt6u2GORvfs8eZ BtxkjQtTuSTWFRF7ETdPOC7AIMriL4a8Hl7JF0k/hm7TY6dPAzxCCBFemoWmMyKjFTtVkR6mlGl
 fqOFJiRhwv5Dj6G7rlKkxaB/de/NDH6n3EN52t6jBxQBwjO3PEEbqJ9J0heEnMlQRa1iPRA8geF dMBMl8NW64LovZy92t9z1GZiUy64wrgP3B44krUz7Z3SOOYKgsOcdsJjf4Pjdsl5XK3dnpx4lX7 px+9QqMLQu0S7tRRAe5gDykpwOgmc8nR9pJ4/A+LVAajZS6jKtQxPFKuPh9qI5zCKdtB1E8us7Q
 ekxc+mOM9gl4tGL/eVG4cG/unpILaJEQGCQNmWsMEog+81QqQcX6uavcmzULACdNtTI8ufRT
X-Proofpoint-GUID: 6cTcB6tzTZehFDLOBvyl9K5fEsZQEOvP
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=68456945 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=GMGn13PZAAAA:8 a=t7CeM3EgAAAA:8 a=3-RhneuVAAAA:8 a=pGLkceISAAAA:8
 a=CU40TeTXKAPYOMNMpAcA:9 a=wxvppFuCgQlQCyos:21 a=jIF0orF5dxDFSsn8Ms5I:22 a=FdTzh2GWekK77mhwV6Dw:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 6cTcB6tzTZehFDLOBvyl9K5fEsZQEOvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506080082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 10:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218210

From: Robert Yang <liezhi.yang@windriver.com>

* Rebased:
  0001-When-cross-installing-execute-package-scriptlets-wit.patch
  0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch

* Removed the one which already merged:
  0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch

* Added a patch to fix rpm-native build error:
  gcc: error: unrecognized command-line option -fhardened
  0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch

* License-Update: Minor formatting changes as the commit messages said in
  41143b27b6f7320f280aea6014e8f532eb0239d6

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 58 +++++++++++++++++++
 ...LUGINDIR-in-top-level-CMakeLists.txt.patch | 57 ------------------
 ...lling-execute-package-scriptlets-wit.patch | 24 ++++----
 ...ge-logging-level-around-scriptlets-t.patch | 27 +++++----
 .../rpm/{rpm_4.20.0.bb => rpm_4.20.1.bb}      |  6 +-
 5 files changed, 89 insertions(+), 83 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.0.bb => rpm_4.20.1.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
new file mode 100644
index 0000000000..ed270a5704
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
@@ -0,0 +1,58 @@
+From 19f7ef341f19ac5594c7d0113f9eb8224934464a Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 8 Jun 2025 00:19:06 -0700
+Subject: [PATCH] CMakeLists.txt: Fix checking for CFLAGS
+
+The previous code doesn't work because the check_c_compiler_flag() only ran
+once because 'found' is in CACHE, here is log:
+-- Performing Test found
+-- Performing Test found - Success
+
+That would result in:
+* All the flags are added when the first one works
+* None of the flags is added when the first one doesn't work
+
+We can use "unset(found CACHE)" to fix that, but the log is still not clear:
+-- Performing Test found
+-- Performing Test found - Success
+-- Performing Test found
+-- Performing Test found - Success
+-- Performing Test found
+-- Performing Test found - Failed
+
+Use a new var SUPPORTS_${flag} will make it more clear:
+-- Performing Test SUPPORTS_-fno-strict-overflow
+-- Performing Test SUPPORTS_-fno-strict-overflow - Success
+-- Performing Test SUPPORTS_-fno-delete-null-pointer-checks
+-- Performing Test SUPPORTS_-fno-delete-null-pointer-checks - Success
+-- Performing Test SUPPORTS_-fhardened
+-- Performing Test SUPPORTS_-fhardened - Failed
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/3796]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ CMakeLists.txt | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 08e3e5274..a7566ab5a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -416,11 +416,10 @@ endif()
+ 
+ # try to ensure some compiler sanity and hardening options where supported
+ foreach (flag -fno-strict-overflow -fno-delete-null-pointer-checks -fhardened)
+-	check_c_compiler_flag(${flag} found)
+-	if (found)
++	check_c_compiler_flag(${flag} SUPPORTS_${flag})
++	if (SUPPORTS_${flag})
+ 		add_compile_options(${flag})
+ 	endif()
+-	unset(found)
+ endforeach()
+ 
+ # generated sources
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch b/meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch
deleted file mode 100644
index 5db69340ad..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2d6beb620896a59cfd685b51a19057e5c5c4ab41 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 19 Dec 2024 11:54:54 +0800
-Subject: [PATCH] Set RPM_PLUGINDIR in top level CMakeLists.txt
-
-We have in macros.in:
-  %__plugindir          @RPM_PLUGINDIR@
-
-This means, if RPM_PLUGINDIR is not set, %__plugindir will be empty.
-This in turn results in error message when running 'dnf'.
-
-e.g.,
-dnf --help >/dev/null
-error: /usr/lib64/rpm/macros: line 1183: Macro %__plugindir has empty body
-error: /usr/lib64/rpm/macros: line 1183: Macro %__plugindir has empty body
-
-So we should move this directory setting into the top level CMakeLists.txt.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/3496]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- CMakeLists.txt         | 3 +++
- plugins/CMakeLists.txt | 3 ---
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 758ba73f4..e694b9650 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -453,6 +453,9 @@ if (ENABLE_PYTHON)
- 	add_subdirectory(python)
- endif()
- 
-+set(RPM_PLUGINDIR ${CMAKE_INSTALL_FULL_LIBDIR}/rpm-plugins
-+       CACHE PATH "rpm plugin directory")
-+
- if (ENABLE_PLUGINS)
- 	add_subdirectory(plugins)
- endif()
-diff --git a/plugins/CMakeLists.txt b/plugins/CMakeLists.txt
-index a44056fe3..6e61a7c20 100644
---- a/plugins/CMakeLists.txt
-+++ b/plugins/CMakeLists.txt
-@@ -42,9 +42,6 @@ if (HAVE_UNSHARE)
- 	add_library(unshare MODULE unshare.c)
- endif()
- 
--set(RPM_PLUGINDIR ${CMAKE_INSTALL_FULL_LIBDIR}/rpm-plugins
--	CACHE PATH "rpm plugin directory")
--
- get_property(plugins DIRECTORY PROPERTY BUILDSYSTEM_TARGETS)
- foreach(plugin ${plugins})
- 	target_link_libraries(${plugin} PRIVATE librpmio librpm ${Intl_LIBRARIES})
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index fc6d7e0d29..b71156fe12 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -24,15 +24,18 @@ Amended 2018-07-03 by Olof Johansson <olofjn@axis.com>:
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 4.20.1
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- lib/rpmscript.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
+ lib/rpmscript.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 097c9055a..060fd8124 100644
+index eb14870b3..1785e8f30 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -447,8 +447,7 @@ exit:
+@@ -456,8 +456,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
      if (fn) {
@@ -42,18 +45,17 @@ index 097c9055a..060fd8124 100644
  	free(fn);
      }
      free(mline);
-@@ -482,7 +481,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+@@ -491,7 +490,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
--	    rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
 +	    if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") != NULL) {
-+		rpmChrootOut();
-+		rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
-+		rpmChrootIn();
++	    rpmChrootOut();
+ 	    rc = runExtScript(plugins, prefixes, script, lvl, scriptFd, &args, arg1, arg2);
++	    rpmChrootIn();
 +	    } else {
-+		rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
++	    rc = runExtScript(plugins, prefixes, script, lvl, scriptFd, &args, arg1, arg2);
 +	    }
  	} else {
- 	    rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
+ 	    rc = runLuaScript(plugins, prefixes, script, lvl, scriptFd, &args, arg1, arg2);
  	}
diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
index 278fa38bad..bac2d6331c 100644
--- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
+++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
@@ -9,15 +9,18 @@ irrelevant noise to rootfs logs.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 4.20.1
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
  lib/rpmscript.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 4dc6466a8..6d3c19d01 100644
+index e9f288ae0..f0c628708 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -290,7 +290,7 @@ static char * writeScript(const char *cmd, const char *script)
+@@ -299,7 +299,7 @@ static char * writeScript(const char *cmd, const char *script)
      if (Ferror(fd))
  	goto exit;
  
@@ -26,30 +29,30 @@ index 4dc6466a8..6d3c19d01 100644
  	static const char set_x[] = "set -x\n";
  	/* Assume failures will be caught by the write below */
  	Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
-@@ -322,7 +322,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+@@ -330,7 +330,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
      char *mline = NULL;
      rpmRC rc = RPMRC_FAIL;
  
--    rpmlog(RPMLOG_DEBUG, "%s: scriptlet start\n", sname);
-+    rpmlog(RPMLOG_INFO, "%s: scriptlet start\n", sname);
+-    rpmlog(RPMLOG_DEBUG, "%s: scriptlet start\n", script->descr);
++    rpmlog(RPMLOG_INFO, "%s: scriptlet start\n", script->descr);
  
-     if (script) {
- 	fn = writeScript(*argvp[0], script);
-@@ -374,7 +374,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
- 		sname, strerror(errno));
+     if (script->body) {
+ 	fn = writeScript(*argvp[0], script->body);
+@@ -382,7 +382,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+ 		script->descr, strerror(errno));
  	goto exit;
      } else if (pid == 0) {/* Child */
 -	rpmlog(RPMLOG_DEBUG, "%s: execv(%s) pid %d\n",
 +	rpmlog(RPMLOG_INFO, "%s: execv(%s) pid %d\n",
- 	       sname, *argvp[0], (unsigned)getpid());
+ 	       script->descr, *argvp[0], (unsigned)getpid());
  
  	fclose(in);
-@@ -417,7 +417,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+@@ -426,7 +426,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
  	reaped = waitpid(pid, &status, 0);
      } while (reaped == -1 && errno == EINTR);
  
 -    rpmlog(RPMLOG_DEBUG, "%s: waitpid(%d) rc %d status %x\n",
 +    rpmlog(RPMLOG_INFO, "%s: waitpid(%d) rc %d status %x\n",
- 	   sname, (unsigned)pid, (unsigned)reaped, status);
+ 	   script->descr, (unsigned)pid, (unsigned)reaped, status);
  
      if (reaped < 0) {
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_4.20.0.bb
rename to meta/recipes-devtools/rpm/rpm_4.20.1.bb
index bcc138dab0..4f40e8423f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -22,7 +22,7 @@ HOMEPAGE = "http://www.rpm.org"
 
 # libraries are also LGPL - how to express this?
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=066ecde17828e5c8911ec9eae8be78f4"
 
 SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protocol=https \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
@@ -38,11 +38,11 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
-           file://0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch \
+           file://0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch \
            "
 
 PE = "1"
-SRCREV = "b3323786668cf99bc9aed7e60ccdab0bc25e19da"
+SRCREV = "c8dc5ea575a2e9c1488036d12f4b75f6a5a49120"
 
 S = "${WORKDIR}/git"
 
-- 
2.49.0


