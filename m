Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.4971.1621981132355703642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 15:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PeBRXEmv;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.41, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f41.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso14366094wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 15:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oHe5ppcNiB+KDLxeVyhg1YWBtz4AkLWv3TzEKbTRkMk=;
        b=PeBRXEmvlPaTVGUbxLDG5rKoI/VPx1+YTM9X/6pEi24Tsuknzy+lTuitLl0IslMiQY
         S5jtgtAWHmzCRz8TVo6xBRTMgO6rqCxxdsHaifu3TqWn6Q0p1KTBpR5YWXSsgmVv1ufQ
         0PfX0l/fZPyhrM0JiSxVYTty5rwJ8wBnussIaGNwPd0OBxWmUFOPJlh4hRM4XElTV1Dj
         H7VwiCdaE+PjerNFmCGqqEWF2ELYTlEsTxB7KTBhjxP8dyMD4luMh3zEkiYo09ZMDt6Z
         XmkLCmJZ1FhqIa3dVZbgYPpsYo1AcYDfwAsPAMD/V04pnLp5kaSPfr1i7pGg5igPuEXn
         wXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oHe5ppcNiB+KDLxeVyhg1YWBtz4AkLWv3TzEKbTRkMk=;
        b=eGKEXnCZvamDpnG0OVrkU5XD3EFbYzdcHRGOekvGdx0CDNpqtcHCOJbT7t6o7Pu940
         ROPrdlz1SwwFJekAIdcTbLg+tvctMFGRzPnI0P6AVnMw9sG4Lk9h7a5RvDqhFQdRcps/
         K88wxLhzEvyVUgTPCfKjEPSOOG1AXf/bRTSTUnpUEiXkg0HcMbysHXRNka96F4oEF+US
         1pIRbUlNAnkhANoqtHaE2jHLSOM/UnlfsuvzRrWZ3CCxvy/gIbpHGsjOhq5ukfyh2HFd
         mY2AnEp8I3eyUWyCLX1CLEJRnEyMZhiWAVMjVCF5DKL+kQ3Amc+f5EPT5jES5uuvi5UB
         cjlQ==
X-Gm-Message-State: AOAM5312oOfR68MjzK1j9UhatZhGiAicnOASg8PH8iXZg9EAZ8tOaxBl
	n0Qfo7rsn3hcUYMMrMm+DKJTaxyFTcqb0jN+gsGXHw==
X-Google-Smtp-Source: ABdhPJyi252WIpGqca+3bnVVt9WVJjc0ntNAfzJPUXbi+q5RqPCQZD9uV1/iSDqqL2V5gd4cGBjr8Bt2P+Wg11anDUE=
X-Received: by 2002:a7b:cd01:: with SMTP id f1mr407891wmj.177.1621981130835;
 Tue, 25 May 2021 15:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210525090910.11581-1-andrej.valek@siemens.com>
 <168247B8E1E1063C.25934@lists.openembedded.org> <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 25 May 2021 12:18:39 -1000
Message-ID: <CAOSpxdY45J4KF7m+VX68tbD2HfhKt3_FMsh_XL8VxsSpDsR3-w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 2:50 AM Andrej Valek <andrej.valek@siemens.com> wro=
te:
>
> Hello everyone,
>
> I have an another question regarding to backporting this to dunfell bran=
ch. Is it possible to apply this upgrade to this branch? I would like to ha=
ve an very important fix for CVE-2013-0340 (https://github.com/libexpat/lib=
expat/pull/220) there. But there is a lot of changes, means just applying t=
he patch is not very promising.

It is LTS policy not to do general version upgrades (see "Stable/LTS
Patch Acceptance Policies" at
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS)

So unless you can make a case that this is a bug/security fix only
release I'm not able to take this patch.

> How we can handle it?

Perhaps take a crack at backporting the minimal set of patches to fix the =
CVE?

Steve

> Thanks,
> Andrej
>
> > Subject: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
> >
> > Includes lot of security fixes, especially CVE-2013-0340/CWE-776.
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  meta/recipes-core/expat/{expat_2.3.0.bb =3D> expat_2.4.1.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-co=
re/expat/{expat_2.3.0.bb =3D> expat_2.4.1.bb} (89%)
> >
> > diff --git a/meta/recipes-core/expat/expat_2.3.0.bb b/meta/recipes-cor=
e/expat/expat_2.4.1.bb
> > similarity index 89%
> > rename from meta/recipes-core/expat/expat_2.3.0.bb
> > rename to meta/recipes-core/expat/expat_2.4.1.bb
> > index 14d2855df3..a57fc1b23b 100644
> > --- a/meta/recipes-core/expat/expat_2.3.0.bb
> > +++ b/meta/recipes-core/expat/expat_2.4.1.bb
> > @@ -11,7 +11,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/expat/expat-${PV}=
.tar.bz2 \
> >             file://run-ptest \
> >             "
> >
> > -SRC_URI[sha256sum] =3D "f122a20eada303f904d5e0513326c5b821248f2d4d2af=
bf5c6f1339e511c0586"
> > +SRC_URI[sha256sum] =3D "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff4=
59307df3e225bcfbf40"
> >
> >  EXTRA_OECMAKE_class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
> >
> > --
> > 2.11.0
> >
>
>=20
>
