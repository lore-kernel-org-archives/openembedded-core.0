Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.6064.1601063398239858540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 12:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pEI++Tvt;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.68, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f68.google.com with SMTP id e22so3717236edq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 12:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qy+U9VDYVrl/ickipINg4G5nVvTF65DSxVI5Oop7sJQ=;
        b=pEI++TvtXb68BwGjHIwhrF1olF+106ZgYTbeyg8ud2SVdx2q8l+896LIxjM6hZE+IT
         vpJbxB6S+nUZSExshIBlgRCppY8sv4ubisZAdHiNb+/3QSjq6iH+73i8Q2XCAehDu7P4
         aNGClFfnhEMYII7yYZyxtc//F9Td61cq2FgajYH9+x97ntyGHvDcnbeBQ0zaibF33fRU
         KOf/5wJ0nK/bezy1pVrO7qOn1b/y3TMsXstDD8y0lEL6oEpUI3D1OGIfogXhPOZwYNP9
         lvYaDmsb0Fp0xa1k+kQDOi2bJARwoyVwYBQXngj7i0eiczSYhpyMaXIPdscdzuf7/Gxu
         TRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qy+U9VDYVrl/ickipINg4G5nVvTF65DSxVI5Oop7sJQ=;
        b=mROCbkDCXZ8WpR6gq/xzvbAxBcvT08aVcjFDUC1kNFjEFb521uRzqpt/x2IuWMlEZY
         xPApHzCz+CyrBtg0lSfsnt7tc/rIhg8fjKSmn3n3Rlg0B/PAdLoV1gHqBrE6TfZsRpRh
         Xse0AU3iQX1Kg5SFbSCJN+78gReiG1LB8bO8DChcMab9Y35dJhKSgPbmfES9piJ4ztcI
         OrfyzYDx7519oXXIWk7TmgOh8OlVkg+uAsDKokk/YTy9omFG4MLAMPRHXwWmNr+tmW9O
         kYBJsWSOvwFu0Xyfbuc74ABinTTPO0LfFwn3FY3dZYZcAAE4aahsmSFMjScOg0HkEwXo
         omCw==
X-Gm-Message-State: AOAM531dyN0Mq4pipUG3a+EIm4nQBGnZQvIYPcb65Ii22qyiZ3yBUNaw
	hUezpY2+hzB1Xy4ANX45pCDzCpYZUc/vkGZXD1o6kyDbxf950NH6
X-Google-Smtp-Source: ABdhPJw3mpOAocMn7WntW1jBnsyrKMvG7UMrCuHTyvh5sbsSAHyrTkXRvRUaK/t1WLSG5XByErgq5mHC5iBAWsjfxy8=
X-Received: by 2002:aa7:d6c6:: with SMTP id x6mr3122897edr.338.1601063396593;
 Fri, 25 Sep 2020 12:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqTT==wZ7a_HzzvsETmJeYAzX16E3y+RrnZF_kw92HuMg@mail.gmail.com>
 <20200924093217.8218-1-ceggers@arri.de> <CAOSpxdYapoFJ3XtZUBNiLwzUnRXNXHwb-kx+PVAec-t_4B=TYw@mail.gmail.com>
 <3205654.9nU1JGFCk1@n95hx1g2>
In-Reply-To: <3205654.9nU1JGFCk1@n95hx1g2>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 25 Sep 2020 09:49:45 -1000
Message-ID: <CAOSpxdZ5OU2MmMAND1njOYJGJKn6GrnhJpk+RatLontx3X+deQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] packagegroup: rrecommend perf also for musl on ARM
To: Christian Eggers <ceggers@gmx.de>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 25, 2020 at 8:44 AM Christian Eggers <ceggers@gmx.de> wrote:
>
> On Friday, 25 September 2020, 18:28:43 CEST, Steve Sakoman wrote:
> > Is this also suitable for dunfell inclusion?
>
> Yes, it is.

Thanks Christian!

> > On Wed, Sep 23, 2020 at 11:32 PM Christian Eggers <ceggers@arri.de> wrote:
> > > The perf recipe builds fine for musl on ARM.
> > >
> > > Fixes: d758a4445a ("packagegroup: Disable packages not available on musl")
> > > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > > ---
> > >
> > > On Wednesday, 23 September 2020, 18:38:06 CEST, Khem Raj wrote:
> > > > On Wed, Sep 23, 2020 at 1:46 AM Christian Eggers <ceggers@arri.de>
> wrote:
> > > > > The perf recipe builds fine for musl.
> > > >
> > > > which all architectures did you build on musl ?
> > >
> > > only on ARM.
> > >
> > > > Regardless of that we should still use PERF var so non-core
> > > > architectures can still override it
> > >
> > >  .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git
> > > a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > > b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > > index 1c94653d72..d437e28311 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > > @@ -28,6 +28,7 @@ PROFILETOOLS = "\
> > >
> > >      "
> > >
> > >  PERF = "perf"
> > >  PERF_libc-musl = ""
> > >
> > > +PERF_libc-musl_arm = "perf"
> > >
> > >  # systemtap needs elfutils which is not fully buildable on some
> > >  arches/libcs SYSTEMTAP = "systemtap"
> > >
> > > --
> > > Christian Eggers
> > > Embedded software developer
> > >
> > > Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> > > Sitz: Muenchen - Registergericht: Amtsgericht Muenchen -
> > > Handelsregisternummer: HRA 57918 Persoenlich haftender Gesellschafter:
> > > Arnold & Richter Cine Technik GmbH Sitz: Muenchen - Registergericht:
> > > Amtsgericht Muenchen - Handelsregisternummer: HRB 54477
> > > Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter
> > > Trauninger; Markus Zeiler
> > >
> > >
> > > 
>
>
>
>
