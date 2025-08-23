Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5F8CA0EE4
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 20:48:16 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.4876.1755982093424577887
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 13:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ow74u9tj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202508232048073ac86ed6d0ed68d84d-qs9qjz@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202508232048073ac86ed6d0ed68d84d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 23 Aug 2025 22:48:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=h0QY9125e8Jl4yRkHR5q81Pcrmjts4aQSDEKt64hXQw=;
 b=Ow74u9tjJbBnckdMcWRNOlVtjD3nyn1LhQ/zyqN7egE3v0i7nQE85WSMjATTchT/WHoFuX
 8pemWV+bDZbCyHq9VL4zUtLNumOfnFPMJsi98YQK1KstmA5EFO9D3l15W1k5luXYXf4TsjTq
 SCU2+RuEcUvr8xHq7hhkSgw6yyj6x7m0sN1OmhSaTLVWvVZU4pQI8Qt0XksNvJFlljRFscYn
 hWrilEotfvBydDxKIXBuP++kzAOTJklTOqfopNnFtKFDWs5/D/OfkoBmY7YJYRK0tOxVCJyy
 AeBvD7J9aW3f4guRGMIKAJBx/6sSbHfrmtY49aae44GjyifMXRmW9TqA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Ross Burton <Ross.Burton@arm.com>
Subject: [OE-core][PATCH 0/3] Mark some CVEs as fixed
Date: Sat, 23 Aug 2025 22:47:04 +0200
Message-Id: <20250823204707.35257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 20:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222352

Looks like Red Hat as CNA does not care about versions much, only about
their erratas.
Feel free to drop these patches and send the gathered informaton to
them to fix in upstream CVE databases.

Cc: Ross Burton <Ross.Burton@arm.com>

Peter Marko (3):
  gnutls: mark CVE-2025-32989 and  CVE-2025-32990 as fixed
  icu: mark CVE-2025-5222 as fixed
  libxml2: mark CVE-2025-6170 as fixed

 meta/recipes-core/libxml/libxml2_2.14.5.bb   | 2 ++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb | 3 +++
 meta/recipes-support/icu/icu_77-1.bb         | 2 ++
 3 files changed, 7 insertions(+)


