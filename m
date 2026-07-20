Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BD2C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:06:08 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6491.1784545565905628965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fSA4Ms92;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8386; q=dns/txt;
  s=iport01; t=1784545565; x=1785755165;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tCFnJYJXcu305MpoTvtqqzzcWyIhluGhRPNnpIOhBBQ=;
  b=fSA4Ms92piK2Kuc0g8+QNnvdWcvZk5aOxLAEkRgTbBHKV0f7Alj3lzGJ
   uppVSsLMHuj63WckQKTnIIN1+Bo82wtwkY0z16tOQ9RXWz7RB1Dn5vB93
   lk78dkItU2EsdIuEkBCmjr/FIGun5+Fkxai+dnNHG1NfS9WLaVwFtLa0S
   o/7M2Mh/dhb3wMGI3wOri/pRdoQpTD1fW/bGwUkIBmNPT60qWQ5GQDj5+
   JM2ajicxw1uHgedpeMMF47y/pvBVaVtvQ1LAWvV7QxVuQZWuvDpR3EhXn
   KY4B0npK4m0yy+hmTkk9kWqjOtX1m+MTUOwM6VkZsqX8onOErpsAzcQ55
   g==;
X-CSE-ConnectionGUID: qF1YYIGTT82b9qLICPWirw==
X-CSE-MsgGUID: BPL33GYpSVuP5TwttGHvrA==
X-IPAS-Result: =?us-ascii?q?A0AaAAA7AF5q/4v/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJA4xvhzeCIZ4egX4PAQEBD0QNBAEBkloCJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgE4ARgBWQMBAlojGQiDA?=
 =?us-ascii?q?gGCdAMRvEuCLIEBgygBMQUJAkNQ2y4BCxQBgTgBhT6IIFwYAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBXAGBSYZdBIIigQyBWh6PbkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgTqBAoR0Ix8DOX+BL3VKdy1qEheBJoISAoE7AgcDCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB408I4FNcAIBWCITARsPAQRMNWdACgQDE5NTkXyhEgoog3WMI?=
 =?us-ascii?q?ZU6GjOqbJkIjgqWUIRpgWg8gUcLB3AVgyIJShkPjjiDa4F/gxSBPcUxPDUCC?=
 =?us-ascii?q?QMvAQEHAgcOAwuBaJAAAiYCBW9gAQE?=
IronPort-Data: A9a23:TnOOBaxyxA4rmXhzViJ6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUGz
 jAXD2+BaazeM2bze9slbdzi/U5XupLdzNBjTFQ+qFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDpMt8pvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFgYZLwp28lLPTEU/
 60BDBEmVi+Cnf3jldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCxYYqJKobRGJs9ckCwj
 FripD/WMwkhCsGnlAaa7m6DpvHVtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:lxIGX68792RKxtZew+Juk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: 9a23:KmQ5ZW0EqTnvxQ3I/Enq07xfA+58Q0z840vscxWyWH9NaZatdl6K5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AiGIVDA0XoeYkNCcuEz5CrrBHYDUjyZyKUxsioI0?=
 =?us-ascii?q?9hdS8aBBvJyuyrCqta9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="498482356"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:06:05 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id B938E1800020D
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:06:04 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D35CCCC037D; Mon, 20 Jul 2026 16:36:02 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832
Date: Mon, 20 Jul 2026 16:35:47 +0530
Message-Id: <20260720110548.2458865-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241359

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1] and test coverage [2], as
referenced in [3], to address multi-record OCSP response handling where
GnuTLS could check revocation status from the wrong OCSP entry.

[1] https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c1446833051e48670c2
[2] https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e
[3] https://security-tracker.debian.org/tracker/CVE-2026-3832

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3832

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ++++++++
 .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   2 +
 3 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
new file mode 100644
index 0000000000..3786c578b9
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
@@ -0,0 +1,52 @@
+From 141c9b6015fc56cd05db3a853f08d03fcbd9b0f4 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 12 Mar 2026 09:48:57 +0100
+Subject: [PATCH] cert-session: fix multi-entry OCSP revocation bypass
+
+In check_ocsp_response(), the code first searched
+for the SingleResponse that matches the certificate being validated.
+But later, the status was retrieved from entry 0 unconditionally,
+rather than from the matched resp_indx.
+As a result, if entry 0 corresponded to a different certificate and was good,
+while the matched entry for the peer certificate is revoked,
+the revocation check could've mistakenly accept the certificate.
+
+Reported-by: Oleh Konko (1seal) <security@1seal.org>
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1801
+Fixes: #1812
+Fixes: CVE-2026-3832
+Fixes: GNUTLS-SA-2026-04-29-12
+CVSS: 3.7 Low CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N
+Introduced-in: ae404fe8488dee424876b5963c00d7e041672415 3.8.9
+
+CVE: CVE-2026-3832
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c1446833051e48670c2]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit 731861b9de8dccaf7d3b0c1446833051e48670c2)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/cert-session.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/cert-session.c b/lib/cert-session.c
+index 963f797ee..f48c7a1fb 100644
+--- a/lib/cert-session.c
++++ b/lib/cert-session.c
+@@ -343,9 +343,9 @@ static int check_ocsp_response(gnutls_session_t session, gnutls_x509_crt_t cert,
+ 		goto cleanup;
+ 	}
+ 
+-	ret = gnutls_ocsp_resp_get_single(resp, 0, NULL, NULL, NULL, NULL,
+-					  &cert_status, &vtime, &ntime, &rtime,
+-					  NULL);
++	ret = gnutls_ocsp_resp_get_single(resp, resp_indx, NULL, NULL, NULL,
++					  NULL, &cert_status, &vtime, &ntime,
++					  &rtime, NULL);
+ 	if (ret < 0) {
+ 		_gnutls_audit_log(
+ 			session,
+-- 
+2.51.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
new file mode 100644
index 0000000000..54ea38fe69
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
@@ -0,0 +1,114 @@
+From ac357f76abeaf59429bc15b8764ad01920df0ef1 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 12 Mar 2026 15:25:24 +0100
+Subject: [PATCH] tests/ocsp-tests/ocsp-must-staple-connection: test
+ CVE-2026-3832
+
+CVE: CVE-2026-3832
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../ocsp-tests/ocsp-must-staple-connection.sh | 70 +++++++++++++++++++
+ 1 file changed, 70 insertions(+)
+
+diff --git a/tests/ocsp-tests/ocsp-must-staple-connection.sh b/tests/ocsp-tests/ocsp-must-staple-connection.sh
+index 94d41ce24..5e100b9d9 100755
+--- a/tests/ocsp-tests/ocsp-must-staple-connection.sh
++++ b/tests/ocsp-tests/ocsp-must-staple-connection.sh
+@@ -85,6 +85,7 @@ OCSP_RESPONSE_FILE="$testdir/ms-resp.tmp"
+ OCSP_REQ_FILE="$testdir/ms-req.tmp"
+ INDEXFILE="$testdir/ocsp_index.txt"
+ ATTRFILE="${INDEXFILE}.attr"
++SERVER_CERT_BAD_FILE="$testdir/ms-cert-bad.pem.tmp"
+ 
+ stop_servers ()
+ {
+@@ -118,6 +119,20 @@ ${CERTTOOL} \
+ 	--load-privkey "${srcdir}/ocsp-tests/certs/server_good.key" \
+ 	--template "${TEMPLATE_FILE}" --outfile "${SERVER_CERT_FILE}" 2>/dev/null
+ 
++echo "=== Generating bad server certificate ==="
++
++rm -f "$TEMPLATE_FILE"
++cp "${srcdir}/ocsp-tests/certs/server_bad.template" "$TEMPLATE_FILE"
++chmod u+w "$TEMPLATE_FILE"
++echo "ocsp_uri=http://localhost:${OCSP_PORT}/ocsp/" >>"$TEMPLATE_FILE"
++
++${CERTTOOL} \
++	--attime "${CERTDATE}" \
++	--generate-certificate --load-ca-privkey "${srcdir}/ocsp-tests/certs/ca.key" \
++	--load-ca-certificate "${srcdir}/ocsp-tests/certs/ca.pem" \
++	--load-privkey "${srcdir}/ocsp-tests/certs/server_bad.key" \
++	--template "${TEMPLATE_FILE}" --outfile "${SERVER_CERT_BAD_FILE}" 2>/dev/null
++
+ echo "=== Bringing OCSP server up ==="
+ 
+ cp "${srcdir}/ocsp-tests/certs/ocsp_index.txt" ${INDEXFILE}
+@@ -486,6 +501,61 @@ kill "${TLS_SERVER_PID}"
+ wait "${TLS_SERVER_PID}"
+ unset TLS_SERVER_PID
+ 
++echo "=== Test 10: Server with revoked certificate - CVE-2026-3832 ==="
++
++# The revocation status was always mistakenly checked for the first cert.
++# Check a pair of responses: (irrelevant good unrevoked, relevant bad revoked).
++
++rm -f "${OCSP_RESPONSE_FILE}"
++
++"$FAKETIME" "${TESTDATE}" \
++    ${OPENSSL} ocsp -index "${INDEXFILE}" \
++    -issuer "${srcdir}/ocsp-tests/certs/ca.pem" \
++    -CA "${srcdir}/ocsp-tests/certs/ca.pem" \
++    -rsigner "${srcdir}/ocsp-tests/certs/ocsp-server.pem" \
++    -rkey "${srcdir}/ocsp-tests/certs/ocsp-server.key" \
++    -cert "${SERVER_CERT_FILE}" \
++    -cert "${SERVER_CERT_BAD_FILE}" \
++    -respout "${OCSP_RESPONSE_FILE}"
++
++eval "${GETPORT}"
++# Port for gnutls-serv
++TLS_SERVER_PORT=$PORT
++PORT=${TLS_SERVER_PORT}
++launch_bare_server \
++    "${SERV}" --attime "${TESTDATE}" --echo --disable-client-cert \
++    --x509keyfile="${srcdir}/ocsp-tests/certs/server_bad.key" \
++    --x509certfile="${SERVER_CERT_BAD_FILE}" \
++    --port="${TLS_SERVER_PORT}" \
++    --ocsp-response="${OCSP_RESPONSE_FILE}" --ignore-ocsp-response-errors
++TLS_SERVER_PID="${!}"
++wait_server $TLS_SERVER_PID
++
++wait_for_port "${TLS_SERVER_PORT}"
++
++out=$(
++    echo "test 123456" | \
++        "${CLI}" -d1 --attime "${TESTDATE}" --ocsp \
++        --x509cafile "${srcdir}/ocsp-tests/certs/ca.pem" \
++        --port "${TLS_SERVER_PORT}" localhost \
++        2>&1
++    rc=$?
++)
++printf '%s\n' "$out"
++
++if test "${rc}" = "0"; then
++    echo 'ERROR: client accepted a revoked leaf (CVE-2026-3832)'
++    exit 1
++fi
++if ! echo "${out}" | grep "The certificate was revoked via OCSP" >/dev/null
++then
++    echo '"The certificate was revoked via OCSP" not found in output'
++    exit 1
++fi
++
++kill "${TLS_SERVER_PID}"
++wait "${TLS_SERVER_PID}"
++unset TLS_SERVER_PID
+ 
+ kill ${OCSP_PID}
+ wait ${OCSP_PID}
+-- 
+2.51.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index b92470768c..03eee5c50e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -32,6 +32,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0006-buffers-match-DTLS-datagrams-by-sequence-number.patch \
            file://0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch \
            file://0008-tests-mini-dtls-framents-link-to-gnulib.patch \
+           file://CVE-2026-3832_p1.patch \
+           file://CVE-2026-3832_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.35.6

