Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27792.1793856710351879545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TWWOuLFH;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2209; q=dns/txt;
  s=iport01; t=1793856710; x=1795066310;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iSFiJcqkiq3+gcevhunkp4jvGCq6kh2+yrofgZqC8mE=;
  b=TWWOuLFH1mKmDejHYYDwUYmBSrZUOfbO/l8oOQZKgc9nYy0ecH3bm7sK
   3z+DaOdESHQnumc2f6mg6Q7GEZYujq4CDu+FmSH70WPVB76tu5mHzMfCz
   S3/OonV+iQSX9T3Ab1atodJ1CGzKGo46Iw/92r2bYm4iLWeeaWM7/MDdk
   yxXE2Q4BqCUZ8pR247Idl0GpCUPcJ0jLcxt17yPffpXIWy6M5cFZv1irr
   0emTBGxsSNy7BCcXLQxuXFtnKy3mqIqwmYZAkLap5vLrBkA5mnoG/zPyP
   Vy7YF2AhWB89m+X5FrXyU8BuL40TIIX5pDpHz72w9bu1GI8uG+B4O0C6R
   A==;
X-CSE-ConnectionGUID: cXbZH+KKRD++tJBUMUIhZw==
X-CSE-MsgGUID: R1YvNImYTSKrmvvvizV+dQ==
X-IPAS-Result: =?us-ascii?q?A0DHAgCDE+xq/47/Ja1aglmCV3VhQkmUKoIkniGBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOHQImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAzIBGAE9IDErKxmDAgGCdAIBEbw/giyBAYMpAT8CQ1DbM?=
 =?us-ascii?q?wELFAGBOIVAiCN1AYR9JxsbgXKBFYNpgQWBXAEBAhiCE4V5BIIigQyBeIx6i?=
 =?us-ascii?q?ERIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BK?=
 =?us-ascii?q?yheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?AsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRWjQsBII5p?=
 =?us-ascii?q?WWhEQoog3iMJJU6GjOqcQuYfY4KlWlohGmBaQE6gUcLB3AVgyIJShkPjjmDa?=
 =?us-ascii?q?4F/gxTJSCM1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:aLjf4qubT/D2BlgNHqvQk3htb+fnVABfMUV32f8akzHdYApBsoF/q
 tZmKTjXOqqKNzP2e9slOoXk/BgHvpTUxoI1Swo9qys9Fy4WgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8dZ9M0EN1
 t8iBHNOcjKpuseL4bKJVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtNYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4DWGpsIzxvDz
 o7A116gMw88Fdmu9QGm6HeymPHOjx24VLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:onKPEqAc3qV5ptHlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3A8Aj2z2r+tCEFDuTGbc7aMQ/mUcsVeE/9j1TzGWP?=
 =?us-ascii?q?7SnpLYoCwdH6Qyrwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A98Ogsw38TxSiVlYCoQaftTb4iDUj2f2fFmYslKQ?=
 =?us-ascii?q?6gOqeMDJuJTaPsne7e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544765953"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id B5B431800020E
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 0E7A9CC2EF2; Wed,  4 Nov 2026 21:31:49 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  7/8] openssh: Ignore CVE-2026-106553
Date: Wed,  4 Nov 2026 21:31:47 -0800
Message-Id: <20261105053148.2704106-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105053148.2704106-1-hthakar@cisco.com>
References: <20261105053148.2704106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249437
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

The vulnerable GSSAPI implementation is compiled only when OpenSSH
is built with Kerberos support. The default PACKAGECONFIG excludes
kerberos and passes --without-kerberos5.

Set not-applicable-config only for builds without kerberos. Keep
kerberos-enabled configurations marked unpatched. The upstream fix
and advisory are referenced in [1] and [2].

[1] https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d7778cfb047faaed1679e8b7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106553

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index dd49cdf977..54cb2628f1 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -69,6 +69,7 @@ CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distr
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-106553] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is not built without PACKAGECONFIG kerberos', d)}"
 CVE_STATUS[CVE-2026-106555] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is not built without PACKAGECONFIG kerberos', d)}"
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
-- 
2.35.6

