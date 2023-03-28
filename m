Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679C9C6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 20:34:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.7867.1680035636993250623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 13:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T8pnuFJ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so8327805wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680035635;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+FM/f72DpNdpSJU52fFs80ILoI4Jvm2yq/8p1oPUFVs=;
        b=T8pnuFJ8IT/XVb8viZKvYcJmP+ee+qMpk8BTp45xDGsI2RvAj8/cD6nLl9vkOVeBtb
         ykibBk42kHhh5ZQ9cKVQNB7aYBUC52PLUZiUm/2P4JxS8lVbsnF9knHK3Gd5+P49p3ag
         u//RtfwAd8fTpBvW81V9eGjEZPcOA50RdRQY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680035635;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FM/f72DpNdpSJU52fFs80ILoI4Jvm2yq/8p1oPUFVs=;
        b=0kNlZG9DbpwgFKp0EJi3q8V7dB/HJ7AYIHTVzOWCtYkltNl9kV3M0ni7nmM9H9Uexi
         QW8zb2XgjeBHWU+ah455s7hmD8KGzH6bT+S9kv/1+5DOznWXUS3WBVytmNe+CIYoWlJe
         oo5VppKc48gzy2MKVfaruQ1/rMPt0ulmjOUvZhLlsIOKcokCsjUrB7ZdEMI+qeZ/U36h
         90qV6EE7f5Krr7mvuv+QEpo7UsJ32vetQWjxYBYAKTqb4dCwbpErxfvg00r5lj1NDYfi
         kCAQhYmYoiE9sBMR/w1tXP3OxHjgJHqMI+ZgeMWmJ+5OQVdOVGQFLImDabn8c70CytPi
         5grA==
X-Gm-Message-State: AO0yUKWDIdelwMV2hrjE430Ljb8JKtg5uO7pga1wJzu4ckBD7qUKFQ6N
	gUyE1KPgwSjR17YIDm9qMxPKOg==
X-Google-Smtp-Source: AK7set8Qsy+XG9jChtdqyI1dWDxYqYiZPVWt7OHpyzmzPslycOnwrQLhcp9PtCusR+XZx+wCQgIO1w==
X-Received: by 2002:a05:600c:2312:b0:3ee:b3bf:5f7c with SMTP id 18-20020a05600c231200b003eeb3bf5f7cmr13344730wmo.23.1680035635241;
        Tue, 28 Mar 2023 13:33:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7? ([2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7])
        by smtp.gmail.com with ESMTPSA id m1-20020a05600c4f4100b003ee1e07a14asm13654312wmq.45.2023.03.28.13.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 13:33:54 -0700 (PDT)
Message-ID: <23839d81dabf0f98af383b3c09d9eb772624231e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uninative: Upgrade to 3.9 to include glibc
 2.37
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Tue, 28 Mar 2023 21:33:54 +0100
In-Reply-To: <CA+chaQegKKEqfCG3-BG=zs44CTLojSu0tFAWqpuPk3aze2jYiA@mail.gmail.com>
References: <20230207215439.1391583-1-richard.purdie@linuxfoundation.org>
	 <CA+chaQegKKEqfCG3-BG=zs44CTLojSu0tFAWqpuPk3aze2jYiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 20:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179248

On Tue, 2023-03-28 at 22:13 +0200, Martin Jansa wrote:
> On Tue, Feb 7, 2023 at 10:54=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > From: Michael Halstead <mhalstead@linuxfoundation.org>
> >=20
> > Update uninative to work with the new glibc 2.37.
> >=20
>=20
>=20
> >=20
> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
> > =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/conf/distro/include/yocto-uninative.inc
> > b/meta/conf/distro/include/yocto-uninative.inc
> > index 51c0cdee438..8a5cab5360d 100644
> > --- a/meta/conf/distro/include/yocto-uninative.inc
> > +++ b/meta/conf/distro/include/yocto-uninative.inc
> > @@ -6,10 +6,10 @@
> > =C2=A0# to the distro running on the build machine.
> > =C2=A0#
> >=20
> > -UNINATIVE_MAXGLIBCVERSION =3D "2.36"
> > -UNINATIVE_VERSION =3D "3.8.1"
> > +UNINATIVE_MAXGLIBCVERSION =3D "2.37"
> > +UNINATIVE_VERSION =3D "3.9"
> >=20
>=20
>=20
> Was there some dependency on other changes to consider this for
> backport to langdale (which already has the libgcc change with 3.8.1)
> and then kirkstone (needs both update to 3.8.1 and then this).
>=20
> I'll start using it for my ubuntu-23.10 builds (with glibc 2.37) and
> ask for backport later if there is no reply on this.

Uninative should generally be safe for backporting.

Cheers,

Richard

