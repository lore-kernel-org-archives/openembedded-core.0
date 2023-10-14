Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F89CDB474
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 08:52:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.59258.1697273536118275152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 01:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d9VN+zff;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D709FE0007;
	Sat, 14 Oct 2023 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697273534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9tsJES0OHEz5CC8E15FPrcTKy96c11G4e7QwHOs0Hc=;
	b=d9VN+zff1tDOv/vr8trfox2tezHef1cnRY7SBklZVqJnxEOVYNXYg3K5gBQFkgE9yjpscq
	0zDjBHEXQB2aY0JNgrV4k+8FhwS94Kn1iDBLUpkBTs+c42HyaP3Nh3evwlymZTCPHA6j59
	D71XF+Phf0GMj2qPNDNpT1LmibGa4sfqb5wvlDfNjXNNEkR+0c9+VB2TwN7KrQ/brd6WJ5
	NsxvZ7ALytM0jLmKfBnO8URmnrvs1oh0krDsHN57lUHZoxbfQrkmDonb7Rbu0bK+ZtpdQR
	cIIKAYOvYfeEkJnJ+6xBKN95JwFz2Kq2k+R3WJ7UBbydncRPnvg4kvV55s1C8A==
Date: Sat, 14 Oct 2023 10:52:08 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Johannes Schneider via lists.openembedded.org"
 <johannes.schneider=leica-geosystems.com@lists.openembedded.org>
Cc: johannes.schneider@leica-geosystems.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Jason Wessel
 <jason.wessel@windriver.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] base-files: profile: allow profile.d
 to set EDITOR
Message-ID: <20231014105208.2d70c1a4@booty>
In-Reply-To: <DB6PR06MB400859907A9D2543961D71D5BCD2A@DB6PR06MB4008.eurprd06.prod.outlook.com>
References: <DB6PR06MB400859907A9D2543961D71D5BCD2A@DB6PR06MB4008.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 08:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189111

Hello again,

On Fri, 13 Oct 2023 10:27:34 +0000
"Johannes Schneider via lists.openembedded.org"
<johannes.schneider=leica-geosystems.com@lists.openembedded.org> wrote:

> From 0013c8a6482018d5476e4eb2f4d537c96551e0c6 Mon Sep 17 00:00:00 2001
> From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> Date: Fri, 13 Oct 2023 08:28:38 +0200
> Subject: [PATCH v1] base-files: profile: allow profile.d to set EDITOR

In addition to my previous remark, I noticed that your e-mail is
formatted in an incorrect way. The From/Date/Subject: lines inside the
e-mail body suggest you probably manipulated a git-formatted patch in
an incorrect way. You should review the way you are sending patches,
perhaps you only need to call 'git send-patch -1' or similar instead of
some manipulation you have been doing here.

Again, you don't need to resend for this tome as I have fixed it
locally.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

