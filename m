Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73902C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 16:55:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.89609.1701968120755698716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 08:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MeZ9aTLz;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1f5cb80a91so49956566b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 08:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701968119; x=1702572919; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IWn58KAdGLC/VrMYgzDaCtq4ESxDEvwmL9EAHZPex74=;
        b=MeZ9aTLzwzSb37t+r5hhLTgC5949q9WwnX+FAQRVJivFt9rfJZiTQAeFl2S5uht3vH
         ckWlCiK1hBQkBFtwvpHTym540tw8yLQBcULho1t1Vq3KXzwQKEFdLLMBFahxd6g5geyN
         +SUGsSbNkK1SXUSKzPAq015LVNqkEYbrwsA6iLQFgTkt9lm8l6MFDHr06tprUWuK16Bn
         B55qwKSMKEhgv+A8aBQKGK2nm8lfn4toqEnXPWPfOyylyBV0aO7IUfjFkdll0RX2hCmm
         QoAscRnyuxAmdv6Ki6jxssWmuBuvA9H8LXVmO4ISnYjGE1or2cpJIlBH4lyCt1vp8GVV
         2G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701968119; x=1702572919;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWn58KAdGLC/VrMYgzDaCtq4ESxDEvwmL9EAHZPex74=;
        b=r8TY/zUdEc94jG9qfGXSv8Zh4iE1qeRx6aOwc3ATPh2EBAnSfJS2Hz50MoEjCiq4W4
         zqD5WxWUsSkTvAsYO5OMAOsIWGzTdYAGRZ1SeEhd6y0BIzLuBqI+wc/lALMBxdECTQYk
         wFwBOAdqk1Y01bAf8r1UOaIqunFivVjsyVoGiWQllvNvVpwW7sYXMKt04EVXMq/iknTm
         kAnIkr6HfseAhF9MmwwQbuRnG0VVrQUcy0723lbExdUAFC6Qfo3lLZ5mhfD+AIGWwEUU
         J64v2nTiSEpCd3b3WIQqVJ9gAXavxCXxk9srz3XFFZgxughvv0X75U35LhXq/x/zdUYQ
         lerg==
X-Gm-Message-State: AOJu0YyomQOyvgkl68mqim/YSBQAzXi4dghpifHGw3LOs/wgTvSG5Skj
	Ay+nSXTFpIUhksLvKuHlMOw=
X-Google-Smtp-Source: AGHT+IG+F5gneUzWpZGZ3RFsNL8ON1maXFjhnFuW36jiNMM3VjD7p6emVAp4GHSGGpnrR5cWm8xSUA==
X-Received: by 2002:a17:906:3657:b0:a18:fde5:c791 with SMTP id r23-20020a170906365700b00a18fde5c791mr1217865ejb.62.1701968119005;
        Thu, 07 Dec 2023 08:55:19 -0800 (PST)
Received: from [192.168.1.70] (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906140700b00a1b65958c54sm1037713ejc.125.2023.12.07.08.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 08:55:18 -0800 (PST)
Message-ID: <faee78194ea836dd3f889c673f170b633a967ec6.camel@gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gstreamer1.0-plugins-base: enable
 glx/opengl support
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex.kanavin@gmail.com>, Alexander Kanavin <alex@linutronix.de>, Richard
	Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 07 Dec 2023 17:55:17 +0100
In-Reply-To: <CAOSpxdYJ6g3P6=0uBJSaCRQLJNHQq-C2BvJS3gPu_10xaoZUQA@mail.gmail.com>
References: <20231206091249.1357218-1-claus.stovgaard@gmail.com>
	 <CAOSpxdYJ6g3P6=0uBJSaCRQLJNHQq-C2BvJS3gPu_10xaoZUQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 16:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191968

On Thu, 2023-12-07 at 05:07 -1000, Steve Sakoman wrote:
> On Tue, Dec 5, 2023 at 11:13=E2=80=AFPM Claus Stovgaard
> <claus.stovgaard@gmail.com> wrote:
> >=20
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >=20
> > This is required by latest webkit when built with x11 support.
>=20
> Is this an issue for the version of webkit in kirkstone?=C2=A0 i.e. is it
> currently broken?
>=20
> Steve


I should properly update the message, though as it was a backport from
master, I kept the commit message.

The issue in kirkstone is more general.

An example - if I have a distro without wayland / vulkan, but have
opengl / x11 enabled.

And then look in the log from " bitbake -c configure gstreamer1.0-
plugins-base" and search for gl_api you will find.

"-Dgl_api=3Dgles2 -Dgl_platform=3Degl -Dgl_winsys=3Degl,x11 -Dalsa=3Denable=
d"

And when running configure for gstreamer1.0-plugins-good you find.

gstreamer1.0-plugins-good/1.20.7-r0/temp $ grep OpenGL log.do_configure
Message: GStreamer OpenGL window systems: egl x11
Message: GStreamer OpenGL platforms: egl
Message: GStreamer OpenGL apis: gles2

Notice the lag of glx / opengl support.

After this change and running the same plugins-base / plugins-good
configuration you see.

"-Dgl_api=3Dopengl,gles2 -Dgl_platform=3Degl,glx -Dgl_winsys=3Degl,x11 -
Dalsa=3Denabled"

and for good plugins.

gstreamer1.0-plugins-good/1.20.7-r0/temp $ grep OpenGL log.do_configure
Message: GStreamer OpenGL window systems: egl x11
Message: GStreamer OpenGL platforms: egl glx
Message: GStreamer OpenGL apis: gles2 gl

Notice we now have gl api and glx platform.

This is an issue when having application using qmlgl plugin as an
example.

In short it fixes so gstreamer1.0 follow the DISTRO_fEATURES, and make
it possible to have x11 support in plugins using glx/gl features like
qmlgl plugin

Hope it make it clear why I see it as a bug needing fixed in kirkstone.

Regards
Claus


