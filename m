Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7B6C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:43:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.176642.1719330211211031436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 08:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XhklEceW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-363bd55bcc2so4556680f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719330209; x=1719935009; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iCer1euNZOsVB8U0yMPpdSUEc55tMIT5qxD+Edtvp1k=;
        b=XhklEceWRrm9SSwKQhuALiNlswhTNt25WIKy5bSdn5WCZTny4cWU6wkccAwVLJW0mg
         2nmt77qBq4tHTUOpnZesDiVigOkH9Q47bskl8uTzbxEUIaST+LlJGVK+0kvCyE+Y41by
         ISq8bHEwVmHvsXGIg5SwJSUO+VM7op3AUPFkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719330209; x=1719935009;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iCer1euNZOsVB8U0yMPpdSUEc55tMIT5qxD+Edtvp1k=;
        b=tong8APcpaueergONyNk6lMmSFUlCtbkixPlp/PVIgA2mGA+9L44MY8CXllFXjNWx7
         XRnFldp6HHQUDkpaJlKttWxlTIJMxh3968pZIptbYr752r49xbgQWhDT2RkvFVdCtHnP
         dY5oGF3rujm7H6N1+2t07B2Bj3KRwOOgknF/76qTb4patAIbKJundMNnmd0nZ/OL+2nG
         zAdzXX7tE0Xxrwtf815+4OtUz646T/sl0nbInsGeWs4BlyvnkU0va8a/iQm2SY9CPR6j
         0eX5V/DREkUaFH9n4X32/ZikUHfLm9bKntbEC4WmRoy9zCdMMsIp5MvGM9ABaGbT64cG
         z3iA==
X-Gm-Message-State: AOJu0YxjikwfdrfXr/eGKdW3S5PQ47qeNHLs2LeWjTZm2rnB4eaXTGDW
	x/kFfx8Z1vkyWG/jp71J4HLs8cJQLr2hH48FljERdjg6/6lSGBdN8AGJxsvWxCU=
X-Google-Smtp-Source: AGHT+IHI2ONbkRnn6MoEz5gb4IEiZvoCIjl5Zy4GKk5fJ/23Klx3CLJ0JqH7j4cVwuyfaB/GpJOgTg==
X-Received: by 2002:a05:6000:136c:b0:362:fa6c:5a2f with SMTP id ffacd0b85a97d-366e94cbd9fmr4475584f8f.35.1719330209450;
        Tue, 25 Jun 2024 08:43:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e? ([2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f679bsm13352017f8f.81.2024.06.25.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:43:29 -0700 (PDT)
Message-ID: <0edf6a8f2b95ab6a83b74cc68c8b7ff89e14f366.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 00/10] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2024 16:43:28 +0100
In-Reply-To: <20240625150841a60a57d2@mail.local>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
	 <20240624193151.1645802-1-JPEWhacker@gmail.com>
	 <20240625150841a60a57d2@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 15:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201139

On Tue, 2024-06-25 at 17:08 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> Hello,
>=20
> I believe this is the cause of the following failures:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4986/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4989/s=
teps/13/logs/stdio
>=20
> I'm not sure why they don't have any diffoscope output.

"The following rpm packages are missing and not in exclusion list:"

there is no diffoscope as they don't exist at all.

I suspect a cleandirs corrupted the build by deleting things before
they were added to the sstate output.

Cheers,

Richard

