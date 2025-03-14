Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD374C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 08:43:43 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.9203.1741941819061348107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 01:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=j2QmGjEi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250314084336f9858e203b54e4ecab-fgbnt3@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250314084336f9858e203b54e4ecab
        for <openembedded-core@lists.openembedded.org>;
        Fri, 14 Mar 2025 09:43:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OhgwLXpaTNTyX2krnZMXmFLzDXqbaKgJhwF+2cFWUx8=;
 b=j2QmGjEigPAbONmBTKSu4Dgs/j728unKegT6TDID4sZoLnWnOt5suVjrXxIER154ncaH5v
 YWSG2CmX9ninJgC/314oRhleLrAeq+j8iXC0adp5+Qe9M8c+CoB5IzthjFrb2/XsbD0gDCPn
 zrzZRLx+39q6LhDcnRL9MvTETOyU87MHZDgIViBxzeWbMuZkBmR6WyuQChUdnsA0LTuPHzi5
 EyMjRfHAptecVkNob8uvqbpnJTuvdFNV9wiwJ4hfYKxZGI6sGa9Jm7OGs+wjzNVppZIOX89I
 KQDgbc1fSrakpcjAAXGFnpe5x61trzJ6xjHuMUIPGDk/IJ+Lxm21MeBg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] expat: upgrade 2.6.4 -> 2.7.0
Date: Fri, 14 Mar 2025 09:42:39 +0100
Message-Id: <20250314084239.2610798-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 08:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212823

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2024-8176

Release notes:
https://blog.hartwork.org/posts/expat-2-7-0-released/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/expat/{expat_2.6.4.bb => expat_2.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.4.bb => expat_2.7.0.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.7.0.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.4.bb
rename to meta/recipes-core/expat/expat_2.7.0.bb
index f383792793..f3659d9f90 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "8dc480b796163d4436e6f1352e71800a774f73dbae213f1860b60607d2a83ada"
+SRC_URI[sha256sum] = "10f3e94896cd7f44de566cafa2e0e1f35e8df06d119b38d117c0e72d74a4b4b7"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

