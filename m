Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2744.1795845257353961804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ad3qTtbY;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1233; q=dns/txt;
  s=iport01; t=1795845257; x=1797054857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q8zwhe9ilru29rT844nZMtcF6Uy7CX0uvJiIqqOiXIY=;
  b=ad3qTtbYjpsos6jJlM/HjvqPEpXfqmOdrFUwcMiKhfXla2q1UaRsVGlS
   cBklgh34KhzxXF5bS2JpvpqBwOpfPE1Uwq+bxAjghy5u9JJ1za47+fDXO
   Z8uXqzUijNRYmmB7S3pgbpH7jh7Tv1GcyOSR2kKgfZ2R+tg5GT6XyiIEu
   txJ11TiujN7wzdT2071zHZcpGuOTo7Qf4qa1Y5F88JndZvdOD6YoMi11b
   5lFDisMVZGkC/pD8Jlmwep7MMLU1tp5Sv1HtIfAHiONfviLl+0/UkPdT3
   Mg4YqutiFoSslyJPVuVPKvDWd/CNWqoWvIpGr8+WNcITTZDBgoaHwVlTY
   Q==;
X-CSE-ConnectionGUID: IEOcGnGZRyusji+Ds+Bx8g==
X-CSE-MsgGUID: cDqbSFjGQzy8W6J1gc2txg==
X-IPAS-Result: =?us-ascii?q?A0BEAgACawpr/85K/pBRCYJZgld1YENJlksDnimBfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBQKOIwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXJATAgEDMgFGECAxKysZgwIBgnQDuh6CLIEB4DEBCxQBgTiFQogld?=
 =?us-ascii?q?oR+JxsbgXKEf4QXeYV5BIIigQyOZYohSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNbgSsmXQEhgQaBdgKCUYIAAgFGQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQxyORAwHCQvBRcmPBsHg?=
 =?us-ascii?q?QwnHRsXDgIoBhUhC0MYDUgRLDcVGQQ+bgeUEoMcPVGBHxlhFjqlZKERCiiDe?=
 =?us-ascii?q?YwklToaM6pzLphapFyEaoFoPIFZcBWDIglKGQ/gfyYyPQEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:6Ysv3qxu26wA4BLfllV6t+cqxyrEfRIJ4+MujC+fZmUNrF6WrkUAy
 WYbX2nXa62JY2fxfotxOY3j8h5QuJ6Ay9RjT1Y9qFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDJMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGAbGoY3/MlFO3BT7
 v4ZaxwWLTqT1+3jldpXSsE07igiBMDmJsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyeC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oa1YIaJJoTaLSlTtk20v
 2j90WbWOwMLZOPB62OK+SiwluCayEsXX6pXTtVU7MVChVSPxm0eFVsaSFG8oOL8gFS/UtRTA
 0YT/TYqrK50/0uuJvHnXha4qWSI+AYBQdZRHsU+6QeQ2qTT/gCVD3QFSTgHb8Yp3OcxXTEs2
 1qDkt/lCDAqu7qPRFqZ96yItnW1ISUTIGoIaCMIQAdD5MPsyLzflTrGQ8wmFOu+icf4XGmth
 TuLtyM5wb4UiKbnypmGwLwOuBr0zrChc+L/zly/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:pkPLIKoeUw2FoRqdLqW1KzcaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:PXXzYW+SRM9GrIeWhF+Vv285PcsKdFLv9mbNOE25SkpyC5eFGVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AuMfx1Q8sddA+bk6imOdk0wOQf8xE+q6VJkIiqIc?=
 =?us-ascii?q?X6/baF3V/MG2BnDviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="60844408"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:54:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id BAE39180003BE;
	Sat, 28 Nov 2026 05:54:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 70AA2CBF201; Fri, 27 Nov 2026 21:54:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/3] vim-tiny: add CVE_PRODUCT mapping
Date: Fri, 27 Nov 2026 21:54:09 -0800
Message-Id: <20261128055410.1928584-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261128055410.1928584-1-dkelaiya@cisco.com>
References: <20261128055410.1928584-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251473
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

The inherited "vim-tiny" identity has no vulnerability records even
though this recipe builds the official Vim source with the tiny feature
set, so source-aligned CVEs are missed.

Use "vim_development_group:vim" for the historical NVD configuration
identity and "vim:vim" for the current NVD dictionary CPE, configuration,
and CNA affected-data identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89ffb1fec8e7372b6e91ffb0b912f7a69270cf04)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-support/vim/vim-tiny_9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim-tiny_9.1.bb b/meta/recipes-support/vim/vim-tiny_9.1.bb
index e4c26d23f69..426a45ead1c 100644
--- a/meta/recipes-support/vim/vim-tiny_9.1.bb
+++ b/meta/recipes-support/vim/vim-tiny_9.1.bb
@@ -2,6 +2,8 @@ require vim.inc
 
 SUMMARY += " (with tiny features)"
 
+CVE_PRODUCT = "vim_development_group:vim vim:vim"
+
 PACKAGECONFIG += "tiny"
 
 do_install() {
-- 
2.35.6
