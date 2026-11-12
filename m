Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3175.1794508042026093980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 10:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GBuODZVn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202611121827181a9ac95da400020775-y30qus@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202611121827181a9ac95da400020775
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 19:27:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TgQP5hSG8vylyCqtH/uATo9fOneTlBQXyjF8BFCht/M=;
 b=GBuODZVnwlWArJtgHyfzqRf7OyMGPBt1BvhHPH8FEYQuXztfWOkmAkZjorEAhhFbPLkm2t
 docOjRY5KPADh0hjwdVoIryx1KfpCnOVW0kHUlQTZzYOKNRdHCAL5841FXIQjIOUR7GywHkZ
 cEv9xZnx/oh3ttI1f8OOI0uL5emWB88EQyF4ooUFjxZJLZXLt7bdt4jWBPh9O5P5EwmrbLqk
 u75Af34078UOFCcy/jQStWV3Lu1YDTATWWEOlNJbYhOkGFQhXMCtqtDFkjX9x5ugYiNG21w+
 vzFv4+csKP223tlPlnGD9Bqxd6ZKbXqfKrxwYVKAIkY2JbDfDou/niIw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] graphene: set status for CVE-2026-17025
Date: Thu, 12 Nov 2026 19:25:05 +0100
Message-ID: <20261112182505.442138-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 18:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250112
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

CVE description says "The Graphene theme for WordPress ...".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 0d526d3d76f..2878a7ddc90 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -29,3 +29,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-1984] = "cpe-incorrect: issue in a WordPress theme"
 CVE_STATUS[CVE-2026-81281] = "cpe-incorrect: issue in a WordPress theme"
+CVE_STATUS[CVE-2026-17025] = "cpe-incorrect: issue in a WordPress theme"
