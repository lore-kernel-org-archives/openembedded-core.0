Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188FECD98F2
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 10:12:42 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21453.1782036757693369024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 03:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=HHE8uH22;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260621101233e09158f51500020733-k_v1mn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260621101233e09158f51500020733
        for <openembedded-core@lists.openembedded.org>;
        Sun, 21 Jun 2026 12:12:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kKQN7iDPPB5heSXU8RwqYflcdF4mIxrdcCNDnMpD4xA=;
 b=HHE8uH22iD0oHTiv83BxbdoYev0zkoUreXKRqAIMZqPNTX9n9u6l/MtlcgsCapklNVGh5E
 OtYg6IjjaezK1ls1lbu95mhURqsOHwYaLgA8Pz1TVhxUmJcjG392UhEQpCMhrKdQl5rtflpm
 LV2M5s31ytXv6bKKb7I1UwTdQxPrc0g5688EAz5ZVs5hXxhl2gSnLAg8n3q2mwpYt2QuOw2y
 uI6nLBn77XvK5k0DhgJRymfHu7tyesAOW02J7gpFgkJEDwsTdc1ASog6j7v6OKmx+TTNdndy
 A7FAaXS4xcG15iBrTMBrhMaxtVvcAsup0MrGYGVECO3+Tj3Ubc7Ar1MQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/1] fix tests for kernel-fit-image.bbclass: Do not include kernel property in DTBO config subnodes
Date: Sun, 21 Jun 2026 12:11:58 +0200
Message-ID: <20260621101222.669557-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 10:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239258

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This patch
https://patchwork.yoctoproject.org/project/oe-core/patch/20260616220700.41516-1-marek.vasut@mailbox.org/
requires a fix in the oe-selftest.

Without this the tests fail on the autobuilder with the following error:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7316435/raw_inline

@Mathieu would it be possible to pick the patches in the following order as I
tested them successfully on my WIP branch here?
https://git.openembedded.org/openembedded-core-contrib/log/?h=adrianf/fit-improvements-tests-dtbvendored

It's esentially the same as you have it on
https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/master-next-tests
but with the patch here before the two patches from Marek.

Adrian Freihofer (1):
  oe-selftest: fitimage: Do not expect kernel property in DTBO config
    subnodes

 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.54.0


