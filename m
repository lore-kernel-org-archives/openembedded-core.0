Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3333.1794508488349466837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 10:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=oeDXbIfZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261112183446e3a522fa4d00020712-tedlxh@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261112183446e3a522fa4d00020712
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 19:34:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AXGU9QuA2OB05poIpTRfZxS/ipvKlzoa0jXD7n2sTZg=;
 b=oeDXbIfZrADHRAAg4D4ppEjl7PFyQ9605IIRvJMAamzIS2AAD5GrnhJYlaPPgQ5OiunEhp
 +RVz9BxRahNUlCeR7zCuCSJQd79Vj6gxuhuSYlP7vf8EGByhy4RHEQlKGJT2bxgmU6GL8VS1
 H3oaSfSD6CPldksPBV4OqeiqGCefjG4MyCdwQHeLgo+Zi5Z+eaqsUg0hs6WFKlbd27zxCl0T
 1/0jh4Qcxjk4II0VCvwLTivnMqTJBd8RTtR+VKVDol66bC7OQZvx93nTOnKgh2Y2xF4lixyt
 iQ0lem8alz0iOMQEBhiJsH3yUqzYJzkOCIx/3vEH14WZ0jZpLj94hqPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] graphene: set status for CVE-2026-17025
Date: Thu, 12 Nov 2026 19:25:20 +0100
Message-ID: <20261112182520.442240-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 18:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250114
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

CVE description says "The Graphene theme for WordPress ...".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 0d526d3d76..2878a7ddc9 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -29,3 +29,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-1984] = "cpe-incorrect: issue in a WordPress theme"
 CVE_STATUS[CVE-2026-81281] = "cpe-incorrect: issue in a WordPress theme"
+CVE_STATUS[CVE-2026-17025] = "cpe-incorrect: issue in a WordPress theme"
