Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8986F4BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 07:17:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s237H7dE001046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Mar 2014 23:17:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 2 Mar 2014 23:17:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 15:16:50 +0800
Message-ID: <9bd4ef2fae49d2aed292c0373cd99b9d7429c7a3.1393830830.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393830830.git.hongxu.jia@windriver.com>
References: <cover.1393830830.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/3] readline: update configure-fix.patch
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
X-List-Received-Date: Mon, 03 Mar 2014 07:17:06 -0000
Content-Type: text/plain

The configure-fix.patch is used to patch configure.in in 6.2 (or 5.2),
but configure.ac in 6.3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{files => readline-5.2}/configure-fix.patch    |  0
 .../readline/readline-6.3/configure-fix.patch      | 35 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 rename meta/recipes-core/readline/{files => readline-5.2}/configure-fix.patch (100%)
 create mode 100644 meta/recipes-core/readline/readline-6.3/configure-fix.patch

diff --git a/meta/recipes-core/readline/files/configure-fix.patch b/meta/recipes-core/readline/readline-5.2/configure-fix.patch
similarity index 100%
rename from meta/recipes-core/readline/files/configure-fix.patch
rename to meta/recipes-core/readline/readline-5.2/configure-fix.patch
diff --git a/meta/recipes-core/readline/readline-6.3/configure-fix.patch b/meta/recipes-core/readline/readline-6.3/configure-fix.patch
new file mode 100644
index 0000000..ef3104f
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.3/configure-fix.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Pending
+
+Without this it fails to link against libtermcap causing various missing
+symbols issues.
+
+RP - 8/10/08
+
+Support 6.3 which uses configure.ac rather than configure.in.
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cea8f91..9075b8f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -218,10 +218,10 @@ if test -f ${srcdir}/support/shobj-conf; then
+         AC_MSG_CHECKING(configuration for building shared libraries)
+         eval `TERMCAP_LIB=$TERMCAP_LIB ${CONFIG_SHELL-/bin/sh} ${srcdir}/support/shobj-conf -C "${CC}" -c ${host_cpu} -o ${host_os} -v ${host_vendor}`
+ 
+-#	case "$SHLIB_LIBS" in
+-#	*curses*|*termcap*|*termlib*)	;;
+-#	*)			SHLIB_LIBS="$SHLIB_LIBS $TERMCAP_LIB" ;;
+-#	esac
++	case "$SHLIB_LIBS" in
++	*curses*|*termcap*|*termlib*)	;;
++	*)			SHLIB_LIBS="$SHLIB_LIBS $TERMCAP_LIB" ;;
++	esac
+ 	
+         AC_SUBST(SHOBJ_CC)
+         AC_SUBST(SHOBJ_CFLAGS)
+-- 
+1.8.1.2
+
-- 
1.8.1.2


