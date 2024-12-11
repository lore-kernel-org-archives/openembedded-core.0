Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50395E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:10:55 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.1489.1733940648824398020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EOOo9vO0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241211181045c41ab573fe067fb5d3-x_4i9z@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241211181045c41ab573fe067fb5d3
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Dec 2024 19:10:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YDYiTrzRfoXeT/6Qh9ges847rpEAFGoYCWcjZHN6a0c=;
 b=EOOo9vO0CNDUoLFJS4rqtPxsLpVUcIrQf0nnrzyujq2bDJNEBkp7ZtjHOypTuAiOqkD0Yl
 ybysDs6ZVEqhffS59i9AxCujoVjeplm7/BotIe2HjJueIaNEtHcGzQJJoW8d+RwP1nA+MBh9
 h1aK1aAcGNvtOKS1dNl0nKEdJM0ULEII5hN4V/ejGeYAdmMQdMz/vzJWYIFUXrVFlnzZ6n0c
 TAq+fuN+TLmNyJFZxWaRYjElW4T3XJ/KBT1AvFLL9vbaxOjlNB2tpT+qsK8/BCJANeWb3TN0
 Zwf3Ge2Hkb30A6pEfPnK2Y0w5kE/KxIzKqY1rO7xbRxff3J+mJ0tLWew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 0/2] curl: upgrade 8.10.1 -> 8.11.1
Date: Wed, 11 Dec 2024 19:09:51 +0100
Message-Id: <20241211180953.3369248-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208603

Step-wise upgrade as the first step required the most effort
and it was already submitted (skipped due to regressions).

Peter Marko (2):
  curl: upgrade 8.10.1 -> 8.11.0
  cure: upgrade 8.11.0 -> 8.11.1

 meta/recipes-support/curl/curl/no-test-timeout.patch      | 2 +-
 .../curl/{curl_8.10.1.bb => curl_8.11.1.bb}               | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.10.1.bb => curl_8.11.1.bb} (94%)

-- 
2.30.2


