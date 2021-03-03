Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.316.1614810682060566253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 14:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X6x65AvN;
 spf=pass (domain: linaro.org, ip: 209.85.128.49, mailfrom: anibal.limon@linaro.org)
Received: by mail-wm1-f49.google.com with SMTP id i9so6415380wml.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 14:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1s3Q1uapz8UzMbGxhNDW8/fDD3unU8eIebx1sG4gu94=;
        b=X6x65AvNBbG5dD93YQv/VNy+pGoT3z4H2CcSMak4hRafFcsT70uwjZcdMOM+YisoO7
         brtLmZmzaKBRSkqrgE6j9pZBySzq5OFOHoNdfEARfDW5fbshfvsv330S3ncakA15Zhvs
         YbJUH5cOzQTzK7u5XpxNeeKqV7pOApcOd3kBj7HCHmyWtrYE3nqHvHDb+CTtUJjFKu/U
         /ryLe2cTAdtn6dhLEkhrdvREDIDrb8hdzYUL1t4c9umMaIHCC6KApdYxQuKfLJ+0RSXA
         ml+DW+vVzKYPxZwX3bcIcmLdKuTWAlWim3tO1fidktIqbVOth2ztifNx2jMqurXruDMZ
         1EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1s3Q1uapz8UzMbGxhNDW8/fDD3unU8eIebx1sG4gu94=;
        b=fm0ItOKsNNN9Rm3YAlgK6izI2B7Nsz2Ek08WfBEt8CfzbUdZDRlx4ncevxUoQWC47u
         VEQ4J/G4JdTOkXAAWy5eC6cUUlQnKHv8lhWx/k7HTxlxf6eTcMAfjK+cl1C4dlFHj6NZ
         sh9GIIo3R/2tCbnt3TDnGrHcFRKNgwpmKPJtLcZzvvEzD+VfQzXBMdFK+NzZz74+46x+
         daqaZsHp5arQS+33H65PYwfkGhqP2B4vPe5iVyGZedIRrC2U8h0JbCy4AXT/PKE1HmGG
         VEA5sJEauoat3AXjjg0ij5edyBCIObIfkxhE9RGJt4j6P+UbYPDA+KIEwdH/OX7fgKBz
         H7bQ==
X-Gm-Message-State: AOAM531iun1rZi/JSL3KypBUHjE6PHRZU0pian51LB0er2WjPw872W7r
	EwxQiN+/i1YQJeyLnV6H4SiBfewGu493ntydP7GRCR5MWxM=
X-Google-Smtp-Source: ABdhPJwv4BZrUpkdyP8ljNmVSCcUZeN5XsUalK7OjPWdv3NHt53uJ58tzAKwQrmAolDoG7tYozEKoyM+KWR9cqE4vPw=
X-Received: by 2002:a1c:6745:: with SMTP id b66mr973120wmc.114.1614810680455;
 Wed, 03 Mar 2021 14:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20210222214508.119351-1-anibal.limon@linaro.org> <YDSpCzlBJy8y99EJ@apalos.home>
In-Reply-To: <YDSpCzlBJy8y99EJ@apalos.home>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Wed, 3 Mar 2021 16:31:09 -0600
Message-ID: <CA+_Aqisi1h7Ytdr0qVOo6zxRdw0+N5iA1L4-CWKEZ-z_HpEzfQ@mail.gmail.com>
Subject: Re: [dunfell][PATCH] pseudo: Bump to rev 60e25a3
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000fd0a8405bca96832"

--000000000000fd0a8405bca96832
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm still getting this error, I don't know if this patch will be applied.

Regards,
Anibal

On Tue, 23 Feb 2021 at 01:04, Ilias Apalodimas <ilias.apalodimas@linaro.org=
>
wrote:

> On Mon, Feb 22, 2021 at 03:45:08PM -0600, An=C3=ADbal Lim=C3=B3n wrote:
> > Changes,
> >
> > 60e25a3 (HEAD -> oe-core, origin/oe-core) makewrappers: Fix glibc 2.33
> fstatat usage issues
> > 77d2898 ports/linux: Add wrapper for fstatat/fstatat64 in glibc 2.33
> > d03de55 ports/rename/renameat: Avoid race when renaming files
> > c838d8c ports/unix: Add faccessat and faccessat2
> > 7720723 ports/access.c: Use EACCES, not EPERM
> > f332f56 linux/portdefs.h: Fix pseudo to work with glibc 2.33
> >
> > Fixes,
> >
> > ...
> > Exception: subprocess.CalledProcessError: Command 'tar -cf - -C
> /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linu=
x/os-release/1.0-r0/image
> -p -S . | tar -xf - -C
> /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linu=
x/os-release/1.0-r0/package'
> returned non-zero exit status 134.
> >
> > Subprocess output:
> > abort()ing pseudo client by server request. See
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> > Check logfile:
> /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linu=
x/os-release/1.0-r0/pseudo//pseudo.log
> > Aborted
> > ...
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
> >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
> b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > index 0ba7b50355..17bd02c27c 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > @@ -6,7 +6,7 @@ SRC_URI =3D "git://
> git.yoctoproject.org/pseudo;branch=3Doe-core \
> >             file://fallback-group \
> >             "
> >
> > -SRCREV =3D "8317c0ab172db47dabcef909bae02cd77b1f1010"
> > +SRCREV =3D "60e25a36558f1f07dcce1a044fe976b475bec42b"
> >  S =3D "${WORKDIR}/git"
> >  PV =3D "1.9.0+git${SRCPV}"
> >
> > --
> > 2.30.1
> >
>
> FWIW
> Tested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>

--000000000000fd0a8405bca96832
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I&#39;m still getting this error, I don&#=
39;t know if this patch will be applied.<div><br></div><div>Regards,</div><=
div>Anibal</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 23 Feb 2021 at 01:04, Ilias Apalodimas &lt;<a href=
=3D"mailto:ilias.apalodimas@linaro.org">ilias.apalodimas@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
Feb 22, 2021 at 03:45:08PM -0600, An=C3=ADbal Lim=C3=B3n wrote:<br>
&gt; Changes,<br>
&gt; <br>
&gt; 60e25a3 (HEAD -&gt; oe-core, origin/oe-core) makewrappers: Fix glibc 2=
.33 fstatat usage issues<br>
&gt; 77d2898 ports/linux: Add wrapper for fstatat/fstatat64 in glibc 2.33<b=
r>
&gt; d03de55 ports/rename/renameat: Avoid race when renaming files<br>
&gt; c838d8c ports/unix: Add faccessat and faccessat2<br>
&gt; 7720723 ports/access.c: Use EACCES, not EPERM<br>
&gt; f332f56 linux/portdefs.h: Fix pseudo to work with glibc 2.33<br>
&gt; <br>
&gt; Fixes,<br>
&gt; <br>
&gt; ...<br>
&gt; Exception: subprocess.CalledProcessError: Command &#39;tar -cf - -C /h=
ome/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linux/os=
-release/1.0-r0/image -p -S . | tar -xf - -C /home/builds/oe-rpb-dunfell/bu=
ild-410c/tmp-rpb-glibc/work/all-linaro-linux/os-release/1.0-r0/package&#39;=
 returned non-zero exit status 134.<br>
&gt; <br>
&gt; Subprocess output:<br>
&gt; abort()ing pseudo client by server request. See <a href=3D"https://wik=
i.yoctoproject.org/wiki/Pseudo_Abort" rel=3D"noreferrer" target=3D"_blank">=
https://wiki.yoctoproject.org/wiki/Pseudo_Abort</a> for more details on thi=
s.<br>
&gt; Check logfile: /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/wo=
rk/all-linaro-linux/os-release/1.0-r0/pseudo//pseudo.log<br>
&gt; Aborted<br>
&gt; ...<br>
&gt; <br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.lim=
on@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" re=
l=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git=
.bb" rel=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a> b/meta/recipes-=
devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"noreferrer" target=
=3D"_blank">pseudo_git.bb</a><br>
&gt; index 0ba7b50355..17bd02c27c 100644<br>
&gt; --- a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" re=
l=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" re=
l=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctopro=
ject.org/pseudo;branch=3Doe-core" rel=3D"noreferrer" target=3D"_blank">git.=
yoctoproject.org/pseudo;branch=3Doe-core</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fallback-group \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;8317c0ab172db47dabcef909bae02cd77b1f1010&quot;<br>
&gt; +SRCREV =3D &quot;60e25a36558f1f07dcce1a044fe976b475bec42b&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 PV =3D &quot;1.9.0+git${SRCPV}&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.30.1<br>
&gt; <br>
<br>
FWIW<br>
Tested-by: Ilias Apalodimas &lt;<a href=3D"mailto:ilias.apalodimas@linaro.o=
rg" target=3D"_blank">ilias.apalodimas@linaro.org</a>&gt;<br>
</blockquote></div></div>

--000000000000fd0a8405bca96832--
