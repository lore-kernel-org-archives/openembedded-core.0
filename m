Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69996C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:34:14 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.2990.1668350052130769181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=W+KKaQjp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202211131434083daa1833b1f130b2c5-ipzh_j@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202211131434083daa1833b1f130b2c5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Nov 2022 15:34:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=m984Fq4Md11GPfI4BX1oVFjVsFSK9LTenObsM6c+JIU=;
 b=W+KKaQjpGCAvoEpt4IdT+KDYKcSfEnaKqYi2V21i2AbRVOz3TwP3+xhaRJxL18cdUHut/S
 hr32D9g9gABTAPyOoeWTJIpMYuB59LcBZ9ggcU1Z1gnW4yufJiU6a8ZvY4CPQHw8/KBJccEC
 UrW7vl3tS+dHDtRwig66CNGhMtE1k=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 0/2] systemd: add group render to udev package
Date: Sun, 13 Nov 2022 15:33:04 +0100
Message-Id: <20221113143306.5413-1-peter.marko@siemens.com>
In-Reply-To: <20221108175154.280624-1-peter.marko@siemens.com>
References: <20221108175154.280624-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173204

v2: update meta-selftest static ids

Peter Marko (2):
  systemd: add group render to udev package
  meta-selftest/staticids: add render group for systemd

 meta-selftest/files/static-group           | 1 +
 meta/recipes-core/systemd/systemd_251.8.bb | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.30.2


