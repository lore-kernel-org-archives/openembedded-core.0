Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B5FC4452E
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:01 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4971.1784573873916483976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d/L87+xo;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6633; q=dns/txt;
  s=iport01; t=1784573873; x=1785783473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=myl0BBIAXBx7anE8530D0P4aloFhiXrQoyoygNnP7yg=;
  b=d/L87+xokUCLffDeXB8Lx/6XS3WjDhqE1Hq9U7tlxpCeGLqBiV9Yw14G
   j50xmhSwHJpNTrJqmS2soeC+JIfj+83sM2h4t1f/l8ThSJhC/irH1eY2l
   AdADjy1tCOx+2fYHX0E33blxrSLvlLrwqbXh7kUQk5AmLanqg3UvDJyKZ
   EzzwjdkkbApc7vGQJacv+E8BHqWmnev4SW0P5dP8Z2GSUrjZiuwsOIMQS
   zQJ8gmtUFFNnpPSeqScgsVKzSQNb1KknbH93qNcKkpYnuAHygcWBUuU0L
   MHwbYGMjffMz/z+u+VjCnLI5HrjmadRptm/12fd/PatuKf8HbGChFiqhE
   A==;
X-CSE-ConnectionGUID: CtjQU7vCQjeTLb4f4G1Xvw==
X-CSE-MsgGUID: UPqfoC6LQ0aoAt9G/m5xhA==
X-IPAS-Result: =?us-ascii?q?A0BIAgCabl5q/5P/Ja1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNVQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRvAGBeTOBAYMoA?=
 =?us-ascii?q?T8CQ1DbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVgTuCLoEFgVwBAQOIIgSCI?=
 =?us-ascii?q?noSgVoej3lIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6g?=
 =?us-ascii?q?QKEdCMfAzl/gS91SnctaQESF4EmghICgTsCEwMLGA1IESw3FBkEPm4HjUEjg?=
 =?us-ascii?q?TxBMxBaIQkKARMXARc/JYECNRYGkwwRkjeBNZ9aCiiDdYwhlToaM6psC5h9j?=
 =?us-ascii?q?gqVNjILXYRpgWg8gUcLB3AVgyIJShkPji0LC4NggX+DFMlHJzILMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:NobtvKzKK6k4FCTSs0R6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVSm
 GEWXDjXa/zfYjf0eoh3bo3g8B4DsJGGnN5hSVY6qlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDpMtcpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGoqP7QlpfhcOGNDy
 dgSdD5RQUmzmf3jldpXSsE07igiBNPgMIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPHWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCxYYqLK4PVHZw9ckCwm
 1rf8WPSXDUjbNWY4CbU3TWp2//PtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:NplStKucG1NVRlWiN4LwSCne7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:IyO1s2HdrYoo00MyqmJM6EwtJ587WUTfwUv0KRO2VUkweKOKHAo=
X-Talos-MUID: 9a23:DZE7kwhfvWRG9ppWvH1d3sMpCf9x7aOFVmQ0yZwBktXVGmt1ZiedpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="498697701"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:53 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id E410D18000241;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 453B9CC124E; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 8/8] openssh: Fix CVE-2026-60000
Date: Mon, 20 Jul 2026 11:57:49 -0700
Message-ID: <20260720185749.4098075-9-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241481

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-60000. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-60000

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-60000.patch      | 140 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
new file mode 100644
index 0000000000..9c25786ced
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
@@ -0,0 +1,140 @@
+From 055316632809a2e2e58eac2020699b52187d1b11 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:53:30 +0000
+Subject: [PATCH] upstream: Fix multiple RFC 4462 (GSSAPIAuthentication)
+ compliance
+
+problems
+
+1) Remove an early failure return for GSSAPI authentication attempts
+made for invalid accounts that yielded different behaviour for
+valid vs invalid accounts.
+
+2) Fix a situation where some GSSAPI requestes were not correctly
+subjected to MaxAuthTries.
+
+3) Fix a moderate pre-authentication resource DoS related to #2.
+
+Add missing logging for error cases.
+
+Report and fixes from Manfred Kaiser, milCERT AT
+
+CVE: CVE-2026-60000
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192]
+
+Backport Changes:
+- Kept Scarthgap's PRIVSEP(ssh_gssapi_server_ctx()) interface and its
+  authentication-context guard while applying the upstream RFC 4462 state,
+  failure, logging, and MaxAuthTries changes.
+- Retained the Scarthgap auth2-gss.c OpenBSD revision identifier.
+
+OpenBSD-Commit-ID: ca0acdd64eea435d6f89534538a9eb404a5629d3
+(cherry picked from commit 5d04ca6af739b82fd30d84d2783ca802ebfa1192)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ auth2-gss.c | 53 ++++++++++++++++++++++++-----------------------------
+ 1 file changed, 24 insertions(+), 29 deletions(-)
+
+diff --git a/auth2-gss.c b/auth2-gss.c
+index 195578bcf..6846eae5b 100644
+--- a/auth2-gss.c
++++ b/auth2-gss.c
+@@ -110,12 +110,6 @@ userauth_gssapi(struct ssh *ssh, const char *method)
+ 		return (0);
+ 	}
+ 
+-	if (!authctxt->valid || authctxt->user == NULL) {
+-		debug2_f("disabled because of invalid user");
+-		free(doid);
+-		return (0);
+-	}
+-
+ 	if (GSS_ERROR(PRIVSEP(ssh_gssapi_server_ctx(&ctxt, &goid)))) {
+ 		if (ctxt != NULL)
+ 			ssh_gssapi_delete_ctx(&ctxt);
+@@ -177,8 +171,14 @@ input_gssapi_token(int type, u_int32_t plen, struct ssh *ssh)
+ 			    (r = sshpkt_send(ssh)) != 0)
+ 				fatal_fr(r, "send ERRTOK packet");
+ 		}
++		logit("Failed gssapi-with-mic for %s%.100s "
++		    "from %.200s port %d ssh2",
++		    authctxt->valid ? "" : "invalid user ",
++		    authctxt->user,
++		    ssh_remote_ipaddr(ssh), ssh_remote_port(ssh));
+ 		authctxt->postponed = 0;
+ 		ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
++		ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+ 		userauth_finish(ssh, 0, "gssapi-with-mic", NULL);
+ 	} else {
+ 		if (send_tok.length != 0) {
+@@ -190,14 +190,18 @@ input_gssapi_token(int type, u_int32_t plen, struct ssh *ssh)
+ 				fatal_fr(r, "send TOKEN packet");
+ 		}
+ 		if (maj_status == GSS_S_COMPLETE) {
+-			ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+-			if (flags & GSS_C_INTEG_FLAG)
+-				ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_MIC,
++			ssh_dispatch_set(ssh,
++			    SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
++			/* note: keep ERRTOK handler as per RFC 4462 s3.4 */
++			if (flags & GSS_C_INTEG_FLAG) {
++				ssh_dispatch_set(ssh,
++				    SSH2_MSG_USERAUTH_GSSAPI_MIC,
+ 				    &input_gssapi_mic);
+-			else
++			} else {
+ 				ssh_dispatch_set(ssh,
+ 				    SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE,
+ 				    &input_gssapi_exchange_complete);
++			}
+ 		}
+ 	}
+ 
+@@ -209,10 +213,6 @@ static int
+ input_gssapi_errtok(int type, u_int32_t plen, struct ssh *ssh)
+ {
+ 	Authctxt *authctxt = ssh->authctxt;
+-	Gssctxt *gssctxt;
+-	gss_buffer_desc send_tok = GSS_C_EMPTY_BUFFER;
+-	gss_buffer_desc recv_tok;
+-	OM_uint32 maj_status;
+ 	int r;
+ 	u_char *p;
+ 	size_t len;
+@@ -220,26 +220,21 @@ input_gssapi_errtok(int type, u_int32_t plen, struct ssh *ssh)
+ 	if (authctxt == NULL || (authctxt->methoddata == NULL && !use_privsep))
+ 		fatal("No authentication or GSSAPI context");
+ 
+-	gssctxt = authctxt->methoddata;
+-	if ((r = sshpkt_get_string(ssh, &p, &len)) != 0 ||
++	/* Minimal error handling - just cancel auth and return FAILURE */
++	if ((r = sshpkt_get_string_direct(ssh, NULL, NULL)) != 0 ||
+ 	    (r = sshpkt_get_end(ssh)) != 0)
+ 		fatal_fr(r, "parse packet");
+-	recv_tok.value = p;
+-	recv_tok.length = len;
+-
+-	/* Push the error token into GSSAPI to see what it says */
+-	maj_status = PRIVSEP(ssh_gssapi_accept_ctx(gssctxt, &recv_tok,
+-	    &send_tok, NULL));
+-
+-	free(recv_tok.value);
+ 
+-	/* We can't return anything to the client, even if we wanted to */
++	logit("Failed gssapi-with-mic for %s%.100s from %.200s port %d ssh2",
++	    authctxt->valid ? "" : "invalid user ",
++	    authctxt->user,
++	    ssh_remote_ipaddr(ssh), ssh_remote_port(ssh));
++	authctxt->postponed = 0;
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+-
+-	/* The client will have already moved on to the next auth */
+-
+-	gss_release_buffer(&maj_status, &send_tok);
++	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_MIC, NULL);
++	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE, NULL);
++	userauth_finish(ssh, 0, "gssapi-with-mic", NULL);
+ 	return 0;
+ }
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index a6bf37d8a6..95c546489f 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
+           file://CVE-2026-60000.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


