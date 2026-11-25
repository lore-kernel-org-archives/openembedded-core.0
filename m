Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36410.1795585635081578386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kOYPh7hU;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1339; q=dns/txt;
  s=iport01; t=1795585636; x=1796795236;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Iz4O2GkULLH8aTmKe15pPYA1rciCrwY8t3lmpi5mc/c=;
  b=kOYPh7hU0bmASZLJ/mcKGGb5bnkVezeKvV6HkWs1o0xYb9OKR3UkX40p
   pT4pV/mEN5gh0yB+M0kZdRQyim7Y/QSqAz8ylWwZHHc+u1St8K3i7h6uf
   r6L7aDmmK8jaeIXw9aQNxrMMLRfzOKKgX4DcyHiMy3ttB8OKlQGdPy027
   PXorYWFZsLRjpfiqareKcoWf8PZTCwsM+IU7pQenP5NOhY3seRVaqkvih
   7I5AqqHYYBY96WTY+0vR8yM3RGtEZllDoQDMDS97FPqpysUYIT6r5YDn4
   u0UqtRlDjZdp9+Ke9UG8xYGodsdH6jjONNJY8lEaTASqB3t3L9CWYDmKJ
   Q==;
X-CSE-ConnectionGUID: G1cceq2tQfakqG1jWaEtCw==
X-CSE-MsgGUID: Aqi3VE11STap5WSCIICs3Q==
X-IPAS-Result: =?us-ascii?q?A0BFAgD8dAZr/9RK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ89FAQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZATAgEDMgEYAT0gMSsrGYMCAYJ0AxG5cIIsgQGDKQE/AkNQ2?=
 =?us-ascii?q?zMBCxQBgTiFQogldQGEficbG4FygRWDaoEFhAuFeQSCInoSgXKMdYodSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBC?=
 =?us-ascii?q?IF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhC?=
 =?us-ascii?q?AINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELNBgNSBEsNxUZBD5uB5QTg?=
 =?us-ascii?q?xtaNCwEHIFlJxGlZKERCiiDeYwklToaM6pyC5h9jgqWUYRqgWg8gVlwFYMiC?=
 =?us-ascii?q?UoZD445g2vOWyYyDi8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:88p2ZqylNqcfu5lr5n96t+dixyrEfRIJ4+MujC+fZmUNrF6WrkUPn
 GYcX2GFPqzZajPxKY9ybYXk9xtVsZfSydMyTFFlqlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJG5vNoYV47xrOG9H9
 uU3cTIyZz2frP3jldpXSsE07igiBMDmJsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2aC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjuC0YIqOJYHiqcN9t1+Z/
 Vzrpj3CPhgCaeOk4huk2Wn3v7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:pzVzoq48js4vIE2lzAPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AfFXitWkeFkJ642ON4MrO0WFEw5PXOVKEx3zdOhW?=
 =?us-ascii?q?kMGhgS6S6EF2v8Y54uNU7zg=3D=3D?=
X-Talos-MUID: 9a23:CVKfDwY9VflU5OBTnibt3w9PbZ5T3622VX82urQnkNLfDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60188375"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 5C68A180001C6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 963D9CBF234; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 06/10] openssh: Ignore CVE-2026-106588
Date: Tue, 24 Nov 2026 21:47:07 -0800
Message-Id: <20261125054711.2691239-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251140
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- This issue requires OpenSSH built with the macOS 27 or later SDK.
- Wrynose targets Linux and cannot select the Darwin sandbox.

Reference:
https://ubuntu.com/security/CVE-2026-106588

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 39ed9adc64..76ae969b8a 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -59,6 +59,7 @@ CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
+CVE_STATUS[CVE-2026-106588] = "not-applicable-platform: Requires the macOS 27 or later SDK and Darwin sandbox; Wrynose builds OpenSSH for Linux."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6

