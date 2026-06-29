Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7FEC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:45:54 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91301.1782737145978636517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Z10m/2pN;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1637; q=dns/txt;
  s=iport01; t=1782737146; x=1783946746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UtEyQnuxwGx3IOz50J6BAarJEw2IYOE5VtT4eqzt77k=;
  b=Z10m/2pN9h6czc9Iw21vO0WCOOjW5oxbS4HcRn1wOdrMBExSBk2tLC6v
   Fnmyjv1HJjHB4bqN1IiYeqtIU2h11P3LuHB3ySGPAGkl4S4N8azMPMP7p
   2okoH1AwbPmoRY4tMPGzw2bwwDFBUiqEFIBukhic3HjoahozBNX5F9LfU
   8vTstNfTTY5tlWPnbRgt578sUJuLs3IkBkrvn7+rwePMtwcDXqxYaEZaX
   7l/5VnpSbPxcABWC02rlI3zDjkTfe9g+VvPxkx+I1nLC2F4MqiUOa0ya7
   ebJ2Xz3R/VRjHuDTZaB+P7HYsXPimbV0KKabdhYi6zOCwec/nuJEPm7Ck
   A==;
X-CSE-ConnectionGUID: PJEMffGjRCCBnG2JOTLkjA==
X-CSE-MsgGUID: 6aoBjs84R6KO7MYHFU+a8Q==
X-IPAS-Result: =?us-ascii?q?A0D3AgBFZ0Jq/4v/Ja1aHgEBCxIMggULgld0X0JJA5ZIn?=
 =?us-ascii?q?h6Bfg8BAQEPPRQEAQGBcQGDFI1NAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8Nhl02ARgBLTBcRIMCAYJzAgERtweCLIEBgygBMQWBH?=
 =?us-ascii?q?tssAQsUAQWBM4U/iB90hHwnGxuBcoR+gQWEC4V4BIIigQyBeIF7hVeHP0iBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgWmBBIR9Ix8DOX+BM?=
 =?us-ascii?q?HVYZhUwNYECAREeCoFSJwMLGA1IESw3FBsEPm4HjF4XD4I9PUUMLCCCDByTC?=
 =?us-ascii?q?VeReqEPCiiDdYwhlToaM4QEpmiZCIJZizGWUIRogW8GL4FZcBWDIglKGQ+OO?=
 =?us-ascii?q?Ih+wnEkNQIMLwEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:DIMN3qoFIJEdvc1szwECpwfIqdBeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnUOKyCN2b3Kth3aYmw9RxU6J7UyNEwQVc4rS5jFCoQ8uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8kM35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0t5VLERA+
 9MaEhsmRBas3cCR/Ja4SMA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WzRUr1SarLA6y2PS1wd2lrPqNbI5f/TXHZ8MxBjF9
 jiuE2LRXBgdHt6EmWa/rFGL2cr+vQ3GG4tCLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:nSctJaNYsxp02MBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTnjAsm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:PMOEOGCWOmsta2f6ExFF2WsaFO8nSFb25nH/eW2fNUJqSpTAHA==
X-Talos-MUID: 9a23:nEzhhQWGYaCasYPq/GHlgxtgL5c02fqNLx8ooLUohoqNZRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="502126582"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:45:45 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 1DF091800021E;
	Mon, 29 Jun 2026 12:45:45 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id C4054CC12A6; Mon, 29 Jun 2026 05:45:44 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [master] [PATCH] apt: mark CVE-2011-3374 as not-applicable-config
Date: Mon, 29 Jun 2026 05:45:40 -0700
Message-ID: <20260629124541.65290-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239772

From: Anil Dongare <adongare@cisco.com>

Details: https://security-tracker.debian.org/tracker/CVE-2011-3374

CVE-2011-3374 describes a design flaw in the legacy apt-key trust model.

This does not apply to the current apt recipe in OE-Core because it uses
Debian vendor configuration. Debian security tracker notes this issue is not
exploitable in Debian since no keyring URI is defined for the apt-key
net-update path.

Mark this CVE as not-applicable-config for the recipe. This is a
configuration-based status, not a fixed-version status.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 08b6bac2e4..03da3fbcf1 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -34,6 +34,10 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# Not applicable: this OE-Core apt recipe uses Debian vendor configuration,
+# which does not define a keyring URI for the apt-key net-update path.
+CVE_STATUS[CVE-2011-3374] = "not-applicable-config: OE-Core apt uses Debian vendor configuration, which defines no keyring URI for the apt-key net-update path"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
-- 
2.44.4


