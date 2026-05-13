Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D92CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 16:04:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.745.1778688259347436716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 09:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0wEihyzf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E6F24E42C78
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 16:04:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD4475FE21;
	Wed, 13 May 2026 16:04:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D283711AF8A66;
	Wed, 13 May 2026 18:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778688256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3h3xRdGnTr/gjZoAPRfD6JrakzfEXlBHuofZPGjjiHY=;
	b=0wEihyzfQLLwpsHU8W42ygo+T0qLy5ReHaTcInZbt9ueHuvrKPjqUl/BSs64KD9cXSz4q1
	0S7+IaMjIY+SzVNwexXetzIHErbFFYzcoyJRUiuxp499kIH4PxvcQiKMHlOxyj3SM7kN3n
	QEVje57bJa4ruDkC12TpUv/Pwk+f29tffjW/9d98b7TPI1K23C4ah6/3Jq+LoqomLmxzmE
	y5iVYzvoQjFS+0ylryZOTNlSqrv9TR9va38Vk9dimjj2UJTrYY22KJTVT+Y1K5Xt4wZVTW
	Lb0IMvcEzoAa+G25fzan9aBWGk3Aani9KLddJy2PNoh+sCzlf/kmbF0H3/a6hQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 18:04:13 +0200
Message-Id: <DIHOD2ZIV19B.1KE7P0P23E9GK@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ernestvanhoecke@gmail.com>, "Khem Raj" <raj.khem@gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] jsoncpp: Fix C++11 ABI breakage when
 compiled with C++17
Cc: "Ernest Van Hoecke" <ernest.vanhoecke@toradex.com>, "Peter Marko"
 <peter.marko@siemens.com>, "Zeming LIU" <zeming.liu@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501160902.1164934-1-ernestvanhoecke@gmail.com>
 <4cuhef6vftli2pf6xqtz36dbtw7y23ok2pkbi6xyjl6tkj2e34@nyrw6ab3wf63>
In-Reply-To: <4cuhef6vftli2pf6xqtz36dbtw7y23ok2pkbi6xyjl6tkj2e34@nyrw6ab3wf63>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 16:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236992

On Wed May 13, 2026 at 10:03 AM CEST, Ernest Van Hoecke via lists.openembed=
ded.org wrote:
> On Fri, May 01, 2026 at 06:08:59PM +0200, Ernest Van Hoecke wrote:
>> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>>=20
>> When jsoncpp is built with C++17, 1.9.7 drops several legacy overloads
>> that C++11 consumers can still link against.
>>=20
>> Backport the upstream fix to restore compatibility.
>>=20
>> Fixes errors such as:
>> |  undefined reference to `Json::Value::operator[](char const*)'
>>=20
>> Patch can be dropped when we move to 1.9.8.
>>=20
>
> Hi all,
>
> Any updates on the state of this patch? I believe it's still relevant.
>
> Thanks!
>
> Kind regards,
> Ernest
> =20

Hi Ernest,

This looks like a patch for meta-openembedded, it should be sent to
openembedded-devel@lists.openembedded.org.

https://git.openembedded.org/meta-openembedded/tree/meta-oe/README.md#n19

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


