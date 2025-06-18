Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32183C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 16:55:37 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by mx.groups.io with SMTP id smtpd.web11.8561.1750256179578133275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michaelestner@web.de header.s=s29768273 header.b=KIMvif27;
 spf=pass (domain: web.de, ip: 212.227.15.3, mailfrom: michaelestner@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750256177; x=1750860977; i=michaelestner@web.de;
	bh=5fi3obSxwXyPrcy6sogJs51OYDlrPcBHjf1XKfXz/e4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KIMvif27UQikyHINhn1ppO4JRigPk99E6h5tu0DkdVbbyiP6v9DokW350zEFCekm
	 oIYlK0sUGBtFcW2n3gOBX8FPF4L00iOLjVQDCfI/09IHUJohIAZSdNYEv6qme3lY0
	 lEQwW9Tza3iFQ5i8xlYpF0JwMsk6gqzn2vwyMnup8b69To48lnGIxE75OqFR6QczT
	 pE32eysW2GD8lbK046Dk3JIjuql3RhG6CdcShdSDIhCQN+iv1a6Fs27HFrlW99RD+
	 L98mgE6jC+a8ka3jA8Z5ZcUTgVwAds6BRNTfs+R2Fw/BFjQNwQRVcVg/eea3unxAO
	 s5wUSk5x5VhDE4Y+LA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from del01453.ebgroup.elektrobit.com ([130.41.201.208]) by
 smtp.web.de (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1M8kEP-1uNmym2Xq5-00Cr0M; Wed, 18 Jun 2025 16:16:17 +0200
From: "Michael Estner" <michaelestner@web.de>
To: openembedded-core@lists.openembedded.org
Cc: Michael Estner <michaelestner@web.de>
Subject: [PATCH 0/1]: Add nilfs-utils
Date: Wed, 18 Jun 2025 16:16:10 +0200
Message-Id: <20250618141611.257918-1-michaelestner@web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:3atSXVpC0V6aXnqUW9bjKWmHAFbbgNtacAh0xTiDbN0GDM/xTCa
 QD8omH/Vp3KMhFtcG1LaWijj3nEuoCpu/ZQ4EkiCA7IrYdYnQoLx7vWkyNNz9il8xFVsUkk
 ex5XkpkQKlN3+UaEAWu8CybWkBZD7wJjLxAdIC2hjJ7j7t7gxtwt477S/xDyRL8iGvq2/9o
 a8ydpX4DVjvm423B37laQ==
UI-OutboundReport: notjunk:1;M01:P0:uBPnGzz8k7g=;oMd7rTXdXTkfszfJoelGVm54Ehb
 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
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 16:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219025

I want to add the nilfs-utils.

Two things need to be clarified:
* Not sure if the files are added in the right subfolder
* If no one will take over maintainership, I can step in as maintainer.

If there are any further concerns then please let me know.

Michael Estner (1):
  [Openembedded-devel][meta]: add nilfs-utils_v2.2.11

 .../nilfs-utils/nilfs-utils_v2.2.11.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.=
bb

=2D-=20
2.34.1


