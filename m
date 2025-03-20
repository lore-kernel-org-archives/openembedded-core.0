Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF71AC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 23:13:05 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.8782.1742512384104838475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 16:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iGRwlgDs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202503202313002558604dccc58a033f-qxzcls@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202503202313002558604dccc58a033f
        for <openembedded-core@lists.openembedded.org>;
        Fri, 21 Mar 2025 00:13:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QwrgUazrHvBlcjSV2zZar/84t7WJ6hoEq7BthYVuRWc=;
 b=iGRwlgDslHY88lEUWdUJVnk8i4f/sTGO9qvnzQBm5/Murb6ixOdlgZ6Jq0i06WCEe3g+vU
 AwekvGSG1zqEgGFwr9piBPkc+iwYPL5MJyoDNDqHEX5kjxeEcpai2NvvvpmBjjw/eC3r33U/
 FPwtE34wn1+g0Bi3LOeNXzzNgeZWi1tpk0MzvEV/kEGncYAtkPgjtfThNN3L44w6r4kI62+U
 4WQfwaDtDuFEtsHirFug4+uIr5hzgQ672AKDlvh6cqL7mYaDWQXHLLuuevFc17OTkNPoX/2i
 5M8/zAYVBy0uKmBFUqWL1NqXjGc60imlBdW6BDcH9HE3VFteHPMFF8zw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/4] libmad: extend CVE_PRODUCT
Date: Fri, 21 Mar 2025 00:12:05 +0100
Message-Id: <20250320231208.1692902-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 23:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213429

From: Peter Marko <peter.marko@siemens.com>

Catch more CVEs by adding additional product per

sqlite> select vendor, product, count(*) from products where product like '%libmad%' group by vendor, product;
underbit|libmad|1
underbit|mad_libmad|4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index e70c8e3ed1..d7cd38fcbc 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -21,6 +21,8 @@ SRC_URI:append:toolchain-clang = " file://0004-Remove-clang-unsupported-compiler
 
 SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
 
+CVE_PRODUCT:append = " mad_libmad"
+
 S = "${WORKDIR}/libmad-${PV}"
 
 inherit autotools pkgconfig

