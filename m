Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFC6CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 10:37:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.98214.1755081427162089467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 03:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0320f648ca=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57D503gf2718145;
	Wed, 13 Aug 2025 10:37:05 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ggw0rbxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Aug 2025 10:37:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 03:37:07 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 03:37:04 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Peter Marko <peter.marko@siemens.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] dropbear: upgrade 2024.86 -> dropbear_2025.88
Date: Wed, 13 Aug 2025 16:05:56 +0530
Message-ID: <20250813103556.3543733-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fEeprfopmapmEtzLDqnVlCJWQ4BywUXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDEwMyBTYWx0ZWRfX/vMsuOHwt5xF
 Jj3uSsUn7y1lHu+Nl5UrNXtNtfR3NEg2ryUFtGoCgNTJgLvJO/AGmKPrYguaI8nB5wFpF1VAi4s
 xbRwa1ms8lHpK3F9MJzjvDlraPFNtQ7jRsg3NPaTNOm/jytz3OZ84t4GuH9acbUZOd0n351BUir
 Nm7WfcMicoOy8bb/3Q+HvyjbMMqE1iLtZvOeQjR3+5tATzNv5TDnKWA91dzYOEDXkI/JbFrrrjl
 PtCF+fYDYiXUNuas63ieR0I+0S0UmLwjB8n7GVQeO3PXDLHZsOa0TKCMn1vq2cNYENUskMcd5QB
 6G+I6Kswtf0FsRfmCkPNMKQt+En/spsPCuBNg2Qi8onHfCyamL17qsRwtfVTdA=
X-Authority-Analysis: v=2.4 cv=fN453Yae c=1 sm=1 tr=0 ts=689c6ad1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=QAr7KCQdAAAA:8 a=WMJoOJhzAAAA:8
 a=a_U1oVfrAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=-xrui9ZpQ74zOp0NiVsA:9 a=o1nzlHeVWIFGghYxBgEy:22
 a=zX4Iza6CupQELO8hx3qo:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fEeprfopmapmEtzLDqnVlCJWQ4BywUXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 10:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221803

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-47203

SHA1 algorithms were removed by default, so patch for disabling it was
removed together with its package option. Doing it with conditional
patch was anyway a bad design. If someone still needs it, it should be
done via sed command on the config file.

Refreshed remaining patches.

Added patch to fix regression of the CVE fix.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c01205e7a4816d78e99d01f86a396ab23d9bde34)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../0001-Fix-proxycmd-without-netcat.patch    | 74 +++++++++++++++++++
 ...1-urandom-xauth-changes-to-options.h.patch |  2 +-
 .../dropbear-disable-weak-ciphers.patch       | 28 -------
 ...ropbear_2024.86.bb => dropbear_2025.88.bb} |  8 +-
 4 files changed, 79 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
 rename meta/recipes-core/dropbear/{dropbear_2024.86.bb => dropbear_2025.88.bb} (93%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
new file mode 100644
index 00000000000..3e230b80a15
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
@@ -0,0 +1,74 @@
+From 5cc0127000db5f7567b54d0495fb91a8e452fe09 Mon Sep 17 00:00:00 2001
+From: Konstantin Demin <rockdrilla@gmail.com>
+Date: Fri, 9 May 2025 22:39:35 +0300
+Subject: [PATCH] Fix proxycmd without netcat
+
+fixes e5a0ef27c2 "Execute multihop commands directly, no shell"
+
+Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/5cc0127000db5f7567b54d0495fb91a8e452fe09]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/cli-main.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/cli-main.c b/src/cli-main.c
+index 2fafa88..0a052a3 100644
+--- a/src/cli-main.c
++++ b/src/cli-main.c
+@@ -77,7 +77,11 @@ int main(int argc, char ** argv) {
+	}
+
+ #if DROPBEAR_CLI_PROXYCMD
+-	if (cli_opts.proxycmd || cli_opts.proxyexec) {
++	if (cli_opts.proxycmd
++#if DROPBEAR_CLI_MULTIHOP
++		|| cli_opts.proxyexec
++#endif
++	) {
+		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
+		if (signal(SIGINT, kill_proxy_sighandler) == SIG_ERR ||
+			signal(SIGTERM, kill_proxy_sighandler) == SIG_ERR ||
+@@ -110,11 +114,13 @@ static void shell_proxy_cmd(const void *user_data_cmd) {
+	dropbear_exit("Failed to run '%s'\n", cmd);
+ }
+
++#if DROPBEAR_CLI_MULTIHOP
+ static void exec_proxy_cmd(const void *unused) {
+	(void)unused;
+	run_command(cli_opts.proxyexec[0], cli_opts.proxyexec, ses.maxfd);
+	dropbear_exit("Failed to run '%s'\n", cli_opts.proxyexec[0]);
+ }
++#endif
+
+ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
+	char * cmd_arg = NULL;
+@@ -145,9 +151,11 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
+		cmd_arg = m_malloc(shell_cmdlen);
+		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
+		exec_fn = shell_proxy_cmd;
++#if DROPBEAR_CLI_MULTIHOP
+	} else {
+		/* No shell */
+		exec_fn = exec_proxy_cmd;
++#endif
+	}
+
+	ret = spawn_command(exec_fn, cmd_arg, sock_out, sock_in, NULL, pid_out);
+@@ -159,6 +167,7 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
+ cleanup:
+	m_free(cli_opts.proxycmd);
+	m_free(cmd_arg);
++#if DROPBEAR_CLI_MULTIHOP
+	if (cli_opts.proxyexec) {
+		char **a = NULL;
+		for (a = cli_opts.proxyexec; *a; a++) {
+@@ -166,6 +175,7 @@ cleanup:
+		}
+		m_free(cli_opts.proxyexec);
+	}
++#endif
+ }
+
+ static void kill_proxy_sighandler(int UNUSED(signo)) {
diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 9c1dd3f6061..0687e5dab1f 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -12,7 +12,7 @@ diff --git a/src/default_options.h b/src/default_options.h
 index 6e970bb..ccc8b47 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -311,7 +311,7 @@ group1 in Dropbear server too */
+@@ -317,7 +317,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
deleted file mode 100644
index a20781d31df..00000000000
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c8a0c8e87b772576f3a431c3b4cacaf5aa001dcc Mon Sep 17 00:00:00 2001
-From: Joseph Reynolds <joseph.reynolds1@ibm.com>
-Date: Thu, 20 Jun 2019 16:29:15 -0500
-Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
-
-This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers
-in the dropbear ssh server and client since they're considered weak ciphers
-and we want to support the stong algorithms.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
----
- src/default_options.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/default_options.h b/src/default_options.h
-index 12768d1..2b07497 100644
---- a/src/default_options.h
-+++ b/src/default_options.h
-@@ -197,7 +197,7 @@ IMPORTANT: Some options will require "make clean" after changes */
-  * Small systems should generally include either curve25519 or ecdh for performance.
-  * curve25519 is less widely supported but is faster
-  */
--#define DROPBEAR_DH_GROUP14_SHA1 1
-+#define DROPBEAR_DH_GROUP14_SHA1 0
- #define DROPBEAR_DH_GROUP14_SHA256 1
- #define DROPBEAR_DH_GROUP16 0
- #define DROPBEAR_CURVE25519 1
diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
similarity index 93%
rename from meta/recipes-core/dropbear/dropbear_2024.86.bb
rename to meta/recipes-core/dropbear/dropbear_2025.88.bb
index be246a0ccd5..f203763b173 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -19,11 +19,12 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear@.service \
            file://dropbear.socket \
            file://dropbear.default \
+           file://0001-Fix-proxycmd-without-netcat.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
+SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"
+MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
@@ -47,10 +48,9 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
-PACKAGECONFIG ?= "disable-weak-ciphers ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
-PACKAGECONFIG[disable-weak-ciphers] = ""
 PACKAGECONFIG[enable-x11-forwarding] = ""
 
 # This option appends to CFLAGS and LDFLAGS from OE
-- 
2.40.0


