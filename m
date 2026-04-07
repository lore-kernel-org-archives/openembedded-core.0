Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB64FEEF50
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 14:29:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82610.1775572151383521063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 07:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LMO9myaF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 43BE74E4294A
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:29:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13337603C7;
	Tue,  7 Apr 2026 14:29:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5674F104500A7;
	Tue,  7 Apr 2026 16:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775572148; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=itRFxn6tPe4mAxBOSBIDsdpr8HmwjGm+3/7hQ6UBvuM=;
	b=LMO9myaFllilImPu4owDN89DGYfdS62fDEwmbTcqpFF732i5MDklt2eO9oXdhWBUezfmM9
	r6bIiELdqc4z9R7JeAjyOFhkGQGzTpr+tGUDGFMhGzaz72SoCjFlMSXH1o01Zun5h7gBmh
	5+y003Q8JykIdENSD4VT5IZAi8xS543BXzRFQVR35si2vRh4eoDI1kdGVq96WgnxdmwZUx
	EnNxfSNMIDm9Od9/EZt1LGZAa4t3Z7NGsFkQ4OZpTaEh3B+eQF/xM8Qr363MFTUSQsJB9j
	8sH6PtEAHTwc4aE6GD4POJi97yw/w/BftHS60gTLBUvbkWM5UEAAFgVJGgHN9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 16:29:06 +0200
Message-Id: <DHMZSNJNLA01.15TXU54LBULSW@bootlin.com>
Subject: Re: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.kjellerstedt@axis.com>, "wangmy@fujitsu.com"
 <wangmy@fujitsu.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260304103203.1649-1-wangmy@fujitsu.com>
 <20260304103203.1649-10-wangmy@fujitsu.com>
 <DB5PR02MB10213FE000AAE2E4B66AD8618EF52A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213FE000AAE2E4B66AD8618EF52A@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 14:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234742

On Mon Mar 30, 2026 at 6:22 PM CEST, Peter Kjellerstedt via lists.openembed=
ded.org wrote:
> What is the status of these patches, which upgrade the GStreamer recipes=
=20
> to version 1.28.0?
>
> I do not see them on neither master-next nor mathieu/master-next in=20
> the openembedded-core-contrib repository.
>
> //Peter
>

Sorry, this series has been lost while gstreamer-vaapi was removed, but
is now back into my branch.

Thanks for the ping,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


