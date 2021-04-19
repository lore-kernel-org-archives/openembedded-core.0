Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.4887.1618809458166057487
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 22:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c9gZVuEK;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id j3so16342750qvs.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 22:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LeWGTXJBuQlhirQEnotc6JNhij1GzZNOR/t30LHYczA=;
        b=c9gZVuEKgSDLBqzDRMPWXq2C+OOk0ey7F3iABIuBdQx3mofykdSIyumwVmueW8Lm8g
         iLtpSjsmiHrGqLZUtDqaW6464uwy+hKqMNBIB7HUs/jLmmZFHv1Ad1k7WIrEo2tWnddh
         4j7hh9nOSbepXVYXAn/uFqkzV0uRcpRxDgLVSwOrndSget7IPjAv9dOEkV1kjYHEyb50
         p0KDX60ADeIBfGMvtJ9y26oMRhta085na3Eq6fTlSDcXlIjHx06ZYPJYvBIWos/l0YmI
         QNPto6k33LUe0FU36K34sAAJbOUP9XAV+h54W/UeT+oA1md3f4dov+Inet6RgjnsiPLX
         A1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LeWGTXJBuQlhirQEnotc6JNhij1GzZNOR/t30LHYczA=;
        b=sz0rccUF+GVGARE6+O58omqk0tGxZSFi5xkV+8I2tV4Msvbjm7XDePKkQaIvIjNQBM
         VLmrt7Kp8I6mklf+TmAw/KAIG6bNzC/YdO2T/pdwFSv9RJ9tXfBRaF2GnCYlncRFcbwt
         Cg3Z4Cycon80HCSLeB7s8Uxm2sztVdod5Ye7YoiHrc2HuHTghZiJBQJPgPp+e27NhatW
         R9hdQueJwnrMBBFkx+ryQNH8LjN/Z2AUI+6Em58rC6C7DowN493AENd7Fbq3YtKY1eho
         JkrRO86JgHhKwjLQdJrs9S2KjywQoQotdoGlT82LA2y+ShadJxbqQ8ewPdrWLBVkIBdZ
         YvEg==
X-Gm-Message-State: AOAM531r8lqQ2Uh4X/E6v21Rsa9Opnv3XG4Gd5GaEXGdlQL/S8y2Q+4m
	BDEk5dMG6bjQDM5FvuhfVJFTiH+zTuz1XLL6BLI=
X-Google-Smtp-Source: ABdhPJw4bnqqmmpFwVTkUD82/mmxWtqloMD4TLm+xTohGnc2zMJ5GKaYCZBvLphVOHo4MmOYCk+6h20tKQfbpEuZto8=
X-Received: by 2002:ad4:5bef:: with SMTP id k15mr18454811qvc.16.1618809457218;
 Sun, 18 Apr 2021 22:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210418213207.1591440-1-raj.khem@gmail.com> <470e6ec7142c4202b7aaa5be3201f9ce@intel.com>
In-Reply-To: <470e6ec7142c4202b7aaa5be3201f9ce@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 18 Apr 2021 22:17:11 -0700
Message-ID: <CAMKF1so6AGSai9FxxzEWiriKcY35JU9yw3mz6m1zOD+=hYCgdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] epiphany: Add missing dependency on gnutls
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 18, 2021 at 7:51 PM Saini, Naveen Kumar
<naveen.kumar.saini@intel.com> wrote:
>
> [SWAT]
>
> Configuration failure:
>
> Run-time dependency hogweed found: NO (tried pkgconfig)
>
> ../epiphany-3.38.3/meson.build:92:0: ERROR: Dependency "hogweed" not found, tried pkgconfig
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3317
>
> Does this patch fix it ?

yes

>
> Regards,
> Naveen
>
>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Monday, April 19, 2021 5:32 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [OE-core] [PATCH] epiphany: Add missing dependency on gnutls
> >
> > This was being pulled in by other dependencies thus far
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-gnome/epiphany/epiphany_3.38.3.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> > b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> > index 889de16d00..ce24336ace 100644
> > --- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> > +++ b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> > @@ -6,7 +6,7 @@ BUGTRACKER =
> > "https://gitlab.gnome.org/GNOME/epiphany"
> >  LICENSE = "GPLv3+"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >
> > -DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
> > +DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr gnutls
> > \
> >          gsettings-desktop-schemas libxml2-native \
> >          glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
> >
> > --
> > 2.31.1
>
