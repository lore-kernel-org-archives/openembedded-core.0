Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD8260125
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 09:16:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v039G9rr008777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jan 2017 01:16:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 3 Jan 2017 01:16:08 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jan 2017 17:16:06 +0800
Message-ID: <54cf11757fb3fcb0bdb07a26d5b9607ad691c17a.1483434815.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1483434815.git.Qi.Chen@windriver.com>
References: <cover.1483434815.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: upgrade to 1.25.1
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
X-List-Received-Date: Tue, 03 Jan 2017 09:16:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upgrade busybox to 1.25.1. Also upgrade the git version to the corresponding
commit.

Patches backported, merged or the problem it covers is solved in another way
upstream are removed. Other patches are rebased.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e-the-behaviour-of-c-parameter-to-match-u.patch |  73 -----------
 ...biproute-handle-table-ids-larger-than-255.patch |  40 +++---
 ...-n-flushes-pattern-space-terminates-early.patch |  72 -----------
 .../busybox/busybox/CVE-2016-2147.patch            |  57 --------
 .../busybox/busybox/CVE-2016-2147_2.patch          |  32 -----
 .../busybox/busybox/CVE-2016-2148.patch            |  74 -----------
 .../busybox-1.24.1-truncate-open-mode.patch        |  81 ------------
 .../busybox/busybox-1.24.1-unzip-regression.patch  | 143 ---------------------
 .../busybox/busybox/busybox-1.24.1-unzip.patch     | 118 -----------------
 .../busybox/busybox/busybox-cross-menuconfig.patch |  71 ----------
 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   |  53 --------
 .../busybox/busybox-udhcpc-no_deconfig.patch       |  61 ++++-----
 .../commit-applet_tables-fix-commit-0dddbc1.patch  |  61 ---------
 ...lem_on_mips64_n64_big_endian_musl_systems.patch |  90 -------------
 .../busybox/busybox/makefile-fix-backport.patch    |  40 ------
 .../{busybox_1.24.1.bb => busybox_1.25.1.bb}       |  17 +--
 meta/recipes-core/busybox/busybox_git.bb           |   7 +-
 17 files changed, 51 insertions(+), 1039 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
 rename meta/recipes-core/busybox/{busybox_1.24.1.bb => busybox_1.25.1.bb} (65%)

diff --git a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
deleted file mode 100644
index 8bcbd73d..0000000
--- a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 198f18addf1d814c2fefcb492f3b9fbd221669bb Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 20 Apr 2016 18:24:45 +0300
-Subject: [PATCH] flock: update the behaviour of -c parameter to match upstream
-
-In upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
-
-function                                             old     new   delta
-flock_main                                           286     377     +91
-.rodata                                           155849  155890     +41
-
-Upstream-Status: Submitted
-[ http://lists.busybox.net/pipermail/busybox/2016-April/084142.html ]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- util-linux/flock.c | 20 ++++++++++++++------
- 1 file changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/util-linux/flock.c b/util-linux/flock.c
-index 05a747f..c85a25d 100644
---- a/util-linux/flock.c
-+++ b/util-linux/flock.c
-@@ -20,6 +20,7 @@ int flock_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int flock_main(int argc UNUSED_PARAM, char **argv)
- {
- 	int mode, opt, fd;
-+    char *cmd_args[4];
- 	enum {
- 		OPT_s = (1 << 0),
- 		OPT_x = (1 << 1),
-@@ -57,7 +58,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 	/* If it is "flock FILE -c PROG", then -c isn't caught by getopt32:
- 	 * we use "+" in order to support "flock -opt FILE PROG -with-opts",
- 	 * we need to remove -c by hand.
--	 * TODO: in upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
- 	 */
- 	if (argv[0]
- 	 && argv[0][0] == '-'
-@@ -65,7 +65,10 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 	    || (ENABLE_LONG_OPTS && strcmp(argv[0] + 1, "-command") == 0)
- 	    )
- 	) {
--		argv++;
-+        if (argc != optind + 3)
-+            bb_error_msg_and_die("-c requires exactly one command argument");
-+        else
-+            argv++;
- 	}
- 
- 	if (OPT_s == LOCK_SH && OPT_x == LOCK_EX && OPT_n == LOCK_NB && OPT_u == LOCK_UN) {
-@@ -89,9 +92,14 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 			return EXIT_FAILURE;
- 		bb_perror_nomsg_and_die();
- 	}
--
--	if (argv[0])
--		return spawn_and_wait(argv);
--
-+    if (argv[0]) {
-+        cmd_args[0] = getenv("SHELL");
-+        if (!cmd_args[0])
-+            cmd_args[0] = (char*)DEFAULT_SHELL;
-+        cmd_args[1] = (char*)"-c";
-+        cmd_args[2] = argv[0];
-+        cmd_args[3] = NULL;
-+        return spawn_and_wait(cmd_args);
-+    }
- 	return EXIT_SUCCESS;
- }
--- 
-2.4.0
-
diff --git a/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch b/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
index aac5b40..f05c316 100644
--- a/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
+++ b/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
@@ -1,6 +1,3 @@
-From b5a9234272e6084557224c73ab7737ed47f09848 Mon Sep 17 00:00:00 2001
-From: Lukasz Nowak <lnowak@tycoint.com>
-Date: Wed, 23 Nov 2016 12:48:21 +0000
 Subject: [PATCH v2] libiproute: handle table ids larger than 255
 
 Linux kernel, starting from 2.6.19 allows ip table ids to have 32-bit values.
@@ -24,23 +21,25 @@ Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2016-Dece
 
 Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
 ---
- networking/libiproute/iproute.c | 24 ++++++++++++++++++++----
+ networking/libiproute/iproute.c | 27 +++++++++++++++++++++------
  networking/libiproute/iprule.c  | 11 +++++++++--
- 2 files changed, 29 insertions(+), 6 deletions(-)
+ 2 files changed, 30 insertions(+), 8 deletions(-)
 
 diff --git a/networking/libiproute/iproute.c b/networking/libiproute/iproute.c
-index 6ecd5f7..d5af498 100644
+index 48dc6e3..bdd17da 100644
 --- a/networking/libiproute/iproute.c
 +++ b/networking/libiproute/iproute.c
-@@ -87,6 +87,7 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -66,7 +66,8 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
  	inet_prefix dst;
  	inet_prefix src;
  	int host_len = -1;
+-
 +	uint32_t tid;
- 
++	
  	if (n->nlmsg_type != RTM_NEWROUTE && n->nlmsg_type != RTM_DELROUTE) {
  		fprintf(stderr, "Not a route: %08x %08x %08x\n",
-@@ -99,6 +100,14 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+ 			n->nlmsg_len, n->nlmsg_type, n->nlmsg_flags);
+@@ -78,6 +79,14 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
  	if (len < 0)
  		bb_error_msg_and_die("wrong nlmsg len %d", len);
  
@@ -55,7 +54,7 @@ index 6ecd5f7..d5af498 100644
  	if (r->rtm_family == AF_INET6)
  		host_len = 128;
  	else if (r->rtm_family == AF_INET)
-@@ -128,7 +137,7 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -107,7 +116,7 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
  			}
  		}
  	} else {
@@ -64,7 +63,7 @@ index 6ecd5f7..d5af498 100644
  			return 0;
  		}
  	}
-@@ -157,10 +166,8 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -136,10 +145,8 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
  		return 0;
  	}
  
@@ -75,21 +74,22 @@ index 6ecd5f7..d5af498 100644
  
  	if (tb[RTA_SRC]) {
  		src.bitlen = r->rtm_src_len;
-@@ -283,6 +290,10 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -258,7 +265,10 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
  	if (tb[RTA_OIF]) {
  		printf("dev %s ", ll_index_to_name(*(int*)RTA_DATA(tb[RTA_OIF])));
  	}
+-
 +#if ENABLE_FEATURE_IP_RULE
 +	if (tid && tid != RT_TABLE_MAIN && !G_filter.tb)
 +		printf("table %s ", rtnl_rttable_n2a(tid));
 +#endif
- 
  	/* Todo: parse & show "proto kernel", "scope link" here */
  
-@@ -434,7 +445,12 @@ IF_FEATURE_IP_RULE(ARG_table,)
+ 	if (tb[RTA_PREFSRC] && /*G_filter.rprefsrc.bitlen - always 0*/ 0 != host_len) {
+@@ -419,7 +429,12 @@ IF_FEATURE_IP_RULE(ARG_table,)
  			NEXT_ARG();
  			if (rtnl_rttable_a2n(&tid, *argv))
- 				invarg(*argv, "table");
+ 				invarg_1_to_2(*argv, "table");
 -			req.r.rtm_table = tid;
 +			if (tid < 256)
 +				req.r.rtm_table = tid;
@@ -101,10 +101,10 @@ index 6ecd5f7..d5af498 100644
  		} else if (arg == ARG_dev || arg == ARG_oif) {
  			NEXT_ARG();
 diff --git a/networking/libiproute/iprule.c b/networking/libiproute/iprule.c
-index 774a3e2..3fac7c5 100644
+index dba6434..6836ff7 100644
 --- a/networking/libiproute/iprule.c
 +++ b/networking/libiproute/iprule.c
-@@ -119,7 +119,9 @@ static int FAST_FUNC print_rule(const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -114,7 +114,9 @@ static int FAST_FUNC print_rule(const struct sockaddr_nl *who UNUSED_PARAM,
  		printf("iif %s ", (char*)RTA_DATA(tb[RTA_IIF]));
  	}
  
@@ -115,10 +115,10 @@ index 774a3e2..3fac7c5 100644
  		printf("lookup %s ", rtnl_rttable_n2a(r->rtm_table));
  
  	if (tb[RTA_FLOW]) {
-@@ -259,7 +261,12 @@ static int iprule_modify(int cmd, char **argv)
+@@ -254,7 +256,12 @@ static int iprule_modify(int cmd, char **argv)
  			NEXT_ARG();
  			if (rtnl_rttable_a2n(&tid, *argv))
- 				invarg(*argv, "table ID");
+ 				invarg_1_to_2(*argv, "table ID");
 -			req.r.rtm_table = tid;
 +			if (tid < 256)
 +				req.r.rtm_table = tid;
@@ -130,5 +130,5 @@ index 774a3e2..3fac7c5 100644
  		} else if (key == ARG_dev ||
  			   key == ARG_iif
 -- 
-2.7.4
+2.1.0
 
diff --git a/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch b/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
deleted file mode 100644
index 4f53984..0000000
--- a/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 903542f7331c58007a3ef938d41e1c55fc329648 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 31 Aug 2016 23:40:43 -0400
-Subject: [PATCH] sed: fix "sed n (flushes pattern space, terminates early)"
- testcase failure
-
-This patch fix "sed n (flushes pattern space, terminates early)"
-testcase failure. We can see it at:
-
-	https://git.busybox.net/busybox/commit/?id=76d72376e0244a5cafd4880cdc623e37d86a75e4
-
-Upstream-Status: Backport
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- editors/sed.c       | 19 ++++++++++---------
- testsuite/sed.tests |  6 +-----
- 2 files changed, 11 insertions(+), 14 deletions(-)
-
-diff --git a/editors/sed.c b/editors/sed.c
-index 7bbf820..259c39c 100644
---- a/editors/sed.c
-+++ b/editors/sed.c
-@@ -1274,16 +1274,17 @@ static void process_files(void)
- 		case 'n':
- 			if (!G.be_quiet)
- 				sed_puts(pattern_space, last_gets_char);
--			if (next_line) {
--				free(pattern_space);
--				pattern_space = next_line;
--				last_gets_char = next_gets_char;
--				next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
--				substituted = 0;
--				linenum++;
--				break;
-+			if (next_line == NULL) {
-+				/* If no next line, jump to end of script and exit. */
-+				goto discard_line;
- 			}
--			/* fall through */
-+			free(pattern_space);
-+			pattern_space = next_line;
-+			last_gets_char = next_gets_char;
-+			next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
-+			substituted = 0;
-+			linenum++;
-+			break;
- 
- 		/* Quit.  End of script, end of input. */
- 		case 'q':
-diff --git a/testsuite/sed.tests b/testsuite/sed.tests
-index 34479e5..96ff7a5 100755
---- a/testsuite/sed.tests
-+++ b/testsuite/sed.tests
-@@ -73,13 +73,9 @@ testing "sed t (test/branch clears test bit)" "sed -e 's/a/b/;:loop;t loop'" \
- testing "sed T (!test/branch)" "sed -e 's/a/1/;T notone;p;: notone;p'" \
- 	"1\n1\n1\nb\nb\nc\nc\n" "" "a\nb\nc\n"
- 
--test x"$SKIP_KNOWN_BUGS" = x"" && {
--# Normal sed end-of-script doesn't print "c" because n flushed the pattern
--# space.  If n hits EOF, pattern space is empty when script ends.
--# Query: how does this interact with no newline at EOF?
- testing "sed n (flushes pattern space, terminates early)" "sed -e 'n;p'" \
- 	"a\nb\nb\nc\n" "" "a\nb\nc\n"
--}
-+
- # non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @ script end
- # GNU sed: N flushes pattern space, therefore c is printed too @ script end
- testing "sed N (flushes pattern space (GNU behavior))" "sed -e 'N;p'" \
--- 
-2.8.1
-
diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch b/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
deleted file mode 100644
index 84cae6a..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d474ffc68290e0a83651c4432eeabfa62cd51e87 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 10 Mar 2016 11:47:58 +0100
-Subject: [PATCH] udhcp: fix a SEGV on malformed RFC1035-encoded domain name
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-Upstream-Status: Backport
-CVE: CVE-2016-2147
-
-https://git.busybox.net/busybox/commit/?id=d474ffc
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- networking/udhcp/domain_codec.c | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-Index: busybox-1.23.2/networking/udhcp/domain_codec.c
-===================================================================
---- busybox-1.23.2.orig/networking/udhcp/domain_codec.c
-+++ busybox-1.23.2/networking/udhcp/domain_codec.c
-@@ -63,11 +63,10 @@ char* FAST_FUNC dname_dec(const uint8_t
- 				if (crtpos + *c + 1 > clen) /* label too long? abort */
- 					return NULL;
- 				if (dst)
--					memcpy(dst + len, c + 1, *c);
-+					/* \3com ---> "com." */
-+					((char*)mempcpy(dst + len, c + 1, *c))[0] = '.';
- 				len += *c + 1;
- 				crtpos += *c + 1;
--				if (dst)
--					dst[len - 1] = '.';
- 			} else {
- 				/* NUL: end of current domain name */
- 				if (retpos == 0) {
-@@ -78,7 +77,10 @@ char* FAST_FUNC dname_dec(const uint8_t
- 					crtpos = retpos;
- 					retpos = depth = 0;
- 				}
--				if (dst)
-+				if (dst && len != 0)
-+					/* \4host\3com\0\4host and we are at \0:
-+					 * \3com was converted to "com.", change dot to space.
-+					 */
- 					dst[len - 1] = ' ';
- 			}
- 
-@@ -228,6 +230,9 @@ int main(int argc, char **argv)
- 	int len;
- 	uint8_t *encoded;
- 
-+        uint8_t str[6] = { 0x00, 0x00, 0x02, 0x65, 0x65, 0x00 };
-+        printf("NUL:'%s'\n",   dname_dec(str, 6, ""));
-+
- #define DNAME_DEC(encoded,pre) dname_dec((uint8_t*)(encoded), sizeof(encoded), (pre))
- 	printf("'%s'\n",       DNAME_DEC("\4host\3com\0", "test1:"));
- 	printf("test2:'%s'\n", DNAME_DEC("\4host\3com\0\4host\3com\0", ""));
diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch b/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
deleted file mode 100644
index 1473d46..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1b7c17391de66502dd7a97c866e0a33681edbb1f Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 11 Mar 2016 00:26:58 +0100
-Subject: [PATCH] udhcpc: fix a warning in debug code
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upsteam-Status: Backport
-CVE: CVE-2016-2147 regression fix
-
-https://git.busybox.net/busybox/commit/?id=1b7c17
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- networking/udhcp/domain_codec.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/networking/udhcp/domain_codec.c b/networking/udhcp/domain_codec.c
-index cee31f1..5a923cc 100644
---- a/networking/udhcp/domain_codec.c
-+++ b/networking/udhcp/domain_codec.c
-@@ -7,6 +7,7 @@
-  * Licensed under GPLv2 or later, see file LICENSE in this source tree.
-  */
- #ifdef DNS_COMPR_TESTING
-+# define _GNU_SOURCE
- # define FAST_FUNC /* nothing */
- # define xmalloc malloc
- # include <stdlib.h>
--- 
-2.3.5
-
diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch b/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
deleted file mode 100644
index af04a7f..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 352f79acbd759c14399e39baef21fc4ffe180ac2 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 26 Feb 2016 15:54:56 +0100
-Subject: [PATCH] udhcpc: fix OPTION_6RD parsing (could overflow its malloced
- buffer)
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-Upstream-Status: Backport
-CVE: CVE-2016-2148
-https://git.busybox.net/busybox/commit/?id=352f79
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- networking/udhcp/common.c | 15 +++++++++++++--
- networking/udhcp/dhcpc.c  |  4 ++--
- 2 files changed, 15 insertions(+), 4 deletions(-)
-
-Index: busybox-1.23.2/networking/udhcp/common.c
-===================================================================
---- busybox-1.23.2.orig/networking/udhcp/common.c
-+++ busybox-1.23.2/networking/udhcp/common.c
-@@ -142,7 +142,7 @@ const char dhcp_option_strings[] ALIGN1
-  * udhcp_str2optset: to determine how many bytes to allocate.
-  * xmalloc_optname_optval: to estimate string length
-  * from binary option length: (option[LEN] / dhcp_option_lengths[opt_type])
-- * is the number of elements, multiply in by one element's string width
-+ * is the number of elements, multiply it by one element's string width
-  * (len_of_option_as_string[opt_type]) and you know how wide string you need.
-  */
- const uint8_t dhcp_option_lengths[] ALIGN1 = {
-@@ -162,7 +162,18 @@ const uint8_t dhcp_option_lengths[] ALIG
- 	[OPTION_S32] =     4,
- 	/* Just like OPTION_STRING, we use minimum length here */
- 	[OPTION_STATIC_ROUTES] = 5,
--	[OPTION_6RD] =    22,  /* ignored by udhcp_str2optset */
-+	[OPTION_6RD] =    12,  /* ignored by udhcp_str2optset */
-+	/* The above value was chosen as follows:
-+	 * len_of_option_as_string[] for this option is >60: it's a string of the form
-+	 * "32 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 ".
-+	 * Each additional ipv4 address takes 4 bytes in binary option and appends
-+	 * another "255.255.255.255 " 16-byte string. We can set [OPTION_6RD] = 4
-+	 * but this severely overestimates string length: instead of 16 bytes,
-+	 * it adds >60 for every 4 bytes in binary option.
-+	 * We cheat and declare here that option is in units of 12 bytes.
-+	 * This adds more than 60 bytes for every three ipv4 addresses - more than enough.
-+	 * (Even 16 instead of 12 should work, but let's be paranoid).
-+	 */
- };
- 
- 
-Index: busybox-1.23.2/networking/udhcp/dhcpc.c
-===================================================================
---- busybox-1.23.2.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.23.2/networking/udhcp/dhcpc.c
-@@ -103,7 +103,7 @@ static const uint8_t len_of_option_as_st
- 	[OPTION_IP              ] = sizeof("255.255.255.255 "),
- 	[OPTION_IP_PAIR         ] = sizeof("255.255.255.255 ") * 2,
- 	[OPTION_STATIC_ROUTES   ] = sizeof("255.255.255.255/32 255.255.255.255 "),
--	[OPTION_6RD             ] = sizeof("32 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
-+	[OPTION_6RD             ] = sizeof("132 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
- 	[OPTION_STRING          ] = 1,
- 	[OPTION_STRING_HOST     ] = 1,
- #if ENABLE_FEATURE_UDHCP_RFC3397
-@@ -214,7 +214,7 @@ static NOINLINE char *xmalloc_optname_op
- 	type = optflag->flags & OPTION_TYPE_MASK;
- 	optlen = dhcp_option_lengths[type];
- 	upper_length = len_of_option_as_string[type]
--		* ((unsigned)(len + optlen - 1) / (unsigned)optlen);
-+		* ((unsigned)(len + optlen) / (unsigned)optlen);
- 
- 	dest = ret = xmalloc(upper_length + strlen(opt_name) + 2);
- 	dest += sprintf(ret, "%s=", opt_name);
diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch b/meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
deleted file mode 100644
index cdc9108..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Backport
-
-  http://busybox.net/downloads/fixes-1.24.1/
-  https://git.busybox.net/busybox/commit/?id=e111a1640494fe87fc913f94fae3bb805de0fc99
-  https://git.busybox.net/busybox/commit/?h=1_24_stable&id=be729c1d3b5c923f10871dd68ea94156d0f8c803
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-From be729c1d3b5c923f10871dd68ea94156d0f8c803 Mon Sep 17 00:00:00 2001
-From: Ari Sundholm <ari@tuxera.com>
-Date: Mon, 4 Jan 2016 15:40:37 +0200
-Subject: [PATCH] truncate: always set mode when opening file to avoid fortify
- errors
-
-Busybox crashes due to no mode being given when opening:
-$ ./busybox truncate -s 1M foo
-*** invalid open64 call: O_CREAT without mode ***: ./busybox terminated
-======= Backtrace: =========
-/lib/x86_64-linux-gnu/libc.so.6(+0x7338f)[0x7f66d921338f]
-/lib/x86_64-linux-gnu/libc.so.6(__fortify_fail+0x5c)[0x7f66d92aac9c]
-/lib/x86_64-linux-gnu/libc.so.6(+0xeb6aa)[0x7f66d928b6aa]
-./busybox[0x4899f9]
-======= Memory map: ========
-00400000-004d0000 r-xp 00000000 00:1a 137559                             /home/ari/busybox/busybox
-006cf000-006d0000 r--p 000cf000 00:1a 137559                             /home/ari/busybox/busybox
-006d0000-006d1000 rw-p 000d0000 00:1a 137559                             /home/ari/busybox/busybox
-006d1000-006d4000 rw-p 00000000 00:00 0
-014e7000-01508000 rw-p 00000000 00:00 0                                  [heap]
-7f66d8f8a000-7f66d8fa0000 r-xp 00000000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
-7f66d8fa0000-7f66d919f000 ---p 00016000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
-7f66d919f000-7f66d91a0000 rw-p 00015000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
-7f66d91a0000-7f66d935b000 r-xp 00000000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d935b000-7f66d955a000 ---p 001bb000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d955a000-7f66d955e000 r--p 001ba000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d955e000-7f66d9560000 rw-p 001be000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d9560000-7f66d9565000 rw-p 00000000 00:00 0
-7f66d9565000-7f66d966a000 r-xp 00000000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d966a000-7f66d9869000 ---p 00105000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d9869000-7f66d986a000 r--p 00104000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d986a000-7f66d986b000 rw-p 00105000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d986b000-7f66d988e000 r-xp 00000000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
-7f66d9a64000-7f66d9a67000 rw-p 00000000 00:00 0
-7f66d9a8a000-7f66d9a8d000 rw-p 00000000 00:00 0
-7f66d9a8d000-7f66d9a8e000 r--p 00022000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
-7f66d9a8e000-7f66d9a8f000 rw-p 00023000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
-7f66d9a8f000-7f66d9a90000 rw-p 00000000 00:00 0
-7ffc47761000-7ffc47782000 rw-p 00000000 00:00 0                          [stack]
-7ffc477ab000-7ffc477ad000 r-xp 00000000 00:00 0                          [vdso]
-ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
-Aborted (core dumped)
-$
-
-Fix this by simply always setting the mode, as it doesn't hurt even
-when O_CREAT is not specified.
-
-This bug is a regression introduced in fc3e40e, as xopen(), which
-was originally used, would automatically set the mode.
-
-Signed-off-by: Ari Sundholm <ari@tuxera.com>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-(cherry picked from commit e111a1640494fe87fc913f94fae3bb805de0fc99)
----
- coreutils/truncate.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/coreutils/truncate.c b/coreutils/truncate.c
-index e5fa656..4c997bf 100644
---- a/coreutils/truncate.c
-+++ b/coreutils/truncate.c
-@@ -64,7 +64,7 @@ int truncate_main(int argc UNUSED_PARAM, char **argv)
- 
- 	argv += optind;
- 	while (*argv) {
--		int fd = open(*argv, flags);
-+		int fd = open(*argv, flags, 0666);
- 		if (fd < 0) {
- 			if (errno != ENOENT || !(opts & OPT_NOCREATE)) {
- 				bb_perror_msg("%s: open", *argv);
--- 
-2.6.2
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
deleted file mode 100644
index e3c5020..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-Upstream-Status: Backport
-
-  http://busybox.net/downloads/fixes-1.24.1/
-  http://git.busybox.net/busybox/commit/?id=092fabcf1df5d46cd22be4ffcd3b871f6180eb9c
-  http://git.busybox.net/busybox/commit/?h=1_24_stable&id=092fabcf1df5d46cd22be4ffcd3b871f6180eb9c
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-From 092fabcf1df5d46cd22be4ffcd3b871f6180eb9c Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 30 Oct 2015 23:41:53 +0100
-Subject: [PATCH] [g]unzip: fix recent breakage.
-
-Also, do emit error message we so painstakingly pass from gzip internals
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-(cherry picked from commit 6bd3fff51aa74e2ee2d87887b12182a3b09792ef)
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- archival/libarchive/decompress_gunzip.c | 33 +++++++++++++++++++++------------
- testsuite/unzip.tests                   |  1 +
- 2 files changed, 22 insertions(+), 12 deletions(-)
-
-diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
-index c76fd31..357c9bf 100644
---- a/archival/libarchive/decompress_gunzip.c
-+++ b/archival/libarchive/decompress_gunzip.c
-@@ -309,8 +309,7 @@ static int huft_build(const unsigned *b, const unsigned n,
- 	huft_t *q;              /* points to current table */
- 	huft_t r;               /* table entry for structure assignment */
- 	huft_t *u[BMAX];        /* table stack */
--	unsigned v[N_MAX];      /* values in order of bit length */
--	unsigned v_end;
-+	unsigned v[N_MAX + 1];  /* values in order of bit length. last v[] is never used */
- 	int ws[BMAX + 1];       /* bits decoded stack */
- 	int w;                  /* bits decoded */
- 	unsigned x[BMAX + 1];   /* bit offsets, then code stack */
-@@ -365,15 +364,17 @@ static int huft_build(const unsigned *b, const unsigned n,
- 		*xp++ = j;
- 	}
- 
--	/* Make a table of values in order of bit lengths */
-+	/* Make a table of values in order of bit lengths.
-+	 * To detect bad input, unused v[i]'s are set to invalid value UINT_MAX.
-+	 * In particular, last v[i] is never filled and must not be accessed.
-+	 */
-+	memset(v, 0xff, sizeof(v));
- 	p = b;
- 	i = 0;
--	v_end = 0;
- 	do {
- 		j = *p++;
- 		if (j != 0) {
- 			v[x[j]++] = i;
--			v_end = x[j];
- 		}
- 	} while (++i < n);
- 
-@@ -435,7 +436,9 @@ static int huft_build(const unsigned *b, const unsigned n,
- 
- 			/* set up table entry in r */
- 			r.b = (unsigned char) (k - w);
--			if (p >= v + v_end) { // Was "if (p >= v + n)" but v[] can be shorter!
-+			if (/*p >= v + n || -- redundant, caught by the second check: */
-+			    *p == UINT_MAX /* do we access uninited v[i]? (see memset(v))*/
-+			) {
- 				r.e = 99; /* out of values--invalid code */
- 			} else if (*p < s) {
- 				r.e = (unsigned char) (*p < 256 ? 16 : 15);	/* 256 is EOB code */
-@@ -520,8 +523,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
- 		e = t->e;
- 		if (e > 16)
- 			do {
--				if (e == 99)
--					abort_unzip(PASS_STATE_ONLY);;
-+				if (e == 99) {
-+					abort_unzip(PASS_STATE_ONLY);
-+				}
- 				bb >>= t->b;
- 				k -= t->b;
- 				e -= 16;
-@@ -557,8 +561,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
- 			e = t->e;
- 			if (e > 16)
- 				do {
--					if (e == 99)
-+					if (e == 99) {
- 						abort_unzip(PASS_STATE_ONLY);
-+					}
- 					bb >>= t->b;
- 					k -= t->b;
- 					e -= 16;
-@@ -824,8 +829,9 @@ static int inflate_block(STATE_PARAM smallint *e)
- 
- 		b_dynamic >>= 4;
- 		k_dynamic -= 4;
--		if (nl > 286 || nd > 30)
-+		if (nl > 286 || nd > 30) {
- 			abort_unzip(PASS_STATE_ONLY);	/* bad lengths */
-+		}
- 
- 		/* read in bit-length-code lengths */
- 		for (j = 0; j < nb; j++) {
-@@ -906,12 +912,14 @@ static int inflate_block(STATE_PARAM smallint *e)
- 		bl = lbits;
- 
- 		i = huft_build(ll, nl, 257, cplens, cplext, &inflate_codes_tl, &bl);
--		if (i != 0)
-+		if (i != 0) {
- 			abort_unzip(PASS_STATE_ONLY);
-+		}
- 		bd = dbits;
- 		i = huft_build(ll + nl, nd, 0, cpdist, cpdext, &inflate_codes_td, &bd);
--		if (i != 0)
-+		if (i != 0) {
- 			abort_unzip(PASS_STATE_ONLY);
-+		}
- 
- 		/* set up data for inflate_codes() */
- 		inflate_codes_setup(PASS_STATE bl, bd);
-@@ -999,6 +1007,7 @@ inflate_unzip_internal(STATE_PARAM transformer_state_t *xstate)
- 	error_msg = "corrupted data";
- 	if (setjmp(error_jmp)) {
- 		/* Error from deep inside zip machinery */
-+		bb_error_msg(error_msg);
- 		n = -1;
- 		goto ret;
- 	}
-diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
-index ca0a458..d8738a3 100755
---- a/testsuite/unzip.tests
-+++ b/testsuite/unzip.tests
-@@ -34,6 +34,7 @@ rm foo.zip
- testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
- "Archive:  bad.zip
-   inflating: ]3j½r«IK-%Ix
-+unzip: corrupted data
- unzip: inflate error
- 1
- " \
--- 
-2.6.2
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
deleted file mode 100644
index 7186726..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-Upstream-Status: Backport
-
-  http://busybox.net/downloads/fixes-1.24.1/
-  http://git.busybox.net/busybox/commit/?id=1de25a6e87e0e627aa34298105a3d17c60a1f44e
-  http://git.busybox.net/busybox/commit/?h=1_24_stable&id=6767af17f11144c7cd3cfe9ef799d7f89a78fe65
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-From 1de25a6e87e0e627aa34298105a3d17c60a1f44e Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 26 Oct 2015 19:33:05 +0100
-Subject: [PATCH] unzip: test for bad archive SEGVing
-
-function                                             old     new   delta
-huft_build                                          1296    1300      +4
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- archival/libarchive/decompress_gunzip.c | 11 +++++++----
- testsuite/unzip.tests                   | 23 ++++++++++++++++++++++-
- 2 files changed, 29 insertions(+), 5 deletions(-)
-
-diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
-index 7b6f459..30bf451 100644
---- a/archival/libarchive/decompress_gunzip.c
-+++ b/archival/libarchive/decompress_gunzip.c
-@@ -305,11 +305,12 @@ static int huft_build(const unsigned *b, const unsigned n,
- 	unsigned i;             /* counter, current code */
- 	unsigned j;             /* counter */
- 	int k;                  /* number of bits in current code */
--	unsigned *p;            /* pointer into c[], b[], or v[] */
-+	const unsigned *p;      /* pointer into c[], b[], or v[] */
- 	huft_t *q;              /* points to current table */
- 	huft_t r;               /* table entry for structure assignment */
- 	huft_t *u[BMAX];        /* table stack */
- 	unsigned v[N_MAX];      /* values in order of bit length */
-+	unsigned v_end;
- 	int ws[BMAX + 1];       /* bits decoded stack */
- 	int w;                  /* bits decoded */
- 	unsigned x[BMAX + 1];   /* bit offsets, then code stack */
-@@ -324,7 +325,7 @@ static int huft_build(const unsigned *b, const unsigned n,
- 
- 	/* Generate counts for each bit length */
- 	memset(c, 0, sizeof(c));
--	p = (unsigned *) b; /* cast allows us to reuse p for pointing to b */
-+	p = b;
- 	i = n;
- 	do {
- 		c[*p]++; /* assume all entries <= BMAX */
-@@ -365,12 +366,14 @@ static int huft_build(const unsigned *b, const unsigned n,
- 	}
- 
- 	/* Make a table of values in order of bit lengths */
--	p = (unsigned *) b;
-+	p = b;
- 	i = 0;
-+	v_end = 0;
- 	do {
- 		j = *p++;
- 		if (j != 0) {
- 			v[x[j]++] = i;
-+			v_end = x[j];
- 		}
- 	} while (++i < n);
- 
-@@ -432,7 +435,7 @@ static int huft_build(const unsigned *b, const unsigned n,
- 
- 			/* set up table entry in r */
- 			r.b = (unsigned char) (k - w);
--			if (p >= v + n) {
-+			if (p >= v + v_end) { // Was "if (p >= v + n)" but v[] can be shorter!
- 				r.e = 99; /* out of values--invalid code */
- 			} else if (*p < s) {
- 				r.e = (unsigned char) (*p < 256 ? 16 : 15);	/* 256 is EOB code */
-diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
-index 8677a03..ca0a458 100755
---- a/testsuite/unzip.tests
-+++ b/testsuite/unzip.tests
-@@ -7,7 +7,7 @@
- 
- . ./testing.sh
- 
--# testing "test name" "options" "expected result" "file input" "stdin"
-+# testing "test name" "commands" "expected result" "file input" "stdin"
- #   file input will be file called "input"
- #   test can create a file "actual" instead of writing to stdout
- 
-@@ -30,6 +30,27 @@ testing "unzip (subdir only)" "unzip -q foo.zip foo/ && test -d foo && test ! -f
- rmdir foo
- rm foo.zip
- 
-+# File containing some damaged encrypted stream
-+testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
-+"Archive:  bad.zip
-+  inflating: ]3j½r«IK-%Ix
-+unzip: inflate error
-+1
-+" \
-+"" "\
-+begin-base64 644 bad.zip
-+UEsDBBQAAgkIAAAAIQA5AAAANwAAADwAAAAQAAcAXTNqwr1ywqtJGxJLLSVJ
-+eCkBD0AdKBk8JzQsIj01JC0/ORJQSwMEFAECCAAAAAAhADoAAAAPAAAANgAA
-+AAwAAQASw73Ct1DCokohPXQiNjoUNTUiHRwgLT4WHlBLAQIQABQAAggIAAAA
-+oQA5AAAANwAAADwAAAAQQAcADAAAACwAMgCAAAAAAABdM2rCvXLCq0kbEkst
-+JUl4KQEPQB0oGSY4Cz4QNgEnJSYIPVBLAQIAABQAAggAAAAAIQAqAAAADwAA
-+BDYAAAAMAAEADQAAADIADQAAAEEAAAASw73Ct1DKokohPXQiNzA+FAI1HCcW
-+NzITNFBLBQUKAC4JAA04Cw0EOhZQSwUGAQAABAIAAgCZAAAAeQAAAAIALhM=
-+====
-+"
-+
-+rm *
-+
- # Clean up scratch directory.
- 
- cd ..
--- 
-2.6.2
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
deleted file mode 100644
index bda8685..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From: Jason Wessel <jason.wessel@windriver.com>
-Date: Sun, 3 Mar 2013 12:31:40 -0600
-Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Allow specification of ncurses location
-
-Upstream-Status: Submitted
-
-[ based on: https://lkml.org/lkml/2013/3/3/103 ]
-
-This patch syncs up with the way the menuconfig ncurses / curses
-is detected and the HOST_EXTRACFLAGS works in the Linux kernel
-and it allows the menuconfig to work with a sysroot version
-of the curses libraries.
-
----
-
-In some cross build environments such as the Yocto Project build
-environment it provides an ncurses library that is compiled
-differently than the host's version.  This causes display corruption
-problems when the host's curses includes are used instead of the
-includes from the provided compiler are overridden.  There is a second
-case where there is no curses libraries at all on the host system and
-menuconfig will just fail entirely.
-
-The solution is simply to allow an override variable in
-check-lxdialog.sh for environments such as the Yocto Project.  Adding
-a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
-compiling and linking against the right headers and libraries.
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-cc: Michal Marek <mmarek@suse.cz>
-cc: linux-kbuild@vger.kernel.org
----
- scripts/kconfig/lxdialog/Makefile          |    2 +-
- scripts/kconfig/lxdialog/check-lxdialog.sh |    8 ++++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
---- a/scripts/kconfig/lxdialog/check-lxdialog.sh
-+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
-@@ -4,6 +4,10 @@
- # What library to link
- ldflags()
- {
-+	if [ x"$CROSS_CURSES_LIB" != x ]; then
-+		echo "$CROSS_CURSES_LIB"
-+		exit
-+	fi
- 	for ext in so a dylib ; do
- 		for lib in ncursesw ncurses curses ; do
- 			$cc -print-file-name=lib${lib}.${ext} | grep -q /
-@@ -19,6 +23,10 @@ ldflags()
- # Where is ncurses.h?
- ccflags()
- {
-+	if [ x"$CROSS_CURSES_INC" != x ]; then
-+		echo "$CROSS_CURSES_INC"
-+		exit
-+	fi
- 	if [ -f /usr/include/ncursesw/ncurses.h ]; then
- 		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncurses.h>"'
- 	elif [ -f /usr/include/ncursesw/curses.h ]; then
---- a/scripts/kconfig/lxdialog/Makefile
-+++ b/scripts/kconfig/lxdialog/Makefile
-@@ -5,7 +5,7 @@ check-lxdialog  := $(srctree)/$(src)/che
- 
- # Use reursively expanded variables so we do not call gcc unless
- # we really need to do so. (Do not call gcc as part of make mrproper)
--HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
-+HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
- HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
- 
- HOST_EXTRACFLAGS += -DLOCALE
diff --git a/meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch b/meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
deleted file mode 100644
index 38302e0..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Backport
-
-Patch addressing a parallel make race in Busybox
-
-  http://git.busybox.net/busybox/commit/?id=d8e61bbf13d0cf38d477255cfd5dc71c5d51d575
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
-From d8e61bbf13d0cf38d477255cfd5dc71c5d51d575 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Sun, 21 Aug 2016 22:00:20 +0200
-Subject: build system: different fix for
- include/applet_tables.h/include/NUM_APPLETS.h
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-diff --git a/applets/Kbuild.src b/applets/Kbuild.src
-index 5cc1827..3aedbbf 100644
---- a/applets/Kbuild.src
-+++ b/applets/Kbuild.src
-@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h include/applet_tables.h
- 
- applets/applet_tables: .config include/applets.h
- applets/usage:         .config include/applets.h
--applets/usage_pod:     .config include/applets.h include/applet_tables.h include/NUM_APPLETS.h
-+applets/usage_pod:     .config include/applets.h include/applet_tables.h
- 
- quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
-       cmd_gen_usage_compressed = $(srctree_slash)applets/usage_compressed include/usage_compressed.h applets
-@@ -37,8 +37,21 @@ quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
- include/usage_compressed.h: applets/usage $(srctree_slash)applets/usage_compressed
- 	$(call cmd,gen_usage_compressed)
- 
--quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h
-+quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h include/NUM_APPLETS.h
-       cmd_gen_applet_tables = applets/applet_tables include/applet_tables.h include/NUM_APPLETS.h
- 
--include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
-+include/NUM_APPLETS.h: applets/applet_tables
-+	$(call cmd,gen_applet_tables)
-+
-+# In fact, include/applet_tables.h depends only on applets/applet_tables,
-+# and is generated by it. But specifying only it can run
-+# applets/applet_tables twice, possibly in parallel.
-+# We say that it also needs NUM_APPLETS.h
-+#
-+# Unfortunately, we need to list the same command,
-+# and it can be executed twice (sequentially).
-+# The alternative is to not list any command,
-+# and then if include/applet_tables.h is deleted, it won't be rebuilt.
-+#
-+include/applet_tables.h: include/NUM_APPLETS.h applets/applet_tables
- 	$(call cmd,gen_applet_tables)
diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
index 4c9ce3b..f29513a 100644
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
@@ -1,6 +1,3 @@
-From 53626cd06a3ef05ed847daea802ef0aa9661caa7 Mon Sep 17 00:00:00 2001
-From: Anders Darander <anders@chargestorm.se>
-Date: Thu, 3 Nov 2011 08:51:31 +0100
 Subject: [PATCH] busybox-udhcpc-no_deconfig.patch
 
 Upstream-Status: Pending
@@ -28,35 +25,34 @@ Fixed options -b, -a and -P.
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 ---
- networking/udhcp/dhcpc.c |   29 +++++++++++++++++++++--------
- 1 files changed, 21 insertions(+), 8 deletions(-)
+ networking/udhcp/dhcpc.c | 25 ++++++++++++++++++-------
+ 1 file changed, 18 insertions(+), 7 deletions(-)
 
-Index: busybox-1.20.2/networking/udhcp/dhcpc.c
-===================================================================
---- busybox-1.20.2.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.20.2/networking/udhcp/dhcpc.c
-@@ -29,6 +29,9 @@
- #include <netpacket/packet.h>
- #include <linux/filter.h>
+diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
+index fc7b621..5222fb3 100644
+--- a/networking/udhcp/dhcpc.c
++++ b/networking/udhcp/dhcpc.c
+@@ -42,6 +42,8 @@ struct tpacket_auxdata {
+ };
+ #endif
  
 +/* option whether to down the interface when reconfiguring */
 +static int allow_deconfig = 1;
-+
- /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
  
+ /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
  
-@@ -81,8 +84,9 @@ enum {
+@@ -95,8 +97,9 @@ enum {
  	OPT_x = 1 << 18,
  	OPT_f = 1 << 19,
  	OPT_B = 1 << 20,
 +	OPT_D = 1 << 21,
  /* The rest has variable bit positions, need to be clever */
 -	OPTBIT_B = 20,
-+	OPTBIT_D = 21,
++	OPTBIT_B = 21,
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -1040,7 +1044,8 @@ static void perform_renew(void)
+@@ -1101,7 +1104,8 @@ static void perform_renew(void)
  		state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
@@ -66,26 +62,16 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -1064,7 +1069,8 @@ static void perform_release(uint32_t ser
- 		bb_info_msg("Unicasting a release of %s to %s",
- 				inet_ntoa(temp_addr), buffer);
- 		send_release(server_addr, requested_ip); /* unicast */
--		udhcp_run_script(NULL, "deconfig");
-+		if (allow_deconfig)
-+			udhcp_run_script(NULL, "deconfig");
- 	}
- 	bb_info_msg("Entering released state");
- 
-@@ -1215,7 +1221,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1281,7 +1285,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  	/* O,x: list; -T,-t,-A take numeric param */
  	opt_complementary = "O::x::T+:t+:A+" IF_UDHCP_VERBOSE(":vv") ;
  	IF_LONG_OPTS(applet_long_options = udhcpc_longopts;)
 -	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fB"
 +	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
  		USE_FOR_MMU("b")
- 		IF_FEATURE_UDHCPC_ARPING("a")
+ 		IF_FEATURE_UDHCPC_ARPING("a::")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1316,6 +1322,9 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1390,6 +1394,9 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -95,7 +81,7 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  	/* Make sure fd 0,1,2 are open */
  	bb_sanitize_stdio();
  	/* Equivalent of doing a fflush after every \n */
-@@ -1330,7 +1339,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1404,7 +1411,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  	srand(monotonic_us());
  
  	state = INIT_SELECTING;
@@ -105,17 +91,17 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1484,7 +1494,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1558,7 +1566,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  				}
  				/* Timed out, enter init state */
- 				bb_info_msg("Lease lost, entering init state");
+ 				bb_error_msg("lease lost, entering init state");
 -				udhcp_run_script(NULL, "deconfig");
 +				if (allow_deconfig)
 +					udhcp_run_script(NULL, "deconfig");
  				state = INIT_SELECTING;
  				client_config.first_secs = 0; /* make secs field count from 0 */
  				/*timeout = 0; - already is */
-@@ -1667,7 +1678,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1751,7 +1760,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  						send_decline(/*xid,*/ server_addr, packet.yiaddr);
  
  						if (state != REQUESTING)
@@ -125,8 +111,8 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  						change_listen_mode(LISTEN_RAW);
  						state = INIT_SELECTING;
  						client_config.first_secs = 0; /* make secs field count from 0 */
-@@ -1711,7 +1723,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
- 				bb_info_msg("Received DHCP NAK");
+@@ -1822,7 +1832,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+ 				bb_error_msg("received %s", "DHCP NAK");
  				udhcp_run_script(&packet, "nak");
  				if (state != REQUESTING)
 -					udhcp_run_script(NULL, "deconfig");
@@ -135,3 +121,6 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  				change_listen_mode(LISTEN_RAW);
  				sleep(3); /* avoid excessive network traffic */
  				state = INIT_SELECTING;
+-- 
+2.1.0
+
diff --git a/meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch b/meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
deleted file mode 100644
index 7f80a1d..0000000
--- a/meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Upstream-Status: Backport
-
-Patch addressing a parallel make race in Busybox
-
-  http://git.busybox.net/busybox/commit/?id=0dddbc1a59795a77679d8c5ef48a2795cb470563
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
-From 0dddbc1a59795a77679d8c5ef48a2795cb470563 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Tue, 23 Aug 2016 20:21:36 +0200
-Subject: build system: always rewrite NUM_APPLETS.h
-
-Conditional rewrite can keep NUM_APPLETS.h mtime old,
-this causes make to try to regenerate it at every invocation.
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-diff --git a/applets/applet_tables.c b/applets/applet_tables.c
-index 8401a15..ef911a4 100644
---- a/applets/applet_tables.c
-+++ b/applets/applet_tables.c
-@@ -192,27 +192,28 @@ int main(int argc, char **argv)
- 	printf("};\n");
- #endif
- 	//printf("#endif /* SKIP_definitions */\n");
-+
- //	printf("\n");
- //	printf("#define MAX_APPLET_NAME_LEN %u\n", MAX_APPLET_NAME_LEN);
- 
- 	if (argv[2]) {
--		char line_old[80];
--		char line_new[80];
- 		FILE *fp;
-+		char line_new[80];
-+//		char line_old[80];
- 
--		line_old[0] = 0;
--		fp = fopen(argv[2], "r");
--		if (fp) {
--			fgets(line_old, sizeof(line_old), fp);
--			fclose(fp);
--		}
- 		sprintf(line_new, "#define NUM_APPLETS %u\n", NUM_APPLETS);
--		if (strcmp(line_old, line_new) != 0) {
-+//		line_old[0] = 0;
-+//		fp = fopen(argv[2], "r");
-+//		if (fp) {
-+//			fgets(line_old, sizeof(line_old), fp);
-+//			fclose(fp);
-+//		}
-+//		if (strcmp(line_old, line_new) != 0) {
- 			fp = fopen(argv[2], "w");
- 			if (!fp)
- 				return 1;
- 			fputs(line_new, fp);
--		}
-+//		}
- 	}
- 
- 	return 0;
diff --git a/meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch b/meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
deleted file mode 100644
index 41c5656..0000000
--- a/meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 4ab372d49a6e82b0bf097dedb96d26330c5f2d5f Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Sun, 24 Apr 2016 17:39:02 +0200
-Subject: [PATCH] ip: fix problem on mips64 n64 big endian musl systems
-
-Use designated initializers for struct msghdr.
-The struct layout is non-portable and musl libc does not match what busybox expects.
-
-Signed-off-by: Szabolcs Nagy <nsz@port70.net>
-Tested-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-Upstream-Status: Backport
-
-https://git.busybox.net/busybox/commit/?id=4ab372d49a6e82b0bf097dedb96d26330c5f2d5f
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- networking/libiproute/libnetlink.c | 37 ++++++++++++++++++++++++-------------
- 1 file changed, 24 insertions(+), 13 deletions(-)
-
-diff --git a/networking/libiproute/libnetlink.c b/networking/libiproute/libnetlink.c
-index c7533a4..cbb5daf 100644
---- a/networking/libiproute/libnetlink.c
-+++ b/networking/libiproute/libnetlink.c
-@@ -71,11 +71,15 @@ int FAST_FUNC rtnl_dump_request(struct rtnl_handle *rth, int type, void *req, in
- 	struct nlmsghdr nlh;
- 	struct sockaddr_nl nladdr;
- 	struct iovec iov[2] = { { &nlh, sizeof(nlh) }, { req, len } };
-+	/* Use designated initializers, struct layout is non-portable */
- 	struct msghdr msg = {
--		(void*)&nladdr, sizeof(nladdr),
--		iov,  2,
--		NULL, 0,
--		0
-+		.msg_name = (void*)&nladdr,
-+		.msg_namelen = sizeof(nladdr),
-+		.msg_iov = iov,
-+		.msg_iovlen = 2,
-+		.msg_control = NULL,
-+		.msg_controllen = 0,
-+		.msg_flags = 0
- 	};
- 
- 	memset(&nladdr, 0, sizeof(nladdr));
-@@ -104,12 +108,15 @@ static int rtnl_dump_filter(struct rtnl_handle *rth,
- 	while (1) {
- 		int status;
- 		struct nlmsghdr *h;
--
-+		/* Use designated initializers, struct layout is non-portable */
- 		struct msghdr msg = {
--			(void*)&nladdr, sizeof(nladdr),
--			&iov, 1,
--			NULL, 0,
--			0
-+			.msg_name = (void*)&nladdr,
-+			.msg_namelen = sizeof(nladdr),
-+			.msg_iov = &iov,
-+			.msg_iovlen = 1,
-+			.msg_control = NULL,
-+			.msg_controllen = 0,
-+			.msg_flags = 0
- 		};
- 
- 		status = recvmsg(rth->fd, &msg, 0);
-@@ -211,11 +218,15 @@ int FAST_FUNC rtnl_talk(struct rtnl_handle *rtnl, struct nlmsghdr *n,
- 	struct sockaddr_nl nladdr;
- 	struct iovec iov = { (void*)n, n->nlmsg_len };
- 	char   *buf = xmalloc(8*1024); /* avoid big stack buffer */
-+	/* Use designated initializers, struct layout is non-portable */
- 	struct msghdr msg = {
--		(void*)&nladdr, sizeof(nladdr),
--		&iov, 1,
--		NULL, 0,
--		0
-+		.msg_name = (void*)&nladdr,
-+		.msg_namelen = sizeof(nladdr),
-+		.msg_iov = &iov,
-+		.msg_iovlen = 1,
-+		.msg_control = NULL,
-+		.msg_controllen = 0,
-+		.msg_flags = 0
- 	};
- 
- 	memset(&nladdr, 0, sizeof(nladdr));
--- 
-2.3.5
-
diff --git a/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch b/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
deleted file mode 100644
index 2e9842e..0000000
--- a/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9e5820a86277818c2f83c11c2aa76d7f0a38283e Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Sun, 14 Aug 2016 02:54:27 +0200
-Subject: build system: fix include/NUM_APPLETS.h generation
-
-TBH, it's more like "work around my bad makefile-fu" than "fix"...
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- applets/Kbuild.src | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-Upstream-Status: Backport
-
-diff --git a/applets/Kbuild.src b/applets/Kbuild.src
-index b612399..5cc1827 100644
---- a/applets/Kbuild.src
-+++ b/applets/Kbuild.src
-@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h include/applet_tables.h
- 
- applets/applet_tables: .config include/applets.h
- applets/usage:         .config include/applets.h
--applets/usage_pod:     .config include/applet_tables.h include/applets.h
-+applets/usage_pod:     .config include/applets.h include/applet_tables.h include/NUM_APPLETS.h
- 
- quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
-       cmd_gen_usage_compressed = $(srctree_slash)applets/usage_compressed include/usage_compressed.h applets
-@@ -40,8 +40,5 @@ include/usage_compressed.h: applets/usage $(srctree_slash)applets/usage_compress
- quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h
-       cmd_gen_applet_tables = applets/applet_tables include/applet_tables.h include/NUM_APPLETS.h
- 
--include/applet_tables.h: applets/applet_tables
--	$(call cmd,gen_applet_tables)
--
--include/NUM_APPLETS.h: applets/applet_tables
-+include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
- 	$(call cmd,gen_applet_tables)
--- 
-cgit v0.12
-
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.25.1.bb
similarity index 65%
rename from meta/recipes-core/busybox/busybox_1.24.1.bb
rename to meta/recipes-core/busybox/busybox_1.25.1.bb
index afb69d1..c7a39e5 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.25.1.bb
@@ -27,12 +27,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://inetd \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
-           file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://busybox-1.24.1-unzip.patch \
-           file://busybox-1.24.1-unzip-regression.patch \
-           file://busybox-1.24.1-truncate-open-mode.patch \
-           file://0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
@@ -44,18 +39,10 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcS \
            file://rcK \
            file://runlevel \
-           file://CVE-2016-2148.patch \
-           file://CVE-2016-2147.patch \
-           file://CVE-2016-2147_2.patch \
-           file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
-           file://makefile-fix-backport.patch \
-           file://0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch \
-           file://busybox-kbuild-race-fix-commit-d8e61bb.patch \
-           file://commit-applet_tables-fix-commit-0dddbc1.patch \
            file://makefile-libbb-race.patch \
            file://0001-libiproute-handle-table-ids-larger-than-255.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "be98a40cadf84ce2d6b05fa41a275c6a"
-SRC_URI[tarball.sha256sum] = "37d03132cc078937360b392170b7a1d0e5b322eee9f57c0b82292a8b1f0afe3d"
+SRC_URI[tarball.md5sum] = "4f4c5de50b479b11ff636d7d8eb902a2"
+SRC_URI[tarball.sha256sum] = "27667e0f2328fdbd79cfd622e4453e5c57e58f781c5da97c9be337d93aa2a02e"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index c2ee3e6..d10fbf7 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,8 +1,8 @@
 require busybox.inc
 
-SRCREV = "1b7c17391de66502dd7a97c866e0a33681edbb1f"
+SRCREV = "868530ade244bf8162fb6a10816bd815b166d509"
 # Lookout for PV bump too when SRCREV is changed
-PV = "1.25.0+git${SRCPV}"
+PV = "1.25.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -33,7 +33,6 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://inetd \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
-           file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
@@ -46,6 +45,8 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://rcS \
            file://rcK \
            file://runlevel \
+           file://makefile-libbb-race.patch \
+           file://0001-libiproute-handle-table-ids-larger-than-255.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


