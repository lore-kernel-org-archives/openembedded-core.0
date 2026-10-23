Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3209.1792748016106314084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 02:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CN3h5SWb;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4731; q=dns/txt;
  s=iport01; t=1792748016; x=1793957616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6v173Xqbvd7fBUsJQ3QoUtgz+wToVJ8Qu3n1n6nQ/Lg=;
  b=CN3h5SWbDV2eVS2cQwrICN8FpO4TNXu+N9BTJlUpN1iyKgm37DnAU1NX
   JLcC8T/F7ocSdEucTVm3e0kCtwTfuJG0tQxXgPGkIRwFNF9cDAdXWXeVN
   g2XWdSMOvORq7wvnTVpDamvD80BOXlD2tXh6FCysgSFM5TvoOsdNVuAzK
   /HOy5vH87HLA/gE7SooAd55gQo+MgTjIWulCdBNp9L3Qg4drN8QITEA8Q
   Pjsvyt3gmBxmLdE5EtdauLaOjkJ4hWQgW5DMvX/klKjC1DwOJXhEnpxyS
   vk6rUYNfbjapw5U9BfAd71QqmZsOD3ZkaE61WFqF+33BTNqrbP8UnYgD1
   g==;
X-CSE-ConnectionGUID: iHJJcbD5QKKBbHUzgP4uUQ==
X-CSE-MsgGUID: FM+sxAfXQkyth9l+K3xhew==
X-IPAS-Result: =?us-ascii?q?A0BkAwBDKdtq/4v/Ja1aglmDTGBDSZNaAYJwkU2MUhSBY?=
 =?us-ascii?q?AoPAQEBDy4WDQQBAYUFjhcCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBUBBCYLARgBLTAYAQEBPQQ7CYMCAYJ0AxG2UYF5M4EBg?=
 =?us-ascii?q?ykBOQGBGts+FYE4hUCII3aEfCcbG4FyhH6CYQIDgRYuWAkCBoV1BIINFXoSg?=
 =?us-ascii?q?l2GJYZKGmyGCUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?R6BFiMZNmuBCV2BKylgASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xouC4EaODwJJkEVDGYLGgViCAINDH85EB8YDUgRLDcVGQQ+bgeRb4IZawUBA?=
 =?us-ascii?q?QFZCRgUK4IOBRQFDgOjRIIhoQ8KKIN2jCKNPk+HLRoznimMRpkIjgqVNDQLE?=
 =?us-ascii?q?E2EaYFoPIFZcBWDIglKGQ+SJIUTyUcnMgIJMgIHAgcOAwuRaiQJgU8BAQ?=
IronPort-Data: A9a23:QvY7cqCVBRdm5xVW/0fiw5YqxClBgxIJ4kV8jS/XYbTApDJw0jFRn
 WtOXzzUb/iPNDf1fI1+a4uz90pV6sXQn9RiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf/gGYoWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwtVMLko8EdAh2cVdC0Fz5
 /MgdC0wV0XW7w626OrTpuhEnM8vKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE+BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEqgem3aYuKI7RmQ+17uwWDt
 kvIz136Ew0aZdjc6mGV8n+z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQiG+DtxgaHdFXFeIz7CmWz6vQ7kCXHAA5oiVpctcqsooyADctz
 FLMx4mvDj10u7rTQnWYnluJkQ6P1eEuBTdqTUc5ocEturEPfKlbYsrzc+te
IronPort-HdrOrdr: A9a23:HSjeVa/hY4zDYz7Ego5uk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:x/8wLWGblj/5zxuIqmJm1Gw2EcoJL0T+713aA3KqBl41VYCsHAo=
X-Talos-MUID: 9a23:vr//PAVMAC8bRcDq/BHJxypyHclY2qe/FEBcldYl4NmEODMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,174,1787011200"; 
   d="scan'208";a="539921971"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Oct 2026 09:33:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id EF25C180007E3;
	Fri, 23 Oct 2026 09:33:34 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 96CCCCC1611; Fri, 23 Oct 2026 02:33:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 0/5] curl: backport security fixes
Date: Fri, 23 Oct 2026 02:33:26 -0700
Message-Id: <20261023093331.1886272-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 09:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248493
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport five security fixes to curl 8.19.0 on Wrynose.
The series addresses CVE-2026-8926, CVE-2026-11564,
CVE-2026-80255, CVE-2026-82208, and CVE-2026-80231.

This series is based on Jaipaul Cheernam's Wrynose patch
for CVE-2026-80230 [1]. Apply that patch first. The five
commits here add the remaining fixes on top of it.

Changes in v2:
- Address OE-core review comments:
- CVE-2026-8926 [2]: a later login in one machine entry can reuse
  the previous login's password (bob/p  1 instead of bob/p2).
  Select credentials after reading the whole entry, keeping its final
  login and password so both credential orderings select bob/p2.
  Extend tests/data/test1304 and tests/unit/unit1304.c for both
  orderings, replaced logins, account values and macros. Keep the
  old parser API and test harness, and document differences from
  upstream's lexer/scanner rewrite. Retain password-only entries
  and the old blank-password API.
- CVE-2026-11564 [3]: could retaining automatic client certificate
  selection introduce certificate confusion?
  Clarify that the backport preserves the existing Schannel opt-in
  assignment from CURLSSLOPT_AUTO_CLIENT_CERT, disabled by default.
  The native-CA setting is reset per transfer. The newer initial-origin
  restriction is not backported; Schannel redirect behavior has not
  been runtime tested.
- CVE-2026-80255 [4]: missing per-attribute validation can turn
  Secure<TAB>HttpOnly into an unknown attribute and lose Secure.
  Carry the earlier TAB-value fix and validation from [7] in separate
  dependent_p1 and dependent_p2 patches before the main TAB-handling
  fix. Adapt the validation to the older parser before attribute
  dispatch. Extend test 2885 to reject this malformed cookie, retaining
  the TAB-before-Secure case and normal Secure control.
- CVE-2026-82208 [5]: justify omitting the CURL_UNCONST ECH change
  and explain whether it affects ECH behavior.
  Explain that 8.19.0 already has a mutable char * from data->set.str,
  while upstream uses const char * from CURL_EASY_STR. The old pointer
  already matches the wolfSSL argument type; the ECH call and error
  handling are unchanged. Both store-setup security hunks are retained.
- CVE-2026-80231 [6]: justify omitting the ossl_apply_session() hunk
  and establish what verification handling exists in 8.19.0.
  Map the moved flag to lib/urldata.h and the SSL helpers to
  lib/vtls/vtls.c. Explain the GnuTLS function-name differences.
  The omitted OpenSSL hunk only updates a flag access inside a later
  SecTrust session-reuse exception. That exception and its cached
  verification field are absent from 8.19.0. Its existing session
  verification check remains unchanged.

[1] https://lists.openembedded.org/g/openembedded-core/message/248025
[2] https://lists.openembedded.org/g/openembedded-core/message/248286
[3] https://lists.openembedded.org/g/openembedded-core/message/248292
[4] https://lists.openembedded.org/g/openembedded-core/message/248294
[5] https://lists.openembedded.org/g/openembedded-core/message/248296
[6] https://lists.openembedded.org/g/openembedded-core/message/248297
[7] https://github.com/curl/curl/commit/67300814294ab0aa311b8568b460619ecc522949

Darsh Kelaiya (5):
  curl: fix CVE-2026-8926
  curl: fix CVE-2026-11564
  curl: fix CVE-2026-80255
  curl: fix CVE-2026-82208
  curl: fix CVE-2026-80231

 .../curl/curl/CVE-2026-11564.patch            | 139 ++++++++++
 .../curl/curl/CVE-2026-80231.patch            | 225 +++++++++++++++
 .../curl/CVE-2026-80255-dependent_p1.patch    | 139 ++++++++++
 .../curl/CVE-2026-80255-dependent_p2.patch    |  81 ++++++
 .../curl/curl/CVE-2026-80255.patch            | 115 ++++++++
 .../curl/curl/CVE-2026-82208.patch            |  54 ++++
 .../curl/curl/CVE-2026-8926-dependent.patch   | 140 ++++++++++
 .../curl/curl/CVE-2026-8926_p1.patch          | 258 ++++++++++++++++++
 .../curl/curl/CVE-2026-8926_p2.patch          |  84 ++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   9 +
 10 files changed, 1244 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11564.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80231.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch

-- 
2.35.6

