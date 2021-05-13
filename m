Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.13416.1620913019275518959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 06:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i0Ke+yK0;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id k10so8672451ejj.8
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ULr2qCFyAxNw8cwOqy57RV4/jjD0fIe8olvqHuNDQz4=;
        b=i0Ke+yK0Gzp2dcQZz/7+Ru9yRYlmY1gDFVcZfY2RmMC1XUHO3apIPaSeLZtZsVEPKr
         61elPe7nLubiE/9EzW/FuxgJC6dM5tvUTPVnbInh1z6AMZELffBs9m8v7+G13ehQczNO
         vd5AR25gq4ggSlMYOu7zQV1wS89UtzcNYzobLe6EWb8uY+AR1TNlt9dz58IYEFJYp2YS
         pBBITpM07rF7yJHdANWy7R5zHLuhQ0BS14v13rcIsL7k8ePFcKUzUOhBq5JaJtgzZ1VL
         NTbrN5rcTqwLegdpUku+GIAjced394OS0B4ag23LJO23Tp1Cp7eapnFnbD9XrZidLZ0f
         xs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ULr2qCFyAxNw8cwOqy57RV4/jjD0fIe8olvqHuNDQz4=;
        b=HqvbU+Y94nYyWja+c2ZyZ0/eTl0GZUjOElGY2Z7q8XkBQf311YaCa9RbyT57FfzA3Z
         7U0ovR5757sbhqjs4+uvs//x/x8KdDbU2NXO8qQCFrR96jOtJphzEbyvZVnnxh5Oyx0O
         IbP70t2Z0ZbAexFBxUpE9W57hkxY5T7TGF50YY/qQBRFmIXzGQzjBibUdYY/aCOQbkmh
         CInIjBt21Ubg9mcG4j7VMZQZjrfHBZmHVzehocXArIPeSb4gJ9+P0dgW0YZgrDiUlogf
         NDnmo/QEfxDMTS6wNrmwX1gZPZab0NldhfQmUihN5cCB/azOpj9kGKS+UtUkgIW1Spm8
         9CGw==
X-Gm-Message-State: AOAM532ImyESrZOddxaBwhErisFTVTGwfEwkyAcwG4ItgGVzoho6tkde
	UerPFm0HtGFPNsDofEZqGSAaQ+ku2yjzPQS9Kh4=
X-Google-Smtp-Source: ABdhPJx+C2/b6ovuhaTpyGbL1KAeIm43ORJG7WIVEtjP/15gCfKZDNF+Y47Q4T/gbP6t8LlKIM7HGze0xHv8szcNmwQ=
X-Received: by 2002:a17:907:3d8f:: with SMTP id he15mr43172302ejc.22.1620913017770;
 Thu, 13 May 2021 06:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com> <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org> <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com>
In-Reply-To: <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 May 2021 09:36:46 -0400
Message-ID: <CADkTA4NeYBn6CqRWqfTOmfZOaXTHvf_0=-WWUtkubVsngS2e=g@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: colin walters <walters@verbum.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 9:27 AM colin walters <walters@verbum.org> wrote:
>
>
>
> On Thu, May 13, 2021, at 3:08 AM, Richard Purdie wrote:
> >
> > I had a look at the code to try and remind myself why it is doing this.
>
> Thanks!
>
> > The best answer I found is that it does support filtered fetching of
> > remotes, i.e. it can and will only pull the branch it wants/needs rather
> > than a full repo clone. In the case of a small repo, it doesn't matter
> > much. For a large repo it can make a significant difference to the speed.
>
> This is with `git clone --single-branch`?  Makes sense.
>
> > We also don't run "test" commands against the remote repo, we figure out
> > what we want and then get it with small numbers of commands.
>
> I think what I'd argue is that in the case where the remote branch is deleted,
> the tooling should fall back to listing remote branches, sort by
> most recently updated, and try finding the commit on that.
> And in practice, explicitly using `main` first in that list would make sense.

The tools really shouldn't be making decisions like this on a recipes'
behalf. It is complex and just doesn't need to exist when we can
simply specify the branch.

>
> > Is explicitly specifying the branch along with the repo url such a big
> > problem? We already have to provide the url, it isn't like we guess that
> > too.
>
> The problem is that your build system is penalizing upstream projects that are trying to migrate
> to using `main`.
>

Similarly those same projects are completely deleting those branches,
versus no longer making them the default. Which is penalizing the
existing users.

Bruce



>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
