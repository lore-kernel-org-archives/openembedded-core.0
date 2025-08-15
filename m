Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7D8CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:03:46 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.15436.1755273823844828080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VvWkFnOJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71d605a70bdso17108027b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755273823; x=1755878623; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9SvrDFHs9uX/Kl1eTIeDK+YkD87bbK/H3I46SArp7E=;
        b=VvWkFnOJQLzZS1PQzGnu/pcYPFKELpi4GaOuzOXNSKTHMJuldW57/VXNYmSwfYumzj
         +slQf6HAKpZXnE9LiyRo8F47gVeyFGm8ZE3hoooW3HpuVETSVgpAzHiBO3w+hYF6m8a5
         +u55vtn1047lSbAvIFtdI485qPTG1TrZMU4F09ovY3PQlkj18QTu1X9ugurRXaiVasKa
         eUVBptpvmwlw8XYa9Wc4tmsd4Eha4pg50KpUHarsjYI92kV3k7mUwZhoYi0hl9k38viL
         L/ezF4eVYN2yEYN1cvG1cbG9frLDktWRr4sYi7v/Y2iR6EcrwUO8yWwuFuXKJHhBfABN
         LYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755273823; x=1755878623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9SvrDFHs9uX/Kl1eTIeDK+YkD87bbK/H3I46SArp7E=;
        b=G3T7imUoID1Q5Nn9F8oPN+nObIMaO6wU/qnLxNqVjjhrL0Gysp8KXdP2/x9JYnxpey
         UZO703HT1m7kvfKqAbPxiYKR6jBVSWqHctT0p/mY89i6IAT14lGnRTI+n/bgLOPNroma
         tsqzrOHterEz4ZaNSkAs7+OrOZJZ77J3FMYzzNv6801cHGJG/P4V7e8YzuDLYnzSquSh
         oTWOMb2X5zF0IgqbzKKMLYO3bbY6ltw2HDwgWbQhRJLhnZn0okK/ZiCutsJUg0IWjtEw
         CNkavKuVGSLg798yd+UucBJzI+4zZkocjo4MYgAzwDz7ZWrd6xaXhls5Biwa+nv4uZKf
         /rDA==
X-Gm-Message-State: AOJu0YzlGMFQE+frv8F1gm/JXuOAGwXyxS3FpI90Y54RRygo5VI8KEUg
	jTa+zd63LDDWgoZHHo+v283YX95tSHIV8jdeR/WmN1s6EZ3ejGjI5INWggBt1TcoFf5rkw242ak
	JaIab0X7NB6ALWuu3E48vqVVaeA/9V1Cte+VFBp+yrg==
X-Gm-Gg: ASbGnct9nk+TbizYav7kiUbCWpk2TzO+AwHbId6dHkTo6Y0WZi2FK1/ztPrCZSPF2m6
	USgmku2r6PtaRvjOVyHWUwXq4X5+oFFzzWJxTw8cQmOcOwwVa5AypfETJS+cpT9uzioPjC3WZs0
	l71yLIz/S6HDSasnxp3ZbXYvoltQkHYsBzVe8xZ/+3qMtk8FOIN4tlOExijaE5S481ANJ55Sw8G
	5orHmQIKJwJS6OTmgoUli9Qsu9nFB0b6gtyLzE=
X-Google-Smtp-Source: AGHT+IECp71Ox3Ipw/Ducht0vA7msnDKQLvhHQvHap2w14dpq6jPySaQhegbIKCXE8bbBR3mALtJd09D5Z/7ECfEJVo=
X-Received: by 2002:a05:690c:9a91:b0:70d:f15d:b18f with SMTP id
 00721157ae682-71e6deacfcemr30950427b3.26.1755273822323; Fri, 15 Aug 2025
 09:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755005205.git.steve@sakoman.com> <1a8f58b2e7c2005757fcf1a5d4b57f7239925133.1755005205.git.steve@sakoman.com>
 <ebdeab05-86f3-41b8-8611-43318652b7e6@gmail.com> <185B5FA5D8F47DA2.29447@lists.openembedded.org>
In-Reply-To: <185B5FA5D8F47DA2.29447@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 15 Aug 2025 09:03:31 -0700
X-Gm-Features: Ac12FXz05m58UHzMzguRTdvVaJb9IDriAMqb7eNNfAmiqxDAmQWJpFN7KF0zLl8
Message-ID: <CAOSpxdbPQMZPWfc6CVkF-Ew0WeQwaQp6n-c8w=CShBVFmnaPOA@mail.gmail.com>
Subject: Re: [OE-core][walnascar 3/3] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: Khem Raj <raj.khem@gmail.com>, Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221977

On Wed, Aug 13, 2025 at 9:14=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Wed, Aug 13, 2025 at 9:11=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
> >
> > Is this more than cosmetic in walnascar? If it isn't, than should this
> > really go into a stable branch? In my understanding this will require a
> > brand new sstate cache.
>
> Khem,
>
> Can you comment on this?

I need to wrap up the changeset for the walnascar release, so I'm
going to remove these two patches until we reach some consensus on the
need for them.

Steve

