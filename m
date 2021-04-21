Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.13775.1619018139820888479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 08:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JWByTRmk;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id d19so7403845qkk.12
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=me1mBTxgh28cx9fk+j3DdOioz0Q9M9JsxQDqgDSjjoc=;
        b=JWByTRmklKAEzoReoggiT+CxY+sBA862ivNLimWI4lfddNFZ7fUnZ8/eEnEA3krzI8
         +NwqXnZYvyLFpd3TdnSSGWJLdJjbm9E1yEr40k7bgXkuowP7z61j1Fgyi1VM2kgiScjO
         7oYlzfSDHnugKjQ0qP0sRNXajRIfXkkxbu+yHbtQmjoBqOWasZkZ3J9YyoKPgadUQ2gu
         76PTalOC8SDyTxZM7LcOpSEldZpPlCvBBkbASbu6wOu/HSBBLx6I1Mes7fHdT49gfSv4
         mhIWePJHkR4FNUl5B76cuVLWGRJPzrIh6807GeKBhO7wP2nGm25Mxew7iRE2MGDUGf3W
         vbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=me1mBTxgh28cx9fk+j3DdOioz0Q9M9JsxQDqgDSjjoc=;
        b=Ru5t1TukIx0Klyz4TP20nTLUZ3UsLo/6mncysU9pmz5h6FeqerEtDAjFJ4RV9oDKBC
         Hy1xYn8hxyJ0FSluoz123+8hl0A71ESuK02mJd1Cgeu1+vNMtY1XAe8DEeZpEeBbVNGD
         BvHcFBAESGkc1y1c00LoEVxrxTfm0RdYbLnij/rjUtYKT1b5bbpthkwd14Y51Ldb9DHs
         OyvG92UiO3g1gksGZwnozRoJYv4y+Kjl/MDB284VpkoFVIi613JHx9mjKssMJTKPRjY2
         ufGfteDeWGxO+NAX4WJLQQvMwXUiISudZOopIKM/879UK68HtqaA+BdgJDtmNhYtSvhg
         gS6Q==
X-Gm-Message-State: AOAM533KArBo+h/k3P+dqKMC3iTvSvxS6Ick3v4aSrWyerxULsqhT24z
	cal2He0Sephwa71e2Sw2N8i9XE4BIiaFaZMmkpc=
X-Google-Smtp-Source: ABdhPJwiPnFLNE3zMbX1GYe/GFHMBNaEQxNLKIc1zH4o/jUr2fEBUJLwzRmMV2BKTm0dApftNh8sPSdBTkiUG5xta2Y=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr23317691qkd.381.1619018138916;
 Wed, 21 Apr 2021 08:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqYpfoFeThNAJDyhH5KZgpbBS2TRj8CSmiiyK_edqBkJw@mail.gmail.com>
 <F23C2F80-7F48-4384-A946-34152D4FCBDD@gmail.com>
In-Reply-To: <F23C2F80-7F48-4384-A946-34152D4FCBDD@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Apr 2021 08:15:12 -0700
Message-ID: <CAMKF1sqjezOY80J0+z0UrTHxzZm=fo=QfJpY9otJU33ZLC9LEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy <armccurdy@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 7:43 AM Devendra Tewari
<devendra.tewari@gmail.com> wrote:
>
> I created an image for Raspberry Pi Zero W from code at https://github.c=
om/tewarid/docker-meta-raspberrypi/tree/sstate, using Docker for macOS, and=
 on Ubuntu 20.04-LTS, and wrote it out to an SDCard using bmaptool. Booted =
and checked that busybox symlinks in rootfs look all right.
>


I think its not this particular patch per se. But similar patch which
is in oe-core/master-next which is causing it
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D11657970ff8ff89d1a9760b1c75974ba5d149ddd


> Em 21 de abr. de 2021, =C3=A0(s) 02:22, Khem Raj <raj.khem@gmail.com> es=
creveu:
>
> =EF=BB=BFNone of my images are bootable when this patch is applied, beca=
use
> symlinks that busybox should provide arent created in the image. This
> patch should be looked into a bit further,  how was it tested ?
>
> On Mon, Apr 19, 2021 at 11:43 AM Devendra Tewari
> <devendra.tewari@gmail.com> wrote:
>
>
>
> On 30 Mar 2021, at 08:55, Devendra Tewari <devendra.tewari@gmail.com> wr=
ote:
>
>
> I understand that parallel tasks can result in such issues, but would ex=
pect some kind of dependency graph that would prevent them from happening. =
I wish I had more time to understand the issue fully.
>
> Here=E2=80=99s the last version of my patch that still uses os.rename, a=
nd on error uses shutil.move, with the reasoning explained in the commit me=
ssage. There are tons of os.rename in code elsewhere, and I=E2=80=99ve enco=
untered similar issues when doing incremental builds, but I=E2=80=99ll leav=
e fixing them to those with more time at hand. Cheers.
>
>
> Here=E2=80=99s a patch that catches error with all os.rename in the code=
, and retries with shutil.move when that happens.
>
>
>
> From aeba1f9728f69cdf2ce4ba285be86761d8024f9d Mon Sep 17 00:00:00 2001
> From: Devendra Tewari <devendra.tewari@gmail.com>
> Date: Tue, 30 Mar 2021 08:27:40 -0300
> Subject: [PATCH] Use shutil.move when os.rename fails
>
> Incremental build in Docker fails with
>
> OSError: [Errno 18] Invalid cross-device link
>
> When source and destination are on different overlay filesystems.
>
> This change handles error with os.rename and retries with shutil.move.
> The reason os.rename is still used is because shutil.move is too slow
> for speed sensitive sections of code.
> ---
> meta/classes/sstate.bbclass | 22 ++++++++++++++++++----
> 1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index f579168162..301dfc27db 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
> def sstate_installpkgdir(ss, d):
>   import oe.path
>   import subprocess
> +    import shutil
>
>   sstateinst =3D d.getVar("SSTATE_INSTDIR")
>   d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
> @@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):
>
>   for state in ss['dirs']:
>       prepdir(state[1])
> -        os.rename(sstateinst + state[0], state[1])
> +        try:
> +            os.rename(sstateinst + state[0], state[1])
> +        except OSError:
> +            shutil.move(sstateinst + state[0], state[1])
>   sstate_install(ss, d)
>
>   for plain in ss['plaindirs']:
> @@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
>       dest =3D plain
>       bb.utils.mkdirhier(src)
>       prepdir(dest)
> -        os.rename(src, dest)
> +        try:
> +            os.rename(src, dest)
> +        except OSError:
> +            shutil.move(src, dest)
>
>   return True
>
> @@ -638,6 +645,7 @@ python sstate_hardcode_path () {
>
> def sstate_package(ss, d):
>   import oe.path
> +    import shutil
>
>   tmpdir =3D d.getVar('TMPDIR')
>
> @@ -664,7 +672,10 @@ def sstate_package(ss, d):
>                   continue
>               bb.error("sstate found an absolute path symlink %s pointin=
g at %s. Please replace this with a relative link." % (srcpath, link))
>       bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], s=
statebuild + state[0]))
> -        os.rename(state[1], sstatebuild + state[0])
> +        try:
> +            os.rename(state[1], sstatebuild + state[0])
> +        except OSError:
> +            shutil.move(state[1], sstatebuild + state[0])
>
>   workdir =3D d.getVar('WORKDIR')
>   sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
> @@ -674,7 +685,10 @@ def sstate_package(ss, d):
>           pdir =3D plain.replace(sharedworkdir, sstatebuild)
>       bb.utils.mkdirhier(plain)
>       bb.utils.mkdirhier(pdir)
> -        os.rename(plain, pdir)
> +        try:
> +            os.rename(plain, pdir)
> +        except OSError:
> +            shutil.move(plain, pdir)
>
>   d.setVar('SSTATE_BUILDDIR', sstatebuild)
>   d.setVar('SSTATE_INSTDIR', sstatebuild)
> --
> 2.29.2
>
>
> On 30 Mar 2021, at 08:10, Richard Purdie <richard.purdie@linuxfoundation=
.org> wrote:
>
> On Mon, 2021-03-29 at 16:00 -0700, Andre McCurdy wrote:
>
> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
> <devendra.tewari@gmail.com> wrote:
>
>
> Thanks! My bad. The example I looked up in Python docs had a break and I=
 just realized it was a looping example.
>
> Here=E2=80=99s the updated patch (or should I submit it again via git se=
nd-email?)
>
>
> It would be better to use shutil.move unconditionally in all cases,
> rather than have a separate shutil.move code path which only gets
> tested by people doing incremental builds in docker.
>
>
> This is a speed sensitive section of code and shutil has traditionally p=
roved
> to be slow so I disagree with that, rename is very much preferred here w=
here
> we can.
>
> Cheers,
>
> Richard
>
>
>
>
>
>=20
>
