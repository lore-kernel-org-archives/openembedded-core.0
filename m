Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web09.1202.1621278631123629639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 12:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gyiweYt6;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id f12so8600826ljp.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 12:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVVLu6LOdDjlt3DtFY4fckiet9iJHIGBCmFexUFEj4Y=;
        b=gyiweYt6K0j9/83ttRhJ1axEtyhowhLjvUNOuB3VCWVAlEYW5oe1gqCn1vyrKmC+3u
         JCjkHq0pjjnNSfsIG9otuthLimvKpizvz4RFR17DI6+IOtT36p+0+dfJaGPs955Ikitg
         tn39NyWDZGCYK0027IYWyCIUJZZJ51FuiRn8nCQ13tZBoYFDjgZHMNgeY3qD8kpKBfXO
         n8oi8Sp20DIWWx96edODZ7DsPNof3PaU1Mr5SfkvEHDUYHTzcWLuP7BXfnf01SUPMMfw
         GQpvzgQMAgQ9nqG6TlCMEO5e3tF+Ea58Kra5+zOq7nz3gy//H0gUoWAr6BcfGJd8q6CX
         tadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVVLu6LOdDjlt3DtFY4fckiet9iJHIGBCmFexUFEj4Y=;
        b=m2rDUWyDOAneI9DGB0NDlRIQW9CzrR68ITEdCqM49mzbEGdZp7Wam3Omq/TBtgbrsl
         Q5n3GxdiJWkIvnDqAqrOC7fwnxpey2kHs/tBU0y4gkyd6TVj46LbrTpnWHWXN1MoE02b
         9dQNQqidFnlkvu4Uvz7EN0BZDZCS6/ROAO/KVq4KaWEtjBnUs101ShJjzyLbQDWoqwpJ
         Qszs0j9Uv3DGUJqZaIcYtg9Q0qHfJouQo96JE7JKoXxmTKlC5r7SNs/wanEWAQ4rnINP
         zezDy49upWZbKVvflC1yHB1c8izW6moDfCFX3EGjACsqy+pFRX8AdOn08yj0OSmoHn4w
         6jXw==
X-Gm-Message-State: AOAM530hZd6eJH5LHhfXPx/rYKM0fN+Z+qIq25htboIP1m3lkPgbM3Gc
	cMGfEad+C0pOODU6JhIh9Ww8nteiOPLu9qMEs3Q=
X-Google-Smtp-Source: ABdhPJzh11ot3Ab8GGZqb90h0flrJikPpc4DLUMOArcOQ28hBJwviFbI0FTGIx9RicgUbyBvCd6qKUYwgUgk/WmGe08=
X-Received: by 2002:a05:651c:1a4:: with SMTP id c4mr735829ljn.112.1621278629194;
 Mon, 17 May 2021 12:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
 <AM9PR09MB46423C546EF564C11A177062A8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <a7ff2123-a71b-a4d7-abb6-85e17dcfe6e@crashcourse.ca> <AM9PR09MB4642F9F7EFE632E2F9E2443BA8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB4642F9F7EFE632E2F9E2443BA8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 17 May 2021 12:10:17 -0700
Message-ID: <CAJ86T=XxNKAzkZ1R-KNJEpoV8mXOhT9u4jfSv4B3btAHo+BJQA@mail.gmail.com>
Subject: Re: [OE-core] is there an easy to prevent *creation* of some recipe's packages?
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 5:39 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> On 14.05.21 13:52, Robert P. J. Day wrote:
> > On Fri, 14 May 2021, Konrad Weihmann wrote:
> >
> >> On 14.05.21 13:16, Robert P. J. Day wrote:
> >>>
> >>>     pretty sure i know the answer to this one, but was asked the
> >>> other day and wanted to make sure. in order to speed up the normal
> >>> OE build, someone suggested bypassing the creation of packages
> >>> that weren't going to be relevant, such as -dev, -doc and so on --
> >>> the idea was that that could make a significant difference in
> >>> build time.
> >>
> >> I pretty much doubt it will speed up anything. If for instance the
> >> -dev package will be removed from PACKAGES it is very likely that
> >> the files of that package will end up in the base package ${PN},
> >> which results in larger target packages that need to be installed
> >> (and potentially further RDEPENDS)
> >>
> >> Furthermore this will break DEPENDS for recipes that do rely on the
> >> -dev package - so chances are high that this will break (or
> >> magically change) something further down the line.
> >>
> >> One thing that you can do to speed up the build process in terms of
> >> packaging time is to delete any **really** not needed files in a
> >> do_install_append, if no proper configuration option (cmake flag,
> >> make flag, PACKAGECONFIG) does exist which prevents the creation of
> >> these files in the first place.
> >>
> >> I would recommend not to mess with the packaging defaults for
> >> reasons such as speeding things up - as this is IMHO addressing the
> >> issue at the wrong end - just make sure the files in <workdir>/image
> >> won't get created
> >
> >    that's the general idea i was trying to get across (so let's confirm
> > that i was speaking accurately). i suggested that the majority of time
> > spent in processing a recipe was doing all the fetching and unpacking
> > and patching and (mostly) compiling, the end result of which was to
> > populate that recipe's WORKDIR/image directory, at which time the
> > packaging step took over. so unless one wanted to dangerously mangle
> > the package definitions, if it ended up in ${D}, it was going to get
> > packaged, correct?
>
> yes... *but* what the packaging does it to loop over PACKAGES and for
> each item pick up the corresponding FILES_<pkg-name> var and "move" (I
> think it's actually a copy, but that's just details) all matching files
> from image to packages-split.
> If files ending up in image that don't match *any* of the
> FILES-glob-pattern one would get a QA error.
>
> >
> >    so unless one wanted to go back and mess with the recipe's build
> > configuration to, perhaps, not generate some artifacts, those packages
> > were going to be built, whether they were subsequently installed or
> > not. so short of mangling each recipe file to change its
> > configuration, just leave it alone as the payoff just isn't worth it.
> >
> >    sound about right?
>
> yes - the results of trimming down the input to /image will much more
> have a positive impact.
>
> AFAIK packaging speed is directly linked to the number of files in
> /image (worst example I've seen is a ruby package containing 250k+
> files, which takes round about 20min to package on my machine) -
> concluding from that, reduction of the number of files in /image is will
> do the trick

This thread seems to have covered the main point already (if you want
to save time by not packaging unwanted files then don't install the
files in the first place).

It's perhaps worth noting one very common case where files are
installed and packaged unnecessarily and that's having the ptest
distro feature enabled even though you don't intend to install any
ptest packages. For most users ptest should be something you enable
selectively when you want to prove the functionality of recipes in
oe-core (e.g. after upgrading to a new OE release or when bringing up
a new machine) and then disable again afterwards.
