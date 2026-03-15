Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92112D58B29
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:51 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28371.1773579761622847643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Hfsjt30Q;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1032; q=dns/txt;
  s=iport01; t=1773579761; x=1774789361;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fR80HswlHxVzhzBfzC6K/HWCYsqT7HorCGsu+t4E2ik=;
  b=Hfsjt30QfPe2oaZ47ZHsMiLM27QoVpRKpWnqMe92oKKXSQazX/Svc39P
   CcsXUVuaduyC3pvINR4z5UBvcU7XK58AeAe6kn9DDBkNVALYKxLJIm6vb
   An8fTVi5ibniz+82AVOU0sVXbjeoACjzdJ1Z2021jiKjsjcDH0nnfNVIn
   QOc/OXnaPAolEnZ23Uik8nq/qBdL4RHqi686NsSTRCc97nIssnQG02ryx
   WaR84V9NFDKy/FWw37Gl5xa0c7w+XDgaBL3qNn0Kb5JW7eqxVDawHEqXe
   wxlJWMuC2tlJdSgeo0ybhqmZkHq4ghb8/hrBEtwECB3vmPuxuSsfGK/Gl
   g==;
X-CSE-ConnectionGUID: pWMBIagZROej/1vbzpwNBQ==
X-CSE-MsgGUID: ObcHSGiiRRS/4kVbNgzvMg==
X-IPAS-Result: =?us-ascii?q?A0CtBADarLZp/4v/Ja1agjQQGoJED3FfQkmUKoIhA54ag?=
 =?us-ascii?q?X8PAQEBDz0UBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZbAgEDMgEYAT0gMSsrGYMCAYJzAgERtSyCLIEBg?=
 =?us-ascii?q?ygBgVO1CAELFAGBOIU8iBl0hHonGxuBcoQHdoJhBBiCE4V3BIIigQ6Bf5EtS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB416PYIzAT1RLIEbaAGmHKEOCiiDdIwelToaM6prmQaOC?=
 =?us-ascii?q?ZZQhGiBaDyBWXAVgyIJSRkPjl+IVcEtIzUCOwIHAgcNAwuTZQEB?=
IronPort-Data: A9a23:siaUs6DFORmHahVW/23iw5YqxClBgxIJ4kV8jS/XYbTApDMh1DUEm
 mEZXTvVPamKM2Xwe40jOtng90tSu5LUm9M1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCSC/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT8hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxMUlaENQ4ZW7
 86apF2I1juxEyUFU7tJoZ6nGqE+eYM+CCDV4pZgtwdOtTAZzsA6+v5T2PPx8i67gR3R9zx64
 I0lWZBd1W7FM4WU8NnxXSW0HAlmAohs2bbIE0KYvM7UllPMYWPz5d9XWRRe0Y0woo6bAElU/
 vAebTRIZReZiqfumvSwS/JngYIoK8yD0IE34y47i2qGS6x7HNaaGPSiCdxwhF/cguhCEPvEb
 tYZbhJkbQ/LZFtEPVJ/5JcWw7/31iauKm0CwL6TjY096Ejo4w1w6oLWd4bWRNasStdLu0nN8
 woq+Ey8WHn2Lue3ziKI9H+pjOLDkS73HYkVDrCQ8v9xnEbVwXQeDhATX1a3rfS1zEmkVLpix
 1c84CEiq+02sUesVNS4B0f+q3+ftRlaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:9+fhTqhJoXVenYUOMF2kAjBodHBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AcC1wn2gHoPsK4K5WFWURzanCwjJuakL45lbZLH2?=
 =?us-ascii?q?CLmtrD+SLQ02I54VOqp87?=
X-Talos-MUID: 9a23:TyozXglCGxSsU3xmz30bdnpFPsxI2IuvCXo3qtJauPeOEyNiJRKS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="707879182"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:40 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id AC272180007CD
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:40 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 5B29CCC12B5; Sun, 15 Mar 2026 06:02:40 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 4/7] valgrind: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 05:59:45 -0700
Message-Id: <20260315125948.3002743-5-deeratho@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233112

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require valgrind to be available
as SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.26.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
index 6f7d67df0e..50421e8621 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
@@ -114,3 +114,4 @@ RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
 #
 # It needs something like - https://bugs.kde.org/show_bug.cgi?id=369723
 TOOLCHAIN:riscv64 = "gcc"
+BBCLASSEXTEND += "nativesdk"
-- 
2.35.6


