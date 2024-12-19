Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD141E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:45 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.138065.1734639943211622746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nCxjVrEC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241219202541c77875b84d9b29093d-ovztdi@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241219202541c77875b84d9b29093d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zckjIG4ArPlEhgmqUritxRmajoxQPfJpF7IrFoWHt70=;
 b=nCxjVrECpeWnkybdtbGy25Cby+AJV09P/mQj1Z7sDid0Bqxvl1xys7NWq4BMFdvErm8u6H
 Sk8DDJPRbRYFeVrrQolPQGYriAdp5vr9GjEKWDqIIeuNpQ43qPprhVvxrtVphIz5SE/HVv5D
 fuXJGt5jolcq6TLKAGTJXxRMD0NfINgGxrzXELeRM+TIgO9YaDGcqV9mc2Hho2CTTkELTmsG
 I3VP3PAthC6yHVSnS0+3A1cUyjs8hSxhs5oB5o5bbYBHxQp7Tj9z+XlvhHUvEhSG6eqvBaBM
 Y5Q9gJzN7V5oVQZlQ5UI46oqLc54o7Q+Q9ADFoFG5DeAr7OpnKye9f8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 04/12] spice: ignore CVE-2016-0749
Date: Thu, 19 Dec 2024 21:24:15 +0100
Message-Id: <20241219202423.346033-5-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208937

From: Peter Marko <peter.marko@siemens.com>

NVD tracks this as version-less CVE for spice.
It was fixed by [1] and [2] included in 0.13.2.

[1] https://gitlab.freedesktop.org/spice/spice/-/commit/6b32af3e1746988bb5a5123263bcf61b65e5be7e
[2] https://gitlab.freedesktop.org/spice/spice/-/commit/359ac42a7ac02dcd1013757559292006647cd5c4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 419316a26e..5e6d8584e3 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice;branch=master;protocol=htt
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2016-0749] = "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] = "fixed-version: patched already, caused by inaccurate CPE in the NVD database."
 
 inherit meson gettext python3native python3-dir pkgconfig
-- 
2.30.2


