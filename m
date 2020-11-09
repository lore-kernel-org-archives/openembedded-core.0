Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.17710.1604953126133391098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 12:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l9SOB3Yx;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id 62so8077602pgg.12
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 12:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eRLIWz5S6+NYA179zbwY/sUfVNyczM7E7N/Fp+M0F80=;
        b=l9SOB3YxaNg/NFoHW5hdVEYZdfcoZNsO2Ch+Y9XSi/MI514iWlqfmGVuoiFsg2ZJ1x
         J4YdTzMKhsqXV3Xlq4Kp7TR/c8BtyxJPDmao3fbpEqtxKj4+ri74KsuUrwSnv7+Pg/cN
         Tm6ggyvA2+BS/LAx64y9hg0crSdCxK1IGTpyDWo/tSiwg//ZSBM88Ppyi6+eRp/ccgUT
         aAXwm4CgNH+leHBN8mJ1oxJbuFYf+uFZNWx+E3rtdzrRK+tJZn8UsV9dnvM9Rp2OlHnW
         ZS44Ee0obg+uLgLjdMDkVwf82S7y1ACaM0UtNVFDm1fVeWbQP6pT5VpvvH8F0GygnZLM
         CvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eRLIWz5S6+NYA179zbwY/sUfVNyczM7E7N/Fp+M0F80=;
        b=soFV0ELGeRFYhUZU5fhA7T3YHTQc8l3/5XScuBUpBjMNShFZ6VhNZW/kSaFaid4x6p
         SnBGC5al5PoRrPqoFvx9s9wf8CIsEgpzVGS0/Nb9g0INqQF1UimUdXMwoWF8FMp9N90e
         XwHL5IQ3mk69sMxMDyiOHJWZwZjc7xbsRDOS4EAhznqVjwtiIORWRHrRwKAW5P+vNdqY
         oSMFF0E1lBnzApNr04AjtWwhWZDSJ/PZYyStBVzOj5tA7+468mDgmw1ifPhJgVXylJRF
         z0atrZvOvxbWv9mlIO8ZLa7LVxM9Eimcy1oIN8P6AgY7ECrtxb8GlVh4exFZgAXZxVRO
         zijw==
X-Gm-Message-State: AOAM532XY+apNGGZqB6NEs6vqGHZXk/ebif4Yum0GD2MxPLMyAwOPtm4
	w4o1cX3HQRc05ZugWvkX+DXc7XT6DQuIPjT+YYU=
X-Google-Smtp-Source: ABdhPJzvJqcJah2Z3KbjlfOdcbD1YnY9mr+cmpSeDHs/vhC+cEoWDH8jGq35fSSSUG+Q12pjESMSDsRF0BSP8DWuRz4=
X-Received: by 2002:a65:520a:: with SMTP id o10mr13886364pgp.319.1604953125710;
 Mon, 09 Nov 2020 12:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20201109000217.3008448-1-raj.khem@gmail.com> <CALbNGRRuWJb5OXhh6vbM+BoBw1zk2THMJYju8_GWCbGpu+UWxg@mail.gmail.com>
 <CAMKF1so5=BQx8-e+oiGN87DOt5T03aadwYAFtzxJXNGDSsehFQ@mail.gmail.com>
In-Reply-To: <CAMKF1so5=BQx8-e+oiGN87DOt5T03aadwYAFtzxJXNGDSsehFQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 9 Nov 2020 21:18:34 +0100
Message-ID: <CALbNGRTCw42KWH1tN4a-N3T7hS-9uBbzZqs5w_ZSNpDZ6sbwPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 01/11] lto: Add global LTO distro policy file
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2020 at 8:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Nov 9, 2020 at 12:30 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Mon, Nov 9, 2020 at 1:02 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Distros which want to enable LTO can utilize this file, it only cover=
s
> > > packages from OE-Core, other layers should include there own exclusio=
n
> > > list for recipe which dont work with LTO
> > >
> > > Document the needed changes in local.conf.extended
> > >
> > Maybe I missed something but I haven't seen a word why I should want
> > link time optimization. And from the patches I see here it seems we
> > are about to create another contributor's burden.
> >
>
> Thanks for your feedback. LTO is quite beneficial for the kind of
> images OE is targeting,
> It results in smaller binaries and better optimizations as well. LTO
> has been around for a while
> in GCC but it is becoming useful with gcc10+ and more distros e.g.
> Fedora/SuSE are also starting
> to use LTO distro wide which means we will be able to reuse the
> upstream work that's ongoing in
> different packages. You can see there are patches already floating to
> enable it for poky-tiny already
> so OE userbase is already starting to use it. Moreover, its already
> default for many packages themselves
> so you might already be using it at package level e.g. systemd
>
>  This is similar to what we did for enabling security flags. As you
> can see, these changes are currently optional. This means they won't
> go into effect for
> distros without them choosing to use it via DISTRO_FEATURES. Since it
> takes a bit to get
> such changes stable, we might keep it disabled by default for the next
> release depending upon
> how it pans out. Eventually, the plan is to enable it for poky/yocto dist=
ro.
>
> As far as the contribution burden, I think it won't be a blocker until
> it becomes one of the tested configurations
> on yocto auto-builder.
>
> Feel free to express if you have more concerns.
>
Thanks for explanation. At least I understand better now why you (and
others?) are taking efforts on LTO support.

Andreas
