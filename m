Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A78CEBF8A
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 07:48:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4986.1763279296127785483
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 23:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Gk0AyNrB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D297C12017;
	Sun, 16 Nov 2025 07:47:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66D23606F6;
	Sun, 16 Nov 2025 07:48:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E89D3103719A3;
	Sun, 16 Nov 2025 08:48:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763279292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xvOc40aP/c4fKNIVZnzC9hVRIQENqs86lcxbHz5jglU=;
	b=Gk0AyNrBjUUIFCf1btqhWgrAamyXvjizRTyeQExFzafqiy6xDxExvvSU7YE/fh5fsTw3Ad
	z9UgeRFVF2vii6O13o1rZ6NXct0Oarm5bVWsnDnINXhc4eCg8BZstsOaD2nfoptgtQ3cOd
	A9tzISXHXjH8VrwuihGtSXLMuGBLultVIgd0aC43N4UVPdZsuO1buG06e3AA1RD3+HUuRs
	IfkzQ3tppn4jna/SG4daaCPcYtY22lir+UJicNW9gzLHf0roMRKvgtnVLo0RaFKt5eFuYo
	8MHpl6uQgMwwit+qcAEj0iOVKKRQa9rxqqHtBykg8ItKjNV65T7y08FUXW88eA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 16 Nov 2025 08:48:09 +0100
Message-Id: <DE9YCAT3GO3Z.FI2X2QSNAHNU@bootlin.com>
To: <ankur.tyagi85@gmail.com>
Subject: Re: [OE-core][PATCH v2] nghttp2: upgrade 1.66.0 -> 1.68.0
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <1876328ECE5FEE71.660630@lists.openembedded.org>
 <CADySD0FSgoO8RHnQHt3Eqv5b-SOdbQ3Y7edYPpGcSD79jgRMfQ@mail.gmail.com>
In-Reply-To: <CADySD0FSgoO8RHnQHt3Eqv5b-SOdbQ3Y7edYPpGcSD79jgRMfQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 07:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226466

On Sat Nov 15, 2025 at 9:15 PM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> ping, please let me know if any other issue with this patch.
>

Hi Ankur,

I confirm the patch is still in the queue. It will probably not be
merged before whinlatter is released, but is likely to be merged in
master after the release.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


