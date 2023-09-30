Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4579E7737D
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 17:26:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.45263.1696094808925537002
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 10:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UtI4KbRu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso125089905e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696094807; x=1696699607; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Aghycae8tTXzAukgapI77JK2oZzs6z/kBtQBKmw52c=;
        b=UtI4KbRuI3UXQHo+ibgYdywX5xRrq2wwclYomWamzva5RpnxcEFg6VyjbQsF7MGpXi
         Qab5NA7ifCIQJ3d+uUoposJpGHK4dcmpXFzBCH1S3U15vT0tbJbr+/lY87qIjn+ESyQe
         TOGubhUltNGetBQEUfyjbq7dyqxnN1YyE0gj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696094807; x=1696699607;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Aghycae8tTXzAukgapI77JK2oZzs6z/kBtQBKmw52c=;
        b=F8Wl6TWEsQdcy/GxHC+dRslht5+CcxLcEoJnCFu2Rbvy9n82zk2crm5l7ZYhFXvIV7
         Gj7EZaIVv7SInSn9T0bG80UTq5yVttKMZ4vDQ8NV74HwsPBDijGyzIL6A4OlOAPAN8fl
         TiCiJDd4qXQ9yeyk1PoHiLfo0bFcQL5oCeRr8xxIRfJwNHOLGnN1icJGaJsXYIuzGpNB
         YXzPyb7x1l5/UE5q2ZvMab5vXMitbBZiij6ymkrHETY6RuFcvG4gHCdNpEYiKcdRfrtg
         rLIUR2C4L30VI6NKglwR1xhyU62RgFjlctdZZSaVPUJdVXg0Ry5bsw0p1DQe7PUv7Xfy
         acHA==
X-Gm-Message-State: AOJu0Yzyo3ou84jDW/f+tQ1YRd3f3JbyhNmDMqdbIxNKwuHL+g6dn4Y1
	VMJc14XH2ew1PmR9FJRNMvyIQw==
X-Google-Smtp-Source: AGHT+IEAgK4nkX/F0Q6pQCrS7KrcRoJICEjUIbdVv1AubBL1bE/d6RQuwMkcAJccfDeF0CY/d4x1Og==
X-Received: by 2002:a05:600c:3b0e:b0:406:53ab:a9af with SMTP id m14-20020a05600c3b0e00b0040653aba9afmr6290693wms.10.1696094807285;
        Sat, 30 Sep 2023 10:26:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a077:4896:f66b:df48? ([2001:8b0:aba:5f3c:a077:4896:f66b:df48])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c204c00b00403bbe69629sm3807538wmg.31.2023.09.30.10.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 10:26:46 -0700 (PDT)
Message-ID: <cc6fc822a636a0e000f9667099618eca0f1e251e.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 30 Sep 2023 18:26:45 +0100
In-Reply-To: <CADkTA4NKEMDrmN7WTa07e=NuDPC0_4W9-KcHmUQAJAhMkpprMg@mail.gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
	 <fa84ffaabc1616f617555fbf7cc2d46fb2358e51.camel@linuxfoundation.org>
	 <CADkTA4PiKOf4=y4buxMQmzZJ3BJHQtUhFSSh8VjuV2_-ETwDsQ@mail.gmail.com>
	 <01a64a17dbecdd2ea0b4364ee8440405fda215ea.camel@linuxfoundation.org>
	 <CADkTA4NKEMDrmN7WTa07e=NuDPC0_4W9-KcHmUQAJAhMkpprMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 17:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188464

On Sat, 2023-09-30 at 13:05 -0400, Bruce Ashfield wrote:
> On Sat, Sep 30, 2023 at 12:58=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2023-09-30 at 12:33 -0400, Bruce Ashfield wrote:
> > > On Sat, Sep 30, 2023 at 7:07=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > >=20
> > > > I had some difficulties with this series since it doesn't apply
> > > > against
> > > > master. The issue was that someone else had updated the kernel
> > > > CVEs
> > > > and
> > > > those changes weren't in your tree (nor was the btrfs upgrade).
> > > > This
> > > > meant all the cve inc changes threw errors. We will likely need
> > > > to
> > > > assume someone will update the CVE includes semi regularly just
> > > > so
> > > > we
> > > > can keep the noise on the CVE reports down.
> > > >=20
> > >=20
> > >=20
> > > That's odd. I always do a pull --rebase before sending my
> > > changes,
> > > but yet none of them showed up=C2=A0 (on any of my builders, so I had
> > > 3x
> > > machines running that queue of patches and none of them had the
> > > changes from master).
> >=20
> > I don't know what happened but you were definitely not on a recent
> > master branch as the changes did not apply.
> >=20
> > > For the kernel CVEs. They either need to be part of my kernel
> > > releases or not. I've updated my scripts, and they'll always be
> > > updated as part of the process. Having something / someone else
> > > update that file is just a huge pain, and we shouldn't do that.
> >=20
> > The question is whether you're able to just update the CVE
> > revisions
> > out of cycle with the kernel point release bumps?
> >=20
>=20
>=20
> I mean I could, but that's not something I want to take on. I'm not
> actively monitoring the kernel CVEs, and take the fixes as they flow
> through -stable and are tested in my sanity. So the only point they
> matter (to me) is when a -stable bump proves to be sane enough to
> send to the list with bumped SRCREVs.
>=20
> I'm going to drop the part of my script that updates the CVE file
> when I do a release, since the conflicts are such a hassle when I'm
> working through my -stable queue. I sometimes need to hold it for a
> week (or more) depending on what is broken or what part of the cycle
> we are in.
>=20
> It sounds like there's a better solution down the road, so me
> dropping the update of the .inc file won't be an issue for long.

Ok, I'll need to do it when I process your patches but I've just proven
I can do that.

Cheers,

Richard

