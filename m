Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.2318.1589582022497001302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 15:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nIZpS+Ch;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id k6so4445712iob.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 15:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pfsj35xQmAXYBxVrWhzbOXsXwGY5cw7bo0lV//fQHB4=;
        b=nIZpS+ChFzCp/YGHrdZspOWL9SxPWbyQo/H2jnL1rGDShb6oI3bCR/ZmxkQR3cI4QJ
         TIbwxu7iiY2Kg2N2AZqZ4u23WT64A/TRRS4ABzhttqr3xq3lkdCWYowUM8G6Pm79hevF
         mCiux6uaT6f1c9lk1MS0Yo+Irc3CSqdpyq5w3vAPQLOTFPnTb17J6zg92nUn4MeWpMe9
         f0RmoGIYy20mEQi4bnEtugc+AbZLTBR8KqlcElxFGoLW8OOlBRtYz6AO4SN3aYzXvXJZ
         sSAJU5xS0GEaAgCjtDA90GPr4n/o6tNb27d5hXU4DhHXB2DN8KK/apf3tseiE9G+xahH
         urXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pfsj35xQmAXYBxVrWhzbOXsXwGY5cw7bo0lV//fQHB4=;
        b=KIPOBr4abBTBbbbD/ohfehKZR92TnlGnjI04f94DSBPLLwYLfQsQ14VSq/oyAZEYIx
         GQagl5G4X453ZA91Skn6/OyCI26kvHA+7vxEiEbK6WPsaekfI4HYym7915+h5gtPNsdT
         qtiBOu/oB+jOJFkwBGYs/VdJA/ufvtmGrh0wZzVuRD9TjhyGUdiJbgAyzSeNczAGlC1t
         IecpG8Qa9VU1tBB7sUSCAkMHsvsTnPrrk+De5BQ9n2FYJ9neAB5aUC9o2W7hwlgJfDOz
         TxgTt5QN8sUh0n23WmTsxHD45ohCCn6cRyDmw8D4J9DdYeUCP27XroFPVHqTO9PUK7Q/
         xUdQ==
X-Gm-Message-State: AOAM533OP9goRM3wTSTEEJFdGj2ky4QVL0micTS7SQz9YhwWgnH6LHYn
	IaFb1VZGA+oN8S6I3vC05Z2LmPkOt6dlF+HfUkg=
X-Google-Smtp-Source: ABdhPJyEt2EtVc2RS+fHboj8GNuc7Y+g8Qk4ukk+dNL9ozgEVMW8Ii5g/yJAMKriZ2KReZQ2DQePLpvNfI0PcEtTqFs=
X-Received: by 2002:a02:b149:: with SMTP id s9mr3862107jah.81.1589582021860;
 Fri, 15 May 2020 15:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
 <20200430214203.26595-2-schnitzeltony@gmail.com> <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
 <160F50EDD3A6B1F2.685@lists.openembedded.org> <160F519E3DB5CDF9.29809@lists.openembedded.org>
 <CALbNGRSf9iwrBgGAqZ2GMPOX8hXoZu_JGQ7qt8Y5+M6N7n6ozg@mail.gmail.com>
 <20200515215933.GG11927@denix.org> <CALbNGRQRwbEd0QhPEpCPRMWiDCwC8_Owi67opUkrXinRqC7D6w@mail.gmail.com>
 <20200515222132.GH11927@denix.org>
In-Reply-To: <20200515222132.GH11927@denix.org>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Sat, 16 May 2020 00:33:29 +0200
Message-ID: <CALbNGRQq3yiEEoNkzUSFE7Z=H8iJ6E_Ja7DTFz8Pp346xd7otQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
To: Denys Dmytriyenko <denis@denix.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 12:21 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Sat, May 16, 2020 at 12:10:00AM +0200, Andreas M=C3=BCller wrote:
> > On Fri, May 15, 2020 at 11:59 PM Denys Dmytriyenko <denis@denix.org> wr=
ote:
> > >
> > > On Fri, May 15, 2020 at 11:52:23PM +0200, Andreas M?ller wrote:
> > > > On Fri, May 15, 2020 at 11:42 PM Andreas M?ller via
> > > > lists.openembedded.org
> > > > <schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > On Fri, May 15, 2020 at 11:29 PM Andreas M?ller via
> > > > > lists.openembedded.org
> > > > > <schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
> > > > > >
> > > > > > On Fri, May 15, 2020 at 10:30 PM Martin Jansa <Martin.Jansa@gma=
il.com> wrote:
> > > > > > >
> > > > > > > This seems to be missing features_check inherit, so that REQU=
IRED_DISTRO_FEATURES doesn't prevent it failing in my builds.
> > > > > > >
> > > > > > > Will send patch shortly.
> > > > > > Do I miss something? It was never applied
> > > > > >
> > > > > > Andreas
> > > > > Ahh I did not find it due to Umlaut in my name - it was applied
> > > > > indeed. Author is now Andreas M?ller now.
> > > > >
> > > > > Andreas
> > > >
> > > > And to turn this completely off-topic: on each mail I send to the l=
ist
> > > > I get an email on extra thread with  'Andreas M?ller via
> > > > lists.openembedded.org' in it's title.
> > >
> > > https://en.wikipedia.org/wiki/DMARC
> > > https://wiki.list.org/DEV/DMARC
> >
> > what do yo expect me to do
>
> Has nothing to do with your name, but with your mail server and DMARC pol=
icy.
>
> Many of us are in the same situation, and we learned to live with it, if
> cannot change it. Moreover, layer maintainers actually have to change nam=
es
> like that back to normal manually before applying patches...
I consider this a a not acceptable waste of time and not acceptable -
so I'll go 3. for oe-core.

@Khem Should I stop contributing in meta-openembedded either due to
extra efforts caused?

Andreas
