Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6005CC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 16:08:11 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.38413.1653926888065436630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 09:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cUKQbX0V;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id er5so14128199edb.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bU8EbcEnUj1JpLY7UGYySsy1HgUicZQkJEk18ATMn1E=;
        b=cUKQbX0VWNXT3T6NVTjpWSEK+UL6V5WuGetrpnRScgmiW/fzWZe4u2eJUZFkRTtMeR
         /0c7/qt8ZfxWa1vs7uq3AUeFrPMl5GerGM04HCYKDVSLf3n72tYPQ2PKE1otCQNQqP29
         3r9VCsfoDrXlOI5FlXppJ3Ozqs4DYQPdNWnBqWBv8KHg2Jjb3sqGXL7uIg5+WgS4VGmi
         BNzvE0zJ6gxq0dGdM16WKT5Gr51jomDITJu9zBWFv9E71BNnn5W74uHk3STOCxpaX5xX
         OPcQYZdiwU1o7T/RkL3EVKnrt1Gn/TE49oSZd4M2jOK1CPw+yKADuIJzKaacLnhEJPsy
         H/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bU8EbcEnUj1JpLY7UGYySsy1HgUicZQkJEk18ATMn1E=;
        b=N/0vM0bl2dxWtR0PerDvuTX6s/c6/jCZl+hDYLdNt8y1g2V8bAP5d0d1B2QXNoUjla
         IT1d3bdSUD3q82t4yi86KuxoCycAujj9IdfEKPZA/T9S3+4gBsgol/0U1qONiLE8e7Zl
         2gUBfNFC7DhB2dr6pUqca7dC770O/y5BFcjGPXuZVSwH1XbLutdTL14SfKN0dA8Lhuus
         45Cf+ee6VTHUZE3/2d0BxfI0V1Uzu2lN9AtqfDreMKdyJNjRk1bomVF0GP74TBkk0ixO
         g4D3zcVwaDMPuxuUk3vU/eFkVU2XSOl5It7DSx7rN1Ac5oklO5Xlte89k9kUddtYaj70
         7lqg==
X-Gm-Message-State: AOAM530+a+tPeF+Dmu6kElaFnBZ3gnx9yzzIyvGj3xteIz+sI0K91Ojd
	4ufyVGcq3Y3QK+SBfSaCs4Wyh/VI7QUDmSH0uFfksA==
X-Google-Smtp-Source: 
 ABdhPJyaISXllOXSzZnDkZLU1ozPxUvs3lGMwGXSQgZBRSBiiu9Fb57wdGn1mI6wBA3hF5zRT7ORANdxY+Rh6qZ4vck=
X-Received: by 2002:a05:6402:5409:b0:42a:a643:4eb8 with SMTP id
 ev9-20020a056402540900b0042aa6434eb8mr60599022edb.71.1653926886277; Mon, 30
 May 2022 09:08:06 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAGDS+n=zq+79_JrEC_s-X_f9BEMYXWsyZZrogUk1Z+iLjPvgKQ@mail.gmail.com>
 <10230.1653926289490240388@lists.openembedded.org>
In-Reply-To: <10230.1653926289490240388@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 May 2022 06:07:54 -1000
Message-ID: 
 <CAOSpxdbhaQueM4fm0+_m_7K7+TB5M84GkjAOkUeabkNX3LmP7Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libpcre2: upgrade 10.39 -> 10.40
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 16:08:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166291

On Mon, May 30, 2022 at 5:58 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> On Mon, May 30, 2022 at 08:49 AM, Steve Sakoman wrote:
>
> Delete CVE-2022-1586.patch, wrong CVE code (patch included in 10.40).
>
> CVE: CVE-2022-1587
>
> If this is the case then you should submit a patch for master to
> correct this. If people agree that the version bump is suitable for
> LTS I would then take the upgrade patch from master along with your
> patch to fix the CVE confusion.
>
> Do you mean for kirkstone? Because master doesn't have that patch.

My bad! Juggling three branches and looked at the wrong one :-(

> Also if this update is a problem I can just rename the patch so that cve-check can work properly.

Yes, could you fix the CVE namning issue in kirkstone with a separate
patch, and then resubmit the version bump patch based on this change?

I'll definitely take the CVE naming fix, and if there are no
objections to the version bump I'll take that one too.

Thanks again!

Steve

