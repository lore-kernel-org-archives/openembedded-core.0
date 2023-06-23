Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0020CEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 08:46:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.37821.1687509993132650562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 01:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g/Xx51Ee;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687509991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSBQ6BNUBj522ec1d2wjeszaBqwjBJ8hMxl1u5livlg=;
	b=g/Xx51EelA/YG8EgV6qI4TsQr7xnPzxHeEZ3rws49Em/nPRXH3LmRRRErufpS2Sr7TfHgD
	OWN1khFfxesti9jWCTo9SnJDBhvoUBtmAnWWYtEorqvzBWvDnuqfHvE55uUNEsrUev1Xkf
	FdcOMxm+AfrJTn8vsYZfaIlqozVUF9qm4JeB/WQGyvAyXMtHKM7z2DUTxIkgk/opzychEg
	LAh0P5JuckvUF8elYNYNzK9E5Fmhgb9j/kDDcRjBLD8tFWxuoMd6Tqr6X/WjrYfWHeIunt
	RM6fKD+gD3YJv6+TpwBPbKMIaTDBU2CKF6W3W5AIZmoEsqjFkFIb58bzP/kCLQ==
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE1AF40003;
	Fri, 23 Jun 2023 08:46:30 +0000 (UTC)
Date: Fri, 23 Jun 2023 10:46:28 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: =?UTF-8?Q?Eil=C3=ADs?= 'pidge' =?UTF-8?Q?N=C3=AD_Fhlannag=C3=A1in?=
 <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 0/3] wayland/weston upgrades
Message-ID: <20230623104629.2cbf4a53@booty>
In-Reply-To: <cover.1687444823.git.pidge@baylibre.com>
References: <cover.1687444823.git.pidge@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 08:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183310

Hello Eil=C3=ADs,

On Thu, 22 Jun 2023 15:42:14 +0100
Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com> wrote:

> Nothing really surprising here, except we should note that launcher-login=
d is=20
> being depreciated so some thought on how that is dealt with will need to =
occur

Should we file a bug in bugzilla to avoid forgetting about this?

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

