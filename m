Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3095FC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 19:05:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1585.1700593539881417402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 11:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F01CFEC;
	Tue, 21 Nov 2023 11:06:26 -0800 (PST)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8E1D3F6C4;
	Tue, 21 Nov 2023 11:05:38 -0800 (PST)
From: adam.johnston@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [OE-Core] [PATCH 0/1] classes: Fix sed command line for passwd-expire
Date: Tue, 21 Nov 2023 19:05:27 +0000
Message-Id: <20231121190528.2655502-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 19:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190988

From: Adam Johnston <adam.johnston@arm.com>

Fixes a regression in passwd-expire, caused by a typo/syntax error when
the follow-symlinks option was added to useradd_base.bbclass

Adam Johnston (1):
  classes: Fix sed command line for passwd-expire

 meta/classes/useradd_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


