Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75966C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 16:52:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2635.1707324747655652356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 08:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D664B14BF;
	Wed,  7 Feb 2024 08:53:09 -0800 (PST)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.199.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3F533F762;
	Wed,  7 Feb 2024 08:52:26 -0800 (PST)
From: vikas.katariya@arm.com
To: openembedded-core@lists.openembedded.org
Cc: Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH 0/1] Add missing runtime dependency for bmap-tools recipe
Date: Wed,  7 Feb 2024 16:52:18 +0000
Message-Id: <20240207165219.825246-1-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 16:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195073

From: Vikas Katariya <vikas.katariya@arm.com>



Vikas Katariya (1):
  bmap-tools: Add missing runtime dependency

 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.25.1


