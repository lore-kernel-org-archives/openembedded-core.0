Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2392.1792483291272894490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Q/Re2ZLP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9B7AC63454
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:02:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52B1460393;
	Tue, 20 Oct 2026 08:01:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8A3810328DBA;
	Tue, 20 Oct 2026 10:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792483288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=o4OBED34efNOu6gGcmyiEYvPFkxdfpazfmx5emgZkSg=;
	b=Q/Re2ZLPMKQ1DzocHhkXjhvs4VCkGWlTV8DC0FCOwiEVLpdTnYb2XBG3r/efwbz5oAC6e1
	K+4Zo6Whs4j1jLDjxZxLcuYHioFdnaJ9dNxtKlM9Ol04VJvN1+HY19WkotoUfrQJMIzXWN
	86h8IlN2BARANU2IsfDTVgYPP3NKIz4az+0Ts59WAZ2DYrvleUhZSJTPA6XgOpoEjyegi3
	f9aBghsfZTsS4QTbPUteY4E3s4OemEafrfdVVSKYoX/cW2X1Dorx6ild56KkO20fXCAXRO
	QqyEuc7+e8FYxad2m03VWJDy0BHV/jt1jwGTtm5pHo4VuvjerycNEI3pCRu1Wg==
Message-ID: <a1575742-1bd4-4d92-80ce-704c5c6e178f@bootlin.com>
Date: Tue, 20 Oct 2026 10:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 RESEND] classes/archiver: fix tarball content
 in "original" mode
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, yoann.congal@smile.fr,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260918092711.471982-1-joaomarcos.costa@bootlin.com>
 <84b5b50f-c507-4e35-8090-2a13b79fd4e3@bootlin.com>
 <b398788ff33f7042add03b695235d157ab2bb3b3.camel@pbarker.dev>
 <0c085fe9-05c8-42c3-a2e3-295b5bdc6e99@bootlin.com>
 <8de4149b86177076217c3f815f2f93b6bb731277.camel@pbarker.dev>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <8de4149b86177076217c3f815f2f93b6bb731277.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248245

Hello, Paul and Yoann

On 10/16/26 3:40 PM, Paul Barker wrote:
(...)
>=20
> Hi Jo=C3=A3o,
>=20
> This does explain the tmpdir a little more. In which case v2 is probabl=
y
> good, I'll see if we can move this forward in the next patch review cal=
l.
>=20
> Thanks,
>=20

While I see this as a bugfix, some might see as an "improvement". What=20
do you think? Should this fix be backported to=20
blacksail/wrynose/scarthgap? If so, let me know and I'll prepare the=20
patches.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

