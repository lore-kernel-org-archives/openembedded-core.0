Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EEEC44531
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:02 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4966.1784573873450746313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WvnDCQxp;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2978; q=dns/txt;
  s=iport01; t=1784573873; x=1785783473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9VnTC4fri1EfqUt29IR7i1d+tvLKzmZyS4vjQAs2L/k=;
  b=WvnDCQxpg9swWQxnbE8k0A/1QiO1Oew5w21W0szsqWKYRegZnnPcR7BR
   02UHJB1jde5MpU5nOuyhnqOYxeinkoDRcjfzv4tyYhLfWTNwlZQV5Te8c
   l2I3CAwWEQJDx9fD7lpFukM0W93PdseLP638DrdzKXte6a3brQb0UyrVm
   8gb8ChvVpyoWJMVWp4wSlAIBqJsciwrEJdpt+fYQMXfL5G9v5DFnfq+7G
   5iJE5f+5PqXTYUJWvfxB2El5b2mYauDt4bDtia5wra/fUw93VdRM7At42
   Miz0Qhw61CGHTgFxcHyytuucgUTE3NxXgiKkUkEGjm4YP3uDRixK0hgS8
   A==;
X-CSE-ConnectionGUID: kOGKH63RR4iqZvxwBFRG7A==
X-CSE-MsgGUID: yZrOqmVSSiWg9wYsngXHpg==
X-IPAS-Result: =?us-ascii?q?A0BHAgAQb15q/4r/Ja1aglmCV3ReQ0mWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GAo1VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDMgEYAS0QHAMBAi8rIwgZgwIBgnQDEbwFgiyBAYMoAT8CQ?=
 =?us-ascii?q?1DbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVg2mBBYFcAQEDgSQhZYV4BIIie?=
 =?us-ascii?q?hKBWh6PeUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgTqBA?=
 =?us-ascii?q?oR0Ix8DOX+BL3VKdy1pARIXgSaCEgKBOwITAwsYDUgRLDcUGQQ+bgeNQSOCQ?=
 =?us-ascii?q?IEOASoBlhySBoE1n1oKKIN1jCGVOhozqmwLmH2OCpZQhGmBaDyBRwsHcBWDI?=
 =?us-ascii?q?glKGQ+OOINrgX+DFMlHJzILMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:aRVGcanH5LusyR3GoIn6waPo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdW2CHOfiJY2P3fIggOoix8klU7Z/VyYRlTwE//Ho9RltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY4/1cVXXzp0z
 6AZMQITfg+pqdiZn5vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKII4bUG5wLxxfwS
 mTu7lbjJQgfCuekyAWKo22dnenArQPjV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:JZplN6FjbuvyiczypLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AY/EW4Wqff5b5PEUorPkM0AjmUcMCXV79kizqGRO?=
 =?us-ascii?q?5EFR3WKK/Z2W/p4oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AzMwrMw+IwEMqOoectGH9OXGQf9Za+YO3DX42qpQ?=
 =?us-ascii?q?5tJibBDd2NAe9lDviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512661619"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:52 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 7AF6E180001C7;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 1FDE8CC12A7; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/8] openssh: Fix CVE-2026-59999
Date: Mon, 20 Jul 2026 11:57:42 -0700
Message-ID: <20260720185749.4098075-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241477

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59999. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59999

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59999.patch      | 36 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
new file mode 100644
index 0000000000..89b7aa9c7f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
@@ -0,0 +1,36 @@
+From 1c719fa7d0fb0aa335f0e8d5db5d5e5d01c894e5 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 31 May 2026 04:47:29 +0000
+Subject: [PATCH] upstream: DisableForwarding=yes didn't override
+ PermitTunnel=yes
+
+Reported independently by Huzaifa Sidhpurwala of Redhat and Marko
+Jevtic; ok markus@
+
+CVE: CVE-2026-59999
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753]
+
+Backport Changes:
+- Retained the Scarthgap serverloop.c OpenBSD revision identifier because
+  the 10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: b5c13f0746cf079b21f8deba47407fad49ccbf4c
+(cherry picked from commit 8dfe7ed6e2fd988de08df508355a196b956b2753)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ serverloop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index f3683c2e4..c1fe99d12 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -531,7 +531,7 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 4193bc8a5b..efb89d45d7 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-35385.patch \
            file://CVE-2026-35414-CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
+           file://CVE-2026-59999.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


