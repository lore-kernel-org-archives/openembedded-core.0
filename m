Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103D9EE3F2F
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 06:18:00 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.15116.1694758676137241239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 23:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y34ExEbm;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-501bd7711e8so2923144e87.1;
        Thu, 14 Sep 2023 23:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694758674; x=1695363474; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uiSSiNDRSvm4B8xTzKBsBa3fPNF7A+8rWeQ9ht9Njg=;
        b=Y34ExEbml4Ydiw+gfWXNgnjSvkZpzKWbzlwN606EOg4g4lfDvv53XY9kSfjJEgA+xu
         J+WU4SrVYyVyk6R0t/Oo48G1yB/txzu30idn6ro/m5g7AVoGmHhK151zTgN/YcZKiSch
         wkl4ySC+CQtLFkN+wnNuFPgzczRReGKezzs0baeU0NTY7N4Ixm3X1X/RwIQ8jiwy4AMP
         KE/FsI8ppFzhMyg1N8AZZuLckUiQYA0ceQNaq9dPbY8KgmlotEzUWpZI+l8LVdRqC1KZ
         pCSLnlpKD4rYAn+eRfIvxW8xREmt3Chr2wwA2Vqq0qo/YVR7u/bPr8M033SlBEZylS26
         bIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694758674; x=1695363474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uiSSiNDRSvm4B8xTzKBsBa3fPNF7A+8rWeQ9ht9Njg=;
        b=HlAuEZOZ4oDkb9b1EVX9W7lfjFDChi749SP6vuBNuCPc+Fn7X2sVfzICG0GKMWAmuW
         U1vy4yYCEo/2p15U3IztLjtw+QJUOUrw/1YadvynDeLT6MCYvDRS6MDhhP24bLqwwANK
         GHBh6EZnx6dW7Vwb7CVbeSQuaH2ay+Hf8eEnZmW4hTXoTK/V9C1JupitzetL03gxCVzT
         KqDudPAiY4h8UHLE6Fyat0CNpeMWfSy4SurmZmGKUBVT1j9vdDDvTSuVHeW0Q4fm/2Tx
         Z20ExC/SUysO/mBm9i335L1Fu5uXtwIz86xy3ARPZvVw0BAXUjT68KK+3m6YXNBWLTi+
         S8aA==
X-Gm-Message-State: AOJu0Ywg62uYu7rz5J0fIhsw1TNDaXuT/UXvJoKkkZvMcqhBlKXQDgOp
	c/il+qI6qeXLKo+exF1j7wMyjjrPdTzFeU9mAhNL5CcC
X-Google-Smtp-Source: AGHT+IHOi75TjPkeh4XrDOWqeu+u/f6YCkjlxtoHGOaT6DqJhLpjx4K2xkfOXrFgzd/SUZiNoIYnJclbq1n5SxtSrr8=
X-Received: by 2002:a2e:9053:0:b0:2bc:d522:dfd4 with SMTP id
 n19-20020a2e9053000000b002bcd522dfd4mr706325ljg.8.1694758673837; Thu, 14 Sep
 2023 23:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
 <ZQGsAX4XIMkSN35C@nuoska>
In-Reply-To: <ZQGsAX4XIMkSN35C@nuoska>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 15 Sep 2023 08:17:41 +0200
Message-ID: <CAApg2=T7P2wa6aVXJ0RhvD6ReFSX2=c1z2yqGTmFWxBEdgnHeA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Security processes: YP needs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture@lists.openembedded.org, 
	yocto@lists.yoctoproject.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	Khem Raj <raj.khem@gmail.com>, mark.hatle@kernel.crashing.org, 
	Ross Burton <ross.burton@arm.com>, Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 06:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187653

On Wed, Sep 13, 2023 at 2:33=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Wed, Sep 13, 2023 at 01:52:19PM +0200, Marta Rybczynska wrote:
> > Hello,
> > I've been working recently on collecting what works and what doesn't
> > in YP security processes. The goal is to go forward and define an
> > actionable strategy!
> >
> > Today, I'd like to share with you the summary of what I have heard as
> > needs from several people (those in Cc:).
> >
> > I want the community to comment and tell us what you find important
> > and what you'd like to see added or changed from this list.
>
> Since most users take poky reference distro and combine it with a number
> of open source and closed source BSP and other meta layers and build
> systems to produce SW for products, they also need documentation and tool=
ing
> so that they can replicate the Yocto Project security processes and use t=
he
> available tools.

Do you also mean that we should make sure Poky follows security best practi=
ces?

Noted the point on documenting the way process works/will work so other tea=
ms
can extend it to their layer.

>
> I think most of the documentation around the tools and processes is in pl=
ace already.
> Having maintained and shipped from a non-maintained poky branch, I can ju=
st say
> thank you to all who participated in the upstream work to get security vu=
lnerability
> detection and fixing possible!
>
Out of curiosity, what have you backported? cve-check? LTS work?

> That being said, extending the CVE scanning and status tracking work to i=
nclude more
> open source layers would be nice both for the maintainers and for the use=
rs of those
> layers. Using some random old branch of meta-foo may not be so safe. Mayb=
e add
> this data to layer-index?
>

We have Yocto Project Compatible already. Do we need something else?

Cheers,
Marta

