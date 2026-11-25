Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43009.1795617338097336408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 06:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XaM24ibD;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso3295251a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795617337; cv=none;
        d=google.com; s=arc-20260327;
        b=frnWsC+BidsHGxAapFLCGX3fbrHpqnpGxrdwCKYwrvq5+L17XlRKcP7Y66PLBu07ti
         9CmL8vpKFZZ7PxpuQagXMFMaO/SydgzM9BRTgpXAlYwdJ6IMYt5Kziq2zJw3SxirK45n
         ARWBTKWsCKxpiaXBtwvEuvcmQzwSpRgOV6vsx9O+UyePrgcICTGjjSwp9wgX1QADUVHg
         mnVnnP7ZZG9BH6ljfWNyaTEFD2xWDf36Er2ra+3X3IJZcQxudvgsvPtbffNXXs0iRYPi
         zb45Lcc1hsOzk3ddlB104j+0SLp+as/TWdpx4+UsF7cFF/I1YKBKlwEfbb3D/a7Z8pIl
         m7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z1NG7TL9hJSCfjYf42eu7dE7HD2wW+tEP3R4OtoBTFM=;
        fh=xZ7UxID5ToRvQuMcKOMt5hAzoRMzuuu7IPInc+YbLsU=;
        b=FWUbFKr64XhrARpIrwXERvyVDyQmOjvkKLkvPs5qQA1X4T3y4QH/C0HXkBya40VGi9
         19Efi4uxahUvPrq5arjGIkzWgl1X+Wd3h4ncz75+JcIrnrpPlzWk5z1a6f9m79qJGQSy
         K+iwiwHoIakiGuVkWymIvQ6zgbLHhiL5ulrJ3Uw6DMUGvziComSHvzPXvuJvaE+0pIm/
         hrdVZu7y5svzIwo5g3ND5a/BTxXF/J/72QVA45qm9fb4xshpMmIdhT/XkegMyTcesQ3B
         4EvirWOWCzq/jlQFJpT7INTDYMjzdBA/NAnH/Xubk3g//cOSuxIif3CA8043McMRsYGY
         p35Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617337; x=1796222137; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1NG7TL9hJSCfjYf42eu7dE7HD2wW+tEP3R4OtoBTFM=;
        b=XaM24ibDl1qb4PvRzS/lLqgcqpDSfVPxn2yYUyCrvbpT7BfBtXUMT0pIBsGxzOUPR8
         xlBk/n6aEX/axQaF76bjJjCe9rQ9Tag3UenUadp332Q1qyJvqec3qfbp+ENh33VsSHR6
         4HKvFWi7tXaqWQ9xXA8oHmNVvS+n04Re5cuRhCya2otDjpHNnQ0sgs3RqD48y7nDNslR
         kHT6d2QbjnR8CW/7/juM+pT59tBqhga7plEX8zxsiX5mYtPf5gdOFHddWJtCfogIJmKc
         pZ6PTChgx0X2+iX5+COUbgheHljHckcE+5VbiH3wEV+aoVP9wPMawG45SIVE0PmfLYGV
         6P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617337; x=1796222137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1NG7TL9hJSCfjYf42eu7dE7HD2wW+tEP3R4OtoBTFM=;
        b=F2flD0MZIjHcFNkTJObsynsjb2iCcC8jjXaRdWqKTf8TiLPz71lzPe4fDkXs65aBvv
         6rtAS/v2Xfhd9+dP/3YVJTybFZlrQV7jNCj22gxa2joE45bAJY83oekGo3kEDsMUr8ql
         AYkcVFt2vIT6uOiGAE4eiBZzcZujowSayHn0fUUQJ3taRayosLV0/OgZKeOk5uOWZOcr
         ngv4R+C18S632pOFj3zXEELOdcRGj41oiW2afM6RxI82O4MmmUJPqGds17BIBEbkFNTM
         sv+eWG3BXJvvAlCdHjbyTUG8RS4LSWO3n1u7bavLCrPSnQIgF73h9YrRzNL//WvEM6ac
         zn5g==
X-Gm-Message-State: APuU4Z/vej/tOxAaMewptbWmIE70eW7w9I6JLWmlGk0l/KUIEtcZO2Ko
	I2JitQLOWwieVgeWb1DO+FYCVw2fn0ryKaMjCSjgacZ0wBLmoKewpQLq2Yb1f4IMKmvDlL5bWvu
	oLiE4RZoz7wkso0upJ/2PwrMkY2cjxfI=
X-Gm-Gg: AZFdTZehEum0k7rvgJQ8K+YoRow1LqyB7hQ29OkS1dByXYVmS6nTVmY0iS1xKnv3taW
	cDp+YuSc0T63LfuHPTiIzJDnS1GargkW2Go/JZ4bbzCFZhMG+qYxIXest+YnVEXnRZ2sesoe6nB
	CoGWRRiF5rYvzi8WUs9OTDm5/tMDWZN5Db746MxbyLQB+Os+wtiBsqSx0VCZvIv0Gj+Q7O9thto
	jLUnCxe1YhaE0bAU+jTovd0VpmOtTW0k+63jyKVvlEqdgU8equxg8XTqDOBKQHkuKHycwH7+pW8
	30HnMPj0moXKz8x2rU+BK/7CigWvwI6S5diszqLLCyoSr61dPV+7Vr9Q2qcWnGmKM4A3s7M+qPv
	onHZvIUVH1VlFR9iQxqeNsXIsQJkG/C7cfpnM+v7e+usdkj6aDDeYifAZSrlfXx8yUV2tIos20I
	qMlUYkl2EnN7hIuPK/Gme3JosQ9s/W2sm+PJhBTG+7L4PxAuBYsdjK1Qvsls0J1lTj+3nSi0wn7
	2qWNjwligiJfxqUk2fOJ52NSafCJv9tNn5Pw39X
X-Received: by 2002:a17:90b:278c:b0:3b3:b0e5:57ee with SMTP id
 98e67ed59e1d1-3b41c97ac48mr18470769a91.54.1795617337333; Wed, 25 Nov 2026
 06:35:37 -0800 (PST)
MIME-Version: 1.0
References: <20261125142111.2917748-1-otavio@ossystems.tech> <42370a30-cfea-4c13-7eec-90d4a13bf0ac@crashcourse.ca>
In-Reply-To: <42370a30-cfea-4c13-7eec-90d4a13bf0ac@crashcourse.ca>
From: Otavio Salvador <otavio.salvador@gmail.com>
Date: Wed, 25 Nov 2026 11:35:23 -0300
X-Gm-Features: Aa3M54o1lQ3urrz2v13EsGtgJlFO-9tvSoT_Cjbmz2vrgFcD4yxk_Jl4O4jNjtQ
Message-ID: <CAP9ODKp=FuALjtzhWTb65Ckhoa7GZFjbXa-LAAtnvAi1Qw0Fpg@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] multilib: make preferred_provider
 mirroring deterministic
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr, 
	efe.canicoz@atlascopco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 14:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251190

Hello Robert,

Em qua., 25 de nov. de 2026 =C3=A0s 11:25, Robert P. J. Day
<rpjday@crashcourse.ca> escreveu:
>
> On Wed, 25 Nov 2026, Otavio Salvador via openembedded-core wrote:
>
> > From: Efe Can Icoz <efecanicoz@gmail.com>
> >
> > Sort PREFERRED_PROVIDER_ and PREFERRED_RPROVIDER_ lists before iteratin=
g over
> > them to make multilib mirroring deterministic. Otherwise ordering becom=
es
> > random and if base version comes after overriden version, new created
> > multilib-base version is wiping previously created multilib-overriden v=
ersions
> > in setVar function.
>
> ... snip ...
>
>   pedantically speaking, proper spelling is "overridden".

I fully agree, however, this is a cherry-pick from the patch that has
been applied in master, so I'd rather prefer to not change it.

--=20
Otavio Salvador
+55 53 9981-7854
