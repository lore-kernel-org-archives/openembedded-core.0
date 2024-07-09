Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B66FC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 20:54:20 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.6788.1720558449964731938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 13:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hKW4C5Ut;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea34ffcdaso5407623e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 13:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720558448; x=1721163248; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYDFlRHNVn0tBWjFENzyjs2A4FS+OOF5zbn5H64ONL4=;
        b=hKW4C5UtMHxvACTcyoQEy6MvgMAP6yo0OsuT+dZ2KJ36TZR7WVTOLmF0oJIZ0W0GdZ
         RubipfER+0ndxaqtyuPRhqsMBx9WTGqcf4kOGI71rs9WiXTxq3AR1KKESm4xJAw119mn
         99ufL6IP7Hnces5Oji8vvlaS4Ah6SqusXFQv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720558448; x=1721163248;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYDFlRHNVn0tBWjFENzyjs2A4FS+OOF5zbn5H64ONL4=;
        b=cfEwy4LPvACTlXb56aLmqeAm3Q31ahoriseFhtwfY8K46OFrY2h5d5/a5kGV1bd7xm
         CiWbLNLhyuiMdZEwIfQyytVASIPbclGUlGnEqeN3bgeLiQKMai1sJ0/4R54Hiv8oLtKA
         ys5/NfrrjsIrUYuOx/b2PHq3S/Gszu4qzDiBugcqv7T5ZrLV8cn538WJLI8WSQI8mmAl
         YXjhFcIWNJYqvK55hPaXiXdnKZmJ5ph1ZkT+QyPTFGPUUfErXJf8RWAbxPRI1v5XHCk1
         rJWeQrnH3fYOFpMnquBmTK/KB5JWkjZo9Xwjc7Iy6GEae7FdAMu3x6iJIj7mYcAYyt8y
         ZtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDFFmck8gZMQmM1E7ljy7FoxG2wTOwsS+6vaQICYTF14Llc4/RXIhwZKcTBV+tu0gEhzsymK3azoLYE0Q+qgnvCyx0tZp0NucQ930pX5NJ+hxKjjOHtnqY
X-Gm-Message-State: AOJu0YxofDLQ57mtaM/RxNxYGoZsFU8+6RVshfR9IUGpCpokgMLg0VsD
	jpR1iXQGZ7cxRy1IX+E6UW1sKRICRxbHXuWavfDNoyQXXT7Ne8FXVnSM4PobbHA=
X-Google-Smtp-Source: AGHT+IFgwsMYcwBJjQsan/6MBGh/4otWoGEFk/2Ovbt3PBZ4GCZOEi48AqavzR1QmgGm2GDlAJBfRQ==
X-Received: by 2002:a05:6512:3f0a:b0:52c:cda0:18bf with SMTP id 2adb3069b0e04-52eb9990ea8mr2654870e87.4.1720558447877;
        Tue, 09 Jul 2024 13:54:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:511f:8e2e:4502:fb0e? ([2001:8b0:aba:5f3c:511f:8e2e:4502:fb0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7df3dsm3450955f8f.16.2024.07.09.13.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 13:54:07 -0700 (PDT)
Message-ID: <81ce71fcc1dd30844fe99c2e8808d4abee803b36.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 3/4] util-linux/util-linux-libuuid: upgrade
 from 2.39.3 to 2.40.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2024 21:54:06 +0100
In-Reply-To: <20240704082444.3886275-3-Qi.Chen@windriver.com>
References: <20240704082444.3886275-1-Qi.Chen@windriver.com>
	 <20240704082444.3886275-3-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 20:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201684

On Thu, 2024-07-04 at 01:24 -0700, Chen Qi via lists.openembedded.org
wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> License-Update:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> GPL-2.0 is changed to GPL-2.0-only in README.licensing.
>=20
> The following two patches are removed as they've been there in new
> release:
>=20
> =C2=A0 0001-login-utils-include-libgen.h-for-basename-API.patch
> =C2=A0 mit-license.patch
>=20
> Other existing patches are refreshed to avoid patch-fuzz error.
>=20
> A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to
> build Y2038
> safe lastlog pam module. This is a new functionality added in 2.40.
>=20
> This 2.40.1 version has the problem of unnecessary remake, causing
> intermmittent errors at parallel make. The do_compile:prepend is a
> workaround for this. Upstream issue and PR are:
> https://github.com/util-linux/util-linux/issues/3061
> https://github.com/util-linux/util-linux/pull/3064
>=20
> do_install is changed to do_install:append, the legacy codes are
> removed. They've been there since the born of oe-core. I tested
> with ccache, there's no error.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>=20

I think these warnings in musl builds may be related to this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9230/step=
s/11/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9241

As well as this ptest regressions:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6786

(arm ptest is still building at present:
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6608)


Cheers,

Richard

