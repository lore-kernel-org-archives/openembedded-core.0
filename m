Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59034C5474A
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.131101.1723748334631610325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GPiQIQVZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZgrKH8Nq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019157683be0-9a48db5c-024c-4f91-a59c-216cc3571c1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wQFOzP/NeKgNN33SflEMrDlK29ci3JZ5VAQy01vgR/0=;
	b=GPiQIQVZqSC2kr7q79K0R03w9uM4dk3xm8g7/VbP597VFhHO/L1MZOEWMPYvjqHw
	PLd0q6+3Zbi+ctbvJASQpO/LhjjVtuNMfXdRdPqUClqwl6+Pretn8fGmzIcpdpkV+vm
	jjXSJFdKnzKUjLWn+WJ2faapL2V07NHL583mPDRs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wQFOzP/NeKgNN33SflEMrDlK29ci3JZ5VAQy01vgR/0=;
	b=ZgrKH8Nq7ZrUpZFIaxvCzUWg1ZKbUjFGkipec2JecwjUGVdB4bcmtGbnhqBRG4E+
	Fja1Hdvyst8w9F67syokkBN37bO/4Ixy35tawTP63Wus7Z5S1un7KBmgjJHR++8eV4/
	fKpfA5BWv4qZLDZVbp9DFLsFBLqOcItk1VZNerBM=
Content-Type: multipart/mixed; boundary="===============9184265154314933618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bash: upgrading to 5.2.32 SUCCEEDED
Message-ID: <0101019157683be0-9a48db5c-024c-4f91-a59c-216cc3571c1c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203407

--===============9184265154314933618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bash* to *5.2.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bash-upgrade-5.2.21-5.2.32.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d69278c92e76bf5938c71f6b68bf56e203e98d33 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 13:09:58 +0000
Subject: [PATCH] bash: upgrade 5.2.21 -> 5.2.32

---
 ...T-handler-while-waiting-for-a-child-.patch | 21 ++++++++-----------
 .../bash/bash/0001-fix-c99.patch              |  2 +-
 .../bash/bash/build-tests.patch               |  7 +++----
 .../bash/bash/fix-filesubst-errexit.patch     |  7 ++-----
 .../bash/bash/fix-run-builtins.patch          |  9 +++-----
 .../bash/bash/mkbuiltins_have_stringize.patch | 18 ++++++++++++----
 .../bash/bash/test-output.patch               | 11 ++++------
 .../bash/bash/use_aclocal.patch               |  3 +--
 .../bash/{bash_5.2.21.bb => bash_5.2.32.bb}   |  2 +-
 9 files changed, 38 insertions(+), 42 deletions(-)
 rename meta/recipes-extended/bash/{bash_5.2.21.bb => bash_5.2.32.bb} (90%)

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
index 77d770b364..4e73edb9b3 100644
--- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -1,4 +1,4 @@
-From 721d5be99eb37d31e48bd66d61808a66a4c5ab84 Mon Sep 17 00:00:00 2001
+From e4b9493ae4923595ec3ca67f85322129fb3056cf Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Mon, 30 Oct 2023 12:16:07 -0400
 Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
@@ -20,10 +20,10 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
  6 files changed, 43 insertions(+), 32 deletions(-)
 
 diff --git a/general.c b/general.c
-index 85c5a8b6..65e2ee06 100644
+index bda39f4..94a5339 100644
 --- a/general.c
 +++ b/general.c
-@@ -262,8 +262,9 @@ legal_number (string, result)
+@@ -264,8 +264,9 @@ legal_number (string, result)
    if (errno || ep == string)
      return 0;	/* errno is set on overflow or underflow */
  
@@ -36,7 +36,7 @@ index 85c5a8b6..65e2ee06 100644
  
    /* If *string is not '\0' but *ep is '\0' on return, the entire string
 diff --git a/jobs.c b/jobs.c
-index 6b986ed7..262d78de 100644
+index d3e4ab0..903cf9c 100644
 --- a/jobs.c
 +++ b/jobs.c
 @@ -2718,6 +2718,10 @@ wait_for_background_pids (ps)
@@ -96,7 +96,7 @@ index 6b986ed7..262d78de 100644
        waiting_for_child = 0;
        if (old_sigint_handler == SIG_IGN)
  	set_signal_handler (SIGINT, old_sigint_handler);
-@@ -4136,7 +4144,7 @@ set_job_status_and_cleanup (job)
+@@ -4141,7 +4149,7 @@ set_job_status_and_cleanup (job)
  		 SIGINT (if we reset the sighandler to the default).
  		 In this case, we have to fix things up.  What a crock. */
  	      if (temp_handler == trap_handler && signal_is_trapped (SIGINT) == 0)
@@ -106,7 +106,7 @@ index 6b986ed7..262d78de 100644
  	      if (temp_handler == SIG_DFL)
  		termsig_handler (SIGINT);	/* XXX */
 diff --git a/tests/redir.right b/tests/redir.right
-index 8db10414..9e1403c8 100644
+index 8db1041..9e1403c 100644
 --- a/tests/redir.right
 +++ b/tests/redir.right
 @@ -154,10 +154,10 @@ foo
@@ -123,7 +123,7 @@ index 8db10414..9e1403c8 100644
 +./redir11.sub: line 77: 42: No such file or directory
  42
 diff --git a/tests/redir11.sub b/tests/redir11.sub
-index d417cdb6..ca9854cd 100644
+index d417cdb..ca9854c 100644
 --- a/tests/redir11.sub
 +++ b/tests/redir11.sub
 @@ -34,6 +34,8 @@ a=4 b=7 ss=4 declare -i ss
@@ -136,7 +136,7 @@ index d417cdb6..ca9854cd 100644
  a=4 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 3'; }
  a=1 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 4'; }
 diff --git a/tests/type.right b/tests/type.right
-index bbc228e8..e0a66745 100644
+index bbc228e..c0c1c8b 100644
 --- a/tests/type.right
 +++ b/tests/type.right
 @@ -24,15 +24,15 @@ func ()
@@ -164,7 +164,7 @@ index bbc228e8..e0a66745 100644
  builtin is a shell builtin
  /bin/sh
 diff --git a/tests/type.tests b/tests/type.tests
-index fd39c18a..ddc15407 100644
+index fd39c18..ddc1540 100644
 --- a/tests/type.tests
 +++ b/tests/type.tests
 @@ -25,8 +25,6 @@ type -r ${THIS_SH}
@@ -221,6 +221,3 @@ index fd39c18a..ddc15407 100644
  type m
  
  hash -r
--- 
-2.35.5
-
diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
index aa810f7d4e..abd83d09af 100644
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -1,4 +1,4 @@
-From e9ed388e760ec33dcf9e72c639946c0d0abeec26 Mon Sep 17 00:00:00 2001
+From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 19 Jun 2024 12:57:39 +0000
 Subject: [PATCH] Fix C99 problems
diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index c1b9b8261f..4cce1ba993 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -1,4 +1,4 @@
-From 318b762837c2ad25319caeaf0320eff613b64daf Mon Sep 17 00:00:00 2001
+From c3f58f8b4f7a359b9d9dd97a45bcaab50a89d224 Mon Sep 17 00:00:00 2001
 From: Anders Roxell <anders.roxell@enea.com>
 Date: Wed, 19 Dec 2012 17:18:31 +0100
 Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without checking
@@ -9,16 +9,15 @@ Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 
 Rebase to 5.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  Makefile.in | 24 +++++++++++++++++++-----
  1 file changed, 19 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index bc97049..937ce39 100644
+index 0b4df73..7e2a34e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -943,20 +943,34 @@ maybe-clean:
+@@ -958,20 +958,34 @@ maybe-clean:
  	fi
  
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
index 60f1852316..c5082ee355 100644
--- a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
+++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
@@ -1,4 +1,4 @@
-From 59ddfda14e3c9aa6286bb4c4c0748f7c1324a65a Mon Sep 17 00:00:00 2001
+From 16951b74971c7fd38fd036dac1410a9e53cbe736 Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Fri, 7 Apr 2023 00:28:46 -0700
 Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
@@ -17,7 +17,7 @@ Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/builtins/evalstring.c b/builtins/evalstring.c
-index df3dd68e2a7e..6612081cd646 100644
+index 53a7c0b..c5075cc 100644
 --- a/builtins/evalstring.c
 +++ b/builtins/evalstring.c
 @@ -753,7 +753,7 @@ open_redir_file (r, fnp)
@@ -29,6 +29,3 @@ index df3dd68e2a7e..6612081cd646 100644
        free (fn);
        if (fnp)
  	*fnp = 0;
--- 
-2.40.0
-
diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
index 2fa388302e..05d0859821 100644
--- a/meta/recipes-extended/bash/bash/fix-run-builtins.patch
+++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
@@ -1,4 +1,4 @@
-From 0c4cab9594c96c2dc435a8d9724605824bcbf917 Mon Sep 17 00:00:00 2001
+From 15601c71b073a604ccda25c7f14f0bb12e9a3b28 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 19 Apr 2016 02:57:45 -0400
 Subject: [PATCH] fix run-builtins failed
@@ -16,10 +16,10 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/builtins.tests b/tests/builtins.tests
-index 9d77520..63f3af8 100644
+index 8eee43e..71c9eee 100644
 --- a/tests/builtins.tests
 +++ b/tests/builtins.tests
-@@ -109,7 +109,7 @@ esac
+@@ -124,7 +124,7 @@ esac
  
  # test options to exec
  (exec -a specialname ${THIS_SH} -c 'echo $0' )
@@ -28,6 +28,3 @@ index 9d77520..63f3af8 100644
  # test `clean' environment.  if /bin/sh is bash, and the script version of
  # printenv is run, there will be variables in the environment that bash
  # sets on startup.  Also test code that prefixes argv[0] with a dash.
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
index a9391d6cac..eb29e7d836 100644
--- a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
+++ b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
@@ -1,3 +1,8 @@
+From d11685286144c2e5630545e435d11387b2908fd0 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Wed, 14 Nov 2012 07:55:09 -0700
+Subject: [PATCH] bash: fix mkbuiltins build failure
+
 On hosts with FORTIFY_SOURCES, stringize support is required, as it's used by
 the macros to wrap functions (e.g. read and open in unistd.h). Those wrappers
 use the STRING() macro from unistd.h. A header in the bash sources overrides
@@ -13,14 +18,19 @@ stringize support, or to not define STRING() at all when FORTIFY_SOURCES is
 defined, letting the unistd.h one be used, instead.
 
 Upstream-Status: Pending
+---
+ builtins/mkbuiltins.c | 1 +
+ 1 file changed, 1 insertion(+)
 
---- bash-4.2.orig/builtins/mkbuiltins.c
-+++ bash-4.2/builtins/mkbuiltins.c
+diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
+index f505ebd..b5b2eed 100644
+--- a/builtins/mkbuiltins.c
++++ b/builtins/mkbuiltins.c
 @@ -28,6 +28,7 @@
  #  define HAVE_STDLIB_H
-
+ 
  #  define HAVE_RENAME
 +#  define HAVE_STRINGIZE
  #endif /* CROSS_COMPILING */
-
+ 
  #if defined (HAVE_UNISTD_H)
diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/recipes-extended/bash/bash/test-output.patch
index 0ffcc24587..3225907b66 100644
--- a/meta/recipes-extended/bash/bash/test-output.patch
+++ b/meta/recipes-extended/bash/bash/test-output.patch
@@ -1,7 +1,7 @@
-From 28eb06047ebd2deaa8c7cd2bf6655ef6a469dc14 Mon Sep 17 00:00:00 2001
+From f5cbd5a4954b89857c9e397cacceda552484f5d5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 10:01:56 +0800
-Subject: [PATCH 1/2] Add FAIL/PASS output to test output.
+Subject: [PATCH] Add FAIL/PASS output to test output.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/tests/run-all b/tests/run-all
-index 2882fe0..e21d026 100644
+index 1f74923..ba36a1f 100644
 --- a/tests/run-all
 +++ b/tests/run-all
-@@ -33,7 +33,16 @@ do
+@@ -57,7 +57,16 @@ do
  	case $x in
  	$0|run-minimal|run-gprof)	;;
  	*.orig|*~) ;;
@@ -37,6 +37,3 @@ index 2882fe0..e21d026 100644
  	esac
  done
  
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/recipes-extended/bash/bash/use_aclocal.patch
index bd6870b386..e966b037a2 100644
--- a/meta/recipes-extended/bash/bash/use_aclocal.patch
+++ b/meta/recipes-extended/bash/bash/use_aclocal.patch
@@ -1,4 +1,4 @@
-From d1bf23817afffd5917b74da6946e0c3b7e63e336 Mon Sep 17 00:00:00 2001
+From b3a64702fa1978463c01bd5d9fe711e4628aba1e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 28 Dec 2020 21:04:27 +0100
 Subject: [PATCH] bash: update 5.0 -> 5.1
@@ -9,7 +9,6 @@ as needed instead making it work like other autotools based projects.
 
 Upstream-Status: Inappropriate [OE configuration specific]
 RP 2021/1/20
-
 ---
  configure.ac | 43 -------------------------------------------
  1 file changed, 43 deletions(-)
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.32.bb
similarity index 90%
rename from meta/recipes-extended/bash/bash_5.2.21.bb
rename to meta/recipes-extended/bash/bash_5.2.32.bb
index ccfe5c47a7..b159c0232f 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.32.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://0001-fix-c99.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
+SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.44.0


--===============9184265154314933618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-upgrade-5.2.21-5.2.32.patch"

RnJvbSBkNjkyNzhjOTJlNzZiZjU5MzhjNzFmNmI2OGJmNTZlMjAzZTk4ZDMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTM6MDk6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXNoOiB1cGdyYWRlIDUuMi4yMSAtPiA1LjIuMzIKCi0tLQogLi4uVC1oYW5kbGVyLXdoaWxlLXdh
aXRpbmctZm9yLWEtY2hpbGQtLnBhdGNoIHwgMjEgKysrKysrKystLS0tLS0tLS0tLQogLi4uL2Jh
c2gvYmFzaC8wMDAxLWZpeC1jOTkucGF0Y2ggICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9iYXNo
L2Jhc2gvYnVpbGQtdGVzdHMucGF0Y2ggICAgICAgICAgICAgICB8ICA3ICsrKy0tLS0KIC4uLi9i
YXNoL2Jhc2gvZml4LWZpbGVzdWJzdC1lcnJleGl0LnBhdGNoICAgICB8ICA3ICsrLS0tLS0KIC4u
Li9iYXNoL2Jhc2gvZml4LXJ1bi1idWlsdGlucy5wYXRjaCAgICAgICAgICB8ICA5ICsrKy0tLS0t
CiAuLi4vYmFzaC9iYXNoL21rYnVpbHRpbnNfaGF2ZV9zdHJpbmdpemUucGF0Y2ggfCAxOCArKysr
KysrKysrKystLS0tCiAuLi4vYmFzaC9iYXNoL3Rlc3Qtb3V0cHV0LnBhdGNoICAgICAgICAgICAg
ICAgfCAxMSArKysrLS0tLS0tCiAuLi4vYmFzaC9iYXNoL3VzZV9hY2xvY2FsLnBhdGNoICAgICAg
ICAgICAgICAgfCAgMyArLS0KIC4uLi9iYXNoL3tiYXNoXzUuMi4yMS5iYiA9PiBiYXNoXzUuMi4z
Mi5iYn0gICB8ICAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDQyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL3tiYXNoXzUuMi4y
MS5iYiA9PiBiYXNoXzUuMi4zMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvYmFzaC9iYXNoLzAwMDEtY2hhbmdlcy10by1TSUdJTlQtaGFuZGxlci13aGlsZS13
YWl0aW5nLWZvci1hLWNoaWxkLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jh
c2gvMDAwMS1jaGFuZ2VzLXRvLVNJR0lOVC1oYW5kbGVyLXdoaWxlLXdhaXRpbmctZm9yLWEtY2hp
bGQtLnBhdGNoCmluZGV4IDc3ZDc3MGIzNjQuLjRlNzNlZGI5YjMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvMDAwMS1jaGFuZ2VzLXRvLVNJR0lOVC1oYW5kbGVy
LXdoaWxlLXdhaXRpbmctZm9yLWEtY2hpbGQtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9iYXNoL2Jhc2gvMDAwMS1jaGFuZ2VzLXRvLVNJR0lOVC1oYW5kbGVyLXdoaWxlLXdhaXRp
bmctZm9yLWEtY2hpbGQtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MjFkNWJlOTllYjM3
ZDMxZTQ4YmQ2NmQ2MTgwOGE2NmE0YzVhYjg0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBlNGI5NDkzYWU0OTIzNTk1ZWMzY2E2N2Y4NTMyMjEyOWZiMzA1NmNmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQ2hldCBSYW1leSA8Y2hldC5yYW1leUBjYXNlLmVkdT4KIERhdGU6
IE1vbiwgMzAgT2N0IDIwMjMgMTI6MTY6MDcgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gY2hhbmdl
cyB0byBTSUdJTlQgaGFuZGxlciB3aGlsZSB3YWl0aW5nIGZvciBhIGNoaWxkOyBza2lwCkBAIC0y
MCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogWGlhbmd5dSBDaGVuIDx4aWFuZ3l1LmNoZW5A
d2luZHJpdmVyLmNvbT4KICA2IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDMyIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvZ2VuZXJhbC5jIGIvZ2VuZXJhbC5jCi1pbmRleCA4
NWM1YThiNi4uNjVlMmVlMDYgMTAwNjQ0CitpbmRleCBiZGEzOWY0Li45NGE1MzM5IDEwMDY0NAog
LS0tIGEvZ2VuZXJhbC5jCiArKysgYi9nZW5lcmFsLmMKLUBAIC0yNjIsOCArMjYyLDkgQEAgbGVn
YWxfbnVtYmVyIChzdHJpbmcsIHJlc3VsdCkKK0BAIC0yNjQsOCArMjY0LDkgQEAgbGVnYWxfbnVt
YmVyIChzdHJpbmcsIHJlc3VsdCkKICAgIGlmIChlcnJubyB8fCBlcCA9PSBzdHJpbmcpCiAgICAg
IHJldHVybiAwOwkvKiBlcnJubyBpcyBzZXQgb24gb3ZlcmZsb3cgb3IgdW5kZXJmbG93ICovCiAg
CkBAIC0zNiw3ICszNiw3IEBAIGluZGV4IDg1YzVhOGI2Li42NWUyZWUwNiAxMDA2NDQKICAKICAg
IC8qIElmICpzdHJpbmcgaXMgbm90ICdcMCcgYnV0ICplcCBpcyAnXDAnIG9uIHJldHVybiwgdGhl
IGVudGlyZSBzdHJpbmcKIGRpZmYgLS1naXQgYS9qb2JzLmMgYi9qb2JzLmMKLWluZGV4IDZiOTg2
ZWQ3Li4yNjJkNzhkZSAxMDA2NDQKK2luZGV4IGQzZTRhYjAuLjkwM2NmOWMgMTAwNjQ0CiAtLS0g
YS9qb2JzLmMKICsrKyBiL2pvYnMuYwogQEAgLTI3MTgsNiArMjcxOCwxMCBAQCB3YWl0X2Zvcl9i
YWNrZ3JvdW5kX3BpZHMgKHBzKQpAQCAtOTYsNyArOTYsNyBAQCBpbmRleCA2Yjk4NmVkNy4uMjYy
ZDc4ZGUgMTAwNjQ0CiAgICAgICAgd2FpdGluZ19mb3JfY2hpbGQgPSAwOwogICAgICAgIGlmIChv
bGRfc2lnaW50X2hhbmRsZXIgPT0gU0lHX0lHTikKICAJc2V0X3NpZ25hbF9oYW5kbGVyIChTSUdJ
TlQsIG9sZF9zaWdpbnRfaGFuZGxlcik7Ci1AQCAtNDEzNiw3ICs0MTQ0LDcgQEAgc2V0X2pvYl9z
dGF0dXNfYW5kX2NsZWFudXAgKGpvYikKK0BAIC00MTQxLDcgKzQxNDksNyBAQCBzZXRfam9iX3N0
YXR1c19hbmRfY2xlYW51cCAoam9iKQogIAkJIFNJR0lOVCAoaWYgd2UgcmVzZXQgdGhlIHNpZ2hh
bmRsZXIgdG8gdGhlIGRlZmF1bHQpLgogIAkJIEluIHRoaXMgY2FzZSwgd2UgaGF2ZSB0byBmaXgg
dGhpbmdzIHVwLiAgV2hhdCBhIGNyb2NrLiAqLwogIAkgICAgICBpZiAodGVtcF9oYW5kbGVyID09
IHRyYXBfaGFuZGxlciAmJiBzaWduYWxfaXNfdHJhcHBlZCAoU0lHSU5UKSA9PSAwKQpAQCAtMTA2
LDcgKzEwNiw3IEBAIGluZGV4IDZiOTg2ZWQ3Li4yNjJkNzhkZSAxMDA2NDQKICAJICAgICAgaWYg
KHRlbXBfaGFuZGxlciA9PSBTSUdfREZMKQogIAkJdGVybXNpZ19oYW5kbGVyIChTSUdJTlQpOwkv
KiBYWFggKi8KIGRpZmYgLS1naXQgYS90ZXN0cy9yZWRpci5yaWdodCBiL3Rlc3RzL3JlZGlyLnJp
Z2h0Ci1pbmRleCA4ZGIxMDQxNC4uOWUxNDAzYzggMTAwNjQ0CitpbmRleCA4ZGIxMDQxLi45ZTE0
MDNjIDEwMDY0NAogLS0tIGEvdGVzdHMvcmVkaXIucmlnaHQKICsrKyBiL3Rlc3RzL3JlZGlyLnJp
Z2h0CiBAQCAtMTU0LDEwICsxNTQsMTAgQEAgZm9vCkBAIC0xMjMsNyArMTIzLDcgQEAgaW5kZXgg
OGRiMTA0MTQuLjllMTQwM2M4IDEwMDY0NAogKy4vcmVkaXIxMS5zdWI6IGxpbmUgNzc6IDQyOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiAgNDIKIGRpZmYgLS1naXQgYS90ZXN0cy9yZWRpcjEx
LnN1YiBiL3Rlc3RzL3JlZGlyMTEuc3ViCi1pbmRleCBkNDE3Y2RiNi4uY2E5ODU0Y2QgMTAwNjQ0
CitpbmRleCBkNDE3Y2RiLi5jYTk4NTRjIDEwMDY0NAogLS0tIGEvdGVzdHMvcmVkaXIxMS5zdWIK
ICsrKyBiL3Rlc3RzL3JlZGlyMTEuc3ViCiBAQCAtMzQsNiArMzQsOCBAQCBhPTQgYj03IHNzPTQg
ZGVjbGFyZSAtaSBzcwpAQCAtMTM2LDcgKzEzNiw3IEBAIGluZGV4IGQ0MTdjZGI2Li5jYTk4NTRj
ZCAxMDA2NDQKICBhPTQgZWNobyBmb28gMj4mMSA+JiQoZm9vKSB8IHsgZ3JlcCAtcSAnQmFkIGZp
bGUnIHx8IGVjaG8gJ3JlZGlyMTEgYmFkIDMnOyB9CiAgYT0xIGVjaG8gZm9vIDI+JjEgPiYkKGZv
bykgfCB7IGdyZXAgLXEgJ0JhZCBmaWxlJyB8fCBlY2hvICdyZWRpcjExIGJhZCA0JzsgfQogZGlm
ZiAtLWdpdCBhL3Rlc3RzL3R5cGUucmlnaHQgYi90ZXN0cy90eXBlLnJpZ2h0Ci1pbmRleCBiYmMy
MjhlOC4uZTBhNjY3NDUgMTAwNjQ0CitpbmRleCBiYmMyMjhlLi5jMGMxYzhiIDEwMDY0NAogLS0t
IGEvdGVzdHMvdHlwZS5yaWdodAogKysrIGIvdGVzdHMvdHlwZS5yaWdodAogQEAgLTI0LDE1ICsy
NCwxNSBAQCBmdW5jICgpCkBAIC0xNjQsNyArMTY0LDcgQEAgaW5kZXggYmJjMjI4ZTguLmUwYTY2
NzQ1IDEwMDY0NAogIGJ1aWx0aW4gaXMgYSBzaGVsbCBidWlsdGluCiAgL2Jpbi9zaAogZGlmZiAt
LWdpdCBhL3Rlc3RzL3R5cGUudGVzdHMgYi90ZXN0cy90eXBlLnRlc3RzCi1pbmRleCBmZDM5YzE4
YS4uZGRjMTU0MDcgMTAwNjQ0CitpbmRleCBmZDM5YzE4Li5kZGMxNTQwIDEwMDY0NAogLS0tIGEv
dGVzdHMvdHlwZS50ZXN0cwogKysrIGIvdGVzdHMvdHlwZS50ZXN0cwogQEAgLTI1LDggKzI1LDYg
QEAgdHlwZSAtciAke1RISVNfU0h9CkBAIC0yMjEsNiArMjIxLDMgQEAgaW5kZXggZmQzOWMxOGEu
LmRkYzE1NDA3IDEwMDY0NAogIHR5cGUgbQogIAogIGhhc2ggLXIKLS0tIAotMi4zNS41Ci0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvMDAwMS1maXgtYzk5LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWZpeC1jOTkucGF0Y2gK
aW5kZXggYWE4MTBmN2Q0ZS4uYWJkODNkMDlhZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWZpeC1jOTkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWZpeC1jOTkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGU5ZWQzODhlNzYwZWMzM2RjZjllNzJjNjM5OTQ2YzBkMGFiZWVjMjYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGU4ZWMyZDc1YTUyYmRjOTNjODNhNjc5YTcxYTY4ZjQwMzMwMzNiOGIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25A
YXJtLmNvbT4KIERhdGU6IFdlZCwgMTkgSnVuIDIwMjQgMTI6NTc6MzkgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gRml4IEM5OSBwcm9ibGVtcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2Jhc2gvYmFzaC9idWlsZC10ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9i
YXNoL2Jhc2gvYnVpbGQtdGVzdHMucGF0Y2gKaW5kZXggYzFiOWI4MjYxZi4uNGNjZTFiYTk5MyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC9idWlsZC10ZXN0cy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL2J1aWxkLXRlc3RzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMThiNzYyODM3YzJhZDI1MzE5Y2FlYWYwMzIwZWZm
NjEzYjY0ZGFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjM2Y1OGY4YjRmN2EzNTli
OWQ5ZGQ5N2E0NWJjYWFiNTBhODlkMjI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBlbmVhLmNvbT4KIERhdGU6IFdlZCwgMTkgRGVj
IDIwMTIgMTc6MTg6MzEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkICdwdGVzdCcgdGFyZ2V0
IHRvIE1ha2VmaWxlLCB0byBydW4gdGVzdHMgd2l0aG91dCBjaGVja2luZwpAQCAtOSwxNiArOSwx
NSBAQCBTaWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGVuZWEuY29t
PgogCiBSZWJhc2UgdG8gNS4wCiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+Ci0KIC0tLQogIE1ha2VmaWxlLmluIHwgMjQgKysrKysrKysrKysrKysr
KysrKy0tLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2VmaWxlLmluCi1pbmRleCBiYzk3
MDQ5Li45MzdjZTM5IDEwMDY0NAoraW5kZXggMGI0ZGY3My4uN2UyYTM0ZSAxMDA2NDQKIC0tLSBh
L01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5pbgotQEAgLTk0MywyMCArOTQzLDM0IEBAIG1h
eWJlLWNsZWFuOgorQEAgLTk1OCwyMCArOTU4LDM0IEBAIG1heWJlLWNsZWFuOgogIAlmaQogIAog
IHJlY2hvJChFWEVFWFQpOgkJJChTVVBQT1JUX1NSQylyZWNoby5jCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL2ZpeC1maWxlc3Vic3QtZXJyZXhpdC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvZml4LWZpbGVzdWJzdC1lcnJleGl0LnBh
dGNoCmluZGV4IDYwZjE4NTIzMTYuLmM1MDgyZWUzNTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9iYXNoL2Jhc2gvZml4LWZpbGVzdWJzdC1lcnJleGl0LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvZml4LWZpbGVzdWJzdC1lcnJleGl0LnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1OWRkZmRhMTRlM2M5YWE2Mjg2YmI0YzRjMDc0OGY3YzEz
MjRhNjVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNjk1MWI3NDk3MWM3ZmQzOGZk
MDM2ZGFjMTQxMGE5ZTUzY2JlNzM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hl
dCBSYW1leSA8Y2hldC5yYW1leUBjYXNlLmVkdT4KIERhdGU6IEZyaSwgNyBBcHIgMjAyMyAwMDoy
ODo0NiAtMDcwMAogU3ViamVjdDogW1BBVENIXSAkKDxub3N1Y2hmaWxlKSBpcyBubyBsb25nZXIg
YSBmYXRhbCBlcnJvciB3aXRoIGVycmV4aXQKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1i
eTogWmV2IFdlaXNzIDx6ZXZAYmV3aWxkZXJiZWVzdC5uZXQ+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9idWlsdGlucy9ldmFs
c3RyaW5nLmMgYi9idWlsdGlucy9ldmFsc3RyaW5nLmMKLWluZGV4IGRmM2RkNjhlMmE3ZS4uNjYx
MjA4MWNkNjQ2IDEwMDY0NAoraW5kZXggNTNhN2MwYi4uYzUwNzVjYyAxMDA2NDQKIC0tLSBhL2J1
aWx0aW5zL2V2YWxzdHJpbmcuYwogKysrIGIvYnVpbHRpbnMvZXZhbHN0cmluZy5jCiBAQCAtNzUz
LDcgKzc1Myw3IEBAIG9wZW5fcmVkaXJfZmlsZSAociwgZm5wKQpAQCAtMjksNiArMjksMyBAQCBp
bmRleCBkZjNkZDY4ZTJhN2UuLjY2MTIwODFjZDY0NiAxMDA2NDQKICAgICAgICBmcmVlIChmbik7
CiAgICAgICAgaWYgKGZucCkKICAJKmZucCA9IDA7Ci0tLSAKLTIuNDAuMAotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL2ZpeC1ydW4tYnVpbHRpbnMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL2ZpeC1ydW4tYnVpbHRpbnMucGF0Y2gK
aW5kZXggMmZhMzg4MzAyZS4uMDVkMDg1OTgyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2Jhc2gvYmFzaC9maXgtcnVuLWJ1aWx0aW5zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9iYXNoL2Jhc2gvZml4LXJ1bi1idWlsdGlucy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMGM0Y2FiOTU5NGM5NmMyZGM0MzVhOGQ5NzI0NjA1ODI0YmNiZjkxNyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTU2MDFjNzFiMDczYTYwNGNjZGEyNWM3ZjE0ZjBiYjEy
ZTlhM2IyOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERlbmdrZSBEdSA8ZGVuZ2tl
LmR1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE5IEFwciAyMDE2IDAyOjU3OjQ1IC0wNDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGZpeCBydW4tYnVpbHRpbnMgZmFpbGVkCkBAIC0xNiwxMCArMTYs
MTAgQEAgU2lnbmVkLW9mZi1ieTogRGVuZ2tlIER1IDxkZW5na2UuZHVAd2luZHJpdmVyLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL3Rlc3RzL2J1aWx0aW5zLnRlc3RzIGIvdGVzdHMvYnVpbHRpbnMudGVzdHMKLWluZGV4
IDlkNzc1MjAuLjYzZjNhZjggMTAwNjQ0CitpbmRleCA4ZWVlNDNlLi43MWM5ZWVlIDEwMDY0NAog
LS0tIGEvdGVzdHMvYnVpbHRpbnMudGVzdHMKICsrKyBiL3Rlc3RzL2J1aWx0aW5zLnRlc3RzCi1A
QCAtMTA5LDcgKzEwOSw3IEBAIGVzYWMKK0BAIC0xMjQsNyArMTI0LDcgQEAgZXNhYwogIAogICMg
dGVzdCBvcHRpb25zIHRvIGV4ZWMKICAoZXhlYyAtYSBzcGVjaWFsbmFtZSAke1RISVNfU0h9IC1j
ICdlY2hvICQwJyApCkBAIC0yOCw2ICsyOCwzIEBAIGluZGV4IDlkNzc1MjAuLjYzZjNhZjggMTAw
NjQ0CiAgIyB0ZXN0IGBjbGVhbicgZW52aXJvbm1lbnQuICBpZiAvYmluL3NoIGlzIGJhc2gsIGFu
ZCB0aGUgc2NyaXB0IHZlcnNpb24gb2YKICAjIHByaW50ZW52IGlzIHJ1biwgdGhlcmUgd2lsbCBi
ZSB2YXJpYWJsZXMgaW4gdGhlIGVudmlyb25tZW50IHRoYXQgYmFzaAogICMgc2V0cyBvbiBzdGFy
dHVwLiAgQWxzbyB0ZXN0IGNvZGUgdGhhdCBwcmVmaXhlcyBhcmd2WzBdIHdpdGggYSBkYXNoLgot
LS0gCi0yLjguMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNo
L21rYnVpbHRpbnNfaGF2ZV9zdHJpbmdpemUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
YmFzaC9iYXNoL21rYnVpbHRpbnNfaGF2ZV9zdHJpbmdpemUucGF0Y2gKaW5kZXggYTkzOTFkNmNh
Yy4uZWIyOWU3ZDgzNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFz
aC9ta2J1aWx0aW5zX2hhdmVfc3RyaW5naXplLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9iYXNoL2Jhc2gvbWtidWlsdGluc19oYXZlX3N0cmluZ2l6ZS5wYXRjaApAQCAtMSwzICsx
LDggQEAKK0Zyb20gZDExNjg1Mjg2MTQ0YzJlNTYzMDU0NWU0MzVkMTEzODdiMjkwOGZkMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENocmlzdG9waGVyIExhcnNvbiA8Y2hyaXNfbGFy
c29uQG1lbnRvci5jb20+CitEYXRlOiBXZWQsIDE0IE5vdiAyMDEyIDA3OjU1OjA5IC0wNzAwCitT
dWJqZWN0OiBbUEFUQ0hdIGJhc2g6IGZpeCBta2J1aWx0aW5zIGJ1aWxkIGZhaWx1cmUKKwogT24g
aG9zdHMgd2l0aCBGT1JUSUZZX1NPVVJDRVMsIHN0cmluZ2l6ZSBzdXBwb3J0IGlzIHJlcXVpcmVk
LCBhcyBpdCdzIHVzZWQgYnkKIHRoZSBtYWNyb3MgdG8gd3JhcCBmdW5jdGlvbnMgKGUuZy4gcmVh
ZCBhbmQgb3BlbiBpbiB1bmlzdGQuaCkuIFRob3NlIHdyYXBwZXJzCiB1c2UgdGhlIFNUUklORygp
IG1hY3JvIGZyb20gdW5pc3RkLmguIEEgaGVhZGVyIGluIHRoZSBiYXNoIHNvdXJjZXMgb3ZlcnJp
ZGVzCkBAIC0xMywxNCArMTgsMTkgQEAgc3RyaW5naXplIHN1cHBvcnQsIG9yIHRvIG5vdCBkZWZp
bmUgU1RSSU5HKCkgYXQgYWxsIHdoZW4gRk9SVElGWV9TT1VSQ0VTIGlzCiBkZWZpbmVkLCBsZXR0
aW5nIHRoZSB1bmlzdGQuaCBvbmUgYmUgdXNlZCwgaW5zdGVhZC4KIAogVXBzdHJlYW0tU3RhdHVz
OiBQZW5kaW5nCistLS0KKyBidWlsdGlucy9ta2J1aWx0aW5zLmMgfCAxICsKKyAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKIAotLS0tIGJhc2gtNC4yLm9yaWcvYnVpbHRpbnMvbWtidWls
dGlucy5jCi0rKysgYmFzaC00LjIvYnVpbHRpbnMvbWtidWlsdGlucy5jCitkaWZmIC0tZ2l0IGEv
YnVpbHRpbnMvbWtidWlsdGlucy5jIGIvYnVpbHRpbnMvbWtidWlsdGlucy5jCitpbmRleCBmNTA1
ZWJkLi5iNWIyZWVkIDEwMDY0NAorLS0tIGEvYnVpbHRpbnMvbWtidWlsdGlucy5jCisrKysgYi9i
dWlsdGlucy9ta2J1aWx0aW5zLmMKIEBAIC0yOCw2ICsyOCw3IEBACiAgIyAgZGVmaW5lIEhBVkVf
U1RETElCX0gKLQorIAogICMgIGRlZmluZSBIQVZFX1JFTkFNRQogKyMgIGRlZmluZSBIQVZFX1NU
UklOR0laRQogICNlbmRpZiAvKiBDUk9TU19DT01QSUxJTkcgKi8KLQorIAogICNpZiBkZWZpbmVk
IChIQVZFX1VOSVNURF9IKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gv
YmFzaC90ZXN0LW91dHB1dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gv
dGVzdC1vdXRwdXQucGF0Y2gKaW5kZXggMGZmY2MyNDU4Ny4uMzIyNTkwN2I2NiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC90ZXN0LW91dHB1dC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL3Rlc3Qtb3V0cHV0LnBhdGNoCkBAIC0x
LDcgKzEsNyBAQAotRnJvbSAyOGViMDYwNDdlYmQyZGVhYThjN2NkMmJmNjY1NWVmNmE0NjlkYzE0
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNWNiZDVhNDk1NGI4OTg1N2M5ZTM5N2Nh
Y2NlZGE1NTI0ODRmNWQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNSBBdWcgMjAxNyAxMDow
MTo1NiArMDgwMAotU3ViamVjdDogW1BBVENIIDEvMl0gQWRkIEZBSUwvUEFTUyBvdXRwdXQgdG8g
dGVzdCBvdXRwdXQuCitTdWJqZWN0OiBbUEFUQ0hdIEFkZCBGQUlML1BBU1Mgb3V0cHV0IHRvIHRl
c3Qgb3V0cHV0LgogTUlNRS1WZXJzaW9uOiAxLjAKIENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsg
Y2hhcnNldD1VVEYtOAogQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdApAQCAtMTYsMTAg
KzE2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVy
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvdGVzdHMvcnVuLWFsbCBiL3Rlc3RzL3J1bi1hbGwKLWluZGV4IDI4ODJm
ZTAuLmUyMWQwMjYgMTAwNjQ0CitpbmRleCAxZjc0OTIzLi5iYTM2YTFmIDEwMDY0NAogLS0tIGEv
dGVzdHMvcnVuLWFsbAogKysrIGIvdGVzdHMvcnVuLWFsbAotQEAgLTMzLDcgKzMzLDE2IEBAIGRv
CitAQCAtNTcsNyArNTcsMTYgQEAgZG8KICAJY2FzZSAkeCBpbgogIAkkMHxydW4tbWluaW1hbHxy
dW4tZ3Byb2YpCTs7CiAgCSoub3JpZ3wqfikgOzsKQEAgLTM3LDYgKzM3LDMgQEAgaW5kZXggMjg4
MmZlMC4uZTIxZDAyNiAxMDA2NDQKICAJZXNhYwogIGRvbmUKICAKLS0tIAotMS44LjMuMQotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL3VzZV9hY2xvY2FsLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC91c2VfYWNsb2NhbC5wYXRjaApp
bmRleCBiZDY4NzBiMzg2Li5lOTY2YjAzN2EyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvYmFzaC9iYXNoL3VzZV9hY2xvY2FsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9iYXNoL2Jhc2gvdXNlX2FjbG9jYWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQx
YmYyMzgxN2FmZmZkNTkxN2I3NGRhNjk0NmUwYzNiN2U2M2UzMzYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGIzYTY0NzAyZmExOTc4NDYzYzAxYmQ1ZDlmZTcxMWU0NjI4YWJhMWUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjggRGVjIDIwMjAgMjE6MDQ6MjcgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gYmFzaDogdXBkYXRlIDUuMCAtPiA1LjEKQEAgLTksNyArOSw2IEBAIGFz
IG5lZWRlZCBpbnN0ZWFkIG1ha2luZyBpdCB3b3JrIGxpa2Ugb3RoZXIgYXV0b3Rvb2xzIGJhc2Vk
IHByb2plY3RzLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIGNvbmZpZ3Vy
YXRpb24gc3BlY2lmaWNdCiBSUCAyMDIxLzEvMjAKLQogLS0tCiAgY29uZmlndXJlLmFjIHwgNDMg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIDEgZmlsZSBjaGFu
Z2VkLCA0MyBkZWxldGlvbnMoLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9i
YXNoL2Jhc2hfNS4yLjIxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaF81LjIu
MzIuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2Jhc2gvYmFzaF81LjIuMjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9i
YXNoL2Jhc2hfNS4yLjMyLmJiCmluZGV4IGNjZmU1YzQ3YTcuLmIxNTljMDIzMmYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hfNS4yLjIxLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hfNS4yLjMyLmJiCkBAIC0xNyw3ICsxNyw3IEBAIFNS
Q19VUkkgPSAiJHtHTlVfTUlSUk9SfS9iYXNoLyR7QlB9LnRhci5nejtuYW1lPXRhcmJhbGwgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1maXgtYzk5LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1T
UkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICJjOGUzMWJkYzU5YjY5YWFmZmM1YjM2NTA5OTA1
YmEzZTVjYmIxMjc0NzA5MWQyN2I0Yjk3N2YwNzg1NjBkNWI4IgorU1JDX1VSSVt0YXJiYWxsLnNo
YTI1NnN1bV0gPSAiZDNlZjgwZDJiNjdkOGNiYmU0ZDMyNjVjNjNhNzJjNDZmOWIyNzhlYWQ2ZTBl
MDZkNjE4MDFiNThmMjNmNTBiNSIKIAogREVCVUdfT1BUSU1JWkFUSU9OOmFwcGVuZDphcm12NCA9
ICIgJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfQ0NBUkdTJywgJy1tdGh1bWInLCAnLWZvbWl0
LWZyYW1lLXBvaW50ZXInLCAnJywgZCl9IgogREVCVUdfT1BUSU1JWkFUSU9OOmFwcGVuZDphcm12
NSA9ICIgJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfQ0NBUkdTJywgJy1tdGh1bWInLCAnLWZv
bWl0LWZyYW1lLXBvaW50ZXInLCAnJywgZCl9IgotLSAKMi40NC4wCgo=

--===============9184265154314933618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 52 recipes from the core2-64 sysroot...done.
Removing 93 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7fc43820ba8d7ad3f8d7d15853164759ccc47851"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7fc43820ba8d7ad3f8d7d15853164759ccc47851"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 537 Local 504 Mirrors 0 Missed 33 Current 246 (93% match, 95% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 259 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 260 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 265 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 270 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 271 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 273 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 274 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 280 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 281 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 287 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 299 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 300 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 306 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 307 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/e2fsprogs/1.47.0/temp/log.do_packagedata_setscene.2364465
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 308 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 309 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 310 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3/3.12.4/temp/log.do_packagedata_setscene.2364475
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_setscene)
NOTE: Running setscene task 314 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 317 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 320 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 321 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 327 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_setscene)
NOTE: Running setscene task 334 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 342 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 343 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb_setscene)
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 345 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 346 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 355 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 357 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 360 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe shadow-securetty-4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 363 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_deploy_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 365 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 372 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 389 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_deploy_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 402 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_package_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 416 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 418 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 428 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 429 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 430 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 436 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 444 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 460 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 469 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 472 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 475 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 478 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 480 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 488 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 518 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 521 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 567 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 574 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 593 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 820 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_recipe_qa)
NOTE: Running task 845 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe bash-5.2.32-r0: task do_recipe_qa: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1095 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_fetch)
NOTE: Running task 1100 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_fetch)
NOTE: Running task 1101 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1102 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.15.1-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_fetch: Started
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Started
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1222 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1223 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.2.32-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1224 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_fetch)
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_fetch: Succeeded
NOTE: Running task 1225 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1227 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 605 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.32-r0: task do_fetch: Started
NOTE: recipe bash-5.2.32-r0: task do_fetch: Succeeded
NOTE: Running task 1228 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_unpack)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_unpack: Started
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1229 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1230 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1237 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe bash-5.2.32-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_patch)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1239 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_patch)
NOTE: recipe bash-5.2.32-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_deploy_setscene: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_patch: Started
NOTE: Running setscene task 612 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 614 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1251 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_package_setscene)
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 622 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 629 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 632 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 635 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.32-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1263 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_populate_lic)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.32-r0: task do_populate_lic: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_populate_lic unihash changed to d99f8330487c4183308e7d81b4555e03d446f2c71a9a956d347ce269f50aa04c
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 642 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 662 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 679 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1325 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: Running task 1341 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_ipk)
NOTE: Running task 1342 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_deb)
NOTE: Running task 1343 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r0: task do_package_write_ipk: Started
NOTE: recipe base-files-3.0.14-r0: task do_package_write_deb: Started
NOTE: recipe base-files-3.0.14-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package_write_ipk: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package_write_deb: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 693 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 698 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 783 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1714 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1986 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata)
NOTE: recipe bash-5.2.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1988 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2032 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2037 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2090 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_collect_spdx_deps)
NOTE: Running task 2129 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package_write_ipk)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Started
NOTE: Running task 2130 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package_write_deb)
NOTE: Running task 2131 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2132 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_configure)
NOTE: recipe bash-5.2.32-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.15.1-r0: task do_package_write_ipk: Started
NOTE: recipe shadow-4.15.1-r0: task do_package_write_deb: Started
NOTE: recipe shadow-4.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.32-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_configure: Started
NOTE: recipe iproute2-6.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2133 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: Setscene tasks completed
NOTE: Running task 2140 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe iproute2-6.9.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2151 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_configure)
NOTE: recipe python3-3.12.4-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2154 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_compile)
NOTE: recipe iproute2-6.9.0-r0: task do_compile: Started
NOTE: recipe shadow-4.15.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_install)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_install: Started
NOTE: recipe iproute2-6.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2157 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_install)
NOTE: recipe iproute2-6.9.0-r0: task do_install: Started
NOTE: recipe iproute2-6.9.0-r0: task do_install: Succeeded
NOTE: Running task 2158 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package)
NOTE: recipe iproute2-6.9.0-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_install: Succeeded
NOTE: Running task 2159 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_package)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_package: Started
NOTE: recipe bash-5.2.32-r0: task do_configure: Succeeded
NOTE: Running task 2160 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.32-r0: task do_configure_ptest_base: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_package: Succeeded
NOTE: Running task 2161 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_packagedata)
NOTE: recipe bash-5.2.32-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2162 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_compile)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.32-r0: task do_compile: Started
NOTE: recipe iproute2-6.9.0-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_packagedata)
NOTE: recipe iproute2-6.9.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.9.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_packagedata unihash changed to ecbecd471940df5a1f3c689486355982c9ea4a2fd882d84641b8d9243c6e345f
NOTE: recipe bash-5.2.32-r0: task do_compile: Succeeded
NOTE: Running task 2164 of 2182 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_compile_ptest_base)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_packagedata: Failed
NOTE: recipe bash-5.2.32-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.32-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2164 tasks of which 2114 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815130909.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815130909.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_packagedata
Summary: There were 122 ERROR messages, returning a non-zero exit code.
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fur went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.12.5-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-3.12.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.10-r0 to 0:6.9.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.10-r0 to 0:6.9.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.10-r0 to 0:6.9.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.10-r0 to 0:6.9.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.10-r0 to 0:6.9.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.10-r0 to 0:6.9.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.10-r0 to 0:6.9.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.9.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/btrfs-tools/6.9.2/temp/log.do_packagedata.2388988
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_packagedata) failed with exit code '1'

--===============9184265154314933618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bash/bash-bashbug: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-bashbug: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-dbg: PKGSIZE changed from 3770064 to 3769488 (-0%)
packages/core2-64-poky-linux/bash/bash-dbg: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-dbg: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-dev: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-dev: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-doc: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-doc: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-loadable: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-loadable: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-af: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-af: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-bg: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-bg: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-ca: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-ca: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-cs: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-cs: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-da: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-da: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-de: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-de: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-el: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-el: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-en+boldquot: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-en+boldquot: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-en+quot: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-en+quot: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-eo: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-eo: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-es: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-es: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-et: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-et: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-fi: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-fi: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-fr: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-fr: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-ga: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-ga: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-gl: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-gl: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-hr: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-hr: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-hu: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-hu: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-id: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-id: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-it: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-it: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-ja: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-ja: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-ko: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-ko: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-lt: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-lt: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-nb: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-nb: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-nl: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-nl: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-pl: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-pl: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-pt-br: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-pt-br: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-pt: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-pt: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-ro: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-ro: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-ru: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-ru: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-sk: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-sk: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-sl: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-sl: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-sr: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-sr: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-sv: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-sv: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-tr: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-tr: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-uk: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-uk: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-vi: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-vi: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-zh-cn: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-zh-cn: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-locale-zh-tw: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-locale-zh-tw: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-ptest: PKGSIZE changed from 1584992 to 1585216 (+0%)
packages/core2-64-poky-linux/bash/bash-ptest: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-ptest: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-src: PKGSIZE changed from 4394035 to 4393415 (-0%)
packages/core2-64-poky-linux/bash/bash-src: FILELIST: directory renamed /usr/src/debug/bash/5.2.21/lib/readline -> /usr/src/debug/bash/5.2.32/lib/readline, directory renamed /usr/src/debug/bash/5.2.21/include -> /usr/src/debug/bash/5.2.32/include, directory renamed /usr/src/debug/bash/5.2.21/lib/tilde -> /usr/src/debug/bash/5.2.32/lib/tilde, directory renamed /usr/src/debug/bash/5.2.21/builtins -> /usr/src/debug/bash/5.2.32/builtins, directory renamed /usr/src/debug/bash/5.2.21/examples/loadables -> /usr/src/debug/bash/5.2.32/examples/loadables, directory renamed /usr/src/debug/bash/5.2.21/support -> /usr/src/debug/bash/5.2.32/support, directory renamed /usr/src/debug/bash/5.2.21/lib/glob -> /usr/src/debug/bash/5.2.32/lib/glob, directory renamed /usr/src/debug/bash/5.2.21 -> /usr/src/debug/bash/5.2.32, removed "/usr/src/debug/bash/5.2.21/lib/sh/strtrans.c /usr/src/debug/bash/5.2.21/lib/sh/zwrite.c /usr/src/debug/bash/5.2.21/lib/sh/shmatch.c /usr/src/debug/bash/5.2.21/lib/sh/mailstat.
 c /usr/src/debug/bash/5.2.21/lib/sh/shmbchar.c /usr/src/debug/bash/5.2.21/lib/sh/casemod.c /usr/src/debug/bash/5.2.21/lib/sh/tmpfile.c /usr/src/debug/bash/5.2.21/lib/sh/unicode.c /usr/src/debug/bash/5.2.21/lib/sh/winsize.c /usr/src/debug/bash/5.2.21/lib/sh/shquote.c /usr/src/debug/bash/5.2.21/lib/sh/input_avail.c /usr/src/debug/bash/5.2.21/lib/sh/wcsnwidth.c /usr/src/debug/bash/5.2.21/lib/sh/pathcanon.c /usr/src/debug/bash/5.2.21/lib/sh/strtoimax.c /usr/src/debug/bash/5.2.21/lib/sh/makepath.c /usr/src/debug/bash/5.2.21/lib/sh/timeval.c /usr/src/debug/bash/5.2.21/lib/sh/stringlist.c /usr/src/debug/bash/5.2.21/lib/sh/fnxform.c /usr/src/debug/bash/5.2.21/lib/sh/itos.c /usr/src/debug/bash/5.2.21/lib/sh/stringvec.c /usr/src/debug/bash/5.2.21/lib/sh/eaccess.c /usr/src/debug/bash/5.2.21/lib/sh/oslib.c /usr/src/debug/bash/5.2.21/lib/sh/shtty.c /usr/src/debug/bash/5.2.21/lib/sh/spell.c /usr/src/debug/bash/5.2.21/lib/sh/zread.c /usr/src/debug/bash/5.2.21/lib/sh/setlinebuf.c /usr/src/debug/bas
 h/5.2.21/lib/sh/pathphys.c /usr/src/debug/bash/5.2.21/lib/sh/uconvert.c /usr/src/debug/bash/5.2.21/lib/sh/fmtulong.c /usr/src/debug/bash/5.2.21/lib/sh/netconn.c /usr/src/debug/bash/5.2.21/lib/sh/netopen.c /usr/src/debug/bash/5.2.21/lib/sh/utf8.c /usr/src/debug/bash/5.2.21/lib/sh/fpurge.c /usr/src/debug/bash/5.2.21/lib/sh/getenv.c /usr/src/debug/bash/5.2.21/lib/sh/mbschr.c /usr/src/debug/bash/5.2.21/lib/sh/random.c /usr/src/debug/bash/5.2.21/lib/sh/strvis.c /usr/src/debug/bash/5.2.21/lib/sh/timers.c /usr/src/debug/bash/5.2.21/lib/sh/ufuncs.c /usr/src/debug/bash/5.2.21/lib/sh/zgetline.c /usr/src/debug/bash/5.2.21/lib/sh/zcatfd.c /usr/src/debug/bash/5.2.21/lib/sh/zmapfd.c", added "/usr/src/debug/bash/5.2.32/lib/sh/strtrans.c /usr/src/debug/bash/5.2.32/lib/sh/netconn.c /usr/src/debug/bash/5.2.32/lib/sh/wcsnwidth.c /usr/src/debug/bash/5.2.32/lib/sh/netopen.c /usr/src/debug/bash/5.2.32/lib/sh/getenv.c /usr/src/debug/bash/5.2.32/lib/sh/shmatch.c /usr/src/debug/bash/5.2.32/lib/sh/pathphys.c
  /usr/src/debug/bash/5.2.32/lib/sh/input_avail.c /usr/src/debug/bash/5.2.32/lib/sh/uconvert.c /usr/src/debug/bash/5.2.32/lib/sh/winsize.c /usr/src/debug/bash/5.2.32/lib/sh/mbschr.c /usr/src/debug/bash/5.2.32/lib/sh/random.c /usr/src/debug/bash/5.2.32/lib/sh/fpurge.c /usr/src/debug/bash/5.2.32/lib/sh/shquote.c /usr/src/debug/bash/5.2.32/lib/sh/strvis.c /usr/src/debug/bash/5.2.32/lib/sh/timers.c /usr/src/debug/bash/5.2.32/lib/sh/casemod.c /usr/src/debug/bash/5.2.32/lib/sh/tmpfile.c /usr/src/debug/bash/5.2.32/lib/sh/unicode.c /usr/src/debug/bash/5.2.32/lib/sh/pathcanon.c /usr/src/debug/bash/5.2.32/lib/sh/oslib.c /usr/src/debug/bash/5.2.32/lib/sh/shtty.c /usr/src/debug/bash/5.2.32/lib/sh/spell.c /usr/src/debug/bash/5.2.32/lib/sh/stringlist.c /usr/src/debug/bash/5.2.32/lib/sh/mailstat.c /usr/src/debug/bash/5.2.32/lib/sh/zread.c /usr/src/debug/bash/5.2.32/lib/sh/fnxform.c /usr/src/debug/bash/5.2.32/lib/sh/setlinebuf.c /usr/src/debug/bash/5.2.32/lib/sh/timeval.c /usr/src/debug/bash/5.2.32/
 lib/sh/utf8.c /usr/src/debug/bash/5.2.32/lib/sh/shmbchar.c /usr/src/debug/bash/5.2.32/lib/sh/zgetline.c /usr/src/debug/bash/5.2.32/lib/sh/eaccess.c /usr/src/debug/bash/5.2.32/lib/sh/itos.c /usr/src/debug/bash/5.2.32/lib/sh/makepath.c /usr/src/debug/bash/5.2.32/lib/sh/zcatfd.c /usr/src/debug/bash/5.2.32/lib/sh/zmapfd.c /usr/src/debug/bash/5.2.32/lib/sh/zwrite.c /usr/src/debug/bash/5.2.32/lib/sh/stringvec.c /usr/src/debug/bash/5.2.32/lib/sh/ufuncs.c /usr/src/debug/bash/5.2.32/lib/sh/fmtulong.c"
packages/core2-64-poky-linux/bash/bash-src: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-src: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash-staticdev: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash-staticdev: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash/bash: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash/bash: PV changed from "5.2.21" to "5.2.32"
packages/core2-64-poky-linux/bash: PKGV changed from 5.2.21 [default] to 5.2.32 [default]
packages/core2-64-poky-linux/bash: SRC_URI changed from "https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch file://fix-filesubst-errexit.patch file://0001-fix-c99.patch" to "https://ftp.gnu.org/gnu/bash/bash-5.2.32.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch file://fix-filesubst-errexit.patch file://0001-fix-c99.patch"
packages/core2-64-poky-linux/bash: PV changed from "5.2.21" to "5.2.32"

--===============9184265154314933618==--

