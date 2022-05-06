Return-Path: <felix.moessbauer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37292C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 09:00:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net
 (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.7312.1651827623846926078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 02:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=felix.moessbauer@siemens.com header.s=fm1
 header.b=eVp187Mp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225,
 mailfrom: fm-72506-202205060900165b10bd8b8f2607c743-yzhvip@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id
 202205060900165b10bd8b8f2607c743
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 May 2022 11:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=o9n1e63BGPx8U+g8lHQDQaYd42rEwBLeXArMzuCmqSw=;
 b=eVp187Mp+5gXutJZlmbMO7q2rS6C57GfO1mYF6nF9MjAsUsn7mObmyZfOTqdH/l5F0H2PM
 9Gsl/vLHPw+VC3rzh1b7s/5hxqZ0F5zOiRR8yeSvO/sZRLBJwTDeqH23DBEb1cHWmqxkiM3p
 Nzxn1xmSSqrHfF4wKZjnKpg6+014g=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: jan.kiszka@siemens.com,
	Felix Moessbauer <felix.moessbauer@siemens.com>
Subject: [PATCH v2 0/1] wic/plugins/rootfs: Fix permissions when splitting
 rootfs folders across partitions
Date: Fri,  6 May 2022 10:59:40 +0200
Message-Id: <20220506085941.145741-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 09:00:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165336

Changes since v1:

- restore previous behavior
- implement support for --rootfs-dir=${IMAGE_ROOTFS}/<x> via fallback

Best regards,
Felix Moessbauer
Siemens AG

Felix Moessbauer (1):
  wic/plugins/rootfs: Fix permissions when splitting rootfs folders
    across partitions

 scripts/lib/wic/plugins/source/rootfs.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.30.2


