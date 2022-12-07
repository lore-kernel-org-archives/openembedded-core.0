Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E05C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 12:24:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.13936.1670415881818250426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 04:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IWTxdyRd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h10so18297968wrx.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 04:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M2c4jfajfaZdlK460V2wVtA53o1/aNQ1FVdoWV5hPCs=;
        b=IWTxdyRdj6MeCTrk7OBsGsDZfitQXGawUI8mMSeWCC3yVGWmX6ReQ5RzfD19YKtSvU
         18S6hW8jm3HKhWekcBgoQhu3lZMf7zE8e7PKut09mSSGp1vCx6QP5AQTOnF23IDzYAWB
         Ay9L5LV12pYdM6d+500K3HCoKtWnUidxdClwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2c4jfajfaZdlK460V2wVtA53o1/aNQ1FVdoWV5hPCs=;
        b=gCyLGSmNTTv8BMqUVOh9UBx5C4CdyeDZu9L1wtgV/mI6Bl9UPBDx2Nz9aGA2BjpJJu
         0smzqyHN3wOe3jNLlx4VlhfBHqo5UkXp4PPoPJ/obzLgA7jP5qSUr1pEUOwaTCTl7UHW
         Tp1SFHzTtEK4xe1al+/WnOWd/Gmv0ArztzWAGU3ZgjV5JdgYbVIuJTvfvEmoC2di+4xY
         jJvbP+dx6J/8oEhEQzX5TQmaDKWAVGJAst378kGSbmRfRR4hKbkeMUlkC0hCXt7VjZZC
         9pZhtF/Gnvz3ClIEY26wHyCF+XLbBw334kmdhntS21n3dOhvfhdY5jvYPz4cH5wctOf7
         QZPw==
X-Gm-Message-State: ANoB5pkz6SQYiLYuNZGUGpALSm01Fbe4iojJVZdrU/NyJ0ZiN3LM0VYZ
	q1zq4UisIWr9itaDd1irDmBc6Q==
X-Google-Smtp-Source: AA0mqf5mPmXn3hbw89YcQLSNcu9wPX1j/7y+i1UpShXrQeD5vBvnJ012bZsatifZXTO7WZHwX9TKGw==
X-Received: by 2002:adf:fac5:0:b0:242:f22:bf36 with SMTP id a5-20020adffac5000000b002420f22bf36mr30499336wrs.613.1670415879895;
        Wed, 07 Dec 2022 04:24:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a7cc:35cb:98f7:71b8? ([2001:8b0:aba:5f3c:a7cc:35cb:98f7:71b8])
        by smtp.gmail.com with ESMTPSA id z12-20020adff74c000000b002423620d356sm17048489wrp.35.2022.12.07.04.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 04:24:39 -0800 (PST)
Message-ID: <cc3256e1695ac73981bf9575437570e207dd4ee1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] devtool/friends: Use LAYERSERIES_CORENAMES
 when generating LAYERSERIES_COMPAT entries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Dec 2022 12:24:38 +0000
In-Reply-To: <Y5B6XVKoPKvydWRy@mail.local>
References: <20221206164559.1969059-1-richard.purdie@linuxfoundation.org>
	 <Y5B6XVKoPKvydWRy@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 12:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174350

On Wed, 2022-12-07 at 12:34 +0100, Alexandre Belloni wrote:
> Hello,
>=20
> oe-selftest fails:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/4504/ste=
ps/14/logs/stdio

Sorry, I fixed the hang but clearly caused another :(. I'll get that
fixed.

Cheers,

Richard

