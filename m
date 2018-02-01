Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D02460616
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 09:32:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w119WA4I011960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 1 Feb 2018 01:32:13 -0800
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 1 Feb 2018 01:32:07 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<7b730a025337cfe854c1fe3089a93eaca138b643.1517383469.git.hongxu.jia@windriver.com>
	<CAJTo0LYUo2_mHf1yvBDpD_Ecm1chfgM+nwNFkgkpjq6C7dK-PQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <c4af06d1-2f58-884c-9027-524d85067348@windriver.com>
Date: Thu, 1 Feb 2018 17:35:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYUo2_mHf1yvBDpD_Ecm1chfgM+nwNFkgkpjq6C7dK-PQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] apr: 1.6.2 -> 1.6.3
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
X-List-Received-Date: Thu, 01 Feb 2018 09:32:16 -0000
Content-Type: multipart/alternative;
	boundary="------------193221D2CEFC5036C4696667"
Content-Language: en-US

--------------193221D2CEFC5036C4696667
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年01月31日 19:42, Burton, Ross wrote:
> We're carrying a lot of patches here, and I'm not convinced that they 
> are all inappropriate.  Would you be willing to see what of those are 
> upstreamable?
>

It's a long story for these patches, it's hard to trace the history from 
git.

I will choose an alternate fix to replace the inappropriate patches.

V2 incoming

//Hongxu


> Ross
>
> On 31 January 2018 at 07:48, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     - Rebase patches 0001 ~ 0008
>
>     - Fix build path issue to improve reproducibility
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      ...gure_fixes.patch => 0001-configure-fixes.patch} | 28 +++++++---
>      meta/recipes-support/apr/apr/0002-cleanup.patch    | 59
>     ++++++++++++++++++++++
>      .../apr/{configfix.patch => 0003-configfix.patch}  | 27 +++++++---
>      ...4-Makefile.in-fix-cross-compiling-failed.patch} | 13 +++--
>      ...> 0005-Fix-packet-discards-HTTP-redirect.patch} | 15 ++++--
>      ...-fix-LTFLAGS-to-make-it-work-with-ccache.patch} | 10 ++--
>      ...t-size-doesn-t-match-in-glibc-when-cross.patch} | 16 +++---
>      ...ink-libapr-against-phtread-to-make-gold-.patch} | 12 ++---
>      meta/recipes-support/apr/apr/cleanup.patch         | 43
>     ----------------
>      .../apr/{apr_1.6.2.bb <http://apr_1.6.2.bb> => apr_1.6.3.bb
>     <http://apr_1.6.3.bb>}            | 23 +++++----
>      10 files changed, 153 insertions(+), 93 deletions(-)
>      rename meta/recipes-support/apr/apr/{configure_fixes.patch =>
>     0001-configure-fixes.patch} (69%)
>      create mode 100644 meta/recipes-support/apr/apr/0002-cleanup.patch
>      rename meta/recipes-support/apr/apr/{configfix.patch =>
>     0003-configfix.patch} (75%)
>      rename meta/recipes-support/apr/apr/{upgrade-and-fix-1.5.1.patch
>     => 0004-Makefile.in-fix-cross-compiling-failed.patch} (81%)
>      rename
>     meta/recipes-support/apr/apr/{Fix-packet-discards-HTTP-redirect.patch
>     => 0005-Fix-packet-discards-HTTP-redirect.patch} (71%)
>      rename
>     meta/recipes-support/apr/apr/{configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     =>
>     0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch} (81%)
>      rename
>     meta/recipes-support/apr/apr/{0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     =>
>     0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch} (85%)
>      rename
>     meta/recipes-support/apr/apr/{0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     =>
>     0008-explicitly-link-libapr-against-phtread-to-make-gold-.patch} (90%)
>      delete mode 100644 meta/recipes-support/apr/apr/cleanup.patch
>      rename meta/recipes-support/apr/{apr_1.6.2.bb
>     <http://apr_1.6.2.bb> => apr_1.6.3.bb <http://apr_1.6.3.bb>} (81%)
>
>     diff --git a/meta/recipes-support/apr/apr/configure_fixes.patch
>     b/meta/recipes-support/apr/apr/0001-configure-fixes.patch
>     similarity index 69%
>     rename from meta/recipes-support/apr/apr/configure_fixes.patch
>     rename to meta/recipes-support/apr/apr/0001-configure-fixes.patch
>     index 0514000..374bb65 100644
>     --- a/meta/recipes-support/apr/apr/configure_fixes.patch
>     +++ b/meta/recipes-support/apr/apr/0001-configure-fixes.patch
>     @@ -1,11 +1,22 @@
>     +From ed491771f5a8976f9f05253f5f68b4cb5ac9b05f Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Tue, 30 Jan 2018 09:33:51 +0800
>     +Subject: [PATCH 1/8] configure fixes
>     +
>      Upstream-Status: Inappropriate [configuration]
>
>     -Index: apr-1.3.3/configure.in <http://configure.in>
>     -===================================================================
>     ---- apr-1.3.3.orig/configure.in <http://configure.in>
>     -+++ apr-1.3.3/configure.in <http://configure.in>
>     -@@ -794,39 +794,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm
>     -                 create_area])
>     +Rebase to 1.6.3
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + configure.in <http://configure.in> | 48
>     ++++++++----------------------------------------
>     + 1 file changed, 8 insertions(+), 40 deletions(-)
>     +
>     +diff --git a/configure.in <http://configure.in> b/configure.in
>     <http://configure.in>
>     +index 719f331..470c99a 100644
>     +--- a/configure.in <http://configure.in>
>     ++++ b/configure.in <http://configure.in>
>     +@@ -1167,39 +1167,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open
>     shm_unlink shmget shmat shmdt shmctl \
>     +                 create_area mprotect])
>
>       APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
>      -AC_CHECK_FILE(/dev/zero)
>     @@ -44,7 +55,7 @@ Index: apr-1.3.3/configure.in <http://configure.in>
>
>       # Now we determine which one is our anonymous shmem preference.
>       haveshmgetanon="0"
>     -@@ -1518,13 +1485,14 @@ else
>     +@@ -1976,13 +1943,14 @@ else
>           bigendian=0
>       fi
>
>     @@ -66,3 +77,6 @@ Index: apr-1.3.3/configure.in <http://configure.in>
>
>       AC_SUBST(voidp_size)
>       AC_SUBST(short_value)
>     +--
>     +1.8.3.1
>     +
>     diff --git a/meta/recipes-support/apr/apr/0002-cleanup.patch
>     b/meta/recipes-support/apr/apr/0002-cleanup.patch
>     new file mode 100644
>     index 0000000..1dc97e3
>     --- /dev/null
>     +++ b/meta/recipes-support/apr/apr/0002-cleanup.patch
>     @@ -0,0 +1,59 @@
>     +From 286ff5f96c7d3ff2210d0f1b43c670b9deea07ec Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Tue, 30 Jan 2018 09:36:32 +0800
>     +Subject: [PATCH 2/8] cleanup
>     +
>     +Upstream-Status: Inappropriate [configuration]
>     +
>     +Rebase to 1.6.3
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + build/buildcheck.sh | 35 +----------------------------------
>     + 1 file changed, 1 insertion(+), 34 deletions(-)
>     +
>     +diff --git a/build/buildcheck.sh b/build/buildcheck.sh
>     +index ab5df44..b7e719a 100755
>     +--- a/build/buildcheck.sh
>     ++++ b/build/buildcheck.sh
>     +@@ -34,37 +34,4 @@ else
>     +   fi
>     + fi
>     +
>     +-# Sample libtool --version outputs:
>     +-# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)
>     +-# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
>     +-# output is multiline from 1.5 onwards
>     +-
>     +-# Require libtool 1.4 or newer
>     +-libtool=`build/PrintPath glibtool1 glibtool libtool libtool15
>     libtool14`
>     +-lt_pversion=`$libtool --version 2>/dev/null|sed -e
>     's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
>     +-if test -z "$lt_pversion"; then
>     +-  echo "buildconf: libtool not found."
>     +-  echo "           You need libtool version 1.4 or newer installed"
>     +-  echo "           to build APR from SVN."
>     +-  res=1
>     +-else
>     +-  lt_version=`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
>     +-  IFS=.; set $lt_version; IFS=' '
>     +-  lt_status="good"
>     +-  if test "$1" = "1"; then
>     +-    if test "$2" -lt "4"; then
>     +-      lt_status="bad"
>     +-    fi
>     +-  fi
>     +-  if test $lt_status = "good"; then
>     +-    echo "buildconf: libtool version $lt_pversion (ok)"
>     +-  else
>     +-    echo "buildconf: libtool version $lt_pversion found."
>     +-    echo "           You need libtool version 1.4 or newer
>     installed"
>     +-    echo "           to build APR from SVN."
>     +-    res=1
>     +-  fi
>     +-fi
>     +-
>     +-exit $res
>     +-
>     ++exit 0
>     +--
>     +1.8.3.1
>     +
>     diff --git a/meta/recipes-support/apr/apr/configfix.patch
>     b/meta/recipes-support/apr/apr/0003-configfix.patch
>     similarity index 75%
>     rename from meta/recipes-support/apr/apr/configfix.patch
>     rename to meta/recipes-support/apr/apr/0003-configfix.patch
>     index 605c4f6..30194a7 100644
>     --- a/meta/recipes-support/apr/apr/configfix.patch
>     +++ b/meta/recipes-support/apr/apr/0003-configfix.patch
>     @@ -1,10 +1,22 @@
>     +From 70a98680045ce31b34dae191b980470e4988bf7f Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Tue, 30 Jan 2018 09:39:06 +0800
>     +Subject: [PATCH 3/8] configfix
>     +
>      Upstream-Status: Inappropriate [configuration]
>
>     -Index: apr-1.3.3/apr-config.in <http://apr-config.in>
>     -===================================================================
>     ---- apr-1.3.3.orig/apr-config.in <http://apr-config.in>    
>      2009-01-12 15:16:31.000000000 +0000
>     -+++ apr-1.3.3/apr-config.in <http://apr-config.in>   2009-01-12
>     15:19:25.000000000 +0000
>     -@@ -152,14 +152,7 @@
>     +Rebase to 1.6.3
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + apr-config.in <http://apr-config.in> | 26 ++------------------------
>     + 1 file changed, 2 insertions(+), 24 deletions(-)
>     +
>     +diff --git a/apr-config.in <http://apr-config.in> b/apr-config.in
>     <http://apr-config.in>
>     +index 84b4073..bbbf651 100644
>     +--- a/apr-config.in <http://apr-config.in>
>     ++++ b/apr-config.in <http://apr-config.in>
>     +@@ -152,14 +152,7 @@ while test $# -gt 0; do
>           flags="$flags $LDFLAGS"
>           ;;
>           --includes)
>     @@ -19,7 +31,7 @@ Index: apr-1.3.3/apr-config.in
>     <http://apr-config.in>
>           ;;
>           --srcdir)
>           echo $APR_SOURCE_DIR
>     -@@ -181,29 +167,14 @@
>     +@@ -181,29 +174,14 @@ while test $# -gt 0; do
>           exit 0
>           ;;
>           --link-ld)
>     @@ -51,3 +63,6 @@ Index: apr-1.3.3/apr-config.in
>     <http://apr-config.in>
>           ;;
>           --shlib-path-var)
>           echo "$SHLIBPATH_VAR"
>     +--
>     +1.8.3.1
>     +
>     diff --git
>     a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
>     b/meta/recipes-support/apr/apr/0004-Makefile.in-fix-cross-compiling-failed.patch
>     similarity index 81%
>     rename from meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
>     rename to
>     meta/recipes-support/apr/apr/0004-Makefile.in-fix-cross-compiling-failed.patch
>     index 16499f5..b4517dd 100644
>     --- a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
>     +++
>     b/meta/recipes-support/apr/apr/0004-Makefile.in-fix-cross-compiling-failed.patch
>     @@ -1,4 +1,7 @@
>     -Makefile.in: fix cross compiling failed
>     +From 5b10d55396904982097e1da4c395fdeccb9d0d6a Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Tue, 30 Jan 2018 09:41:13 +0800
>     +Subject: [PATCH 4/8] Makefile.in: fix cross compiling failed
>
>      The tools/gen_test_char was invoked at build time,
>      and it didn't work for the cross compiling, so we
>     @@ -10,13 +13,14 @@ do_install time.
>
>      Upstream-Status: Inappropriate [oe specific]
>
>     +Rebase to 1.6.3
>      Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>      ---
>       Makefile.in | 10 ++--------
>       1 file changed, 2 insertions(+), 8 deletions(-)
>
>      diff --git a/Makefile.in b/Makefile.in
>     -index a2a5194..5fe028f 100644
>     +index 5fb760e..f9e4445 100644
>      --- a/Makefile.in
>      +++ b/Makefile.in
>      @@ -46,7 +46,6 @@ LT_VERSION = @LT_VERSION@
>     @@ -27,7 +31,7 @@ index a2a5194..5fe028f 100644
>             include/private/apr_escape_test_char.h
>       DISTCLEAN_TARGETS = config.cache config.log config.status \
>             include/apr.h include/arch/unix/apr_private.h \
>     -@@ -129,13 +128,8 @@ check: $(TARGET_LIB)
>     +@@ -131,13 +130,8 @@ check: $(TARGET_LIB)
>       etags:
>             etags `find . -name '*.[ch]'`
>
>     @@ -43,3 +47,6 @@ index a2a5194..5fe028f 100644
>
>       include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
>             $(APR_MKDIR) include/private
>     +--
>     +1.8.3.1
>     +
>     diff --git
>     a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>     b/meta/recipes-support/apr/apr/0005-Fix-packet-discards-HTTP-redirect.patch
>     similarity index 71%
>     rename from
>     meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>     rename to
>     meta/recipes-support/apr/apr/0005-Fix-packet-discards-HTTP-redirect.patch
>     index 6805b8b..2167da5 100644
>     ---
>     a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>     +++
>     b/meta/recipes-support/apr/apr/0005-Fix-packet-discards-HTTP-redirect.patch
>     @@ -1,4 +1,7 @@
>     -Fix packet discards HTTP redirect.
>     +From 78a148715444bdeb1363f0d1182901512146a439 Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Tue, 30 Jan 2018 09:43:34 +0800
>     +Subject: [PATCH 5/8] Fix packet discards HTTP redirect.
>
>      Disconnect the connection by poll() timeout.
>      If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
>     @@ -8,12 +11,16 @@ Upstream-Status: Pending
>
>      Signed-off-by: Noriaki Yoshitane
>     <yoshitane.nrs@cnt.ncos.nec.co.jp
>     <mailto:yoshitane.nrs@cnt.ncos.nec.co.jp>>
>      Signed-off-by: Li Wang <li.wang@windriver.com
>     <mailto:li.wang@windriver.com>>
>     +
>     +Rebase to 1.6.3
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>      ---
>     - network_io/unix/sendrecv.c |    4 ++++
>     + network_io/unix/sendrecv.c | 4 ++++
>       1 file changed, 4 insertions(+)
>
>      diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c
>     -index c133a26..e8faf15 100644
>     +index 4c0e0a6..1bdafba 100644
>      --- a/network_io/unix/sendrecv.c
>      +++ b/network_io/unix/sendrecv.c
>      @@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t
>     *sock, char *buf, apr_size_t *len)
>     @@ -28,5 +35,5 @@ index c133a26..e8faf15 100644
>                   *len = 0;
>                   return arv;
>      --
>     -1.7.9.5
>     +1.8.3.1
>
>     diff --git
>     a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     b/meta/recipes-support/apr/apr/0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     similarity index 81%
>     rename from
>     meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     rename to
>     meta/recipes-support/apr/apr/0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     index 7521eeb..b8714b1 100644
>     ---
>     a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     +++
>     b/meta/recipes-support/apr/apr/0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     @@ -1,7 +1,7 @@
>     -From d439093aa07a486f559206ac9e5808a6a18218cd Mon Sep 17 00:00:00
>     2001
>     +From 9620df513b237c4839e3e6d6459d6363e21d48be Mon Sep 17 00:00:00
>     2001
>      From: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>      Date: Thu, 19 Nov 2015 18:25:38 -0800
>     -Subject: [PATCH] configure.in <http://configure.in>: fix LTFLAGS
>     to make it work with ccache
>     +Subject: [PATCH 6/8] configure.in <http://configure.in>: fix
>     LTFLAGS to make it work with ccache
>
>      When ccache is enabled, libtool requires --tag=CC when use ccache,
>      otherwise when building apr-util with ccache enabled:
>     @@ -15,11 +15,11 @@ Upstream-Status: Pending
>
>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>      ---
>     - configure.in <http://configure.in> |   2 +-
>     + configure.in <http://configure.in> | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>      diff --git a/configure.in <http://configure.in> b/configure.in
>     <http://configure.in>
>     -index 5a4a988..9d57ae6 100644
>     +index 470c99a..d215d98 100644
>      --- a/configure.in <http://configure.in>
>      +++ b/configure.in <http://configure.in>
>      @@ -246,7 +246,7 @@ case $host in
>     @@ -32,5 +32,5 @@ index 5a4a988..9d57ae6 100644
>           if test "$experimental_libtool" = "yes"; then
>               # Use a custom-made libtool replacement
>      --
>     -1.7.9.5
>     +1.8.3.1
>
>     diff --git
>     a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     b/meta/recipes-support/apr/apr/0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     similarity index 85%
>     rename from
>     meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     rename to
>     meta/recipes-support/apr/apr/0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     index c5e92ac..f93da0d 100644
>     ---
>     a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     +++
>     b/meta/recipes-support/apr/apr/0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     @@ -1,7 +1,7 @@
>     -From f26e8b88d2c90ed7eb9d4e276412b0923c23d10f Mon Sep 17 00:00:00
>     2001
>     +From 5252a5b8b47eaba3c05e69c43c8cea6b1b8acbc9 Mon Sep 17 00:00:00
>     2001
>      From: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>      Date: Wed, 14 Dec 2016 18:13:08 +0800
>     -Subject: [PATCH] apr: fix off_t size doesn't match in glibc when
>     cross
>     +Subject: [PATCH 7/8] apr: fix off_t size doesn't match in glibc
>     when cross
>       compiling
>
>      In configure.in <http://configure.in>, it contains the following:
>     @@ -34,10 +34,10 @@ Upstream-Status: Pending
>       1 file changed, 4 insertions(+), 4 deletions(-)
>
>      diff --git a/configure.in <http://configure.in> b/configure.in
>     <http://configure.in>
>     -index 9d57ae6..5b19940 100644
>     +index d215d98..3c579f5 100644
>      --- a/configure.in <http://configure.in>
>      +++ b/configure.in <http://configure.in>
>     -@@ -1681,7 +1681,7 @@ else
>     +@@ -1733,7 +1733,7 @@ else
>           socklen_t_value="int"
>       fi
>
>     @@ -46,7 +46,7 @@ index 9d57ae6..5b19940 100644
>
>       if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short"; then
>           pid_t_fmt='#define APR_PID_T_FMT "hd"'
>     -@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long,
>     [ssize_t_fmt="ld"])
>     +@@ -1802,7 +1802,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long,
>     [ssize_t_fmt="ld"])
>       APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt="u"])
>       APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt="lu"])
>
>     @@ -55,7 +55,7 @@ index 9d57ae6..5b19940 100644
>
>       AC_MSG_CHECKING([which format to use for apr_ssize_t])
>       if test -n "$ssize_t_fmt"; then
>     -@@ -1767,7 +1767,7 @@ fi
>     +@@ -1819,7 +1819,7 @@ fi
>
>       ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
>
>     @@ -64,7 +64,7 @@ index 9d57ae6..5b19940 100644
>
>       AC_MSG_CHECKING([which format to use for apr_size_t])
>       if test -n "$size_t_fmt"; then
>     -@@ -1784,7 +1784,7 @@ fi
>     +@@ -1836,7 +1836,7 @@ fi
>
>       size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""
>
>     @@ -74,5 +74,5 @@ index 9d57ae6..5b19940 100644
>       if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" = "4yes"; then
>           # Enable LFS
>      --
>     -2.7.4
>     +1.8.3.1
>
>     diff --git
>     a/meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     b/meta/recipes-support/apr/apr/0008-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     similarity index 90%
>     rename from
>     meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     rename to
>     meta/recipes-support/apr/apr/0008-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     index 7d0dddc..e7c0c8e 100644
>     ---
>     a/meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     +++
>     b/meta/recipes-support/apr/apr/0008-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     @@ -1,8 +1,8 @@
>     -From 94d1ca0266a0f9c0446f1299b54f752e87b8a695 Mon Sep 17 00:00:00
>     2001
>     +From 922795e34289877ed2610f7bb44e044bcfb73cd5 Mon Sep 17 00:00:00
>     2001
>      From: =?UTF-8?q?Andreas=20M=C3=BCller?=
>     <schnitzeltony@googlemail.com <mailto:schnitzeltony@googlemail.com>>
>      Date: Fri, 3 Mar 2017 22:24:17 +0100
>     -Subject: [PATCH] explicitly link libapr against phtread to make
>     gold happy on
>     - test
>     +Subject: [PATCH 8/8] explicitly link libapr against phtread to
>     make gold happy
>     + on test
>      MIME-Version: 1.0
>      Content-Type: text/plain; charset=UTF-8
>      Content-Transfer-Encoding: 8bit
>     @@ -34,10 +34,10 @@ Signed-off-by: Andreas Müller
>     <schnitzeltony@googlemail.com <mailto:schnitzeltony@googlemail.com>>
>       1 file changed, 1 insertion(+)
>
>      diff --git a/configure.in <http://configure.in> b/configure.in
>     <http://configure.in>
>     -index 5b19940..cdf4d58 100644
>     +index 3c579f5..06afb62 100644
>      --- a/configure.in <http://configure.in>
>      +++ b/configure.in <http://configure.in>
>     -@@ -766,6 +766,7 @@ else
>     +@@ -781,6 +781,7 @@ else
>                 APR_PTHREADS_CHECK_RESTORE ] )
>           fi
>           if test "$pthreadh" = "1"; then
>     @@ -46,5 +46,5 @@ index 5b19940..cdf4d58 100644
>               APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
>               APR_CHECK_PTHREAD_RECURSIVE_MUTEX
>      --
>     -2.9.3
>     +1.8.3.1
>
>     diff --git a/meta/recipes-support/apr/apr/cleanup.patch
>     b/meta/recipes-support/apr/apr/cleanup.patch
>     deleted file mode 100644
>     index b6784e0..0000000
>     --- a/meta/recipes-support/apr/apr/cleanup.patch
>     +++ /dev/null
>     @@ -1,43 +0,0 @@
>     -Upstream-Status: Inappropriate [configuration]
>     -
>     -Index: apr-1.4.2/build/buildcheck.sh
>     -===================================================================
>     ---- apr-1.4.2.orig/build/buildcheck.sh 2009-11-13
>     08:27:16.000000000 +0800
>     -+++ apr-1.4.2/build/buildcheck.sh      2010-11-26
>     15:44:00.000000000 +0800
>     -@@ -32,35 +32,4 @@
>     - echo "buildconf: autoconf version $ac_version (ok)"
>     - fi
>     -
>     --# Sample libtool --version outputs:
>     --# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)
>     --# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
>     --# output is multiline from 1.5 onwards
>     --
>     --# Require libtool 1.4 or newer
>     --libtool=`build/PrintPath glibtool1 glibtool libtool libtool15
>     libtool14`
>     --lt_pversion=`$libtool --version 2>/dev/null|sed -e
>     's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
>     --if test -z "$lt_pversion"; then
>     --echo "buildconf: libtool not found."
>     --echo "           You need libtool version 1.4 or newer installed"
>     --echo "           to build APR from SVN."
>     --exit 1
>     --fi
>     --lt_version=`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
>     --IFS=.; set $lt_version; IFS=' '
>     --lt_status="good"
>     --if test "$1" = "1"; then
>     --   if test "$2" -lt "4"; then
>     --      lt_status="bad"
>     --   fi
>     --fi
>     --if test $lt_status = "good"; then
>     --   echo "buildconf: libtool version $lt_pversion (ok)"
>     --   exit 0
>     --fi
>     --
>     --echo "buildconf: libtool version $lt_pversion found."
>     --echo "           You need libtool version 1.4 or newer installed"
>     --echo "           to build APR from SVN."
>     --
>     --exit 1
>     -+exit 0
>     diff --git a/meta/recipes-support/apr/apr_1.6.2.bb
>     <http://apr_1.6.2.bb> b/meta/recipes-support/apr/apr_1.6.3.bb
>     <http://apr_1.6.3.bb>
>     similarity index 81%
>     rename from meta/recipes-support/apr/apr_1.6.2.bb
>     <http://apr_1.6.2.bb>
>     rename to meta/recipes-support/apr/apr_1.6.3.bb <http://apr_1.6.3.bb>
>     index e2eed53..1bc4759 100644
>     --- a/meta/recipes-support/apr/apr_1.6.2.bb <http://apr_1.6.2.bb>
>     +++ b/meta/recipes-support/apr/apr_1.6.3.bb <http://apr_1.6.3.bb>
>     @@ -10,19 +10,19 @@ LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
>      BBCLASSEXTEND = "native nativesdk"
>
>      SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>     -           file://configure_fixes.patch \
>     -           file://cleanup.patch \
>     -           file://configfix.patch \
>                 file://run-ptest \
>     -           file://upgrade-and-fix-1.5.1.patch \
>     -           file://Fix-packet-discards-HTTP-redirect.patch \
>     -         
>      file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
>     -         
>      file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     \
>     -         
>      file://0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     \
>     +           file://0001-configure-fixes.patch \
>     +           file://0002-cleanup.patch \
>     +           file://0003-configfix.patch \
>     +           file://0004-Makefile.in-fix-cross-compiling-failed.patch \
>     +           file://0005-Fix-packet-discards-HTTP-redirect.patch \
>     +         
>      file://0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
>     \
>     +         
>      file://0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>     \
>     +         
>      file://0008-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>     \
>      "
>
>     -SRC_URI[md5sum] = "e81a851967c79b5ce9bfbc909e4bf735"
>     -SRC_URI[sha256sum] =
>     "09109cea377bab0028bba19a92b5b0e89603df9eab05c0f7dbd4dd83d48dcebd"
>     +SRC_URI[md5sum] = "12f2a349483ad6f12db49ba01fbfdbfa"
>     +SRC_URI[sha256sum] =
>     "131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172"
>
>      inherit autotools-brokensep lib_package binconfig multilib_header
>     ptest
>
>     @@ -69,7 +69,8 @@ do_install_append() {
>      }
>
>      do_install_append_class-target() {
>     -       sed -i -e 's,${STAGING_DIR_HOST},,g'
>     ${D}${datadir}/build-1/apr_rules.mk <http://apr_rules.mk>
>     +       sed -i -e 's,${DEBUG_PREFIX_MAP},,g' \
>     +              -e 's,${STAGING_DIR_HOST},,g'
>     ${D}${datadir}/build-1/apr_rules.mk <http://apr_rules.mk>
>             sed -i -e 's,${STAGING_DIR_HOST},,g' \
>                    -e 's,APR_SOURCE_DIR=.*,APR_SOURCE_DIR=,g' \
>                    -e 's,APR_BUILD_DIR=.*,APR_BUILD_DIR=,g'
>     ${D}${bindir}/apr-1-config
>     --
>     2.8.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------193221D2CEFC5036C4696667
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年01月31日 19:42, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYUo2_mHf1yvBDpD_Ecm1chfgM+nwNFkgkpjq6C7dK-PQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">We're carrying a lot of patches here, and I'm not
        convinced that they are all inappropriate.  Would you be willing
        to see what of those are upstreamable?
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    It's a long story for these patches, it's hard to trace the history
    from git.<br>
    <br>
    I will choose an alternate fix to replace the inappropriate patches.<br>
    <br>
    V2 incoming<br>
    <br>
    //Hongxu<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LYUo2_mHf1yvBDpD_Ecm1chfgM+nwNFkgkpjq6C7dK-PQ@mail.gmail.com">
      <div dir="ltr">
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 31 January 2018 at 07:48, Hongxu Jia
          <span dir="ltr">&lt;<a href="mailto:hongxu.jia@windriver.com"
              target="_blank" moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">- Rebase
            patches 0001 ~ 0008<br>
            <br>
            - Fix build path issue to improve reproducibility<br>
            <br>
            Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            ---<br>
             ...gure_fixes.patch =&gt; 0001-configure-fixes.patch} | 28
            +++++++---<br>
             meta/recipes-support/apr/apr/<wbr>0002-cleanup.patch    |
            59 ++++++++++++++++++++++<br>
             .../apr/{configfix.patch =&gt; 0003-configfix.patch}  | 27
            +++++++---<br>
             ...4-Makefile.in-fix-cross-<wbr>compiling-failed.patch} |
            13 +++--<br>
             ...&gt; 0005-Fix-packet-discards-HTTP-<wbr>redirect.patch}
            | 15 ++++--<br>
             ...-fix-LTFLAGS-to-make-it-<wbr>work-with-ccache.patch} |
            10 ++--<br>
             ...t-size-doesn-t-match-in-<wbr>glibc-when-cross.patch} |
            16 +++---<br>
             ...ink-libapr-against-phtread-<wbr>to-make-gold-.patch} |
            12 ++---<br>
             meta/recipes-support/apr/apr/<wbr>cleanup.patch         |
            43 ----------------<br>
             .../apr/{<a href="http://apr_1.6.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr_1.6.2.bb</a>
            =&gt; <a href="http://apr_1.6.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr_1.6.3.bb</a>} 
                       | 23 +++++----<br>
             10 files changed, 153 insertions(+), 93 deletions(-)<br>
             rename meta/recipes-support/apr/apr/{<wbr>configure_fixes.patch
            =&gt; 0001-configure-fixes.patch} (69%)<br>
             create mode 100644 meta/recipes-support/apr/apr/<wbr>0002-cleanup.patch<br>
             rename meta/recipes-support/apr/apr/{<wbr>configfix.patch
            =&gt; 0003-configfix.patch} (75%)<br>
             rename meta/recipes-support/apr/apr/{<wbr>upgrade-and-fix-1.5.1.patch
            =&gt; 0004-Makefile.in-fix-cross-<wbr>compiling-failed.patch}
            (81%)<br>
             rename meta/recipes-support/apr/apr/{<wbr>Fix-packet-discards-HTTP-<wbr>redirect.patch
            =&gt; 0005-Fix-packet-discards-HTTP-<wbr>redirect.patch}
            (71%)<br>
             rename meta/recipes-support/apr/apr/{<wbr>configure.in-fix-LTFLAGS-to-<wbr>make-it-work-with-ccache.patch
            =&gt; 0006-configure.in-fix-LTFLAGS-<wbr>to-make-it-work-with-ccache.<wbr>patch}
            (81%)<br>
             rename meta/recipes-support/apr/apr/{<wbr>0001-apr-fix-off_t-size-doesn-<wbr>t-match-in-glibc-when-cross.<wbr>patch
            =&gt; 0007-apr-fix-off_t-size-doesn-<wbr>t-match-in-glibc-when-cross.<wbr>patch}
            (85%)<br>
             rename meta/recipes-support/apr/apr/{<wbr>0002-explicitly-link-libapr-<wbr>against-phtread-to-make-gold-.<wbr>patch
            =&gt; 0008-explicitly-link-libapr-<wbr>against-phtread-to-make-gold-.<wbr>patch}
            (90%)<br>
             delete mode 100644 meta/recipes-support/apr/apr/<wbr>cleanup.patch<br>
             rename meta/recipes-support/apr/{<a
              href="http://apr_1.6.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr_<wbr>1.6.2.bb</a>
            =&gt; <a href="http://apr_1.6.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr_1.6.3.bb</a>}
            (81%)<br>
            <br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/configure_fixes.patch
            b/meta/recipes-support/apr/<wbr>apr/0001-configure-fixes.patch<br>
            similarity index 69%<br>
            rename from meta/recipes-support/apr/apr/<wbr>configure_fixes.patch<br>
            rename to meta/recipes-support/apr/apr/<wbr>0001-configure-fixes.patch<br>
            index 0514000..374bb65 100644<br>
            --- a/meta/recipes-support/apr/<wbr>apr/configure_fixes.patch<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0001-configure-fixes.patch<br>
            @@ -1,11 +1,22 @@<br>
            +From ed491771f5a8976f9f05253f5f68b4<wbr>cb5ac9b05f Mon Sep
            17 00:00:00 2001<br>
            +From: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +Date: Tue, 30 Jan 2018 09:33:51 +0800<br>
            +Subject: [PATCH 1/8] configure fixes<br>
            +<br>
             Upstream-Status: Inappropriate [configuration]<br>
            <br>
            -Index: apr-1.3.3/<a href="http://configure.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">configure.in</a><br>
            -=============================<wbr>==============================<wbr>========<br>
            ---- apr-1.3.3.orig/<a href="http://configure.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">configure.in</a><br>
            -+++ apr-1.3.3/<a href="http://configure.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">configure.in</a><br>
            -@@ -794,39 +794,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open
            shm<br>
            -                 create_area])<br>
            +Rebase to 1.6.3<br>
            +Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +---<br>
            + <a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a> |
            48 ++++++++----------------------<wbr>------------------<br>
            + 1 file changed, 8 insertions(+), 40 deletions(-)<br>
            +<br>
            +diff --git a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a> b/<a
              href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            +index 719f331..470c99a 100644<br>
            +--- a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            ++++ b/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            +@@ -1167,39 +1167,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open
            shm_unlink shmget shmat shmdt shmctl \<br>
            +                 create_area mprotect])<br>
            <br>
              APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)<br>
             -AC_CHECK_FILE(/dev/zero)<br>
            @@ -44,7 +55,7 @@ Index: apr-1.3.3/<a
              href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            <br>
              # Now we determine which one is our anonymous shmem
            preference.<br>
              haveshmgetanon="0"<br>
            -@@ -1518,13 +1485,14 @@ else<br>
            +@@ -1976,13 +1943,14 @@ else<br>
                  bigendian=0<br>
              fi<br>
            <br>
            @@ -66,3 +77,6 @@ Index: apr-1.3.3/<a
              href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            <br>
              AC_SUBST(voidp_size)<br>
              AC_SUBST(short_value)<br>
            +--<br>
            +1.8.3.1<br>
            +<br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/0002-cleanup.patch
            b/meta/recipes-support/apr/<wbr>apr/0002-cleanup.patch<br>
            new file mode 100644<br>
            index 0000000..1dc97e3<br>
            --- /dev/null<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0002-cleanup.patch<br>
            @@ -0,0 +1,59 @@<br>
            +From 286ff5f96c7d3ff2210d0f1b43c670<wbr>b9deea07ec Mon Sep
            17 00:00:00 2001<br>
            +From: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +Date: Tue, 30 Jan 2018 09:36:32 +0800<br>
            +Subject: [PATCH 2/8] cleanup<br>
            +<br>
            +Upstream-Status: Inappropriate [configuration]<br>
            +<br>
            +Rebase to 1.6.3<br>
            +Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +---<br>
            + build/buildcheck.sh | 35 +-----------------------------<wbr>-----<br>
            + 1 file changed, 1 insertion(+), 34 deletions(-)<br>
            +<br>
            +diff --git a/build/buildcheck.sh b/build/buildcheck.sh<br>
            +index ab5df44..b7e719a 100755<br>
            +--- a/build/buildcheck.sh<br>
            ++++ b/build/buildcheck.sh<br>
            +@@ -34,37 +34,4 @@ else<br>
            +   fi<br>
            + fi<br>
            +<br>
            +-# Sample libtool --version outputs:<br>
            +-# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02
            15:49:11)<br>
            +-# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a<br>
            +-# output is multiline from 1.5 onwards<br>
            +-<br>
            +-# Require libtool 1.4 or newer<br>
            +-libtool=`build/PrintPath glibtool1 glibtool libtool
            libtool15 libtool14`<br>
            +-lt_pversion=`$libtool --version 2&gt;/dev/null|sed -e
            's/([^)]*)//g;s/^[^0-9]*//;s/[<wbr>- ].*//g;q'`<br>
            +-if test -z "$lt_pversion"; then<br>
            +-  echo "buildconf: libtool not found."<br>
            +-  echo "           You need libtool version 1.4 or newer
            installed"<br>
            +-  echo "           to build APR from SVN."<br>
            +-  res=1<br>
            +-else<br>
            +-  lt_version=`echo $lt_pversion|sed -e
            's/\([a-z]*\)$/.\1/'`<br>
            +-  IFS=.; set $lt_version; IFS=' '<br>
            +-  lt_status="good"<br>
            +-  if test "$1" = "1"; then<br>
            +-    if test "$2" -lt "4"; then<br>
            +-      lt_status="bad"<br>
            +-    fi<br>
            +-  fi<br>
            +-  if test $lt_status = "good"; then<br>
            +-    echo "buildconf: libtool version $lt_pversion (ok)"<br>
            +-  else<br>
            +-    echo "buildconf: libtool version $lt_pversion found."<br>
            +-    echo "           You need libtool version 1.4 or newer
            installed"<br>
            +-    echo "           to build APR from SVN."<br>
            +-    res=1<br>
            +-  fi<br>
            +-fi<br>
            +-<br>
            +-exit $res<br>
            +-<br>
            ++exit 0<br>
            +--<br>
            +1.8.3.1<br>
            +<br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/configfix.patch
            b/meta/recipes-support/apr/<wbr>apr/0003-configfix.patch<br>
            similarity index 75%<br>
            rename from meta/recipes-support/apr/apr/<wbr>configfix.patch<br>
            rename to meta/recipes-support/apr/apr/<wbr>0003-configfix.patch<br>
            index 605c4f6..30194a7 100644<br>
            --- a/meta/recipes-support/apr/<wbr>apr/configfix.patch<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0003-configfix.patch<br>
            @@ -1,10 +1,22 @@<br>
            +From 70a98680045ce31b34dae191b98047<wbr>0e4988bf7f Mon Sep
            17 00:00:00 2001<br>
            +From: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +Date: Tue, 30 Jan 2018 09:39:06 +0800<br>
            +Subject: [PATCH 3/8] configfix<br>
            +<br>
             Upstream-Status: Inappropriate [configuration]<br>
            <br>
            -Index: apr-1.3.3/<a href="http://apr-config.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr-config.in</a><br>
            -=============================<wbr>==============================<wbr>========<br>
            ---- apr-1.3.3.orig/<a href="http://apr-config.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr-config.in</a> 
                 2009-01-12 15:16:31.000000000 +0000<br>
            -+++ apr-1.3.3/<a href="http://apr-config.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr-config.in</a> 
              2009-01-12 15:19:25.000000000 +0000<br>
            -@@ -152,14 +152,7 @@<br>
            +Rebase to 1.6.3<br>
            +<br>
            +Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +---<br>
            + <a href="http://apr-config.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr-config.in</a> |
            26 ++------------------------<br>
            + 1 file changed, 2 insertions(+), 24 deletions(-)<br>
            +<br>
            +diff --git a/<a href="http://apr-config.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr-config.in</a>
            b/<a href="http://apr-config.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr-config.in</a><br>
            +index 84b4073..bbbf651 100644<br>
            +--- a/<a href="http://apr-config.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr-config.in</a><br>
            ++++ b/<a href="http://apr-config.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr-config.in</a><br>
            +@@ -152,14 +152,7 @@ while test $# -gt 0; do<br>
                  flags="$flags $LDFLAGS"<br>
                  ;;<br>
                  --includes)<br>
            @@ -19,7 +31,7 @@ Index: apr-1.3.3/<a
              href="http://apr-config.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr-config.in</a><br>
                  ;;<br>
                  --srcdir)<br>
                  echo $APR_SOURCE_DIR<br>
            -@@ -181,29 +167,14 @@<br>
            +@@ -181,29 +174,14 @@ while test $# -gt 0; do<br>
                  exit 0<br>
                  ;;<br>
                  --link-ld)<br>
            @@ -51,3 +63,6 @@ Index: apr-1.3.3/<a
              href="http://apr-config.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr-config.in</a><br>
                  ;;<br>
                  --shlib-path-var)<br>
                  echo "$SHLIBPATH_VAR"<br>
            +--<br>
            +1.8.3.1<br>
            +<br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/upgrade-and-fix-1.5.1.<wbr>patch
            b/meta/recipes-support/apr/<wbr>apr/0004-Makefile.in-fix-<wbr>cross-compiling-failed.patch<br>
            similarity index 81%<br>
            rename from meta/recipes-support/apr/apr/<wbr>upgrade-and-fix-1.5.1.patch<br>
            rename to meta/recipes-support/apr/apr/<wbr>0004-Makefile.in-fix-cross-<wbr>compiling-failed.patch<br>
            index 16499f5..b4517dd 100644<br>
            --- a/meta/recipes-support/apr/<wbr>apr/upgrade-and-fix-1.5.1.<wbr>patch<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0004-Makefile.in-fix-<wbr>cross-compiling-failed.patch<br>
            @@ -1,4 +1,7 @@<br>
            -Makefile.in: fix cross compiling failed<br>
            +From 5b10d55396904982097e1da4c395fd<wbr>eccb9d0d6a Mon Sep
            17 00:00:00 2001<br>
            +From: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +Date: Tue, 30 Jan 2018 09:41:13 +0800<br>
            +Subject: [PATCH 4/8] Makefile.in: fix cross compiling
            failed<br>
            <br>
             The tools/gen_test_char was invoked at build time,<br>
             and it didn't work for the cross compiling, so we<br>
            @@ -10,13 +13,14 @@ do_install time.<br>
            <br>
             Upstream-Status: Inappropriate [oe specific]<br>
            <br>
            +Rebase to 1.6.3<br>
             Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
             ---<br>
              Makefile.in | 10 ++--------<br>
              1 file changed, 2 insertions(+), 8 deletions(-)<br>
            <br>
             diff --git a/Makefile.in b/Makefile.in<br>
            -index a2a5194..5fe028f 100644<br>
            +index 5fb760e..f9e4445 100644<br>
             --- a/Makefile.in<br>
             +++ b/Makefile.in<br>
             @@ -46,7 +46,6 @@ LT_VERSION = @LT_VERSION@<br>
            @@ -27,7 +31,7 @@ index a2a5194..5fe028f 100644<br>
                    include/private/apr_escape_<wbr>test_char.h<br>
              DISTCLEAN_TARGETS = config.cache config.log config.status
            \<br>
                    include/apr.h include/arch/unix/apr_private.<wbr>h \<br>
            -@@ -129,13 +128,8 @@ check: $(TARGET_LIB)<br>
            +@@ -131,13 +130,8 @@ check: $(TARGET_LIB)<br>
              etags:<br>
                    etags `find . -name '*.[ch]'`<br>
            <br>
            @@ -43,3 +47,6 @@ index a2a5194..5fe028f 100644<br>
            <br>
              include/private/apr_escape_<wbr>test_char.h:
            tools/gen_test_char@EXEEXT@<br>
                    $(APR_MKDIR) include/private<br>
            +--<br>
            +1.8.3.1<br>
            +<br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/Fix-packet-discards-HTTP-<wbr>redirect.patch
            b/meta/recipes-support/apr/<wbr>apr/0005-Fix-packet-discards-<wbr>HTTP-redirect.patch<br>
            similarity index 71%<br>
            rename from meta/recipes-support/apr/apr/<wbr>Fix-packet-discards-HTTP-<wbr>redirect.patch<br>
            rename to meta/recipes-support/apr/apr/<wbr>0005-Fix-packet-discards-HTTP-<wbr>redirect.patch<br>
            index 6805b8b..2167da5 100644<br>
            --- a/meta/recipes-support/apr/<wbr>apr/Fix-packet-discards-HTTP-<wbr>redirect.patch<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0005-Fix-packet-discards-<wbr>HTTP-redirect.patch<br>
            @@ -1,4 +1,7 @@<br>
            -Fix packet discards HTTP redirect.<br>
            +From 78a148715444bdeb1363f0d1182901<wbr>512146a439 Mon Sep
            17 00:00:00 2001<br>
            +From: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +Date: Tue, 30 Jan 2018 09:43:34 +0800<br>
            +Subject: [PATCH 5/8] Fix packet discards HTTP redirect.<br>
            <br>
             Disconnect the connection by poll() timeout.<br>
             If timeout=0 and apr_wait_for_io_or_timeout()=<wbr>APR_TIMEUP
            then<br>
            @@ -8,12 +11,16 @@ Upstream-Status: Pending<br>
            <br>
             Signed-off-by: Noriaki Yoshitane &lt;<a
              href="mailto:yoshitane.nrs@cnt.ncos.nec.co.jp"
              moz-do-not-send="true">yoshitane.nrs@cnt.ncos.nec.<wbr>co.jp</a>&gt;<br>
             Signed-off-by: Li Wang &lt;<a
              href="mailto:li.wang@windriver.com" moz-do-not-send="true">li.wang@windriver.com</a>&gt;<br>
            +<br>
            +Rebase to 1.6.3<br>
            +<br>
            +Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
             ---<br>
            - network_io/unix/sendrecv.c |    4 ++++<br>
            + network_io/unix/sendrecv.c | 4 ++++<br>
              1 file changed, 4 insertions(+)<br>
            <br>
             diff --git a/network_io/unix/sendrecv.c
            b/network_io/unix/sendrecv.c<br>
            -index c133a26..e8faf15 100644<br>
            +index 4c0e0a6..1bdafba 100644<br>
             --- a/network_io/unix/sendrecv.c<br>
             +++ b/network_io/unix/sendrecv.c<br>
             @@ -85,6 +85,10 @@ apr_status_t
            apr_socket_recv(apr_socket_t *sock, char *buf, apr_size_t
            *len)<br>
            @@ -28,5 +35,5 @@ index c133a26..e8faf15 100644<br>
                          *len = 0;<br>
                          return arv;<br>
             --<br>
            -1.7.9.5<br>
            +1.8.3.1<br>
            <br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/configure.in-fix-LTFLAGS-<wbr>to-make-it-work-with-ccache.<wbr>patch
            b/meta/recipes-support/apr/<wbr>apr/0006-configure.in-fix-<wbr>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch<br>
            similarity index 81%<br>
            rename from meta/recipes-support/apr/apr/<wbr>configure.in-fix-LTFLAGS-to-<wbr>make-it-work-with-ccache.patch<br>
            rename to meta/recipes-support/apr/apr/<wbr>0006-configure.in-fix-LTFLAGS-<wbr>to-make-it-work-with-ccache.<wbr>patch<br>
            index 7521eeb..b8714b1 100644<br>
            --- a/meta/recipes-support/apr/<wbr>apr/configure.in-fix-LTFLAGS-<wbr>to-make-it-work-with-ccache.<wbr>patch<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0006-configure.in-fix-<wbr>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From d439093aa07a486f559206ac9e5808<wbr>a6a18218cd Mon Sep
            17 00:00:00 2001<br>
            +From 9620df513b237c4839e3e6d6459d63<wbr>63e21d48be Mon Sep
            17 00:00:00 2001<br>
             From: Robert Yang &lt;<a
              href="mailto:liezhi.yang@windriver.com"
              moz-do-not-send="true">liezhi.yang@windriver.com</a>&gt;<br>
             Date: Thu, 19 Nov 2015 18:25:38 -0800<br>
            -Subject: [PATCH] <a href="http://configure.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">configure.in</a>:
            fix LTFLAGS to make it work with ccache<br>
            +Subject: [PATCH 6/8] <a href="http://configure.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">configure.in</a>:
            fix LTFLAGS to make it work with ccache<br>
            <br>
             When ccache is enabled, libtool requires --tag=CC when use
            ccache,<br>
             otherwise when building apr-util with ccache enabled:<br>
            @@ -15,11 +15,11 @@ Upstream-Status: Pending<br>
            <br>
             Signed-off-by: Robert Yang &lt;<a
              href="mailto:liezhi.yang@windriver.com"
              moz-do-not-send="true">liezhi.yang@windriver.com</a>&gt;<br>
             ---<br>
            - <a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a> | 
              2 +-<br>
            + <a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a> |
            2 +-<br>
              1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
             diff --git a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a> b/<a
              href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            -index 5a4a988..9d57ae6 100644<br>
            +index 470c99a..d215d98 100644<br>
             --- a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
             +++ b/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
             @@ -246,7 +246,7 @@ case $host in<br>
            @@ -32,5 +32,5 @@ index 5a4a988..9d57ae6 100644<br>
                  if test "$experimental_libtool" = "yes"; then<br>
                      # Use a custom-made libtool replacement<br>
             --<br>
            -1.7.9.5<br>
            +1.8.3.1<br>
            <br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/0001-apr-fix-off_t-size-<wbr>doesn-t-match-in-glibc-when-<wbr>cross.patch
            b/meta/recipes-support/apr/<wbr>apr/0007-apr-fix-off_t-size-<wbr>doesn-t-match-in-glibc-when-<wbr>cross.patch<br>
            similarity index 85%<br>
            rename from meta/recipes-support/apr/apr/<wbr>0001-apr-fix-off_t-size-doesn-<wbr>t-match-in-glibc-when-cross.<wbr>patch<br>
            rename to meta/recipes-support/apr/apr/<wbr>0007-apr-fix-off_t-size-doesn-<wbr>t-match-in-glibc-when-cross.<wbr>patch<br>
            index c5e92ac..f93da0d 100644<br>
            --- a/meta/recipes-support/apr/<wbr>apr/0001-apr-fix-off_t-size-<wbr>doesn-t-match-in-glibc-when-<wbr>cross.patch<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0007-apr-fix-off_t-size-<wbr>doesn-t-match-in-glibc-when-<wbr>cross.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From f26e8b88d2c90ed7eb9d4e276412b0<wbr>923c23d10f Mon Sep
            17 00:00:00 2001<br>
            +From 5252a5b8b47eaba3c05e69c43c8cea<wbr>6b1b8acbc9 Mon Sep
            17 00:00:00 2001<br>
             From: Dengke Du &lt;<a
              href="mailto:dengke.du@windriver.com"
              moz-do-not-send="true">dengke.du@windriver.com</a>&gt;<br>
             Date: Wed, 14 Dec 2016 18:13:08 +0800<br>
            -Subject: [PATCH] apr: fix off_t size doesn't match in glibc
            when cross<br>
            +Subject: [PATCH 7/8] apr: fix off_t size doesn't match in
            glibc when cross<br>
              compiling<br>
            <br>
             In <a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a>,
            it contains the following:<br>
            @@ -34,10 +34,10 @@ Upstream-Status: Pending<br>
              1 file changed, 4 insertions(+), 4 deletions(-)<br>
            <br>
             diff --git a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a> b/<a
              href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            -index 9d57ae6..5b19940 100644<br>
            +index d215d98..3c579f5 100644<br>
             --- a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
             +++ b/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            -@@ -1681,7 +1681,7 @@ else<br>
            +@@ -1733,7 +1733,7 @@ else<br>
                  socklen_t_value="int"<br>
              fi<br>
            <br>
            @@ -46,7 +46,7 @@ index 9d57ae6..5b19940 100644<br>
            <br>
              if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short";
            then<br>
                  pid_t_fmt='#define APR_PID_T_FMT "hd"'<br>
            -@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(<wbr>ssize_t,
            long, [ssize_t_fmt="ld"])<br>
            +@@ -1802,7 +1802,7 @@ APR_CHECK_TYPES_COMPATIBLE(<wbr>ssize_t,
            long, [ssize_t_fmt="ld"])<br>
              APR_CHECK_TYPES_COMPATIBLE(<wbr>size_t, unsigned int,
            [size_t_fmt="u"])<br>
              APR_CHECK_TYPES_COMPATIBLE(<wbr>size_t, unsigned long,
            [size_t_fmt="lu"])<br>
            <br>
            @@ -55,7 +55,7 @@ index 9d57ae6..5b19940 100644<br>
            <br>
              AC_MSG_CHECKING([which format to use for apr_ssize_t])<br>
              if test -n "$ssize_t_fmt"; then<br>
            -@@ -1767,7 +1767,7 @@ fi<br>
            +@@ -1819,7 +1819,7 @@ fi<br>
            <br>
              ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""<br>
            <br>
            @@ -64,7 +64,7 @@ index 9d57ae6..5b19940 100644<br>
            <br>
              AC_MSG_CHECKING([which format to use for apr_size_t])<br>
              if test -n "$size_t_fmt"; then<br>
            -@@ -1784,7 +1784,7 @@ fi<br>
            +@@ -1836,7 +1836,7 @@ fi<br>
            <br>
              size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""<br>
            <br>
            @@ -74,5 +74,5 @@ index 9d57ae6..5b19940 100644<br>
              if test "${ac_cv_sizeof_off_t}${apr_<wbr>cv_use_lfs64}" =
            "4yes"; then<br>
                  # Enable LFS<br>
             --<br>
            -2.7.4<br>
            +1.8.3.1<br>
            <br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>libapr-against-phtread-to-<wbr>make-gold-.patch
            b/meta/recipes-support/apr/<wbr>apr/0008-explicitly-link-<wbr>libapr-against-phtread-to-<wbr>make-gold-.patch<br>
            similarity index 90%<br>
            rename from meta/recipes-support/apr/apr/<wbr>0002-explicitly-link-libapr-<wbr>against-phtread-to-make-gold-.<wbr>patch<br>
            rename to meta/recipes-support/apr/apr/<wbr>0008-explicitly-link-libapr-<wbr>against-phtread-to-make-gold-.<wbr>patch<br>
            index 7d0dddc..e7c0c8e 100644<br>
            --- a/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>libapr-against-phtread-to-<wbr>make-gold-.patch<br>
            +++ b/meta/recipes-support/apr/<wbr>apr/0008-explicitly-link-<wbr>libapr-against-phtread-to-<wbr>make-gold-.patch<br>
            @@ -1,8 +1,8 @@<br>
            -From 94d1ca0266a0f9c0446f1299b54f75<wbr>2e87b8a695 Mon Sep
            17 00:00:00 2001<br>
            +From 922795e34289877ed2610f7bb44e04<wbr>4bcfb73cd5 Mon Sep
            17 00:00:00 2001<br>
             From: =?UTF-8?q?Andreas=20M=C3=<wbr>BCller?= &lt;<a
              href="mailto:schnitzeltony@googlemail.com"
              moz-do-not-send="true">schnitzeltony@googlemail.com</a>&gt;<br>
             Date: Fri, 3 Mar 2017 22:24:17 +0100<br>
            -Subject: [PATCH] explicitly link libapr against phtread to
            make gold happy on<br>
            - test<br>
            +Subject: [PATCH 8/8] explicitly link libapr against phtread
            to make gold happy<br>
            + on test<br>
             MIME-Version: 1.0<br>
             Content-Type: text/plain; charset=UTF-8<br>
             Content-Transfer-Encoding: 8bit<br>
            @@ -34,10 +34,10 @@ Signed-off-by: Andreas Müller &lt;<a
              href="mailto:schnitzeltony@googlemail.com"
              moz-do-not-send="true">schnitzeltony@googlemail.com</a>&gt;<br>
              1 file changed, 1 insertion(+)<br>
            <br>
             diff --git a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a> b/<a
              href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            -index 5b19940..cdf4d58 100644<br>
            +index 3c579f5..06afb62 100644<br>
             --- a/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
             +++ b/<a href="http://configure.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.in</a><br>
            -@@ -766,6 +766,7 @@ else<br>
            +@@ -781,6 +781,7 @@ else<br>
                        APR_PTHREADS_CHECK_RESTORE ] )<br>
                  fi<br>
                  if test "$pthreadh" = "1"; then<br>
            @@ -46,5 +46,5 @@ index 5b19940..cdf4d58 100644<br>
                      APR_CHECK_PTHREAD_ATTR_<wbr>GETDETACHSTATE_ONE_ARG<br>
                      APR_CHECK_PTHREAD_RECURSIVE_<wbr>MUTEX<br>
             --<br>
            -2.9.3<br>
            +1.8.3.1<br>
            <br>
            diff --git a/meta/recipes-support/apr/<wbr>apr/cleanup.patch
            b/meta/recipes-support/apr/<wbr>apr/cleanup.patch<br>
            deleted file mode 100644<br>
            index b6784e0..0000000<br>
            --- a/meta/recipes-support/apr/<wbr>apr/cleanup.patch<br>
            +++ /dev/null<br>
            @@ -1,43 +0,0 @@<br>
            -Upstream-Status: Inappropriate [configuration]<br>
            -<br>
            -Index: apr-1.4.2/build/buildcheck.sh<br>
            -=============================<wbr>==============================<wbr>========<br>
            ---- apr-1.4.2.orig/build/<wbr>buildcheck.sh 2009-11-13
            08:27:16.000000000 +0800<br>
            -+++ apr-1.4.2/build/buildcheck.sh      2010-11-26
            15:44:00.000000000 +0800<br>
            -@@ -32,35 +32,4 @@<br>
            - echo "buildconf: autoconf version $ac_version (ok)"<br>
            - fi<br>
            -<br>
            --# Sample libtool --version outputs:<br>
            --# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02
            15:49:11)<br>
            --# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a<br>
            --# output is multiline from 1.5 onwards<br>
            --<br>
            --# Require libtool 1.4 or newer<br>
            --libtool=`build/PrintPath glibtool1 glibtool libtool
            libtool15 libtool14`<br>
            --lt_pversion=`$libtool --version 2&gt;/dev/null|sed -e
            's/([^)]*)//g;s/^[^0-9]*//;s/[<wbr>- ].*//g;q'`<br>
            --if test -z "$lt_pversion"; then<br>
            --echo "buildconf: libtool not found."<br>
            --echo "           You need libtool version 1.4 or newer
            installed"<br>
            --echo "           to build APR from SVN."<br>
            --exit 1<br>
            --fi<br>
            --lt_version=`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`<br>
            --IFS=.; set $lt_version; IFS=' '<br>
            --lt_status="good"<br>
            --if test "$1" = "1"; then<br>
            --   if test "$2" -lt "4"; then<br>
            --      lt_status="bad"<br>
            --   fi<br>
            --fi<br>
            --if test $lt_status = "good"; then<br>
            --   echo "buildconf: libtool version $lt_pversion (ok)"<br>
            --   exit 0<br>
            --fi<br>
            --<br>
            --echo "buildconf: libtool version $lt_pversion found."<br>
            --echo "           You need libtool version 1.4 or newer
            installed"<br>
            --echo "           to build APR from SVN."<br>
            --<br>
            --exit 1<br>
            -+exit 0<br>
            diff --git a/meta/recipes-support/apr/<a
              href="http://apr_1.6.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr<wbr>_1.6.2.bb</a>
            b/meta/recipes-support/apr/<a href="http://apr_1.6.3.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr<wbr>_1.6.3.bb</a><br>
            similarity index 81%<br>
            rename from meta/recipes-support/apr/<a
              href="http://apr_1.6.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr_<wbr>1.6.2.bb</a><br>
            rename to meta/recipes-support/apr/<a
              href="http://apr_1.6.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">apr_<wbr>1.6.3.bb</a><br>
            index e2eed53..1bc4759 100644<br>
            --- a/meta/recipes-support/apr/<a href="http://apr_1.6.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr<wbr>_1.6.2.bb</a><br>
            +++ b/meta/recipes-support/apr/<a href="http://apr_1.6.3.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr<wbr>_1.6.3.bb</a><br>
            @@ -10,19 +10,19 @@ LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=">file://LICENSE;md5=</a><wbr>4dfd4cd216828c8cae5de5a12f3844<wbr>c8
            \<br>
             BBCLASSEXTEND = "native nativesdk"<br>
            <br>
             SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-$<wbr>{PV}.tar.bz2 \<br>
            -           <a class="moz-txt-link-freetext" href="file://configure_fixes.patch">file://configure_fixes.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://cleanup.patch">file://cleanup.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://configfix.patch">file://configfix.patch</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://upgrade-and-fix-1.5.1">file://upgrade-and-fix-1.5.1</a>.<wbr>patch \<br>
            -           <a class="moz-txt-link-freetext" href="file://Fix-packet-discards">file://Fix-packet-discards</a>-<wbr>HTTP-redirect.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://configure.in-fix">file://configure.in-fix</a>-<wbr>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://0001-apr-fix-off_t">file://0001-apr-fix-off_t</a>-<wbr>size-doesn-t-match-in-glibc-<wbr>when-cross.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://0002-explicitly-link">file://0002-explicitly-link</a>-<wbr>libapr-against-phtread-to-<wbr>make-gold-.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-configure-fixes">file://0001-configure-fixes</a>.<wbr>patch \<br>
            +           <a class="moz-txt-link-freetext" href="file://0002-cleanup.patch">file://0002-cleanup.patch</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://0003-configfix.patch">file://0003-configfix.patch</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://0004-Makefile.in-fix">file://0004-Makefile.in-fix</a>-<wbr>cross-compiling-failed.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0005-Fix-packet">file://0005-Fix-packet</a>-<wbr>discards-HTTP-redirect.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0006-configure.in-fix">file://0006-configure.in-fix</a>-<wbr>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0007-apr-fix-off_t">file://0007-apr-fix-off_t</a>-<wbr>size-doesn-t-match-in-glibc-<wbr>when-cross.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0008-explicitly-link">file://0008-explicitly-link</a>-<wbr>libapr-against-phtread-to-<wbr>make-gold-.patch
            \<br>
             "<br>
            <br>
            -SRC_URI[md5sum] = "<wbr>e81a851967c79b5ce9bfbc909e4bf7<wbr>35"<br>
            -SRC_URI[sha256sum] = "<wbr>09109cea377bab0028bba19a92b5b0<wbr>e89603df9eab05c0f7dbd4dd83d48d<wbr>cebd"<br>
            +SRC_URI[md5sum] = "<wbr>12f2a349483ad6f12db49ba01fbfdb<wbr>fa"<br>
            +SRC_URI[sha256sum] = "<wbr>131f06d16d7aabd097fa992a33eec2<wbr>b6af3962f93e6d570a9bd4d85e9599<wbr>3172"<br>
            <br>
             inherit autotools-brokensep lib_package binconfig
            multilib_header ptest<br>
            <br>
            @@ -69,7 +69,8 @@ do_install_append() {<br>
             }<br>
            <br>
             do_install_append_class-<wbr>target() {<br>
            -       sed -i -e 's,${STAGING_DIR_HOST},,g'
            ${D}${datadir}/build-1/<a href="http://apr_rules.mk"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr_<wbr>rules.mk</a><br>
            +       sed -i -e 's,${DEBUG_PREFIX_MAP},,g' \<br>
            +              -e 's,${STAGING_DIR_HOST},,g'
            ${D}${datadir}/build-1/<a href="http://apr_rules.mk"
              rel="noreferrer" target="_blank" moz-do-not-send="true">apr_<wbr>rules.mk</a><br>
                    sed -i -e 's,${STAGING_DIR_HOST},,g' \<br>
                           -e 's,APR_SOURCE_DIR=.*,APR_<wbr>SOURCE_DIR=,g'
            \<br>
                           -e 's,APR_BUILD_DIR=.*,APR_BUILD_<wbr>DIR=,g'
            ${D}${bindir}/apr-1-config<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.8.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------193221D2CEFC5036C4696667--
