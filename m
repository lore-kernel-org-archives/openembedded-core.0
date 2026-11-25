Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36412.1795585636581950781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Rk2eV5eD;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10025; q=dns/txt;
  s=iport01; t=1795585636; x=1796795236;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bxG+FXnagDfdKuJnjhJSZNaTyMqjLBnj2UIXnS0Ti4E=;
  b=Rk2eV5eDvjHQ7TznQpUWAoVU5TR5QNY7VYOF9J5ECcw9X0KUShQXlG2U
   T96kPuVNTfzZA1+Uit5Y0U2eon5mkK8IA3hfc+0yf/9YeAcDW4nmyRLhf
   QfmwcBPFXNnvMVtcjVHxSQydGEnzpgdXBACKPB4ouWB1claxUGt9dofIl
   ZCWSvli4PCyz5i3rIYx8fJJZDYe+9wJXx9dLEsphp4GGrA8Bdq8yPKTHI
   iPUIqq4YABiu85GFVDjYf6LJjG12Sy4YUB5dzDOeU098Wn5FJQKRnylTa
   G4Rr4ubW+UIhf/PbtkGCcnX7gzxHDyjjow+i1uA13Qs4vEJLDG3WPO+ZA
   A==;
X-CSE-ConnectionGUID: DY9h3lGWRVqgjxIhWYc/fg==
X-CSE-MsgGUID: YzhCvopNQHy/aUf89422Kw==
X-IPAS-Result: =?us-ascii?q?A0BJAgD8dAZr/9NK/pBaglmCV3VgQ0kDlCeCIQOeKRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQDEblwgXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVg2qBBYFcAgOBRIZfB?=
 =?us-ascii?q?IINFXoSgVQegwSJcQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F?=
 =?us-ascii?q?4EHGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOA?=
 =?us-ascii?q?ikGFiELNBgNSBEsNxUZBD5uB5QTgmU2UAo0ASsgggwKBQ2jOIIhoREKKIN5j?=
 =?us-ascii?q?CSVOhozqnILmH2OCpU3TU2EaoFoPIFZcBWDIglKGQ+OLgsLg2CFE8lIJjILA?=
 =?us-ascii?q?y8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:/0SQYK7bdKw1pC/6rte6tgxRtG3GchMFZxGqfqrLsTDasY5as4F+v
 mEXDWmEO6yOM2DxeIwiYdyy80ICuJXXytFhHARorH83Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEbxJ+r1zLl50y
 +UXKiAsbi+yjKW4z+fuIgVsrpxLwMjDNY4F/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkQn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCzaIOFKofVG625mG6pt
 GLt4WPhJCg6JZuW9DTVoy723MzQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:29iHva/r1qvlu2VTGGZuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:a/iTrG+hsUGlHThTxbCVv2IlS8B+dlLi9knJLE2oKGZWebbSR1DFrQ==
X-Talos-MUID: 9a23:Ho9jRAZx7KMX8+BThi3sry9lLOFRw7XpAX0DwcRa4ZOnKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60188376"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 62C27180001D1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id A6500CBEFBF; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 10/10] openssh: Fix CVE-2026-106553 and CVE-2026-106555
Date: Tue, 24 Nov 2026 21:47:11 -0800
Message-Id: <20261125054711.2691239-11-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251142
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the shared upstream fixes referenced in [4] and
[5], using the commits shown in [1], [2], and [3].

[1] https://github.com/openssh/openssh-portable/commit/670510d1e190b0f4e47066f24498c04ada1da0f0
[2] https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d7778cfb047faaed1679e8b7
[3] https://github.com/openssh/openssh-portable/commit/d549f99da344c178c5f632a62a6aa60544d7236e
[4] https://ubuntu.com/security/CVE-2026-106553
[5] https://ubuntu.com/security/CVE-2026-106555

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-106553_CVE-2026-106555_p1.patch  | 100 ++++++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p2.patch  |  80 ++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p3.patch  |  42 ++++++++
 .../openssh/openssh_10.3p1.bb                 |   3 +
 4 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
new file mode 100644
index 0000000000..b27d31d3c9
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
@@ -0,0 +1,100 @@
+From 670510d1e190b0f4e47066f24498c04ada1da0f0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:37:07 +0000
+Subject: [PATCH] upstream: Reset GSSAPI client state before authentication
+
+Avoids situation where a partially-completed GSSAPI authentication attempt
+can retain state that is subsequently used by a later attempt.
+
+Report and feedback Moritz Theile, also reported by several others.
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 95758f23e358b7c19e6205ac1c979193a9145556
+
+CVE: CVE-2026-106553 CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/670510d1e190b0f4e47066f24498c04ada1da0f0]
+
+Backport Changes:
+- Omit upstream OpenBSD revision-only hunks.
+
+(cherry picked from commit 670510d1e190b0f4e47066f24498c04ada1da0f0)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ auth2.c    |  1 +
+ gss-serv.c | 19 ++++++++++++-------
+ monitor.c  |  2 ++
+ ssh-gss.h  |  1 +
+ 4 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/auth2.c b/auth2.c
+--- a/auth2.c
++++ b/auth2.c
+@@ -338,3 +338,4 @@ input_userauth_request(int type, uint32_t seq, struct ssh *ssh)
+ #ifdef GSSAPI
++	ssh_gssapi_cleanup_global_client();
+ 	/* XXX move to auth2_gssapi_stop() */
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+diff --git a/gss-serv.c b/gss-serv.c
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -361,12 +361,21 @@ ssh_gssapi_do_child(char ***envp, u_int *envsizep)
+ 	}
+ }
+ 
++void
++ssh_gssapi_cleanup_global_client()
++{
++	OM_uint32 lmin;
++
++	gss_release_buffer(&lmin, &gssapi_client.displayname);
++	gss_release_buffer(&lmin, &gssapi_client.exportedname);
++	gss_release_cred(&lmin, &gssapi_client.creds);
++	explicit_bzero(&gssapi_client, sizeof(ssh_gssapi_client));
++}
++
+ /* Privileged */
+ int
+ ssh_gssapi_userok(char *user)
+ {
+-	OM_uint32 lmin;
+-
+ 	if (gssapi_client.exportedname.length == 0 ||
+ 	    gssapi_client.exportedname.value == NULL) {
+ 		debug("No suitable client data");
+@@ -377,11 +386,7 @@ ssh_gssapi_userok(char *user)
+ 			return 1;
+ 		else {
+ 			/* Destroy delegated credentials if userok fails */
+-			gss_release_buffer(&lmin, &gssapi_client.displayname);
+-			gss_release_buffer(&lmin, &gssapi_client.exportedname);
+-			gss_release_cred(&lmin, &gssapi_client.creds);
+-			explicit_bzero(&gssapi_client,
+-			    sizeof(ssh_gssapi_client));
++			ssh_gssapi_cleanup_global_client();
+ 			return 0;
+ 		}
+ 	else
+diff --git a/monitor.c b/monitor.c
+--- a/monitor.c
++++ b/monitor.c
+@@ -1990,6 +1990,8 @@ mm_answer_gss_setup_ctx(struct ssh *ssh, int sock, struct sshbuf *m)
+ 	if (!options.gss_authentication)
+ 		fatal_f("GSSAPI authentication not enabled");
+ 
++	ssh_gssapi_cleanup_global_client();
++
+ 	if ((r = sshbuf_get_string(m, &p, &len)) != 0)
+ 		fatal_fr(r, "parse");
+ 	goid.elements = p;
+diff --git a/ssh-gss.h b/ssh-gss.h
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -132,4 +132,5 @@ void ssh_gssapi_cleanup_creds(void);
+ void ssh_gssapi_storecreds(void);
+ const char *ssh_gssapi_displayname(void);
++void ssh_gssapi_cleanup_global_client();
+ 
+ #endif /* GSSAPI */
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
new file mode 100644
index 0000000000..02b7d7661a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
@@ -0,0 +1,80 @@
+From 6f9cd19af05aa828d7778cfb047faaed1679e8b7 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:37:52 +0000
+Subject: [PATCH] upstream: Only store GSSAPI creds when authn succeeds
+
+Issue report and patch from Moritz Theile
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 812bbd22b8dd5a1583094ab2b6ff0045e4088467
+
+CVE: CVE-2026-106553 CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d7778cfb047faaed1679e8b7]
+
+Backport Changes:
+- Omit upstream OpenBSD revision-only hunks.
+
+(cherry picked from commit 6f9cd19af05aa828d7778cfb047faaed1679e8b7)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ gss-serv.c | 13 ++++++++++---
+ ssh-gss.h  |  1 +
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/gss-serv.c b/gss-serv.c
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -52,7 +52,7 @@ extern ServerOptions options;
+ 
+ static ssh_gssapi_client gssapi_client =
+     { GSS_C_EMPTY_BUFFER, GSS_C_EMPTY_BUFFER,
+-    GSS_C_NO_CREDENTIAL, NULL, {NULL, NULL, NULL, NULL}};
++    GSS_C_NO_CREDENTIAL, NULL, {NULL, NULL, NULL, NULL}, 0};
+ 
+ ssh_gssapi_mech gssapi_null_mech =
+     { NULL, NULL, {0, NULL}, NULL, NULL, NULL, NULL};
+@@ -281,6 +281,7 @@ ssh_gssapi_getclient(Gssctxt *ctx, ssh_gssapi_client *client)
+ 
+ 	gss_buffer_desc ename;
+ 
++	client->userok = 0;
+ 	client->mech = NULL;
+ 
+ 	while (supported_mechs[i]->name != NULL) {
+@@ -332,4 +333,9 @@ ssh_gssapi_storecreds(void)
+ {
++	if (!gssapi_client.userok) {
++		debug_f("GSSAPI client was not authorized, doing nothing");
++		return;
++	}
++
+ 	if (options.gss_deleg_creds == 0) {
+ 		debug_f("delegate credential is disabled, doing nothing");
+ 		return;
+@@ -382,9 +388,10 @@ ssh_gssapi_userok(char *user)
+ 	}
+ 	if (gssapi_client.mech && gssapi_client.mech->userok)
+-		if ((*gssapi_client.mech->userok)(&gssapi_client, user))
++		if ((*gssapi_client.mech->userok)(&gssapi_client, user)) {
++			gssapi_client.userok = 1;
+ 			return 1;
+-		else {
++		} else {
+ 			/* Destroy delegated credentials if userok fails */
+ 			ssh_gssapi_cleanup_global_client();
+ 			return 0;
+ 		}
+diff --git a/ssh-gss.h b/ssh-gss.h
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -72,6 +72,7 @@ typedef struct {
+ 	gss_cred_id_t creds;
+ 	struct ssh_gssapi_mech_struct *mech;
+ 	ssh_gssapi_ccache store;
++	int userok;
+ } ssh_gssapi_client;
+ 
+ typedef struct ssh_gssapi_mech_struct {
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
new file mode 100644
index 0000000000..0d40de214b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
@@ -0,0 +1,42 @@
+From d549f99da344c178c5f632a62a6aa60544d7236e Mon Sep 17 00:00:00 2001
+From: "robert@openbsd.org" <robert@openbsd.org>
+Subject: [PATCH] upstream: ssh_gssapi_cleanup_global_client() needs a prototype
+
+CVE: CVE-2026-106553 CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d549f99da344c178c5f632a62a6aa60544d7236e]
+
+Backport Changes:
+- Retain the Wrynose 10.3p1 context and omit upstream OpenBSD revision-only
+  hunks.
+
+(cherry picked from commit d549f99da344c178c5f632a62a6aa60544d7236e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ gss-serv.c | 2 +-
+ ssh-gss.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gss-serv.c b/gss-serv.c
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -368,7 +368,7 @@ ssh_gssapi_do_child(char ***envp, u_int *envsizep)
+ }
+ 
+ void
+-ssh_gssapi_cleanup_global_client()
++ssh_gssapi_cleanup_global_client(void)
+ {
+ 	OM_uint32 lmin;
+ 
+diff --git a/ssh-gss.h b/ssh-gss.h
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -133,5 +133,5 @@ void ssh_gssapi_cleanup_creds(void);
+ void ssh_gssapi_storecreds(void);
+ const char *ssh_gssapi_displayname(void);
+-void ssh_gssapi_cleanup_global_client();
++void ssh_gssapi_cleanup_global_client(void);
+ 
+ #endif /* GSSAPI */
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 4f14ae9b06..3cda782676 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -44,6 +44,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106585.patch \
            file://CVE-2026-106583.patch \
            file://CVE-2026-106552.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p1.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p2.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p3.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

