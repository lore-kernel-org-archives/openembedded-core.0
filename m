Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB8FF3D61B
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 18:00:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33938.1774807232794148703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 11:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wnvs5qfM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 32655C58770
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 18:01:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 630485FD24;
	Sun, 29 Mar 2026 18:00:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AA561045019D;
	Sun, 29 Mar 2026 20:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774807229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G1Pc6UsIJvGWod5U8VnmRc2LKhpVtCcFCtEHLY6n1W8=;
	b=wnvs5qfMX2Hc1vNCNpHHYsw3IcoXYMbWkplW8WUR2T5llg/+yapIVN4e3TrEs/8Zx2RQjt
	ruHw3kv0zY4RdHAYSGQK9XCZGQ8sEppsY8Efzw5cgS1O4xV3Bt3OFDnKFnKig/oGCqYiNT
	3ZEAsRA1zmuP114J5K+vfEOjZ6nE2g5ag7vlFgCD6V+wXaleEeM3wN7P5plRtTbOJL3hJZ
	Xubh+xas9CR0sWVPKQG5tVp4XAQ5cSSpCX3IRlpO3/oQIS/yHEfsMNpoog4Vp6IHkgw7gH
	HvR0mD2WrZIQewA7q7cdPqJC5P/13ujs4AMeVtQuaHrbSsBk4OBrlwEhOsopVw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 20:00:28 +0200
Message-Id: <DHFGNKZCOKBA.37T7RS6DYRX8K@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/7] clang/llvm: Upgrade to 22.x major
 release
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
 <DHDI32YKJSSP.MH33L7GOJJ1Q@bootlin.com>
 <CAMKF1soKLkhMZNSHTzrTcX8qSQYgFz20NgAzjN-ResCgG=Dg1g@mail.gmail.com>
 <CAMKF1sorE-KOXvC+n4RtcdU8S6nzcGiE1knTg==8+d3fX0SxSw@mail.gmail.com>
In-Reply-To: <CAMKF1sorE-KOXvC+n4RtcdU8S6nzcGiE1knTg==8+d3fX0SxSw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 18:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234155

On Sat Mar 28, 2026 at 3:39 AM CET, Khem Raj wrote:
> Hi Mathieu
>
> I have pushed another change to address install-but-unpackaged QA warning
> since the last fix. Please pick up the branch again if you have done it
> after my last message.
>
> qemux86-world is green with this change see
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3494
>

Sorry, I believe I was not quick enough to pick your commits and your
branch moved. Accordimg to your build, it should be commit
52bd0b095528fb211ff9c2e8911d65509917a2fe, right?

Can you push it in a named branch?

Also, I can take it for testing, but I feel like you still need to post
the patches here before they are merged.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


