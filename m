Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.28241.1590723603041158254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 20:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eNY9cngo;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id u26so5814156wmn.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 20:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NtY1IPfujvK1S3Rn1q9j7WC+LnabeCaqFb1NyVUBMh4=;
        b=eNY9cngoVFnMMoRWE+r+gET/E7z+iZCaoJLcqMVzvu/7KOAehOt+g2wyrjScoM932K
         0cpupFjg0RSOR1srxhsrjQ6xInZg/7LOUcc5e8HsqBANOTQyJrLCs6UqIY9HHdhSIGcG
         xqr9ob7ClGYboclktCbMjf4WhchojQ2UQubp+2SsPNkDQyqBSeGzJm2dd8iHHb9DAP+d
         vA3iMgBX+zyLlDUibFNBYRM5bSmPgxgSXLr812MS5vw1tB4YTgsUW0hA/wHmOMotzg1u
         7f4T3JFtkFl9hQ9dhldn8jY5Eao9P9Y1gk0B82turBc9LX+dIQMSpdKnjKGzHDjnegJd
         j8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NtY1IPfujvK1S3Rn1q9j7WC+LnabeCaqFb1NyVUBMh4=;
        b=cjQHpDj9lGiBO9TZkxrIck47NcPuDNx5AuwJLPDHFiJo9L5RYGpmhDBEtJhNq1NcSu
         V2KI0zA7PHRiS1kAo2NEK1jYPVfguqNvuMkE9+/yFvOzfJCIwLDdSGWn8g4SsgJYFXvP
         Dojidsyg6TqiL+O+pVXeB8rxz+mvEOjISIJkSz9Ua6zPch3L91OjMMubL48cIWW90MpA
         nmXZyQ0amb2abncaqISp6iOUpYZHFWxwOVKIEjCqHAJRfpgj3rcOvquKPelpqPX9/9hu
         x3UTGXeDb1dBmZizAAEPZ5OaDYDneac/4/eipFtxf/Nr60o7AdZoRZ8f72hVhaLGpqiu
         KGGw==
X-Gm-Message-State: AOAM531lqlhNrxjSerUs1j9hYFYbavrx1iFpEU1QlpS7Qgh7QhW47Cv7
	lnxZJhzyqmgvMXaRq/p5HUHzrxu/CcomiH4ZBdY=
X-Google-Smtp-Source: ABdhPJxh8rR0sBQYjOBQRjF06/nJzqiHEGUD8FUP1n9VrkAm4y7E5BTAmpPAx9+CLJVlrBGBSzKQVDeNo0brLGjA3MM=
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr6400227wml.188.1590723601490;
 Thu, 28 May 2020 20:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <1590392749-329454-1-git-send-email-michael.ho@bmw.de>
 <CAGDS+n=SfCk_+DeBghVu80=f+RfEJ39Hg72xPG2iUyTwz6WY7A@mail.gmail.com> <5483300D-5E77-4407-8C5F-317F33B4FD56@bmw.de>
In-Reply-To: <5483300D-5E77-4407-8C5F-317F33B4FD56@bmw.de>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 28 May 2020 17:39:50 -1000
Message-ID: <CAGDS+nkrE44ia5v=Gs3OdFk5J4tO5t1QnxBNdoSseXd5u3ErMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm.bbclass: respect package overrides for the main package
To: Michael Ho <Michael.Ho@bmw.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, May 28, 2020 at 1:30 AM <Michael.Ho@bmw.de> wrote:

> Not sure if that question was for me or the general community. I think t=
he follow-on series fixing the sstate-caching might be nice in dunfell but =
I'd defer judgement to the community about this one as it's about changing =
a behavior in the recipes and I don't know what LTS guidelines there are in=
 place in the project.

Both :-)  If it is changing behavior then it probably isn't a
candidate for dunfell.

> Should I in the future address patches to the dunfell branch? (Where mig=
ht I find the guidelines for submitting to dunfell vs master)

Yes, that would make my job easier.  I try to monitor all of the
patches coming in, but my knowledge isn't always deep enough to know
whether a particular patch is appropriate or not.  In that case I'll
often ask here on the list.

But if you tag a patch with [dunfell] then I'll know to give it
careful consideration and testing.

The general policy guidelines for LTS patches can be found here:

https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS

Thanks!

Steve

> =EF=BB=BFOn 26.05.20, 19:02, "Steve Sakoman" <sakoman@gmail.com> wrote:
>
>     Does this patch (and the follow-on series) make sense for inclusion =
in dunfell?
>
>     Steve
>
>     On Sun, May 24, 2020 at 9:46 PM Michael Ho <Michael.Ho@bmw.de> wrote=
:
>     >
>     > From: Michael Ho <Michael.Ho@bmw.de>
>     >
>     > Apply ${PN} to OVERRIDES when determining the base package spec va=
riables.
>     > Without this, there is a mismatch in behaviour where overrides for=
 the base
>     > package have no effect while overrides for subpackages do. The sub=
packages
>     > should not be affected by this override as they apply their own pa=
ckage
>     > overrides and will by default fetch the base variables and apply t=
hem in
>     > the spec file.
>     >
>     > This makes the behaviour for package overrides match the implement=
ation
>     > in package_deb.bbclass and package_ipk.bbclass.
>     >
>     > Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
>     > ---
>     >  meta/classes/package_rpm.bbclass | 22 ++++++++++++----------
>     >  1 file changed, 12 insertions(+), 10 deletions(-)
>     >
>     > diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/packa=
ge_rpm.bbclass
>     > index 9a4be2e..519c22b 100644
>     > --- a/meta/classes/package_rpm.bbclass
>     > +++ b/meta/classes/package_rpm.bbclass
>     > @@ -286,16 +286,18 @@ python write_specfile () {
>     >
>     >      # Construct the SPEC file...
>     >      srcname    =3D d.getVar('PN')
>     > -    srcsummary =3D (d.getVar('SUMMARY') or d.getVar('DESCRIPTION'=
) or ".")
>     > -    srcversion =3D d.getVar('PKGV').replace('-', '+')
>     > -    srcrelease =3D d.getVar('PKGR')
>     > -    srcepoch   =3D (d.getVar('PKGE') or "")
>     > -    srclicense =3D d.getVar('LICENSE')
>     > -    srcsection =3D d.getVar('SECTION')
>     > -    srcmaintainer  =3D d.getVar('MAINTAINER')
>     > -    srchomepage    =3D d.getVar('HOMEPAGE')
>     > -    srcdescription =3D d.getVar('DESCRIPTION') or "."
>     > -    srccustomtagschunk =3D get_package_additional_metadata("rpm",=
 d)
>     > +    localdata =3D bb.data.createCopy(d)
>     > +    localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + =
":" + srcname)
>     > +    srcsummary =3D (localdata.getVar('SUMMARY') or localdata.getV=
ar('DESCRIPTION') or ".")
>     > +    srcversion =3D localdata.getVar('PKGV').replace('-', '+')
>     > +    srcrelease =3D localdata.getVar('PKGR')
>     > +    srcepoch   =3D (localdata.getVar('PKGE') or "")
>     > +    srclicense =3D localdata.getVar('LICENSE')
>     > +    srcsection =3D localdata.getVar('SECTION')
>     > +    srcmaintainer  =3D localdata.getVar('MAINTAINER')
>     > +    srchomepage    =3D localdata.getVar('HOMEPAGE')
>     > +    srcdescription =3D localdata.getVar('DESCRIPTION') or "."
>     > +    srccustomtagschunk =3D get_package_additional_metadata("rpm",=
 localdata)
>     >
>     >      srcdepends     =3D d.getVar('DEPENDS')
>     >      srcrdepends    =3D []
>     > --
>     > 2.7.4
>     >
>     >=20
>
