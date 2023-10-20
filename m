Return-Path: <gs-yoctoproject.org@gluelogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBDBCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:30:48 +0000 (UTC)
Received: from smtp1.atof.net (smtp1.atof.net [52.86.233.228])
 by mx.groups.io with SMTP id smtpd.web10.54234.1697808642990488032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gluelogic.com, ip: 52.86.233.228, mailfrom: gs-yoctoproject.org@gluelogic.com)
From: Glenn Strauss <gs-yoctoproject.org@gluelogic.com>
To: openembedded-core@lists.openembedded.org
Cc: Glenn Strauss <gstrauss@gluelogic.com>
Subject: [PATCH 0/3] lighttpd-1.4.72
Date: Fri, 20 Oct 2023 09:30:23 -0400
Message-ID: <20231020133026.103646-1-gs-yoctoproject.org@gluelogic.com>
X-Mailer: git-send-email 2.41.0
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 0.78
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189528

From: Glenn Strauss <gstrauss@gluelogic.com>


Glenn Strauss (3):
  lighttpd: upgrade 1.4.71 -> 1.4.72
  lighttpd: update init script
  lighttpd: modernize lighttpd.conf

 .../lighttpd/lighttpd/lighttpd                | 19 +++++++++-
 .../lighttpd/lighttpd/lighttpd.conf           | 38 ++++---------------
 ...{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb} |  2 +-
 3 files changed, 26 insertions(+), 33 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb} (97%)

-- 
2.41.0

