Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF64C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:44:07 +0000 (UTC)
Received: from mail.lindev.ch (mail.lindev.ch [5.39.83.55])
 by mx.groups.io with SMTP id smtpd.web10.6671.1647693846289700584
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 05:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lindev.ch header.s=dkim header.b=j4RangqO;
 spf=pass (domain: lindev.ch, ip: 5.39.83.55, mailfrom: bero@lindev.ch)
Received: from localhost (localhost [127.0.0.1])
	(Authenticated sender: bero@lindev.ch)
	by mail.lindev.ch (Postfix) with ESMTPA id 4BB3941002FB
	for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 13:44:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindev.ch; s=dkim;
	t=1647693842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tyBCVaFaMfPaTp/A+XUt6FL3kZ4jaRjqbqQUYm+G8WQ=;
	b=j4RangqOk+Qi2pGRJauQP0V92uggnoT6R1BBQbaeabuo8SuI4krSVsJNs/yKFPlA9OkY/S
	7OFFFAsJ9631aoITNVEUjoNWRsPoJpcDMyZiHjaJUEpeNXx0uZFRxCcbYME5sdSq2mZ1mb
	DfWu/2jEgOEOzZ4/Er5yfwbgZfoReT8=
From: "Bernhard Rosenkraenzer" <bero@lindev.ch>
To: openembedded-core@lists.openembedded.org
User-Agent: SOGoMail 5.1.0
MIME-Version: 1.0
Date: Sat, 19 Mar 2022 13:44:02 +0100
Subject: gcc 12 support
Message-ID: <2a0122-6235d000-5-7996a200@202814967>
X-Forward: 81.221.122.240
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 12:44:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163469

Hi,
with gcc 12 likely being released next month, I thought it's a good ide=
a to get started on supporting it -- I've submitted a patch that fixes =
building ovmf, will submit a few more as I run into more failures.
If anyone is interested in gcc 12 itself, I've uploaded a recipe for th=
e current 12 snapshot to https://lindev.ch/gcc12.tar.xz
(Probably not worth submitting until gcc 12 is released upstream...)

ttyl
bero


