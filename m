Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6578.1793789809410655520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ru9ZItx9;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2133; q=dns/txt;
  s=iport01; t=1793789809; x=1794999409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Tz2DHlyv0IISFHFR0qfVDwgcXKYbrGnqS0qfeQK28Q=;
  b=Ru9ZItx98kJ4Catc/nKEZmqqEgfp6Ln3zpXV39hS1okTjCGsBV6G9FqO
   Ut4UzEwR4nc3eSg0FSbTTzlAvDQ+FOG2fNuXGAWJVsCrra5UU33nacUuo
   MJxvGKBHnaDa40lBDcwPiRJ5ue3rcYLubfvwusaBukpywnyLZJG0Siz3o
   wD4LgqFEEfLxkpBjf1bLdJNM5+3QJ2jcO+jFXWuq3XIVVLzNSh5A9+exx
   c9zBAx7XkLX4t/gqC8LT0IT5ol0i31bnBMdXp2mVLFaZya6unOYOQZOOU
   7nvNpgq/4yTM+vqevmBXwNQYOYGnT2l1S+PGwOVkiQpY4S4jk4GKW/2S9
   g==;
X-CSE-ConnectionGUID: Lu+94NWzSMqisfsyRde1wA==
X-CSE-MsgGUID: uQB94A1kQgG361xw2NMKTQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgC6Dutq/4r/Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZATAgEDMgEYAS0QIDErHQENGYMCAYJ0AxEGuwSCLIEBgykBPwICQ?=
 =?us-ascii?q?AFQ2zMBCxQBgTiFQIgjdQGEfScbG4FyhH6BBYFcAgGCLIV5BIIiehKBeGWMG?=
 =?us-ascii?q?IhESIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddg?=
 =?us-ascii?q?SsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/F?=
 =?us-ascii?q?QxmCxoFYQgCDQx0ORAwHiQvBRwmQBsKFBgNSBEsNxUZBD5uB5ItgxFaBwkkK?=
 =?us-ascii?q?gIggh2lZaERCiiDeIwklToaM6pxCyOYWo4KllGEaYFoPIFZcBU7gmcJFjQZD?=
 =?us-ascii?q?445g2uGQMgbJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:KkOBf64TD6V/we6+4MzpwgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mBNCm+EaPvYa2v2LYx+Otni9BwGuZSEz4cwGwNkqSgxZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGZBbq7pRPnN10
 OUZMz4WfyqPirup6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIePK4PVGZ8Mzy50o
 Erbxk6oXjhDN+WQ5mHbq2Kz3Mnqvh/CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:zLEX3aMUr5R318BcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:l0zo3WM0G0nb3+5DfDQkpRIyJdIeV2Tc13nLMnW0BD92YejA
X-Talos-MUID: 9a23:fDig7wmEFDx1h2GsLZNRdnp/De05v433C3kCvs5Y4tmbbwpVGAuk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="529774219"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 10:56:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 6976D180001D0;
	Wed,  4 Nov 2026 10:56:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 14D57CBF203; Wed,  4 Nov 2026 02:56:48 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/3] curl: set CVE_STATUS for CVE-2026-80231
Date: Wed,  4 Nov 2026 02:56:45 -0800
Message-Id: <20261104105645.2523473-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104105645.2523473-1-dkelaiya@cisco.com>
References: <20261104105645.2523473-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 10:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249358
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- Select the native CA connection-reuse fix in [2], identified by
  the advisory [1]. It compares the effective native CA setting.
- The advisory limits the issue to Windows and macOS [1]. Scarthgap
  builds curl, curl-native and nativesdk-curl for Linux.
- In curl 8.7.1, native_ca_store is derived from CURLSSLOPT_NATIVE_CA.
  The same flag is retained in ssl_primary_config.ssl_options,
  which is cloned and compared for connection reuse.
- The later implicit native CA selection in [3] is absent from the
  Scarthgap source. Do not import the Wrynose TLS configuration patch.
- Hence ignoring the CVE using not-applicable-platform for Linux.
  Reassess if the SDK platform or native CA configuration changes.

Reference:
[1] https://curl.se/docs/CVE-2026-80231.html
[2] https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42
[3] https://github.com/curl/curl/commit/eefd03c572996e5de4dec4fe295ad6f103e0eefc

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 33265f0f25..28d834abb2 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -66,6 +66,7 @@ CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 CVE_STATUS[CVE-2026-19931] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: GSS-API Negotiate is disabled', d)}"
+CVE_STATUS[CVE-2026-80231] = "not-applicable-platform: native CA reuse issue affects Windows and macOS, not Linux"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6
