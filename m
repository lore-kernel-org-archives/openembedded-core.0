Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99807C87FC8
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 08:21:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35563.1753086083726510835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 01:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9297613b94=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L6F1011184179
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:21:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sh75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:21:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 21 Jul 2025 01:21:10 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 21 Jul 2025 01:21:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] bash: upgrade 5.2.37 -> 5.3
Date: Mon, 21 Jul 2025 16:21:01 +0800
Message-ID: <20250721082103.2262095-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250721082103.2262095-1-hongxu.jia@windriver.com>
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX8V37HrR/t0WO
 opjuZvenTp/xCqyXcXFhb3oekncu7omeC/FZk2IrhjfTzfs01D2wcNgkPLeoOTMq7EhEXYRjlKf
 Q8gw7/qYMgNuVHUY96THE/CjJoc/VcjEhD3d3H4dY+/x9PoE66/lJ2T8IAN2vUGMYn2GRG/IMs4
 2g42v5yGVgvNZeHRWfcSqoVb3rZ8/w29tefLnXUMFcJRI/Bx4ILauX3eoAWb18F+ajJEvxmmkvL
 43G913zNd0dcz8cuKaLbc0sVEIMs6DxOWDPkuR+cAQ/q3d1CWxGy4qaU4BhqZ93RQPO1ertPc3b
 yNw87a5ON8kAtmPg18CjhGsKi6g7T41lfRHmB9X8aWuL1CYc/o5Hyr8h08rpdeIHeZOuno5MklI
 VSe8o7De
X-Proofpoint-ORIG-GUID: jFK0CAxd-cU0kLrXwV5nAoy6tad_Y8WV
X-Proofpoint-GUID: jFK0CAxd-cU0kLrXwV5nAoy6tad_Y8WV
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687df883 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=fvaPMweRAAAA:8
 a=9Wbp7B8dAAAA:8 a=We0TN-cmsFUSj077Xg0A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=vJ2phfYHA-_bQipmD_nH:22 a=BESxJfN36ujmTJQqZ0Zq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 08:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220665

Refresh patch to 5.3
- mkbuiltins_have_stringize.patch

Drop backport patch
- 0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
- fix-filesubst-errexit.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...T-handler-while-waiting-for-a-child-.patch | 223 ------------------
 .../bash/bash/fix-filesubst-errexit.patch     |  31 ---
 .../bash/bash/mkbuiltins_have_stringize.patch |  24 +-
 .../bash/{bash_5.2.37.bb => bash_5.3.bb}      |   4 +-
 4 files changed, 17 insertions(+), 265 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
 rename meta/recipes-extended/bash/{bash_5.2.37.bb => bash_5.3.bb} (80%)

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
deleted file mode 100644
index 4e73edb9b3d..00000000000
--- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From e4b9493ae4923595ec3ca67f85322129fb3056cf Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Mon, 30 Oct 2023 12:16:07 -0400
-Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
- vertical whitespace after translating an integer
-
-Upstream-Status: Backport from
-[https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=fe24a6a55e8850298b496c5b9d82f1866eba190e]
-
-[Adjust and drop some codes to be applicable the tree]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- general.c         |  5 +++--
- jobs.c            | 24 ++++++++++++++++--------
- tests/redir.right |  4 ++--
- tests/redir11.sub |  2 ++
- tests/type.right  | 16 ++++++++--------
- tests/type.tests  | 24 ++++++++++++------------
- 6 files changed, 43 insertions(+), 32 deletions(-)
-
-diff --git a/general.c b/general.c
-index bda39f4..94a5339 100644
---- a/general.c
-+++ b/general.c
-@@ -264,8 +264,9 @@ legal_number (string, result)
-   if (errno || ep == string)
-     return 0;	/* errno is set on overflow or underflow */
- 
--  /* Skip any trailing whitespace, since strtoimax does not. */
--  while (whitespace (*ep))
-+  /* Skip any trailing whitespace, since strtoimax does not, using the same
-+     test that strtoimax uses for leading whitespace. */
-+  while (isspace ((unsigned char) *ep))
-     ep++;
- 
-   /* If *string is not '\0' but *ep is '\0' on return, the entire string
-diff --git a/jobs.c b/jobs.c
-index d3e4ab0..903cf9c 100644
---- a/jobs.c
-+++ b/jobs.c
-@@ -2718,6 +2718,10 @@ wait_for_background_pids (ps)
- #define INVALID_SIGNAL_HANDLER (SigHandler *)wait_for_background_pids
- static SigHandler *old_sigint_handler = INVALID_SIGNAL_HANDLER;
- 
-+/* The current SIGINT handler as set by restore_sigint_handler. Only valid
-+   immediately after restore_sigint_handler, used for continuations. */
-+static SigHandler *cur_sigint_handler = INVALID_SIGNAL_HANDLER;   
-+
- static int wait_sigint_received;
- static int child_caught_sigint;
- 
-@@ -2735,6 +2739,7 @@ wait_sigint_cleanup ()
- static void
- restore_sigint_handler ()
- {
-+  cur_sigint_handler = old_sigint_handler;
-   if (old_sigint_handler != INVALID_SIGNAL_HANDLER)
-     {
-       set_signal_handler (SIGINT, old_sigint_handler);
-@@ -2758,8 +2763,7 @@ wait_sigint_handler (sig)
-       restore_sigint_handler ();
-       /* If we got a SIGINT while in `wait', and SIGINT is trapped, do
- 	 what POSIX.2 says (see builtins/wait.def for more info). */
--      if (this_shell_builtin && this_shell_builtin == wait_builtin &&
--	  signal_is_trapped (SIGINT) &&
-+      if (signal_is_trapped (SIGINT) &&
- 	  ((sigint_handler = trap_to_sighandler (SIGINT)) == trap_handler))
- 	{
- 	  trap_handler (SIGINT);	/* set pending_traps[SIGINT] */
-@@ -2782,6 +2786,8 @@ wait_sigint_handler (sig)
-     {
-       set_exit_status (128+SIGINT);
-       restore_sigint_handler ();
-+      if (cur_sigint_handler == INVALID_SIGNAL_HANDLER)
-+	set_sigint_handler ();		/* XXX - only do this in one place */
-       kill (getpid (), SIGINT);
-     }
- 
-@@ -2926,11 +2932,13 @@ wait_for (pid, flags)
-     {
-       SigHandler *temp_sigint_handler;
- 
--      temp_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
--      if (temp_sigint_handler == wait_sigint_handler)
--	internal_debug ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
--      else
--	old_sigint_handler = temp_sigint_handler;
-+      temp_sigint_handler = old_sigint_handler;
-+      old_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
-+      if (old_sigint_handler == wait_sigint_handler)
-+	{
-+	  internal_debug ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
-+	  old_sigint_handler = temp_sigint_handler;
-+	}
-       waiting_for_child = 0;
-       if (old_sigint_handler == SIG_IGN)
- 	set_signal_handler (SIGINT, old_sigint_handler);
-@@ -4141,7 +4149,7 @@ set_job_status_and_cleanup (job)
- 		 SIGINT (if we reset the sighandler to the default).
- 		 In this case, we have to fix things up.  What a crock. */
- 	      if (temp_handler == trap_handler && signal_is_trapped (SIGINT) == 0)
--		  temp_handler = trap_to_sighandler (SIGINT);
-+		temp_handler = trap_to_sighandler (SIGINT);
- 	      restore_sigint_handler ();
- 	      if (temp_handler == SIG_DFL)
- 		termsig_handler (SIGINT);	/* XXX */
-diff --git a/tests/redir.right b/tests/redir.right
-index 8db1041..9e1403c 100644
---- a/tests/redir.right
-+++ b/tests/redir.right
-@@ -154,10 +154,10 @@ foo
- 1
- 7
- after: 42
--./redir11.sub: line 53: $(ss= declare -i ss): ambiguous redirect
-+./redir11.sub: line 55: $(ss= declare -i ss): ambiguous redirect
- after: 42
- a+=3
- foo
- foo
--./redir11.sub: line 75: 42: No such file or directory
-+./redir11.sub: line 77: 42: No such file or directory
- 42
-diff --git a/tests/redir11.sub b/tests/redir11.sub
-index d417cdb..ca9854c 100644
---- a/tests/redir11.sub
-+++ b/tests/redir11.sub
-@@ -34,6 +34,8 @@ a=4 b=7 ss=4 declare -i ss
- a=4 b=7 foo
- echo after: $a
- 
-+exec 7>&- 4>&-
-+
- unset a
- a=4 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 3'; }
- a=1 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 4'; }
-diff --git a/tests/type.right b/tests/type.right
-index bbc228e..c0c1c8b 100644
---- a/tests/type.right
-+++ b/tests/type.right
-@@ -24,15 +24,15 @@ func ()
- }
- while
- while is a shell keyword
--./type.tests: line 56: type: m: not found
--alias m='more'
--alias m='more'
--m is aliased to `more'
-+./type.tests: line 56: type: morealias: not found
-+alias morealias='more'
-+alias morealias='more'
-+morealias is aliased to `more'
- alias
--alias m='more'
--alias m='more'
--alias m='more'
--m is aliased to `more'
-+alias morealias='more'
-+alias morealias='more'
-+alias morealias='more'
-+morealias is aliased to `more'
- builtin
- builtin is a shell builtin
- /bin/sh
-diff --git a/tests/type.tests b/tests/type.tests
-index fd39c18..ddc1540 100644
---- a/tests/type.tests
-+++ b/tests/type.tests
-@@ -25,8 +25,6 @@ type -r ${THIS_SH}
- type notthere
- command -v notthere
- 
--alias m=more
--
- unset -f func 2>/dev/null
- func() { echo this is func; }
- 
-@@ -49,24 +47,26 @@ command -V func
- command -v while
- command -V while
- 
-+alias morealias=more
-+
- # the following two lines should produce the same output
- # post-3.0 patch makes command -v silent, as posix specifies
- # first test with alias expansion off (should all fail or produce no output)
--type -t m
--type m
--command -v m
-+type -t morealias
-+type morealias
-+command -v morealias
- alias -p
--alias m
-+alias morealias
- 
- # then test with alias expansion on 
- shopt -s expand_aliases
--type m
--type -t m
--command -v m
-+type morealias
-+type -t morealias
-+command -v morealias
- alias -p
--alias m
-+alias morealias
- 
--command -V m
-+command -V morealias
- shopt -u expand_aliases
- 
- command -v builtin
-@@ -76,7 +76,7 @@ command -V /bin/sh
- 
- unset -f func
- type func
--unalias m
-+unalias morealias
- type m
- 
- hash -r
diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
deleted file mode 100644
index c5082ee3558..00000000000
--- a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 16951b74971c7fd38fd036dac1410a9e53cbe736 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Fri, 7 Apr 2023 00:28:46 -0700
-Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
- enabled
-
-This is a trimmed-down version of a commit in the bash 'devel' branch
-[1] that contains this fix as well as other unrelated ones.
-
-[1] https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=ec9447ce9392a0f93d96789c3741285fede8a150
-
-Upstream-Status: Backport
-
-Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
----
- builtins/evalstring.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/builtins/evalstring.c b/builtins/evalstring.c
-index 53a7c0b..c5075cc 100644
---- a/builtins/evalstring.c
-+++ b/builtins/evalstring.c
-@@ -753,7 +753,7 @@ open_redir_file (r, fnp)
-   fd = open(fn, O_RDONLY);
-   if (fd < 0)
-     {
--      file_error (fn);
-+      internal_error ("%s: %s", fn, strerror (errno));
-       free (fn);
-       if (fnp)
- 	*fnp = 0;
diff --git a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
index eb29e7d836d..4ee754e32b9 100644
--- a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
+++ b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
@@ -1,6 +1,6 @@
-From d11685286144c2e5630545e435d11387b2908fd0 Mon Sep 17 00:00:00 2001
+From ed7515a5c07addaa3338a24efb36b74fbd1844dc Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
-Date: Wed, 14 Nov 2012 07:55:09 -0700
+Date: Mon, 21 Jul 2025 13:52:00 +0800
 Subject: [PATCH] bash: fix mkbuiltins build failure
 
 On hosts with FORTIFY_SOURCES, stringize support is required, as it's used by
@@ -18,19 +18,27 @@ stringize support, or to not define STRING() at all when FORTIFY_SOURCES is
 defined, letting the unistd.h one be used, instead.
 
 Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+Rebase to 5.3
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  builtins/mkbuiltins.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
-index f505ebd..b5b2eed 100644
+index c4cacdf..05d1db1 100644
 --- a/builtins/mkbuiltins.c
 +++ b/builtins/mkbuiltins.c
-@@ -28,6 +28,7 @@
- #  define HAVE_STDLIB_H
- 
- #  define HAVE_RENAME
-+#  define HAVE_STRINGIZE
+@@ -24,6 +24,7 @@
+ #else	/* CROSS_COMPILING */
+ /* A conservative set of defines based on POSIX/SUS3/XPG6 */
+ #  include <buildconf.h>
++# define HAVE_STRINGIZE
  #endif /* CROSS_COMPILING */
  
  #if defined (HAVE_UNISTD_H)
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-extended/bash/bash_5.3.bb
similarity index 80%
rename from meta/recipes-extended/bash/bash_5.2.37.bb
rename to meta/recipes-extended/bash/bash_5.3.bb
index 2c0645cbd9a..c241ea6d3b7 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.3.bb
@@ -11,11 +11,9 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://run-ptest \
            file://run-bash-ptests \
            file://fix-run-builtins.patch \
-           file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
-           file://fix-filesubst-errexit.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff"
+SRC_URI[tarball.sha256sum] = "62dd49c44c399ed1b3f7f731e87a782334d834f08e098a35f2c87547d5dbb269"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.34.1


