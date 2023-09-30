Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F573E7737B
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 16:59:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.44522.1696093137461701827
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 09:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fbltQqRW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-406402933edso68340835e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696093136; x=1696697936; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H34GyDDeea6rgCE7gbxCU4jrWoP9TRVjNWuSDB05fhI=;
        b=fbltQqRWDAN/WikZRBT13MAshzeEL+1d+binotM6U5FSiyBG4cGdqLhBQpcy7KzTHF
         F5WbaxvNbg7Qvj9cYIs0IgOOrBm8m6jlik6aKNuZtFdgBYfSgNiTS6iygk/G49rHz1kP
         ZT8lfoqzl4EbsnLpJoCMhR4awRLqQ9BCz5AkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696093136; x=1696697936;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H34GyDDeea6rgCE7gbxCU4jrWoP9TRVjNWuSDB05fhI=;
        b=wrw2dneIVt4RHOUpJC3wvgHg2xIupf+za9+ahbWb/LmY7tuZqfo34Ac73OlnIFCiWK
         cJ2lDpGTMdsaABEH9In6ZMmLfTPpuWh3F/SQVyG5MwqtMxbKrHZmOj2T+VP2tlRl7hxl
         vvxVj8Rn5lcAYAetMg9obv4Ty6ZCV+IqeaZkdcNX6JoporD80yg/E5seV5vFsui69+/N
         NCst/MSOQuHkYE2ev1KIc0qX584w+yr/Yo4f2QzCu412pIHulQXl5VRrb6Mw3jsPG0zD
         xdSz+qO+b4KGFeUO1UONL69X8IQdeeCgzj7X+EJAZgS2pXjveEJ1S5t8F25lO2Y03ORH
         zi7g==
X-Gm-Message-State: AOJu0YxrAKUv1a9ZOpm+Q5JFy0EPqG83Vpi/h4w3j+T/7gk2r7wbakPK
	XtiZl/vvMqMxCHpSzKRvUsuzng==
X-Google-Smtp-Source: AGHT+IGhvkPJSDUtWHlS/CXAA6mH5FibLSUDMBBYNB6VFi1MPRQVYH7UH9rp6lelSwHHNRlzWXk3KQ==
X-Received: by 2002:a05:600c:293:b0:401:1b58:72f7 with SMTP id 19-20020a05600c029300b004011b5872f7mr7066435wmk.38.1696093135827;
        Sat, 30 Sep 2023 09:58:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a077:4896:f66b:df48? ([2001:8b0:aba:5f3c:a077:4896:f66b:df48])
        by smtp.gmail.com with ESMTPSA id bt14-20020a056000080e00b003200c918c81sm17589509wrb.112.2023.09.30.09.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 09:58:55 -0700 (PDT)
Message-ID: <01a64a17dbecdd2ea0b4364ee8440405fda215ea.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 30 Sep 2023 17:58:54 +0100
In-Reply-To: <CADkTA4PiKOf4=y4buxMQmzZJ3BJHQtUhFSSh8VjuV2_-ETwDsQ@mail.gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
	 <fa84ffaabc1616f617555fbf7cc2d46fb2358e51.camel@linuxfoundation.org>
	 <CADkTA4PiKOf4=y4buxMQmzZJ3BJHQtUhFSSh8VjuV2_-ETwDsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188462

On Sat, 2023-09-30 at 12:33 -0400, Bruce Ashfield wrote:
> On Sat, Sep 30, 2023 at 7:07=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> >=20
> > I had some difficulties with this series since it doesn't apply
> > against
> > master. The issue was that someone else had updated the kernel CVEs
> > and
> > those changes weren't in your tree (nor was the btrfs upgrade).
> > This
> > meant all the cve inc changes threw errors. We will likely need to
> > assume someone will update the CVE includes semi regularly just so
> > we
> > can keep the noise on the CVE reports down.
> >=20
>=20
>=20
> That's odd. I always do a pull --rebase before sending my changes,
> but yet none of them showed up=C2=A0 (on any of my builders, so I had 3x
> machines running that queue of patches and none of them had the
> changes from master).

I don't know what happened but you were definitely not on a recent
master branch as the changes did not apply.

> For the kernel CVEs. They either need to be part of my kernel
> releases or not. I've updated my scripts, and they'll always be
> updated as part of the process. Having something / someone else
> update that file is just a huge pain, and we shouldn't do that.

The question is whether you're able to just update the CVE revisions
out of cycle with the kernel point release bumps?

With the number of CVEs coming through, the files may need updating a
little more frequently than we add new kernel point releases.

I know the plan is this "goes away" when the kernel cves repo is worked
into the cve check workflow so hopefully we don't have this for too
long.

Cheers,

Richard

