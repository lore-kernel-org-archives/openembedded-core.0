Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96E5C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 07:07:37 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37840.1785740848335933444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 00:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CQO984ln;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1133; q=dns/txt;
  s=iport01; t=1785740848; x=1786950448;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Igwd9A+S2cQkxv1X/wcPsCgwrgUT1T4qkYgyQ4V1wo=;
  b=CQO984lnRmYVKRTmZFkzsXYQPrQSsbuaQ1osP9jra4Oa4RalxVoSNlPk
   dgYk49viysFnEK6ktdGPHK+SX1Q+nu8hqAC7Hvu46qoLGnNvf8CHURptb
   89HTZ6Czp0rEW6ezdW9mZlcBzcw9tdH35ITAxS4uai4a0ROYjwyAu2igE
   CLoOyAN3+bLFMgD0bkIMoswF7GUaQVrR9pStQpjGPWs6/6zZM4BWQ8dlq
   u55m1F70LXJJkeNHPnlmJoZlu0ukhETdALc4vjRz0Cj4z7fqEC0+y95pk
   FRTq/Gdag+mmS18aHSVKSlzPAWhfT8eDs5dMnJG1FuNwTfqGyNmy60BXM
   g==;
X-CSE-ConnectionGUID: w9lAqHQnScKkk4ug42ZmdA==
X-CSE-MsgGUID: CNzD5mGRSm6hq9wxU9Rjew==
X-IPAS-Result: =?us-ascii?q?A0BAAgBNPXBq/5MQJK1aglmCV3ReQ0mTWQFPoD+Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGSbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZchxMBdlwdASaDAgGCdAO9Y4IsgQGEfdsuAQsUAYE4hT+IIXWEfCcbG4Fyh?=
 =?us-ascii?q?H6FEIV4BIIigQyBeIELjyxIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?Q0bBwWBHYErLIRTIxk2fIEvdUp1LWoSF4EagxUCgngDCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?41mIIJEAYENpi2CIaEPCiiDdYwhlToaM6psLphao3JohGmBaDyBWXAVgyIJS?=
 =?us-ascii?q?hkP3lwnMj0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:Pevxtqx61szhDbUAlaZ6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVVx
 zMZDDiFb67eY2amct90bYy3oR4D6MXUx4A2TQRvpFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkajlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJF5nOaQB2t9xOmpt9
 v9ENT9RNCKGi8vjldpXSsE07igiBMDvOIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUifC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQugeSyaIOPKoXiqcN9tWCKi
 j/D0F7CB08aLY2A2QfUyHChmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:zMHM/qCi/G/vyc3lHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:bNQvSWAtkO4W3hr6EzY28GcNOvkjSXb+z3SMPkDkU1RsRJTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A/8K2gAydYZBD4eCeTWCKSkGSPnaaqI+IGmxQlLo?=
 =?us-ascii?q?8gMzaNTUhJCeg3Q61T5Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,202,1779148800"; 
   d="scan'208";a="794701281"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Aug 2026 07:07:27 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 911F41800025B
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 07:07:26 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 267C6CC1611; Mon,  3 Aug 2026 00:07:26 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] python3-pip: set CVE_PRODUCT
Date: Mon,  3 Aug 2026 00:07:16 -0700
Message-Id: <20260803070716.1402767-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 07:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242611

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT is not set for python3-pip, so cve-check can miss or
misreport pip CVEs. CVE-2026-8643 is reported in NVD with pypa:pip.

Add CVE_PRODUCT to match the NVD product name and report this CVE
correctly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a486abd4889ad03e1a8ddd5311595f3ece7d61b6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-pip_24.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index cf123a5d23..51fff41e25 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -41,6 +41,8 @@ do_install:append() {
     rm -f ${D}/${bindir}/pip
 }
 
+CVE_PRODUCT = "pypa:pip"
+
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
 	# Keep them only when building for a Windows (mingw) host.
-- 
2.35.6


