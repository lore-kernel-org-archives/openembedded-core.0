Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.4234.1627405523066135952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 10:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gYaVJYjr;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id h9so16815341ljq.8
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A2ktMOmHNDnCi4mn7LSHcR65OoAlVth4RprrUpE0SBE=;
        b=gYaVJYjrM2+4M8o//TTTM9wLIER/8tYPRBT0ktTk4dhyfCMfjNrGEBz05zho4EQXaq
         fMX1w/XATMXoCiJR1sUk02RMqA2dCtu/AeCnQVkU52WBm0SSsEj+/4oXaUMpwqMEKf+c
         4tRg4PnbvczgDWZoSRDPprTOXAfsJhopKSc1ULJ9m/ZLnJlhMuMA2C+n9zyrsOj+dSh5
         eqO7Bn+YgdIUqV5u6h8WDiKqn4iTHoZrBmkI57WQN1LTF59+L8D5fsuyaywXA4qGayF2
         TWBv0qxIE01XFRWkQx9AV43/DEb65P0DcSsy/DhwJmpGM2srYpr3UA2rlOwont1IvWh1
         9NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2ktMOmHNDnCi4mn7LSHcR65OoAlVth4RprrUpE0SBE=;
        b=Qr5drj9yv4AMdXRI9mMTa9Aykx7kmOaIoPw8WqzYDMllgeFZ37U0SLEdcK5gXH8JEb
         wFFPaRQkEiu0D9tDObEPcRUfUf221/FEecka24G6vU0rmQ7GHgwHYxNkwlLQh3mFHjDX
         otEli/3FSV2XgTpDcT3WKutYcd2JR/RvYxNnLQ6inW2JzfbD4+gvrded8GCj+BMXDGrm
         lYS84gNK0oyKncSQ4ngS8NHtzawiMiBuQmjKdRzOe6DhcBHcvgcD6dND34EG+ZaO1T+9
         fe5dKW9y2N6hUtDBA2K4kqgNJPme+Qf6n68yqwoJyujw25LEgfaBVUH87jjrNbOYgqoo
         5NcQ==
X-Gm-Message-State: AOAM530jJZgGfTqV7SXzkPcSwsGbdjfjgcCLbYE8O1IgUYwKohP6bZuu
	wMaWLh+X6w/RWjlojsnQyYtsVLEbNvDOihXL5Ro=
X-Google-Smtp-Source: ABdhPJySgbFFWlrhkhqGM8T9fAX5ahGdwJTZRAGJwTXKsC7fO3ETfbJ/U9YlFJQaOYUxH/yqrpMrL8cqEIT1/aMniJQ=
X-Received: by 2002:a2e:575d:: with SMTP id r29mr16537885ljd.403.1627405521344;
 Tue, 27 Jul 2021 10:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214527.2225841-1-fib@cisco.com> <20210723214527.2225841-2-fib@cisco.com>
 <CAOSpxdYek8qF+oYVSuTGfzP6zq++f711QHJJur9P=xbrFVEWeQ@mail.gmail.com>
 <SJ0PR11MB4784D0CF9A35F4D8A63630DBADE89@SJ0PR11MB4784.namprd11.prod.outlook.com>
 <CAOSpxdZj+whn8ktEPHuFxQUL=1=6bVWtD53N=cSM4waNh28JtQ@mail.gmail.com> <9f1f0b45ad9f4ac2e3dfd873d6274c926ef327b2.camel@linuxfoundation.org>
In-Reply-To: <9f1f0b45ad9f4ac2e3dfd873d6274c926ef327b2.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 27 Jul 2021 10:05:09 -0700
Message-ID: <CAJ86T=WeUSp5n2cosMQ=0=nfyRH0skjLe+Qe9MaiY3PUd67W0A@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, "Ruslan Babayev (fib)" <fib@cisco.com>, 
	Armin Kuster <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Samuli Piippo <samuli.piippo@gmail.com>, Samuli Piippo <samuli.piippo@qt.io>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 27, 2021 at 12:24 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-07-26 at 14:40 -1000, Steve Sakoman wrote:
> > On Mon, Jul 26, 2021 at 12:27 PM Ruslan Babayev (fib) <fib@cisco.com> wrote:
> > >
> > > Hi Steve,
> > >
> > > Thanks for reviewing the patches. I understand the problem of merging this
> > > patch as is.
> > > But Dunfell currently has a host contamination issue on systems with zstd
> > > installed as part of base OS resulting in broken cmake-native recipe. Can
> > > you help bring this up to the attention of the steering committee?
> >
> > Perhaps Richard can comment on this.  You are asking for a feature
> > change to dunfell that involves modifications in both
> > openembedded-core and meta-openembedded. So both technical steering
> > committees would need to agree that this is appropriate.
>
> We don't have to go straight to the TSC, the layer maintainers can try and
> agree a plan first.
>
> I've added Armin as meta-openembedded maintainer for dunfell.
>
> Context: cmake-native suffers host contamination on dunfell due to zstd being
> detected on the host. The upstream cmake community say they don't support
> configuring it without it.
>
> Do we agree we should move zstd from meta-oe to oe-core in dunfell to fix
> this? Should we patch cmake in dunfell to try and use it's own copy of zstd
> internally? The latter is more risky in that we've not tried that and multiple
> configures can be 'fun' in builds. Moving the recipe has a different kind of
> pain.

There's no need to move the recipe, just adding to oe-core should be enough.
