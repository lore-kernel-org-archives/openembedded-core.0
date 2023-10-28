Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA970C0032E
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 13:51:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.18151.1698501105354391009
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Oct 2023 06:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UHAG2YsC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4084095722aso23448345e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698501104; x=1699105904; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zG6rr/hlcCtYxRuwqXvJskAmInsjMut3zo7QXLwihA0=;
        b=UHAG2YsCOCGcGVccQE3mftGF7wZm5I8trHDxu6OYiXS38m4IHA8zKwIWkRexYaCFr0
         SotDDkXsR/k4kO8KQQCwQejtSkqDDSExrAfBcaTQAW+fnlLVG7aY3CMMgq4t2q+0Z22h
         XU+kZA0z5VIorBm2iYG9nJvMYnVz4i1IsxZxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698501104; x=1699105904;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zG6rr/hlcCtYxRuwqXvJskAmInsjMut3zo7QXLwihA0=;
        b=ej6VXbJ1uw+wm8bsdY8Xb0qJSgLEsspTbtAywGiM0pQ8xjbfMTOhWvbjQ6XSzuD33Z
         6FWm6Hbr/gATxPPZ1jQ0BiWmkYcpJpdoT1cqb+UDCtJBNzO9iuwLNMaKv/jFr+wPZJR7
         wvlV49Q4xsLsz+R+TAF+MIkqtJqWDCv1OuOZK9B01d4Acd0Q4aYQ2JhG6bJRyDnjdTI+
         50fWRnUSo0UaxJQc+TLYw8uu/CPVYTTBO6OZqU6yfBDMjHLM76ZnrIKuWhPf/c/KhjmQ
         YOKQO1vG9ULZUZ1kO4UqiQsB5euPBskIdv3Sa7tqdAlAfWrbt5ArODfhksC9kC4SRDeW
         Hzjg==
X-Gm-Message-State: AOJu0Yx8uTlHOEe8KrI45Md+PiWSLGtSlgclLZm3qBGMk8iXoSQZ3zjv
	mRBIJuRmxmp/0/5s79tp6zZdfA==
X-Google-Smtp-Source: AGHT+IGOcpG7u3xdmOwkUZSEpa0Q69IZREcEM4HZUM9usSTS1pekTCXgnNez8ivn2mqS9PFa5ETGhw==
X-Received: by 2002:a05:600c:3b15:b0:405:4a78:a892 with SMTP id m21-20020a05600c3b1500b004054a78a892mr4849020wms.9.1698501103202;
        Sat, 28 Oct 2023 06:51:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d0f:be40:40a9:c121? ([2001:8b0:aba:5f3c:8d0f:be40:40a9:c121])
        by smtp.gmail.com with ESMTPSA id i1-20020a5d6301000000b003176c6e87b1sm3859180wru.81.2023.10.28.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 06:51:42 -0700 (PDT)
Message-ID: <18a7bb5f46d14f2ef31ac06f79e73801399c47d0.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] meta: classes-recipe: A class for simple
 Kernel modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, BELHADJ SALEM Talel
	 <bhstalel@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 28 Oct 2023 14:51:41 +0100
In-Reply-To: <CADkTA4PWe7-2GgsiyZMFqppje+hhY_3yUMrENF2DGaKv+pUwEw@mail.gmail.com>
References: <20231028000738.968009-1-bhstalel@gmail.com>
	 <CADkTA4PWe7-2GgsiyZMFqppje+hhY_3yUMrENF2DGaKv+pUwEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 13:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189766

On Sat, 2023-10-28 at 08:35 -0400, Bruce Ashfield wrote:
> On Fri, Oct 27, 2023 at 8:07=E2=80=AFPM BELHADJ SALEM Talel <bhstalel@gma=
il.com> wrote:
> >=20
> > The module class provides what is needed to compile a Linux Kernel modu=
le
> > but since the Makefile is always the same for simple modules that have
> > their sources in one directory level, I thought of creating new class w=
rapper
> > to automatically prepare the Makefile.
> > Also, using variable flag feature, a recipe can provide multiple module=
s
> > and can be handled the same way as PACKAGECONFIG is used to enabled/dis=
able
> > features.
>=20
> I find this method of preparing a kernel module much harder to follow
> (and debug).
>=20
> So Richard is ok with the class, I have no objections, it may serve a cla=
ss of
> developers, but it isn't something I'd support as a first option.
>=20
> But please, create a separate example for it, not modifying hello-world, =
we want
> that simple and explicit example to persist.

Richard isn't convinced.

In most cases a kernel module from a source repository would have some
form of makefile included with it. yes, if you're creating one from
scratch, this is helpful but in general you do create a makefile at
that point and are unlikely to want to keep auto-generating one.

As such I'm not convinced this class matches the siutation most people
wanting to build software would be in.

Cheers,

Richard

