Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4BCEED631
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103052.1767267469781857402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cEX3wPqJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EoxTt8x+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b795986c1-0a20fff5-42f1-450b-ae19-cd577b40ce76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267469;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aJv3Gc8R5rH5K4LfX3g7RO6eFesjmn9MjYE1HFJVBfs=;
	b=cEX3wPqJiEEH2orckAFdQkmBKMthl40JEJbVRa8+aWL99IisN8+Y4xzQnat7caRu
	OHjHWl+3DKual/SL7ibcftSMU1EgGATcTdhGmhUm1XZWRzad/pFC7jvyKJjdn0SBIEC
	2UKQZYaemeNJSfRvHW12pldgzTeJmzpZTHrdQcBE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267469;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aJv3Gc8R5rH5K4LfX3g7RO6eFesjmn9MjYE1HFJVBfs=;
	b=EoxTt8x+X9OIJsbUps9adU/s3UV+8VAa+gZ7xt5k3LDfe7nfu4SnuDWaIZqvA607
	2FoIH0eSNrvK+tS/awkPazLUAcYMD7fw6XALoXKuSj81nqch8ePthoI9vvVvjYPadc+
	sRPGA8umJIIz8aBK2SjLaxaMfnCKre7osRB7WpPw=
Content-Type: multipart/mixed; boundary="===============2003643766978664356=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2025.89 SUCCEEDED
Message-ID: <0101019b795986c1-0a20fff5-42f1-450b-ae19-cd577b40ce76-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228759

--===============2003643766978664356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2025.89* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2025.88-2025.89.patch
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
From 1c25b9f7ca00b72087e140bf921add981be114c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 06:31:29 +0000
Subject: [PATCH] dropbear: upgrade 2025.88 -> 2025.89

---
 .../0001-Fix-proxycmd-without-netcat.patch    | 74 -------------------
 ...1-urandom-xauth-changes-to-options.h.patch |  6 +-
 .../dropbear/0005-dropbear-enable-pam.patch   |  8 +-
 .../0006-dropbear-configuration-file.patch    |  2 +-
 ...ropbear_2025.88.bb => dropbear_2025.89.bb} |  3 +-
 5 files changed, 9 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
 rename meta/recipes-core/dropbear/{dropbear_2025.88.bb => dropbear_2025.89.bb} (97%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
deleted file mode 100644
index 967b66322f..0000000000
--- a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 5cc0127000db5f7567b54d0495fb91a8e452fe09 Mon Sep 17 00:00:00 2001
-From: Konstantin Demin <rockdrilla@gmail.com>
-Date: Fri, 9 May 2025 22:39:35 +0300
-Subject: [PATCH] Fix proxycmd without netcat
-
-fixes e5a0ef27c2 "Execute multihop commands directly, no shell"
-
-Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
-
-Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/5cc0127000db5f7567b54d0495fb91a8e452fe09]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/cli-main.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/cli-main.c b/src/cli-main.c
-index 2fafa88..0a052a3 100644
---- a/src/cli-main.c
-+++ b/src/cli-main.c
-@@ -77,7 +77,11 @@ int main(int argc, char ** argv) {
- 	}
- 
- #if DROPBEAR_CLI_PROXYCMD
--	if (cli_opts.proxycmd || cli_opts.proxyexec) {
-+	if (cli_opts.proxycmd
-+#if DROPBEAR_CLI_MULTIHOP
-+		|| cli_opts.proxyexec
-+#endif
-+	) {
- 		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
- 		if (signal(SIGINT, kill_proxy_sighandler) == SIG_ERR ||
- 			signal(SIGTERM, kill_proxy_sighandler) == SIG_ERR ||
-@@ -110,11 +114,13 @@ static void shell_proxy_cmd(const void *user_data_cmd) {
- 	dropbear_exit("Failed to run '%s'\n", cmd);
- }
- 
-+#if DROPBEAR_CLI_MULTIHOP
- static void exec_proxy_cmd(const void *unused) {
- 	(void)unused;
- 	run_command(cli_opts.proxyexec[0], cli_opts.proxyexec, ses.maxfd);
- 	dropbear_exit("Failed to run '%s'\n", cli_opts.proxyexec[0]);
- }
-+#endif
- 
- static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- 	char * cmd_arg = NULL;
-@@ -145,9 +151,11 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- 		cmd_arg = m_malloc(shell_cmdlen);
- 		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
- 		exec_fn = shell_proxy_cmd;
-+#if DROPBEAR_CLI_MULTIHOP
- 	} else {
- 		/* No shell */
- 		exec_fn = exec_proxy_cmd;
-+#endif
- 	}
- 
- 	ret = spawn_command(exec_fn, cmd_arg, sock_out, sock_in, NULL, pid_out);
-@@ -159,6 +167,7 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- cleanup:
- 	m_free(cli_opts.proxycmd);
- 	m_free(cmd_arg);
-+#if DROPBEAR_CLI_MULTIHOP
- 	if (cli_opts.proxyexec) {
- 		char **a = NULL;
- 		for (a = cli_opts.proxyexec; *a; a++) {
-@@ -166,6 +175,7 @@ cleanup:
- 		}
- 		m_free(cli_opts.proxyexec);
- 	}
-+#endif
- }
- 
- static void kill_proxy_sighandler(int UNUSED(signo)) {
diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 0687e5dab1..d041e6e034 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From 490871d41a01004a1940c0780419ecaef857d7c3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 6e970bb..ccc8b47 100644
+index 705da74..f42c170 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -317,7 +317,7 @@ group1 in Dropbear server too */
+@@ -323,7 +323,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 6743f506e9..aee7a8bbea 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From d546af2dbaa38a6b7574e7217f7f926edffbacde Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index ccc8b47..12768d1 100644
+index f42c170..fdb1c6f 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -228,7 +228,7 @@ group1 in Dropbear server too */
+@@ -234,7 +234,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,7 +27,7 @@ index ccc8b47..12768d1 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -236,7 +236,7 @@ group1 in Dropbear server too */
+@@ -242,7 +242,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index 44861088cc..03821cfdde 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From 76ca24ab57bf606dae1cec226842e7205548ba77 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
similarity index 97%
rename from meta/recipes-core/dropbear/dropbear_2025.88.bb
rename to meta/recipes-core/dropbear/dropbear_2025.89.bb
index 72a886d907..957a0901fb 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -19,11 +19,10 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear@.service \
            file://dropbear.socket \
            file://dropbear.default \
-           file://0001-Fix-proxycmd-without-netcat.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"
+SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-- 
2.47.1


--===============2003643766978664356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2025.88 [default] to 2025.89 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGSIZE changed from 1890336 to 1886344 (-0%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PKGV changed from 2025.88 [default] to 2025.89 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PKGV changed from 2025.88 [default] to 2025.89 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PKGV changed from 2025.88 [default] to 2025.89 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: FILELIST: directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/headers -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/headers, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/modes/ctr -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/modes/ctr, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/math -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/math, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/hashes/helper -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/hashes/helper, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/mac/hmac -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/mac/hmac, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/misc -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/hashes/sha2 -> /usr/src/debug/dropbear/2025.89/libtomcrypt/
 src/hashes/sha2, directory renamed /usr/src/debug/dropbear/2025.88/libtommath -> /usr/src/debug/dropbear/2025.89/libtommath, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/ciphers/aes -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/ciphers/aes, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/pk/ecc -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/pk/ecc, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/stream/chacha -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/stream/chacha, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/mac/poly1305 -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/mac/poly1305, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/misc/crypt -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc/crypt, directory renamed /usr/src/debug/dropbear/2025.88/src -> /usr/src/debug/dropbear/2025.89/src, directory renamed /usr/src/debug/dropbear/2025.88/libtomcrypt/src/misc/bas
 e64 -> /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc/base64
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGV changed from 2025.88 [default] to 2025.89 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 1976455 to 1980485 (+0%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2025.88 [default] to 2025.89 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear/dropbear: PKGV changed from 2025.88 [default] to 2025.89 [default]
packages/x86-64-v3-poky-linux/dropbear: PV changed from "2025.88" to "2025.89"
packages/x86-64-v3-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2025.88.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0001-Fix-proxycmd-without-netcat.patch file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2025.89.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear"
packages/x86-64-v3-poky-linux/dropbear: PKGV changed from 2025.88 [default] to 2025.89 [default]

--===============2003643766978664356==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2025.88-2025.89.patch"

RnJvbSAxYzI1YjlmN2NhMDBiNzIwODdlMTQwYmY5MjFhZGQ5ODFiZTExNGM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNjozMToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
b3BiZWFyOiB1cGdyYWRlIDIwMjUuODggLT4gMjAyNS44OQoKLS0tCiAuLi4vMDAwMS1GaXgtcHJv
eHljbWQtd2l0aG91dC1uZXRjYXQucGF0Y2ggICAgfCA3NCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li4xLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2ggfCAgNiArLQogLi4u
L2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCAgIHwgIDggKy0KIC4uLi8w
MDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaCAgICB8ICAyICstCiAuLi5yb3Bi
ZWFyXzIwMjUuODguYmIgPT4gZHJvcGJlYXJfMjAyNS44OS5iYn0gfCAgMyArLQogNSBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDg0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtRml4LXByb3h5Y21k
LXdpdGhvdXQtbmV0Y2F0LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIv
e2Ryb3BiZWFyXzIwMjUuODguYmIgPT4gZHJvcGJlYXJfMjAyNS44OS5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAxLUZpeC1wcm94
eWNtZC13aXRob3V0LW5ldGNhdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyLzAwMDEtRml4LXByb3h5Y21kLXdpdGhvdXQtbmV0Y2F0LnBhdGNoCmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCA5NjdiNjYzMjJmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtRml4LXByb3h5Y21kLXdpdGhvdXQtbmV0
Y2F0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNzQgKzAsMCBAQAotRnJvbSA1Y2MwMTI3MDAw
ZGI1Zjc1NjdiNTRkMDQ5NWZiOTFhOGU0NTJmZTA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogS29uc3RhbnRpbiBEZW1pbiA8cm9ja2RyaWxsYUBnbWFpbC5jb20+Ci1EYXRlOiBGcmks
IDkgTWF5IDIwMjUgMjI6Mzk6MzUgKzAzMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4IHByb3h5Y21k
IHdpdGhvdXQgbmV0Y2F0Ci0KLWZpeGVzIGU1YTBlZjI3YzIgIkV4ZWN1dGUgbXVsdGlob3AgY29t
bWFuZHMgZGlyZWN0bHksIG5vIHNoZWxsIgotCi1TaWduZWQtb2ZmLWJ5OiBLb25zdGFudGluIERl
bWluIDxyb2NrZHJpbGxhQGdtYWlsLmNvbT4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBb
aHR0cHM6Ly9naXRodWIuY29tL21rai9kcm9wYmVhci9jb21taXQvNWNjMDEyNzAwMGRiNWY3NTY3
YjU0ZDA0OTVmYjkxYThlNDUyZmUwOV0KLVNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRl
ci5tYXJrb0BzaWVtZW5zLmNvbT4KLS0tLQotIHNyYy9jbGktbWFpbi5jIHwgMTIgKysrKysrKysr
KystCi0gMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQot
ZGlmZiAtLWdpdCBhL3NyYy9jbGktbWFpbi5jIGIvc3JjL2NsaS1tYWluLmMKLWluZGV4IDJmYWZh
ODguLjBhMDUyYTMgMTAwNjQ0Ci0tLS0gYS9zcmMvY2xpLW1haW4uYwotKysrIGIvc3JjL2NsaS1t
YWluLmMKLUBAIC03Nyw3ICs3NywxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKiBhcmd2
KSB7Ci0gCX0KLSAKLSAjaWYgRFJPUEJFQVJfQ0xJX1BST1hZQ01ECi0tCWlmIChjbGlfb3B0cy5w
cm94eWNtZCB8fCBjbGlfb3B0cy5wcm94eWV4ZWMpIHsKLSsJaWYgKGNsaV9vcHRzLnByb3h5Y21k
Ci0rI2lmIERST1BCRUFSX0NMSV9NVUxUSUhPUAotKwkJfHwgY2xpX29wdHMucHJveHlleGVjCi0r
I2VuZGlmCi0rCSkgewotIAkJY2xpX3Byb3h5X2NtZCgmc29ja19pbiwgJnNvY2tfb3V0LCAmcHJv
eHlfY21kX3BpZCk7Ci0gCQlpZiAoc2lnbmFsKFNJR0lOVCwga2lsbF9wcm94eV9zaWdoYW5kbGVy
KSA9PSBTSUdfRVJSIHx8Ci0gCQkJc2lnbmFsKFNJR1RFUk0sIGtpbGxfcHJveHlfc2lnaGFuZGxl
cikgPT0gU0lHX0VSUiB8fAotQEAgLTExMCwxMSArMTE0LDEzIEBAIHN0YXRpYyB2b2lkIHNoZWxs
X3Byb3h5X2NtZChjb25zdCB2b2lkICp1c2VyX2RhdGFfY21kKSB7Ci0gCWRyb3BiZWFyX2V4aXQo
IkZhaWxlZCB0byBydW4gJyVzJ1xuIiwgY21kKTsKLSB9Ci0gCi0rI2lmIERST1BCRUFSX0NMSV9N
VUxUSUhPUAotIHN0YXRpYyB2b2lkIGV4ZWNfcHJveHlfY21kKGNvbnN0IHZvaWQgKnVudXNlZCkg
ewotIAkodm9pZCl1bnVzZWQ7Ci0gCXJ1bl9jb21tYW5kKGNsaV9vcHRzLnByb3h5ZXhlY1swXSwg
Y2xpX29wdHMucHJveHlleGVjLCBzZXMubWF4ZmQpOwotIAlkcm9wYmVhcl9leGl0KCJGYWlsZWQg
dG8gcnVuICclcydcbiIsIGNsaV9vcHRzLnByb3h5ZXhlY1swXSk7Ci0gfQotKyNlbmRpZgotIAot
IHN0YXRpYyB2b2lkIGNsaV9wcm94eV9jbWQoaW50ICpzb2NrX2luLCBpbnQgKnNvY2tfb3V0LCBw
aWRfdCAqcGlkX291dCkgewotIAljaGFyICogY21kX2FyZyA9IE5VTEw7Ci1AQCAtMTQ1LDkgKzE1
MSwxMSBAQCBzdGF0aWMgdm9pZCBjbGlfcHJveHlfY21kKGludCAqc29ja19pbiwgaW50ICpzb2Nr
X291dCwgcGlkX3QgKnBpZF9vdXQpIHsKLSAJCWNtZF9hcmcgPSBtX21hbGxvYyhzaGVsbF9jbWRs
ZW4pOwotIAkJc25wcmludGYoY21kX2FyZywgc2hlbGxfY21kbGVuLCAiZXhlYyAlcyIsIGNsaV9v
cHRzLnByb3h5Y21kKTsKLSAJCWV4ZWNfZm4gPSBzaGVsbF9wcm94eV9jbWQ7Ci0rI2lmIERST1BC
RUFSX0NMSV9NVUxUSUhPUAotIAl9IGVsc2UgewotIAkJLyogTm8gc2hlbGwgKi8KLSAJCWV4ZWNf
Zm4gPSBleGVjX3Byb3h5X2NtZDsKLSsjZW5kaWYKLSAJfQotIAotIAlyZXQgPSBzcGF3bl9jb21t
YW5kKGV4ZWNfZm4sIGNtZF9hcmcsIHNvY2tfb3V0LCBzb2NrX2luLCBOVUxMLCBwaWRfb3V0KTsK
LUBAIC0xNTksNiArMTY3LDcgQEAgc3RhdGljIHZvaWQgY2xpX3Byb3h5X2NtZChpbnQgKnNvY2tf
aW4sIGludCAqc29ja19vdXQsIHBpZF90ICpwaWRfb3V0KSB7Ci0gY2xlYW51cDoKLSAJbV9mcmVl
KGNsaV9vcHRzLnByb3h5Y21kKTsKLSAJbV9mcmVlKGNtZF9hcmcpOwotKyNpZiBEUk9QQkVBUl9D
TElfTVVMVElIT1AKLSAJaWYgKGNsaV9vcHRzLnByb3h5ZXhlYykgewotIAkJY2hhciAqKmEgPSBO
VUxMOwotIAkJZm9yIChhID0gY2xpX29wdHMucHJveHlleGVjOyAqYTsgYSsrKSB7Ci1AQCAtMTY2
LDYgKzE3NSw3IEBAIGNsZWFudXA6Ci0gCQl9Ci0gCQltX2ZyZWUoY2xpX29wdHMucHJveHlleGVj
KTsKLSAJfQotKyNlbmRpZgotIH0KLSAKLSBzdGF0aWMgdm9pZCBraWxsX3Byb3h5X3NpZ2hhbmRs
ZXIoaW50IFVOVVNFRChzaWdubykpIHsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ry
b3BiZWFyL2Ryb3BiZWFyLzAwMDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtdXJhbmRvbS14
YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaAppbmRleCAwNjg3ZTVkYWIxLi5kMDQxZTZl
MDM0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAx
LXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8t
b3B0aW9ucy5oLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjZGM2YTRhNTdhODZkODExNmE5
MmE1ZDkwNTk5M2U2NWNmNzIzNTU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0OTA4
NzFkNDFhMDEwMDRhMTk0MGMwNzgwNDE5ZWNhZWY4NTdkN2MzIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmRAb3BlbmVkaGFuZC5jb20+CiBEYXRl
OiBXZWQsIDMxIEF1ZyAyMDA1IDEwOjQ1OjQ3ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHVyYW5k
b20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgKQEAgLTksMTAgKzksMTAgQEAgVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2RlZmF1bHRf
b3B0aW9ucy5oIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1pbmRleCA2ZTk3MGJiLi5jY2M4YjQ3
IDEwMDY0NAoraW5kZXggNzA1ZGE3NC4uZjQyYzE3MCAxMDA2NDQKIC0tLSBhL3NyYy9kZWZhdWx0
X29wdGlvbnMuaAogKysrIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1AQCAtMzE3LDcgKzMxNyw3
IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCitAQCAtMzIzLDcgKzMyMyw3IEBA
IGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCiAgCiAgLyogVGhlIGNvbW1hbmQgdG8g
aW52b2tlIGZvciB4YXV0aCB3aGVuIHVzaW5nIFgxMSBmb3J3YXJkaW5nLgogICAqICItcSIgZm9y
IHF1aWV0ICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVh
ci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9w
YmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2gKaW5kZXggNjc0M2Y1
MDZlOS4uYWVlN2E4YmJlYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIv
ZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMjUzY2EwMWYwZmM1MGRiYWViMmZmOGJjZWNlMGMzNDI1NmVi
YTk0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDU0NmFmMmRiYWEzOGE2Yjc1NzRl
NzIxN2Y3ZjkyNmVkZmZiYWNkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEp1c3Np
IEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBEYXRlOiBXZWQsIDIgRGVjIDIw
MTUgMTE6MzY6MDIgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRW5hYmxlIHBhbQpAQCAtMTUsMTAg
KzE1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBp
bnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3NyYy9kZWZhdWx0X29w
dGlvbnMuaAotaW5kZXggY2NjOGI0Ny4uMTI3NjhkMSAxMDA2NDQKK2luZGV4IGY0MmMxNzAuLmZk
YjFjNmYgMTAwNjQ0CiAtLS0gYS9zcmMvZGVmYXVsdF9vcHRpb25zLmgKICsrKyBiL3NyYy9kZWZh
dWx0X29wdGlvbnMuaAotQEAgLTIyOCw3ICsyMjgsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2Vy
dmVyIHRvbyAqLworQEAgLTIzNCw3ICsyMzQsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVy
IHRvbyAqLwogIAogIC8qIEF1dGhlbnRpY2F0aW9uIFR5cGVzIC0gYXQgbGVhc3Qgb25lIHJlcXVp
cmVkLgogICAgIFJGQyBEcmFmdCByZXF1aXJlcyBwdWJrZXkgYXV0aCwgYW5kIHJlY29tbWVuZHMg
cGFzc3dvcmQgKi8KQEAgLTI3LDcgKzI3LDcgQEAgaW5kZXggY2NjOGI0Ny4uMTI3NjhkMSAxMDA2
NDQKICAKICAvKiBOb3RlOiBQQU0gYXV0aCBpcyBxdWl0ZSBzaW1wbGUgYW5kIG9ubHkgd29ya3Mg
Zm9yIFBBTSBtb2R1bGVzIHdoaWNoIGp1c3QgZG8KICAgKiBhIHNpbXBsZSAiTG9naW46ICIgIlBh
c3N3b3JkOiAiICh5b3UgY2FuIGVkaXQgdGhlIHN0cmluZ3MgaW4gc3ZyLWF1dGhwYW0uYykuCi1A
QCAtMjM2LDcgKzIzNiw3IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCitAQCAt
MjQyLDcgKzI0Miw3IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCiAgICogYnV0
IHRoZXJlJ3MgYW4gaW50ZXJmYWNlIHZpYSBhIFBBTSBtb2R1bGUuIEl0IHdvbid0IHdvcmsgZm9y
IG1vcmUgY29tcGxleAogICAqIFBBTSBjaGFsbGVuZ2UvcmVzcG9uc2UuCiAgICogWW91IGNhbid0
IGVuYWJsZSBib3RoIFBBU1NXT1JEIGFuZCBQQU0uICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmls
ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDYtZHJvcGJl
YXItY29uZmlndXJhdGlvbi1maWxlLnBhdGNoCmluZGV4IDQ0ODYxMDg4Y2MuLjAzODIxY2ZkZGUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDYtZHJv
cGJlYXItY29uZmlndXJhdGlvbi1maWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ry
b3BiZWFyL2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxlLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSAxNmIxNDdmOTdmMDkzOGNkZGI1NWVjMWM5MGJjOTE5YzEzZjI2
ZmMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NmNhMjRhYjU3YmY2MDZkYWUxY2Vj
MjI2ODQyZTcyMDU1NDhiYTc3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xp
IFl1IDxNaW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgNiBTZXAgMjAxOCAxNTo1
NDowMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBkcm9wYmVhciBjb25maWd1cmF0aW9uIGZpbGUK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjUuODgu
YmIgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI1Ljg5LmJiCnNpbWls
YXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyXzIwMjUuODguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyXzIwMjUuODkuYmIKaW5kZXggNzJhODg2ZDkwNy4uOTU3YTA5MDFmYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNS44OC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI1Ljg5LmJiCkBAIC0xOSwxMSAr
MTksMTAgQEAgU1JDX1VSSSA9ICJodHRwOi8vbWF0dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3JlbGVh
c2VzL2Ryb3BiZWFyLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vZHJvcGJlYXJA
LnNlcnZpY2UgXAogICAgICAgICAgICBmaWxlOi8vZHJvcGJlYXIuc29ja2V0IFwKICAgICAgICAg
ICAgZmlsZTovL2Ryb3BiZWFyLmRlZmF1bHQgXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgt
cHJveHljbWQtd2l0aG91dC1uZXRjYXQucGF0Y2ggXAogICAgICAgICAgICAke0BiYi51dGlscy5j
b250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBk
KX0gXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ODNmNTBlYTI3YjE3
YzE2ZGE4OTU3OGZhZmRiNmRlY2ZhNDRiYjhmNjU5MGU1Njk4YTRlNGQzNjcyZGM1M2Q0IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjBkMWY3Y2E3MTFjZmMzMzZkYzhhODVlNjcyY2FiOWNmZDgyMjNh
MDJmZTJkYTBhNGE3YWViNThjOWUxMTM2MzQiCiBNSVJST1JTICs9ICJodHRwOi8vbWF0dC51Y2Mu
YXNuLmF1L2Ryb3BiZWFyL3JlbGVhc2VzLyBodHRwczovL2Ryb3BiZWFyLm5sL21pcnJvci9yZWxl
YXNlcy8iCiAKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0u
cGF0Y2ggXAotLSAKMi40Ny4xCgo=

--===============2003643766978664356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-12decb447f428fc7221ca7db8cc75ee6621903d1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:12decb447f428fc7221ca7db8cc75ee6621903d1"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 350 Local 311 Mirrors 0 Missed 39 Current 247 (88% match, 93% complete)
done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 324 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 361 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmu-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 363 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 372 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 378 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 379 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 394 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 396 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 400 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxmu-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 710 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_fetch)
NOTE: Running task 711 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: Running task 720 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_recipe_qa)
NOTE: Running task 723 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_recipe_qa)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmu-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_recipe_qa: Started
NOTE: recipe dropbear-2025.89-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe coreutils-9.9-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 410 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 411 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.9-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 412 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 413 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running task 790 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 791 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe libxmu-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 799 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 423 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 424 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe coreutils-9.9-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 430 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 433 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 441 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 455 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running task 969 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 979 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 984 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_fetch)
NOTE: Running task 987 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_fetch)
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 998 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1013 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe dropbear-2025.89-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1014 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1015 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1016 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 1017 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe dropbear-2025.89-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 466 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1018 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_unpack)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.9-r0: task do_unpack: Succeeded
NOTE: Running task 1019 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1025 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: Running setscene task 471 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1031 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe dropbear-2025.89-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1032 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_patch: Started
NOTE: Running setscene task 472 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1038 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 479 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 480 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 482 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 484 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xauth-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 488 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xauth-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 489 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1047 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1048 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 502 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 506 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xauth-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 508 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 509 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 510 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 513 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 514 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 515 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1070 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1071 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1073 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_patch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 540 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 543 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 548 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1129 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1155 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 553 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package_setscene)
NOTE: Running setscene task 557 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1162 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_deploy_source_date_epoch)
NOTE: Running task 1163 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dropbear-2025.89-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dropbear-2025.89-r0: task do_populate_lic: Started
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_populate_lic: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1174 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1175 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1176 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 560 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1435 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1494 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1507 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1533 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1534 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1566 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1577 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_collect_spdx_deps)
NOTE: Running task 1598 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_collect_spdx_deps)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dropbear-2025.89-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dropbear-2025.89-r0: task do_collect_spdx_deps: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1599 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: Running task 1600 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1601 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe dropbear-2025.89-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1602 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_configure)
NOTE: recipe xauth-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: Running task 1603 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe dropbear-2025.89-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_configure: Started
NOTE: Running task 1604 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package unihash changed to 4584e418afe1ad7d949d41c308268c738148ce81caeb28665400ca83bf114131
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 597 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xauth-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1609 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_compile)
NOTE: recipe xauth-1_1.1.4-r0: task do_compile: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_install)
NOTE: recipe xauth-1_1.1.4-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1611 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe xauth-1_1.1.4-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1612 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_package)
NOTE: Running task 1613 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_populate_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1614 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe xauth-1_1.1.4-r0: task do_package: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_configure: Succeeded
NOTE: Running task 1615 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe dropbear-2025.89-r0: task do_compile: Started
NOTE: Running task 1616 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1617 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1618 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1619 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_packagedata)
NOTE: recipe xauth-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1621 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe dropbear-2025.89-r0: task do_compile: Succeeded
NOTE: Running task 1622 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_install)
NOTE: recipe dropbear-2025.89-r0: task do_install: Started
NOTE: recipe dropbear-2025.89-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_package)
NOTE: Running task 1624 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_populate_sysroot)
NOTE: recipe dropbear-2025.89-r0: task do_populate_sysroot: Started
NOTE: recipe dropbear-2025.89-r0: task do_package: Started
NOTE: recipe dropbear-2025.89-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 6e892ae1d29030ab29dcb32c7ba4e5528d7dcf68b8564784dcd4abbc0318ed3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 597 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe dropbear-2025.89-r0: task do_package: Succeeded
NOTE: Running task 1626 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_packagedata)
NOTE: recipe dropbear-2025.89-r0: task do_packagedata: Started
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Running task 1627 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1628 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe dropbear-2025.89-r0: task do_packagedata: Succeeded
NOTE: Running task 1629 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dropbear/dropbear_2025.89.bb:do_create_spdx)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe dropbear-2025.89-r0: task do_create_spdx: Started
NOTE: recipe dropbear-2025.89-r0: task do_create_spdx: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_packagedata: Failed
NOTE: Running task 1630 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1630 tasks of which 1557 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101063056.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101063056.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xauth/1.1.4/temp/log.do_packagedata.1836764
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: xauth-1_1.1.4-r0 do_packagedata: QA Issue: Package version for package xauth-src went backwards which would break package feeds (from 1:1.1.5-r0 to 1:1.1.4-r0) [version-going-backwards]
ERROR: xauth-1_1.1.4-r0 do_packagedata: QA Issue: Package version for package xauth-dbg went backwards which would break package feeds (from 1:1.1.5-r0 to 1:1.1.4-r0) [version-going-backwards]
ERROR: xauth-1_1.1.4-r0 do_packagedata: QA Issue: Package version for package xauth-staticdev went backwards which would break package feeds (from 1:1.1.5-r0 to 1:1.1.4-r0) [version-going-backwards]
ERROR: xauth-1_1.1.4-r0 do_packagedata: QA Issue: Package version for package xauth-dev went backwards which would break package feeds (from 1:1.1.5-r0 to 1:1.1.4-r0) [version-going-backwards]
ERROR: xauth-1_1.1.4-r0 do_packagedata: QA Issue: Package version for package xauth-doc went backwards which would break package feeds (from 1:1.1.5-r0 to 1:1.1.4-r0) [version-going-backwards]
ERROR: xauth-1_1.1.4-r0 do_packagedata: QA Issue: Package version for package xauth-locale went backwards which would break package feeds (from 1:1.1.5-r0 to 1:1.1.4-r0) [version-going-backwards]
ERROR: xauth-1_1.1.4-r0 do_packagedata: QA Issue: Package version for package xauth went backwards which would break package feeds (from 1:1.1.5-r0 to 1:1.1.4-r0) [version-going-backwards]
ERROR: xauth-1_1.1.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xauth/1.1.4/temp/log.do_packagedata.1836764
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_packagedata) failed with exit code '1'

--===============2003643766978664356==--

