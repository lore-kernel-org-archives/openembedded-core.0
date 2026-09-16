Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21234C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:45:30 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10387.1789548324915695856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=WblO7YDO;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=WblO7YDO;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789548322;
	bh=ETYk4479otrD7UCyGQNNXbOQOaG0ypCng3iRtAXxo8Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WblO7YDOCTo8bRDuIaNFXmXA73uZqM0UeR5/xWjoMkyGy/+daSwfYHBtlgmiNW5Lt
	 cD65svZux4vkxI9o9VIr+TiSF5zlQeDnvkzewPj5oBlniilP0q3zn4r3lS+moNUHrH
	 TQ1WeVpmoesQxxxmuzy7f6P+xS7nRJYqAc966j4qiHYkkbWsST51R0e5RCYyIOHJ4k
	 8OtsEpM6/IUKBof5pqKZdLcFYRCkbgKCwuov96tL+1X+I2zDluF3x6BbZ5irzQQECQ
	 fKsnlV8/p4jQZFUz5TDXAhVny8y/SdiHhUEb3bthlZ/Q1qp/Oz6W8pjjKhuZ1sIM0J
	 thtc24Updt1Jg==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 3D04D5F8EA;
	Wed, 16 Sep 2026 10:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789548322;
	bh=ETYk4479otrD7UCyGQNNXbOQOaG0ypCng3iRtAXxo8Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WblO7YDOCTo8bRDuIaNFXmXA73uZqM0UeR5/xWjoMkyGy/+daSwfYHBtlgmiNW5Lt
	 cD65svZux4vkxI9o9VIr+TiSF5zlQeDnvkzewPj5oBlniilP0q3zn4r3lS+moNUHrH
	 TQ1WeVpmoesQxxxmuzy7f6P+xS7nRJYqAc966j4qiHYkkbWsST51R0e5RCYyIOHJ4k
	 8OtsEpM6/IUKBof5pqKZdLcFYRCkbgKCwuov96tL+1X+I2zDluF3x6BbZ5irzQQECQ
	 fKsnlV8/p4jQZFUz5TDXAhVny8y/SdiHhUEb3bthlZ/Q1qp/Oz6W8pjjKhuZ1sIM0J
	 thtc24Updt1Jg==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 23E6A5F784;
	Wed, 16 Sep 2026 10:45:22 +0200 (CEST)
Message-ID: <369073deafe603c14b65b15c43555b68ab9a57c8.camel@emlix.com>
Subject: Re: [OE-core] [PATCH v2 0/2] Add meta layer information to spdx
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: antonin.godard@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2026 10:45:21 +0200
In-Reply-To: <DLGJVF9KWOYU.1N40QY6ZHMK0G@bootlin.com>
References: <DLFQEDRDYFEW.1N7Q1KDCOBXUD@bootlin.com>
	 <20260915130509.2184318-1-dwagenknecht@emlix.com>
	 <DLGJVF9KWOYU.1N40QY6ZHMK0G@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245941

Hello Antonin,

thanks for the reply. I agree, some more prominent mark of this being a
draft would have been helpful. OE does not have any defined prefixes /
markers right? At least I could not find any in the OE contributor
guide.
To me RFC is more of a formal process, but I'll include a [DRAFT]
marker for future revisions of this patch series as long as they are
not ready for merging yet.

Daniel


On Wed, 2026-09-16 at 09:08 +0200, Antonin Godard via
lists.openembedded.org wrote:
> Hi,
>=20
> On Tue Sep 15, 2026 at 3:04 PM CEST, Daniel Wagenknecht via
> lists.openembedded.org wrote:
> > Please continue to consider this as a draft for discussion only!
>=20
> It is useful to mark these kinds of series with "RFC", if you don't
> consider it
> ready for merging. I must admit though I skipped over your mention of
> this being
> a draft in your cover letter.
>=20
> Antonin
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245930):
> https://lists.openembedded.org/g/openembedded-core/message/245930
> Mute This Topic: https://lists.openembedded.org/mt/121260101/5939739
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> dwagenknecht@emlix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

