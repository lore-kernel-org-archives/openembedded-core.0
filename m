Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791EBC74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 09:44:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6623.1679823850063116798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 02:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fHWdEZLP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id u1so3380504wmn.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679823848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DzT6KEL3VhSOEpdfpKpj7NRZVA7YEPh0rRsCCVKIY0E=;
        b=fHWdEZLP5Pjamh2PCjYqLXtcFiU8koq+IMhiOU1IiF8ctDhaCMBVCH5YTe0UZq6eHW
         3SO93CWL8nv/Sdv0+Nr5u/JAS6PiUJHF9AZL/zhdTJ6UjH0IpB5p7g4XR8QCv0CDMd8F
         oNlFgFtqhyX+/WB48YJ9lALgQJ3+0Xsvh6xaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679823848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DzT6KEL3VhSOEpdfpKpj7NRZVA7YEPh0rRsCCVKIY0E=;
        b=mglxb5nelIuKb5H5vgdWjCOsR3pvn1S5V+cKMGfAwEacmj5DX0zjcoH6hXQih9pe8R
         ulApFVcVxtn112L4R/EWeyuE5XigO5HpNG6/5KOI5ul8P9pvbvqYrCLm24dERD3EfNbW
         yCseV9PX0uIMaK8ptlZwmWV8kHtW0qOaS9Cb/lr71GKi/eTDVPLdr021ZRDP4y16Y0q3
         53CAew64tELl/vqMRuQqxrm1loeDoIa4ZoSXIDEC3CUYJ27mnia/fGDkT2nB5C8+x9UT
         3C7dkB6MYsT6EmoO9kh8RlalhnxYW7xez4bsiorz1bJXuwc+D4I2BcAJsm6Yfu4PkaZf
         LYig==
X-Gm-Message-State: AO0yUKVIoswwwXUbWaATh7v5fZUakiOtgEFgbnKJ3F0jcoMRIUlYhT3t
	GmAYoc/3pw2d5Qs1oq/CnUpvNQ==
X-Google-Smtp-Source: AK7set8ItoRIDuX83JrZLIDyA7OWZgiXrm4bKswPxCQaYGqHCdrJGveeRXQL347KajOYUOCpdeUsXA==
X-Received: by 2002:a05:600c:280e:b0:3ee:1a8f:8098 with SMTP id m14-20020a05600c280e00b003ee1a8f8098mr6604982wmb.9.1679823848391;
        Sun, 26 Mar 2023 02:44:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e91:cdb:75c4:1387? ([2001:8b0:aba:5f3c:7e91:cdb:75c4:1387])
        by smtp.gmail.com with ESMTPSA id z21-20020a05600c221500b003ef5f77901dsm5086898wml.45.2023.03.26.02.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 02:44:07 -0700 (PDT)
Message-ID: <cbc187cdb7d78400c37e2368de083132b18c046b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 26 Mar 2023 10:44:07 +0100
In-Reply-To: <CADkTA4PmCKq8jQNk0OGjW-J+A00mtOgN-aEa-zd6NS6EzuZPkA@mail.gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
	 <174FAA516F586B9E.25304@lists.openembedded.org>
	 <2c86a440f61e95cc490e305bcdc016215d97ff55.camel@linuxfoundation.org>
	 <CADkTA4PmCKq8jQNk0OGjW-J+A00mtOgN-aEa-zd6NS6EzuZPkA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 09:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179115

On Sat, 2023-03-25 at 23:03 -0400, Bruce Ashfield wrote:
> On Sat, Mar 25, 2023 at 10:15=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Sat, 2023-03-25 at 12:47 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Fri, 2023-03-24 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >=20
> > > > Richard,
> > > >=20
> > > > Here's the latest round of -stable updates. Along with them, there'=
s
> > > > some fixes for on-target/SDK builds with kernel-devsrc and fixes to
> > > > ensure that 6.3+ works against the upcoming release.
> > > >=20
> > > > I was out of the office last week, or these would have been avialab=
le
> > > > sooner .. I already have more -stable updates pending.
> > > >=20
> > > > I'll be sending hardware reference bumps, and updates to the LTS
> > > > releases in separate series.
> > >=20
> > > There is something not quite right with the kernel module builds on
> > > 5.15 (poky-altcfg):
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/56=
39/steps/13/logs/stdio
> > >=20
> > >=20
> > > make -C /usr/src/kernel M=3D/tmp modules
> > > /bin/sh: -c: line 1: syntax error near unexpected token `('
> > > /bin/sh: -c: line 1: `if [ "gcc (GCC) 12.2.0" !=3D gcc (GCC) 12.2.0" =
];
> > > then \'
> > > make[1]: *** [Makefile:1797: prepare] Error 2
> > > make: *** [Makefile:5: all] Error 2
> > >=20
> > > Looks like a quote went missing somewhere?
> >=20
> > I tried:
> >=20
> > https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3De0b4082f=
99a3970a5f10fa85850915ea3c254e2c
> >=20
> > which seems to fix builds. I can sqaush in if it looks right to you?
>=20
> squash away. Looks fine to me.
>=20
> Strange that I'm still not seeing that here, I tested all of my 6.1
> and 6.3 updates with that in place!

It only happened with 5.15 for some reason...

Cheers,

Richard

