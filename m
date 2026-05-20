Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA20CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:10:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7266.1779264651546327221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=i4cgmVI2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 368B9C2B9FB
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:11:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B1046070E;
	Wed, 20 May 2026 08:10:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37300107E9D84;
	Wed, 20 May 2026 10:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779264648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/HlmYafaRfv+f1A/PZN2PDXXp8ppN5XHkXyMm1E6DBk=;
	b=i4cgmVI25TTYooou2J1XTUocDi7WU3XdOONhOFbb3jEp5EtLuze20Mz4J98E6jjKFMUP1Y
	DaqaIVO0+0GhTqf/Jxneyu39PbewnR4d/663vFOwmW2uik2Wm+6Q3bQdUTKNUZYDHkyyTm
	5X3SW5A7f9bj6vyT6kxxcw/ra1KnTArl8ofq56U/l9R14hetld1+tr0BTVQGyyu9Uzkff2
	wcgOAnhalT2VSf62eeezMsMEiP6doLg4RKiDQxUuzVudql6mCbdm/IwoyLIwdsDtJiETy+
	0oCLvBakVunDJ5FUhpJnaf7skiE4fTRVM6qqA7lJVRsSmbRSipFmXCp9/eGprA==
Message-ID: <3ac10eb0-e434-4c65-9d11-03072e37cf1b@bootlin.com>
Date: Wed, 20 May 2026 10:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 openembedded-core@lists.openembedded.org
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
 <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com>
 <9dc8c3b7-c358-4a7d-af1a-c1aec83906af@rootcommit.com>
 <e8674aa9-a98b-4d39-bc9f-a525516d3c24@bootlin.com>
 <8fb4098a-0831-44d5-a852-3759d59f2433@rootcommit.com>
 <CAA_5yovGUPcCN1KE4ZzCY03amL5vKOM0f1P+78ntaqr3MKhBPQ@mail.gmail.com>
 <CAO9ioeVefEkaL7zrbmBymk_1n-TLtibTpMsd6DN+V_=WBS5hmg@mail.gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAO9ioeVefEkaL7zrbmBymk_1n-TLtibTpMsd6DN+V_=WBS5hmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237391

Hello,

On 5/19/26 22:25, Dmitry Baryshkov wrote:
> On Tue, 19 May 2026 at 20:02, Ricardo de Araujo (Salveti)
> <ricardo.salveti@oss.qualcomm.com> wrote:
(...)
>>
>> But I can send another version duplicating the patch line in both
>> repos, if that is preferred by everyone.
>=20
> I think that's the best option.

So do I (i.e. if you mean in u-boot_2026.04.bb and=20
u-boot-tools_2026.04.bb). Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

