Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08D3F719E2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 03:18:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v183IhWK009061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Feb 2017 19:18:43 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 19:18:42 -0800
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <872ba59a-26c4-9281-79eb-2b7cf7ede721@windriver.com>
Date: Wed, 8 Feb 2017 11:18:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1486523726.git.hongxu.jia@windriver.com>
Subject: [PATCH 11/13] bash: 4.3.30 -> 4.4
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
X-List-Received-Date: Wed, 08 Feb 2017 03:18:43 -0000
X-Groupsio-MsgNum: 92986
Content-Type: multipart/mixed; boundary="------------BF9C182E7EB75C308B0088E7"

--------------BF9C182E7EB75C308B0088E7
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



--------------BF9C182E7EB75C308B0088E7
Content-Type: text/x-patch; name="0011-bash-4.3.30-4.4.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="0011-bash-4.3.30-4.4.patch"

From 9cd590c117dcd2ec70c06213e1e0ae5fad98dd4c Mon Sep 17 00:00:00 2001
Message-Id: <9cd590c117dcd2ec70c06213e1e0ae5fad98dd4c.1486523726.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Date: Wed, 8 Feb 2017 10:45:41 +0800
Subject: [PATCH 11/13] bash: 4.3.30 -> 4.4

From e1936cdec5c08ce37e8a99fc471d5440c7635e2e Mon Sep 17 00:00:00 2001
Message-Id: <e1936cdec5c08ce37e8a99fc471d5440c7635e2e.1486519844.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1486519844.git.hongxu.jia@windriver.com>
References: <cover.1486519844.git.hongxu.jia@windriver.com>
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Date: Tue, 7 Feb 2017 03:35:02 -0500
Subject: [PATCH 11/12] bash: 4.3.30 -> 4.4

1) Upgrade bash from 4.3.30 to 4.4
2) Delete 1 patche below, since they are integrated upstream.
   fix-run-intl.patch
3) Modify 2 patches below to make it compatible with new version
   fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
   test-output.patch
4) Add 1 patche below to solve pkgconfig sanity error
   0001-patch-to-obtain-pkgconfig-sanity.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-patch-to-obtain-pkgconfig-sanity.patch    |  28 +++++
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 137 ++-------------------
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 -----------------
 meta/recipes-extended/bash/bash/test-output.patch  |  20 ++-
 meta/recipes-extended/bash/bash_4.3.30.bb          |  71 -----------
 meta/recipes-extended/bash/bash_4.4.bb             |  38 ++++++
 6 files changed, 92 insertions(+), 312 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb

diff --git a/meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch b/meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
new file mode 100644
index 0000000..9b5e4ec
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] patch to obtain pkgconfig sanity
+
+Drop the paths from the pkgconfig file bash.pc.in which will cause pkgconfig sanity error below:
+ERROR: QA Issue: bash.pc failed sanity test (tmpdir) in path /yocto/work001/fnst/zrq/community/poky/build/tmp/work/i586-poky-linux/bash    /4.4-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
+
+Upstream-Status: Pending
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ support/bash.pc.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/support/bash.pc.in b/support/bash.pc.in
+index 6009659..871fa9f 100644
+--- a/support/bash.pc.in
++++ b/support/bash.pc.in
+@@ -12,8 +12,6 @@ LOCAL_CFLAGS = @LOCAL_CFLAGS@
+ LOCAL_DEFS = @LOCAL_DEFS@
+ CCFLAGS = ${LOCAL_DEFS} ${LOCAL_CFLAGS}
+ 
+-CC = @CC@
+-SHOBJ_CC = @SHOBJ_CC@
+ SHOBJ_CFLAGS = @SHOBJ_CFLAGS@
+ SHOBJ_LD = @SHOBJ_LD@
+ SHOBJ_LDFLAGS = @SHOBJ_LDFLAGS@
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
index 7f099ae..d6beaff 100644
--- a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
+++ b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
@@ -20,150 +20,35 @@ the test suite should not be run as root
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- tests/coproc.right   |  5 +----
- tests/coproc.tests   | 30 +++++++++++++++++++++++++-----
- tests/heredoc.right  |  5 ++---
- tests/heredoc3.sub   |  3 ++-
- tests/run-execscript |  3 ++-
- tests/run-test       |  3 ++-
- 6 files changed, 34 insertions(+), 15 deletions(-)
+ tests/run-execscript | 3 ++-
+ tests/run-test       | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/tests/coproc.right b/tests/coproc.right
-index 6d9deaa..94b001c 100644
---- a/tests/coproc.right
-+++ b/tests/coproc.right
-@@ -1,11 +1,8 @@
--84575
- 63 60
- a b c
--84577
- 63 60
- flop
--./coproc.tests: line 22: 84577 Terminated              coproc REFLECT { cat -; }
--84579
-+coproc.tests: REFLECT: status 143
- 63 60
- FOO
- 63 60
-diff --git a/tests/coproc.tests b/tests/coproc.tests
-index 8be3563..d347eb7 100644
---- a/tests/coproc.tests
-+++ b/tests/coproc.tests
-@@ -1,6 +1,13 @@
-+: ${TMPDIR:=/tmp}
-+TMPOUT=${TMPDIR}/coproc-wait-$BASHPID
-+
- coproc { echo a b c; sleep 2; }
- 
--echo $COPROC_PID
-+case $COPROC_PID in
-+[0-9]*)	;;
-+*)	echo COPROC_PID not integer ;;
-+esac
-+
- echo ${COPROC[@]}
- 
- read LINE <&${COPROC[0]}
-@@ -10,7 +17,11 @@ wait $COPROC_PID
- 
- coproc REFLECT { cat - ; }
- 
--echo $REFLECT_PID
-+case $REFLECT_PID in
-+[0-9]*)	;;
-+*)	echo REFLECT_PID not integer ;;
-+esac
-+
- echo ${REFLECT[@]}
- 
- echo flop >&${REFLECT[1]}
-@@ -18,12 +29,21 @@ read LINE <&${REFLECT[0]}
- 
- echo $LINE
- 
--kill $REFLECT_PID
--wait $REFLECT_PID
-+{ sleep 1; kill $REFLECT_PID; } &
-+wait $REFLECT_PID >$TMPOUT 2>&1 || echo "coproc.tests: REFLECT: status $?"
-+grep 'Terminated.*coproc.*REFLECT' < $TMPOUT >/dev/null 2>&1 || {
-+	echo "coproc.tests: wait for REFLECT failed" >&2
-+}
-+rm -f $TMPOUT
-+exec 2>&1
- 
- coproc xcase -n -u
- 
--echo $COPROC_PID
-+case $COPROC_PID in
-+[0-9]*)	;;
-+*)	echo COPROC_PID not integer ;;
-+esac
-+
- echo ${COPROC[@]}
- 
- echo foo >&${COPROC[1]}
-diff --git a/tests/heredoc.right b/tests/heredoc.right
-index 6abaa1f..8df91c5 100644
---- a/tests/heredoc.right
-+++ b/tests/heredoc.right
-@@ -76,15 +76,14 @@ ENDEND
- end ENDEND
- hello
- end hello
--x star x
- end x*x
- helloEND
- end helloEND
- hello
- \END
- end hello<NL>\END
--./heredoc3.sub: line 74: warning: here-document at line 72 delimited by end-of-file (wanted `EOF')
--./heredoc3.sub: line 75: syntax error: unexpected end of file
-+./heredoc3.sub: line 75: warning: here-document at line 73 delimited by end-of-file (wanted `EOF')
-+./heredoc3.sub: line 76: syntax error: unexpected end of file
- comsub here-string
- ./heredoc.tests: line 105: warning: here-document at line 103 delimited by end-of-file (wanted `EOF')
- hi
-diff --git a/tests/heredoc3.sub b/tests/heredoc3.sub
-index 73a111e..9d3d846 100644
---- a/tests/heredoc3.sub
-+++ b/tests/heredoc3.sub
-@@ -49,9 +49,10 @@ hello
-     END    
- echo end hello
- 
--cat <<x*x & touch 'x*x'
-+cat <<x*x >/dev/null & touch 'x*x'
- x star x
- x*x
-+wait $!
- echo end 'x*x'
- rm 'x*x'
- 
 diff --git a/tests/run-execscript b/tests/run-execscript
-index f97ab21..0d00a1b 100644
+index de78644..f7b075f 100644
 --- a/tests/run-execscript
 +++ b/tests/run-execscript
 @@ -5,5 +5,6 @@ echo "warning: \`/tmp/bash-notthere' not being found or \`/' being a directory"
  echo "warning: produce diff output, please do not consider this a test failure" >&2
  echo "warning: if diff output differing only in the location of the bash" >&2
  echo "warning: binary appears, please do not consider this a test failure" >&2
--${THIS_SH} ./execscript > /tmp/xx 2>&1
+-${THIS_SH} ./execscript > ${BASH_TSTOUT} 2>&1
 +rm -f /tmp/xx
 +su -c "${THIS_SH} ./execscript > /tmp/xx 2>&1" test
- diff /tmp/xx exec.right && rm -f /tmp/xx
+ diff ${BASH_TSTOUT} exec.right && rm -f ${BASH_TSTOUT}
 diff --git a/tests/run-test b/tests/run-test
-index b2482c3..2e8f049 100644
+index d68791c..699855f 100644
 --- a/tests/run-test
 +++ b/tests/run-test
 @@ -1,4 +1,5 @@
  unset GROUPS UID 2>/dev/null
  
--${THIS_SH} ./test.tests >/tmp/xx 2>&1
+-${THIS_SH} ./test.tests >${BASH_TSTOUT} 2>&1
 +rm -f /tmp/xx
 +su -c "${THIS_SH} ./test.tests >/tmp/xx 2>&1" test
- diff /tmp/xx test.right && rm -f /tmp/xx
+ diff ${BASH_TSTOUT} test.right && rm -f ${BASH_TSTOUT}
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta/recipes-extended/bash/bash/fix-run-intl.patch b/meta/recipes-extended/bash/bash/fix-run-intl.patch
deleted file mode 100644
index d4a3409..0000000
--- a/meta/recipes-extended/bash/bash/fix-run-intl.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From a00d3161fd7b6a698bdd2ed5f0ac5faac580ee2a Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 3 Aug 2016 23:13:00 -0400
-Subject: [PATCH] fix run-intl failed
-
-1. Filter extra white space of intl.right
-
-   Due to the extra white space of intl.right, when the result of
-   sub-test unicode2.sub of intl.tests compared to it, the test
-   failed.
-
-   So we need to filter the extra white space of intl.right.
-
-   Import this patch for intl.right from bash devel branch:
-
-	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
-
-   commit is:
-
-	85ec0778f9d778e1820fb8c0e3e996f2d1103b45
-
-2. Change intl.right correspond to the unicode3.sub's output
-
-   In sub-test unicode3.sub of intl.tests, the payload value is:
-
-	payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
-
-   It used quoted string expansion(escaped octal) to assign ASCII
-   characters to variables. So when the test run the following:
-
-	printf %q "$payload"
-
-   It produced:
-
-	$'5\247@3\231+\306S8\237\242\352\263'
-
-   When compared to the intl.right(contain the converted character), it failed.
-
-   Import parts of patch for intl.right from bash devel branch:
-
-	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
-
-   commit is:
-
-	74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
-
-Upstream-Status: Backport
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- tests/intl.right | 30 +++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/tests/intl.right b/tests/intl.right
-index acf108a..1efdfbe 100644
---- a/tests/intl.right
-+++ b/tests/intl.right
-@@ -18,34 +18,34 @@ a√©b
- 1.0000
- 1,0000
- Passed all 1378 Unicode tests
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   357 277 277 012                                                
-+0000000 357 277 277 012
- 0000004
--0000000   357 277 277 012                                                
-+0000000 357 277 277 012
- 0000004
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   101 040 302 243 040 305 222 012                                
-+0000000 101 040 302 243 040 305 222 012
- 0000010
- ./unicode3.sub: line 2: 5ß@3ô+∆S8ü¢Í≥: command not found
--5ß@3ô+∆S8ü¢Í≥
-+$'5\247@3\231+\306S8\237\242\352\263'
- + : $'5\247@3\231+\306S8\237\242\352\263'
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/recipes-extended/bash/bash/test-output.patch
index 2b09b7d..652ffb1 100644
--- a/meta/recipes-extended/bash/bash/test-output.patch
+++ b/meta/recipes-extended/bash/bash/test-output.patch
@@ -2,15 +2,21 @@ Add FAIL/PASS output to test output.
 
 Signed-off-by: Bj√∂rn Stenberg <bjst@enea.com>
 Upstream-Status: Pending
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
-diff -uNr a/tests/run-all b/tests/run-all
---- a/tests/run-all	1999-10-08 17:07:46.000000000 +0200
-+++ b/tests/run-all	2012-10-27 21:04:18.663331887 +0200
-@@ -22,7 +22,15 @@
+ tests/run-all | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/tests/run-all b/tests/run-all
+index 2882fe0..069dbbe 100644
+--- a/tests/run-all
++++ b/tests/run-all
+@@ -33,7 +33,16 @@ do
  	case $x in
  	$0|run-minimal|run-gprof)	;;
  	*.orig|*~) ;;
--	*)	echo $x ; sh $x ;;
+-	*)	echo $x ; sh $x ; rm -f ${BASH_TSTOUT} ;;
 +    *)  echo $x
 +         output=`sh $x`
 +         if [ -n "$output" ]; then
@@ -19,7 +25,11 @@ diff -uNr a/tests/run-all b/tests/run-all
 +         else
 +             echo "PASS: $x"
 +         fi
++         rm -f ${BASH_TSTOUT} 
 +         ;;
  	esac
  done
  
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
deleted file mode 100644
index 765562f..0000000
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-require bash.inc
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-031;apply=yes;striplevel=0;name=patch031 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-032;apply=yes;striplevel=0;name=patch032 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-033;apply=yes;striplevel=0;name=patch033 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-034;apply=yes;striplevel=0;name=patch034 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-035;apply=yes;striplevel=0;name=patch035 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-036;apply=yes;striplevel=0;name=patch036 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-037;apply=yes;striplevel=0;name=patch037 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-038;apply=yes;striplevel=0;name=patch038 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-039;apply=yes;striplevel=0;name=patch039 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-040;apply=yes;striplevel=0;name=patch040 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-041;apply=yes;striplevel=0;name=patch041 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-042;apply=yes;striplevel=0;name=patch042 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-043;apply=yes;striplevel=0;name=patch043 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-044;apply=yes;striplevel=0;name=patch044 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-045;apply=yes;striplevel=0;name=patch045 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-046;apply=yes;striplevel=0;name=patch046 \
-           file://execute_cmd.patch;striplevel=0 \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
-           file://run-ptest \
-           file://fix-run-builtins.patch \
-           file://0001-help-fix-printf-format-security-warning.patch \
-           file://fix-run-intl.patch \
-           "
-
-SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-SRC_URI[tarball.sha256sum] = "317881019bbf2262fb814b7dd8e40632d13c3608d2f237800a8828fbb8a640dd"
-
-SRC_URI[patch031.md5sum] = "236df1ac1130a033ed0dbe2d2115f28f"
-SRC_URI[patch031.sha256sum] = "cd529f59dd0f2fdd49d619fe34691da6f0affedf87cc37cd460a9f3fe812a61d"
-SRC_URI[patch032.md5sum] = "2360f7e79cfb28526f80021025ea5909"
-SRC_URI[patch032.sha256sum] = "889357d29a6005b2c3308ca5b6286cb223b5e9c083219e5db3156282dd554f4a"
-SRC_URI[patch033.md5sum] = "b551c4ee7b8713759e4143499d0bbd48"
-SRC_URI[patch033.sha256sum] = "fb2a7787a13fbe027a7335aca6eb3c21cdbd813e9edc221274b6a9d8692eaa16"
-SRC_URI[patch034.md5sum] = "c9a56fbe0348e05a886dff97f2872b74"
-SRC_URI[patch034.sha256sum] = "f1694f04f110defe1330a851cc2768e7e57ddd2dfdb0e3e350ca0e3c214ff889"
-SRC_URI[patch035.md5sum] = "e564e8ab44ed1ca3a4e315a9f6cabdc9"
-SRC_URI[patch035.sha256sum] = "370d85e51780036f2386dc18c5efe996eba8e652fc1973f0f4f2ab55a993c1e3"
-SRC_URI[patch036.md5sum] = "b00ff66c41a7c0f06e191200981980b0"
-SRC_URI[patch036.sha256sum] = "ac5f82445b36efdb543dbfae64afed63f586d7574b833e9aa9cd5170bc5fd27c"
-SRC_URI[patch037.md5sum] = "be2a7b05f6ae560313f3c9d5f7127bda"
-SRC_URI[patch037.sha256sum] = "33f170dd7400ab3418d749c55c6391b1d161ef2de7aced1873451b3a3fca5813"
-SRC_URI[patch038.md5sum] = "61e0522830b24fbe8c0d1b010f132470"
-SRC_URI[patch038.sha256sum] = "adbeaa500ca7a82535f0e88d673661963f8a5fcdc7ad63445e68bf5b49786367"
-SRC_URI[patch039.md5sum] = "a4775487abe958536751c8ce53cdf6f9"
-SRC_URI[patch039.sha256sum] = "ab94dced2215541097691f60c3eb323cc28ef2549463e6a5334bbcc1e61e74ec"
-SRC_URI[patch040.md5sum] = "80d3587c58854e226055ef099ffeb535"
-SRC_URI[patch040.sha256sum] = "84bb396b9262992ca5424feab6ed3ec39f193ef5c76dfe4a62b551bd8dd9d76b"
-SRC_URI[patch041.md5sum] = "20bf63eef7cb441c0b1cc49ef3191d03"
-SRC_URI[patch041.sha256sum] = "4ec432966e4198524a7e0cd685fe222e96043769c9613e66742ac475db132c1a"
-SRC_URI[patch042.md5sum] = "70790646ae61e207c995e44931390e50"
-SRC_URI[patch042.sha256sum] = "ac219322db2791da87a496ee6e8e5544846494bdaaea2626270c2f73c1044919"
-SRC_URI[patch043.md5sum] = "855a46955cb251534e80b4732b748e37"
-SRC_URI[patch043.sha256sum] = "47a8a3c005b46e25821f4d8f5ccb04c1d653b1c829cb40568d553dc44f7a6180"
-SRC_URI[patch044.md5sum] = "29623d3282fcbb37e1158136509b5bb8"
-SRC_URI[patch044.sha256sum] = "9338820630bf67373b44d8ea68409f65162ea7a47b9b29ace06a0aed12567f99"
-SRC_URI[patch045.md5sum] = "4473244ca5abfd4b018ea26dc73e7412"
-SRC_URI[patch045.sha256sum] = "ba6ec3978e9eaa1eb3fabdaf3cc6fdf8c4606ac1c599faaeb4e2d69864150023"
-SRC_URI[patch046.md5sum] = "7e5fb09991c077076b86e0e057798913"
-SRC_URI[patch046.sha256sum] = "b3b456a6b690cd293353f17e22d92a202b3c8bce587ae5f2667c20c9ab6f688f"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_4.4.bb b/meta/recipes-extended/bash/bash_4.4.bb
new file mode 100644
index 0000000..16ff114
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_4.4.bb
@@ -0,0 +1,38 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-001;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-002;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-003;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-004;apply=yes;striplevel=0;name=patch004 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-005;apply=yes;striplevel=0;name=patch005 \
+           file://execute_cmd.patch;striplevel=0 \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch  \
+           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
+           file://run-ptest \
+           file://fix-run-builtins.patch \
+           file://0001-help-fix-printf-format-security-warning.patch \
+           file://0001-patch-to-obtain-pkgconfig-sanity.patch \
+           "
+
+SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25" 
+SRC_URI[tarball.sha256sum] = "d86b3392c1202e8ff5a423b302e6284db7f8f435ea9f39b5b1b20fd3ac36dfcb"
+
+SRC_URI[patch001.md5sum] = "817d01a6c0af6f79308a8b7b649e53d8"
+SRC_URI[patch001.sha256sum] = "3e28d91531752df9a8cb167ad07cc542abaf944de9353fe8c6a535c9f1f17f0f"
+SRC_URI[patch002.md5sum] = "765e14cff12c7284009772e8e24f2fe0"
+SRC_URI[patch002.sha256sum] = "7020a0183e17a7233e665b979c78c184ea369cfaf3e8b4b11f5547ecb7c13c53"
+SRC_URI[patch003.md5sum] = "49e7da93bf07f510a2eb6bb43ac3e5a2"
+SRC_URI[patch003.sha256sum] = "51df5a9192fdefe0ddca4bdf290932f74be03ffd0503a3d112e4199905e718b2"
+SRC_URI[patch004.md5sum] = "4557d674ab5831a5fa98052ab19edaf4"
+SRC_URI[patch004.sha256sum] = "ad080a30a4ac6c1273373617f29628cc320a35c8cd06913894794293dc52c8b3"
+SRC_URI[patch005.md5sum] = "cce96dd77cdd1d293beec10848f6cbb5"
+SRC_URI[patch005.sha256sum] = "221e4b725b770ad0bb6924df3f8d04f89eeca4558f6e4c777dfa93e967090529"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.8.1


--------------BF9C182E7EB75C308B0088E7--
