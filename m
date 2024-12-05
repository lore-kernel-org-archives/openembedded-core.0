Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D19E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 14:21:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12124.1733408454128593829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 06:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fzIG9pNE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E05C520003;
	Thu,  5 Dec 2024 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733408452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0542uYHn4jW/KPGZhzqTkeEiVzU7+rcZtL/jF4qx5Q=;
	b=fzIG9pNEMsNau4bJ/RAE6YVj/Crn0H9hgLXixdE+oIRB367H15kZQahR02JWJ67cBObuj1
	UtxgwIbqX7kSPNRUgYX7fXwtTa/6CxNEuNGJYIuvTuis6fqWYgNAXskpbjRoDq4itVsg/y
	jigTVQljCsPfz/ceBs32O+yiRTPZisnXhh3kRSBKnY6hsw0sXEQfki5EimQGtjKiQoNj5W
	ja46gYp+JefeQgELkDXJZGYaJ1dkXYN7GVTHd6sjXYl4b5FdooWh22qYL1qrrx3fTRJqXu
	4WE2SMmpxr6PNr8R9D/owsYMX5CWWT3cJVIJgsPKhCVLgZ8CvRHscFnnCa2DYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Dec 2024 15:20:51 +0100
Message-Id: <D63U0HCPA3YJ.3FKI2W07OQF0@bootlin.com>
Subject: Re: [OE-core] [PATCH] librsvg: update 2.58.2 -> 2.59.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: <openembedded-core@lists.openembedded.org>, "Alexander Kanavin"
 <alex@linutronix.de>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241204120838.141829-1-alex.kanavin@gmail.com>
 <D63O0ZMCX6IJ.2V08S8OIMA8KS@bootlin.com>
 <CANNYZj_P=3e++=WSGrCEA_6C02H5M5fp2p=cQ4Mad_7a_xexNQ@mail.gmail.com>
In-Reply-To: <CANNYZj_P=3e++=WSGrCEA_6C02H5M5fp2p=cQ4Mad_7a_xexNQ@mail.gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208379

On Thu Dec 5, 2024 at 11:06 AM CET, Alexander Kanavin wrote:
> On Thu, 5 Dec 2024 at 10:39, Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> > Sorry but we still have the same error. Looking at the patch, I believe
> > it did not change from the previous version. Maybe some issue while
> > sending the v2 ?
> >
> > https://valkyrie.yoctoproject.org/#/builders/65/builds/595/steps/11/log=
s/stdio
>
> The difference is that one of the patches needs to be applied to a
> file in the source tree with CRLF line endings.
>
> v2 does this correctly in my build, but maybe somewhere on the way to
> you it still got corrupted. Can you cherry pick from
> akanavin/package-version-updates on poky-contrib please?
> (I just force pushed there so do a git fetch first)
>
> Alex

Thanks, it looks like it works better now. I had a similar issue with
the ovmf patch, also fixed. Let's see how this build ends, but I'm
pretty confident now.

https://valkyrie.yoctoproject.org/#/builders/29/builds/590

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


