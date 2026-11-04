Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6577.1793789809405318893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dG54EIGn;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2698; q=dns/txt;
  s=iport01; t=1793789809; x=1794999409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNvI0jGnEi7iljRbjS7byO6iNOhNamCoSP+AUaIK7/E=;
  b=dG54EIGnsknQqMQxc62yAiKAOMznww/w5ZgROVoP8oe5NQZD2J7mTwX0
   nIvUBcfyIQkJCPvDSD+gANuF/S+YjzEeg5PbSIAYySldI9AgfK6XXdxZ4
   5rIk729F7eo/6Wm1cj0qGSJ89VeLUQIuVAUFD5BIyhoBgSo/d/0gXA2aP
   LSlXlTbkxpBt1qJpIO0y/RBFYYEfp98182NY14BhKbB7gyMMEeXV92sb4
   3U5PqE3M/dowwXT1ma6j5JQYnalahQV+uVFISlfZr8doIknYQjvtUHqHg
   0p43TPbp7ztOjowCM5jyHcvULTjT2CR1Hdpfd7QDiq36kE03Rs/0Qb/u4
   g==;
X-CSE-ConnectionGUID: 5kkJ+FK0S9+ARhjfYbMFAA==
X-CSE-MsgGUID: +PY0VO96SmaSGWo3dD/Z+Q==
X-IPAS-Result: =?us-ascii?q?A0BGAgA+Dutq/5X/Ja1RCYJZgld1YENJlksDniEUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjhwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBMCAQMyARgBLRAgMSsrGYMCAYJ0AxEGuwGCLIEBgykBPwICQ?=
 =?us-ascii?q?AFQ2zMBCxQBgTiFQIgjdQGEfScbG4FygRWDaYEFgVwCAYEzEmeFeQSCInoSg?=
 =?us-ascii?q?XhljBiIREiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BE?=
 =?us-ascii?q?oEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAbChQYDUgRLDcVGQQ+bgeSLYIgc?=
 =?us-ascii?q?QFZBy0IIgKBbBgBOAulWqERCiiDeIwklToaM6pxCyOYWo4KlTcyG02EaYFoP?=
 =?us-ascii?q?IFZcBU7gmcJFjQZD445g2uGQMgbJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:DY+Rda056tQnETw7nPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzwAm
 DBKDWyDMquNYmCgfYxwaorgoU4H78LWmtZqTgps3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUUI1H8422b5MUCJnz
 /waJgEHSz6qrrfjqF67YrEEasULNsLnOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiRC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OWxa4qMIIzaFa25mG7bn
 lOewUOoXCofPeew9j3e/l7rtKz2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:9boP/6NGa+MJPcBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:/o8xUm7AGIEE0+io+tssqU0XOIMLUSXmnTT5GU+6B1djbZO8YArF
X-Talos-MUID: 9a23:+y6PwwubEGF7S6eAys2nxwlTbPlPsvqVDUk2vqoB4MWoch4zAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="543812888"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 10:56:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 62809180001C1;
	Wed,  4 Nov 2026 10:56:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 0C073CBF201; Wed,  4 Nov 2026 02:56:48 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/3] curl: set CVE_STATUS for CVE-2026-19931
Date: Wed,  4 Nov 2026 02:56:43 -0800
Message-Id: <20261104105645.2523473-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104105645.2523473-1-dkelaiya@cisco.com>
References: <20261104105645.2523473-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 10:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249360
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- The advisory [1] names [2] as its fixed-in commit. It moves
  connection maintenance to admin handles, preserving the identity
  used by authentication reuse checks.
- Earlier, [4] added Negotiate/NTLM connection reuse checks,
  including an SSPI ambient-user check using recent_conn_id.
  Later, [5] removed that SSPI check; the other checks remain.
- Curl 8.7.1 predates [4]. Applying [2] alone would not reproduce
  the later upstream behavior; a source fix needs backport analysis.
- The advisory describes Negotiate reuse with empty credentials and
  lists curl 8.7.1 within the affected range [1].
- On Linux, this requires krb5 and negotiate-auth. Scarthgap enables
  negotiate-auth but leaves krb5 disabled by default.
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
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ab33d4aa77..b308aa1e3f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -64,6 +64,7 @@ CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotia
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
+CVE_STATUS[CVE-2026-19931] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: GSS-API Negotiate is disabled', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6
