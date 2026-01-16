Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DD8C982FF
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:40:07 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5855.1768592399937058093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Sr5WVhgh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202601161939583df1be3830000207d0-mexfyq@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202601161939583df1be3830000207d0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 16 Jan 2026 20:39:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2uwDy0WLCwOyI/ZppD2YaFkQOq89i1L1uKn5aUDA3RQ=;
 b=Sr5WVhghgRDG2dIQMtydNQXZsyllF+/FI6YhtGvi9w+UCoq278dV3sGXu0oOqXd9XxZGW4
 fnl6cAGH1g0v5Fumsrw6PsI4alQejpBmPnx0D5e+HiJp6OYDL2iHU+L4UFWqzGQHoZfkLbH4
 jaDEZNaGpNpkL1B1sPes2aNrD0reGp5f48z2uLt6H0jz7OwYAbFAC6CS5zH+NUO+m0CAisv9
 Jy/FFpzEw/3iDacx7M+BzsmNcyLQOzzv7zA6pKBJtm80dHTwYEdSpOefu5ow6/6rkeMBOYuE
 YdMmB4mGyagO3h/tvB704zYCcOcpEMlx5WbDY1F3gMPlxiTEl4mvhFag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] zlib: ignore CVE-2026-22184
Date: Fri, 16 Jan 2026 20:39:56 +0100
Message-Id: <20260116193956.1015818-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229566

From: Peter Marko <peter.marko@siemens.com>

This is CVE for example tool contrib/untgz.
This is not compiled in Yocto zlib recipe.

This CVE has controversial CVSS3 score of 9.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index e6a81ef7898..8ebc6befc2b 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -48,3 +48,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-45853] = "not-applicable-config: we don't build minizip"
 CVE_STATUS[CVE-2023-6992] = "cpe-incorrect: this CVE is for cloudflare zlib"
+CVE_STATUS[CVE-2026-22184] = "not-applicable-config: vulnerable file is not compiled"

