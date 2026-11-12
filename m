Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3175.1794508042026093980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 10:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Lapp6RiN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261112182725d70263e4620002072b-lp_zlc@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261112182725d70263e4620002072b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 19:27:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AXGU9QuA2OB05poIpTRfZxS/ipvKlzoa0jXD7n2sTZg=;
 b=Lapp6RiNhh5hi31I7zfzrxVbwFIM/u9/54YE1vao3ED47atCLfFMQGbhv0i1oVffxHVrc3
 hDn/pCbDDXqXoE1Dk4uPkZ/1REqGmGGdqkiegKoACsZbDhNXh6R0j4cKxI/TVzIawDuHY9Cr
 iQaloM7fHe1Q8rjnrxPNW1096bKZNvR1S7hEPitHQYIAJV5Egz+Zltr2K2NLTnwSne2JuX+I
 XA1WApyOovYP6vHZH3b4y0ca0hvXrGvmUopla9XPpLWF+Klie4f2qg0A2CLMspom/kHvQLZY
 IKTgFSiEO7Njx/fqUuHmp/oIq3w9GrXiSn3j14lv2bcD06LQIK25if8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] graphene: set status for CVE-2026-17025
Date: Thu, 12 Nov 2026 19:26:16 +0100
Message-ID: <20261112182616.442624-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 18:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250113
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
