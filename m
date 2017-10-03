Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id D14DD60938
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 15:38:52 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v93FcrwF013699
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Oct 2017 17:38:53 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v93Fcrx5010017;
	Tue, 3 Oct 2017 17:38:53 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 70BAA140B10E;
	Tue,  3 Oct 2017 17:38:56 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Oct 2017 17:38:52 +0200
Message-Id: <1507045133-16665-2-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] busybox: 1.24.1 -> 1.27.2
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
X-List-Received-Date: Tue, 03 Oct 2017 15:38:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- fixed link creation to shell
 - reported bug with suid shells [https://bugs.busybox.net/show_bug.cgi?id=10346]
- removed and modified already merged patches
- updated defconfig regarding to new version

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 ...ss-interface-device-name-for-ipv6-route-c.patch |  52 --
 meta/recipes-core/busybox/busybox.inc              |  16 +-
 ...e-the-behaviour-of-c-parameter-to-match-u.patch |  64 ---
 ...mproper-optimization-req.r.rtm_scope-may-.patch |  33 --
 .../0001-iproute-support-scope-.-Closes-8561.patch | 122 -----
 ...biproute-handle-table-ids-larger-than-255.patch | 134 -----
 ...-n-flushes-pattern-space-terminates-early.patch |  72 ---
 .../busybox/BUG9071_buffer_overflow_arp.patch      |  53 --
 .../busybox/busybox/CVE-2016-2147.patch            |  57 --
 .../busybox/busybox/CVE-2016-2147_2.patch          |  32 --
 .../busybox/busybox/CVE-2016-2148.patch            |  74 ---
 .../busybox/busybox/CVE-2016-6301.patch            |  37 --
 .../busybox-1.24.1-truncate-open-mode.patch        |  81 ---
 .../busybox/busybox-1.24.1-unzip-regression.patch  | 143 ------
 .../busybox/busybox/busybox-1.24.1-unzip.patch     | 118 -----
 .../busybox/busybox/busybox-cross-menuconfig.patch |  18 +-
 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   |  53 --
 .../busybox-tar-add-IF_FEATURE_-checks.patch       |  70 ---
 .../busybox/busybox-udhcpc-no_deconfig.patch       |  68 +--
 .../commit-applet_tables-fix-commit-0dddbc1.patch  |  61 ---
 meta/recipes-core/busybox/busybox/defconfig        | 572 ++++++++++++---------
 ...lem_on_mips64_n64_big_endian_musl_systems.patch |  90 ----
 .../busybox/busybox/makefile-fix-backport.patch    |  40 --
 .../{busybox_1.24.1.bb => busybox_1.27.2.bb}       |  23 +-
 24 files changed, 384 insertions(+), 1699 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-6301.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
 rename meta/recipes-core/busybox/{busybox_1.24.1.bb => busybox_1.27.2.bb} (57%)

diff --git a/meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch b/meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch
deleted file mode 100644
index 5715378..0000000
--- a/meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 06fcf98f6ca40dc6b823d7d6231a240a1794ef2d Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Tue, 28 Feb 2017 10:40:37 +0800
-Subject: [PATCH] ifupdown: pass interface device name for ipv6 route commands
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-commit 028524317d8d0011ed38e86e507a06738a5b5a97 from upstream
-
-IPv6 routes need the device argument for link-local routes, or they
-cannot be used at all. E.g. "gateway fe80::def" seems to be used in
-some places, but kernel refuses to insert the route unless device
-name is explicitly specified in the route addition.
-
-Signed-off-by: Timo Teräs <timo.teras@iki.fi>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-Upstream-Status: Backport
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
----
- networking/ifupdown.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/networking/ifupdown.c b/networking/ifupdown.c
-index 17bc4e9..a00f68d 100644
---- a/networking/ifupdown.c
-+++ b/networking/ifupdown.c
-@@ -394,8 +394,8 @@ static int FAST_FUNC static_up6(struct interface_defn_t *ifd, execfn *exec)
- # if ENABLE_FEATURE_IFUPDOWN_IP
- 	result = execute("ip addr add %address%/%netmask% dev %iface%[[ label %label%]]", ifd, exec);
- 	result += execute("ip link set[[ mtu %mtu%]][[ addr %hwaddress%]] %iface% up", ifd, exec);
--	/* Was: "[[ ip ....%gateway% ]]". Removed extra spaces w/o checking */
--	result += execute("[[ip route add ::/0 via %gateway%]][[ metric %metric%]]", ifd, exec);
-+	/* Reportedly, IPv6 needs "dev %iface%", but IPv4 does not: */
-+	result += execute("[[ip route add ::/0 via %gateway% dev %iface%]][[ metric %metric%]]", ifd, exec);
- # else
- 	result = execute("ifconfig %iface%[[ media %media%]][[ hw %hwaddress%]][[ mtu %mtu%]] up", ifd, exec);
- 	result += execute("ifconfig %iface% add %address%/%netmask%", ifd, exec);
-@@ -421,7 +421,8 @@ static int FAST_FUNC v4tunnel_up(struct interface_defn_t *ifd, execfn *exec)
- 			"%endpoint%[[ local %local%]][[ ttl %ttl%]]", ifd, exec);
- 	result += execute("ip link set %iface% up", ifd, exec);
- 	result += execute("ip addr add %address%/%netmask% dev %iface%", ifd, exec);
--	result += execute("[[ip route add ::/0 via %gateway%]]", ifd, exec);
-+	/* Reportedly, IPv6 needs "dev %iface%", but IPv4 does not: */
-+	result += execute("[[ip route add ::/0 via %gateway% dev %iface%]]", ifd, exec);
- 	return ((result == 4) ? 4 : 0);
- }
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 48910ca..86f0c60 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -156,6 +156,12 @@ do_compile() {
 		cp .config .config.orig
 		oe_runmake busybox.cfg.suid
 		oe_runmake busybox.cfg.nosuid
+
+		# workaround for suid bug 10346
+		if ! grep -q "CONFIG_SH_IS_NONE" busybox.cfg.nosuid; then
+			echo "CONFIG_SH_IS_NONE" >> busybox.cfg.suid
+		fi
+
 		for i in `cat busybox.cfg.suid busybox.cfg.nosuid`; do
 			echo "# $i is not set" >> .config.disable.apps
 		done
@@ -165,6 +171,12 @@ do_compile() {
 			cat busybox.cfg.$s | while read item; do
 				grep -w "$item" .config.orig
 			done > .config.app.$s
+
+			# workaround for suid bug 10346
+			if [ "$s" == "suid" ] ; then
+				sed "s/.*CONFIG_SH_IS_NONE.*$/CONFIG_SH_IS_NONE=y/" -i .config.app.suid
+			fi
+
 			merge_config.sh -m .config.nonapps .config.app.$s
 			oe_runmake busybox_unstripped
 			mv busybox_unstripped busybox.$s
@@ -204,7 +216,7 @@ do_install () {
 			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
 			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
 			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
-			if grep -q "CONFIG_FEATURE_SH_IS_ASH=y" ${B}/.config; then
+			if grep -q "CONFIG_SH_IS_ASH=y" ${B}/.config; then
 				ln -sf busybox.nosuid ${D}${base_bindir}/sh
 			fi
 			# Keep a default busybox for people who want to invoke busybox directly.
@@ -218,7 +230,7 @@ do_install () {
 				install -m 0755 ${B}/busybox ${D}${base_bindir}
 			fi
 			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
-			if grep -q "CONFIG_FEATURE_SH_IS_ASH=y" ${B}/.config; then
+			if grep -q "CONFIG_SH_IS_ASH=y" ${B}/.config; then
 				ln -sf busybox ${D}${base_bindir}/sh
 			fi
 			# We make this symlink here to eliminate the error when upgrading together
diff --git a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
deleted file mode 100644
index 78520f0..0000000
--- a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From e1d426fd65c00a6d01a10d85edf8a294ae8a2d2b Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Sun, 24 Apr 2016 18:19:49 +0200
-Subject: [PATCH] flock: fix -c; improve error handling of fork+exec
-
-function                                             old     new   delta
-flock_main                                           254     334     +80
-
-Upstream-Status: Backport
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- util-linux/flock.c | 19 +++++++++++++++++--
- 1 file changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/util-linux/flock.c b/util-linux/flock.c
-index 05a747f..539a835 100644
---- a/util-linux/flock.c
-+++ b/util-linux/flock.c
-@@ -57,7 +57,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 	/* If it is "flock FILE -c PROG", then -c isn't caught by getopt32:
- 	 * we use "+" in order to support "flock -opt FILE PROG -with-opts",
- 	 * we need to remove -c by hand.
--	 * TODO: in upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
- 	 */
- 	if (argv[0]
- 	 && argv[0][0] == '-'
-@@ -66,6 +65,9 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 	    )
- 	) {
- 		argv++;
-+		if (argv[1])
-+			bb_error_msg_and_die("-c takes only one argument");
-+		opt |= OPT_c;
- 	}
- 
- 	if (OPT_s == LOCK_SH && OPT_x == LOCK_EX && OPT_n == LOCK_NB && OPT_u == LOCK_UN) {
-@@ -90,8 +92,21 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 		bb_perror_nomsg_and_die();
- 	}
- 
--	if (argv[0])
-+	if (argv[0]) {
-+		if (!(opt & OPT_c)) {
-+			int rc = spawn_and_wait(argv);
-+			if (rc < 0)
-+				bb_simple_perror_msg(argv[0]);
-+			return rc;
-+		}
-+		/* -c 'PROG ARGS' means "run sh -c 'PROG ARGS'" */
-+		argv -= 2;
-+		argv[0] = (char*)get_shell_name();
-+		argv[1] = (char*)"-c";
-+		/* argv[2] = "PROG ARGS"; */
-+		/* argv[3] = NULL; */
- 		return spawn_and_wait(argv);
-+	}
- 
- 	return EXIT_SUCCESS;
- }
--- 
-2.4.0
-
diff --git a/meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch b/meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
deleted file mode 100644
index 812a507..0000000
--- a/meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 34ecc3b7aefdd6c31e8691bd5485037bbabedbd4 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Sun, 14 Aug 2016 01:30:34 +0200
-Subject: [PATCH] ip: fix an improper optimization: req.r.rtm_scope may be
- nonzero here
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
-
- networking/libiproute/iproute.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/networking/libiproute/iproute.c b/networking/libiproute/iproute.c
-index e674e9a0d..48dc6e3d9 100644
---- a/networking/libiproute/iproute.c
-+++ b/networking/libiproute/iproute.c
-@@ -362,10 +362,9 @@ IF_FEATURE_IP_RULE(ARG_table,)
- 		req.r.rtm_scope = RT_SCOPE_NOWHERE;
- 
- 	if (cmd != RTM_DELROUTE) {
-+		req.r.rtm_scope = RT_SCOPE_UNIVERSE;
- 		if (RTPROT_BOOT != 0)
- 			req.r.rtm_protocol = RTPROT_BOOT;
--		if (RT_SCOPE_UNIVERSE != 0)
--			req.r.rtm_scope = RT_SCOPE_UNIVERSE;
- 		if (RTN_UNICAST != 0)
- 			req.r.rtm_type = RTN_UNICAST;
- 	}
--- 
-2.11.0
-
diff --git a/meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch b/meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch
deleted file mode 100644
index 66bc76e..0000000
--- a/meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From ce4bc1ed048233e89ee4cb95830bf6f01d523d1e Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Wed, 30 Dec 2015 17:32:51 +0100
-Subject: [PATCH] iproute: support "scope". Closes 8561
-
-function                                             old     new   delta
-iproute_modify                                      1051    1120     +69
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-Upstream-Status: Backport
-Modified patch to build against busybox 1.24.1:
-- s/invarg_1_to_2/invarg
-Signed-off-by: André Draszik <adraszik@tycoint.com>
----
- networking/libiproute/iproute.c | 52 ++++++++++++++++++++++++++---------------
- 1 file changed, 33 insertions(+), 19 deletions(-)
-
-diff --git a/networking/libiproute/iproute.c b/networking/libiproute/iproute.c
-index d232ee6fd..82827488f 100644
---- a/networking/libiproute/iproute.c
-+++ b/networking/libiproute/iproute.c
-@@ -313,12 +313,13 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
- static int iproute_modify(int cmd, unsigned flags, char **argv)
- {
- 	static const char keywords[] ALIGN1 =
--		"src\0""via\0""mtu\0""lock\0""protocol\0"IF_FEATURE_IP_RULE("table\0")
-+		"src\0""via\0""mtu\0""lock\0""scope\0""protocol\0"IF_FEATURE_IP_RULE("table\0")
- 		"dev\0""oif\0""to\0""metric\0""onlink\0";
- 	enum {
- 		ARG_src,
- 		ARG_via,
- 		ARG_mtu, PARM_lock,
-+		ARG_scope,
- 		ARG_protocol,
- IF_FEATURE_IP_RULE(ARG_table,)
- 		ARG_dev,
-@@ -344,6 +345,7 @@ IF_FEATURE_IP_RULE(ARG_table,)
- 	unsigned mxlock = 0;
- 	char *d = NULL;
- 	smalluint ok = 0;
-+	smalluint scope_ok = 0;
- 	int arg;
- 
- 	memset(&req, 0, sizeof(req));
-@@ -352,15 +354,18 @@ IF_FEATURE_IP_RULE(ARG_table,)
- 	req.n.nlmsg_flags = NLM_F_REQUEST | flags;
- 	req.n.nlmsg_type = cmd;
- 	req.r.rtm_family = preferred_family;
--	if (RT_TABLE_MAIN) /* if it is zero, memset already did it */
-+	if (RT_TABLE_MAIN != 0) /* if it is zero, memset already did it */
- 		req.r.rtm_table = RT_TABLE_MAIN;
--	if (RT_SCOPE_NOWHERE)
-+	if (RT_SCOPE_NOWHERE != 0)
- 		req.r.rtm_scope = RT_SCOPE_NOWHERE;
- 
- 	if (cmd != RTM_DELROUTE) {
--		req.r.rtm_protocol = RTPROT_BOOT;
--		req.r.rtm_scope = RT_SCOPE_UNIVERSE;
--		req.r.rtm_type = RTN_UNICAST;
-+		if (RTPROT_BOOT != 0)
-+			req.r.rtm_protocol = RTPROT_BOOT;
-+		if (RT_SCOPE_UNIVERSE != 0)
-+			req.r.rtm_scope = RT_SCOPE_UNIVERSE;
-+		if (RTN_UNICAST != 0)
-+			req.r.rtm_type = RTN_UNICAST;
- 	}
- 
- 	mxrta->rta_type = RTA_METRICS;
-@@ -393,6 +398,13 @@ IF_FEATURE_IP_RULE(ARG_table,)
- 			}
- 			mtu = get_unsigned(*argv, "mtu");
- 			rta_addattr32(mxrta, sizeof(mxbuf), RTAX_MTU, mtu);
-+		} else if (arg == ARG_scope) {
-+			uint32_t scope;
-+			NEXT_ARG();
-+			if (rtnl_rtscope_a2n(&scope, *argv))
-+				invarg(*argv, "scope");
-+			req.r.rtm_scope = scope;
-+			scope_ok = 1;
- 		} else if (arg == ARG_protocol) {
- 			uint32_t prot;
- 			NEXT_ARG();
-@@ -469,20 +481,22 @@ IF_FEATURE_IP_RULE(ARG_table,)
- 		addattr_l(&req.n, sizeof(req), RTA_METRICS, RTA_DATA(mxrta), RTA_PAYLOAD(mxrta));
- 	}
- 
--	if (req.r.rtm_type == RTN_LOCAL || req.r.rtm_type == RTN_NAT)
--		req.r.rtm_scope = RT_SCOPE_HOST;
--	else
--	if (req.r.rtm_type == RTN_BROADCAST
--	 || req.r.rtm_type == RTN_MULTICAST
--	 || req.r.rtm_type == RTN_ANYCAST
--	) {
--		req.r.rtm_scope = RT_SCOPE_LINK;
--	}
--	else if (req.r.rtm_type == RTN_UNICAST || req.r.rtm_type == RTN_UNSPEC) {
--		if (cmd == RTM_DELROUTE)
--			req.r.rtm_scope = RT_SCOPE_NOWHERE;
--		else if (!(ok & gw_ok))
-+	if (!scope_ok) {
-+		if (req.r.rtm_type == RTN_LOCAL || req.r.rtm_type == RTN_NAT)
-+			req.r.rtm_scope = RT_SCOPE_HOST;
-+		else
-+		if (req.r.rtm_type == RTN_BROADCAST
-+		 || req.r.rtm_type == RTN_MULTICAST
-+		 || req.r.rtm_type == RTN_ANYCAST
-+		) {
- 			req.r.rtm_scope = RT_SCOPE_LINK;
-+		}
-+		else if (req.r.rtm_type == RTN_UNICAST || req.r.rtm_type == RTN_UNSPEC) {
-+			if (cmd == RTM_DELROUTE)
-+				req.r.rtm_scope = RT_SCOPE_NOWHERE;
-+			else if (!(ok & gw_ok))
-+				req.r.rtm_scope = RT_SCOPE_LINK;
-+		}
- 	}
- 
- 	if (req.r.rtm_family == AF_UNSPEC) {
--- 
-2.11.0
-
diff --git a/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch b/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
deleted file mode 100644
index aac5b40..0000000
--- a/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From b5a9234272e6084557224c73ab7737ed47f09848 Mon Sep 17 00:00:00 2001
-From: Lukasz Nowak <lnowak@tycoint.com>
-Date: Wed, 23 Nov 2016 12:48:21 +0000
-Subject: [PATCH v2] libiproute: handle table ids larger than 255
-
-Linux kernel, starting from 2.6.19 allows ip table ids to have 32-bit values.
-In order to preserve compatibility, the old 8-bit field: rtm_table is still
-in use when table id is lower than 256.
-
-Add support for the 32-bit table id (RTA_TABLE attribute) in:
-- ip route print
-- ip route modify
-- ip rule print
-- ip rule modify
-
-Add printing of table ids to ip route.
-
-Changes are compatible with the mainline iproute2 utilities.
-
-These changes are required for compatibility with ConnMan, which by default
-uses table ids greater than 255.
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2016-December/084989.html]
-
-Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
----
- networking/libiproute/iproute.c | 24 ++++++++++++++++++++----
- networking/libiproute/iprule.c  | 11 +++++++++--
- 2 files changed, 29 insertions(+), 6 deletions(-)
-
-diff --git a/networking/libiproute/iproute.c b/networking/libiproute/iproute.c
-index 6ecd5f7..d5af498 100644
---- a/networking/libiproute/iproute.c
-+++ b/networking/libiproute/iproute.c
-@@ -87,6 +87,7 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
- 	inet_prefix dst;
- 	inet_prefix src;
- 	int host_len = -1;
-+	uint32_t tid;
- 
- 	if (n->nlmsg_type != RTM_NEWROUTE && n->nlmsg_type != RTM_DELROUTE) {
- 		fprintf(stderr, "Not a route: %08x %08x %08x\n",
-@@ -99,6 +100,14 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
- 	if (len < 0)
- 		bb_error_msg_and_die("wrong nlmsg len %d", len);
- 
-+	memset(tb, 0, sizeof(tb));
-+	parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);
-+
-+	if (tb[RTA_TABLE])
-+		tid = *(uint32_t *)RTA_DATA(tb[RTA_TABLE]);
-+	else
-+		tid = r->rtm_table;
-+
- 	if (r->rtm_family == AF_INET6)
- 		host_len = 128;
- 	else if (r->rtm_family == AF_INET)
-@@ -128,7 +137,7 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
- 			}
- 		}
- 	} else {
--		if (G_filter.tb > 0 && G_filter.tb != r->rtm_table) {
-+		if (G_filter.tb > 0 && G_filter.tb != tid) {
- 			return 0;
- 		}
- 	}
-@@ -157,10 +166,8 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
- 		return 0;
- 	}
- 
--	memset(tb, 0, sizeof(tb));
- 	memset(&src, 0, sizeof(src));
- 	memset(&dst, 0, sizeof(dst));
--	parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);
- 
- 	if (tb[RTA_SRC]) {
- 		src.bitlen = r->rtm_src_len;
-@@ -283,6 +290,10 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
- 	if (tb[RTA_OIF]) {
- 		printf("dev %s ", ll_index_to_name(*(int*)RTA_DATA(tb[RTA_OIF])));
- 	}
-+#if ENABLE_FEATURE_IP_RULE
-+	if (tid && tid != RT_TABLE_MAIN && !G_filter.tb)
-+		printf("table %s ", rtnl_rttable_n2a(tid));
-+#endif
- 
- 	/* Todo: parse & show "proto kernel", "scope link" here */
- 
-@@ -434,7 +445,12 @@ IF_FEATURE_IP_RULE(ARG_table,)
- 			NEXT_ARG();
- 			if (rtnl_rttable_a2n(&tid, *argv))
- 				invarg(*argv, "table");
--			req.r.rtm_table = tid;
-+			if (tid < 256)
-+				req.r.rtm_table = tid;
-+			else {
-+				req.r.rtm_table = RT_TABLE_UNSPEC;
-+				addattr32(&req.n, sizeof(req), RTA_TABLE, tid);
-+			}
- #endif
- 		} else if (arg == ARG_dev || arg == ARG_oif) {
- 			NEXT_ARG();
-diff --git a/networking/libiproute/iprule.c b/networking/libiproute/iprule.c
-index 774a3e2..3fac7c5 100644
---- a/networking/libiproute/iprule.c
-+++ b/networking/libiproute/iprule.c
-@@ -119,7 +119,9 @@ static int FAST_FUNC print_rule(const struct sockaddr_nl *who UNUSED_PARAM,
- 		printf("iif %s ", (char*)RTA_DATA(tb[RTA_IIF]));
- 	}
- 
--	if (r->rtm_table)
-+	if (tb[RTA_TABLE])
-+		printf("lookup %s ", rtnl_rttable_n2a(*(uint32_t*)RTA_DATA(tb[RTA_TABLE])));
-+	else if (r->rtm_table)
- 		printf("lookup %s ", rtnl_rttable_n2a(r->rtm_table));
- 
- 	if (tb[RTA_FLOW]) {
-@@ -259,7 +261,12 @@ static int iprule_modify(int cmd, char **argv)
- 			NEXT_ARG();
- 			if (rtnl_rttable_a2n(&tid, *argv))
- 				invarg(*argv, "table ID");
--			req.r.rtm_table = tid;
-+			if (tid < 256)
-+				req.r.rtm_table = tid;
-+			else {
-+				req.r.rtm_table = RT_TABLE_UNSPEC;
-+				addattr32(&req.n, sizeof(req), RTA_TABLE, tid);
-+			}
- 			table_ok = 1;
- 		} else if (key == ARG_dev ||
- 			   key == ARG_iif
--- 
-2.7.4
-
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
diff --git a/meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch b/meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch
deleted file mode 100644
index 828694c..0000000
--- a/meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-busybox1.24.1: Fix busybox - (local) cmdline stack buffer overwrite 
-
-[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=9071
-
-busybox - (local) cmdline stack buffer overwrite 
-
-Busybox provides an `arp` applet which is missing an array bounds check for 
-command-line parameter `IFNAME`. It is therefore vulnerable to a command-line 
-based local stack buffer overwrite effectively allowing local users to write 
-past a 16 bytes fixed stack buffer. This leads to two scenarios, one (A) where 
-an IOCTL for GET_HW_ADDRESS (`SIOCGIFHWADDR`) fails and results in a corrupted 
-`va_list` being passed to `*printf()` and one (B) where an attacker might provide 
-valid params for the IOCTL and trick the program to proceed and result in a 
-`RET eip overwrite` eventually gaining code execution.
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/networking/arp.c?id=88e2b1cb626761b1924305b761a5dfc723613c4e]
-BUG: BUG9071
-Signed-off-by: Martin Balik <martin.balik@siemens.com>
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
---
-
-diff --git a/networking/arp.c b/networking/arp.c
-index 0099aa5..87eb327 100644
---- a/networking/arp.c
-+++ b/networking/arp.c
-@@ -176,7 +176,7 @@ static int arp_del(char **args)
- 	if (flags == 0)
- 		flags = 3;
- 
--	strncpy(req.arp_dev, device, sizeof(req.arp_dev));
-+	strncpy_IFNAMSIZ(req.arp_dev, device);
- 
- 	err = -1;
- 
-@@ -217,7 +217,7 @@ static void arp_getdevhw(char *ifname, struct sockaddr *sa)
- 	struct ifreq ifr;
- 	const struct hwtype *xhw;
- 
--	strcpy(ifr.ifr_name, ifname);
-+	strncpy_IFNAMSIZ(ifr.ifr_name, ifname);
- 	ioctl_or_perror_and_die(sockfd, SIOCGIFHWADDR, &ifr,
- 					"can't get HW-Address for '%s'", ifname);
- 	if (hw_set && (ifr.ifr_hwaddr.sa_family != hw->type)) {
-@@ -330,7 +330,7 @@ static int arp_set(char **args)
- 	/* Fill in the remainder of the request. */
- 	req.arp_flags = flags;
- 
--	strncpy(req.arp_dev, device, sizeof(req.arp_dev));
-+	strncpy_IFNAMSIZ(req.arp_dev, device);
- 
- 	/* Call the kernel. */
- 	if (option_mask32 & ARP_OPT_v)
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
index b8349c0..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1b7c17391de66502dd7a97c866e0a33681edbb1f Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 11 Mar 2016 00:26:58 +0100
-Subject: [PATCH] udhcpc: fix a warning in debug code
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream-Status: Backport
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
diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-6301.patch b/meta/recipes-core/busybox/busybox/CVE-2016-6301.patch
deleted file mode 100644
index 851bc20..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2016-6301.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-busybox1.24.1: Fix CVE-2016-6301
-
-[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1363710
-
-ntpd: NTP server denial of service flaw
-
-The busybox NTP implementation doesn't check the NTP mode of packets
-received on the server port and responds to any packet with the right
-size. This includes responses from another NTP server. An attacker can
-send a packet with a spoofed source address in order to create an
-infinite loop of responses between two busybox NTP servers. Adding
-more packets to the loop increases the traffic between the servers
-until one of them has a fully loaded CPU and/or network.
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=150dc7a2b483b8338a3e185c478b4b23ee884e71]
-CVE: CVE-2016-6301
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
-diff --git a/networking/ntpd.c b/networking/ntpd.c
-index 9732c9b..0f6a55f 100644
---- a/networking/ntpd.c
-+++ b/networking/ntpd.c
-@@ -1985,6 +1985,13 @@ recv_and_process_client_pkt(void /*int fd*/)
- 		goto bail;
- 	}
- 
-+	/* Respond only to client and symmetric active packets */
-+	if ((msg.m_status & MODE_MASK) != MODE_CLIENT
-+	 && (msg.m_status & MODE_MASK) != MODE_SYM_ACT
-+	) {
-+		goto bail;
-+	}
-+
- 	query_status = msg.m_status;
- 	query_xmttime = msg.m_xmttime;
- 
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
index bda8685..6faca22 100644
--- a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
@@ -33,7 +33,7 @@ cc: linux-kbuild@vger.kernel.org
  scripts/kconfig/lxdialog/Makefile          |    2 +-
  scripts/kconfig/lxdialog/check-lxdialog.sh |    8 ++++++++
  2 files changed, 9 insertions(+), 1 deletion(-)
-
+ 
 --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
 +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
 @@ -4,6 +4,10 @@
@@ -44,10 +44,10 @@ cc: linux-kbuild@vger.kernel.org
 +		echo "$CROSS_CURSES_LIB"
 +		exit
 +	fi
- 	for ext in so a dylib ; do
- 		for lib in ncursesw ncurses curses ; do
- 			$cc -print-file-name=lib${lib}.${ext} | grep -q /
-@@ -19,6 +23,10 @@ ldflags()
+ 	pkg-config --libs ncursesw 2>/dev/null && exit
+ 	pkg-config --libs ncurses 2>/dev/null && exit
+ 	for ext in so a dll.a dylib ; do
+@@ -21,6 +25,10 @@
  # Where is ncurses.h?
  ccflags()
  {
@@ -55,12 +55,12 @@ cc: linux-kbuild@vger.kernel.org
 +		echo "$CROSS_CURSES_INC"
 +		exit
 +	fi
- 	if [ -f /usr/include/ncursesw/ncurses.h ]; then
- 		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncurses.h>"'
- 	elif [ -f /usr/include/ncursesw/curses.h ]; then
+ 	if pkg-config --cflags ncursesw 2>/dev/null; then
+ 		echo '-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1'
+ 	elif pkg-config --cflags ncurses 2>/dev/null; then
 --- a/scripts/kconfig/lxdialog/Makefile
 +++ b/scripts/kconfig/lxdialog/Makefile
-@@ -5,7 +5,7 @@ check-lxdialog  := $(srctree)/$(src)/che
+@@ -5,7 +5,7 @@
  
  # Use reursively expanded variables so we do not call gcc unless
  # we really need to do so. (Do not call gcc as part of make mrproper)
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
diff --git a/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch b/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
deleted file mode 100644
index 0c3c9c0..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From f94412f6bb49136694c5478d0aecb19118d1b08d Mon Sep 17 00:00:00 2001
-From: Ming Liu <peter.x.liu@external.atlascopco.com>
-Date: Wed, 31 May 2017 11:48:09 +0200
-Subject: [PATCH] tar: add IF_FEATURE_* checks
-
-A following linking error was observed:
-| ==========
-| archival/lib.a(tar.o): In function `tar_main':
-| archival/tar.c:1168: undefined reference to `unpack_Z_stream'
-| archival/tar.c:1168: undefined reference to `unpack_Z_stream'
-| ld: busybox_unstripped: hidden symbol `unpack_Z_stream' isn't defined
-| ld: final link failed: Bad value
-
-this happened with clang compiler, with the following configs:
-| CONFIG_TAR=y
-| # CONFIG_FEATURE_SEAMLESS_Z is not set
-
-which can be fixed by adding IF_FEATURE_* checks in.
-
-Upstream-Status: Pending [ Sent to busybox upstream on 2017-06-02 ]
-
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
----
- archival/tar.c | 25 +++++++++++++++----------
- 1 file changed, 15 insertions(+), 10 deletions(-)
-
-diff --git a/archival/tar.c b/archival/tar.c
-index b70e00a..7598b71 100644
---- a/archival/tar.c
-+++ b/archival/tar.c
-@@ -1216,21 +1216,26 @@ int tar_main(int argc UNUSED_PARAM, char **argv)
- 		USE_FOR_MMU(IF_DESKTOP(long long) int FAST_FUNC (*xformer)(transformer_state_t *xstate);)
- 		USE_FOR_NOMMU(const char *xformer_prog;)
- 
--		if (opt & OPT_COMPRESS)
--			USE_FOR_MMU(xformer = unpack_Z_stream;)
-+		if (opt & OPT_COMPRESS) {
-+			USE_FOR_MMU(IF_FEATURE_SEAMLESS_Z(xformer = unpack_Z_stream;))
- 			USE_FOR_NOMMU(xformer_prog = "uncompress";)
--		if (opt & OPT_GZIP)
--			USE_FOR_MMU(xformer = unpack_gz_stream;)
-+		}
-+		if (opt & OPT_GZIP) {
-+			USE_FOR_MMU(IF_FEATURE_SEAMLESS_GZ(xformer = unpack_gz_stream;))
- 			USE_FOR_NOMMU(xformer_prog = "gunzip";)
--		if (opt & OPT_BZIP2)
--			USE_FOR_MMU(xformer = unpack_bz2_stream;)
-+		}
-+		if (opt & OPT_BZIP2) {
-+			USE_FOR_MMU(IF_FEATURE_SEAMLESS_BZ2(xformer = unpack_bz2_stream;))
- 			USE_FOR_NOMMU(xformer_prog = "bunzip2";)
--		if (opt & OPT_LZMA)
--			USE_FOR_MMU(xformer = unpack_lzma_stream;)
-+		}
-+		if (opt & OPT_LZMA) {
-+			USE_FOR_MMU(IF_FEATURE_SEAMLESS_LZMA(xformer = unpack_lzma_stream;))
- 			USE_FOR_NOMMU(xformer_prog = "unlzma";)
--		if (opt & OPT_XZ)
--			USE_FOR_MMU(xformer = unpack_xz_stream;)
-+		}
-+		if (opt & OPT_XZ) {
-+			USE_FOR_MMU(IF_FEATURE_SEAMLESS_XZ(xformer = unpack_xz_stream;))
- 			USE_FOR_NOMMU(xformer_prog = "unxz";)
-+		}
- 
- 		fork_transformer_with_sig(tar_handle->src_fd, xformer, xformer_prog);
- 		/* Can't lseek over pipes */
--- 
-2.7.4
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
index 4c9ce3b..582a258 100644
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
@@ -28,24 +28,23 @@ Fixed options -b, -a and -P.
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 ---
- networking/udhcp/dhcpc.c |   29 +++++++++++++++++++++--------
- 1 files changed, 21 insertions(+), 8 deletions(-)
+ networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++------
+ 1 file changed, 21 insertions(+), 8 deletions(-)
 
-Index: busybox-1.20.2/networking/udhcp/dhcpc.c
+Index: busybox-1.27.2/networking/udhcp/dhcpc.c
 ===================================================================
---- busybox-1.20.2.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.20.2/networking/udhcp/dhcpc.c
-@@ -29,6 +29,9 @@
- #include <netpacket/packet.h>
- #include <linux/filter.h>
+--- busybox-1.27.2.orig/networking/udhcp/dhcpc.c
++++ busybox-1.27.2/networking/udhcp/dhcpc.c
+@@ -49,6 +49,8 @@ struct tpacket_auxdata {
+ };
+ #endif
  
 +/* option whether to down the interface when reconfiguring */
 +static int allow_deconfig = 1;
-+
- /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
  
+ /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
  
-@@ -81,8 +84,9 @@ enum {
+@@ -104,8 +106,9 @@ enum {
  	OPT_x = 1 << 18,
  	OPT_f = 1 << 19,
  	OPT_B = 1 << 20,
@@ -56,7 +55,7 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -1040,7 +1044,8 @@ static void perform_renew(void)
+@@ -1110,7 +1113,8 @@ static void perform_renew(void)
  		state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
@@ -66,36 +65,37 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
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
+@@ -1146,7 +1150,8 @@ static void perform_release(uint32_t server_addr, uint32_t requested_ip)
+  * Users requested to be notified in all cases, even if not in one
+  * of the states above.
+  */
+-	udhcp_run_script(NULL, "deconfig");
++	if (allow_deconfig)
++		udhcp_run_script(NULL, "deconfig");
  
-@@ -1215,7 +1221,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+ 	change_listen_mode(LISTEN_NONE);
+ 	state = RELEASED;
+@@ -1298,7 +1303,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  	/* O,x: list; -T,-t,-A take numeric param */
- 	opt_complementary = "O::x::T+:t+:A+" IF_UDHCP_VERBOSE(":vv") ;
+ 	IF_UDHCP_VERBOSE(opt_complementary = "vv";)
  	IF_LONG_OPTS(applet_long_options = udhcpc_longopts;)
--	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fB"
-+	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
+-	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
++	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
  		USE_FOR_MMU("b")
- 		IF_FEATURE_UDHCPC_ARPING("a")
+ 		IF_FEATURE_UDHCPC_ARPING("a::")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1316,6 +1322,9 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1409,6 +1414,10 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  		logmode |= LOGMODE_SYSLOG;
  	}
  
-+	if (opt & OPT_D)
++	if (opt & OPT_D) {
 +		allow_deconfig = 0;
++	}
 +
  	/* Make sure fd 0,1,2 are open */
  	bb_sanitize_stdio();
  	/* Equivalent of doing a fflush after every \n */
-@@ -1330,7 +1339,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1423,7 +1432,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  	srand(monotonic_us());
  
  	state = INIT_SELECTING;
@@ -105,17 +105,17 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1484,7 +1494,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+@@ -1577,7 +1587,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
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
+@@ -1770,7 +1781,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  						send_decline(/*xid,*/ server_addr, packet.yiaddr);
  
  						if (state != REQUESTING)
@@ -125,8 +125,8 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
  						change_listen_mode(LISTEN_RAW);
  						state = INIT_SELECTING;
  						client_config.first_secs = 0; /* make secs field count from 0 */
-@@ -1711,7 +1723,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
- 				bb_info_msg("Received DHCP NAK");
+@@ -1840,7 +1852,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+ 				bb_error_msg("received %s", "DHCP NAK");
  				udhcp_run_script(&packet, "nak");
  				if (state != REQUESTING)
 -					udhcp_run_script(NULL, "deconfig");
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
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index cc68bea..fbb5fd8 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,43 +1,25 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.24.1
-# Tue Oct 31 11:00:00 2015
+# Busybox version: 1.27.2
+# Wed Sep 27 08:56:13 2017
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
 #
 # Busybox Settings
 #
-
-#
-# General Configuration
-#
 # CONFIG_DESKTOP is not set
 # CONFIG_EXTRA_COMPAT is not set
+# CONFIG_FEDORA_COMPAT is not set
 # CONFIG_INCLUDE_SUSv2 is not set
 # CONFIG_USE_PORTABLE_CODE is not set
-CONFIG_PLATFORM_LINUX=y
-CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
-# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
-# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
 CONFIG_SHOW_USAGE=y
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 CONFIG_FEATURE_COMPRESS_USAGE=y
+CONFIG_BUSYBOX=y
 # CONFIG_FEATURE_INSTALLER is not set
 # CONFIG_INSTALL_NO_USR is not set
-# CONFIG_LOCALE_SUPPORT is not set
-# CONFIG_UNICODE_SUPPORT is not set
-# CONFIG_UNICODE_USING_LOCALE is not set
-# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
-CONFIG_SUBST_WCHAR=0
-CONFIG_LAST_SUPPORTED_WCHAR=0
-# CONFIG_UNICODE_COMBINING_WCHARS is not set
-# CONFIG_UNICODE_WIDE_WCHARS is not set
-# CONFIG_UNICODE_BIDI_SUPPORT is not set
-# CONFIG_UNICODE_NEUTRAL_TABLE is not set
-# CONFIG_UNICODE_PRESERVE_BROKEN is not set
 # CONFIG_PAM is not set
-CONFIG_FEATURE_USE_SENDFILE=y
 CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
 # CONFIG_FEATURE_CLEAN_UP is not set
@@ -53,6 +35,7 @@ CONFIG_FEATURE_SUID_CONFIG_QUIET=y
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
 CONFIG_FEATURE_SYSLOG=y
 # CONFIG_FEATURE_HAVE_RPC is not set
+CONFIG_PLATFORM_LINUX=y
 
 #
 # Build Options
@@ -71,17 +54,6 @@ CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
 
 #
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
-# CONFIG_DEBUG_PESSIMIZE is not set
-# CONFIG_UNIT_TEST is not set
-# CONFIG_WERROR is not set
-CONFIG_NO_DEBUG_LIB=y
-# CONFIG_DMALLOC is not set
-# CONFIG_EFENCE is not set
-
-#
 # Installation Options ("make install" behavior)
 #
 CONFIG_INSTALL_APPLET_SYMLINKS=y
@@ -94,16 +66,30 @@ CONFIG_INSTALL_APPLET_SYMLINKS=y
 CONFIG_PREFIX="./_install"
 
 #
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_DEBUG_SANITIZE is not set
+# CONFIG_UNIT_TEST is not set
+# CONFIG_WERROR is not set
+CONFIG_NO_DEBUG_LIB=y
+# CONFIG_DMALLOC is not set
+# CONFIG_EFENCE is not set
+
+#
 # Busybox Library Tuning
 #
-CONFIG_FEATURE_SYSTEMD=y
+# CONFIG_FEATURE_USE_BSS_TAIL is not set
 CONFIG_FEATURE_RTMINMAX=y
+CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
+# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
+# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
 CONFIG_PASSWORD_MINLEN=6
 CONFIG_MD5_SMALL=1
 CONFIG_SHA3_SMALL=1
 CONFIG_FEATURE_FAST_TOP=y
 # CONFIG_FEATURE_ETC_NETWORKS is not set
-CONFIG_FEATURE_USE_TERMIOS=y
 CONFIG_FEATURE_EDITING=y
 CONFIG_FEATURE_EDITING_MAX_LEN=1024
 # CONFIG_FEATURE_EDITING_VI is not set
@@ -115,8 +101,20 @@ CONFIG_FEATURE_TAB_COMPLETION=y
 CONFIG_FEATURE_USERNAME_COMPLETION=y
 CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
 # CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
+# CONFIG_LOCALE_SUPPORT is not set
+# CONFIG_UNICODE_SUPPORT is not set
+# CONFIG_UNICODE_USING_LOCALE is not set
+# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
+CONFIG_SUBST_WCHAR=0
+CONFIG_LAST_SUPPORTED_WCHAR=0
+# CONFIG_UNICODE_COMBINING_WCHARS is not set
+# CONFIG_UNICODE_WIDE_WCHARS is not set
+# CONFIG_UNICODE_BIDI_SUPPORT is not set
+# CONFIG_UNICODE_NEUTRAL_TABLE is not set
+# CONFIG_UNICODE_PRESERVE_BROKEN is not set
 CONFIG_FEATURE_NON_POSIX_CP=y
 # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
+CONFIG_FEATURE_USE_SENDFILE=y
 CONFIG_FEATURE_COPYBUF_KB=4
 CONFIG_FEATURE_SKIP_ROOTFS=y
 CONFIG_MONOTONIC_SYSCALL=y
@@ -140,76 +138,59 @@ CONFIG_FEATURE_SEAMLESS_Z=y
 # CONFIG_FEATURE_AR_CREATE is not set
 # CONFIG_UNCOMPRESS is not set
 CONFIG_GUNZIP=y
+CONFIG_ZCAT=y
+CONFIG_FEATURE_GUNZIP_LONG_OPTIONS=y
 CONFIG_BUNZIP2=y
+CONFIG_BZCAT=y
 # CONFIG_UNLZMA is not set
-# CONFIG_FEATURE_LZMA_FAST is not set
+CONFIG_LZCAT=y
 # CONFIG_LZMA is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
 # CONFIG_UNXZ is not set
+CONFIG_XZCAT=y
 # CONFIG_XZ is not set
 # CONFIG_BZIP2 is not set
+CONFIG_FEATURE_BZIP2_DECOMPRESS=y
 CONFIG_CPIO=y
 # CONFIG_FEATURE_CPIO_O is not set
 # CONFIG_FEATURE_CPIO_P is not set
 # CONFIG_DPKG is not set
 # CONFIG_DPKG_DEB is not set
-# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
 CONFIG_GZIP=y
 # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
 CONFIG_GZIP_FAST=0
 # CONFIG_FEATURE_GZIP_LEVELS is not set
+CONFIG_FEATURE_GZIP_DECOMPRESS=y
 # CONFIG_LZOP is not set
+# CONFIG_UNLZOP is not set
+# CONFIG_LZOPCAT is not set
 # CONFIG_LZOP_COMPR_HIGH is not set
 # CONFIG_RPM is not set
 # CONFIG_RPM2CPIO is not set
 CONFIG_TAR=y
+# CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
 CONFIG_FEATURE_TAR_CREATE=y
 CONFIG_FEATURE_TAR_AUTODETECT=y
 CONFIG_FEATURE_TAR_FROM=y
 CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=y
 # CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
 CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
-# CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
 # CONFIG_FEATURE_TAR_TO_COMMAND is not set
 # CONFIG_FEATURE_TAR_UNAME_GNAME is not set
 CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
 # CONFIG_FEATURE_TAR_SELINUX is not set
 CONFIG_UNZIP=y
+CONFIG_FEATURE_UNZIP_CDF=y
+# CONFIG_FEATURE_UNZIP_BZIP2 is not set
+# CONFIG_FEATURE_UNZIP_LZMA is not set
+# CONFIG_FEATURE_UNZIP_XZ is not set
 
 #
 # Coreutils
 #
 CONFIG_BASENAME=y
 CONFIG_CAT=y
-CONFIG_DATE=y
-# CONFIG_FEATURE_DATE_ISOFMT is not set
-# CONFIG_FEATURE_DATE_NANO is not set
-CONFIG_FEATURE_DATE_COMPAT=y
-CONFIG_DD=y
-CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
-# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
-# CONFIG_FEATURE_DD_IBS_OBS is not set
-# CONFIG_FEATURE_DD_STATUS is not set
-# CONFIG_HOSTID is not set
-CONFIG_ID=y
-CONFIG_GROUPS=y
-CONFIG_SHUF=y
-CONFIG_SYNC=y
-# CONFIG_FEATURE_SYNC_FANCY is not set
-CONFIG_TEST=y
-CONFIG_FEATURE_TEST_64=y
-CONFIG_TOUCH=y
-CONFIG_FEATURE_TOUCH_NODEREF=y
-CONFIG_FEATURE_TOUCH_SUSV3=y
-CONFIG_TR=y
-CONFIG_FEATURE_TR_CLASSES=y
-# CONFIG_FEATURE_TR_EQUIV is not set
-# CONFIG_TRUNCATE is not set
-CONFIG_UNLINK=y
-# CONFIG_BASE64 is not set
-CONFIG_WHO=y
-CONFIG_USERS=y
-# CONFIG_CAL is not set
-# CONFIG_CATV is not set
+# CONFIG_FEATURE_CATV is not set
 CONFIG_CHGRP=y
 CONFIG_CHMOD=y
 CONFIG_CHOWN=y
@@ -220,6 +201,15 @@ CONFIG_CHROOT=y
 CONFIG_CP=y
 # CONFIG_FEATURE_CP_LONG_OPTIONS is not set
 CONFIG_CUT=y
+CONFIG_DATE=y
+# CONFIG_FEATURE_DATE_ISOFMT is not set
+# CONFIG_FEATURE_DATE_NANO is not set
+CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_DD=y
+CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
+# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
+# CONFIG_FEATURE_DD_IBS_OBS is not set
+# CONFIG_FEATURE_DD_STATUS is not set
 CONFIG_DF=y
 # CONFIG_FEATURE_DF_FANCY is not set
 CONFIG_DIRNAME=y
@@ -233,36 +223,57 @@ CONFIG_ENV=y
 CONFIG_FEATURE_ENV_LONG_OPTIONS=y
 # CONFIG_EXPAND is not set
 # CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
+# CONFIG_UNEXPAND is not set
+# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_EXPR=y
 CONFIG_EXPR_MATH_SUPPORT_64=y
+# CONFIG_FACTOR is not set
 CONFIG_FALSE=y
 # CONFIG_FOLD is not set
 # CONFIG_FSYNC is not set
 CONFIG_HEAD=y
 # CONFIG_FEATURE_FANCY_HEAD is not set
+# CONFIG_HOSTID is not set
+CONFIG_ID=y
+CONFIG_GROUPS=y
 # CONFIG_INSTALL is not set
 # CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
+# CONFIG_LINK is not set
 CONFIG_LN=y
 CONFIG_LOGNAME=y
 CONFIG_LS=y
 CONFIG_FEATURE_LS_FILETYPES=y
 CONFIG_FEATURE_LS_FOLLOWLINKS=y
 CONFIG_FEATURE_LS_RECURSIVE=y
+CONFIG_FEATURE_LS_WIDTH=y
 CONFIG_FEATURE_LS_SORTFILES=y
 CONFIG_FEATURE_LS_TIMESTAMPS=y
 CONFIG_FEATURE_LS_USERNAME=y
 CONFIG_FEATURE_LS_COLOR=y
 # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
 CONFIG_MD5SUM=y
+# CONFIG_SHA1SUM is not set
+# CONFIG_SHA256SUM is not set
+# CONFIG_SHA512SUM is not set
+# CONFIG_SHA3SUM is not set
+
+#
+# Common options for md5sum, sha1sum, sha256sum, sha512sum, sha3sum
+#
+CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 CONFIG_MKDIR=y
 CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
 CONFIG_MKFIFO=y
 CONFIG_MKNOD=y
+CONFIG_MKTEMP=y
 CONFIG_MV=y
 # CONFIG_FEATURE_MV_LONG_OPTIONS is not set
 # CONFIG_NICE is not set
+# CONFIG_NL is not set
 CONFIG_NOHUP=y
+CONFIG_NPROC=y
 CONFIG_OD=y
+# CONFIG_PASTE is not set
 # CONFIG_PRINTENV is not set
 CONFIG_PRINTF=y
 CONFIG_PWD=y
@@ -273,10 +284,8 @@ CONFIG_RM=y
 CONFIG_RMDIR=y
 # CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
 CONFIG_SEQ=y
-# CONFIG_SHA1SUM is not set
-# CONFIG_SHA256SUM is not set
-# CONFIG_SHA512SUM is not set
-# CONFIG_SHA3SUM is not set
+# CONFIG_SHRED is not set
+CONFIG_SHUF=y
 CONFIG_SLEEP=y
 CONFIG_FEATURE_FANCY_SLEEP=y
 CONFIG_FEATURE_FLOAT_SLEEP=y
@@ -286,25 +295,43 @@ CONFIG_FEATURE_SORT_BIG=y
 # CONFIG_FEATURE_SPLIT_FANCY is not set
 CONFIG_STAT=y
 CONFIG_FEATURE_STAT_FORMAT=y
+CONFIG_FEATURE_STAT_FILESYSTEM=y
 CONFIG_STTY=y
 # CONFIG_SUM is not set
+CONFIG_SYNC=y
+# CONFIG_FEATURE_SYNC_FANCY is not set
 # CONFIG_TAC is not set
 CONFIG_TAIL=y
 CONFIG_FEATURE_FANCY_TAIL=y
 CONFIG_TEE=y
 # CONFIG_FEATURE_TEE_USE_BLOCK_IO is not set
+CONFIG_TEST=y
+CONFIG_TEST1=y
+CONFIG_TEST2=y
+CONFIG_FEATURE_TEST_64=y
+# CONFIG_TIMEOUT is not set
+CONFIG_TOUCH=y
+CONFIG_FEATURE_TOUCH_NODEREF=y
+CONFIG_FEATURE_TOUCH_SUSV3=y
+CONFIG_TR=y
+CONFIG_FEATURE_TR_CLASSES=y
+# CONFIG_FEATURE_TR_EQUIV is not set
 CONFIG_TRUE=y
+# CONFIG_TRUNCATE is not set
 CONFIG_TTY=y
 CONFIG_UNAME=y
 CONFIG_UNAME_OSNAME="GNU/Linux"
-# CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_UNIQ=y
+CONFIG_UNLINK=y
 CONFIG_USLEEP=y
 # CONFIG_UUDECODE is not set
+# CONFIG_BASE64 is not set
 # CONFIG_UUENCODE is not set
 CONFIG_WC=y
 # CONFIG_FEATURE_WC_LARGE is not set
+CONFIG_WHO=y
+# CONFIG_W is not set
+CONFIG_USERS=y
 CONFIG_WHOAMI=y
 CONFIG_YES=y
 
@@ -319,30 +346,29 @@ CONFIG_FEATURE_VERBOSE=y
 # CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
 
 #
-# Common options for ls, more and telnet
-#
-CONFIG_FEATURE_AUTOWIDTH=y
-
-#
 # Common options for df, du, ls
 #
 CONFIG_FEATURE_HUMAN_READABLE=y
 
 #
-# Common options for md5sum, sha1sum, sha256sum, sha512sum, sha3sum
-#
-CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
-
-#
 # Console Utilities
 #
 CONFIG_CHVT=y
-# CONFIG_FGCONSOLE is not set
 CONFIG_CLEAR=y
 CONFIG_DEALLOCVT=y
 CONFIG_DUMPKMAP=y
+# CONFIG_FGCONSOLE is not set
 # CONFIG_KBD_MODE is not set
 CONFIG_LOADFONT=y
+# CONFIG_SETFONT is not set
+# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
+CONFIG_DEFAULT_SETFONT_DIR=""
+
+#
+# Common options for loadfont and setfont
+#
+# CONFIG_FEATURE_LOADFONT_PSF2 is not set
+# CONFIG_FEATURE_LOADFONT_RAW is not set
 CONFIG_LOADKMAP=y
 CONFIG_OPENVT=y
 CONFIG_RESET=y
@@ -350,30 +376,20 @@ CONFIG_RESET=y
 # CONFIG_FEATURE_RESIZE_PRINT is not set
 CONFIG_SETCONSOLE=y
 # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
-# CONFIG_SETFONT is not set
-# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
-CONFIG_DEFAULT_SETFONT_DIR=""
 # CONFIG_SETKEYCODES is not set
 # CONFIG_SETLOGCONS is not set
 # CONFIG_SHOWKEY is not set
 
 #
-# Common options for loadfont and setfont
-#
-# CONFIG_FEATURE_LOADFONT_PSF2 is not set
-# CONFIG_FEATURE_LOADFONT_RAW is not set
-
-#
 # Debian Utilities
 #
-CONFIG_MKTEMP=y
 # CONFIG_PIPE_PROGRESS is not set
 CONFIG_RUN_PARTS=y
 CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
 # CONFIG_FEATURE_RUN_PARTS_FANCY is not set
 CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_WHICH=y
 
 #
@@ -436,8 +452,8 @@ CONFIG_FEATURE_FIND_REGEX=y
 # CONFIG_FEATURE_FIND_CONTEXT is not set
 # CONFIG_FEATURE_FIND_LINKS is not set
 CONFIG_GREP=y
-CONFIG_FEATURE_GREP_EGREP_ALIAS=y
-CONFIG_FEATURE_GREP_FGREP_ALIAS=y
+CONFIG_EGREP=y
+CONFIG_FGREP=y
 CONFIG_FEATURE_GREP_CONTEXT=y
 CONFIG_XARGS=y
 # CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
@@ -453,40 +469,45 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
 # CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
 # CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
 CONFIG_HALT=y
+CONFIG_POWEROFF=y
+CONFIG_REBOOT=y
 # CONFIG_FEATURE_CALL_TELINIT is not set
 CONFIG_TELINIT_PATH=""
 # CONFIG_INIT is not set
+# CONFIG_LINUXRC is not set
 # CONFIG_FEATURE_USE_INITTAB is not set
 # CONFIG_FEATURE_KILL_REMOVED is not set
 CONFIG_FEATURE_KILL_DELAY=0
 # CONFIG_FEATURE_INIT_SCTTY is not set
 # CONFIG_FEATURE_INIT_SYSLOG is not set
-# CONFIG_FEATURE_EXTRA_QUIET is not set
+# CONFIG_FEATURE_INIT_QUIET is not set
 # CONFIG_FEATURE_INIT_COREDUMPS is not set
-# CONFIG_FEATURE_INITRD is not set
 CONFIG_INIT_TERMINAL_TYPE=""
-CONFIG_MESG=y
-# CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set
+# CONFIG_FEATURE_INIT_MODIFY_CMDLINE is not set
 
 #
 # Login/Password Management Utilities
 #
-# CONFIG_ADD_SHELL is not set
-# CONFIG_REMOVE_SHELL is not set
 # CONFIG_FEATURE_SHADOWPASSWDS is not set
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
+# CONFIG_ADDGROUP is not set
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
 # CONFIG_ADDUSER is not set
 # CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
-# CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
-# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+# CONFIG_CHPASSWD is not set
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
+# CONFIG_CRYPTPW is not set
+# CONFIG_MKPASSWD is not set
 # CONFIG_DELUSER is not set
 # CONFIG_DELGROUP is not set
 # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
@@ -498,12 +519,10 @@ CONFIG_LAST_SYSTEM_ID=999
 # CONFIG_FEATURE_SECURETTY is not set
 # CONFIG_PASSWD is not set
 # CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
-# CONFIG_CRYPTPW is not set
-# CONFIG_CHPASSWD is not set
-CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
 # CONFIG_SU is not set
 # CONFIG_FEATURE_SU_SYSLOG is not set
 # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
+# CONFIG_FEATURE_SU_BLANK_PW_NEEDS_SECURE_TTY is not set
 # CONFIG_SULOGIN is not set
 # CONFIG_VLOCK is not set
 
@@ -518,29 +537,29 @@ CONFIG_FSCK=y
 #
 # Linux Module Utilities
 #
-# CONFIG_MODINFO is not set
 # CONFIG_MODPROBE_SMALL is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
+CONFIG_DEPMOD=y
 CONFIG_INSMOD=y
-CONFIG_RMMOD=y
 CONFIG_LSMOD=y
 # CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
+# CONFIG_MODINFO is not set
 CONFIG_MODPROBE=y
 # CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
-CONFIG_DEPMOD=y
+CONFIG_RMMOD=y
 
 #
 # Options common to multiple modutils
 #
+CONFIG_FEATURE_CMDLINE_MODULE_OPTIONS=y
+# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
 # CONFIG_FEATURE_2_4_MODULES is not set
-# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
 # CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
 # CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
 # CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
 # CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
 # CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
 CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
+# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
 CONFIG_FEATURE_MODUTILS_ALIAS=y
 CONFIG_FEATURE_MODUTILS_SYMBOLS=y
 CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
@@ -549,40 +568,23 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 #
 # Linux System Utilities
 #
-# CONFIG_BLOCKDEV is not set
-# CONFIG_FATATTR is not set
-CONFIG_FSTRIM=y
-# CONFIG_MDEV is not set
-# CONFIG_FEATURE_MDEV_CONF is not set
-# CONFIG_FEATURE_MDEV_RENAME is not set
-# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
-# CONFIG_FEATURE_MDEV_EXEC is not set
-# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
-CONFIG_MOUNT=y
-# CONFIG_FEATURE_MOUNT_FAKE is not set
-# CONFIG_FEATURE_MOUNT_VERBOSE is not set
-# CONFIG_FEATURE_MOUNT_HELPERS is not set
-# CONFIG_FEATURE_MOUNT_LABEL is not set
-# CONFIG_FEATURE_MOUNT_NFS is not set
-# CONFIG_FEATURE_MOUNT_CIFS is not set
-CONFIG_FEATURE_MOUNT_FLAGS=y
-CONFIG_FEATURE_MOUNT_FSTAB=y
-# CONFIG_FEATURE_MOUNT_OTHERTAB is not set
-# CONFIG_REV is not set
-# CONFIG_UEVENT is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
+# CONFIG_BLKDISCARD is not set
 # CONFIG_BLKID is not set
 # CONFIG_FEATURE_BLKID_TYPE is not set
+# CONFIG_BLOCKDEV is not set
+# CONFIG_CAL is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
+# CONFIG_FALLOCATE is not set
+# CONFIG_FATATTR is not set
 CONFIG_FBSET=y
 CONFIG_FEATURE_FBSET_FANCY=y
 CONFIG_FEATURE_FBSET_READMODE=y
-# CONFIG_FDFLUSH is not set
 # CONFIG_FDFORMAT is not set
 CONFIG_FDISK=y
-CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
 CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_AIX_LABEL is not set
 # CONFIG_FEATURE_SGI_LABEL is not set
@@ -592,43 +594,82 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
 # CONFIG_FINDFS is not set
 CONFIG_FLOCK=y
+# CONFIG_FDFLUSH is not set
 # CONFIG_FREERAMDISK is not set
 # CONFIG_FSCK_MINIX is not set
-# CONFIG_MKFS_EXT2 is not set
-# CONFIG_MKFS_MINIX is not set
-# CONFIG_FEATURE_MINIX2 is not set
-# CONFIG_MKFS_REISER is not set
-# CONFIG_MKFS_VFAT is not set
+# CONFIG_FSFREEZE is not set
+CONFIG_FSTRIM=y
 # CONFIG_GETOPT is not set
 # CONFIG_FEATURE_GETOPT_LONG is not set
 CONFIG_HEXDUMP=y
 # CONFIG_FEATURE_HEXDUMP_REVERSE is not set
 # CONFIG_HD is not set
+# CONFIG_XXD is not set
 CONFIG_HWCLOCK=y
 CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
 CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
 # CONFIG_IPCRM is not set
 # CONFIG_IPCS is not set
+# CONFIG_LAST is not set
+# CONFIG_FEATURE_LAST_FANCY is not set
 CONFIG_LOSETUP=y
 # CONFIG_LSPCI is not set
 # CONFIG_LSUSB is not set
+# CONFIG_MDEV is not set
+# CONFIG_FEATURE_MDEV_CONF is not set
+# CONFIG_FEATURE_MDEV_RENAME is not set
+# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
+# CONFIG_FEATURE_MDEV_EXEC is not set
+# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
+CONFIG_MESG=y
+# CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set
+# CONFIG_MKE2FS is not set
+# CONFIG_MKFS_EXT2 is not set
+# CONFIG_MKFS_MINIX is not set
+# CONFIG_FEATURE_MINIX2 is not set
+# CONFIG_MKFS_REISER is not set
+# CONFIG_MKDOSFS is not set
+# CONFIG_MKFS_VFAT is not set
 CONFIG_MKSWAP=y
 # CONFIG_FEATURE_MKSWAP_UUID is not set
 CONFIG_MORE=y
+CONFIG_MOUNT=y
+# CONFIG_FEATURE_MOUNT_FAKE is not set
+# CONFIG_FEATURE_MOUNT_VERBOSE is not set
+# CONFIG_FEATURE_MOUNT_HELPERS is not set
+# CONFIG_FEATURE_MOUNT_LABEL is not set
+# CONFIG_FEATURE_MOUNT_NFS is not set
+# CONFIG_FEATURE_MOUNT_CIFS is not set
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
+# CONFIG_FEATURE_MOUNT_OTHERTAB is not set
+# CONFIG_NSENTER is not set
+# CONFIG_FEATURE_NSENTER_LONG_OPTS is not set
 CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
 # CONFIG_READPROFILE is not set
+CONFIG_RENICE=y
+# CONFIG_REV is not set
 # CONFIG_RTCWAKE is not set
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
 # CONFIG_SETARCH is not set
-CONFIG_SWAPONOFF=y
+# CONFIG_LINUX32 is not set
+# CONFIG_LINUX64 is not set
+# CONFIG_SETPRIV is not set
+CONFIG_SWAPON=y
 CONFIG_FEATURE_SWAPON_DISCARD=y
 CONFIG_FEATURE_SWAPON_PRI=y
+CONFIG_SWAPOFF=y
 CONFIG_SWITCH_ROOT=y
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
+# CONFIG_UEVENT is not set
 CONFIG_UMOUNT=y
 CONFIG_FEATURE_UMOUNT_ALL=y
+# CONFIG_UNSHARE is not set
+# CONFIG_WALL is not set
 
 #
 # Common options for mount/umount
@@ -637,6 +678,7 @@ CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
 # CONFIG_VOLUMEID is not set
+# CONFIG_FEATURE_VOLUMEID_BCACHE is not set
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
 # CONFIG_FEATURE_VOLUMEID_EXFAT is not set
@@ -656,17 +698,33 @@ CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_VOLUMEID_ROMFS is not set
 # CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
 # CONFIG_FEATURE_VOLUMEID_SYSV is not set
+# CONFIG_FEATURE_VOLUMEID_UBIFS is not set
 # CONFIG_FEATURE_VOLUMEID_UDF is not set
 # CONFIG_FEATURE_VOLUMEID_XFS is not set
 
 #
 # Miscellaneous Utilities
 #
+# CONFIG_BEEP is not set
+CONFIG_FEATURE_BEEP_FREQ=0
+CONFIG_FEATURE_BEEP_LENGTH_MS=0
 # CONFIG_CONSPY is not set
 # CONFIG_CROND is not set
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
 CONFIG_FEATURE_CROND_DIR=""
+# CONFIG_DEVFSD is not set
+# CONFIG_DEVFSD_MODLOAD is not set
+# CONFIG_DEVFSD_FG_NP is not set
+# CONFIG_DEVFSD_VERBOSE is not set
+# CONFIG_FEATURE_DEVFS is not set
+# CONFIG_HDPARM is not set
+# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
+# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
+# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
 # CONFIG_I2CGET is not set
 # CONFIG_I2CSET is not set
 # CONFIG_I2CDUMP is not set
@@ -682,19 +740,19 @@ CONFIG_FEATURE_LESS_FLAGS=y
 # CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
 # CONFIG_FEATURE_LESS_DASHCMD is not set
 # CONFIG_FEATURE_LESS_LINENUMS is not set
+# CONFIG_LSSCSI is not set
 # CONFIG_NANDWRITE is not set
 # CONFIG_NANDDUMP is not set
+# CONFIG_PARTPROBE is not set
 CONFIG_RFKILL=y
 # CONFIG_SETSERIAL is not set
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
 # CONFIG_UBIATTACH is not set
 # CONFIG_UBIDETACH is not set
 # CONFIG_UBIMKVOL is not set
 # CONFIG_UBIRMVOL is not set
 # CONFIG_UBIRSVOL is not set
 # CONFIG_UBIUPDATEVOL is not set
-# CONFIG_WALL is not set
+# CONFIG_UBIRENAME is not set
 # CONFIG_ADJTIMEX is not set
 # CONFIG_BBCONFIG is not set
 # CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
@@ -729,7 +787,6 @@ CONFIG_DC=y
 # CONFIG_IONICE is not set
 # CONFIG_INOTIFYD is not set
 # CONFIG_LAST is not set
-# CONFIG_FEATURE_LAST_SMALL is not set
 # CONFIG_FEATURE_LAST_FANCY is not set
 # CONFIG_HDPARM is not set
 # CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
@@ -760,24 +817,6 @@ CONFIG_TIME=y
 #
 # Networking Utilities
 #
-# CONFIG_NAMEIF is not set
-# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
-# CONFIG_NBDCLIENT is not set
-CONFIG_NC=y
-# CONFIG_NC_SERVER is not set
-# CONFIG_NC_EXTRA is not set
-# CONFIG_NC_110_COMPAT is not set
-CONFIG_PING=y
-CONFIG_PING6=y
-CONFIG_FEATURE_FANCY_PING=y
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-CONFIG_FEATURE_WGET_TIMEOUT=y
-# CONFIG_FEATURE_WGET_OPENSSL is not set
-# CONFIG_FEATURE_WGET_SSL_HELPER is not set
-# CONFIG_WHOIS is not set
 CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
@@ -789,15 +828,15 @@ CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_FEATURE_BRCTL_SHOW is not set
 # CONFIG_DNSD is not set
 # CONFIG_ETHER_WAKE is not set
-# CONFIG_FAKEIDENTD is not set
 # CONFIG_FTPD is not set
-# CONFIG_FEATURE_FTP_WRITE is not set
+# CONFIG_FEATURE_FTPD_WRITE is not set
 # CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
-# CONFIG_FEATURE_FTP_AUTHENTICATION is not set
+# CONFIG_FEATURE_FTPD_AUTHENTICATION is not set
 # CONFIG_FTPGET is not set
 # CONFIG_FTPPUT is not set
 # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
 CONFIG_HOSTNAME=y
+CONFIG_DNSDOMAINNAME=y
 # CONFIG_HTTPD is not set
 # CONFIG_FEATURE_HTTPD_RANGES is not set
 # CONFIG_FEATURE_HTTPD_SETUID is not set
@@ -818,11 +857,10 @@ CONFIG_FEATURE_IFCONFIG_HW=y
 # CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
 # CONFIG_IFENSLAVE is not set
 # CONFIG_IFPLUGD is not set
-CONFIG_IFUPDOWN=y
+CONFIG_IFUP=y
+CONFIG_IFDOWN=y
 CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
 CONFIG_FEATURE_IFUPDOWN_IP=y
-CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN=y
-# CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
 CONFIG_FEATURE_IFUPDOWN_IPV4=y
 CONFIG_FEATURE_IFUPDOWN_IPV6=y
 CONFIG_FEATURE_IFUPDOWN_MAPPING=y
@@ -835,22 +873,31 @@ CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP=y
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
 # CONFIG_FEATURE_INETD_RPC is not set
 CONFIG_IP=y
+# CONFIG_IPADDR is not set
+# CONFIG_IPLINK is not set
+# CONFIG_IPROUTE is not set
+# CONFIG_IPTUNNEL is not set
+# CONFIG_IPRULE is not set
+# CONFIG_IPNEIGH is not set
 CONFIG_FEATURE_IP_ADDRESS=y
 CONFIG_FEATURE_IP_LINK=y
 CONFIG_FEATURE_IP_ROUTE=y
 CONFIG_FEATURE_IP_ROUTE_DIR="/etc/iproute2"
 CONFIG_FEATURE_IP_TUNNEL=y
 # CONFIG_FEATURE_IP_RULE is not set
-# CONFIG_FEATURE_IP_SHORT_FORMS is not set
+# CONFIG_FEATURE_IP_NEIGH is not set
 # CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
-# CONFIG_IPADDR is not set
-# CONFIG_IPLINK is not set
-# CONFIG_IPROUTE is not set
-# CONFIG_IPTUNNEL is not set
-# CONFIG_IPRULE is not set
 # CONFIG_IPCALC is not set
-# CONFIG_FEATURE_IPCALC_FANCY is not set
 # CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
+# CONFIG_FEATURE_IPCALC_FANCY is not set
+# CONFIG_FAKEIDENTD is not set
+# CONFIG_NAMEIF is not set
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+# CONFIG_NBDCLIENT is not set
+CONFIG_NC=y
+# CONFIG_NC_SERVER is not set
+# CONFIG_NC_EXTRA is not set
+# CONFIG_NC_110_COMPAT is not set
 CONFIG_NETSTAT=y
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
@@ -858,13 +905,19 @@ CONFIG_NSLOOKUP=y
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
 # CONFIG_FEATURE_NTPD_CONF is not set
+CONFIG_PING=y
+CONFIG_PING6=y
+CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
+# CONFIG_SSL_CLIENT is not set
 # CONFIG_TCPSVD is not set
+# CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
 # CONFIG_FEATURE_TELNET_TTYPE is not set
 CONFIG_FEATURE_TELNET_AUTOLOGIN=y
+CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_TELNETD is not set
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
@@ -879,33 +932,43 @@ CONFIG_FEATURE_TFTP_PUT=y
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
 # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
+CONFIG_TLS=y
 CONFIG_TRACEROUTE=y
 # CONFIG_TRACEROUTE6 is not set
 # CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
-# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
 # CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
 # CONFIG_TUNCTL is not set
 # CONFIG_FEATURE_TUNCTL_UG is not set
+# CONFIG_VCONFIG is not set
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+CONFIG_FEATURE_WGET_TIMEOUT=y
+CONFIG_FEATURE_WGET_HTTPS=y
+# CONFIG_FEATURE_WGET_OPENSSL is not set
+# CONFIG_WHOIS is not set
+# CONFIG_ZCIP is not set
 # CONFIG_UDHCPC6 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
 CONFIG_UDHCPD=y
-# CONFIG_DHCPRELAY is not set
-CONFIG_DUMPLEASES=y
 # CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 # CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
 CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
+CONFIG_DUMPLEASES=y
+# CONFIG_DHCPRELAY is not set
 CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
+CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
-# CONFIG_UDPSVD is not set
-# CONFIG_VCONFIG is not set
-# CONFIG_ZCIP is not set
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
 
 #
 # Print Utilities
@@ -918,26 +981,45 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
 # Mail Utilities
 #
 # CONFIG_MAKEMIME is not set
-CONFIG_FEATURE_MIME_CHARSET=""
 # CONFIG_POPMAILDIR is not set
 # CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
 # CONFIG_REFORMIME is not set
 # CONFIG_FEATURE_REFORMIME_COMPAT is not set
 # CONFIG_SENDMAIL is not set
+CONFIG_FEATURE_MIME_CHARSET=""
 
 #
 # Process Utilities
 #
+CONFIG_FREE=y
+CONFIG_FUSER=y
 # CONFIG_IOSTAT is not set
+CONFIG_KILL=y
+CONFIG_KILLALL=y
+# CONFIG_KILLALL5 is not set
 # CONFIG_LSOF is not set
 # CONFIG_MPSTAT is not set
 # CONFIG_NMETER is not set
+# CONFIG_PGREP is not set
+# CONFIG_PKILL is not set
+CONFIG_PIDOF=y
+# CONFIG_FEATURE_PIDOF_SINGLE is not set
+# CONFIG_FEATURE_PIDOF_OMIT is not set
 # CONFIG_PMAP is not set
 # CONFIG_POWERTOP is not set
+# CONFIG_FEATURE_POWERTOP_INTERACTIVE is not set
+CONFIG_PS=y
+CONFIG_FEATURE_PS_WIDE=y
+CONFIG_FEATURE_PS_LONG=y
+# CONFIG_FEATURE_PS_TIME is not set
+# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
+# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
 # CONFIG_PSTREE is not set
 # CONFIG_PWDX is not set
 # CONFIG_SMEMCAP is not set
+CONFIG_BB_SYSCTL=y
 CONFIG_TOP=y
+# CONFIG_FEATURE_TOP_INTERACTIVE is not set
 CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
 CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
 # CONFIG_FEATURE_TOP_SMP_CPU is not set
@@ -946,84 +1028,69 @@ CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
 # CONFIG_FEATURE_TOPMEM is not set
 CONFIG_UPTIME=y
 # CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
-CONFIG_FREE=y
-CONFIG_FUSER=y
-CONFIG_KILL=y
-CONFIG_KILLALL=y
-# CONFIG_KILLALL5 is not set
-# CONFIG_PGREP is not set
-CONFIG_PIDOF=y
-# CONFIG_FEATURE_PIDOF_SINGLE is not set
-# CONFIG_FEATURE_PIDOF_OMIT is not set
-# CONFIG_PKILL is not set
-CONFIG_PS=y
-CONFIG_FEATURE_PS_WIDE=y
-CONFIG_FEATURE_PS_LONG=y
-# CONFIG_FEATURE_PS_TIME is not set
-# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
-# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
-CONFIG_RENICE=y
-CONFIG_BB_SYSCTL=y
-# CONFIG_FEATURE_SHOW_THREADS is not set
 CONFIG_WATCH=y
+# CONFIG_FEATURE_SHOW_THREADS is not set
 
 #
 # Runit Utilities
 #
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
 # CONFIG_RUNSV is not set
 # CONFIG_RUNSVDIR is not set
 # CONFIG_FEATURE_RUNSVDIR_LOG is not set
 # CONFIG_SV is not set
 CONFIG_SV_DEFAULT_SERVICE_DIR=""
+# CONFIG_SVC is not set
 # CONFIG_SVLOGD is not set
-# CONFIG_CHPST is not set
-# CONFIG_SETUIDGID is not set
-# CONFIG_ENVUIDGID is not set
-# CONFIG_ENVDIR is not set
-# CONFIG_SOFTLIMIT is not set
-
-#
-#  SELinux utilities
-#
 # CONFIG_CHCON is not set
 # CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
 # CONFIG_GETSEBOOL is not set
 # CONFIG_LOAD_POLICY is not set
 # CONFIG_MATCHPATHCON is not set
-# CONFIG_RESTORECON is not set
 # CONFIG_RUNCON is not set
 # CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
 # CONFIG_SELINUXENABLED is not set
+# CONFIG_SESTATUS is not set
 # CONFIG_SETENFORCE is not set
 # CONFIG_SETFILES is not set
 # CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
+# CONFIG_RESTORECON is not set
 # CONFIG_SETSEBOOL is not set
-# CONFIG_SESTATUS is not set
 
 #
 # Shells
 #
+CONFIG_SH_IS_ASH=y
+# CONFIG_SH_IS_HUSH is not set
+# CONFIG_SH_IS_NONE is not set
+# CONFIG_BASH_IS_ASH is not set
+# CONFIG_BASH_IS_HUSH is not set
+CONFIG_BASH_IS_NONE=y
 CONFIG_ASH=y
+CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
+CONFIG_ASH_INTERNAL_GLOB=y
 CONFIG_ASH_BASH_COMPAT=y
-# CONFIG_ASH_IDLE_TIMEOUT is not set
 CONFIG_ASH_JOB_CONTROL=y
 CONFIG_ASH_ALIAS=y
-CONFIG_ASH_GETOPTS=y
-CONFIG_ASH_BUILTIN_ECHO=y
-CONFIG_ASH_BUILTIN_PRINTF=y
-CONFIG_ASH_BUILTIN_TEST=y
-CONFIG_ASH_HELP=y
-CONFIG_ASH_CMDCMD=y
-# CONFIG_ASH_MAIL is not set
-CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
 # CONFIG_ASH_RANDOM_SUPPORT is not set
 CONFIG_ASH_EXPAND_PRMT=y
+# CONFIG_ASH_IDLE_TIMEOUT is not set
+# CONFIG_ASH_MAIL is not set
+CONFIG_ASH_ECHO=y
+CONFIG_ASH_PRINTF=y
+CONFIG_ASH_TEST=y
+CONFIG_ASH_HELP=y
+CONFIG_ASH_GETOPTS=y
+CONFIG_ASH_CMDCMD=y
 # CONFIG_CTTYHACK is not set
 # CONFIG_HUSH is not set
 # CONFIG_HUSH_BASH_COMPAT is not set
 # CONFIG_HUSH_BRACE_EXPANSION is not set
-# CONFIG_HUSH_HELP is not set
 # CONFIG_HUSH_INTERACTIVE is not set
 # CONFIG_HUSH_SAVEHISTORY is not set
 # CONFIG_HUSH_JOB is not set
@@ -1034,17 +1101,30 @@ CONFIG_ASH_EXPAND_PRMT=y
 # CONFIG_HUSH_FUNCTIONS is not set
 # CONFIG_HUSH_LOCAL is not set
 # CONFIG_HUSH_RANDOM_SUPPORT is not set
-# CONFIG_HUSH_EXPORT_N is not set
 # CONFIG_HUSH_MODE_X is not set
+# CONFIG_HUSH_ECHO is not set
+# CONFIG_HUSH_PRINTF is not set
+# CONFIG_HUSH_TEST is not set
+# CONFIG_HUSH_HELP is not set
+# CONFIG_HUSH_EXPORT is not set
+# CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_KILL is not set
+# CONFIG_HUSH_WAIT is not set
+# CONFIG_HUSH_TRAP is not set
+# CONFIG_HUSH_TYPE is not set
+# CONFIG_HUSH_READ is not set
+# CONFIG_HUSH_SET is not set
+# CONFIG_HUSH_UNSET is not set
+# CONFIG_HUSH_ULIMIT is not set
+# CONFIG_HUSH_UMASK is not set
+# CONFIG_HUSH_MEMLEAK is not set
 # CONFIG_MSH is not set
-CONFIG_FEATURE_SH_IS_ASH=y
-# CONFIG_FEATURE_SH_IS_HUSH is not set
-# CONFIG_FEATURE_SH_IS_NONE is not set
-# CONFIG_FEATURE_BASH_IS_ASH is not set
-# CONFIG_FEATURE_BASH_IS_HUSH is not set
-CONFIG_FEATURE_BASH_IS_NONE=y
-CONFIG_SH_MATH_SUPPORT=y
-# CONFIG_SH_MATH_SUPPORT_64 is not set
+
+#
+# Options common to all shells
+#
+CONFIG_FEATURE_SH_MATH=y
+# CONFIG_FEATURE_SH_MATH_64 is not set
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
 # CONFIG_FEATURE_SH_NOFORK is not set
@@ -1053,19 +1133,17 @@ CONFIG_FEATURE_SH_HISTFILESIZE=y
 #
 # System Logging Utilities
 #
+CONFIG_KLOGD=y
+CONFIG_FEATURE_KLOGD_KLOGCTL=y
+CONFIG_LOGGER=y
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
 # CONFIG_SYSLOGD is not set
 # CONFIG_FEATURE_ROTATE_LOGFILE is not set
 # CONFIG_FEATURE_REMOTE_LOG is not set
 # CONFIG_FEATURE_SYSLOGD_DUP is not set
 # CONFIG_FEATURE_SYSLOGD_CFG is not set
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=0
 # CONFIG_FEATURE_IPC_SYSLOG is not set
-# CONFIG_LOGREAD is not set
-# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
 # CONFIG_FEATURE_KMSG_SYSLOG is not set
-CONFIG_KLOGD=y
-
-#
-# klogd should not be used together with syslog to kernel printk buffer
-#
-CONFIG_FEATURE_KLOGD_KLOGCTL=y
-CONFIG_LOGGER=y
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
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
similarity index 57%
rename from meta/recipes-core/busybox/busybox_1.24.1.bb
rename to meta/recipes-core/busybox/busybox_1.27.2.bb
index 1c85808..47b4f48 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -29,10 +29,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://busybox-1.24.1-unzip.patch \
-           file://busybox-1.24.1-unzip-regression.patch \
-           file://busybox-1.24.1-truncate-open-mode.patch \
-           file://0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
@@ -45,24 +41,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcS \
            file://rcK \
            file://runlevel \
-           file://CVE-2016-2148.patch \
-           file://CVE-2016-2147.patch \
-           file://CVE-2016-2147_2.patch \
-           file://CVE-2016-6301.patch \
-           file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
-           file://makefile-fix-backport.patch \
-           file://0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch \
-           file://busybox-kbuild-race-fix-commit-d8e61bb.patch \
-           file://commit-applet_tables-fix-commit-0dddbc1.patch \
            file://makefile-libbb-race.patch \
-           file://0001-libiproute-handle-table-ids-larger-than-255.patch \
-           file://ifupdown-pass-interface-device-name-for-ipv6-route-c.patch \
-           file://BUG9071_buffer_overflow_arp.patch \
-           file://busybox-tar-add-IF_FEATURE_-checks.patch \
-           file://0001-iproute-support-scope-.-Closes-8561.patch \
-           file://0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "be98a40cadf84ce2d6b05fa41a275c6a"
-SRC_URI[tarball.sha256sum] = "37d03132cc078937360b392170b7a1d0e5b322eee9f57c0b82292a8b1f0afe3d"
+SRC_URI[tarball.md5sum] = "476186f4bab81781dab2369bfd42734e"
+SRC_URI[tarball.sha256sum] = "9d4be516b61e6480f156b11eb42577a13529f75d3383850bb75c50c285de63df"
-- 
2.1.4


