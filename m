Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93046D58B2A
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:51 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28374.1773579769071747283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iJu9oLDL;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=960; q=dns/txt;
  s=iport01; t=1773579769; x=1774789369;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CY9ufdICgZqy85fmAMsSI6Zm+K5e+gUnaQplPX5C1NA=;
  b=iJu9oLDLm/gHlw/XqTYpxtgJcLDPZHKpt9qTCg19iqleHg5uGlL1k9iZ
   c+AukLhOLZK/nPwnbe4XNkM9a4pOcBgmMi/rBNYeEWUKxPNz2CXZD0F/o
   4bzIy3Icprv+mxzUF/UI/vwY1+UPKAeRDU/VsSD+VXzQhLNN8fptbXnuY
   f7bDPWvXfeIVCXkEuNRik3mPPYyeuZmA6FROxJITa3VH4O8HURRG+ALhf
   WL+di9nOX9dMOFGZHD64p/6xILaIWhcn4L7J0nhycidvzVr54iV99nqaw
   FluHt6ic+OaipG8YlqEqs1WA1o4X4gx4jJEyoTDtXMFoqsLeoKO1OCVp+
   A==;
X-CSE-ConnectionGUID: BYDst1ZSRXaFa2fJ9t14Ag==
X-CSE-MsgGUID: 9cRPwrJ4SNySWg86Wul59Q==
X-IPAS-Result: =?us-ascii?q?A0CxBQAXrbZp/4v/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbFrgiyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf4U8BotrSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB416PYIzAT1RgUdoATmlY6EOCiiDdIwelToaM6prmQakWYRogWkBO?=
 =?us-ascii?q?oFZcBWDIglJGQ+OX8xyIzUCOwIHAgcNAwuTZQEB?=
IronPort-Data: A9a23:SYf/RawfUSi5HtEzui96t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUGn
 zEWUG/QPPzYZTShfYgjbd7l8kkCvMfQmt8wTwM6rVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGsHEZYEo9RMO1FH2
 /VCJhJccknfru3jldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCzYYKNJoPXHJQ9ckCw9
 2n8x3vjIE0hEs2k9jXVrE2xgrKepHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:5dSUWKgq5bCfYbPkt8Vg0VCDNHBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AY384DmlchNhRD9W3puXRG2o6AP7XOVfs4GzMen2?=
 =?us-ascii?q?DM1ZgZrTPR33B5Po4usU7zg=3D=3D?=
X-Talos-MUID: 9a23:2KXuywVlE2vkM6nq/G7nvgl9LuU02IK/M38Cwcs5ps3ZZBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690047519"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:48 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 2C81A18000222
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:48 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id CF3BCCC12B5; Sun, 15 Mar 2026 06:02:47 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 7/7] numactl: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 05:59:48 -0700
Message-Id: <20260315125948.3002743-8-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315125948.3002743-1-deeratho@cisco.com>
References: <20260315125948.3002743-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233114

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require numactl to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/numactl/numactl_2.0.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipes-support/numactl/numactl_2.0.19.bb
index 38c09199c3..fd3a5f0a34 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -54,3 +54,4 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest = "bash"
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


