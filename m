Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02FBC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 20:51:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.20330.1676235072256723956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 12:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EwEVHIlL;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id ch10so10810359qtb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 12:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ABNGaBeUWl2TZtkyebTTT7EUT78kMusvw59hyu11xc=;
        b=EwEVHIlLwuUP+Vv/OWO1YZMjp9Tb1pmRd9bLbi8A23GURoI4rVIy8l2avAEvLOEu80
         gAqwVbNESTTknl2UQUtDfWujxbyGH2HpkYkqFqPMsl+NbPd9Zs46WDmIb7EylOdhq+hG
         FfJlihs2rsY/Hr/OP5Wd3xZilnK8/Le8H8UNDKI8dzBqrTgQwodFB2rxsG7vFkCbUNZA
         biX/ZBYCOfsyDWoQ03DneKmaSDD3AA8Q3eRjsfBRV7mlPOmjksoUN9a56RHimAq/4J27
         OleEIkg4FzrXtMziqHevyYexWDS+DRisqY4EkDaLTfoVr54um0vqg4HtA2rT/l5hLxQX
         OH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ABNGaBeUWl2TZtkyebTTT7EUT78kMusvw59hyu11xc=;
        b=0GQ7DW23ttL1OourQJwS1SSDhmRTEudV63XlBRrM5n5tN9kuv80s/bs5DyEYP4iOGH
         Rs68M5bEfKvEGmnCkK7NqhrYYha9fjHkNdiZl6SdMqgJOsTmw1HYnTISGZiHgY+dW01O
         Ms3ki9wd83m17FhGeJau5n90BL3yLqQVQDU8O6qr1fWOg9QYgccESfEjPTBvzDcFPzzB
         gVQ/VTVv8Absx7ffz9qTGyxdCVkHecsp4G6FEpTAz+eU/JmKWaPCCA0Pw7UEUINgOLzi
         Xo20SsEkADfF7GoEX/TBjpZzDhqbiaYQWcV/71YmZ2SO5kCL8MtBiOJD+EQxQg2OjznE
         zHdA==
X-Gm-Message-State: AO0yUKXbyUn1rXv8EcObzomvl+t/+K/YQnCLNIqi1MA+fgS56q/QlXJ4
	5U63Wa7BPhuCs3YuX0xBc+U=
X-Google-Smtp-Source: AK7set/3u9hkuVc7RX5+73sDoFhUqH6YqDs5wi3QCkAQE77w4WWoo2EOb151Vy2xQe6oYPYUQbPi9g==
X-Received: by 2002:ac8:5b01:0:b0:3b8:2e36:efd with SMTP id m1-20020ac85b01000000b003b82e360efdmr38457957qtw.55.1676235071320;
        Sun, 12 Feb 2023 12:51:11 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c18-20020a05622a025200b003b85ed59fa2sm7989039qtx.50.2023.02.12.12.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 12:51:10 -0800 (PST)
Date: Sun, 12 Feb 2023 15:51:09 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/2] python3-dtschema: add dependency on
 pylibfdt
Message-ID: <20230212205108.GA22684@localhost>
References: <20230210142539.28035-1-twoerner@gmail.com>
 <CADkTA4NwY6tb6HhA6LGk5dGxarbQzyrRS=H=i8u9TY8gBbAMZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADkTA4NwY6tb6HhA6LGk5dGxarbQzyrRS=H=i8u9TY8gBbAMZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 20:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177043

Hi Bruce,

On Fri 2023-02-10 @ 12:44:12 PM, Bruce Ashfield wrote:
> On Fri, Feb 10, 2023 at 9:25 AM Trevor Woerner <twoerner@gmail.com> wrote:
> >
> > dt-schema has a dependency on pylibfdt.
> >
> 
> FWIW. I find that the pypi libfdt lags quite a bit, and isn't updated
> often (that being said, there aren't really updates in dtc either, so
> it probably isn't an issue).
> 
> When I've been building it for supporting my other projects, I've
> ended up using the main dtc git, and meson to do the build and
> install.

One source base builds both dtc and pylibfdt.
The latest release of dtc is 1.7.0.
The dtc recipe in oecore is 1.6.1
The pypi index has an entry for pylibfdt 1.6.1, for which I've added a recipe.

I've been kicking around a couple things and could use some input. On the one
hand I tweaked the dtc_1.6.1 recipe in oecore to update it to dtc_1.7.0. I
also added metadata to additionally generate pylibfdt_1.7.0 from within the
same dtc_1.7.0 recipe, controlled by a PACKAGECONFIG.

How would you prefer to go forward?
- (I assume you would be happy to take an update of dtc_1.6.1 to dtc_1.7.0)
- updating dtc to also generate a python3-pylibfdt package
  - should this be controlled by a PACKAGECONFIG? or be build unconditionally?
- creating a separate python3-pylibfdt_1.7.0 recipe that uses the same sources
  but only generates the python3-pylibfdt package

I can put together a v3 when I know which path you'd prefer.

Best regards,
	Trevor

