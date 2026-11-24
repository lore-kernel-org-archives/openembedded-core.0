Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15270.1795517771043183993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=N8jgsoc/;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10676; q=dns/txt;
  s=iport01; t=1795517772; x=1796727372;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NjJD4h1N1n/YbNHDXbI3R7MruHk2js61KVt8ydENg+Q=;
  b=N8jgsoc/ARA17iNcvFcPteAbcn+axtGYJ2++TWDX1ylovyVU4isYIh6I
   S3IyC0TvEIHHKGLMtXPSckD4bewA933GiP4+dM/U9bNjRb37dr1shYCvv
   Z4L7cqyVZFKduMf5ZwIXIMmtyRGAOE9AV37//b3E3fyM1J6ghlr2krtbX
   LV253PKH+tifyEuG8+Eno/teLD0Iwu0/+4qDLFiQT5mnv4RjwsPdK3C4y
   bIwyDTGcJqtlAeOND2JtL8cZTYnjU8V7h0RTvabJAjgm5lK4EVqtqJ4lI
   XLH5ktcmFLZAZkCsQs6YddYVlKGae/ludNbdDn5UPO2BIZX3ilOqYLlRY
   Q==;
X-CSE-ConnectionGUID: A1dgucLJTgyW5+o9c141zQ==
X-CSE-MsgGUID: CB2D0udyQZCBYp8IwuBjnA==
X-IPAS-Result: =?us-ascii?q?A0BJAgD3awVr/9NK/pBaglmCV3VhQkkDlCeCIQOeKRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQCARG6WoF5M?=
 =?us-ascii?q?4EBgykBPwJDUNszAQsUAYE4hUKIJF0YAYR9JxsbgXKBFYE7gi+BBYFcAgOBR?=
 =?us-ascii?q?IZfBIINFXoSgVQegwSJdQKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfH?=
 =?us-ascii?q?hsOAh8QBhYhCxsYDUgRLDcVGQQ+bgeUFIJkNlAKIRMBKyCCDAoFDaM4giGhE?=
 =?us-ascii?q?Qoog3mMJJU6GjOqcguYfY4KlTdNTYRqgWg8gVlwFYMiCUoZD44uCwscg0SFE?=
 =?us-ascii?q?8lIIzULAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:UmgMpaCy+MPmrRVW/33iw5YqxClBgxIJ4kV8jS/XYbTApD8k0GAEm
 GBJDWHUbPqDMWrzctpyYdjlo0hTucDTm9Q2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE6qxiA1w9Ga8k9fdIXCJJp
 PdBdGkfV0XW7w626OrTpuhEj8k5ac2uN4QFtzQ5lXfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGMHgBfoO3WjPn8eE4o3huKhnFH0ciZTrxSeoq9fD237klctjuW3a4C9ltqibu8Psh6Fq
 nP/zU/TMwlKFcOC4ziD2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVjVjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:phLJ0apdH6lVpBfS2rCY9mwaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:faeRKmFAcB2ru8F7qmJOrUIbB8sBUEHS3UiNYEjpAj81Ea+sHAo=
X-Talos-MUID: 9a23:tC8DXgk6JiRouoJC91MQdnpJHp1Eu7miGXk/ur83o5mlKjFaOTG02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="63465232"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id E688118000B7F
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:09 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 345D9CBF23C; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 10/10] openssh: Fix CVE-2026-106553 and CVE-2026-106555
Date: Tue, 24 Nov 2026 02:55:33 -0800
Message-Id: <20261124105533.348654-11-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251013
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the shared upstream fixes referenced in [4] and
[5], using the commits shown in [1], [2], and [3].

[1] https://github.com/openssh/openssh-portable/commit/670510d1e190b0f4e47066f24498c04ada1da0f0
[2] https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d7778cfb047faaed1679e8b7
[3] https://github.com/openssh/openssh-portable/commit/d549f99da344c178c5f632a62a6aa60544d7236e
[4] https://ubuntu.com/security/CVE-2026-106553
[5] https://ubuntu.com/security/CVE-2026-106555

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../CVE-2026-106553_CVE-2026-106555_p1.patch  | 106 ++++++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p2.patch  |  81 +++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p3.patch  |  56 +++++++++
 .../openssh/openssh_10.5p1.bb                 |   3 +
 4 files changed, 246 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
new file mode 100644
index 0000000000..579276af51
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
@@ -0,0 +1,106 @@
+From 8b373c0b98c54edb2cdc3022644df9c95ab4bb59 Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ auth2.c    |  1 +
+ gss-serv.c | 19 ++++++++++++-------
+ monitor.c  |  2 ++
+ ssh-gss.h  |  1 +
+ 4 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/auth2.c b/auth2.c
+index 3f353a7..b46c196 100644
+--- a/auth2.c
++++ b/auth2.c
+@@ -336,6 +336,7 @@ input_userauth_request(int type, uint32_t seq, struct ssh *ssh)
+ 	auth2_challenge_stop(ssh);
+ 
+ #ifdef GSSAPI
++	ssh_gssapi_cleanup_global_client();
+ 	/* XXX move to auth2_gssapi_stop() */
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE, NULL);
+diff --git a/gss-serv.c b/gss-serv.c
+index f9ae303..53b6dd5 100644
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
+index 1496711..43263b9 100644
+--- a/monitor.c
++++ b/monitor.c
+@@ -1977,6 +1977,8 @@ mm_answer_gss_setup_ctx(struct ssh *ssh, int sock, struct sshbuf *m)
+ 	if (!options.gss_authentication)
+ 		fatal_f("GSSAPI authentication not enabled");
+ 
++	ssh_gssapi_cleanup_global_client();
++
+ 	if ((r = sshbuf_get_string(m, &p, &len)) != 0)
+ 		fatal_fr(r, "parse");
+ 	goid.elements = p;
+diff --git a/ssh-gss.h b/ssh-gss.h
+index 7b14e74..3204d43 100644
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -132,6 +132,7 @@ void ssh_gssapi_do_child(char ***, u_int *);
+ void ssh_gssapi_cleanup_creds(void);
+ void ssh_gssapi_storecreds(void);
+ const char *ssh_gssapi_displayname(void);
++void ssh_gssapi_cleanup_global_client();
+ 
+ #endif /* GSSAPI */
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
new file mode 100644
index 0000000000..e74c333467
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
@@ -0,0 +1,81 @@
+From da0686435465536df6e64a201c4408d1b1ded7a1 Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ gss-serv.c | 13 ++++++++++---
+ ssh-gss.h  |  1 +
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/gss-serv.c b/gss-serv.c
+index 53b6dd5..4383062 100644
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -53,7 +53,7 @@ extern ServerOptions options;
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
+@@ -333,6 +334,11 @@ ssh_gssapi_cleanup_creds(void)
+ void
+ ssh_gssapi_storecreds(void)
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
+ 		return 0;
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
+diff --git a/ssh-gss.h b/ssh-gss.h
+index 3204d43..debe118 100644
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -74,6 +74,7 @@ typedef struct {
+ 	gss_cred_id_t creds;
+ 	struct ssh_gssapi_mech_struct *mech;
+ 	ssh_gssapi_ccache store;
++	int userok;
+ } ssh_gssapi_client;
+ 
+ typedef struct ssh_gssapi_mech_struct {
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
new file mode 100644
index 0000000000..f3c8cadf30
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
@@ -0,0 +1,56 @@
+From ef5c9639935048ca89cca6d8d44cfb89eb520839 Mon Sep 17 00:00:00 2001
+From: "robert@openbsd.org" <robert@openbsd.org>
+Date: Wed, 7 Oct 2026 09:00:11 +0000
+Subject: [PATCH] upstream: ssh_gssapi_cleanup_global_client() needs a
+ prototype
+
+ok dtucker@
+
+/usr/src/usr.bin/ssh/ssh/../ssh-gss.h:115:38: error: a function
+declaration without a prototype is deprecated in all versions of C
+[-Werror,-Wstrict-prototypes]
+ 115 | void ssh_gssapi_cleanup_global_client();
+     |                                      ^
+     |                                       void
+1 error generated.
+
+OpenBSD-Commit-ID: a1cf776a4fa4b2760ea51236b58b3688df685906
+
+CVE: CVE-2026-106553 CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d549f99da344c178c5f632a62a6aa60544d7236e]
+
+Backport Changes:
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ gss-serv.c | 2 +-
+ ssh-gss.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gss-serv.c b/gss-serv.c
+index 4383062..f9d6fd8 100644
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
+index debe118..eee5220 100644
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -133,7 +133,7 @@ void ssh_gssapi_do_child(char ***, u_int *);
+ void ssh_gssapi_cleanup_creds(void);
+ void ssh_gssapi_storecreds(void);
+ const char *ssh_gssapi_displayname(void);
+-void ssh_gssapi_cleanup_global_client();
++void ssh_gssapi_cleanup_global_client(void);
+ 
+ #endif /* GSSAPI */
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 04454382c4..bf06d6b5d0 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -34,6 +34,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106585.patch \
            file://CVE-2026-106583.patch \
            file://CVE-2026-106552.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p1.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p2.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p3.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

