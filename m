Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.678.1614190452548810969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 10:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TPbq7Zz3;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.52, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f52.google.com with SMTP id c7so2790171wru.8
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 10:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lahUr2d6lFyUAygnAYErSLfy9JUm+1YcIjuHmO+sDpQ=;
        b=TPbq7Zz3bJsj8TNdf8Gbdvhy4W79lRKwGOKNouIoNa79p9FiWXE+kTdAGBmCWYXbTI
         XbbFyheL+EU74AV2Hxcgju3sJbeU9iDDT/CPE93FLBZZcn1Nc3pNKbJY+xT3k2gpXQ21
         XjgTi+7ImYBd023fobI+ql6dA2Z/ZOlCnI1SuNCummTPdefigdShlr5HsFa1vjrqSQUu
         Lt7IDo65XbP9EYsoiNBNwLGwcwLVdc5Ct1tb3COSZFcp1X7aFNHQTS4nJlfc7BxWlPZy
         BrmICCvWXuYkd083QkiqRMYYAzOSrb+BkuoGOypTg4KeA3mwZC91vPb8anRttDJwrQYg
         p0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lahUr2d6lFyUAygnAYErSLfy9JUm+1YcIjuHmO+sDpQ=;
        b=VYQ2DbT4pw0koIq7u/8baKCcxx6dJ0Rlx03R4xkZ7V/X1p84jRnJuNyvWCX1I+RejU
         WaxLaa6kKD28IVOURrULX9B3garxwKOog/KQyqZ7CfqAUJNmunFCfoZ7oLd6kvPBv43k
         ztC7NjC6S7dcXzWJ5yp4POv6e6MrjQNwbKr95TG8GK7u/umx4Zm2/O4c7w4SV+OoEEBc
         4hOZ/JiIqtRvyPO0EBmoHt0ZeDgrwQ1p8YkWa6xrkxVIe4DCsPvp3UWVJnco5mlW0WCi
         6K2LsxU6vW6Pk+7YQ/+7xW4HKB8JkhDdKLbr7dWPpAQRXEh1fOXWw7J8nRIW5CcsVhea
         MVfg==
X-Gm-Message-State: AOAM530QKRbPEwOSpRm5lH5zZeU+Il862cE/6y/oRB4LMtKXY4KtzHhb
	1xU0OOZhaQIogpoIHrR3HqDGKgHTnP/BVxlgfQpmwA==
X-Google-Smtp-Source: ABdhPJzGlkD13un8/CtGuDRhimLki0UI76jKWY2z42X22LHiv9EcHupyfEHmqSB7H0UOKWbhrXj7DBxOwSGrtf3pO0E=
X-Received: by 2002:a5d:47af:: with SMTP id 15mr32970283wrb.205.1614190450997;
 Wed, 24 Feb 2021 10:14:10 -0800 (PST)
MIME-Version: 1.0
References: <166535D1ACD90C64.29685@lists.openembedded.org>
 <CALF_Tx=HuN128b_jKfo_rCxYepLMQa-k1TGfV2b9hiXtf4W4tw@mail.gmail.com>
 <8dd288691c4ec3dc0843a365cd45fa50102d0e99.camel@intel.com>
 <1666730B1A5C43B4.22789@lists.openembedded.org> <CALF_Txn4rpdz8FUmsiM+9v0tAbH32WkwjE3i_Xjq5bF2D-yLNA@mail.gmail.com>
In-Reply-To: <CALF_Txn4rpdz8FUmsiM+9v0tAbH32WkwjE3i_Xjq5bF2D-yLNA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 24 Feb 2021 08:13:59 -1000
Message-ID: <CAOSpxda1rAGG0P3Dj86mLBemWDN2CUP9A6wE7HXKksXEvRb0QQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] wpebackend-fdo: Fix missing .so symlink when using dev package
To: Zbigniew Bodek <zbodek@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, 
	"andrei.gherzan@huawei.com" <andrei.gherzan@huawei.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"wojciech.zmuda@huawei.com" <wojciech.zmuda@huawei.com>, 
	"zbigniew.bodek@huawei.com" <zbigniew.bodek@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 5:36 AM Zbigniew Bodek <zbodek@gmail.com> wrote:
>
> So... does anyone have some comments or anything against integrating
> this change?

I'm currently testing this patch for dunfell.  If all goes well it
will be in the patch set I send for review in the near future.

Steve

> Kind regards
> Zbigniew
>
> wt., 23 lut 2021 o 19:13 Zbigniew Bodek via lists.openembedded.org
> <zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
> >
> > Hi Anuj,
> >
> > I just checked and yes, it's needed for gatesgarth too.
> >
> > Kind regards
> > Zbigniew
> >
> > wt., 23 lut 2021 o 16:33 Mittal, Anuj <anuj.mittal@intel.com> napisa=
=C5=82(a):
> > >
> > > Is this change needed for the version in gatesgarth too?
> > >
> > > Thanks,
> > >
> > > Anuj
> > >
> > > On Tue, 2021-02-23 at 13:24 +0100, Zbigniew Bodek wrote:
> > > > Any comments, questions, remarks to that?
> > > >
> > > > Kind regards
> > > > Zbigniew
> > > >
> > > > pt., 19 lut 2021 o 18:20 Zbigniew Bodek via lists.openembedded.org
> > > > <zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
> > > > >
> > > > > From: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > > > >
> > > > > Problem spotted on dunfell-23.0.4
> > > > >
> > > > > Normally, unversioned .so is removed from -dev (default) package
> > > > > however it is still being referred by other agents, such as
> > > > > webkitgtk.
> > > > > That can be observed while executing i.e. Epiphany Browser.
> > > > >
> > > > > For instance:
> > > > > platformInitializeWebProcess()
> > > > > calls
> > > > > wpe_loader_init("libWPEBackend-fdo-1.0.so")
> > > > >
> > > > > as a result one can see:
> > > > > --------------------
> > > > > wpe_loader_init could not load the library 'libWPEBackend-fdo-
> > > > > 1.0.so':
> > > > > libWPEBackend-fdo-1.0.so: cannot open shared object file:
> > > > > No such file or directory
> > > > > --------------------
> > > > >
> > > > > "master" branch contains a bumped-up version of webkitgtk
> > > > > to which this issue does not apply (the code has changed).
> > > > >
> > > > > Forcefully keep this .so symlink to resolve the problem in dunfe=
ll.
> > > > >
> > > > > Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > > > > ---
> > > > >  meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > index cd2f7fabda..165fc74dde 100644
> > > > > --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > @@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
> > > > >  SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz=
"
> > > > >  SRC_URI[sha256sum] =3D
> > > > > "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299=
d"
> > > > >
> > > > > +FILES_${PN} +=3D "${libdir}/libWPEBackend-fdo-1.0.so"
> > > > > +FILES_SOLIBSDEV =3D ""
> > > > > +INSANE_SKIP_${PN} +=3D "dev-so"
> > > > > --
> > > > > 2.17.1
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > >
> > >
> >
> >=20
> >
