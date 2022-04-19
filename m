Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDF1C35295
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.2659.1650364297532376256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 03:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t7dy4gu9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650364295; i=@fujitsu.com;
	bh=/7K8ZMK7qtfLOErTaSFUdmvMAlHk0XJ2woONmnV11kQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=t7dy4gu9Sh/MmHqCk6z0VdpDWF7yfCmeLTMzCaWqtzVKAIu3hNbb2n5iPGAAkZBcS
	 XKNqLeJDio1fKnUpWJqwPn5DeuholQW9JfqFdUFzXzQZkbLvYDAtwPK8Dz8eazsYFR
	 y4NILdbtzL3p3Tq4ROHuPqqKfaQc+WADItb9RAm4J7S8u4pbII5VrZMuXNS8s00MrQ
	 cyunbZlUyicJH8Y7aB8Y4jkDq3JSdVygefAhTQ0jq+sz+ZFYgPbiafqTBSbozyabf2
	 ycMW/q/TOvOJiWw0JstcE6W6oZK/i0ntg8quBGEaCyaP6PB+xqZ1a6ea8suLVqh3yd
	 0R9P6aoi73//A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqNvWH5d
  kcOSbtcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHs4T6mgsl6Fav6T7M2MG7X6GLk4hASeMwo
  8XL5KyYI5zyTxOOr61kgnD2MEpt/LGfsYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAXuJ7SfPM4PYLAKqEtO/L2QFsXkFnCT2bnwINkZCQEFiysP3zBBxQYmTM5+wQMyRkD
  j44gUzRI2ixOzLzSwQdoXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMVklFmekZJbmJmTm
  6hgYGuoaGprpA0shYL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMChTihmq
  dzD+7/2pd4hRkoNJSZS3PiouSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb2gnUE6wKDU9tSItM
  wcYITBpCQ4eJRHeR11Aad7igsTc4sx0iNQpRkUpcV6xFqCEAEgiozQPrg0WlZcYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfMe7AWawpOZVwI3/RXQYiagxdVTYkEWlyQipKQamJLOz5N8lRx
  5bvI8gxvM+jy6v05Pa/HZGDPzrtDdnbPPCjwpY65YuJG388nRxQVi+usltFlnmKl+yxZoaZhZ
  HRPpdsHk+Gv+VVquja1Pzm625bvmK8K4+8DthEciv9qaVqir37uQopGwJtuXJ0dqRkpz3qSPn
  jf2PIxesG/zq5ivDit5cn3df2+8+V/u5/NSxQRxzWs3XHKich2bPuy4uCMtM3eWLhvPVQae0K
  XXGieeWTPtc/7VdNYsCWGBAAbd9VPLVkzw+LbHfNHWZasYW+tCHLRla76yXJ8kL73vS2Zxg8+
  X4K4pR4Q+WhlNtZ8tf8y4dM3Klnxu9//qabzTdawdXt6Yu6CvQsfNKXITrxJLcUaioRZzUXEi
  AMhXHJ5FAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1650364294!272277!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4364 invoked from network); 19 Apr 2022 10:31:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:31:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 44994100195
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:31:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 333B510018E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:31:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:31:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dropbear: upgrade 2020.81 -> 2022.82
Date: Tue, 19 Apr 2022 18:31:18 +0800
Message-ID: <1650364280-23104-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164620

refresh the following patches for new version:
0001-urandom-xauth-changes-to-options.h.patch
0005-dropbear-enable-pam.patch
dropbear-disable-weak-ciphers.patch

Changelog:
https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2022.82

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-urandom-xauth-changes-to-options.h.patch |  8 ++++----
 .../dropbear/0005-dropbear-enable-pam.patch   | 13 ++++++------
 .../dropbear-disable-weak-ciphers.patch       | 20 ++++++++-----------
 .../recipes-core/dropbear/dropbear_2020.81.bb |  3 ---
 .../recipes-core/dropbear/dropbear_2022.82.bb |  3 +++
 5 files changed, 21 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2020.81.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2022.82.bb

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 684641dcbd..99adcfd770 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -6,10 +6,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/default_options.h b/default_options.h
-index 3b75eb8..1fd8082 100644
+index 349338c..5ffac25 100644
 --- a/default_options.h
 +++ b/default_options.h
-@@ -243,7 +243,7 @@ Homedir is prepended unless path begins with / */
+@@ -289,7 +289,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
@@ -17,7 +17,7 @@ index 3b75eb8..1fd8082 100644
 +#define XAUTH_COMMAND "xauth -q"
  
  
- /* if you want to enable running an sftp server (such as the one included with
+ /* If you want to enable running an sftp server (such as the one included with
 -- 
-1.7.11.7
+2.25.1
 
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 857681520c..32c3ea5f08 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/default_options.h b/default_options.h
-index 3b75eb8..8617cd0 100644
+index 0e3d027..349338c 100644
 --- a/default_options.h
 +++ b/default_options.h
-@@ -179,7 +179,7 @@ group1 in Dropbear server too */
+@@ -210,7 +210,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,16 +27,15 @@ index 3b75eb8..8617cd0 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -187,7 +187,7 @@ group1 in Dropbear server too */
+@@ -218,7 +218,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
 -#define DROPBEAR_SVR_PAM_AUTH 0
 +#define DROPBEAR_SVR_PAM_AUTH 1
  
- /* ~/.ssh/authorized_keys authentication */
- #define DROPBEAR_SVR_PUBKEY_AUTH 1
- 
+ /* ~/.ssh/authorized_keys authentication.
+  * You must define DROPBEAR_SVR_PUBKEY_AUTH in order to use plugins. */
 -- 
-2.1.4
+2.25.1
 
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
index b54581f17a..5c60868ed8 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -9,27 +9,23 @@ and we want to support the stong algorithms.
 
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
-
 ---
- default_options.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ default_options.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/default_options.h b/default_options.h
-index 1aa2297..7ff1394 100644
+index d417588..bc5200f 100644
 --- a/default_options.h
 +++ b/default_options.h
-@@ -163,12 +163,12 @@ IMPORTANT: Some options will require "make clean" after changes */
+@@ -180,7 +180,7 @@ IMPORTANT: Some options will require "make clean" after changes */
   * Small systems should generally include either curve25519 or ecdh for performance.
   * curve25519 is less widely supported but is faster
-  */ 
+  */
 -#define DROPBEAR_DH_GROUP14_SHA1 1
 +#define DROPBEAR_DH_GROUP14_SHA1 0
  #define DROPBEAR_DH_GROUP14_SHA256 1
  #define DROPBEAR_DH_GROUP16 0
  #define DROPBEAR_CURVE25519 1
- #define DROPBEAR_ECDH 1
--#define DROPBEAR_DH_GROUP1 1
-+#define DROPBEAR_DH_GROUP1 0
- 
- /* When group1 is enabled it will only be allowed by Dropbear client
- not as a server, due to concerns over its strength. Set to 0 to allow
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/dropbear/dropbear_2020.81.bb b/meta/recipes-core/dropbear/dropbear_2020.81.bb
deleted file mode 100644
index c7edea84f8..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2020.81.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require dropbear.inc
-
-SRC_URI[sha256sum] = "48235d10b37775dbda59341ac0c4b239b82ad6318c31568b985730c788aac53b"
diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.82.bb
new file mode 100644
index 0000000000..154a407a19
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
@@ -0,0 +1,3 @@
+require dropbear.inc
+
+SRC_URI[sha256sum] = "3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1"
-- 
2.25.1


