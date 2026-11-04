Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4452.1793777792484065324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d5HbFD3U;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2796; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JqYHdcD1WayfWlwsqI+kFkwhC+E2/eXijqcNMujKI2k=;
  b=d5HbFD3UjcMpicBBbNmiOMiD9iYJ/JT4bKCPTRI2IZz2Q/yY0508nBT2
   mZOEVYh9yzzfbmh+llU3Cym0SVCXjx5Ngs8r1QJhnDRVsMuhI8//g7pC2
   tNOta2xtRdFYThULK/frIUDj2U05TAjeN4GtzTtGM0En3fTaepPHl0qMh
   A+6PYbQY1ljHFnfNBVHTRNMig6gIyDpnxkknL0yI7BC33h4dxviiyMuat
   lV3JmgxtTwDlJaAvWB07gjz+hiwy9lQViy/Njh6AciP5EuDM93T3wMhHd
   uacTrIPJbEG8J/aV0iSGZmK4Zfy2YNDhv1R9HAcFWwT4ruAAmi8IeyUk/
   g==;
X-CSE-ConnectionGUID: 233iqakrQLiZiDrvflfN9w==
X-CSE-MsgGUID: +JM4e8NsS/+uEfYdXofa9g==
X-IPAS-Result: =?us-ascii?q?A0BGAgBQ4Opq/5L/Ja1RCYJZgld1YENJlksDniAUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjhwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBMCAQMyARgBLRAgMSsrGYMCAYJ0AxEGuk6CLIEBgykBPwICQ?=
 =?us-ascii?q?AFQ2zMBCxQBgTiFQIgjdQGEfScbG4FygRWDaYEFgVwCAYEzEmeFeQSCInoSg?=
 =?us-ascii?q?XhljBiIREiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BE?=
 =?us-ascii?q?oEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAbChQYDUgRLDcVGQQ+bgeSLYIgc?=
 =?us-ascii?q?QFZBy0IIgKBbBgBOAulWqERCiiDeIwklToaM6pxCyOYWo4KlTcyG02EaYFoP?=
 =?us-ascii?q?IFZcBU7gmcJFjQZD445g2uGQMgbJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:XrrqTayHUkavss0nvTd6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUBy
 mQZWD2BbP3fYTf8Kd4jYIi28EtU68DVy9IxSAto+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctajlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBttZowB8+VtOEVPx
 /00Mi4Dah6l1v3jldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwbIGEK4faFJw9ckCw5
 UDjo2mpJAohc5+C5DS0/kKriOaeknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:66Ohj6GbGVBzRiXQpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3A/snjtGsyJm6UPaTFIXmvleTF6It/KSbc1X7TOXa?=
 =?us-ascii?q?cCFRoZKeLR1ue3vJ7xp8=3D?=
X-Talos-MUID: 9a23:JfwKTQW9uvJ0QpHq/HzOoW1vZOFz2OPtFW0DoJk2vMeNZCMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543993891"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 8840D180005B8;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E1962CBEF6B; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 11/12] curl: set CVE_STATUS for CVE-2026-19931
Date: Tue,  3 Nov 2026 23:36:26 -0800
Message-Id: <20261104073627.302002-12-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249338
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- The advisory [1] names [2] as its fixed-in commit. It moves
  connection maintenance to admin handles, preserving the identity
  used by authentication reuse checks.
- Earlier, [4] added Negotiate/NTLM connection reuse checks,
  including an SSPI ambient-user check using recent_conn_id.
  Later, [5] removed that SSPI check; the other checks remain.
- Curl 8.19.0 predates [4]. Applying [2] alone would not reproduce
  the later upstream behavior; a source fix needs backport analysis.
- The advisory describes Negotiate reuse with empty credentials and
  lists curl 8.19.0 within the affected range [1].
- On Linux, this requires krb5 and negotiate-auth. Wrynose enables
  negotiate-auth but leaves krb5 disabled by default [3].
- Follow the merged GSS-API configuration check in [3]. Set
  not-applicable-config if either option is absent; otherwise keep
  unpatched while the source backport is deferred.
- Record the CVE as not-applicable-config unless both required
  PACKAGECONFIG options are enabled; otherwise retain unpatched status.
  The CVE_STATUS decision is conditional, not hardcoded.

Reference:
[1] https://curl.se/docs/CVE-2026-19931.html
[2] https://github.com/curl/curl/commit/7103a93b05bc69ea98ed9d05d02fa9eeba533f2f
[3] https://github.com/openembedded/openembedded-core/commit/93c410c455b92a2b1fe3b77347e57d02f344056b
[4] https://github.com/curl/curl/commit/1a17959fc7a80864c9c9b37097856bdb4a465cf8
[5] https://github.com/curl/curl/commit/1c58877705b172da892cb9c18c5edb572f2d1d73

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index f2de4dfa042..f30750a6061 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -77,6 +77,7 @@ CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
+CVE_STATUS[CVE-2026-19931] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: GSS-API Negotiate is disabled', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6
