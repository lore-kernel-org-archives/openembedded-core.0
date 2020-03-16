Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4753760214
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 19:18:11 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id m33so15277441qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hOsu9m0OOJ5BQBwUF0ZbyVwVW2zbdKvuwkYHOB9k+n8=;
	b=J51tiWv/DM2hpK+3DTR7PCbYVuqKCqB7G4bwQFbW5dmXc5/supp0XSEPt4xDnFj19f
	D7OMvvBUWRfLUNNU1RSdDiAG1UFtU8X34j59TwYs19iJtkHyUWnQIiwJlaRbrj2og1+U
	l5+OtC1hYKCitoykLKeeNdgqJXgOdTbZv3YJ7y4HwIrqbnHi8jiW5ogW/PeVfhYc4Zbo
	JInDAvhQs6iFKKFCkwUGR7dE0smclKcQdegUCOe5nQCWcjIMAxx4VILgY9Ixm1Go8mvP
	RiAHc9BbCfGIaFlKpdzMi2algdMTGg6J2dyb3cA8siGXGA34qC2rEOXrylixchzf1PhT
	2RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hOsu9m0OOJ5BQBwUF0ZbyVwVW2zbdKvuwkYHOB9k+n8=;
	b=GbGWw6RpbcqjKc2NRlj8LUaTLcNZL5BOb9UlKq/VEmOUcvTC/hutOs1JVqkMVuU0ys
	wB9wnARiZD62EV6IPgHe09x3A8ZW4HFgpnGhg4WJ3gF3PiFNmAo3JFL9vKmb6RmF+er1
	UPOd1V191CJsApN3Xvma3yxJiS9BLpFXsfa8bbX5w37ODZEel0ydadKjNAUf4IkesQ51
	3ydBuFEC9DKmJxMWFgOIpZ78AzEvMknZolvXBkurO6lHinwNCIr/Y5vVIyn5PLv8bg6S
	GdrDI3HoVVLJpzTp9tqeCDDtWi2h09NVykWFv2h4okeP+PFyCtjkp07QrrqRFZDOPHrK
	YjBA==
X-Gm-Message-State: ANhLgQ1I/1m/6ljoVyx2rfNU7mt0Y9GX+Kd1sPg/lfAIQW8zxLNeWc5O
	ErFBa4NyzXn9VWLR+Kj0nP6wVLiHulzwS+1zeQQ=
X-Google-Smtp-Source: ADFU+vs18jpH3TA3nHK+ZLPN9xP+KyQP0OoQuVdoa9OQH3JiZbeoLv6aEMSGt1zrt8MMZ7zhkhr9Vp1A2UUZz+6CJ84=
X-Received: by 2002:ac8:3003:: with SMTP id f3mr1633069qte.293.1584386292638; 
	Mon, 16 Mar 2020 12:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200316190628.19383-1-raj.khem@gmail.com>
	<62485e60-999e-54c6-09a6-590a8a3e2072@gmail.com>
In-Reply-To: <62485e60-999e-54c6-09a6-590a8a3e2072@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2020 12:17:45 -0700
Message-ID: <CAMKF1spN-06_oN-gnXO8osuKva3DerMBoGJ8zf41ybQPtm2Csw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: Extend parselogs to rpi4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Mar 2020 19:18:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 16, 2020 at 12:12 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 3/16/20 12:06 PM, Khem Raj wrote:
> > rpi had additional diagnostics which should be ignored [1]
> >
> > [1] https://github.com/raspberrypi/linux/issues/3195
>
> So does this mean OE will take similar patches for every BSP in the world?
>

suggest a better way and I will do that in BSP layer.

> - armin
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/lib/oeqa/runtime/cases/parselogs.py | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
> > index cc4f5f8c78..48712d4dac 100644
> > --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> > +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> > @@ -183,6 +183,11 @@ ignore_errors = {
> >          'Failed to make EGL context current',
> >          'glamor initialization failed',
> >          ] + common_errors,
> > +    'raspberrypi4-64' : [
> > +        'bcmgenet fd580000.genet: failed to get enet-eee clock',
> > +        'bcmgenet fd580000.genet: failed to get enet-wol clock',
> > +        'bcmgenet fd580000.genet: failed to get enet clock',
> > +        ] + common_errors,
> >  }
> >
> >  log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]
>

