Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.15741.1590682659639000441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 09:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sixx2mcW;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.65, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f65.google.com with SMTP id x1so581579ejd.8
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QwNl3z+lEOAcwgyVT7KLLqzmE7/NtrkLNdZu67JXMFQ=;
        b=sixx2mcWwnXpoGKk8RVSFENDq7bTD7D+PbUFfD92zq7STGw1sZoHvr3cSEpYO2TvlY
         w0luG7mYEc5o2foWGrGHc5vIRN8/FoA31iG4s4cw3QUk6r+hMwifhFycoJzERD/d3ER7
         kg1BZkrM8SIXM1ZQchlOZRiU97Sdl60o1GA9HzRlqa19nflEEP1XMcF5zZmgKjHCQ7ZG
         +EoM8SDp3isECIz8FWTiOgEg9Y1FdDvchOcy34JfI+mXx4m0NbLl39IKODyuWS2zOSAZ
         o6B3sVH5v6YHPKX6FnYlhlaqudT3cpWqRng7q0XeYlJjIACPIfMAIzNvW8Ikapovxfeg
         4yrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QwNl3z+lEOAcwgyVT7KLLqzmE7/NtrkLNdZu67JXMFQ=;
        b=WjeF55sonSqeFzqcHzFY5sXvzLHIDG4zlFErbLwWjuKjP54CW9fCditiUJaPKsn87J
         hQ+rOf7OZCRtto18j8G2vxsIIJVYXx7jK8QDm7EpRZuBLxdvwyAwqRbo3glrTI0oJoVP
         cGz5OC0PWNfTd5XeoOemHrICJaQ+slZjE/D16jb/mJIn0py6fvaO8966CdoLtqEwXPo7
         6N92E1BfEiYa7Q4kDxo477zGVYZx9uu5niuqaDmUyIIolPiapl517s3jg7bbve0mCXl0
         +cw2YbCbhwrfnPN+yTJC+X/+IzKF+Iwnv5eImbMYIYo/3dj/L31YfvjDiRykx0SQbuiI
         BMkw==
X-Gm-Message-State: AOAM533yTtIxz1V4EIA4Gc11bAHHCYDKarbDmpnhx7HHhe50Dt+saOw5
	3T3XZHKfCcoalrYzG7ui74BC8wAxcmKrOJvyfMWXBw==
X-Google-Smtp-Source: ABdhPJyCjiipsoAe7s/Uk8V07eJMUdCJcSNin2HJ0Kti2ThxDTGcQy62iEpltGKs0FaycUamm82N0KPGPvDA0f7HS8s=
X-Received: by 2002:a17:907:2486:: with SMTP id zg6mr3834528ejb.225.1590682658089;
 Thu, 28 May 2020 09:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200522220826.27434-1-JPEWhacker@gmail.com> <fb6419f4-4459-4c06-da1c-a297e9972ec3@gmail.com>
In-Reply-To: <fb6419f4-4459-4c06-da1c-a297e9972ec3@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 28 May 2020 06:17:27 -1000
Message-ID: <CAOSpxda9a+oTCMaGObdpy=VfvhJOiUcs8iFnb=psFOPsGeTQ9A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] checklayer: Skip layers without a collection
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2020 at 4:13 AM Joshua Watt <jpewhacker@gmail.com> wrote:

> I would like to backport this to dunfell if possible.

I've already got it in the next batch of patches!

I really do appreciate the heads up on things that are suitable, I
don't want to miss anything :-)

You can find what I'm currently testing at:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

I try to send a batch out for review at the beginning of each week, so
this patch will be sent out with next week's group.

Steve

> On 5/22/20 5:08 PM, Joshua Watt wrote:
> > As in other places in the file, skip layers that don't define a
> > collection when searching for a layer to resolve a dependency. Fixes
> > KeyError exceptions when attempting to access the layer collections
> > later
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   scripts/lib/checklayer/__init__.py | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
> > index 5aeec2f00f..1138000275 100644
> > --- a/scripts/lib/checklayer/__init__.py
> > +++ b/scripts/lib/checklayer/__init__.py
> > @@ -143,6 +143,9 @@ def detect_layers(layer_directories, no_auto):
> >
> >   def _find_layer_depends(depend, layers):
> >       for layer in layers:
> > +        if 'collections' not in layer:
> > +            continue
> > +
> >           for collection in layer['collections']:
> >               if depend == collection:
> >                   return layer
