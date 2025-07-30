Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F75EC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:57:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.31415.1753869456952010464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lrIcD9jP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE37743293;
	Wed, 30 Jul 2025 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753869455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abylkHza2ei193AYcUDyo0LNHejTLUnZQlgDnlJigmw=;
	b=lrIcD9jPyIp05h/+4rD+g495lORZFhms99zXxP8JBcl7LWf2x3BeTMJ3r5E9WBoGSVC2Yq
	JhnpnuqvHEL53cAraNT8j9nblMO9uzIEDkNf87Q/YOHRcIRtkvOgR0dOMX8JZPOQ3ndk+R
	JOQ7VtNjxfptRDU1fX6iB5biCv/GPMFajLhiNXzc1DzkkBWMGkXDjEiHyDxw4ZKzA9nbkc
	A6lNOhkdVNY8Aw4spyeGMOt3V2E/0BGXlRnzIO2xKtQZeRWgb57pRZ+SgokjzrtJInM0yD
	Uqvu5Vm15g39cCChgkt4Q/EDbe+LU1tfWSagoTDY6liyo/57d/GrFeOmOIj2sw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 11:57:34 +0200
Message-Id: <DBPAU0F861HS.1KAH0JN9LXQIM@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] spdx30_tasks: Change recipe license to
 declared
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250625222916.11663-1-JPEWhacker@gmail.com>
 <CAJdd5GaM-WUiRkssxh-WXWmUhSZnTnay1qp50qH4s-1Rd8iB7g@mail.gmail.com>
In-Reply-To: <CAJdd5GaM-WUiRkssxh-WXWmUhSZnTnay1qp50qH4s-1Rd8iB7g@mail.gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueegvedttedvvdekueevgefhieffhfejkeduudeigfeghffgtdekteeuhedvvdelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheplffrgfghhhgrtghkvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguv
 ggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221116

On Tue Jul 29, 2025 at 9:34 PM CEST, Joshua Watt via lists.openembedded.org=
 wrote:
> Looks like this might have gotten missed?
>
> On Wed, Jun 25, 2025 at 4:29=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com=
> wrote:
>

I see it merged: https://git.openembedded.org/openembedded-core/commit/?id=
=3D561447c7cc14

