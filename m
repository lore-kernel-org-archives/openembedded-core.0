Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51B8C77B7E
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 06:59:46 +0000 (UTC)
Received: from webmail.gomspace.com (webmail.gomspace.com [79.171.149.170])
 by mx.groups.io with SMTP id smtpd.web11.13568.1682665178754211820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 23:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gomspace.com, ip: 79.171.149.170, mailfrom: mns@gomspace.com)
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Apr 2023 08:59:35 +0200
Received: from mns-T460s.gomspace.lan (10.0.8.155) by DK-AAL-EX02.gomspace.lan
 (10.0.1.86) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 28 Apr 2023 08:59:35 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-core@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [oe-core][master][PATCH 0/1] systemd-systemctl: fix instance template WantedBy symlink construction
Date: Fri, 28 Apr 2023 08:59:32 +0200
Message-ID: <20230428065933.3166992-1-mns@gomspace.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EndpointSecurity-0xde81-EV: v:7.8.4.270, d:out, a:y, w:t, t:8, sv:1682623358, ts:1682665175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 06:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180506

Issue was reported a while ago through https://lists.openembedded.org/g/ope=
nembedded-core/message/178423

The patch is verified using a few services constructed for the purpose, ava=
ilable through https://github.com/mnsgs/meta-systemd-test

Martin Siegumfeldt (1):
  systemd-systemctl: fix instance template WantedBy symlink construction

 .../systemd/systemd-systemctl/systemctl             | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

--=20
2.25.1


________________________
This email was scanned by Bitdefender

