Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95BECA600A
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:14 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7413.1791372244554303592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Divf04dQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1619; q=dns/txt;
  s=iport01; t=1791372244; x=1792581844;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uJ4vVVah33VxJIzxrfesoSEGXu4lNXizXE/wi8slH1M=;
  b=Divf04dQr19KGj/vjGYcFi0ebCFO5Uf0m6GDtAd3DbCezytmIuT/Ajn6
   GRd1sR6pfayDPQD3BqFnokdMJwFlU120CBH7mSyeIUnmQXolx7kHVNfu2
   evZVKiQsFDAnreXnFp3JDxb2uNT5ohVX3HmiqbR/jetwlvtuyQjZgCWHK
   HmkC9gPvSzewjjG046fs8BMfFPOGs/9Z2Wk/T6X1I/xd3xxfrFZpzbQ5F
   aaRC5FgzkX/kIcnT2JpyHESeIHjzjbMMq8NTPXIYRnU7y7+uc9FZYHKv3
   nPmt45gpHsC+gO0zJeVrOPPWmQDQtLUIjgAmLUp6tudg0GoElVbo9tTX0
   g==;
X-CSE-ConnectionGUID: UEnQ0k/CR3GMV4/+NiHLcg==
X-CSE-MsgGUID: /yxPg/YDRqyZzH7ZFNe03g==
X-IPAS-Result: =?us-ascii?q?A0DHAgCcKsZq/43/Ja1aglmCV3VhQkmUKYIknhqBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOCQImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAzIBGAE9IDErKxmDAgGCdAIBEQa1ZoIsgQGDKQE/AgJAA?=
 =?us-ascii?q?VDbMgELFAGBOIVAiCN1AYR8JxsbgXKEfoEFgVwDARiCE4V4BIIiehKBeGWSc?=
 =?us-ascii?q?kiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBC?=
 =?us-ascii?q?V6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJK?=
 =?us-ascii?q?EEXDCkYDUgRLDcVGQQ+bgeQWx6CYFoHLSoCgj2lZaEPCiiDdowilToaM6pvC?=
 =?us-ascii?q?5h9jgqVNoEahGmBagI4gVlwFTuCZwkWNBkPjjmIfoEtxXkkNQIBATkBAQcCB?=
 =?us-ascii?q?w4DC4FokX4BAQ?=
IronPort-Data: A9a23:MErjX6OVYNNF1gPvrR30lsFynXyQoLVcMsEvi/4bfWQNrUonhDNVm
 GEbUGDQP/iDMGPxe9l3YY+39EoCsMOEn4VnGnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9g2Esawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68hDCnhuPsozwL1YJF8Ss
 r8+KRApZR/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNXwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQsiuS2aYeOIoLiqcN92VeIn
 m2BzkjDGwAoJvzA+xSj/yr3ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:Up+TcKhnN+RH3HIavyUbKW2e9HBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AjOuRvmlBUmsy1/Fn0Cfa6fs51HDXOUDwyk6IIAi?=
 =?us-ascii?q?TMz1GbYPJDhy2+YNAmMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxgtZ7A5CnlmGr0rz4y7/qE2Vxowv8rSWBwc8va8?=
 =?us-ascii?q?fqvuWFXNCFRGQ1G+4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="524315306"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 11:24:03 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 9D11218000193
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 11:24:03 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 43C2DCBF201; Wed,  7 Oct 2026 04:24:03 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/8] curl: deferred CVE-2026-12064
Date: Wed,  7 Oct 2026 04:23:57 -0700
Message-Id: <20261007112403.486499-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261007112403.486499-1-devanshp@cisco.com>
References: <20261007112403.486499-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247388

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-12064 affects SCP and SFTP support with libssh2. [1]
- Scarthgap keeps libssh2 optional and disables it by default. [2]
- The status reports unpatched when libssh2 is explicitly enabled.
- Hence deferring the CVE for now.

Reference:
[1] https://curl.se/docs/CVE-2026-12064.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.7.1.bb?h=scarthgap

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index f3b1c32e93..ba2968fc6c 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -61,6 +61,7 @@ CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', '
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
+CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6


