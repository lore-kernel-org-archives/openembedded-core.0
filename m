Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web08.1177.1614814591618053913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 15:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NBPHOYVn;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id d9so26496562ybq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 15:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6GnCAwu4weHEBy2NnYK4Ak64TYOCOdkMv4x8Fv9xYaY=;
        b=NBPHOYVn5q5CDCtmjfMmiiBZxqG/utt8GcmGIG5R+t/TprwFdlOBpG0GPd8qRIJYuW
         UBlpuu6KRhZ1/uyOI1RQ7bHltC3Rq1hm7TRPyFmXxcXvTw+H3m/ao8lctyJ+CvLz7JIT
         n4/XdKntxhYW7J1HEHo4cg+bSA4pxD9EowuwGQLUZ6rFCs7at1GPoTJP1jTNScjHS890
         rKo82qND4A8I9v+t1Gx0OxQikvLfH42F9vJd8Z3XaJE08Ubrj7N2w5nTzDN22G43Pm/C
         iAcRQ/GHrVYynPJRhPWjHwcousUlLDATZpexvC7sPVrCjqErJLgrnpfuC/kbhlll92Oo
         XiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6GnCAwu4weHEBy2NnYK4Ak64TYOCOdkMv4x8Fv9xYaY=;
        b=p6TeKebAJOyOnOxEDRyaqP8wmrjUngWOELRYMnlppEF+kbXFxxJML6d6F3tQeZVtdg
         43KtYZogiFKtFbMnWAXRfzK6E7rcc/5OrtyZmBVzofzk/Gg4efNfphjeTWb4iPMFtOeQ
         reiAVg8IWaSjiydciyFT6j7hhJMzHxNs9qo4uiJuVQg3B8Vp3hhQiIso43nYSDx1HF35
         YFMvHSscK0TdKTC8bPkAZ6j5k4i0EsYghOL1S5xr1YUW5+8dcrK3bV+RVUFV3NctkX6u
         lCHrEJzTl32cZlSnryttYQr7roSGiUZhACLs8SisMZ4tpzgb//DzdqMygFE7td9iY7rU
         /5dg==
X-Gm-Message-State: AOAM533CLhSqRsO5k+5lHYQ3bqA7JVpFHgxl6/MzDY9fA1knfdFjfzZb
	IJJMgSDV/Wn3QAT6kKYcG6qcSyEn1ug5GmspWdo=
X-Google-Smtp-Source: ABdhPJxgAoxJzE68MdWfucbReNUCzfGc1OxNWrMC/JZSqTIB5bCv5y+Trj0wiQo4IQ4eBaIHX8suKTI7doZu690hQfY=
X-Received: by 2002:a25:fc1d:: with SMTP id v29mr2637470ybd.472.1614814590742;
 Wed, 03 Mar 2021 15:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20210222214508.119351-1-anibal.limon@linaro.org>
 <YDSpCzlBJy8y99EJ@apalos.home> <CA+_Aqisi1h7Ytdr0qVOo6zxRdw0+N5iA1L4-CWKEZ-z_HpEzfQ@mail.gmail.com>
In-Reply-To: <CA+_Aqisi1h7Ytdr0qVOo6zxRdw0+N5iA1L4-CWKEZ-z_HpEzfQ@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 3 Mar 2021 13:36:19 -1000
Message-ID: <CAGDS+n=Yt28QK-gCPoUyiO32KiAJjkP_bvoU7um1exH6qPFKug@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] pseudo: Bump to rev 60e25a3
To: Anibal Limon <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2021 at 12:31 PM Anibal Limon <anibal.limon@linaro.org> wrot=
e:
>
> I'm still getting this error, I don't know if this patch will be applied=
.

No, not this particular patch, but if you look at the dunfell patches
I've posted for review you'll see that I have pseudo patches there
that address this issue.

So this should be fixed for you soon!

Steve

> On Tue, 23 Feb 2021 at 01:04, Ilias Apalodimas <ilias.apalodimas@linaro.=
org> wrote:
>>
>> On Mon, Feb 22, 2021 at 03:45:08PM -0600, An=C3=ADbal Lim=C3=B3n wrote:
>> > Changes,
>> >
>> > 60e25a3 (HEAD -> oe-core, origin/oe-core) makewrappers: Fix glibc 2.3=
3 fstatat usage issues
>> > 77d2898 ports/linux: Add wrapper for fstatat/fstatat64 in glibc 2.33
>> > d03de55 ports/rename/renameat: Avoid race when renaming files
>> > c838d8c ports/unix: Add faccessat and faccessat2
>> > 7720723 ports/access.c: Use EACCES, not EPERM
>> > f332f56 linux/portdefs.h: Fix pseudo to work with glibc 2.33
>> >
>> > Fixes,
>> >
>> > ...
>> > Exception: subprocess.CalledProcessError: Command 'tar -cf - -C /home=
/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linux/os-re=
lease/1.0-r0/image -p -S . | tar -xf - -C /home/builds/oe-rpb-dunfell/build=
-410c/tmp-rpb-glibc/work/all-linaro-linux/os-release/1.0-r0/package' return=
ed non-zero exit status 134.
>> >
>> > Subprocess output:
>> > abort()ing pseudo client by server request. See https://wiki.yoctopro=
ject.org/wiki/Pseudo_Abort for more details on this.
>> > Check logfile: /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/w=
ork/all-linaro-linux/os-release/1.0-r0/pseudo//pseudo.log
>> > Aborted
>> > ...
>> >
>> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>> > ---
>> >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipe=
s-devtools/pseudo/pseudo_git.bb
>> > index 0ba7b50355..17bd02c27c 100644
>> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> > @@ -6,7 +6,7 @@ SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=
=
=3Doe-core \
>> >             file://fallback-group \
>> >             "
>> >
>> > -SRCREV =3D "8317c0ab172db47dabcef909bae02cd77b1f1010"
>> > +SRCREV =3D "60e25a36558f1f07dcce1a044fe976b475bec42b"
>> >  S =3D "${WORKDIR}/git"
>> >  PV =3D "1.9.0+git${SRCPV}"
>> >
>> > --
>> > 2.30.1
>> >
>>
>> FWIW
>> Tested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>
>
>=20
>
