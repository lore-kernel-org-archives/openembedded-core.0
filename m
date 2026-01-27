Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3958ED2FED9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 18:50:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19614.1769539820979895623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 10:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bFwTBvxo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12A491A2A89
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 18:50:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE553606F5;
	Tue, 27 Jan 2026 18:50:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DADBD119A8801;
	Tue, 27 Jan 2026 19:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769539817; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yFg0ewOZDMn8BZ1l7wKNFML19Eh3S2n5y/GCOO290Oc=;
	b=bFwTBvxoCDae0c1wFNYJQxehV2ReommDyuSfJtIPWE082RRfuJWCbgVdP5oQ6ZiD08Mjy8
	4I9I09tANSt0hXLWWxA8jHE+G9ycC7SEHcEbZcos5SamajdPDMzbH7smfrnwAmYA4X1A2v
	uZKdlvHSffpTr58Ciok+FwdAIlJqIYFJ/y76UpWN1W5apxq6hnT5JnUTePAl+TDrqfX9bV
	JW9OYa+eZASVZefr0eDDQyxykJcMYAe/rStvDEuJCxvAAE5v9EzeAEqNUWyFznTv4arikX
	HmzPzQ7yfLz38wTLZ/76YlfZvHzg7uDAn55ZRLJHpgTriYp1uwUyZn6dcBHTWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 19:50:14 +0100
Message-Id: <DFZLIGJNJ7YL.39QSSZAYDHT44@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/2] oe-setup-layers: support inline URI
Cc: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260123172613.3305069-1-corentin.guillevic@smile.fr>
 <DFZFC4DZCGPP.23B0TOYETVJI8@bootlin.com>
 <CANNYZj8nQ2_7XxGnotCO745jfgPM4eE8VOjjYpt-KV+V7tmrnw@mail.gmail.com>
In-Reply-To: <CANNYZj8nQ2_7XxGnotCO745jfgPM4eE8VOjjYpt-KV+V7tmrnw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 18:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230063

On Tue Jan 27, 2026 at 6:49 PM CET, Alexander Kanavin wrote:
> On Tue, 27 Jan 2026 at 14:59, Mathieu Dubois-Briand via
> lists.openembedded.org
> <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>>   from jsonschema.cli import main
>> {'branch': 'master', 'describe': '', 'uri': 'https://github.com/kanavin/=
meta-alex', 'rev': '05b25605fb8b2399e4706d7323828676bf0da0b5'}: Additional =
properties are not allowed ('uri' was unexpected)
>> {'branch': 'master', 'describe': '15.0-hardknott-3.3-310-g0a96edae', 'ur=
i': 'git://git.yoctoproject.org/meta-intel', 'rev': '0a96edae609a3f48befac3=
6af82cf1eed6786b4a'}: Additional properties are not allowed ('uri' was unex=
pected)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3102
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2998
>
> The schema needs to be updated with the corresponding bitbake
> patchset, so these two patchsets must be tested in lockstep.
>
> Alex

Yes, of course now I do remember this series. Thanks!

So the bitbake one got come comments, but I believe I will still take it
into my branch in order to test this series.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


