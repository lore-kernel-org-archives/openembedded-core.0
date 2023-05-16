Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DAAC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 20:33:25 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web11.25772.1684252606195292867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 08:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pm.me header.s=protonmail3 header.b=QOL1BRaI;
 spf=pass (domain: pm.me, ip: 185.70.43.16, mailfrom: antoningodard@pm.me)
Date: Tue, 16 May 2023 15:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1684252604; x=1684511804;
	bh=l6qlh2oWDvhY4hQJ/Y5nzIF9QF3dfp43jTt4oD+w1js=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QOL1BRaI+LvTouW9QVETD99cBwM23W7q6LfB/Hc6iZLPRPricn33ubYK8Q/0WUoql
	 kz+qrZkBytrU1ITbvaXVT7KCR0hxjgpx2UfCqz2N7VQxHRsLmVizuIr68HHX96ku8+
	 H8hKAZjQ0IsR2cPCQgHCQBK7drdO97TCh4Caf/OmyztgvXsdcZqH3fmS6swJPrIN24
	 V7Z669XSLwaFJ4yFDGzRFqGif3h2RFRYja3UWfMQgglMIKXZ9wqWJXjuCAfcrBx/Rx
	 7Xm0/G4e9+DESy15IgROdLgUfZmlV+Vc4gTbxwgoiSAnSrXImvfXEgDkxVK0+61LmK
	 IeUJVdshzS7Cw==
To: openembedded-core@lists.openembedded.org
From: "Antonin Godard" <antoningodard@pm.me>
Cc: Antonin Godard <antoningodard@pm.me>
Subject: [PATCH 0/1] archiver: move exclusion logic in a dedicated function
Message-ID: <20230516155545.298359-1-antoningodard@pm.me>
Feedback-ID: 17651652:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 20:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181421

While extending the archiver class to deploy licenses next to the other
tarballs, I was forced to duplicate the logic in archiver's anonymous funct=
ion
in my own class. Instead move this logic in a separate function to avoid
duplication.

If extending archiver to deploy the licenses of the packages in a tarball (=
by
reusing the license bbclass) seems appropriate in the archiver class, I can=
 of
course send another patch.

Antonin Godard (1):
  archiver: move exclusion logic in a dedicated function

 meta/classes/archiver.bbclass | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

--
2.25.1


